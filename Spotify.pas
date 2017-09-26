{
  Spotify Unit for Snotify
  Author: vhanla
  License : MIT

  TODO: This unit will find spotify window handle, volume status, menues statuses, getcoverart
  music status, send commands like next, prev, pause
}

unit Spotify;

interface

uses Registry, Windows, Sysutils, Classes, ShellApi, System.IOUtils, MsXML, ShlObj, Activex, ComObj;

type
  TSpotify = class(TComponent)
  private
    exePath: String;
    uwpPath: String;
    _isRunning: boolean;
    _song, _artist, _album: String;
    _handle: HWND;
    _isplaying:Boolean;
    _adsplaying:Boolean;
  public
    function FindExecutable: Boolean;
    function FindUWPLauncher: Boolean;
    function FindSpotifyWnd: Boolean;
    function GetCurrentSong: String;
    function GetCurrentArtist: String;
    function GetCurrentAlbum: String;
    function GetSongInfo: Boolean;
    procedure StartSpotify;
    constructor Create;
    property Song: string read GetCurrentSong;
    property Artist: String read GetCurrentArtist;
    property Album: String read GetCurrentAlbum;
    property IsRunning: Boolean read FindSpotifyWnd;
    property Handle: HWND read _handle;
    property IsPlaying: boolean read _isPlaying;
    property IsPlayingAds: boolean read _adsplaying;
  end;

implementation

{ SpotifyApp }

constructor TSpotify.Create;
begin
  FindUWPLauncher;
  FindExecutable;
end;

function TSpotify.FindSpotifyWnd: Boolean;
begin
  _isRunning := False;
  _handle := FindWindow('SpotifyMainWindow',nil);
  if _handle > 0 then
  _isRunning := True;
  Result := _isRunning;
end;

function TSpotify.FindUWPLauncher: Boolean;
  function IsWow64: boolean;
  type
    TIsWow64Process = function(hProcess: THandle; var bWow64Process: BOOL): BOOL; stdcall;
  var
    IsWow64Process: TIsWow64Process;
    bWow64Process: BOOL;
  begin
    Result := False;
    @IsWow64Process := GetProcAddress(GetModuleHandle('kernel32.dll'), 'IsWow64Process');
    if @IsWow64Process <> nil then
    begin
      IsWow64Process(GetCurrentProcess(), bWow64Process);
      Result := bWow64Process;
    end;
  end;
var
  Reg: TRegistry;
  Lista : TStringList;
  ProgramFiles: String;
  I: Integer;
  xmlstr: WideString;
  xml: IXMLDOMDocument2;
  nodes_row, nodes_se: IXMLDOMNodeList;
  J: Integer;
  node: IXMLDOMNode;
  name, vers, arqt: String;
  K: Integer;
  appId: String;
  appModelUserId: String;
begin
  Result := False;
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    Reg.OpenKeyReadOnly('Software\Classes\ActivatableClasses\Package');
    Lista := TStringList.Create;
    try
      Reg.GetKeyNames(Lista);
      //SpotifyAB.SpotifyMusic_1.57.332.0_x86__zpdnekdrzrea0
      for I := 0 to Lista.Count - 1 do
      begin
        if Pos('SpotifyAB.SpotifyMusic', Lista[I]) = 1 then
        begin
          if IsWow64 then
            ProgramFiles := GetEnvironmentVariable('PROGRAMW6432')
          else
            ProgramFiles := GetEnvironmentVariable('PROGRAMFILES');

          if FileExists(ProgramFiles + '\WindowsApps\' + Lista[I] + '\AppxManifest.xml') then
          begin
            xmlstr := TFile.ReadAllText(ProgramFiles + '\WindowsApps\' + Lista[I] + '\AppxManifest.xml');

            xml := CreateOleObject('Microsoft.XMLDOM') as IXMLDOMDocument2;
            xml.async := True;

            xml.loadXML(xmlstr);
            if xml.parseError.errorCode <> 0 then
              raise Exception.Create('XML Load Error: ' + xml.parseError.reason);

            nodes_row := xml.selectNodes('/Package');

            for J := 0 to nodes_row.length - 1 do
            begin
              node := nodes_row.item[J];
              name := node.selectSingleNode('Identity').attributes.getNamedItem('Name').text;
              vers := node.selectSingleNode('Identity').attributes.getNamedItem('Version').text;
              try
                arqt := node.selectSingleNode('Identity').attributes.getNamedItem('ProcessorArchitecture').text;
              except
                arqt := '';
              end;

              nodes_se := node.selectNodes('Applications');
              for K := 0 to nodes_se.length - 1 do
              begin
                node := nodes_se.item[K];
                appId := node.selectSingleNode('Application').attributes.getNamedItem('Id').text;

                appModelUserId := name + Copy(Lista[I], StrLen(PChar(name + '_' + vers + '_' + arqt+ '_')) + 1, StrLen(PChar(Lista[I]))-StrLen(PChar(name + '_' + vers + '_' + arqt + '_'))) + '!'+appId;
                if Trim(appModelUserId) <> '' then
                begin
                  uwpPath := Trim(appModelUserId);
                  Result := True;
                end;
              end;
            end;

          end;
        end;
      end;
    finally
      Lista.Free;
    end;
  finally
    Reg.Free;
  end;

end;

function TSpotify.FindExecutable: Boolean;
var
  Reg: TRegistry;
begin
  Result := False;
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKeyReadOnly('Software\Microsoft\Windows\CurrentVersion\Uninstall\Spotify') then
    begin

      ExePath := IncludeTrailingPathDelimiter(Reg.ReadString('InstallLocation')) + 'Spotify.exe';
      if FileExists(exePath) then
        Result := True;
    end;
  finally
    Reg.Free;
  end;
end;

function TSpotify.GetCurrentAlbum: String;
begin
  GetSongInfo;
  Result := _album;
end;

function TSpotify.GetCurrentArtist: String;
begin
  GetSongInfo;
  Result := _artist;
end;

function TSpotify.GetCurrentSong: String;
begin
  GetSongInfo;
  Result := _song;
end;

function TSpotify.GetSongInfo: Boolean;
var
  _length: Integer;
  _string: String;
  _stringlist: TStringList;
begin
  Result := False;
  if not IsRunning then Exit;

  _song := '';
  _artist := '';
  _album := '';

  _length := GetWindowTextLength(_handle);
  SetLength(_string, _length);
  GetWindowText(_handle, PChar(_string), Length(_string) + 1);
  _string := Trim(_string);
  if _string <> 'Spotify' then
  begin
    _isplaying := True;
    _stringlist := TStringList.Create;
    try
      _stringlist.Text := StringReplace(_string, '-', #13#10, [rfReplaceAll]);
      _adsplaying := False;
      if _stringlist.Count = 2 then
      begin
        _song := Trim(_stringlist[1]);
        _artist := Trim(_stringlist[0]);
        _album := '';
        Result := True;
      end
      else if _stringlist.Count >= 3 then
      begin
        _song := Trim(_stringlist[1]);
        _artist := Trim(_stringlist[0]);
        _album := Trim(_stringlist[2]);
        Result := True;
      end
      else
        _adsplaying :=True;

    finally
      _stringlist.Free;
    end;
  end
  else
    _isplaying := False;
end;

procedure TSpotify.StartSpotify;
begin
  if FileExists(exePath) then
    ShellExecute(GetDesktopWindow, 'OPEN', PChar(exePath),nil,nil,SW_NORMAL)
  else if Trim(uwpPath) <> '' then
  //  ShellExecute(0, 'OPEN', PChar('shell:AppsFolder\SpotifyAB.SpotifyMusic_zpdnekdrzrea0!Spotify'),nil,nil,SW_SHOWNORMAL);
    ShellExecute(0, 'OPEN', PChar('shell:AppsFolder\' + uwpPath),nil,nil,SW_NORMAL);
end;

end.
