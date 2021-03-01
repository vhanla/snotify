{
  Common function moved here from other forms/units
}
unit functions;

interface

uses
  Winapi.Windows, System.SysUtils, Vcl.Forms, Vcl.StdCtrls, System.Classes, Vcl.Controls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Graphics, Spotify, Vcl.Dialogs,
  OverbyteIcsHttpProt, OverbyteIcsWndControl, iTunes,
  OverbyteIcsMultipartHttpDownloader, OverbyteIcsWSocket, syncrossplatformjson, jpeg,
  Vcl.ComCtrls, CommCtrl, ShellApi, SkinEngine, Winapi.Messages,
  Vcl.OleServer, SpeechLib_TLB, timeteller,
  JvComponentBase, JvId3v1, VirtualTrees, Vcl.Menus, System.StrUtils, SynCommons, frmAbout,
  System.ImageList, Vcl.ImgList, Vcl.OleCtrls, IdHashMessageDigest,
  System.Win.TaskbarCore, Vcl.Taskbar;

function HashString(const Text: string): string;
function ValidPath(srcPath: string; out destPath: string):Boolean;
function GetImageListSH(SHIL_FLAG: Cardinal): HIMAGELIST;
function GetIconFromFile(aFile: string; var aIcon: TIcon; SHIL_FLAG: Cardinal): Boolean;
function EncodeURIComponent(const ASrc: string): string;

implementation

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


end.
