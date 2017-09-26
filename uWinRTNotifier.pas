{
FIxed memory leak by procedure to get temporary folder
}
unit uWinRTNotifier;

interface

uses
  Winapi.Windows, Winapi.ShlObj, Winapi.ActiveX, Winapi.PropKey,
  Vcl.Forms, Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.Graphics,
  System.SysUtils, System.Classes, System.WinrtHelpers, System.Win.ComObj,
  Winapi.Data, Winapi.CommonTypes, Winapi.Winrt, Winapi.UI.Notifications;

type
  TAcceptedEventHandler = class(TInspectableObject, TypedEventHandler_2__IToastNotification__IInspectable_Delegate_Base,
    TypedEventHandler_2__IToastNotification__IInspectable)
    procedure Invoke(sender: IToastNotification; args: IInspectable); safecall;
  end;

type
  TDismissedEventHandler = class(TInspectableObject,
    TypedEventHandler_2__IToastNotification__IToastDismissedEventArgs_Delegate_Base,
    TypedEventHandler_2__IToastNotification__IToastDismissedEventArgs)
    procedure Invoke(sender: IToastNotification; args: IToastDismissedEventArgs); safecall;
  end;

type
  TFailedEventHandler = class(TInspectableObject,
    TypedEventHandler_2__IToastNotification__IToastFailedEventArgs_Delegate_Base,
    TypedEventHandler_2__IToastNotification__IToastFailedEventArgs)
    procedure Invoke(sender: IToastNotification; args: IToastFailedEventArgs); safecall;
  end;

procedure ShowNotification(ToastType: byte = 0; Title: String = ''; Body: String = ''; Comment: String = '';
  Param: String = ''; Image: TImage = nil; EventLog: TStrings = nil);

var
  Log: TStrings;

const
  sText = 'text';
  sImage = 'image';
  sLaunch = 'launch';
  sToastNotificationGUID = '{04124B20-82C6-4229-B109-FD9ED4662B53}';
  sToastNotificationManagerGUID = '{50AC103F-D235-4598-BBEF-98FE4D1A3AD4}';
  sTempImage = 'temp.png';
  sEmptyString = #$A0;

implementation

function StringToHString(Src: String; var Dest: HSTRING): Boolean;
begin
  Result := Succeeded(WindowsCreateString(PWideChar(Src), Length(Src), Dest));
end;

function HStringToString(Src: HSTRING): String;
var
  c: Cardinal;
begin
  c := WindowsGetStringLen(Src);
  Result := WindowsGetStringRawBuffer(Src, @c);
end;

function GetTempFolder: String;
var
  P: array[0..MAX_PATH] of Char;//PChar;
begin
  GetTempPath(MAX_PATH, @P);
  Result := StrPas(P);
  {try
    GetMem(P, 255);
    GetTempPath(255, P);
    Result := StrPas(P);
  finally
    FreeMem(P);
  end;}
end;

function FilePathToURL(const FilePath: string): string;
begin
  Result := 'file:///' + FilePath.Replace('\', '/');
end;

procedure ShowNotification(ToastType: byte = 0; Title: String = ''; Body: String = ''; Comment: String = '';
  Param: String = ''; Image: TImage = nil; EventLog: TStrings = nil);
var
  hs, hs1: HSTRING;
  insp: IInspectable;
  png: TPngImage;
  TempImageFile, AppID, TempText: String;
  LINotificationManagerStatics: IToastNotificationManagerStatics;
  LXMLTemplate: Xml_Dom_IXmlDocument;
  LXMLNodeList: Xml_Dom_IXmlNodeList;
  LToast: IToastNotification;
  LAccepted: TAcceptedEventHandler;
  LDismissed: TDismissedEventHandler;
  LFailed: TFailedEventHandler;
  TempImage: TImage;
begin
  Log := EventLog;
  if TOSVersion.Major >= 10 then
  begin
    if Trim(Title) = '' then
      Title := sEmptyString;
    if Trim(Body) = '' then
      Body := sEmptyString;
    if Trim(Comment) = '' then
      Comment := sEmptyString;
    if Trim(Param) = '' then
      Param := sEmptyString;
    if StringToHString(SToastNotificationManager, hs) then
      if Succeeded(RoGetActivationFactory(hs, TGUID.Create(sToastNotificationManagerGUID), insp)) then
      begin
        LINotificationManagerStatics := IToastNotificationManagerStatics(insp);
        begin
          case ToastType of
            0:
              LXMLTemplate := LINotificationManagerStatics.GetTemplateContent(ToastTemplateType.ToastImageAndText01);
            1:
              LXMLTemplate := LINotificationManagerStatics.GetTemplateContent(ToastTemplateType.ToastImageAndText02);
            2:
              LXMLTemplate := LINotificationManagerStatics.GetTemplateContent(ToastTemplateType.ToastImageAndText03);
            3:
              LXMLTemplate := LINotificationManagerStatics.GetTemplateContent(ToastTemplateType.ToastImageAndText04);
            4:
              LXMLTemplate := LINotificationManagerStatics.GetTemplateContent(ToastTemplateType.ToastText01);
            5:
              LXMLTemplate := LINotificationManagerStatics.GetTemplateContent(ToastTemplateType.ToastText02);
            6:
              LXMLTemplate := LINotificationManagerStatics.GetTemplateContent(ToastTemplateType.ToastText03);
            7:
              LXMLTemplate := LINotificationManagerStatics.GetTemplateContent(ToastTemplateType.ToastText04);
          end;

          if StringToHString(sText, hs) then
            LXMLNodeList := LXMLTemplate.GetElementsByTagName(hs);

          if ToastType in [0, 4] then
            TempText := Body
          else
            TempText := Title;
          if StringToHString(TempText, hs) then
            LXMLNodeList.Item(0).AppendChild(Xml_Dom_IXmlNode(LXMLTemplate.CreateTextNode(hs)));

          if (not(ToastType in [0, 4])) AND StringToHString(Body, hs) then
            LXMLNodeList.Item(1).AppendChild(Xml_Dom_IXmlNode(LXMLTemplate.CreateTextNode(hs)));

          if (ToastType in [3, 7]) AND StringToHString(Comment, hs) then
            LXMLNodeList.Item(2).AppendChild(Xml_Dom_IXmlNode(LXMLTemplate.CreateTextNode(hs)));

          if (ToastType < 4) AND StringToHString(sImage, hs) then
          begin
            LXMLNodeList := LXMLTemplate.GetElementsByTagName(hs);
            TempImageFile := GetTempFolder + sTempImage;
            png := TPngImage.Create;
            if (Image = nil) OR (Image.Picture.Icon.Handle <> 0) then
            begin
              TempImage := TImage.Create(nil);
              if Image = nil then
                TempImage.Picture.Bitmap.Assign(Application.Icon)
              else
                TempImage.Picture.Bitmap.Assign(Image.Picture.Icon);
              png.Assign(TempImage.Picture.Bitmap);
              png.TransparentColor := clBlack;
              png.Transparent := True;
              TempImage.Free;
            end
            else
              png.Assign(Image.Picture.Graphic);
            png.SaveToFile(TempImageFile);
            png.Free;
            TempImageFile := FilePathToURL(TempImageFile);
            if StringToHString(TempImageFile, hs) then
              LXMLNodeList.Item(0).Attributes.Item(1).AppendChild(Xml_Dom_IXmlNode(LXMLTemplate.CreateTextNode(hs)));
            DeleteFile(TempImageFile);
          end;

          if StringToHString(sLaunch, hs) and StringToHString(Param, hs1) then
            LXMLTemplate.DocumentElement.SetAttribute(hs, hs1);
          if StringToHString(SToastNotification, hs) then
          begin
            if Succeeded(RoGetActivationFactory(hs, TGUID.Create(sToastNotificationGUID), insp)) then
              LToast := IToastNotificationFactory(insp).CreateToastNotification(LXMLTemplate);
            if Log <> nil then
            begin
              LAccepted := TAcceptedEventHandler.Create;
              LToast.add_Activated(LAccepted);
              LDismissed := TDismissedEventHandler.Create;
              LToast.add_Dismissed(LDismissed);
              LFailed := TFailedEventHandler.Create;
              LToast.add_Failed(LFailed);
            end;
            AppID := Application.Title;
            if Trim(AppID) = '' then
              AppID := sEmptyString;
            if StringToHString(AppID, hs) then
              LINotificationManagerStatics.CreateToastNotifier(hs).Show(LToast);
          end;
        end;
      end;
  end
  else if Log <> nil then
    Log.Add('Need Windows 10 or more');
end;

function GetDesktopFolder: string;
var
  PIDList: PItemIDList;
  Buffer: array [0 .. MAX_PATH - 1] of Char;
begin
  Result := '';
  SHGetSpecialFolderLocation(Application.Handle, CSIDL_DESKTOP, PIDList);
  if Assigned(PIDList) then
    if SHGetPathFromIDList(PIDList, Buffer) then
      Result := Buffer;
end;

function GetStartMenuFolder: string;
var
  Buffer: array [0 .. MAX_PATH - 1] of Char;
begin
  Result := '';
  GetEnvironmentVariable(PChar('APPDATA'), Buffer, MAX_PATH - 1);
  Result := Buffer + '\Microsoft\Windows\Start Menu\Programs\Desktop Delphi Toasts App.lnk';
end;

function CreateDesktopShellLink(const TargetName: string): Boolean;
var
  IObject: IUnknown;
  ISLink: IShellLink;
  IPFile: IPersistFile;
  LinkName: string;

  LStore: IPropertyStore;
  LValue: TPropVariant;
begin
  Result := False;

  IObject := CreateComObject(CLSID_ShellLink);
  ISLink := IObject as IShellLink;
  IPFile := IObject as IPersistFile;
  LStore := IObject as IPropertyStore;

  with ISLink do
  begin
    SetPath(PChar(Application.ExeName));
  end;
  ISLink.SetArguments(PChar(''));

  if Succeeded(InitPropVariantFromStringAsVector(PWideChar('Delphi.DesktopNotification.Sample'), LValue)) then
  begin
    if Succeeded(LStore.SetValue(PKEY_AppUserModel_ID, LValue)) then
      LStore.Commit;
  end;

  LinkName := GetStartMenuFolder;

  if not FileExists(LinkName) then
    if IPFile.Save(PWideChar(LinkName), True) = S_OK then
      Result := True;
end;

procedure TAcceptedEventHandler.Invoke(sender: IToastNotification; args: IInspectable);
var
  hs: HSTRING;
begin
  if StringToHString(sLaunch, hs) then
    Log.Add('Aaccepted with param: ' + HStringToString(sender.Content.DocumentElement.GetAttribute(hs)));
end;

procedure TDismissedEventHandler.Invoke(sender: IToastNotification; args: IToastDismissedEventArgs);
var
  s: String;
  hs: HSTRING;
begin
  if StringToHString(sLaunch, hs) then
  begin
    case Integer(args.Reason) of
      0:
        s := 'user canceled';
      1:
        s := 'application hidden';
      2:
        s := 'timed out';
    end;
    Log.Add('Dismissed by ' + s + ' with param: ' + HStringToString(sender.Content.DocumentElement.GetAttribute(hs)));
  end;
end;

procedure TFailedEventHandler.Invoke(sender: IToastNotification; args: IToastFailedEventArgs);
var
  hs: HSTRING;
begin
  if StringToHString(sLaunch, hs) then
    Log.Add('Failed, error code 0x' + IntToHex(args.ErrorCode, 8) + ' with param: ' +
      HStringToString(sender.Content.DocumentElement.GetAttribute(hs)));
end;

initialization

if TOSVersion.Major >= 10 then
begin
  RoInitialize(RO_INIT_MULTITHREADED);
  CreateDesktopShellLink(Application.ExeName);
end;

end.
