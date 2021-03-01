unit snotifyDeskband;

interface

uses
  Windows, Messages, Classes, ActiveX, ComServ, ComObj, ShlObj, SHDocVw,
  VCL.Graphics, snotifyDeskbandForm;

const
  // GUID for registering DeskBands
  REGKEY_DESK_BAND = '{00021492-0000-0000-C000-000000000046}';
  // GUID for Snotify's Deskband
  CLSID_SNOTIFY_DESK_BAND: TGUID = '{9DF94D42-B197-4F51-8E31-0C2A3E82BD22}';
  // Title
  EXPLORER_MENU_CAPTION = '&Snotify Deskband';
  // Title in deskband
  BAND_TITLE = 'Snotify';
  // Title in contextual menu
  MENU_TITLE_ABOUT = 'About Snotify';

type
  // Class for registering our desk tape in the Windows COM SubSystem
  TSnotifyDeskBandFactory = class(TComObjectFactory)
  public
    // Registered resp. removes our Desk-Band in/from the Windows Explorer/Internet Explorer
    procedure UpdateRegistry(ARegister: Boolean); override;
  end;

  // The COM object of our deskband. This takes over all interactions with Windows/Internet Explorer
  TSnotifyDeskBand = class(TComObject, IDeskBand, IPersist, IPersistStream,
    IPersistStreamInit, IObjectWithSite, IContextMenu, IInputObject)
  private
    FHasFocus: Boolean;
    FBandID: DWORD;
    FParentWnd: HWND;
    FSite: IInputObjectSite;
    FMenuItemCount: Integer;
    FCommandTarget: IOleCommandTarget;
    FIE: IWebBrowser2;
    FBandForm: TSnotiForm;
    FSavedWndProc: TWndMethod;
    // Hides the DeskBand, but saves the shape object.
    procedure HideBandForm;
  protected
    // Number of own menu entries in the context menu of the deskband
    property MenuItemCount: Integer read FMenuItemCount;
    // Is True if the desk band is focused, otherwise False.
    property HasFocus: Boolean read FHasFocus;
    // Stores the ID of the deskband within the host container.
    property BandID: DWORD read FBandID;
    // Pointer to "WndProc method of the Delphi form which is contained in the DeskBand
    // is displayed
    property SavedWndProc: TWndMethod read FSavedWndProc;
    // Window-Handle of the Host-Containers for the Desk-Band
    property ParentWnd: HWND read FParentWnd;
    // Enables host container to inform when they are the focus of changes
    property Site: IInputObjectSite read FSite;
    // Allows the Desk-Band to receive instructions or send them
    property CommandTarget: IOleCommandTarget read FCommandTarget;
    // Our Delphi form, which is shown in the deskband
    property BandForm: TsnotiForm read FBandForm;
    // Link to Internet Explorer, if the Desk-Band in Internet Explorer
    // is displayed as a toolbar.
    property IE: IWebBrowser2 read FIE;
  protected
    // Informs the host container whether the desk band has the focus
    procedure FocusChange(AHasFocus: Boolean);
    // Informs the host container that the settings of the
    // DeskBand and prompts it to use the method
    // Call GetBandInfo again
    procedure UpdateBandInfo;
    //
    procedure BandWndProc(var AMsg: TMessage);
  public
    //
    destructor Destroy; override;
    //
    procedure Initialize; override;
    //
    // IDeskBand
    function GetBandInfo(dwBandID, dwViewMode: DWORD; var pdbi: TDeskBandInfo):
      HResult; stdcall;
    //
    function ShowDW(AShow: BOOL): HRESULT; stdcall;
    //
    function CloseDW(AReserver: DWORD): HRESULT; stdcall;
    //
    function ResizeBorderDW(var ARectBorder: TRect; AToolbarSite: IUnknown; AReserver: BOOL): HRESULT; stdcall;
    //
    function GetWindow(out AWnd: HWND): HRESULT; stdcall;
    //
    function ContextSensitiveHelp(AEnterMode: BOOL): HRESULT; stdcall;
    //
    // IPersist
    function GetClassID(out classID: TCLSID): HResult; stdcall;
    // IPersistStream
    function IsDirty: HResult; stdcall;
    function Load(const stm: IStream): HResult; stdcall;
    function Save(const stm: IStream; fClearDirty: BOOL): HResult; stdcall;
    function GetSizeMax(out cbSize: Largeint): HResult; stdcall;
    // IPersistStreamInit - inherits IPersistStream
    function InitNew: HResult; stdcall;
    // IObjectWithSite
    function SetSite(const pUnkSite: IUnknown ):HResult; stdcall;
    function GetSite(const riid: TIID; out site: IUnknown):HResult; stdcall;
    // IContextMenu
    function QueryContextMenu(Menu: HMENU;
      indexMenu, idCmdFirst, idCmdLast, uFlags: UINT): HResult; stdcall;
    function InvokeCommand(var lpici: TCMInvokeCommandInfo): HResult; stdcall;
    function GetCommandString(idCmd: UINT_PTR; uFlags: UINT; pwReserved: PUINT;
      pszName: LPSTR; cchMax: UINT): HResult; stdcall;
    // IInputObject
    function UIActivateIO(fActivate: BOOL; var lpMsg: TMsg): HResult; stdcall;
    function HasFocusIO: HResult; stdcall;
    function TranslateAcceleratorIO(var lpMsg: TMsg): HResult; stdcall;
    // Older deprecated
    //function TranslateAccelerator(var AMsg: TMsg): HRESULT; stdcall;
    // IContextMenu2
    function HandleMenuMsg(uMsg: UINT; WParam: WPARAM; LParam: LPARAM): HResult; stdcall;
    // IContextMenu3
    function HandleMenuMsg2(uMsg: UINT; wParam: WPARAM; lParam: LPARAM;
      var lpResult: LRESULT): HResult; stdcall;

    // IDeskBand2
    // Indicates the deskband's ability to be displayed as translucent.
    function CanRenderComposited(
      var pfCanRenderComposited: BOOL): HRESULT; stdcall;
    // Sets the composition state.
    function SetCompositionState(fCompositionEnabled: BOOL): HRESULT; stdcall;
    // Gets the composition state.
    function GetCompositionState(var pfCompositionEnabled: BOOL): HRESULT; stdcall;
  end;

implementation

uses
  Registry;

{ TSnotifyDeskBandFactory }

procedure TSnotifyDeskBandFactory.UpdateRegistry(ARegister: Boolean);
var
  GUID: string;
  CID: string;
begin
  inherited UpdateRegistry(ARegister);
  GUID := GUIDToString(CLSID_SNOTIFY_DESK_BAND);
  CID := 'CLSID\' + GUID;

  with TRegistry.Create do
  try
    if ARegister then
    begin
      // our deskband will be installed

      // Registers the COM component
      RootKey := HKEY_CLASSES_ROOT;
      if OpenKey(CID, True) then
      try
        WriteString('', EXPLORER_MENU_CAPTION);
      finally
        CloseKey;
      end;

      if OpenKey(CID + '\InProcServer32', True) then
      try
        WriteString('ThreadingModel', 'Apartment');
      finally
        CloseKey;
      end;

      // Create Key only
      if OpenKey(CID + '\Implemented Categories\' + REGKEY_DESK_BAND, True) then
        CloseKey;

      // Register the COM component in Internet Explorer
      RootKey := HKEY_LOCAL_MACHINE;

      if OpenKey('SOFTWARE\Microsoft\Internet Explorer\Toolbar', True) then
      try
        WriteString(GUID, '');
      finally
        CloseKey;
      end;
    end
    else
    begin
      // delete registry entries for uninstalling it
      RootKey := HKEY_CLASSES_ROOT;

      DeleteKey('Component Categories\' + REGKEY_DESK_BAND + '\Enum');
      DeleteKey(CID + '\Implemented Categories\' + REGKEY_DESK_BAND);
      DeleteKey(CID + '\InProcServer32');
      DeleteKey(CID);
      CloseKey;

      RootKey := HKEY_LOCAL_MACHINE;
      if OpenKey('SOFTWARE\Microsoft\Internet Explorer\Toolbar', False) then
      try
        DeleteValue(GUID);
      finally
        CloseKey;
      end;
    end;
  finally
    Free;
  end;
end;

{ TSnotifyDeskBand }

procedure TSnotifyDeskBand.BandWndProc(var AMsg: TMessage);
begin
  if (AMsg.Msg = WM_PARENTNOTIFY) then
  begin
    FHasFocus := True;
    FocusChange(HasFocus);
  end;
  SavedWndProc(AMsg);
end;

// Indicates the deskband's ability to be displayed as translucent.
function TSnotifyDeskBand.CanRenderComposited(
  var pfCanRenderComposited: BOOL): HRESULT;
begin
// TODO; newer method for now not implemented
  pfCanRenderComposited := True;
  Result := S_OK;
end;

function TSnotifyDeskBand.CloseDW(AReserver: DWORD): HRESULT;
begin
  HideBandForm;
  Result := S_OK;
end;

function TSnotifyDeskBand.ContextSensitiveHelp(AEnterMode: BOOL): HRESULT;
begin
  Result := E_NOTIMPL;
end;

destructor TSnotifyDeskBand.Destroy;
begin
  try
    FIE := nil;
  except
  end;

  if BandForm <> nil then
  try
    FBandForm.Free;
    FBandForm := nil;
  except
  end;

  try
    FCommandTarget := nil;
  except
  end;

  inherited Destroy;
end;

procedure TSnotifyDeskBand.FocusChange(AHasFocus: Boolean);
begin
  if Site <> nil then
    Site.OnFocusChangeIS(Self, AHasFocus);
end;

function TSnotifyDeskBand.GetBandInfo(dwBandID, dwViewMode: DWORD;
  var pdbi: TDeskBandInfo): HResult;
begin
  FBandID := dwBandID;

  if pdbi.dwMask or DBIM_MINSIZE <> 0 then
  begin
    pdbi.ptMinSize.x := 80;
    pdbi.ptMinSize.y := 22;
  end;

  if pdbi.dwMask or DBIM_MAXSIZE <> 0 then
  begin
    pdbi.ptMaxSize.x := -1;
    pdbi.ptMaxSize.y := 22;
  end;

  if pdbi.dwMask or DBIM_INTEGRAL <> 0 then
  begin
    pdbi.ptIntegral.x := 25;
    pdbi.ptIntegral.y := 22;
  end;

  if pdbi.dwMask or DBIM_ACTUAL <> 0 then
  begin
    pdbi.ptActual.x := 390;
    pdbi.ptActual.y := 22;
  end;

  if pdbi.dwMask or DBIM_MODEFLAGS <> 0 then
  begin
    pdbi.dwModeFlags := DBIMF_NORMAL or DBIMF_VARIABLEHEIGHT;
//    pdbi.dwModeFlags := DBIMF_NORMAL or DBIMF_VARIABLEHEIGHT or DBIMF_BKCOLOR;
  end;

  if pdbi.dwMask or DBIM_BKCOLOR <> 0 then
  begin
    pdbi.crBkgnd := clGreen;
  end;

  if pdbi.dwMask or DBIM_TITLE <> 0 then
  begin
    FillChar(pdbi.wszTitle, Length(pdbi.wszTitle) * SizeOf(pdbi.wszTitle[0]), #0);
    FillChar(pdbi.wszTitle, SizeOf(BAND_TITLE) + 1, ' ');
    StringToWideChar(BAND_TITLE, @pdbi.wszTitle, Length(BAND_TITLE));
  end;

  Result := NOERROR;
end;

function TSnotifyDeskBand.GetClassID(out classID: TCLSID): HResult;
begin
  classID := CLSID_SNOTIFY_DESK_BAND;
  Result := S_OK;
end;

function TSnotifyDeskBand.GetCommandString(idCmd: UINT_PTR; uFlags: UINT;
  pwReserved: PUINT; pszName: LPSTR; cchMax: UINT): HResult;
begin
  Result := NOERROR;
end;

function TSnotifyDeskBand.GetCompositionState(
  var pfCompositionEnabled: BOOL): HRESULT;
begin
// TODO; newer method for now not implemented
  pfCompositionEnabled := True;
  Result := E_NOTIMPL;
end;

function TSnotifyDeskBand.GetSite(const riid: TIID;
  out site: IInterface): HResult;
begin
  if Site <> nil then
    Result := Site.QueryInterface(riid, site)
  else
    Result := E_FAIL;
end;

function TSnotifyDeskBand.GetSizeMax(out cbSize: Largeint): HResult;
begin
  cbSize := 256;
  Result := S_OK;
end;

function TSnotifyDeskBand.GetWindow(out AWnd: HWND): HRESULT;
begin
  if BandForm = nil then
  begin
    FBandForm := TSnotiForm.CreateParented(ParentWnd);
    FBandForm.IE := IE;
  end;
  AWnd := BandForm.Handle;
  FSavedWndProc := BandForm.WindowProc;
  BandForm.WindowProc := BandWndProc;
  Result := S_OK;
end;

function TSnotifyDeskBand.HandleMenuMsg(uMsg: UINT; WParam: WPARAM;
  LParam: LPARAM): HResult;
var
  I: NativeInt;
begin
// TODO; newer method for now not implemented
  Result := HandleMenuMsg2(uMsg, WParam, LParam, I);
end;

function TSnotifyDeskBand.HandleMenuMsg2(uMsg: UINT; wParam: WPARAM;
  lParam: LPARAM; var lpResult: LRESULT): HResult;
var
  Handle: Pointer;
begin
// TODO; newer method for now not implemented
  Handle := nil;
  lpResult := NativeInt(Handle);
  Result := S_OK;
end;

function TSnotifyDeskBand.HasFocusIO: HResult;
begin
  Result := Integer(not HasFocus);
end;

procedure TSnotifyDeskBand.HideBandForm;
begin
  BandForm.Hide;
end;

procedure TSnotifyDeskBand.Initialize;
begin
  inherited Initialize;
end;

function TSnotifyDeskBand.InitNew: HResult;
begin
  Result := S_OK;
end;

function TSnotifyDeskBand.InvokeCommand(
  var lpici: TCMInvokeCommandInfo): HResult;
begin
  if (HiWord(Integer(lpici.lpVerb)) <> 0) or (LoWord(lpici.lpVerb) > Pred(MenuItemCount)) then
  begin
    Result := E_FAIL;
    Exit;
  end;

//  case LoWord(lpici.lpVerb) of
//    0:
//      BandForm.PopupMenu1.Items[0].Click;
//    //MessageBox(ParentWnd, 'Snotify DeskBand'#13#10'Author: vhanla', 'About Snotify DeskBand', 0);
//  end;
  if BandForm.PopupMenu1.Items.Count >= LoWord(lpici.lpVerb) then
  begin
    BandForm.PopupMenu1.Items[LoWord(lpici.lpVerb)].Click;
  end;

  Result := NO_ERROR;
end;

function TSnotifyDeskBand.IsDirty: HResult;
begin
  Result := S_OK;
end;

function TSnotifyDeskBand.Load(const stm: IStream): HResult;
begin
  Result := S_OK;
end;

function TSnotifyDeskBand.QueryContextMenu(Menu: HMENU; indexMenu, idCmdFirst,
  idCmdLast, uFlags: UINT): HResult;
var
  I: Integer;
begin
  FMenuItemCount := 0; //1
//  AppendMenu(Menu, MF_STRING, idCmdFirst + 0, PChar(MENU_TITLE_ABOUT));

  // Update using popup menu from form
  for I := 0 to BandForm.PopupMenu1.Items.Count - 1 do
  begin
    Inc(FMenuItemCount);
    AppendMenu(Menu, MF_STRING, idCmdFirst + I, PChar(BandForm.PopupMenu1.Items[I].Caption));
  end;
  Result := MenuItemCount;
end;

function TSnotifyDeskBand.ResizeBorderDW(var ARectBorder: TRect;
  AToolbarSite: IInterface; AReserver: BOOL): HRESULT;
begin
  Result := E_NOTIMPL;
end;

function TSnotifyDeskBand.Save(const stm: IStream; fClearDirty: BOOL): HResult;
begin
  Result := S_OK;
end;

function TSnotifyDeskBand.SetCompositionState(
  fCompositionEnabled: BOOL): HRESULT;
begin
// TODO; newer method for now not implemented
  Result := S_OK;
end;

function TSnotifyDeskBand.SetSite(const pUnkSite: IInterface): HResult;
begin
  if pUnkSite <> nil then
  begin
    FSite := pUnkSite as IInputObjectSite;
    (pUnkSite as IOleWindow).GetWindow(FParentWnd);
    FCommandTarget := pUnkSite as IOleCommandTarget;
    (CommandTarget as IServiceProvider).QueryService(IWebbrowserApp, IWebbrowser2, FIE);
  end;
  Result := S_OK;
end;

function TSnotifyDeskBand.ShowDW(AShow: BOOL): HRESULT;
begin
  FHasFocus := AShow;
  FocusChange(HasFocus);
  Result := S_OK;
end;

function TSnotifyDeskBand.TranslateAcceleratorIO(var lpMsg: TMsg): HResult;
begin
  if lpMsg.wParam <> VK_TAB then
  begin
    TranslateMessage(lpMsg);
    DispatchMessage(lpMsg);
    Result := S_OK;
  end
  else
  begin
    Result := S_FALSE;
  end;
end;

function TSnotifyDeskBand.UIActivateIO(fActivate: BOOL;
  var lpMsg: TMsg): HResult;
begin
  FHasFocus := fActivate;
  FocusChange(HasFocus);
  if HasFocus then
    if BandForm <> nil then
      BandForm.SetFocus;
  Result := S_OK;
end;

procedure TSnotifyDeskBand.UpdateBandInfo;
var
  vaIn, vaOut: OleVariant;
  PtrGuid: PGUID;
begin
  vaIn := Variant(BandID);
  New(PtrGuid);
  PtrGuid^ := IDESKBAND;
  CommandTarget.Exec(PtrGuid, DBID_BANDINFOCHANGED, OLECMDEXECOPT_DODEFAULT, vaIn, vaOut);
  Dispose(PtrGuid);
end;

initialization
  TSnotifyDeskBandFactory.Create(ComServer, TSnotifyDeskBand, CLSID_SNOTIFY_DESK_BAND, '', BAND_TITLE, ciMultiInstance);

end.
