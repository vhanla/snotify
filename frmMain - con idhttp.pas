unit frmMain;

interface

uses
  Winapi.Windows, System.SysUtils, Vcl.Forms, Vcl.StdCtrls, System.Classes, Vcl.Controls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Graphics, Spotify, Vcl.Dialogs,
  OtlEventMonitor, OtlTaskControl, OverbyteIcsHttpProt, OverbyteIcsWndControl,
  OverbyteIcsMultipartHttpDownloader, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL, OverbyteIcsWSocket, syncrossplatformjson;

type
  TMainForm = class(TForm)
    Button2: TButton;
    Memo1: TMemo;
    Image10: TImage;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    Button1: TButton;
    OmniEventMonitor1: TOmniEventMonitor;
    MultipartHttpDownloader1: TMultipartHttpDownloader;
    SslHttpCli1: TSslHttpCli;
    IdHTTP1: TIdHTTP;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    SslContext1: TSslContext;
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SslHttpCli1BeforeHeaderSend(Sender: TObject; const Method: string;
      Headers: TStrings);
    procedure SslHttpCli1RequestDone(Sender: TObject; RqType: THttpRequest;
      ErrCode: Word);
    procedure SslHttpCli1Cookie(Sender: TObject; const Data: string;
      var Accept: Boolean);
    procedure SslHttpCli1DocBegin(Sender: TObject);
    procedure SslHttpCli1DocEnd(Sender: TObject);
  private
    { Private declarations }
    SpotyClient : TSpotify;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses uWinRTNotifier;

procedure TMainForm.Button1Click(Sender: TObject);
var
  PostData : AnsiString;
begin
  Memo1.Lines.Clear;
  PostData := 'search?query=track%3A"Eagle"+artist%3Aabba&offset=0&type=track';
  //showmessage(  SpotyClient.GetCurrentSong);
//  Showmessage(IdHTTP1.Get('https://api.spotify.com/v1/search?query=track%3AEagle+artist%3Aabba&offset=0&type=track'));
//  ShowMessage(IdHTTP1.Version);
  SslHttpCli1.SocksServer := '';
  SslHttpCli1.SocksPort := '';
  SslHttpCli1.SocksLevel := '5';
  SslHttpCli1.URL := 'https://api.spotify.com/v1/search?query=track%3AEagle+artist%3Aabba&offset=0&type=track';
  //SslHttpCli1.URL := 'https://i.scdn.co/image/ed072730188f91b5d9cf222a57c27645eae25676';
  SslHttpCli1.AcceptLanguage := 'en, fr';
  SslHttpCli1.Connection := 'Keep-Alive';
  SslHttpCli1.RequestVer := '1.0'; // HTTP/1.0
  SslHttpCli1.ModifiedSince := 0;
  SslContext1.SslMinVersion := TSslVerMethod(0);
  SslContext1.SslMaxVersion := TSslVerMethod(5);
  SslContext1.SslCipherList := 'ALL:!ADH:RC4+RSA:+SSLv2:@STRENGTH';
  try
    SslContext1.InitContext;
  except
    on E:Exception do begin
      //
      Exit;
    end;
  end;
  if not SslContext1.IsCtxInitialized then Exit;
  Memo1.Lines.Add('Connecting to: ' + SslHttpCli1.URL);
  try
  SslHttpCli1.GetASync;
  except
    on E:Exception do begin
      Memo1.Lines.Add('Connection error! ' + E.ClassName + ' : ' + E.Message);
      Exit;
    end;

  end;
end;

procedure TMainForm.Button2Click(Sender: TObject);
begin
  ShowNotification( 0, LabeledEdit1.Text, LabeledEdit2.Text,
   LabeledEdit3.Text, LabeledEdit4.Text,
   TImage(Image10), Memo1.Lines);
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  SpotyClient := TSpotify.Create;
  IdHTTP1.Request.UserAgent :='Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36 OPR/40.0.2308.81';
  SslHttpCli1.Agent := 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36 OPR/40.0.2308.81';
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  SpotyClient.Free;
end;

procedure TMainForm.SslHttpCli1BeforeHeaderSend(Sender: TObject;
  const Method: string; Headers: TStrings);
var
  I: Integer;
begin
{  for I := 0 to Headers.Count - 1 do
  begin
    if Pos('Host:', Headers.Strings[I]) > 0 then
    begin
      Headers.Strings[I] := 'Host: api.spotify.com';
    end;
  end;}
end;

procedure TMainForm.SslHttpCli1Cookie(Sender: TObject; const Data: string;
  var Accept: Boolean);
begin
  Memo1.Lines.Add('Cookie: "'+Data+'"');
end;

procedure TMainForm.SslHttpCli1DocBegin(Sender: TObject);
var
  HttpCli: TSslHttpCli;
begin
  HttpCli := Sender as TSslHttpCli;
  Memo1.Lines.Add('Com: ' + HttpCli.ContentType);
  try
    HttpCli.RcvdStream := TFileStream.Create('demo.json', fmCreate);
  except
    on E:Exception do begin
      //
    end;

  end;
end;

procedure TMainForm.SslHttpCli1DocEnd(Sender: TObject);
var
  HttpCli: TSslHttpCli;
begin
  HttpCli := Sender as TSslHttpCli;
  if Assigned(HttpCli.RcvdStream) then
  begin
    HttpCli.RcvdStream.Free;
    HttpCli.RcvdStream := nil;
  end;

end;

procedure TMainForm.SslHttpCli1RequestDone(Sender: TObject;
  RqType: THttpRequest; ErrCode: Word);
var
  DataIn: TStream;
  Json: TJSONVariantData;
  tmpJson: TJSONVariantData;
  I: Integer;
  SmallCoverArt: string;
  CurSize,PrevSize: Integer;
begin
  DataIn := TFileStream.Create('demo.json', fmOpenRead);
  try
    Memo1.Lines.Add('Content/Type is: ' + SslHttpCli1.ContentType);

  finally
    DataIn.Free;
  end;
  Memo1.Lines.LoadFromFile('demo.json');
  Json.Init(Memo1.Text);
  Json.Init(Json.Data('tracks').Data('items').Values[0]);
  PrevSize := 100000;
  for I := 0 to Json.Data('album').Data('images').Count - 1 do
  begin
    tmpJson.Init(Json.Data('album').Data('images').Values[I]);
    CurSize := StrToInt(tmpJson.Values[tmpJson.NameIndex('width')]);
    if CurSize < PrevSize then
    begin

    end;
  end;


end;

end.

