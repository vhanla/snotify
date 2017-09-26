{
better free memory on notify instead of destroy 'cause clear and other ones need it
http://stackoverflow.com/questions/12287418/how-do-i-free-the-contents-of-a-tlist

  TODO Add Sqlite3 database to handle black list of unwanted music

  Changelog:

  2017-07-03
    - Detection of Spotify for Windows 10 based on Win10Privacy source code for listing installed apps.
}
unit frmMain;

interface

uses
  Winapi.Windows, System.SysUtils, Vcl.Forms, Vcl.StdCtrls, System.Classes, Vcl.Controls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Graphics, Spotify, Vcl.Dialogs,
  OverbyteIcsHttpProt, OverbyteIcsWndControl,
  OverbyteIcsMultipartHttpDownloader, OverbyteIcsWSocket, syncrossplatformjson, jpeg,
  Vcl.ComCtrls, {AudioSessionService,} CommCtrl, ShellApi, SkinEngine, Winapi.Messages,
  Vcl.OleServer, SpeechLib_TLB, timeteller,
  JvComponentBase, JvId3v1, VirtualTrees, Vcl.Menus, System.StrUtils, SynCommons, frmAbout,
  System.ImageList, Vcl.ImgList, Vcl.OleCtrls, IdHashMessageDigest;

type
  TQueryType = (qtPaused, qtEnabled, qtChecked);
  TSpotifyMenu = (smPause = 114, smNext, smPrevious, smSeekFw, smSeekBw, smShuffle, smRepeat, smVolumeUp, smVolumeDown);
  TSpotifyMenuPos = (smpPause = 0, smpNext = 2, smpPrevious, smpSeekFw, smpSeekBw, smpShuffle = 7, smpRepeat, smpVolumeUp = 10, smpVolumeDown);
type
  PMainForm = ^TMainForm;
  TMainForm = class(TForm)
    btnToast: TButton;
    Memo1: TMemo;
    Image10: TImage;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    btnCover: TButton;
    SslHttpCli1: TSslHttpCli;
    SslContext1: TSslContext;
    tmrStatus: TTimer;
    Image1: TImage;
    TrayIcon1: TTrayIcon;
    lstAudioSessions: TListBox;
    btnListAudioSessions: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    TrackBar1: TTrackBar;
    tmrVolume: TTimer;
    RadioGroup1: TRadioGroup;
    Button9: TButton;
    ListBox2: TListBox;
    Button10: TButton;
    ComboBox1: TComboBox;
    btnAbout: TButton;
    gbPlaylist: TGroupBox;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    OpenDialog1: TOpenDialog;
    VirtualStringTree1: TVirtualStringTree;
    Button17: TButton;
    gbTime: TGroupBox;
    ComboBox2: TComboBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    rgLocale: TRadioGroup;
    cbSystrayCover: TCheckBox;
    cbRunOnStartup: TCheckBox;
    cbAttachToSpotify: TCheckBox;
    StatusBar1: TStatusBar;
    gbDebug: TGroupBox;
    lblAudioPath: TLabel;
    Button3: TButton;
    PopupMenu1: TPopupMenu;
    About1: TMenuItem;
    Settings1: TMenuItem;
    N1: TMenuItem;
    Close1: TMenuItem;
    Label1: TLabel;
    pmMin: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    pmPause: TMenuItem;
    pmShuffle: TMenuItem;
    pmRepeat: TMenuItem;
    N4: TMenuItem;
    pmNext: TMenuItem;
    pmPrevious: TMenuItem;
    pmSeekForward: TMenuItem;
    pmSeekBackward: TMenuItem;
    tmrMenuStatus: TTimer;
    lblFlash: TLabel;
    pnlFlash: TPanel;
    lblSpotyLauncher: TLabel;
    ImageList1: TImageList;
    mmoToast: TMemo;
    lblpeak: TLabel;
    pbPeak: TProgressBar;
    grpHotkeys: TGroupBox;
    hkPause: THotKey;
    chkHKPause: TCheckBox;
    chkHKPrev: TCheckBox;
    hkPrev: THotKey;
    chkHKNext: TCheckBox;
    hkNext: THotKey;
    chkHKMute: TCheckBox;
    hkMute: THotKey;
    btnSpotyAuth: TButton;
    SslHttpCliAPI: TSslHttpCli;
    pbStatusAPI: TProgressBar;
    tmrAPIStatus: TTimer;
    procedure btnToastClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnCoverClick(Sender: TObject);
    procedure SslHttpCli1BeforeHeaderSend(Sender: TObject; const Method: string;
      Headers: TStrings);
    procedure SslHttpCli1RequestDone(Sender: TObject; RqType: THttpRequest;
      ErrCode: Word);
    procedure SslHttpCli1Cookie(Sender: TObject; const Data: string;
      var Accept: Boolean);
    procedure SslHttpCli1DocBegin(Sender: TObject);
    procedure SslHttpCli1DocEnd(Sender: TObject);
    procedure tmrStatusTimer(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure btnListAudioSessionsClick(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure tmrVolumeTimer(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure btnAboutClick(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure VirtualStringTree1GetText(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
      var CellText: string);
    procedure VirtualStringTree1InitChildren(Sender: TBaseVirtualTree;
      Node: PVirtualNode; var ChildCount: Cardinal);
    procedure VirtualStringTree1FreeNode(Sender: TBaseVirtualTree;
      Node: PVirtualNode);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure lstAudioSessionsClick(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure Settings1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure TrayIcon1DblClick(Sender: TObject);
    procedure cbSystrayCoverClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure pmMinClick(Sender: TObject);
    procedure pmPauseClick(Sender: TObject);
    procedure pmShuffleClick(Sender: TObject);
    procedure pmRepeatClick(Sender: TObject);
    procedure pmNextClick(Sender: TObject);
    procedure pmPreviousClick(Sender: TObject);
    procedure pmSeekForwardClick(Sender: TObject);
    procedure pmSeekBackwardClick(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure lblSpotyLauncherClick(Sender: TObject);
    procedure mmoToastChange(Sender: TObject);
    procedure btnSpotyAuthClick(Sender: TObject);
    procedure SslHttpCliAPIBeforeHeaderSend(Sender: TObject;
      const Method: string; Headers: TStrings);
    procedure SslHttpCliAPICookie(Sender: TObject; const Data: string;
      var Accept: Boolean);
    procedure SslHttpCliAPIDocBegin(Sender: TObject);
    procedure SslHttpCliAPIDocEnd(Sender: TObject);
    procedure SslHttpCliAPIRequestDone(Sender: TObject; RqType: THttpRequest;
      ErrCode: Word);
    procedure tmrAPIStatusTimer(Sender: TObject);
  private
    { Private declarations }
    SpotyClient : TSpotify;
    TimeTeller: TTimeTeller;
  public
    { Public declarations }
    procedure CreateParams(var Params: TCreateParams); override;
    procedure WMContextMenu(var Message: TWMContextMenu); // it is WM_CONTEXTMENU
    function GetMenuStatus(const MenuID: Integer;queryType: TQueryType):Integer;
    procedure UpdateMenuStatus;
  end;

type
  PEarTrumpetAudioSessionModel = ^TEarTrumpetAudioSessionModel;
  TEarTrumpetAudioSessionModel = record
    DisplayName: string;
    IconPath: string;
    GroupingId: TGuid;
    SessionId: LongWord;
    ProcessId: LongWord;
    BackgroundColor: LongWord;
    Volume: Single;
    IsDesktop: Boolean;
    IsMuted: Boolean;
    //with newer helper added volume peak
    VolumePeak: Single;
  end;

  TListSessions = class(TList)
  private
    function Get(Index: Integer): PEarTrumpetAudioSessionModel;
  public
    //destructor Destroy; override;
    function Add(Value: PEarTrumpetAudioSessionModel): Integer;
    procedure Notify(Ptr: Pointer; Action: TListNotification);override;
    property Items[Index: Integer]: PEarTrumpetAudioSessionModel read Get; default;
  end;

type
  { Mp3 Playlist}
  PMp3File = ^TMp3File;
  TMp3File = record
    Filename: String;
    Artist: String;
    Song: String;
    OtherNode: PVirtualNode;
  end;

var
  MainForm: TMainForm;
  //AudioSession: TAudioSessionService;
  sessions: TListSessions;
  spotifySessionId: Integer;
  win10shellhostaudioId: Integer;
  AllowClosing: Boolean = False;

  //menues statuses
  mnuPause: Boolean;//paused
  mnuNext: Boolean;//enabled
  mnuPrev: Boolean;
  mnuSeekF: Boolean;
  mnuSeekB: Boolean;
  mnuShfll: Boolean;//checked
  mnuRepeat: Boolean; //checked
  fPopupActive: Boolean = False;

  // toast vars
  canToast : Boolean = True;

  // SpotifyAPI
  OAuth: string = '';
  CSRF: string = '';

procedure SwitchToThisWindow(h1: hWnd; x: bool); stdcall;
  external user32 Name 'SwitchToThisWindow';

function RefreshAudioSessions: Integer; stdcall;
    external 'SpotifyHelper.dll' name 'SpotifyAudioHook';
  function GetAudioSessionCount: Integer; stdcall;
    external 'SpotifyHelper.dll' name 'SpotifyAudioList';
  function GetAudioSessions(var sessions: IntPtr): Integer; stdcall;
    external 'SpotifyHelper.dll' name 'SpotifyAudioLists';
  function SetAudioSessionVolume(sessionId: LongWord; volume: Single): Integer; stdcall;
    external 'SpotifyHelper.dll' name 'SpotifyVolume';
  function SetAudioSessionMute(sessionId: LongWord; isMuted: boolean): Integer; stdcall;
    external 'SpotifyHelper.dll' name 'SpotifyMute';
implementation

{$R *.dfm}

uses uWinRTNotifier;

function HashString(const Text: string): string;
begin
  with TIdHashMessageDigest5.Create do
  try
    Result := HashStringAsHex(Text); // returns '5EB63BBBE01EEED093CB22BB8F5ACDC3' e.g.
  finally
    Free;
  end;
end;

function ValidPath(srcPath: string; out destPath: string):Boolean;
var
  envpath: string;
  firstsymbol: integer;
  secondsymbol: Integer; // post of second % 'cause we need %anyvariable%<-- this one too
begin
  if FileExists(srcPath) then
  begin
    destPath := srcPath;
    Result := True;
    Exit;
  end;

  if StrLen(PChar(srcPath)) < 3 then
  Exit;

  Result := False;
  firstsymbol := Pos('%', srcPath);
  if firstsymbol = 1 then
  begin
    secondsymbol := PosEx('%', srcPath, firstsymbol + 1);
    if secondsymbol > 1 then
    begin
      envpath := Copy(srcPath, firstsymbol + 1, secondsymbol - firstsymbol - 1);
    end;
    //envPath := IncludeTrailingPathDelimiter(GetEnvironmentVariable(envpath));
    envPath := GetEnvironmentVariable(envpath);
    if not DirectoryExists(envPath) then
      Exit;
    // now we complet the full file path, let's reuse the envpath variable :3
    envpath := envpath + Copy(srcPath, StrLen(PChar(envpath))-1, StrLen(PChar(srcPath)) - StrLen(PChar(envpath)) +2);
    if FileExists(envpath) then
    begin
      destPath := envpath;
      Result := True;
    end;
  end;

end;

function GetImageListSH(SHIL_FLAG: Cardinal): HIMAGELIST;
const
  IID_IImageList: TGUID = '{46EB5926-582E-4017-9FDF-E8998DAA0950}';
type
  _SHGetImageList = function (iImageList: Integer; const riid: TGUID; var ppv: Pointer): hResult; stdcall;
var
  Handle : THandle;
  SHGetImageList: _SHGetImageList;
begin
  Result := 0;
  Handle := LoadLibrary('Shell32.dll');
  if Handle <> S_OK then
  try
    SHGetImageList := GetProcAddress(Handle, PChar(727));
    if Assigned(SHGetImageList) and (Win32Platform = VER_PLATFORM_WIN32_NT) then
      SHGetImageList(SHIL_FLAG, IID_IImageList, Pointer(Result));
  finally
    FreeLibrary(Handle);
  end;

end;

function GetIconFromFile(aFile: string; var aIcon: TIcon; SHIL_FLAG: Cardinal): Boolean;
var
  aImgList: HIMAGELIST;
  SFI : TSHFileInfo;
  aIndex : Integer;
  res: HRESULT;
begin
  // Get the index of the imagelist
  SHGetFileInfo(PChar(aFile), FILE_ATTRIBUTE_NORMAL, SFI,
      SizeOf(TSHFileInfo), SHGFI_ICON or SHGFI_LARGEICON or SHGFI_SHELLICONSIZE or
      SHGFI_SYSICONINDEX or SHGFI_TYPENAME or SHGFI_DISPLAYNAME);
  if not Assigned(aIcon) then
  aIcon := TIcon.Create;
  // get the imagelist
  aImgList := GetImageListSH(SHIL_FLAG);
  // get index
  aIndex := SFI.iIcon;
  // extract the icon handle
  res := ImageList_GetIcon( aImgList, aIndex, ILD_NORMAL);
  aIcon.Handle := res;
  if res <> S_OK then
    Result := True
  else
    Result := False; // if result is = it means there was no icon found
end;

//https://marc.durdin.net/2015/08/an-update-for-encodeuricomponent/
function EncodeURIComponent(const ASrc: string): string;
const
  HexMap: string = '0123456789ABCDEF';

  function IsSafeChar(ch: Byte): Boolean;
  begin
    if (ch >= 48) and (ch <= 57) then Result := True    // 0-9
    else if (ch >= 65) and (ch <= 90) then Result := True  // A-Z
    else if (ch >= 97) and (ch <= 122) then Result := True  // a-z
    else if (ch = 33) then Result := True // !
    else if (ch >= 39) and (ch <= 42) then Result := True // '()*
    else if (ch >= 45) and (ch <= 46) then Result := True // -.
    else if (ch = 95) then Result := True // _
    else if (ch = 126) then Result := True // ~
    else Result := False;
  end;

var
  I, J: Integer;
  Bytes: TBytes;
begin
  Result := '';

  Bytes := TEncoding.UTF8.GetBytes(ASrc);

  I := 0;
  J := Low(Result);

  SetLength(Result, Length(Bytes) * 3); // space to %xx encode every byte

  while I < Length(Bytes) do
  begin
    if IsSafeChar(Bytes[I]) then
    begin
      Result[J] := Char(Bytes[I]);
      Inc(J);
    end
    else
    begin
      Result[J] := '%';
      Result[J+1] := HexMap[(Bytes[I] shr 4) + Low(ASrc)];
      Result[J+2] := HexMap[(Bytes[I] and 15) + Low(ASrc)];
      Inc(J,3);
    end;
    Inc(I);
  end;

  SetLength(Result, J-Low(ASrc));
end;

procedure TMainForm.Button10Click(Sender: TObject);
begin
  TimeTeller.SayMp3;
end;

procedure TMainForm.btnAboutClick(Sender: TObject);
{const about = 'Snotify v1.0'#13
+'written by vhanla'#13
+'http://apps.codigobit.info'#13#13
+'Snotify for Windows 10 is a systray tool that will'#13
+'notify on new Spotify''s song play'#13
+'It will also allow you to change its volume.'#13
+'Read the current time using TTS or Zara''s radio compatible voices'
+#13'Credits:'#13
+'- Bass 2.4 (c) Un4seen'#13
+'- Project Jedi MPL v1.1'#13
+'- ICS (c) Overbyte';
var
  frm: TForm;}
begin
//  MessageDlg(about,mtInformation,[mbOK],0);
  Enabled := False;
  with TfrmSplash.Create(application) do
  begin
    Execute;
  end;

{  frm := TForm.Create(nil);
  try

    frm.BorderStyle := bsDialog;
    frm.Caption := 'About';
    frm.Width := 300;
    frm.Position := poScreenCenter;
    if not IsWindowVisible(Self.Handle)then
      Show;
    if frm.ShowModal = mrOk then
    begin

    end;
  finally
    frm.Free;
  end;}
end;

procedure TMainForm.Button13Click(Sender: TObject);
var
  f,a,s: string;
  Data : PMp3File;
  Node : PVirtualNode;
  I: Integer;
  ID3V1: TJvID3V1;
begin
  OpenDialog1.Filter := 'Mp3 file|*.mp3|All Files (not recommended)|*.*';
  if OpenDialog1.Execute then
  begin
    for I := 0 to OpenDialog1.Files.Count - 1 do
    begin
      f := OpenDialog1.Files[I];
      //f := OpenDialog1.FileName;
      a := '';
      s := '';
      ID3V1 := TJvID3v1.Create(nil);
      try
        ID3v1.FileName := f;
        ID3v1.Open;
        a := ID3v1.Artist;
        s := ID3v1.SongName;
        ID3v1.Close;
      finally
        ID3V1.Free;
      end;


      VirtualStringTree1.BeginUpdate;

      Node := VirtualStringTree1.AddChild(nil);
      Data := VirtualStringTree1.GetNodeData(Node);
      VirtualStringTree1.ValidateNode(Node, False); //required to let it be freed
      Data^.Filename := f;
      Data^.Artist := a;
      Data^.Song := s;

      VirtualStringTree1.EndUpdate;
    end;
  end;
end;

procedure TMainForm.Button14Click(Sender: TObject);
var
  Node, PrevNode, NextNode: PVirtualNode;
begin
  Node := VirtualStringTree1.FocusedNode;
  PrevNode := nil;
  NextNode := nil;
  PrevNode := VirtualStringTree1.GetPrevious(Node);
  NextNode := VirtualStringTree1.GetNext(Node);
  VirtualStringTree1.DeleteNode(Node);
  if NextNode <> nil then
  begin
    VirtualStringTree1.FocusedNode := NextNode;
    VirtualStringTree1.Selected[NextNode] := True;
  end
  else if PrevNode <> nil then
  begin
    VirtualStringTree1.FocusedNode := PrevNode;
    VirtualStringTree1.Selected[PrevNode] := True;
  end;

end;

procedure TMainForm.Button15Click(Sender: TObject);
begin
  VirtualStringTree1.BeginUpdate;
  VirtualStringTree1.Clear;
  VirtualStringTree1.EndUpdate;
end;

procedure TMainForm.btnCoverClick(Sender: TObject);
var
//  PostData : AnsiString;
  ApiURL: string;
begin
  ApiURL := 'https://api.spotify.com/v1/search?query=track%3A'+EncodeURIComponent(LabeledEdit2.Text)+'+artist%3A'+EncodeURIComponent(LabeledEdit1.Text)+'&offset=0&type=track';
  // if file already exists in our cache directory
  if FileExists(ExtractFilePath(ParamStr(0))+'cache\'+HashString(ApiURL)) then
  begin

    Exit;
  end;

  Memo1.Lines.Clear;

//  PostData := 'search?query=track%3A"Eagle"+artist%3Aabba&offset=0&type=track';
  //showmessage(  SpotyClient.GetCurrentSong);
//  Showmessage(IdHTTP1.Get('https://api.spotify.com/v1/search?query=track%3AEagle+artist%3Aabba&offset=0&type=track'));
//  ShowMessage(IdHTTP1.Version);

  {SslHttpCli1.SocksServer := '';
  SslHttpCli1.SocksPort := '';
  SslHttpCli1.SocksLevel := '5';}

  SslHttpCli1.URL := ApiURL;
  //SslHttpCli1.URL := 'https://i.scdn.co/image/ed072730188f91b5d9cf222a57c27645eae25676';
  {SslHttpCli1.AcceptLanguage := 'en, fr';
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
  end;}
  if not SslContext1.IsCtxInitialized then Exit;

  Memo1.Lines.Add('Connecting to: ' + SslHttpCli1.URL);
  try
    SslHttpCli1.GetASync;
    //WebBrowser1.Navigate('https://api.spotify.com/v1/search?query=track%3A'+EncodeURIComponent(LabeledEdit2.Text)+'+artist%3A'+EncodeURIComponent(LabeledEdit1.Text)+'&offset=0&type=track');
  except
    on E:Exception do begin
      Memo1.Lines.Add('Connection error! ' + E.ClassName + ' : ' + E.Message);
      Exit;
    end;
  end;
end;

procedure TMainForm.btnToastClick(Sender: TObject);
var
  Bmp: TBitmap;
  Icon: TIcon;
  Image: TWICImage;
  ImageList: TImageList;
begin
  Image := TWICImage.Create;
  try
    Image.LoadFromFile('cover.jpg');
    Bmp := TBitmap.Create;
    try
      Icon := TIcon.Create;
      try
      //http://www.swissdelphicenter.ch/en/showcode.php?id=913
        Bmp.Assign(Image);
        ImageList := TImageList.CreateSize(Bmp.Width, Bmp.Height);
        try
          ImageList.AddMasked(Bmp, Bmp.TransparentColor);
          ImageList.GetIcon(0, Icon);
          Image10.Picture.Assign(Icon);
          if cbSystrayCover.Checked then
          begin
            TrayIcon1.Icon.Assign(Icon);
            TrayIcon1.Visible := False;
            TrayIcon1.Visible := True;
          end;
          mmoToast.Lines.Clear;
          if canToast then
          begin
            canToast := False;
            ShowNotification( 1, LabeledEdit1.Text, LabeledEdit2.Text, '', '',
               TImage(Image10), mmoToast.Lines);
          end;
        finally
          ImageList.Free;
        end;
      finally
        Icon.Free;
      end;
    finally
      Bmp.Free;
    end;
  finally
    Image.Free;
  end;

end;

procedure TMainForm.About1Click(Sender: TObject);
begin
  if Enabled then
  btnAboutClick(Sender);
end;

procedure TMainForm.btnListAudioSessionsClick(Sender: TObject);
{var
  sessionCount: Integer;
  rawSessionsPtr : IntPtr;
  sizeOfAudioSessionPtr: Integer;
  I: Integer;
  window: IntPtr;
  psession: PEarTrumpetAudioSession;
begin
  AudioSession.RefreshAudioSessions;

  sessionCount := AudioSession.GetAudioSessionCount;
  if sessions <> nil then
    sessions.Clear
  else
    sessions := TListSessions.Create;

  try
    sessions.Clear;
    AudioSession.GetAudioSessions(sessions);

    ListBox1.Clear;
    ListBox1.Items.BeginUpdate;
    spotifySessionId := -1;
    for I := 0 to sessions.Count - 1 do
    begin
      ListBox1.Items.Add(sessions[i].DisplayName);
      if (LowerCase(sessions[I].DisplayName) = 'spotify.exe') and (spotifySessionId = -1)then
      begin
        spotifySessionId := I;
        TrackBar1.Position := 100 - Round((sessions[I].Volume )* 100);
        //Break;
      end;
    end;
    ListBox1.Items.EndUpdate;

  finally
    //sessions.Free;
  end;}
var
  sessionCount: Integer;
  rawSessionsPtr : IntPtr;
  sizeOfAudioSessionPtr: Integer;
  I: Integer;
  window: IntPtr;
  psession: PEarTrumpetAudioSessionModel;
//  pid: UINT;

begin
  RefreshAudioSessions;
  sessionCount := GetAudioSessionCount;

  sessions.Clear;
{  if sessions <> nil then
    sessions.Clear
  else
    sessions := TListSessions.Create;}

  try
    GetAudioSessions(rawSessionsPtr);

    sizeOfAudioSessionPtr := SizeOf(TEarTrumpetAudioSessionModel);

    for I := 0 to sessionCount - 1 do
    begin
      GetMem(psession, sizeOfAudioSessionPtr);
      window := rawSessionsPtr + sizeOfAudioSessionPtr * i;
      CopyMemory(psession, Pointer(window),  sizeOfAudioSessionPtr);
      sessions.Add(psession);
    end;

    //GetWindowThreadProcessId(SpotyClient.Handle, @pid);

    lstAudioSessions.Clear;
    lstAudioSessions.Items.BeginUpdate;
    spotifySessionId := -1;
    win10shellhostaudioId := -1;
    for I := 0 to sessions.Count - 1 do
    begin
      lstAudioSessions.Items.Add(sessions[i].DisplayName);

      if (LowerCase(PChar( sessions[I].DisplayName)) = 'spotify.exe')
      and (sessions[I].VolumePeak > 0)
      then
      begin
        pbPeak.Position := Round(sessions[I].VolumePeak * 100);
        lblpeak.Caption := FloatToStr(Round(sessions[I].VolumePeak  * 100));
      end;
      //else
        //pbPeak.Position := 100;

      if (LowerCase(PChar( sessions[I].DisplayName)) = 'spotify.exe')
      and (spotifySessionId = -1)
      and (sessions[I].VolumePeak > 0)
      then
      begin
        spotifySessionId := I;
        //TrackBar1.Position := 100 - Round((sessions[I].Volume )* 100);
        //Break;
      end;

      if Pos('systemapps\shellexperiencehost_',lowercase(PChar(sessions[I].IconPath))) > 0 then
      begin
        win10shellhostaudioId := I;
        Memo1.Lines.Add(IntToStr(sessions[I].SessionId)); // it seems that the id remains constant even the sound interface disappears from the list
        // i.e. the ID will be the same number :e.g 2219196421
      end;

    end;
    lstAudioSessions.Items.EndUpdate;

  finally
    //sessions.Free;
  end;
end;

procedure TMainForm.btnSpotyAuthClick(Sender: TObject);
begin
// sugerencias interesantes si falla
// https://github.com/ShyykoSerhiy/spotilocal/blob/master/src/index.ts
// https://github.com/ShyykoSerhiy/vscode-spotify/blob/master/package.json
// http://cgbystrom.com/articles/deconstructing-spotifys-builtin-http-server/
// pero sólo bastó cambiar de puerto 4380 a 4381, quizás sea conveniente mejorarlo
  SslHttpCliAPI.URL := 'http://localhost:4381/simplecsrf/token.json';

  Memo1.Lines.Add('Connecting to: ' + SslHttpCliAPI.URL);
  try
    SslHttpCliAPI.GetASync;
  except
    on E:Exception do begin
      Memo1.Lines.Add('Connection error! ' + E.ClassName + ' : ' + E.Message);
      Exit;
    end;
  end;
end;

procedure TMainForm.Button4Click(Sender: TObject);
begin
{  keybd_event(VK_MEDIA_PREV_TRACK,MapVirtualKey(VK_MEDIA_PREV_TRACK,0),0,0);
  Sleep(10);
  keybd_event(VK_MEDIA_PREV_TRACK,MapVirtualKey(VK_MEDIA_PREV_TRACK,0),KEYEVENTF_KEYUP,0);
  Sleep(100);}
  pmPreviousClick(Sender);
end;

procedure TMainForm.Button5Click(Sender: TObject);
begin
{  keybd_event(VK_MEDIA_STOP,MapVirtualKey(VK_MEDIA_STOP,0),0,0);
  Sleep(10);
  keybd_event(VK_MEDIA_STOP,MapVirtualKey(VK_MEDIA_STOP,0),KEYEVENTF_KEYUP,0);
  Sleep(100);}
  if not mnuPause then
  pmPauseClick(Sender);
end;

procedure TMainForm.Button6Click(Sender: TObject);
begin
{  keybd_event(VK_MEDIA_PLAY_PAUSE,MapVirtualKey(VK_MEDIA_PLAY_PAUSE,0),0,0);
  Sleep(10);
  keybd_event(VK_MEDIA_PLAY_PAUSE,MapVirtualKey(VK_MEDIA_PLAY_PAUSE,0),KEYEVENTF_KEYUP,0);
  Sleep(100);}
  pmPauseClick(Sender);
end;

procedure TMainForm.Button7Click(Sender: TObject);
begin
{  keybd_event(VK_MEDIA_NEXT_TRACK,MapVirtualKey(VK_MEDIA_NEXT_TRACK,0),0,0);
  Sleep(10);
  keybd_event(VK_MEDIA_NEXT_TRACK,MapVirtualKey(VK_MEDIA_NEXT_TRACK,0),KEYEVENTF_KEYUP,0);
  Sleep(100);}
  pmNextClick(Sender);
end;

procedure TMainForm.Button8Click(Sender: TObject);
begin
  if spotifySessionId < 0 then Exit;

  //if Button8.Caption = '🔇🔊🔉🔈' then
  if Button8.Caption = '🔈' then
  begin
    Button8.Caption := '🔊';
    //AudioSession.SetAudioSessionMute(sessions.Items[spotifySessionId].SessionId, False);
    SetAudioSessionMute(sessions[spotifySessionId].SessionId, False);
  end
  else
  begin
    Button8.Caption := '🔈';
    //AudioSession.SetAudioSessionMute(sessions.Items[spotifySessionId].SessionId, True);
    SetAudioSessionMute(sessions[spotifySessionId].SessionId, True);
  end;

end;

procedure TMainForm.Button9Click(Sender: TObject);
begin
  if ListBox2.ItemIndex >= 0 then
  begin
    if rgLocale.ItemIndex = 0 then
      TimeTeller.Locale := 'EN'
    else
      TimeTeller.Locale := 'ES';
    TimeTeller.Voice := ListBox2.ItemIndex;
    TimeTeller.Say(TimeTeller.TimeStr);
  end;
end;

procedure TMainForm.cbSystrayCoverClick(Sender: TObject);
var
  Icon: TIcon;
  Bmp : TBitmap;
  Image: TWICImage;
  ImageList: TImageList;
begin
  if not cbSystrayCover.Checked then
  begin
    Icon := TIcon.Create;
    try
      Icon.LoadFromResourceName(HInstance, 'ICONO');
      TrayIcon1.Icon.Assign(Icon);
      TrayIcon1.Visible := False;
      TrayIcon1.Visible := True;

    finally
      Icon.Free;
    end;
  end
  else
  begin
    Image := TWICImage.Create;
    try
      Image.LoadFromFile('cover.jpg');
      Bmp := TBitmap.Create;
      try
        Icon := TIcon.Create;
        try
          //http://www.swissdelphicenter.ch/en/showcode.php?id=913
          Bmp.Assign(Image);
          ImageList := TImageList.CreateSize(Bmp.Width, Bmp.Height);
          try
            ImageList.AddMasked(Bmp, Bmp.TransparentColor);
            ImageList.GetIcon(0, Icon);

            TrayIcon1.Icon.Assign(Icon);
            TrayIcon1.Visible := False;
            TrayIcon1.Visible := True;

          finally
            ImageList.Free;
          end;
        finally
          Icon.Free;
        end;
      finally
        Bmp.Free;
      end;
    finally
      Image.Free;
    end;
  end;
end;

procedure TMainForm.Close1Click(Sender: TObject);
begin
  AllowClosing := True;
  close
end;

procedure TMainForm.ComboBox1Change(Sender: TObject);
begin
  TimeTeller.Caster := ComboBox1.Text;
end;

procedure TMainForm.ComboBox2Change(Sender: TObject);
begin
  PageControl1.ActivePageIndex := ComboBox2.ItemIndex;
end;

procedure TMainForm.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
    Params.WinClassName := 'SnotifyCLS';
end;

procedure TMainForm.WMContextMenu(var Message: TWMContextMenu);
begin
  fPopupActive := True;
  try
    inherited;
  finally
    fPopupActive := False;
  end;
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if not AllowClosing then
  begin
    CanClose := False;
    Hide;
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin

  spotifySessionId := -1;
  SpotyClient := TSpotify.Create;

  SslHttpCli1.Agent := 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36 OPR/40.0.2308.81';
  SslHttpCli1.SocksServer := '';
  SslHttpCli1.SocksPort := '';
  SslHttpCli1.SocksLevel := '5';
  SslHttpCli1.AcceptLanguage := 'en, fr';
  SslHttpCli1.Connection := 'Keep-Alive';
  SslHttpCli1.RequestVer := '1.0'; // HTTP/1.0
  SslHttpCli1.ModifiedSince := 0;
  SslHttpCliAPI.Agent := 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36 OPR/40.0.2308.81';
  SslHttpCliAPI.SocksServer := '';
  SslHttpCliAPI.SocksPort := '';
  SslHttpCliAPI.SocksLevel := '5';
  SslHttpCliAPI.AcceptLanguage := 'en, fr';
  SslHttpCliAPI.Connection := 'Keep-Alive';
  SslHttpCliAPI.RequestVer := '1.0'; // HTTP/1.0
  SslHttpCliAPI.ModifiedSince := 0;
  SslContext1.SslMinVersion := TSslVerMethod(0);
  SslContext1.SslMaxVersion := TSslVerMethod(5);
  SslContext1.SslCipherList := 'ALL:!ADH:RC4+RSA:+SSLv2:@STRENGTH';
  SslContext1.InitContext;

  TrayIcon1.Icon.LoadFromResourceName(HInstance, 'ICONO');
  TrayIcon1.Visible := True;
  //AudioSession := TAudioSessionService.Create;
  sessions := TListSessions.Create;

  TimeTeller := TTimeTeller.Create(Handle);

  TimeTeller.GetVoicesList(ListBox2);
  TimeTeller.GetCastersList(ComboBox1);
  if ComboBox1.Items.Count > 0 then
  begin
    ComboBox1.ItemIndex := 0;
    TimeTeller.Caster := ComboBox1.Text;
  end;

  // Playlist
  VirtualStringTree1.NodeDataSize := SizeOf(TMP3File);

  // set group boxes position
  gbDebug.Left :=338;
  gbDebug.Top := 8;
  gbPlaylist.Left := 338;
  gbPlaylist.Top := 8;
  gbTime.Left := 338;
  gbTime.Top := 8;

  // set form width
  Width := 707;
  Height := 332;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  TimeTeller.Free;
  sessions.Free;
  SpotyClient.Free;
  //FreeAndNil(AudioSession);
end;


procedure TMainForm.FormPaint(Sender: TObject);
var
  tbDC : HDC;
begin
{  tbDC := GetDC(TrackBar1.Handle);
  try

    DrawFocusRect(tbDC,Rect(0, 0, TrackBar1.Width, TrackBar1.Height));
  finally
    ReleaseDC(TrackBar1.Handle, tbDC);
  end;
 }
end;

procedure TMainForm.lblSpotyLauncherClick(Sender: TObject);
begin
  SpotyClient.StartSpotify;
  pnlFlash.Visible := False;
end;

procedure TMainForm.lstAudioSessionsClick(Sender: TObject);
var
  avalidPath: string;
begin
//  ValidPath(sessions[lstAudioSessions.ItemIndex].IconPath, avalidPath);
  avalidPath := PChar(sessions[lstAudioSessions.ItemIndex].IconPath);
  if Pos('systemapps\shellexperiencehost_',lowercase(avalidPath)) > 0 then
    lblAudioPath.Caption := 'Mutable Shellhost';
end;

procedure TMainForm.mmoToastChange(Sender: TObject);
begin
  // Let's unlock toast, i.e. toast won't start unless
  // we know here that one toast is finished
  if mmoToast.Text <> '' then
  begin
    canToast := True;
  end;

  if Pos('Aaccepted with param', mmoToast.Text) > 0 then
  begin
    if not IsWindowVisible(SpotyClient.Handle) then
      ShowWindow(SpotyClient.Handle, SW_NORMAL);
    SwitchToThisWindow(SpotyClient.Handle, False);
  end;

end;

procedure TMainForm.pmNextClick(Sender: TObject);
begin
  PostMessage(SpotyClient.Handle, WM_COMMAND, 115,0);
end;

procedure TMainForm.pmPauseClick(Sender: TObject);
begin
  PostMessage(SpotyClient.Handle, WM_COMMAND, 114,0);
end;

procedure TMainForm.pmMinClick(Sender: TObject);
begin
  if IsWindowVisible(SpotyClient.Handle) then
  begin
    pmMin.Caption := 'Show Spotify';
    ShowWindow(SpotyClient.Handle, SW_HIDE);
  end
  else
  begin
    pmMin.Caption := 'Minimize to Tray';
    ShowWindow(SpotyClient.Handle, SW_SHOWNORMAL);
  end;
end;

procedure TMainForm.pmPreviousClick(Sender: TObject);
begin
  PostMessage(SpotyClient.Handle, WM_COMMAND, 116,0);
end;

procedure TMainForm.RadioGroup1Click(Sender: TObject);
begin
  gbTime.Visible := False;
  gbPlaylist.Visible := False;
  case RadioGroup1.ItemIndex of
    2:
    begin
      gbTime.Visible := True;
    end;
    3:
    begin
      gbPlaylist.Visible := True;
    end;
  end;
end;

procedure TMainForm.pmRepeatClick(Sender: TObject);
begin
  PostMessage(SpotyClient.Handle, WM_COMMAND, 120,0);
end;

procedure TMainForm.pmSeekBackwardClick(Sender: TObject);
begin
  PostMessage(SpotyClient.Handle, WM_COMMAND, 118,0);
end;

procedure TMainForm.pmSeekForwardClick(Sender: TObject);
begin
  PostMessage(SpotyClient.Handle, WM_COMMAND, 117
  ,0);
end;

procedure TMainForm.Settings1Click(Sender: TObject);
begin
  Show;
end;

procedure TMainForm.pmShuffleClick(Sender: TObject);
begin
  PostMessage(SpotyClient.Handle, WM_COMMAND, 119,0);
end;

procedure TMainForm.PopupMenu1Popup(Sender: TObject);
begin
  // update accordingly
  UpdateMenuStatus;
end;

procedure TMainForm.SslHttpCli1BeforeHeaderSend(Sender: TObject;
  const Method: string; Headers: TStrings);
var
  I: Integer;
begin
  Headers.Add('Origin: https://embed.spotify.com');

//  ShowMessage(Headers.Text);
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
  ContentType: String;
begin
  HttpCli := Sender as TSslHttpCli;
  ContentType := HttpCli.ContentType;
  try
    if Pos('application/json',ContentType)>0 then
      HttpCli.RcvdStream := TFileStream.Create('demo.json', fmCreate)
    else if Pos('image/jpeg', ContentType)>0 then
      HttpCli.RcvdStream := TFileStream.Create('cover.jpg', fmCreate)
    else if Pos('image/png', ContentType)>0 then
      HttpCli.RcvdStream := TFileStream.Create('cover.png', fmCreate);
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
  DataIn: TBufferedFileStream; //TStream;
  I: Integer;
  SmallCoverArt: string;
  CurSize,PrevSize: Integer;
  ContentType : String;
  Json, Images : Variant;
begin
  ContentType := SslHttpCli1.ContentType;
  if Pos('application/json',ContentType)>0 then
  begin
    DataIn := TBufferedFileStream.Create('demo.json', fmOpenRead);
    try
      //Memo1.Lines.Add('Content/Type is: ' + SslHttpCli1.ContentType);
      //ContentType := SslHttpCli1.ContentType;
    finally
      DataIn.Free;
    end;
    Memo1.Lines.LoadFromFile('demo.json');
    SmallCoverArt := '';

    Json := _JsonFast(Memo1.Text);
    Memo1.Lines.Clear;

    if Json._Count > 0 then
    begin
      Json := Json.tracks;
      if Json._Count > 0 then
      begin
        Json := Json.items;
        if Json._Count > 0 then
        begin
          Json := Json._(0);
          if Json._Count > 0 then
          begin
            Json := Json.album;
            if Json._Count > 0 then
            begin
              Json := Json.images;
              if Json._Count > 0 then
              begin
                PrevSize := 100000;
                for I := 0 to Json._Count - 1 do
                begin
                  Images := Json._(I);
                  if Images._Count > 0 then
                  begin
                    CurSize := Images.width;
                    if CurSize < PrevSize then
                    begin
                      SmallCoverArt := Images.url;
                      Memo1.Lines.Add(SmallCoverArt);
                      PrevSize := CurSize;
                    end;
                  end;
                end;
              end;
            end;
          end;
        end;
      end;
    end;

    if SmallCoverArt <> '' then
    begin
      // let's opt out for http instead of ssl since it is supported and will be faster theorically
      SslHttpCli1.URL := StringReplace( SmallCoverArt, 'https', 'http', [rfReplaceAll]);
      SslHttpCli1.GetASync;
    end;
  end
  else if Pos('image/jpeg', ContentType) > 0 then
  begin
    DataIn := TBufferedFileStream.Create('cover.jpg', fmOpenRead);
    try

    finally
      DataIn.Free;
    end;

    Image1.Picture.LoadFromFile('cover.jpg');

  end;

end;

procedure TMainForm.SslHttpCliAPIBeforeHeaderSend(Sender: TObject;
  const Method: string; Headers: TStrings);
begin
  Headers.Add('Origin: https://embed.spotify.com');
end;

procedure TMainForm.SslHttpCliAPICookie(Sender: TObject; const Data: string;
  var Accept: Boolean);
begin
  Memo1.Lines.Add('Cookie: "'+Data+'"');
end;

procedure TMainForm.SslHttpCliAPIDocBegin(Sender: TObject);
var
  HttpCli: TSslHttpCli;
  ContentType: String;
begin
  HttpCli := Sender as TSslHttpCli;
  ContentType := HttpCli.ContentType;
  try
    if Pos('application/json',ContentType)>0 then
      HttpCli.RcvdStream := TFileStream.Create('api.json', fmCreate);
  except
    on E:Exception do begin
      //
    end;

  end;
end;

procedure TMainForm.SslHttpCliAPIDocEnd(Sender: TObject);
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

procedure TMainForm.SslHttpCliAPIRequestDone(Sender: TObject;
  RqType: THttpRequest; ErrCode: Word);
var
  DataIn: TBufferedFileStream; //TStream;
  I: Integer;
  CurSize,PrevSize: Integer;
  ContentType : String;
  Json, Images : Variant;
begin
  ContentType := SslHttpCliAPI.ContentType;
  if Pos('application/json',ContentType)>0 then
  begin
    DataIn := TBufferedFileStream.Create('api.json', fmOpenRead);
    try
      //Memo1.Lines.Add('Content/Type is: ' + SslHttpCli1.ContentType);
      //ContentType := SslHttpCli1.ContentType;
    finally
      DataIn.Free;
    end;
    Memo1.Lines.LoadFromFile('api.json');

    Json := _JsonFast(Memo1.Text);
    Memo1.Lines.Clear;

    if Json._Count > 0 then
    begin
      if Json.token <> NULL then
      begin
        CSRF := Json.token;
        Memo1.Lines.Add(CSRF);
        SslHttpCliAPI.URL := 'http://localhost:4381/remote/status.json?&oauth=' + OAuth + '&csrf=' + CSRF;
        SslHttpCliAPI.GetASync;
      end
      else if Json.error <> NULL then
      begin
        Memo1.Lines.Add(Json);
        // let's ask for an oauth toke from spotify
        SslHttpCliAPI.URL := 'https://open.spotify.com/token';
        SslHttpCliAPI.GetASync;
      end
      else if Json.t <> NULL then
      begin
        OAuth := Json.t;
        Memo1.Lines.Add(Oauth);
      end
      else if Json.playing <> NULL then
      begin
        tmrAPIStatus.Enabled := True;
        if Json.track <> NULL then
        begin
          if Json.track.length <> NULL then
          begin
            pbStatusAPI.Max := Json.track.length;
          end;
          if Json.track.track_type <> NULL then
          begin
            if Json.track.track_type = 'ad' then
            begin
              if Button8.Caption = '🔊' then
                Button8Click(Sender);
            end
            else
            begin
              if Button8.Caption = '🔈' then
                Button8Click(Sender);
            end;

          end;

        end;
        if Json.playing_position <> NULL then
        begin
          pbStatusAPI.Position := Round(Json.playing_position);
        end;
      end
      else if Json.playing = Null then
      begin
        tmrAPIStatus.Enabled := False;
      end
      else
        Memo1.Lines.Add(Json);
    end;
  end;
end;

procedure TMainForm.tmrAPIStatusTimer(Sender: TObject);
begin
  btnSpotyAuthClick(Sender);
end;

procedure TMainForm.tmrStatusTimer(Sender: TObject);
begin
  if not IsWindow(SpotyClient.Handle) then
    pnlFlash.Visible := True
  else
    pnlFlash.Visible := False;

  LabeledEdit1.Text := SpotyClient.Artist;
  LabeledEdit2.Text := SpotyClient.Song;
  //LabeledEdit3.Text := SpotyClient.Album;

  if SpotyClient.IsPlayingAds then
    StatusBar1.Panels.Items[1].Text := 'Spotify is playing ads $'
  else if SpotyClient.IsPlaying then
    StatusBar1.Panels.Items[1].Text := 'Spotify is playing music ♪'
  else
    StatusBar1.Panels.Items[1].Text := 'Spotify is NOT playing anything';

  if spotifySessionId < 0 then Exit;

{  if (Trim(LabeledEdit2.Text) = '') then
  begin
    AudioSession.SetAudioSessionMute(sessions.Items[spotifySessionId].SessionId, True);
  end
  else
  begin
    AudioSession.SetAudioSessionMute(sessions.Items[spotifySessionId].SessionId, False);
  end;}
end;



procedure TMainForm.tmrVolumeTimer(Sender: TObject);
begin
  btnListAudioSessionsClick(Sender);
end;

procedure TMainForm.TrackBar1Change(Sender: TObject);
begin
  //AudioSession.SetAudioSessionVolume(sessions[spotifySessionId].SessionId, (100 - TrackBar1.Position) / 100);
  //sessions[spotifySessionId].Volume := (100 - TrackBar1.Position) / 100;
  if spotifySessionId < 0 then Exit;

  SetAudioSessionVolume(sessions[spotifySessionId].SessionId, (100 - TrackBar1.Position) / 100);
  sessions[spotifySessionId].Volume := (100 - TrackBar1.Position) / 100;
end;

procedure TMainForm.TrayIcon1DblClick(Sender: TObject);
begin
  if IsWindowVisible(Handle) then
    Hide
  else
    Show;
end;

procedure TMainForm.VirtualStringTree1FreeNode(Sender: TBaseVirtualTree;
  Node: PVirtualNode);
var
  Data: PMp3File;
begin
  Data := Sender.GetNodeData(Node);
  Finalize(Data^);
end;

procedure TMainForm.VirtualStringTree1GetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
  var CellText: string);
var
  Data : PMp3File;
begin
  Data := Sender.GetNodeData(Node);
  case Column of
    0: CellText := Data.Filename;
    1: CellText := Data.Artist;
    2: CellText := Data.Song;
  end;
end;

procedure TMainForm.VirtualStringTree1InitChildren(Sender: TBaseVirtualTree;
  Node: PVirtualNode; var ChildCount: Cardinal);
begin
  ChildCount := Sender.GetNodeLevel(Node);
end;

{ procedure TMainForm.VirtualStringTree1InitChildren(Sender: TBaseVirtualTree;
  Node: PVirtualNode; var ChildCount: Cardinal);
begin

end;

TListSessions }

// QueryType : 0 = paused, 1: enabled, 2: checked
// we assume Spotyclient.Handle is present
// Result:
// -1 : Error, no menu, no submenu, etc
// 0 : False
// 1 : True
function TMainForm.GetMenuStatus(const MenuID: Integer;queryType: TQueryType):Integer;
var
  MenuHandle: Cardinal;
  MenuString: PWideChar;
  MenuState: Cardinal;
begin
  Result := -1;
  if SpotyClient.Handle = 0 then Exit;
  MenuHandle := GetMenu(SpotyClient.Handle);
  if MenuHandle < 1 then Exit;
  MenuHandle := GetSubMenu(MenuHandle, 3); // by position
  if MenuHandle < 1 then Exit;

  case queryType of
    qtPaused:
    begin
      GetMem(MenuString, 251);
      try
        GetMenuString(MenuHandle,MenuID, MenuString, 250, MF_BYCOMMAND);
        if Pos('Paus',StrPas(MenuString))>0 then
          Result := 0
        else
          Result := 1; //if it is not Pause, it means it is paused
      finally
        FreeMem(MenuString);
      end;
    end;
    qtEnabled:
    begin
      MenuState := GetMenuState(MenuHandle,MenuID,MF_BYCOMMAND);
      if MenuState > -1 then
      begin
        if MenuState = MF_GRAYED then
          Result := 0
        else
          Result := 1;
      end;
    end;
    qtChecked:
    begin
      MenuState := GetMenuState(MenuHandle,MenuID,MF_BYCOMMAND);
      if MenuState > -1 then
      begin
        if MenuState = MF_CHECKED then
          Result := 1
        else
          Result := 0;
      end;
    end;
  end;
end;

{ Gets Spotify client menu statuses}
procedure TMainForm.UpdateMenuStatus;
var
  rest: Integer;
begin
  rest := GetMenuStatus(Ord(smPause),qtPaused);
  if rest = 0 then
  begin
    mnuPause := False;
    if not fPopupActive then
      pmPause.Caption := 'Pause';
  end
  else if rest = 1 then
  begin
    mnuPause := True;
    if not fPopupActive then
      pmPause.Caption := 'Play';
  end;

  rest := GetMenuStatus(Ord(smShuffle),qtChecked);
  if rest = 0 then
  begin
    mnuShfll := False;
    if not fPopupActive then pmShuffle.Checked := mnuShfll;
  end
  else if rest = 1 then
  begin
    mnuShfll := True;
    if not fPopupActive then pmShuffle.Checked := mnuShfll;
  end;

  rest := GetMenuStatus(Ord(smRepeat),qtChecked);
  if rest = 0 then
  begin
    mnuRepeat := False;
    if not fPopupActive then pmRepeat.Checked := mnuRepeat;
  end
  else if rest = 1 then
  begin
    mnuRepeat := True;
    if not fPopupActive then pmRepeat.Checked := mnuRepeat;
  end;

  rest := GetMenuStatus(Ord(smNext),qtEnabled);
  if rest = 0 then
  begin
    mnuNext := False;
    if not fPopupActive then pmNext.Enabled := mnuNext;
  end
  else if rest = 1 then
  begin
    mnuNext := True;
    if not fPopupActive then pmNext.Enabled := mnuNext;
  end;

  rest := GetMenuStatus(Ord(smPrevious),qtEnabled);
  if rest = 0 then
  begin
    mnuPrev := False;
    if not fPopupActive then pmPrevious.Enabled := mnuPrev;
  end
  else if rest = 1 then
  begin
    mnuPrev := True;
    if not fPopupActive then pmPrevious.Enabled := mnuPrev;
  end;

  rest := GetMenuStatus(Ord(smSeekFw),qtEnabled);
  if rest = 0 then
  begin
    mnuSeekF := False;
    if not fPopupActive then pmSeekForward.Enabled := mnuSeekF;
  end
  else if rest = 1 then
  begin
    mnuSeekF := True;
    if not fPopupActive then pmSeekForward.Enabled := mnuSeekF;
  end;

  rest := GetMenuStatus(Ord(smSeekBw),qtEnabled);
  if rest = 0 then
  begin
    mnuSeekB := False;
    if not fPopupActive then pmSeekBackward.Enabled := mnuSeekB;
  end
  else if rest = 1 then
  begin
    mnuSeekB := True;
    if not fPopupActive then pmSeekBackward.Enabled := mnuSeekB;
  end;


end;

function TListSessions.Add(Value: PEarTrumpetAudioSessionModel): Integer;
begin
  Result := inherited Add(Value);
end;

{destructor TListSessions.Destroy;
var
  i : Integer;
begin
  for I := 0 to Count - 1 do
  begin
    //FreeMem(Items[I]);
  end;
  inherited;
end;}

function TListSessions.Get(Index: Integer): PEarTrumpetAudioSessionModel;
begin
  Result := PEarTrumpetAudioSessionModel(inherited Get(Index));
end;

procedure TListSessions.Notify(Ptr: Pointer; Action: TListNotification);
begin
  inherited;
  if Action = lnDeleted then
    FreeMem(Ptr);
end;

end.

