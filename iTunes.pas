{
  iTunes Unit for Snotify
  Author: vhanla
  License : MIT

  This unit main purpose is to get song's details from iTunes public API.

  ChangeLog:

  2021-02-28:
  - Initial state, created an object to deal with getting info about the song
    played using artist and song names, as well getting cover art url to download
    asynchronously.

}

unit iTunes;

interface

uses Registry, Windows, Sysutils, Classes, ShellApi, System.IOUtils, MsXML, Controls,
ShlObj, Activex, ComObj, TlHelp32, DWMApi, Messages, System.Net.HttpClient, Types,
Graphics, JPEG;


const
  ITUNES_API_ENDPOINT = 'https://itunes.apple.com/search?term=%s&media=music&entity=song&limit=1';

type
  TiTunes = class(TCustomControl)
  private
    FLockedReq: Boolean;
    FValue: Byte;
    FClient: THTTPClient;
    FGlobalStart: Cardinal;
    FGlobalStep: Cardinal;
    FAsyncResult: IAsyncResult;
    FDownloaderStream: TStream;
    FDownloaderPic: TStream;
    FSize: Int64;
    FUrl: string;
    FUA: string;
    FHeader: string;
    FSavePath: string;

    FArtistID: Single;
    FTrack: string;
    FTrackCensored: string;
    FCollection: string;
    FArtistViewUrl: string;
    FArtist: string;
    FColCensored: string;
    FArt30: string;
    FArt60: string;
    FArt100: string;
    FPreviewUrl: string;
    FDiscNo: Integer;
    FPrice: Currency;
    FRelDate: TDateTime;
    FTrackDuration: Single;
    FTrackCount: Integer;
    FCountry: string;
    FTrackNumber: Integer;
    FCurrency: string;
    FStreamable: Boolean;
    FGenre: string;
    FStatus: string;
    FUpdated: Boolean;
    procedure SetValue(const Value: Byte);
    procedure SetStatus(const Value: string);

  protected
    procedure DoReceiveDataEvent(const Sender: TObject; AContentLength: Int64;
                    AReadCount: Int64; var Abort: Boolean);
    procedure DoEndDownload(const AsyncResult: IAsyncResult);
    procedure DoEndDownloadPicture(const AsyncResult: IAsyncResult);

  public

    FPicture: TJpegImage;

    constructor Create;
    destructor Destroy; override;

    procedure DoStartDownload;

    procedure QueryArtistBySong(AArtist: string; ASong: string);
    procedure DownloadPicture(AUrl: string);

    property Value: Byte read FValue write SetValue default 0;

    property URL: string read FUrl write FUrl nodefault;
    property Header: string read FHeader write FHeader nodefault;
    property UserAgent: string read FUA write FUA nodefault;
    property SavePath: string read FSavePath write FSavePath nodefault;
    property Status: string read FStatus write SetStatus nodefault;

    property ArtistID: Single read FArtistID write FArtistID;
    property ArtistName: string read FArtist write FArtist;
    property CollectionName: string read FCollection write FCollection;
    property TrackName: string read FTrack write FTrack;
    property CollectionCensoredName: string read FColCensored write FColCensored;
    property TrackCensoredName: string read FTrackCensored write FTrackCensored;
    property ArtistViewUrl: string read FArtistViewUrl write FArtistViewUrl;
    property PreviewUrl: string read FPreviewUrl write FPreviewUrl;
    property ArtworkUrl30: string read FArt30 write FArt30;
    property ArtworkUrl60: string read FArt60 write FArt60;
    property ArtworkUrl100: string read FArt100 write FArt100;
    property ReleaseDate: TDateTime read FRelDate write FRelDate;
    property Price: Currency read FPrice write FPrice;
    property DiscNumber: Integer read FDiscNo write FDiscNo;
    property TrackCount: Integer read FTrackCount write FTrackCount;
    property TrackNumber: Integer read FTrackNumber write FTrackNumber;
    property TrackTimeMillis: Single read FTrackDuration write FTrackDuration;
    property Country: string read FCountry write FCountry;
    property Currency: string read FCurrency write FCurrency;
    property PrimaryGenreName: string read FGenre write FGenre;
    property IsStreamable: Boolean read FStreamable write FStreamable;

    property Updated: Boolean read FUpdated write FUpdated;
  end;

implementation

uses
  functions, json, Neslib.Json, Neslib.Json.Path;
{ TiTunes }

constructor TiTunes.Create;
begin

  FClient := THTTPClient.Create;
  FClient.OnReceiveData := DoReceiveDataEvent;
  FLockedReq := False;

  FPicture := TJPEGImage.Create;
//  FPicture.SetSize(100, 100);

  FValue := 0;
end;

destructor TiTunes.Destroy;
begin
  FPicture.Free;

  FClient.Free;
  FDownloaderStream.Free;
  FDownloaderPic.Free;

  inherited;
end;

procedure TiTunes.DoEndDownload(const AsyncResult: IAsyncResult);
var
  LResponse: IHTTPResponse;
  LStr: TStrings;
  Doc: IJsonDocument;
  Match: TJsonValue;
begin
  try
    LResponse := THTTPClient.EndAsyncHTTP(AsyncResult);
    TThread.Synchronize(nil,
      procedure
      begin
        FLockedReq := False;
        if LResponse.StatusCode = 200 then
        begin
          // process response
          LStr := TStringList.Create;
          try
            FDownloaderStream.Position := 0;
            LStr.LoadFromStream(FDownloaderStream);

            Doc := TJsonDocument.Parse(LStr.Text);
            if (TJsonPath.MatchSingle(Doc, '$.results[0].artistName', Match)) then
              ArtistName := Match.ToString;
            if (TJsonPath.MatchSingle(Doc, '$.results[0].trackName', Match)) then
              TrackName := Match.ToString;
            if (TJsonPath.MatchSingle(Doc, '$.results[0].artworkUrl30', Match)) then
              ArtworkUrl30 := Match.ToString;
            if (TJsonPath.MatchSingle(Doc, '$.results[0].artworkUrl60', Match)) then
              ArtworkUrl60 := Match.ToString;
            if (TJsonPath.MatchSingle(Doc, '$.results[0].artworkUrl100', Match)) then
            begin
              ArtworkUrl100 := Match.ToString;
              // Let's download it
              DownloadPicture(ArtworkUrl100);
            end;
          finally
            LStr.Free;
          end;
        end
        else
        begin
          // some error has happened
          FLockedReq := False;
        end;
      end
    );
  finally
    LResponse := nil;
    FreeAndNil(FDownloaderStream);
  end;
end;

procedure TiTunes.DoEndDownloadPicture(const AsyncResult: IAsyncResult);
var
  LResponse: IHTTPResponse;
  LStr: TStrings;
  Doc: IJsonDocument;
  Match: TJsonValue;
  Pic: TJPEGImage;
begin
  try
    LResponse := THTTPClient.EndAsyncHTTP(AsyncResult);
    TThread.Synchronize(nil,
      procedure
      begin
        FUpdated := True;
        FLockedReq := False;
        if LResponse.StatusCode = 200 then
        begin
          // process response
          Pic := TJPEGImage.Create;
          try
            FDownloaderPic.Position := 0;
            Pic.LoadFromStream(FDownloaderPic);
            FPicture.Assign(Pic);
          finally
            Pic.Free;
          end;
        end
        else
        begin
          // some error has happened
          FLockedReq := False;
        end;
      end
    );
  finally
    LResponse := nil;
    FreeAndNil(FDownloaderPic);
  end;
end;

procedure TiTunes.DoReceiveDataEvent(const Sender: TObject; AContentLength,
  AReadCount: Int64; var Abort: Boolean);
var
  LTime: Cardinal;
  LSpeed: Integer;
begin
  LTime := TThread.GetTickCount - FGlobalStart;
  LSpeed := (AReadCount * 1000) div LTime;
  TThread.Queue(nil,
    procedure
    begin
      FValue := Round(100 / FSize * AReadCount);
      FStatus := Format('%d KB/s', [LSpeed div 1024]);
    end
  );

end;

procedure TiTunes.DoStartDownload;
var
  LResponse: IHTTPResponse;
begin
  try
    LResponse := FClient.Head(FUrl);
    FSize := LResponse.ContentLength;
    LResponse := nil;
    FValue := 0;
    FDownloaderStream := TFileStream.Create(FSavePath, fmCreate);
    FDownloaderStream.Position := 0;

    FGlobalStart := TThread.GetTickCount;

    FAsyncResult := FClient.BeginGet(DoEndDownload, FUrl, FDownloaderStream);
  finally
    FAsyncResult := nil;
  end;
end;

procedure TiTunes.DownloadPicture(AUrl: string);
var
  LResponse: IHTTPResponse;
begin
  try
    LResponse := FClient.Head(AUrl);
    FSize := LResponse.ContentLength;
    LResponse := nil;
    FValue := 0;
    if Assigned(FDownloaderPic) then
      FDownloaderPic.Free;
    FDownloaderPic := TMemoryStream.Create;
    FDownloaderPic.Position := 0;

    FGlobalStart := TThread.GetTickCount;

    if not FLockedReq then
    begin
      FLockedReq := True;
      FAsyncResult := FClient.BeginGet(DoEndDownloadPicture, AUrl, FDownloaderPic);
    end;
  finally
    FAsyncResult := nil;
  end;
end;

procedure TiTunes.QueryArtistBySong(AArtist, ASong: string);
var
  QueryStr: string;
  LResponse: IHTTPResponse;
begin
  QueryStr := Format(ITUNES_API_ENDPOINT, [AArtist+'+'+ASong]);
  try
    LResponse := FClient.Head(QueryStr);
    FSize := LResponse.ContentLength;
    LResponse := nil;
    FValue := 0;
    if Assigned(FDownloaderStream) then
      FDownloaderStream.Free;
    FDownloaderStream := TMemoryStream.Create;
    FDownloaderStream.Position := 0;

    FGlobalStart := TThread.GetTickCount;

    if not FLockedReq then
    begin
      FLockedReq := True;
      FUpdated := False;
      FAsyncResult := FClient.BeginGet(DoEndDownload, QueryStr, FDownloaderStream);
    end;
  finally
    FAsyncResult := nil;
  end;
end;

procedure TiTunes.SetStatus(const Value: string);
begin
  if Value <> FStatus then
    FStatus := Value;
end;

procedure TiTunes.SetValue(const Value: Byte);
begin
  if Value <> FValue then
    FValue := Value;
end;

end.