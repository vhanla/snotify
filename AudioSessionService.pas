{
Author: vhanla License MIT
}
unit AudioSessionService;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, ShellApi, CommCtrl, StrUtils, PngImage,
  MMDeviceApi, ActiveX, VarUtils, PropSysHlp, ShlObj;

const
  Class_PolicyConfigClient: TGUID = '{870AF99C-171D-4F9E-AF0D-E63DF40C2BC9}';
  IID_IPolicyConfig_TH1: TGUID = '{CA286FC3-91FD-42C3-8E9B-CAAFA66242E3}';
  IID_IPolicyConfig_TH2: TGUID = '{6BE54BE8-A068-4875-A49D-0C2966473B11}';
  IID_IPolicyConfig_RS1: TGUID = '{F8679F50-850A-41CF-9C72-430F290290C8}';

  FOLDERID_AppsFolder: TGUID = '{1e87508d-89c2-42f0-8a7e-645a0f50ca58}';
  IID_IAudioSessionManager2 : TGUID = '{77AA99A0-1BD6-484F-8BC7-2C654C9A9B6F}';  // >= Windows 7

  ERROR_INVALID_STATE = 5023;
  ERROR_NOT_FOUND = 1168;

  PROCESS_QUERY_LIMITED_INFORMATION = $1000;

  PKEY_ItemNameDisplay: TPropertyKey =(
        fmtid: (D1:$B725F130; D2:$47EF ; D3:$101A;
                D4: ($A5, $F1, $02, $60, $8C, $9E, $EB, $AC));
                pid:10);
  PKEY_AppUserModel_Background: TPropertyKey =(
        fmtid: (D1:$86D40B4D; D2:$9069 ; D3:$443C;
                D4: ($81, $9A, $2A, $54, $09, $0D, $CC, $EC));
                pid:4);
//  PKEY_AppUserModel_Background: TPropertyKey =(fmtid: (D1:$; D2:$ ; D3:$;D4: ($, $, $, $, $, $, $, $));pid:);
  PKEY_AppUserModel_PackageInstallPath: TPropertyKey =(
        fmtid: (D1:$9F4C2855; D2:$9F79 ; D3:$4B39;
                D4: ($A8, $D0, $E1, $D4, $2D, $E1, $D5, $F3));
                pid:15);
  PKEY_AppUserModel_PackageFullName: TPropertyKey =(
        fmtid: (D1:$9F4C2855; D2:$9F79 ; D3:$4B39;
                D4: ($A8, $D0, $E1, $D4, $2D, $E1, $D5, $F3));
                pid:21);

  PKEY_AppUserModel_Icon: TPropertyKey =(
        fmtid: (D1:$86D40B4D; D2:$9069 ; D3:$443C;
                D4: ($81, $9A, $2A, $54, $09, $0D, $CC, $EC));
                pid:2);
  //class DECLSPEC_UUID("DBCE7E40-7345-439D-B12C-114A11819A09") MrtResourceManager;
  Class_MrtResourceManager: TGUID = '{DBCE7E40-7345-439D-B12C-114A11819A09}';
  IID_IMrtResourceManager: TGUID = '{130A2F65-2BE7-4309-9A58-A9052FF2B61C}';
  IID_IResourceMap: TGUID = '{6E21E72B-B9B0-42AE-A686-983CF784EDCD}';

  // Package Constants
  PACKAGE_FILTER_ALL_LOADED = $00000000;
  PACKAGE_FILTER_DIRECT     = $00000020;
  PACKAGE_FILTER_HEAD       = $00000010;
  PACKAGE_INFORMATION_BASIC = $00000000;
  PACKAGE_INFORMATION_FULL  = $00000100;
  PACKAGE_PROPERTY_FRAMEWORK= $00000001;
  PACKAGE_MIN_DEPENDENCIES  = 0;
  PACKAGE_MAX_DEPENDENCIES  = 128;
  PACKAGE_FAMILY_MIN_RESOURCE_PACKAGES = 0;
  PACKAGE_FAMILY_MAX_RESOURCE_PACKAGES = 512;
  PACKAGE_GRAPH_MIN_SIZE    = 1;
  PACKAGE_GRAPH_MAX_SIZE    = 1 + PACKAGE_MAX_DEPENDENCIES + PACKAGE_FAMILY_MAX_RESOURCE_PACKAGES;
  PACKAGE_APPLICATIONS_MIN_COUNT = 0;
  PACKAGE_APPLICATIONS_MAX_COUNT = 100;
  PACKAGE_RELATIVE_APPLICATION_ID_MIN_LENGTH = (1 + 1);
  PACKAGE_RELATIVE_APPLICATION_ID_MAX_LENGTH = (64 + 1);
  //https://msdn.microsoft.com/es-es/library/hh446765(v=vs.85).aspx
  PACKAGE_FAMILY_NAME_MAX_LENGTH = 64;
  PACKAGE_FAMILY_NAME_MIN_LENGTH = 17;
type
  IPolicyConfig = interface(IUnknown)
  [IID_IPolicyConfig_RS1]
    function Unused1: HRESULT; stdcall;function Unused2: HRESULT; stdcall;
    function Unused3: HRESULT; stdcall;function Unused4: HRESULT; stdcall;
    function Unused5: HRESULT; stdcall;function Unused6: HRESULT; stdcall;
    function Unused7: HRESULT; stdcall;function Unused8: HRESULT; stdcall;
    function Unused9: HRESULT; stdcall;function Unused10: HRESULT; stdcall;
    function SetDefaultEndPoint (wszDeviceId: PWideChar; aERole: ERole): HRESULT; stdcall;
  end;

  IAudioSessionEnumerator = interface(IUnknown)
  ['{E2F5BB11-0570-40CA-ACDD-3AA01277DEE8}']
  function GetCount(out SessionCount: integer): HResult; stdcall;
  function GetSession(const SessionCount: integer; out Session: IAudioSessionControl): HResult; stdcall;
  end;

  //Interface IAudioSessionNotification
	IAudioSessionNotification = interface(IUnknown)
  ['{641DD20B-4D41-49CC-ABA3-174B9477BB08}']
    function OnSessionCreated(const NewSession: IAudioSessionControl): HResult; stdcall;
  end;

  //Interface IAudioVolumeDuckNotification >= Windows 7
	IAudioVolumeDuckNotification = interface(IUnknown)
	['{C3B284D4-6D39-4359-B3CF-B56DDB3BB39C}']
		function OnVolumeDuckNotification(const sessionID: LPCWSTR; const countCommunicationSessions: UINT32): HResult; stdcall;
		function OnVolumeUnduckNotification(const sessionID: LPCWSTR): HResult; stdcall;
	end;

  IAudioSessionManager2 = interface(IAudioSessionManager)
  ['{77AA99A0-1BD6-484F-8BC7-2C654C9A9B6F}']
  function GetSessionEnumerator(out SessionEnum: IAudioSessionEnumerator): HResult; stdcall;
  function RegisterSessionNotification(SessionNotification: IAudioSessionNotification): HResult; stdcall;
  function UnregisterSessionNotification(SessionNotification: IAudioSessionNotification): HResult; stdcall;
  function RegisterDuckNotification(const sessionID: LPCWSTR; const duckNotification: IAudioVolumeDuckNotification): HResult; stdcall;
  function UnregisterDuckNotification(const duckNotification: IAudioVolumeDuckNotification): HResult; stdcall;
  end;

  IMrtResourceManager = interface(IUnknown)
  ['{130A2F65-2BE7-4309-9A58-A9052FF2B61C}']
  function Initialize: HResult; stdcall;
  function InitializeForCurrentApplication: HRESULT; stdcall; // = 0
  //virtual __declspec(nothrow) HRESULT __stdcall InitializeForPackage(LPWSTR) = 0;
  function InitializeForPackage(PackageName: LPWSTR): HRESULT; stdcall; // = 0;
  function InitializeForFile: HResult; stdcall;
  //virtual __declspec(nothrow) HRESULT __stdcall GetMainResourceMap(GUID const &, void **) = 0;
  function GetMainResourceMap(mapa: PGUID; any: Pointer): HResult; stdcall;
  function GetResourceMap(riid: PGUID; ppvObject: Pointer): HRESULT; stdcall;
  function GetDefaultContext(riid: PGUID; ppvObject: Pointer): HRESULT; stdcall;
  function GetReference(riid: PGUID; ppvObject: Pointer): HRESULT; stdcall;
  function IsResourceReference(var IsReference: BOOL): HRESULT; stdcall;
  end;

  IResourceMap = interface(IUnknown)
  ['{6E21E72B-B9B0-42AE-A686-983CF784EDCD}']
  function GetUri: HRESULT; stdcall;
  function GetSubtree: HRESULT; stdcall;
  function GetString: HRESULT; stdcall;
  function GetStringForContext: HRESULT; stdcall;
  //virtual __declspec(nothrow) HRESULT __stdcall GetFilePath(LPWSTR, LPWSTR*) = 0;
  function GetFilePath(const Key: PWideChar; var Value: PWideChar): HRESULT; stdcall;
  end;


  PAudioSession = ^TAudioSession;
  TAudioSession = record
    DisplayName: PWideChar;
    IconPath: PWideChar;
    GroupingId: TGUID;
    SessionId: LongWord; // unsigned long
    ProcessId: LongWord;
    BackgroundColor: LongWord;
    Volume: Single;
    IsDesktopApp: Boolean;
    IsMuted: Boolean;
    PeekValue: Single;
  end;

  PListSessions = ^TListSessions;
  TListSessions = class(TList)
  private
    function GetItem(Index: Integer): PAudioSession;
  public
    //destructor Destroy; override;
    //function Add(Value: PAudioSession): Integer;
    procedure Notify(Ptr: Pointer; Action: TListNotification); override;
    property Items[Index: Integer]: PAudioSession read GetItem; default;
  end;

  {PMapSession = ^TMapSession;
  PAudioSessionControl2 = ^IAudioSessionControl2;
  TMapSession = record
    sessionId: integer;
    audioSession: PAudioSessionControl2;
  end;}

  PMapSessions = ^TMapSessions;
  TMapSessions = class(TInterfaceList)
  private
    sessionId: ARRAY of LongWord;
    function Get(Index: Integer): IAudioSessionControl2;
    function GetSession(Index: Integer): Integer;
  public
    destructor Destroy; override;
    function Add(Value: IAudioSessionControl2): Integer; overload;
    function Add(sesionId: LongWord; Value: IAudioSessionControl2): Integer; overload;
    property Items[Index: Integer]: IAudioSessionControl2 read Get; default;
    property Sessions[Index: Integer]: Integer read GetSession;
  end;

type
  TAudioSessionService = class
  private
    //  __instance: TAudioSessionService;
    _sessions: TListSessions;
    _sessionMap: TMapSessions;
    //_sessionMap: IAudioSessionControl2; //std::map<int, CComPtr<IAudioSessionControl2>> _sessionMap;
    procedure CleanUpAudioSessions;
    function CreateEtAudioSessionFromAudioSession(sessionEnumerator: IAudioSessionEnumerator;
        sessionCount: Integer; var etAudioSession: PAudioSession): HRESULT;
//    function GetAppProperties(pszAppId: String; var ppszName: WideChar; var ppszIcon: WideChar; var background: ULONG): HRESULT;
    function GetAppProperties(pszAppId: String; var ppszName: PChar; var ppszIcon: PChar; var background: ULONG): HRESULT;
    function GetAppUserModelIdFromPid(pid: Cardinal; var applicationUserModelId: PWideChar): HRESULT;
    function EsImmersiveProcess(pid: Cardinal): HRESULT;
    function CanResolveAppByApplicationUserModelId(applicationUserModelId: PWideChar): Boolean;
  public
    function GetAudioSessionCount: Integer;
    function GetAudioSessions(var audioSessions: TListSessions): HRESULT;
    function RefreshAudioSessions: HRESULT;
    function SetAudioSessionVolume(sessionId: LongWord; volume: Single): HRESULT;
    function SetAudioSessionMute(sessionId: LongWord; isMuted: Boolean): HRESULT;

    Constructor Create;
    Destructor Destroy; override;
  end;

type
  PPACKAGE_INFO_REFERENCE = ^TPACKAGE_INFO_REFERENCE;
  TPACKAGE_INFO_REFERENCE = record
    var reserved: Pointer;
  end;

implementation

const
  {$IFDEF UNICODE}
    AWSuffix = 'W';
  {$ELSE}
    AWSuffix = 'A';
  {$IFEND}
type
{$IFDEF UNICODE}
  PTSTR = LPWSTR;
{$ELSE}
  PTSTR = LPSTR;
{$IFEND}

{$EXTERNALSYM SHStrDupA}
function SHStrDupA(psz: PAnsiChar; var pwsz: PWideChar): HResult; stdcall;
  external 'shlwapi.dll' name 'SHStrDupA';
{$EXTERNALSYM SHStrDupW}
function SHStrDupW(psz: PWideChar; var pwsz: PWideChar): HResult; stdcall;
  external 'shlwapi.dll' name 'SHStrDupW';
{$EXTERNALSYM SHStrDup}
function SHStrDup(psz: PTSTR; var pwsz: PTSTR): HResult; stdcall;
  external 'shlwapi.dll' name 'SHStrDup'+AWSuffix;
{$EXTERNALSYM PathFindFileNameA}
function PathFindFileNameA(pszPath: PAnsiChar): PAnsiChar; stdcall;
  external 'shlwapi.dll' name 'PathFindFileNameA';
{$EXTERNALSYM PathFindFileNameW}
function PathFindFileNameW(pszPath: PWideChar): PWideChar; stdcall;
  external 'shlwapi.dll' name 'PathFindFileNameW';
{$EXTERNALSYM PathFindFileName}
function PathFindFileName(pszPath: PTSTR): PTSTR; stdcall;
  external 'shlwapi.dll' name 'PathFindFileName'+AWSuffix;

{$EXTERNALSYM QueryFullProcessImageNameA}
function QueryFullProcessImageNameA(hProcess: THANDLE; dwFlags: DWORD; var lpExeName: PTSTR;
 var dwsize: DWORD): BOOL; stdcall; external 'KERNEL32.dll' name 'QueryFullProcessImageNameA';

{$EXTERNALSYM QueryFullProcessImageNameW}
function QueryFullProcessImageNameW(hProcess: THANDLE; dwFlags: DWORD; var lpExeName: PTSTR;
 var dwsize: DWORD): BOOL; stdcall; external 'KERNEL32.dll' name 'QueryFullProcessImageNameW';

{$EXTERNALSYM QueryFullProcessImageName}
function QueryFullProcessImageName(hProcess: THANDLE; dwFlags: DWORD;
  lpExeName: LPTSTR; dwsize: PDWORD): BOOL; stdcall;
  external 'KERNEL32.dll' name 'QueryFullProcessImageName'+AWSuffix;

// appmodel.h
function GetApplicationUserModelId(hProcess: THandle; applicationUserModelIdLength: PUINT;
    applicationUserModelId: PWideChar): LONG; stdcall;
  external 'KERNEL32.dll' name 'GetApplicationUserModelId';
function ParseApplicationUserModelId(applicationUserModelId: PWideChar;
            packageFamilyNameLength: PUINT;
            packageFamilyName: PWideChar;
            packageRelativeApplicationIdLength: PUINT;
            packageRelativeApplicationId: PWideChar): LONG; stdcall;
  external 'KERNEL32.dll' name 'ParseApplicationUserModelId';

function FindPackagesByPackageFamily(packageFamilyName: PWideChar;
          packageFilters: UINT32;
          count: PUINT;
          packageFullNames: PWideChar;
          bufferLength: PUINT;
          buffer: PWideChar;
          packageProperties: PInteger): LONG; stdcall;
  external 'KERNEL32.dll' name 'FindPackagesByPackageFamily';

function OpenPackageInfoByFullName(packageFullName: PWideChar;
          const reserved: UINT32;
          out packageInfoReference: PPACKAGE_INFO_REFERENCE): LONG; stdcall;
  external 'KERNEL32.dll' name 'OpenPackageInfoByFullName';

function GetPackageApplicationIds(packageInfoReference: PPACKAGE_INFO_REFERENCE;
        var bufferLength: UINT32;
        buffer: PByte;
        var count: UINT32): LONG; stdcall;
  external 'KERNEL32.dll' name 'GetPackageApplicationIds';
function IsImmersiveProcess(hProcess: THandle): BOOL; stdcall;
  external 'USER32.dll' name 'IsImmersiveProcess';
{ TListDevices }

{function TListSessions.Add(Value: PAudioSession): Integer;
begin
  Result := inherited Add(Value);
end;}

{destructor TListSessions.Destroy;
var
  I : Integer;
begin
  for I := 0 to Count - 1 do
  begin
    //StrDispose(Items[I].DisplayName);
    //StrDispose(Items[I].IconPath);
    CoTaskMemFree(Items[I].DisplayName);
    CoTaskMemFree(Items[I].IconPath);
    //Items[I].DisplayName := '';
    //Items[I].IconPath := '';
    FreeMem(Items[I]);
  end;

  inherited;
end;}

function TListSessions.GetItem(Index: Integer): PAudioSession;
begin
  Result := PAudioSession(inherited Get(Index));
end;

procedure TListSessions.Notify(Ptr: Pointer; Action: TListNotification);
var
  FAudioSession: PAudioSession;
begin
  inherited;

  if Action = lnAdded then
  begin
    GetMem(FAudioSession, SizeOf(TAudioSession));
    CopyMemory(FAudioSession, Ptr, SizeOf(TAudioSession));
    List[IndexOf(Ptr)] := FAudioSession;
  end
  else if Action = lnDeleted then
  begin
    FreeMem(Ptr, SizeOf(TAudioSession));
  end;


end;

{ TAudioSessionService }

function TAudioSessionService.CanResolveAppByApplicationUserModelId(
  applicationUserModelId: PWideChar): Boolean;
var
  HR : HRESULT;
  item: IShellItem2;
begin
  HR := SHCreateItemInKnownFolder(FOLDERID_AppsFolder, KF_FLAG_DONT_VERIFY, applicationUserModelId, IID_IShellItem2, item);
  Result := Succeeded(HR);
end;

procedure TAudioSessionService.CleanUpAudioSessions;
//var
//  I: Integer;
begin
//  for I := 0 to _sessions.Count - 1 do
//  begin
//    CoTaskMemFree(_sessions[I].DisplayName);
//    CoTaskMemFree(_sessions[I].IconPath);
//  end;
  _sessions.Clear;

//  for I := 0 to _sessionMap.Count - 1 do
//    CoTaskMemFree(_sessionMap[I].audioSession);
  _sessionMap.Clear;
end;

constructor TAudioSessionService.Create;
begin
  inherited;

  _sessions := TListSessions.Create;
  _sessionMap := TMapSessions.Create;
end;

function TAudioSessionService.CreateEtAudioSessionFromAudioSession(
  sessionEnumerator: IAudioSessionEnumerator; sessionCount: Integer;
  var etAudioSession: PAudioSession): HRESULT;

  //http://stackoverflow.com/questions/1005010/most-efficient-unicode-hash-function-for-delphi-2009
  function HashOf(const key: string): cardinal;
  var
    I: Integer;
  begin
    Result := 0;
    for I := 0 to Length(key) do
    begin
      Result := (Result shl 5) or (Result shr 27);
      Result := Result xor Cardinal(key[I]);
    end;
  end;

var
  audioSessionControl: IAudioSessionControl;
  audioSessionControl2: IAudioSessionControl2;
  audioMeterInformation: IAudioMeterInformation;
  pid: Cardinal;
  sessionIdString: PWideChar;
  stringHash: string;
  simpleAudioVolume: ISimpleAudioVolume;
  isMuted: LongBool;
  appUserModelId: PWideChar;
  isSystemSoundSession: Boolean;
  state: AudioSessionState;
  pszDllPath: PWideChar;
  _isWow64Process: LongBool;
  szPath: array[0..MAX_PATH] of WideChar;
  imagePath: array[0..MAX_PATH] of WideChar;
  hr: HRESULT;
  ph: NativeUInt;
  dwCch: DWORD;
  //pSessionMap: PMapSession;
  _displayName: PChar;
  _iconPath: PChar;
  _backgroundColor: Cardinal;
  nMask: DWORD;
  fPeakValue: Single;
begin
  hr := sessionEnumerator.GetSession(sessionCount, audioSessionControl);
  if Failed(hr) then begin Result := hr; Exit; end;

  hr := audioSessionControl.QueryInterface(IID_IAudioSessionControl2, audioSessionControl2);
  if Failed(hr) then begin Result := hr; Exit; end;

  hr := audioSessionControl2.GetProcessId(pid);
  if Failed(hr) then begin Result := hr; Exit; end;

//  GetMem(etaudioSession, SizeOf(TAudioSession));
  etAudioSession.ProcessId := pid;

  hr := audioSessionControl2.GetGroupingParam(@etAudioSession.GroupingId);
  if Failed(hr) then begin Result := hr; Exit; end;

  audioSessionControl2.GetSessionInstanceIdentifier(sessionIdString);

  etAudioSession.SessionId := HashOf(sessionIdString);

  //_sessionMap[etAudioSession->SessionId] = audioSessionControl2;
  //GetMem(pSessionMap, SizeOf(TMapSession));
  //pSessionMap.sessionId := etAudioSession.SessionId;
  //pSessionMap.audioSession := @audioSessionControl2;
  //_sessionMap.Add(pSessionMap);
  _sessionMap.Add(etAudioSession.SessionId,audioSessionControl2);

  hr := audioSessionControl.QueryInterface(IID_ISimpleAudioVolume, simpleAudioVolume);
  if Failed(hr) then begin Result := hr; Exit; end;
  hr := simpleAudioVolume.GetMasterVolume(etAudioSession.Volume);
  if Failed(hr) then begin Result := hr; Exit; end;

  hr := simpleAudioVolume.GetMute(isMuted);
  if Failed(hr) then begin Result := hr; Exit; end;
  etAudioSession.IsMuted := not not isMuted;

  // get audio peek
  hr := audioSessionControl.QueryInterface(IID_IAudioMeterInformation, audioMeterInformation);
  if hr = S_OK then
  begin
    if Succeeded(audioMeterInformation.QueryHardwareSupport(nMask)) then
    begin
      audioMeterInformation.GetPeakValue(fPeakValue);
      etAudioSession.PeekValue := fPeakValue;
    end;
  end;

  hr := EsImmersiveProcess(pid);
//  hr := S_FALSE;
//  if IsImmersiveProcess(pid) then
//  hr := S_OK;
  if hr = S_OK then
  begin
    hr := GetAppUserModelIdFromPid(pid, appUserModelId);
    if Failed(hr) then begin Result := hr; Exit; end;

//    hr := GetAppProperties(PChar(appUserModelId), etAudioSession.DisplayName^, etAudioSession.IconPath^, etAudioSession.BackgroundColor);
    hr := GetAppProperties(PChar(appUserModelId), _displayName, _iconPath, _backgroundColor);
    if hr = S_OK then
    begin
      etAudioSession.DisplayName := _displayName;
      etAudioSession.IconPath := _iconPath;
      etAudioSession.BackgroundColor := _backgroundColor;
    end;

    if Failed(hr) then begin Result := hr; Exit; end;

    etAudioSession.IsDesktopApp := False;
/////////////////MOD PARA ENCONTRAR EL EXE EN LUGAR DEL NOMBRE :P
      ph := OpenProcess(PROCESS_QUERY_LIMITED_INFORMATION, FALSE, pid);
      //CloseHandle(ph);

      if ph = INVALID_HANDLE_VALUE then
        Result := HResultFromWin32(GetLastError);

      dwCch := SizeOf(imagePath);
      if not QueryFullProcessImageName(ph, 0, imagePath, @dwCch) then
      begin
        Result := S_FALSE;
        CloseHandle(ph);
        Exit;
      end;
      hr := SHStrDup(imagePath, etAudioSession.IconPath);
      if Failed(hr) then begin Result := hr; CloseHandle(ph); Exit; end;
      hr := SHStrDup(PathFindFileName(imagePath), etAudioSession.DisplayName);
      if Failed(hr) then begin Result := hr; CloseHandle(ph); Exit; end;
      CloseHandle(ph);
  end
  else if hr = S_FALSE then
  begin
    //isSystemSoundSession := Succeeded(audioSessionControl2.IsSystemSoundsSession);
    isSystemSoundSession := False;
    if audioSessionControl2.IsSystemSoundsSession = S_OK then
      isSystemSoundSession := True;

    hr := audioSessionControl2.GetState(state);
    if Failed(hr) then begin Result := hr; Exit; end;

    if not isSystemSoundSession and (state = AudioSessionState.AudioSessionStateExpired) then
    begin
      Result := HResultFromWin32(ERROR_INVALID_STATE);
      Exit;
    end;

    if isSystemSoundSession then
    begin

      if not(IsWow64Process(GetCurrentProcess, _isWow64Process)) or _isWow64Process then
        pszDllPath := '%windir%\sysnative\audiosrv.dll'
      else
        pszDllPath := '%windir%\system32\audiosrv.dll';

      if 0 = ExpandEnvironmentStrings(pszDllPath, szPath, SizeOf(szPath)) then
      begin
        Result := E_FAIL;
        Exit;
      end;

      hr := SHStrDup(pszDllPath, etAudioSession.IconPath);
      if Failed(hr) then begin Result := hr; Exit; end;
      hr := SHStrDup('System Sounds', etAudioSession.DisplayName);
      if Failed(hr) then begin Result := hr; Exit; end;
      Result := Result;
    end
    else
    begin
      ph := OpenProcess(PROCESS_QUERY_LIMITED_INFORMATION, FALSE, pid);
      //CloseHandle(ph);

      if ph = INVALID_HANDLE_VALUE then
        Result := HResultFromWin32(GetLastError);

      dwCch := SizeOf(imagePath);
      if not QueryFullProcessImageName(ph, 0, imagePath, @dwCch) then
      begin
        Result := S_FALSE;
        CloseHandle(ph);
        Exit;
      end;
      hr := SHStrDup(imagePath, etAudioSession.IconPath);
      if Failed(hr) then begin Result := hr; CloseHandle(ph); Exit; end;
      hr := SHStrDup(PathFindFileName(imagePath), etAudioSession.DisplayName);
      if Failed(hr) then begin Result := hr; CloseHandle(ph); Exit; end;
      CloseHandle(ph);
    end;

    etAudioSession.IsDesktopApp := True;
    etAudioSession.BackgroundColor := $00000000;
  end;

  Result := S_OK;

end;

destructor TAudioSessionService.Destroy;
begin
  FreeAndNil(_sessions);
  FreeAndNil(_sessionMap);
  inherited;
end;

function TAudioSessionService.GetAppProperties(pszAppId: String;
  var ppszName: PChar; var ppszIcon: PChar; var background: ULONG): HRESULT;
var
  item: IShellItem2;
  itemname: PWideChar;
  installPath: PWideChar;
  iconPath: PWideChar;
  fullPackagePath: PWideChar;
  mrtResMgr: IMrtResourceManager;
  resourceMap: IResourceMap;
  resolvedIconPath: PWideChar;
  hr: HRESULT;
begin
  ppszIcon := #0; //nil;
  ppszName := #0; //nil;
  background := 0;

  hr := SHCreateItemInKnownFolder(FOLDERID_AppsFolder, KF_FLAG_DONT_VERIFY, PChar(pszAppId), IID_IShellItem2, item);

  if hr = S_OK then
  begin
    item.GetString(PKEY_ItemNameDisplay, itemName);
    item.GetUInt32(PKEY_AppUserModel_Background, background);
    item.GetString(PKEY_AppUserModel_PackageInstallPath, installPath);
    item.GetString(PKEY_AppUserModel_Icon, iconPath);
    item.GetString(PKEY_AppUserModel_PackageFullName, fullPackagePath);

    hr := CoCreateInstance(Class_MrtResourceManager, nil, CLSCTX_INPROC, IID_IMrtResourceManager, mrtResMgr);
    if hr = S_OK then
    begin
      hr := mrtResMgr.InitializeForPackage(PChar(fullPackagePath));

      mrtResMgr.GetMainResourceMap(@IID_IResourceMap,@resourceMap);

      resourceMap.GetFilePath(iconPath, resolvedIconPath);

      //ppszIcon := Char(resolvedIconPath);
      SHStrDup(resolvedIconPath, ppszIcon);
      //ppszName := Char(itemName);
      SHStrDup(itemname, ppszName);
    end;
  end;
  Result := hr;
end;

function TAudioSessionService.GetAppUserModelIdFromPid(pid: Cardinal;
  var applicationUserModelId: PWideChar): HRESULT;
var
  ph: NativeUint;
  appUserModelIdLength: Cardinal; //FixedUInt; // unsigned int
  returnCode: HRESULT;//LongInt; // long
//  aout: PWideChar;
  appUserModelId: PWideChar;//array of WideChar;
  _appUserModelId: PWideChar;
  packageFamilyName: PWideChar;//array [0..PACKAGE_FAMILY_NAME_MAX_LENGTH] of WideChar;
  _packageFamilyName: PWideChar;//array [0..PACKAGE_FAMILY_NAME_MAX_LENGTH] of WideChar;
  packageFamilyNameLength: UINT32;
  packageRelativeAppId: PWideChar;//array[0..PACKAGE_RELATIVE_APPLICATION_ID_MAX_LENGTH] of WideChar;
  _packageRelativeAppId: PWideChar;//array[0..PACKAGE_RELATIVE_APPLICATION_ID_MAX_LENGTH] of WideChar;
  packageRelativeAppIdLength: UINT32;
  packageCount: UINT32;
  packageNameBufferLength: UINT32;
  packageNames: array of PWideChar;
  buffer: PWideChar;
  rawpackageInfoRef: PPACKAGE_INFO_REFERENCE;
  packageIdsLength: UINT32;
  packageIdCount: UINT32;
  packageIdsRaw: array of BYTE;
  packageIds: array of PWideChar;
  I: Integer;
begin
  ph := OpenProcess(PROCESS_QUERY_LIMITED_INFORMATION, False, pid);

  //CloseHandle(ph);

  // the FAST_FAIL_HANDLE routine that I need to figure it out :-/
  appUserModelIdLength := 0;
  returnCode := GetApplicationUserModelId(ph, @appUserModelIdLength, nil);

  if returnCode <> ERROR_INSUFFICIENT_BUFFER then
  begin
    Result := HResultFromWin32(returnCode);
    CloseHandle(ph);
    Exit;
  end;

  //SetLength(appUserModelId, appUserModelIdLength);
//  GetMem(appUserModelId, appUserModelIdLength);
  appUserModelId := StrAlloc(appUserModelIdLength);
  returnCode := GetApplicationUserModelId(ph, @appUserModelIdLength, appUserModelId);
  if returnCode <> ERROR_SUCCESS then
  begin
    Result := HResultFromWin32(returnCode);
    FreeMem(appUserModelId);
    CloseHandle(ph);
    Exit;
  end;
//  SHStrDup(appUserModelId, _appUserModelId);
  _appUserModelId := appUserModelId;  // release memory after _appUserModelId is not neede anymore
//  FreeMem(appUserModelId);

  if CanResolveAppByApplicationUserModelId(_appUserModelId) then
  begin
    SHStrDup(_appUserModelId, applicationUserModelId);
  end
  else
  begin

    //[TODO] parecido al anterior m�todo seg�n el ejemplo https://msdn.microsoft.com/en-us/library/windows/desktop/dn313168(v=vs.85).aspx
    // pero en el c�digo de ear lo hace distinto, creo que probar� como el del ejemplo

    packageFamilyNameLength := PACKAGE_FAMILY_NAME_MAX_LENGTH;/// SizeOf(WideChar);
    packageRelativeAppIdLength := PACKAGE_RELATIVE_APPLICATION_ID_MAX_LENGTH;//SizeOf(packageRelativeAppIdLength); ARRAYSIZE()
    GetMem(packageFamilyName, packageFamilyNameLength);
    GetMem(packageRelativeAppId, packageRelativeAppIdLength);
    ParseApplicationUserModelId(_appUserModelId, @packageFamilyNameLength, packageFamilyName, @packageRelativeAppIdLength, packageRelativeAppId);

    SHStrDup(packageFamilyName, _packageFamilyName);
    SHStrDup(packageRelativeAppId, _packageRelativeAppId);
    FreeMem(packageFamilyName);
    FreeMem(packageRelativeAppId);

    packageCount := 0;
    packageNameBufferLength := 0;

    FindPackagesByPackageFamily(_packageFamilyName, PACKAGE_FILTER_HEAD or PACKAGE_INFORMATION_BASIC,
              @packageCount, nil, @packageNameBufferLength, nil, nil);

    if packageCount <= 0 then
    begin
      Result := HResultFromWin32(ERROR_NOT_FOUND);
      CloseHandle(ph);
      Exit;
    end;

    SetLength(packageNames, packageCount*SizeOf(widechar));

    //SetLength(buffer, packageNameBufferLength);
    GetMem(buffer, packageNameBufferLength);

    FindPackagesByPackageFamily(_packageFamilyName, PACKAGE_FILTER_HEAD or PACKAGE_INFORMATION_BASIC,
              @packageCount, @packageNames, @packageNameBufferLength, buffer, nil);
    FreeMem(buffer);
    OpenPackageInfoByFullName(packageNames[0], 0, rawPackageInfoRef);


    packageIdsLength := 0;
    packageIdCount := 0;

    GetPackageApplicationIds(rawpackageInfoRef, packageIdsLength, nil, packageIdCount);

    if packageIdCount <= 0 then
    begin
      Result := HResultFromWin32(ERROR_NOT_FOUND);
      CloseHandle(ph);
      Exit;
    end;

    SetLength(packageIdsRaw, packageIdsLength);
    GetPackageApplicationIds(rawpackageInfoRef, packageIdsLength, @packageIdsRaw, packageIdCount);

    SHStrDup(packageIds[0], applicationUserModelId);
  end;

  StrDispose(appUserModelId);

  CloseHandle(ph);
  Result := S_OK;

end;

function TAudioSessionService.GetAudioSessionCount: Integer;
begin
  Result := _sessions.Count;
end;

function TAudioSessionService.GetAudioSessions(
  var audioSessions: TListSessions): HRESULT;
begin
  if _sessions.Count = 0 then
    Result := HResultFromWin32(ERROR_NO_MORE_FILES);

  audioSessions.Assign(_sessions);

  Result := S_OK;
end;

function TAudioSessionService.EsImmersiveProcess(pid: Cardinal): HRESULT;
var
  ph: NativeUInt;
begin
  ph := OpenProcess(PROCESS_QUERY_LIMITED_INFORMATION, False, pid);

  if ph = INVALID_HANDLE_VALUE then
  begin
    Result := HResultFromWin32(GetLastError);
    CloseHandle(ph); Exit;
  end;

  if IsImmersiveProcess(ph) = True then
    Result := S_OK
  else
    Result := S_FALSE;

  CloseHandle(ph);
end;

function TAudioSessionService.RefreshAudioSessions: HRESULT;
var
  deviceEnumerator: IMMDeviceEnumerator;
  device: IMMDevice;
  audioSessionManager: IAudioSessionManager2;
  audioSessionEnumerator: IAudioSessionEnumerator;
  sessionCount: Integer;
  audioSession: PAudioSession;
  I: Integer;
  hr : HResult;
begin
  CleanUpAudioSessions;

  hr := CoInitialize(nil);
  if Succeeded(hr) then
  begin

    hr := CoCreateInstance(CLASS_IMMDeviceEnumerator, nil, CLSCTX_INPROC, IID_IMMDeviceEnumerator, deviceEnumerator);

    deviceEnumerator.GetDefaultAudioEndpoint(eRender, eMultimedia, device);

    device.Activate(IID_IAudioSessionManager2, CLSCTX_INPROC, nil, audioSessionManager);

    audioSessionManager.GetSessionEnumerator(audioSessionEnumerator);

    sessionCount := 0;
    audioSessionEnumerator.GetCount(sessionCount);

    for I := 0 to sessionCount - 1 do
    begin
      GetMem(audioSession, SizeOf(TAudioSession)); // it will be free on its Destroy function
      audioSession.SessionId := 0;
      audioSession.DisplayName := '';// StrNew('');
      audioSession.IconPath := ''; //StrNew('');
      audioSession.PeekValue := 0; //set it to 0 by default
      // let's make sure that Createet... alloc memory since prev is not required anymore as it seems
      hr := CreateEtAudioSessionFromAudioSession(audioSessionEnumerator, I, audioSession);
      if hr = S_OK then
      begin
        _sessions.Add(audioSession);
      end;
      FreeMem(audioSession);
    end;
  end;

  CoUninitialize;

  Result := S_OK;
end;

function TAudioSessionService.SetAudioSessionMute(sessionId: LongWord;
  isMuted: Boolean): HRESULT;
var
  simpleAudioVolume: ISimpleAudioVolume;
  I: Integer;
begin
  // if sessionid is not mapped exit, needs implementation

  // simpleAudioVolume is assigned from the mapped AudioManager2 beloging to that sessionId
  for I := 0 to _sessionMap.Count - 1 do
  begin
    if sessionId = _sessionMap.sessionId[I] then
    begin
      _sessionMap[I].QueryInterface(IID_ISimpleAudioVolume, simpleAudioVolume);
      if isMuted then
        simpleAudioVolume.SetMute(1, nil)
      else
        simpleAudioVolume.SetMute(0, nil);
    end;
  end;

  Result := S_OK;
end;

function TAudioSessionService.SetAudioSessionVolume(sessionId: LongWord;
  volume: Single): HRESULT;
var
  simpleAudioVolume: ISimpleAudioVolume;
  I: Integer;
begin
  // if sessionid is not mapped exit, needs implementation

  // simpleAudioVolume is assigned from the mapped AudioManager2 beloging to that sessionId
  for I := 0 to _sessionMap.Count - 1 do
  begin
    if sessionId = _sessionMap.sessionId[I] then
    begin
      _sessionMap[I].QueryInterface(IID_ISimpleAudioVolume, simpleAudioVolume);
      simpleAudioVolume.SetMasterVolume(volume, nil);
      Break;
    end;
  end;

  Result := S_OK;
end;

{ TMapSessions }

function TMapSessions.Add(Value: IAudioSessionControl2): Integer;
begin
  Result := inherited Add(Value);
end;

function TMapSessions.Add(sesionId: LongWord;
  Value: IAudioSessionControl2): Integer;
begin
  SetLength(sessionId, Count + 1);
  sessionId[Count] := sesionId;
  Result := inherited Add(Value);
end;

destructor TMapSessions.Destroy;
begin
  SetLength(sessionId, 0);
  Clear;

  inherited Destroy;
end;

function TMapSessions.Get(Index: Integer): IAudioSessionControl2;
begin
  Result := IAudioSessionControl2(Inherited Get(Index));
end;

function TMapSessions.GetSession(Index: Integer): Integer;
begin
  Result := sessionId[Index];
end;

end.


