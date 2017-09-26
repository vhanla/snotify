unit Winapi.WinRT;

interface

uses
  Winapi.Cor,
  Winapi.CorHdr;

///// Strings
type
  PNZWCH = PWideChar;
  PCNZWCH = PWideChar;
  PUNZWCH = PWideChar;
  PCUNZWCH = PWideChar;
  PCWSTR = PWideChar;
  PCSTR = PWideChar;
  PPCWSTR = ^PCWSTR;
  HSTRING = type THandle;
  {$POINTERMATH ON}
  PHSTRING = ^HSTRING;
  {$POINTERMATH OFF}
  PPHSTRING = ^PHSTRING;
  HSTRING_BUFFER = type THandle;
  HSTRING_HEADER = record
    Reserved:
      record
        case Integer of
          0: (Reserved1: Pointer);
          1:
{$IFDEF WIN64}
              (Reserved2: array[0..23] of AnsiChar);
{$ELSE}
              (Reserved2: array[0..19] of AnsiChar);
{$ENDIF}
        end;
  end;
  PHSTRING_HEADER = ^HSTRING_HEADER;


function WindowsCreateString(sourceString: PCNZWCH; length: UINT32; out Str: HSTRING): HRESULT; stdcall;

function WindowsCreateStringReference(sourceString: PCWSTR; length: UINT32;
  out hstringHeader: HSTRING_HEADER; out str: HSTRING): HRESULT; stdcall;

function WindowsDeleteString(Str: HSTRING): HRESULT; stdcall;

function WindowsDuplicateString(str: HSTRING; out newStr: HSTRING): HRESULT; stdcall;

function WindowsGetStringLen(str: HSTRING): UINT32; stdcall;

function WindowsGetStringRawBuffer(str: HSTRING; len: PCardinal): PCWSTR; stdcall;

function WindowsIsStringEmpty(str: HSTRING): LONGBOOL;

function WindowsStringHasEmbeddedNull(str: HSTRING; out hasEmbededNull: LONGBOOL): HRESULT; stdcall;

function WindowsCompareStringOrdinal(string1, string2: HSTRING; out res: UINT32): HRESULT; stdcall;

function WindowsSubstring(str: HSTRING; startIndex: UINT32; out newString: HSTRING): HRESULT; stdcall;

function WindowsSubstringWithSpecifiedLength(str: HSTRING; startIndex, length: UINT32; out newString: HSTRING): HRESULT; stdcall;

function WindowsConcatString(string1, string2: HSTRING; out newString: HSTRING): HRESULT; stdcall;

function WindowsReplaceString(str, stringReplaced, stringReplacedWith: HSTRING; out newString: HSTRING): HRESULT; stdcall;

function WindowsTrimStringStart(str, trimString: HSTRING; out newString: HSTRING): HRESULT; stdcall;

function WindowsTrimStringEnd(str, trimString: HSTRING; out newString: HSTRING): HRESULT; stdcall;

// Two-phase construction

function WindowsPreallocateStringBuffer(length: UINT32; out charBuffer: PWideChar;
  out bufferHandle: HSTRING_BUFFER): HRESULT; stdcall;

function WindowsPromoteStringBuffer(bufferHandle: HSTRING_BUFFER; out str: HSTRING): HRESULT; stdcall;

function WindowsDeleteStringBuffer(bufferHandle: HSTRING_BUFFER): HRESULT; stdcall;

// HSTRING Inspection

type
  ROPARAMIIDHANDLE = type THandle;
  PROPARAMIIDHANDLE = ^ROPARAMIIDHANDLE;
  PINSPECT_HSTRING_CALLBACK = function(context: Pointer; readAddress: NativeUInt{PTR};
    length: UINT32; buffer: PBYTE): HRESULT; stdcall;

function WindowsInspectString(targetHString: NativeUInt; machine: USHORT;
  callback: PINSPECT_HSTRING_CALLBACK; context: Pointer; out length: UINT32): HRESULT; stdcall;

///// Roparameterizediid.h

type
  TRoSimpleMetaDataBuilder = class
    function SetWinRtInterface(iid: TGuid): HRESULT; virtual; stdcall; abstract;
    function SetDelegate(iid: TGuid): HRESULT; virtual; stdcall; abstract;
    function SetInterfaceGroupSimpleDefault(name, defaultInterfaceName: PCWSTR;
      defaultInterfaeceIID: PGUID): HRESULT; virtual; stdcall; abstract;
    function SetInterfaceGroupParameterizedDefault(name: PCWSTR;
      elemetCount: UINT32; defaultInterfaceNameElements: PPCWSTR): HRESULT; virtual; stdcall; abstract;
    function SetRuntimeClassSimpleDefault(name, defaultInterfaceName: PCWSTR;
      defaultInterfaceIID: PGUID): HRESULT; virtual; stdcall; abstract;
    function SetRuntimeClassParameterizedDefault(name: PCWSTR;
      elementCount: UINT32; defaultInterfaceNameElements: PPCWSTR): HRESULT; virtual; stdcall; abstract;
    function SetStruct(name: PCWSTR; numFields: UINT32;
      fieldTypeNames: PPCWSTR): HRESULT; virtual; stdcall; abstract;
    function SetEnum(name, basetype: PCWSTR): HRESULT; virtual; stdcall; abstract;
    function SetParameterizedInterface(piid: TGuid; numArgs: UINT32): HRESULT; virtual; stdcall; abstract;
    function SetParameterizedDelegate(piid: TGuid; numArgs: UINT32): HRESULT; virtual; stdcall; abstract;
  end;

  TRoMetaDataLocator = class
  protected
    function Locate(nameElement: PCWSTR;
      metaDataDestination: TRoSimpleMetaDataBuilder): HRESULT; virtual; stdcall; abstract;
  end;

function RoGetParameterizedTypeInstanceIID(nameElementCount: UINT32; nameElements: PPCWSTR;
  const metaDataLocator: TRoMetaDataLocator; iid: PGUID; pExtra: PROPARAMIIDHANDLE): HRESULT; stdcall;

procedure RoFreeParameterizedTypeExtra(extra: ROPARAMIIDHANDLE); stdcall;

function RoParameterizedTypeExtraGetTypeSignature(extra: ROPARAMIIDHANDLE): PCSTR; stdcall;

///// roapi.h
type
  RO_INIT_TYPE = (RO_INIT_SINGLETHREADED, RO_INIT_MULTITHREADED);
  TrustLevel = (BaseTrust, PartialTrust	= (BaseTrust + 1), FullTrust = (PartialTrust + 1));
  IInspectable = interface
    ['{AF86E2E0-B12D-4c6a-9C5A-D7AA65101E90}']
    function GetIids(out iidCount: Cardinal; out iids: PGUID): HRESULT; stdcall;
    function GetRuntimeClassName(out className: HSTRING): HRESULT; stdcall;
    function GetTrustLevel(out trust: TrustLevel): HRESULT; stdcall;
  end;

  IActivationFactory = interface(IInspectable)
    ['{00000035-0000-0000-C000-000000000046}']
    function ActivateInstance(out instance: IInspectable): HRESULT; stdcall;
  end;
  PIInspectable = ^IInspectable;


function RoInitialize(InitType: RO_INIT_TYPE): HRESULT; stdcall;

procedure RoUninitialize; stdcall;

function RoActivateInstance(activatableClassId: HSTRING; out instance: IInspectable): HRESULT; stdcall;

type
  PFNGETACTIVATIONFACTORY = function(activatableClassId: HSTRING; out factory: IActivationFactory): HRESULT; stdcall;
  PPFNGETACTIVATIONFACTORY = ^PFNGETACTIVATIONFACTORY;
  RO_REGISTRATION_COOKIE = record end;
  PRO_REGISTRATION_COOKIE = ^RO_REGISTRATION_COOKIE;

function RoRegisterActivationFactories(activatableClassIds: PHSTRING; activationFactoryCallbacks: PPFNGETACTIVATIONFACTORY;
  count: UINT32; cookie:PRO_REGISTRATION_COOKIE): HRESULT; stdcall;

function RoRevokeActivationFactories(cookie: RO_REGISTRATION_COOKIE): HRESULT; stdcall;

function RoGetActivationFactory(activatableClassId: HSTRING; const iid: TGUID;
  out outfactory: IInspectable): HRESULT; stdcall;

///// roregistrationapi.h
//TODO: RoGetActivatableClassRegistration
//TODO: RoGetServerActivatableClasses

///// robuffer.h
//TODO: RoGetBufferMarshaler

///// rometadataresolution.h
type
  PIMetaDataImport2 = ^IMetaDataImport2;

function RoGetMetaDataFile(const name: HSTRING; const metaDataDispenser: IMetaDataDispenserEx;
  metaDataFilePath: PHSTRING; metaDataImport: PIMetaDataImport2; mdTypeDef: pmdTypeDef): HRESULT; stdcall;

function RoParseTypeName(typename: HSTRING; out partsCount: Cardinal; typeNameParts: PPHSTRING): HRESULT; stdcall;

function RoResolveNamespace(name: HSTRING; windowsMetaDataDir: HSTRING; packageGraphDirsCount: Cardinal;
  packageGraphDirs: PHSTRING; metaDataFilePathsCount: PCardinal; metaDataFilePaths: PPHSTRING;
  subNamespacesCount: PCardinal; subNamespaces: PPHSTRING): HRESULT; stdcall;

///// rometadata.h
//TODO: MetaDataGetDispenser

///// roerrorapi.h
//TODO: RoGetErrorReportingFlags
//TODO: RoSetErrorReportingFlags
//TODO: RoResolveRestrictedErrorInfoReference
//TODO: RoOriginateError
//TODO: RoOriginateErrorW
//TODO: RoTransformError
//TODO: RoTransformErrorW

implementation

const
  winrtstring           = 'api-ms-win-core-winrt-string-l1-1-0.dll';
  winrtparameterizediid = 'api-ms-win-core-winrt-roparameterizediid-l1-1-0.dll';
  winrtcore             = 'api-ms-win-core-winrt-l1-1-0.dll';
  rotyperesolution      = 'api-ms-win-ro-typeresolution-l1-1-0.dll';

function WindowsCreateString; external winrtstring name 'WindowsCreateString' delayed;
function WindowsCreateStringReference; external winrtstring name 'WindowsCreateStringReference' delayed;
function WindowsDeleteString; external winrtstring name 'WindowsDeleteString' delayed;
function WindowsDuplicateString; external winrtstring name 'WindowsDuplicateString' delayed;
function WindowsGetStringLen; external winrtstring name 'WindowsGetStringLen' delayed;
function WindowsGetStringRawBuffer; external winrtstring name 'WindowsGetStringRawBuffer' delayed;
function WindowsIsStringEmpty; external winrtstring name 'WindowsIsStringEmpty' delayed;
function WindowsStringHasEmbeddedNull; external winrtstring name 'WindowsStringHasEmbeddedNull';
function WindowsCompareStringOrdinal; external winrtstring name 'WindowsCompareStringOrdinal' delayed;
function WindowsSubstring; external winrtstring name 'WindowsSubString' delayed;
function WindowsSubstringWithSpecifiedLength; external winrtstring name 'WindowsSubstringWithSpecifiedLength' delayed;
function WindowsConcatString; external winrtstring name 'WindowsConcatString' delayed;
function WindowsReplaceString; external winrtstring name 'WindowsReplaceString' delayed;
function WindowsTrimStringStart; external winrtstring name 'WindowsTrimStringStart' delayed;
function WindowsTrimStringEnd; external winrtstring name 'WindowsTrimStringEnd' delayed;

// Two-phase construction
function WindowsPreallocateStringBuffer; external winrtstring name 'WindowsPreallocateStringBuffer' delayed;
function WindowsPromoteStringBuffer; external winrtstring name 'WindowsPromoteStringBuffer' delayed;
function WindowsDeleteStringBuffer; external winrtstring name 'WindowsDeleteStringBuffer' delayed;

// HSTRING Inspection
function WindowsInspectString; external winrtstring name 'WindowsInspectString' delayed;

function RoGetParameterizedTypeInstanceIID; external winrtparameterizediid name 'RoGetParameterizedTypeInstanceIID' delayed;
procedure RoFreeParameterizedTypeExtra; external winrtparameterizediid name 'RoFreeParameterizedTypeExtra' delayed;
function RoParameterizedTypeExtraGetTypeSignature; external winrtparameterizediid name 'RoParameterizedTypeExtraGetTypeSignature' delayed;

function RoInitialize; external winrtcore name 'RoInitialize' delayed;
procedure RoUninitialize; external winrtcore name 'RoUninitialize' delayed;

function RoActivateInstance; external winrtcore name 'RoActivateInstance' delayed;
function RoRegisterActivationFactories; external winrtcore name 'RoRegisterActivationFactories' delayed;
function RoRevokeActivationFactories; external winrtcore name 'RoRevokeActivationFactories' delayed;
function RoGetActivationFactory; external winrtcore name 'RoGetActivationFactory' delayed;

function RoGetMetaDataFile; external rotyperesolution name 'RoGetMetaDataFile' delayed;
function RoParseTypeName; external rotyperesolution name 'RoParseTypeName' delayed;
function RoResolveNamespace; external rotyperesolution name 'RoResolveNamespace' delayed;

///// rometadata.h
//TODO: MetaDataGetDispenser

///// roerrorapi.h
//TODO: RoGetErrorReportingFlags
//TODO: RoSetErrorReportingFlags
//TODO: RoResolveRestrictedErrorInfoReference
//TODO: RoOriginateError
//TODO: RoOriginateErrorW
//TODO: RoTransformError
//TODO: RoTransformErrorW





end.
