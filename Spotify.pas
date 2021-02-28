{
  Spotify Unit for Snotify
  Author: vhanla
  License : MIT

  TODO: This unit will find spotify window handle, volume status, menues statuses, getcoverart
  music status, send commands like next, prev, pause

  ChangeLog:

  2020-05-05:
  - Fixed method to detect Spotify window, since it might be confused by others like Edge's Chromium instances
  2018-08-04:
  - Fixed _handle of Spotify window, using FindWindowProcessId
    this will locate the window of the parent spotify.exe processId
    affecting GetSongInfo which uses Windows' Title
    TODO: test if finding spotify.exe always return main window as parent,
    since it was stopped on first coincidence, maybe it needs list of all
    children processes.

}

unit Spotify;

interface

uses Registry, Windows, Sysutils, Classes, ShellApi, System.IOUtils, MsXML, ShlObj, Activex, ComObj, TlHelp32, DWMApi;

type
  TSpotify = class(TComponent)
  private
    exePath: String;
    uwpPath: String;
    _isRunning: boolean;
    _song, _artist, _album: String;
    _handle: HWND;
    _processID: Cardinal;
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

  wndData = record
    processID: ULONG;
    handle: HWND;
  end;

implementation

function isMainWindow(handle: THandle): Boolean;
var
  fhandle: HWND;
begin
  fhandle := GetWindow(handle, GW_OWNER);
  if (fhandle = 0) then //and (IsWindowVisible(handle)) then
    Result := True
  else
    Result := False;
end;

function enumWindowCallback(handle: THandle; aParam: LPARAM): BOOL; stdcall;
var
  procId: Cardinal;
  data: ^wndData;
begin
  GetWindowThreadProcessId(handle, procId);
  data := pointer(aParam);
  if (data.processID <> procId) or (not isMainWindow(handle)) then
  begin
    Result := True;
  end
  else
  begin
    data.handle := handle;
    Result := False;
  end;
end;

function FindWindowFromProcessID(const AProcessID: Cardinal): HWND;
var
 data: wndData;
begin
  data.processID := AProcessID;
  data.handle := 0;
  EnumWindows(@enumWindowCallback, LParam(@data));
  Result := data.handle;
end;

function ProcessExists(exename: String; var AProcessId: Cardinal): Boolean;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);
  Result := False;
  while Integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =
    UpperCase(exename)) or (UpperCase(FProcessEntry32.szExeFile) =
    UpperCase(exename))) then
    begin
      AProcessId := FProcessEntry32.th32ProcessID;
      Result := True;
      // let's stop on the first process, hopefully the parent thread
      Break;
    end;

    ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;

{ SpotifyApp }

constructor TSpotify.Create;
begin
  FindUWPLauncher;
  FindExecutable;
end;

function TSpotify.FindSpotifyWnd: Boolean;
const
  DWMWA_CLOAKED = 14; // Windows 8 or superior only
  DWM_NOT_CLOAKED = 0; // i.e. Visible for real
  DWM_CLOAKED_APP = 1;
  DWM_CLOAKED_SHELL = 2;
  DWM_CLOAKED_INHERITED = 4;
  DWM_NORMAL_APP_NOT_CLOAKED = 8; // invented number, might have issues on newest versions of window 10 2020 or earlier not tested
type
  TQueryFullProcessImageName = function(hProcess: THandle; dwFlags: DWORD; lpExeName: PChar; nSize: PDWORD): BOOL; stdcall;
var
  LHDesktop: HWND;
  LHWindow: HWND;
  LHParent: HWND;
  LExStyle: DWORD;
  AppClassName: array[0..255] of Char;
  Cloaked: Cardinal;
  titlelen: Integer;
  title: String;
  PID: DWORD;
  hProcess: THandle;
  fLen: Byte;
  WinFileName: String;
  FileName: array[0..MAX_PATH -1] of Char;
  QueryFullProcessImageName: TQueryFullProcessImageName;
  nSize: Cardinal;

begin
  _isRunning := False;

  { deprecated since it is not 100% certain
  _handle := FindWindow('SpotifyMainWindow',nil);
  if _handle > 0 then
    _isRunning := True
  else
  begin
  // with new update borderless SpotifyMainWindow is gone but Chrome_WidgetWin_0 is used instead
    _handle := FindWindow('Chrome_WidgetWin_0', nil);
    if _handle > 0 then
    begin
      // since this class name is given to any app using chromium library based it is
      // better to find out if the process executable is running instead
      if ProcessExists('Spotify.exe', _processID) then
      begin
        _isRunning := True;
        _handle := FindWindowFromProcessId(_processID);
      end;
    end;
  end;}
  LHDesktop := GetDesktopWindow;
  LHWindow := GetWindow(LHDesktop, GW_CHILD);
  while LHWindow <> 0 do
  begin
    GetClassName(LHWindow, AppClassName, 255);
    LHParent := GetWindowLong(LHWindow, GWL_HWNDPARENT);
    LExStyle := GetWindowLong(LHWindow, GWL_EXSTYLE);

    // for UWP apps
    if AppClassName = 'ApplicationFrameWindow' then
      DwmGetWindowAttribute(LHWindow, DWMWA_CLOAKED, @Cloaked, SizeOf(Cardinal))
    else
      Cloaked := DWM_NORMAL_APP_NOT_CLOAKED;

    // lest ignore if window is visible or not, since it might be hidden in trayicon
    if (AppClassName <> 'Windows.UI.Core.CoreWindow')
    // consider cloaked mode too, since it might be running in another virtual desktop
    and ( (Cloaked = DWM_NOT_CLOAKED) or (Cloaked = DWM_NORMAL_APP_NOT_CLOAKED) or (Cloaked = DWM_CLOAKED_APP) )
    and ((LHParent = 0) or (LHParent = LHDesktop))
    and ((LExStyle and WS_EX_TOOLWINDOW = 0) or (LExStyle and WS_EX_APPWINDOW <> 0))
    then
    begin
      titlelen := GetWindowTextLength(LHWindow);
      if titlelen > 0 then
      begin
        SetLength(title, titlelen);
        GetWindowText(LHWindow, PChar(title), titlelen + 1);

        GetWindowThreadProcessId(LHWindow, PID);
        hProcess := OpenProcess(PROCESS_ALL_ACCESS, False, PID);
        if hProcess <> 0 then
        try
          SetLength(WinFileName, MAX_PATH);
          nSize := MAX_PATH;
          ZeroMemory(@FileName, MAX_PATH);
          @QueryFullProcessImageName := GetProcAddress(GetModuleHandle(kernel32), 'QueryFullProcessImageNameW');
          if Assigned(QueryFullProcessImageName) then
          begin
            if QueryFullProcessImageName(hProcess, 0, FileName, @nSize) then
            begin
              SetString(WinFileName, PChar(@FileName[0]), nSize);
              if LowerCase(ExtractFileName(WinFileName)) = 'spotify.exe' then
              begin
                _isRunning := True;
                _handle := LHWindow;
                Result := _isRunning;
                // there is no need to search again
                Exit;
              end;
            end;

          end;

        finally
          CloseHandle(hProcess);
        end;

      end;

    end;


    LHWindow := GetWindow(LHWindow, GW_HWNDNEXT);
  end;


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
