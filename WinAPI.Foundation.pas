{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2015-2015 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit WinAPI.Foundation;

interface
uses 
  // Fixed Uses...
  // Internal Uses...
  WinAPI.Foundation.Types,
  Winapi.Winrt,
  System.Types;


{$SCOPEDENUMS ON}

const
  // Windows.Foundation Class Names
  // Windows.Foundation.PropertyValue
  // DualAPI
  SPropertyValue = 'Windows.Foundation.PropertyValue';
  // Windows.Foundation.Deferral
  // DualAPI
  SDeferral = 'Windows.Foundation.Deferral';
  // Windows.Foundation.WwwFormUrlDecoder
  // DualAPI
  SWwwFormUrlDecoder = 'Windows.Foundation.WwwFormUrlDecoder';
  // Windows.Foundation.Uri
  // DualAPI
  SUri = 'Windows.Foundation.Uri';
  // Windows.Foundation.WwwFormUrlDecoderEntry
  // DualAPI
  SWwwFormUrlDecoderEntry = 'Windows.Foundation.WwwFormUrlDecoderEntry';
  // Windows.Foundation.MemoryBuffer
  // WinRT Only
  SMemoryBuffer = 'Windows.Foundation.MemoryBuffer';


type

  // Forward declare interfaces
  // Windows.Foundation.IClosable
  IClosable = interface;
  PIClosable = ^IClosable;

  // Windows.Foundation.IPropertyValue
  IPropertyValue = interface;
  PIPropertyValue = ^IPropertyValue;

  // Windows.Foundation.IPropertyValueStatics
  IPropertyValueStatics = interface;
  PIPropertyValueStatics = ^IPropertyValueStatics;

  // Windows.Foundation.IStringable
  IStringable = interface;
  PIStringable = ^IStringable;


  // Windows.Foundation.IAsyncInfo
  IAsyncInfo = interface;
  PIAsyncInfo = ^IAsyncInfo;



  // Windows.Foundation.IAsyncAction
  IAsyncAction = interface;
  PIAsyncAction = ^IAsyncAction;

  // Windows.Foundation.AsyncActionCompletedHandler
  AsyncActionCompletedHandler = interface;
  PAsyncActionCompletedHandler = ^AsyncActionCompletedHandler;

  // Windows.Foundation.IDeferral
  IDeferral = interface;
  PIDeferral = ^IDeferral;

  // Windows.Foundation.DeferralCompletedHandler
  DeferralCompletedHandler = interface;
  PDeferralCompletedHandler = ^DeferralCompletedHandler;

  // Windows.Foundation.IDeferralFactory
  IDeferralFactory = interface;
  PIDeferralFactory = ^IDeferralFactory;

  // Windows.Foundation.IWwwFormUrlDecoderEntry
  IWwwFormUrlDecoderEntry = interface;
  PIWwwFormUrlDecoderEntry = ^IWwwFormUrlDecoderEntry;

  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.IWwwFormUrlDecoderEntry>
  IIterator_1__IWwwFormUrlDecoderEntry = interface;
  PIIterator_1__IWwwFormUrlDecoderEntry = ^IIterator_1__IWwwFormUrlDecoderEntry;

  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.IWwwFormUrlDecoderEntry>
  IIterable_1__IWwwFormUrlDecoderEntry = interface;
  PIIterable_1__IWwwFormUrlDecoderEntry = ^IIterable_1__IWwwFormUrlDecoderEntry;

  // Windows.Foundation.IWwwFormUrlDecoderRuntimeClass
  IWwwFormUrlDecoderRuntimeClass = interface;
  PIWwwFormUrlDecoderRuntimeClass = ^IWwwFormUrlDecoderRuntimeClass;

  // Windows.Foundation.IUriRuntimeClass
  IUriRuntimeClass = interface;
  PIUriRuntimeClass = ^IUriRuntimeClass;

  // Windows.Foundation.IUriRuntimeClassWithAbsoluteCanonicalUri
  IUriRuntimeClassWithAbsoluteCanonicalUri = interface;
  PIUriRuntimeClassWithAbsoluteCanonicalUri = ^IUriRuntimeClassWithAbsoluteCanonicalUri;

  // Windows.Foundation.IUriEscapeStatics
  IUriEscapeStatics = interface;
  PIUriEscapeStatics = ^IUriEscapeStatics;

  // Windows.Foundation.IUriRuntimeClassFactory
  IUriRuntimeClassFactory = interface;
  PIUriRuntimeClassFactory = ^IUriRuntimeClassFactory;

  // Windows.Foundation.IWwwFormUrlDecoderRuntimeClassFactory
  IWwwFormUrlDecoderRuntimeClassFactory = interface;
  PIWwwFormUrlDecoderRuntimeClassFactory = ^IWwwFormUrlDecoderRuntimeClassFactory;

  // Windows.Foundation.IGetActivationFactory
  IGetActivationFactory = interface;
  PIGetActivationFactory = ^IGetActivationFactory;

  // Windows.Foundation.TypedEventHandler`2<Windows.Foundation.IMemoryBufferReference,Object>
  TypedEventHandler_2__IMemoryBufferReference__IInspectable = interface;
  PTypedEventHandler_2__IMemoryBufferReference__IInspectable = ^TypedEventHandler_2__IMemoryBufferReference__IInspectable;

  // Windows.Foundation.IMemoryBufferReference
  IMemoryBufferReference = interface;
  PIMemoryBufferReference = ^IMemoryBufferReference;

  // Windows.Foundation.IMemoryBuffer
  IMemoryBuffer = interface;
  PIMemoryBuffer = ^IMemoryBuffer;

(*
  // Windows.Foundation.IMemoryBufferFactory
  IMemoryBufferFactory = interface;
  PIMemoryBufferFactory = ^IMemoryBufferFactory;

*)

  // Windows.Foundation.AsyncOperationProgressHandler`2<UInt32,UInt32>
  AsyncOperationProgressHandler_2__Cardinal__Cardinal = interface;
  PAsyncOperationProgressHandler_2__Cardinal__Cardinal = ^AsyncOperationProgressHandler_2__Cardinal__Cardinal;

  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<UInt32,UInt32>
  AsyncOperationWithProgressCompletedHandler_2__Cardinal__Cardinal = interface;
  PAsyncOperationWithProgressCompletedHandler_2__Cardinal__Cardinal = ^AsyncOperationWithProgressCompletedHandler_2__Cardinal__Cardinal;

  // Windows.Foundation.IAsyncOperationWithProgress`2<UInt32,UInt32>
  IAsyncOperationWithProgress_2__Cardinal__Cardinal = interface;
  PIAsyncOperationWithProgress_2__Cardinal__Cardinal = ^IAsyncOperationWithProgress_2__Cardinal__Cardinal;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Boolean>
  AsyncOperationCompletedHandler_1__Boolean = interface;
  PAsyncOperationCompletedHandler_1__Boolean = ^AsyncOperationCompletedHandler_1__Boolean;

  // Windows.Foundation.IAsyncOperation`1<Boolean>
  IAsyncOperation_1__Boolean = interface;
  PIAsyncOperation_1__Boolean = ^IAsyncOperation_1__Boolean;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<String>
  AsyncOperationCompletedHandler_1__HSTRING = interface;
  PAsyncOperationCompletedHandler_1__HSTRING = ^AsyncOperationCompletedHandler_1__HSTRING;

  // Windows.Foundation.IAsyncOperation`1<String>
  IAsyncOperation_1__HSTRING = interface;
  PIAsyncOperation_1__HSTRING = ^IAsyncOperation_1__HSTRING;

  // Windows.Foundation.IReference`1<Windows.Foundation.TimeSpan>
  IReference_1__TimeSpan = interface;
  PIReference_1__TimeSpan = ^IReference_1__TimeSpan;

  // Windows.Foundation.IReference`1<UInt32>
  IReference_1__Cardinal = interface;
  PIReference_1__Cardinal = ^IReference_1__Cardinal;

  // Windows.Foundation.IReference`1<Windows.Foundation.DateTime>
  IReference_1__DateTime = interface;
  PIReference_1__DateTime = ^IReference_1__DateTime;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Int32>
  AsyncOperationCompletedHandler_1__Integer = interface;
  PAsyncOperationCompletedHandler_1__Integer = ^AsyncOperationCompletedHandler_1__Integer;

  // Windows.Foundation.IAsyncOperation`1<Int32>
  IAsyncOperation_1__Integer = interface;
  PIAsyncOperation_1__Integer = ^IAsyncOperation_1__Integer;

  // Windows.Foundation.IReference`1<Int32>
  IReference_1__Integer = interface;
  PIReference_1__Integer = ^IReference_1__Integer;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Object>
  AsyncOperationCompletedHandler_1__IInspectable = interface;
  PAsyncOperationCompletedHandler_1__IInspectable = ^AsyncOperationCompletedHandler_1__IInspectable;

  // Windows.Foundation.IAsyncOperation`1<Object>
  IAsyncOperation_1__IInspectable = interface;
  PIAsyncOperation_1__IInspectable = ^IAsyncOperation_1__IInspectable;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.IUriRuntimeClass>
  AsyncOperationCompletedHandler_1__IUriRuntimeClass = interface;
  PAsyncOperationCompletedHandler_1__IUriRuntimeClass = ^AsyncOperationCompletedHandler_1__IUriRuntimeClass;

  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.IUriRuntimeClass>
  IAsyncOperation_1__IUriRuntimeClass = interface;
  PIAsyncOperation_1__IUriRuntimeClass = ^IAsyncOperation_1__IUriRuntimeClass;

  // Windows.Foundation.EventHandler`1<Object>
  EventHandler_1__IInspectable = interface;
  PEventHandler_1__IInspectable = ^EventHandler_1__IInspectable;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<UInt32>
  AsyncOperationCompletedHandler_1__Cardinal = interface;
  PAsyncOperationCompletedHandler_1__Cardinal = ^AsyncOperationCompletedHandler_1__Cardinal;

  // Windows.Foundation.IAsyncOperation`1<UInt32>
  IAsyncOperation_1__Cardinal = interface;
  PIAsyncOperation_1__Cardinal = ^IAsyncOperation_1__Cardinal;

  // Windows.Foundation.IReference`1<UInt64>
  IReference_1__UInt64 = interface;
  PIReference_1__UInt64 = ^IReference_1__UInt64;

  // Windows.Foundation.IReference`1<UInt8>
  IReference_1__Byte = interface;
  PIReference_1__Byte = ^IReference_1__Byte;

  // Windows.Foundation.IReference`1<Int16>
  IReference_1__SmallInt = interface;
  PIReference_1__SmallInt = ^IReference_1__SmallInt;

  // Windows.Foundation.IReference`1<Double>
  IReference_1__Double = interface;
  PIReference_1__Double = ^IReference_1__Double;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Guid>
  AsyncOperationCompletedHandler_1__TGuid = interface;
  PAsyncOperationCompletedHandler_1__TGuid = ^AsyncOperationCompletedHandler_1__TGuid;

  // Windows.Foundation.IAsyncOperation`1<Guid>
  IAsyncOperation_1__TGuid = interface;
  PIAsyncOperation_1__TGuid = ^IAsyncOperation_1__TGuid;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Int64>
  AsyncOperationCompletedHandler_1__Int64 = interface;
  PAsyncOperationCompletedHandler_1__Int64 = ^AsyncOperationCompletedHandler_1__Int64;

  // Windows.Foundation.IAsyncOperation`1<Int64>
  IAsyncOperation_1__Int64 = interface;
  PIAsyncOperation_1__Int64 = ^IAsyncOperation_1__Int64;

  // Windows.Foundation.IReference`1<Int64>
  IReference_1__Int64 = interface;
  PIReference_1__Int64 = ^IReference_1__Int64;

  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.IUriRuntimeClass>
  IIterator_1__IUriRuntimeClass = interface;
  PIIterator_1__IUriRuntimeClass = ^IIterator_1__IUriRuntimeClass;

  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.IUriRuntimeClass>
  IIterable_1__IUriRuntimeClass = interface;
  PIIterable_1__IUriRuntimeClass = ^IIterable_1__IUriRuntimeClass;

  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.TimeSpan>
  IIterator_1__TimeSpan = interface;
  PIIterator_1__TimeSpan = ^IIterator_1__TimeSpan;

  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.TimeSpan>
  IIterable_1__TimeSpan = interface;
  PIIterable_1__TimeSpan = ^IIterable_1__TimeSpan;

  // Windows.Foundation.IReference`1<Single>
  IReference_1__Single = interface;
  PIReference_1__Single = ^IReference_1__Single;

  // Windows.Foundation.IReference`1<Boolean>
  IReference_1__Boolean = interface;
  PIReference_1__Boolean = ^IReference_1__Boolean;

  // Windows.Foundation.AsyncActionProgressHandler`1<Double>
  AsyncActionProgressHandler_1__Double = interface;
  PAsyncActionProgressHandler_1__Double = ^AsyncActionProgressHandler_1__Double;

  // Windows.Foundation.AsyncActionWithProgressCompletedHandler`1<Double>
  AsyncActionWithProgressCompletedHandler_1__Double = interface;
  PAsyncActionWithProgressCompletedHandler_1__Double = ^AsyncActionWithProgressCompletedHandler_1__Double;

  // Windows.Foundation.IAsyncActionWithProgress`1<Double>
  IAsyncActionWithProgress_1__Double = interface;
  PIAsyncActionWithProgress_1__Double = ^IAsyncActionWithProgress_1__Double;

  // Windows.Foundation.AsyncOperationProgressHandler`2<UInt64,UInt64>
  AsyncOperationProgressHandler_2__UInt64__UInt64 = interface;
  PAsyncOperationProgressHandler_2__UInt64__UInt64 = ^AsyncOperationProgressHandler_2__UInt64__UInt64;

  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<UInt64,UInt64>
  AsyncOperationWithProgressCompletedHandler_2__UInt64__UInt64 = interface;
  PAsyncOperationWithProgressCompletedHandler_2__UInt64__UInt64 = ^AsyncOperationWithProgressCompletedHandler_2__UInt64__UInt64;

  // Windows.Foundation.IAsyncOperationWithProgress`2<UInt64,UInt64>
  IAsyncOperationWithProgress_2__UInt64__UInt64 = interface;
  PIAsyncOperationWithProgress_2__UInt64__UInt64 = ^IAsyncOperationWithProgress_2__UInt64__UInt64;

  // Windows.Foundation.AsyncOperationProgressHandler`2<String,UInt64>
  AsyncOperationProgressHandler_2__HSTRING__UInt64 = interface;
  PAsyncOperationProgressHandler_2__HSTRING__UInt64 = ^AsyncOperationProgressHandler_2__HSTRING__UInt64;

  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<String,UInt64>
  AsyncOperationWithProgressCompletedHandler_2__HSTRING__UInt64 = interface;
  PAsyncOperationWithProgressCompletedHandler_2__HSTRING__UInt64 = ^AsyncOperationWithProgressCompletedHandler_2__HSTRING__UInt64;

  // Windows.Foundation.IAsyncOperationWithProgress`2<String,UInt64>
  IAsyncOperationWithProgress_2__HSTRING__UInt64 = interface;
  PIAsyncOperationWithProgress_2__HSTRING__UInt64 = ^IAsyncOperationWithProgress_2__HSTRING__UInt64;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Foundation.IUriRuntimeClass>
  IVectorView_1__IUriRuntimeClass = interface;
  PIVectorView_1__IUriRuntimeClass = ^IVectorView_1__IUriRuntimeClass;

  // Windows.Foundation.Collections.IVector`1<Windows.Foundation.IUriRuntimeClass>
  IVector_1__IUriRuntimeClass = interface;
  PIVector_1__IUriRuntimeClass = ^IVector_1__IUriRuntimeClass;

  // Windows.Foundation.IReference`1<Guid>
  IReference_1__TGuid = interface;
  PIReference_1__TGuid = ^IReference_1__TGuid;

  // Windows.Foundation.IReference`1<Windows.Foundation.Point>
  IReference_1__Point = interface;
  PIReference_1__Point = ^IReference_1__Point;

  // Windows.Foundation.IReference`1<Windows.Foundation.Rect>
  IReference_1__Rect = interface;
  PIReference_1__Rect = ^IReference_1__Rect;

  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Point>
  IIterator_1__Point = interface;
  PIIterator_1__Point = ^IIterator_1__Point;

  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Point>
  IIterable_1__Point = interface;
  PIIterable_1__Point = ^IIterable_1__Point;

  // Windows.Foundation.AsyncActionProgressHandler`1<UInt64>
  AsyncActionProgressHandler_1__UInt64 = interface;
  PAsyncActionProgressHandler_1__UInt64 = ^AsyncActionProgressHandler_1__UInt64;

  // Windows.Foundation.AsyncActionWithProgressCompletedHandler`1<UInt64>
  AsyncActionWithProgressCompletedHandler_1__UInt64 = interface;
  PAsyncActionWithProgressCompletedHandler_1__UInt64 = ^AsyncActionWithProgressCompletedHandler_1__UInt64;

  // Windows.Foundation.IAsyncActionWithProgress`1<UInt64>
  IAsyncActionWithProgress_1__UInt64 = interface;
  PIAsyncActionWithProgress_1__UInt64 = ^IAsyncActionWithProgress_1__UInt64;

  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.DateTime>
  IIterator_1__DateTime = interface;
  PIIterator_1__DateTime = ^IIterator_1__DateTime;

  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.DateTime>
  IIterable_1__DateTime = interface;
  PIIterable_1__DateTime = ^IIterable_1__DateTime;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Foundation.DateTime>
  IVectorView_1__DateTime = interface;
  PIVectorView_1__DateTime = ^IVectorView_1__DateTime;

  // Windows.Foundation.Collections.IVector`1<Windows.Foundation.DateTime>
  IVector_1__DateTime = interface;
  PIVector_1__DateTime = ^IVector_1__DateTime;

  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Point>>
  IIterator_1__IIterable_1__Point = interface;
  PIIterator_1__IIterable_1__Point = ^IIterator_1__IIterable_1__Point;

  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Point>>
  IIterable_1__IIterable_1__Point = interface;
  PIIterable_1__IIterable_1__Point = ^IIterable_1__IIterable_1__Point;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Foundation.Point>
  IVectorView_1__Point = interface;
  PIVectorView_1__Point = ^IVectorView_1__Point;

(*
  // Windows.Foundation.Collections.IVector`1<Windows.Foundation.Point>
  IVector_1__Point = interface;
  PIVector_1__Point = ^IVector_1__Point;

*)

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.IReference`1<Windows.Foundation.DateTime>>
  AsyncOperationCompletedHandler_1__IReference_1__DateTime = interface;
  PAsyncOperationCompletedHandler_1__IReference_1__DateTime = ^AsyncOperationCompletedHandler_1__IReference_1__DateTime;

  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.IReference`1<Windows.Foundation.DateTime>>
  IAsyncOperation_1__IReference_1__DateTime = interface;
  PIAsyncOperation_1__IReference_1__DateTime = ^IAsyncOperation_1__IReference_1__DateTime;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.IReference`1<Windows.Foundation.TimeSpan>>
  AsyncOperationCompletedHandler_1__IReference_1__TimeSpan = interface;
  PAsyncOperationCompletedHandler_1__IReference_1__TimeSpan = ^AsyncOperationCompletedHandler_1__IReference_1__TimeSpan;

  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.IReference`1<Windows.Foundation.TimeSpan>>
  IAsyncOperation_1__IReference_1__TimeSpan = interface;
  PIAsyncOperation_1__IReference_1__TimeSpan = ^IAsyncOperation_1__IReference_1__TimeSpan;



  // Emit Forwarded interfaces
  // Windows.Foundation Interfaces
  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Void
  }
  // Windows.Foundation.IClosable
  IClosable = interface(IInspectable)
  ['{30D5A829-7FA4-4026-83BB-D75BAE4EA99E}']
    procedure Close; safecall;
  end;

  {
  // Used Types:  Windows.Foundation.PropertyType
  // Used Types:  Boolean
  // Used Types:  UInt8
  // Used Types:  Int16
  // Used Types:  UInt16
  // Used Types:  Int32
  // Used Types:  UInt32
  // Used Types:  Int64
  // Used Types:  UInt64
  // Used Types:  Single
  // Used Types:  Double
  // Used Types:  Char
  // Used Types:  String
  // Used Types:  Guid
  // Used Types:  Windows.Foundation.DateTime
  // Used Types:  Windows.Foundation.TimeSpan
  // Used Types:  Windows.Foundation.Point
  // Used Types:  Windows.Foundation.Size
  // Used Types:  Windows.Foundation.Rect
  // Used Types:  Void
  // Used Types:  Object
  }
  // Windows.Foundation.IPropertyValue
  IPropertyValue = interface(IInspectable)
  ['{4BD682DD-7554-40E9-9A9B-82654EDE7E62}']
    function get_Type: PropertyType; safecall;
    function get_IsNumericScalar: Boolean; safecall;
    function GetUInt8: Byte; safecall;
    function GetInt16: SmallInt; safecall;
    function GetUInt16: Word; safecall;
    function GetInt32: Integer; safecall;
    function GetUInt32: Cardinal; safecall;
    function GetInt64: Int64; safecall;
    function GetUInt64: UInt64; safecall;
    function GetSingle: Single; safecall;
    function GetDouble: Double; safecall;
    function GetChar16: Char; safecall;
    function GetBoolean: Boolean; safecall;
    function GetString: HSTRING; safecall;
    function GetGuid: TGuid; safecall;
    function GetDateTime: DateTime; safecall;
    function GetTimeSpan: TimeSpan; safecall;
    function GetPoint: TPointF; safecall;
    function GetSize: TSizeF; safecall;
    function GetRect: TRectF; safecall;
    procedure GetUInt8Array(out {TODO: verify}value: PByte); safecall;
    procedure GetInt16Array(out {TODO: verify}value: PSmallInt); safecall;
    procedure GetUInt16Array(out {TODO: verify}value: PWord); safecall;
    procedure GetInt32Array(out {TODO: verify}value: PInteger); safecall;
    procedure GetUInt32Array(out {TODO: verify}value: PCardinal); safecall;
    procedure GetInt64Array(out {TODO: verify}value: PInt64); safecall;
    procedure GetUInt64Array(out {TODO: verify}value: PUInt64); safecall;
    procedure GetSingleArray(out {TODO: verify}value: PSingle); safecall;
    procedure GetDoubleArray(out {TODO: verify}value: PDouble); safecall;
    procedure GetChar16Array(out {TODO: verify}value: PChar); safecall;
    procedure GetBooleanArray(out {TODO: verify}value: PBoolean); safecall;
    procedure GetStringArray(out {TODO: verify}value: PHSTRING); safecall;
    procedure GetInspectableArray(out {TODO: verify}value: PIInspectable); safecall;
    procedure GetGuidArray(out {TODO: verify}value: PGuid); safecall;
    procedure GetDateTimeArray(out {TODO: verify}value: PDateTime); safecall;
    procedure GetTimeSpanArray(out {TODO: verify}value: PTimeSpan); safecall;
    procedure GetPointArray(out {TODO: verify}value: PPointF); safecall;
    procedure GetSizeArray(out {TODO: verify}value: PSizeF); safecall;
    procedure GetRectArray(out {TODO: verify}value: PRectF); safecall;
    property IsNumericScalar: Boolean read get_IsNumericScalar;
    property &Type: PropertyType read get_Type;
  end;

  {
  // Used Types:  Object
  // Used Types:  UInt8
  // Used Types:  Int16
  // Used Types:  UInt16
  // Used Types:  Int32
  // Used Types:  UInt32
  // Used Types:  Int64
  // Used Types:  UInt64
  // Used Types:  Single
  // Used Types:  Double
  // Used Types:  Char
  // Used Types:  Boolean
  // Used Types:  String
  // Used Types:  Guid
  // Used Types:  Windows.Foundation.DateTime
  // Used Types:  Windows.Foundation.TimeSpan
  // Used Types:  Windows.Foundation.Point
  // Used Types:  Windows.Foundation.Size
  // Used Types:  Windows.Foundation.Rect
  }
  // Windows.Foundation.IPropertyValueStatics
  IPropertyValueStatics = interface(IInspectable)
  ['{629BDBC8-D932-4FF4-96B9-8D96C5C1E858}']
    function CreateEmpty: IInspectable; safecall;
    function CreateUInt8(value: Byte): IInspectable; safecall;
    function CreateInt16(value: SmallInt): IInspectable; safecall;
    function CreateUInt16(value: Word): IInspectable; safecall;
    function CreateInt32(value: Integer): IInspectable; safecall;
    function CreateUInt32(value: Cardinal): IInspectable; safecall;
    function CreateInt64(value: Int64): IInspectable; safecall;
    function CreateUInt64(value: UInt64): IInspectable; safecall;
    function CreateSingle(value: Single): IInspectable; safecall;
    function CreateDouble(value: Double): IInspectable; safecall;
    function CreateChar16(value: Char): IInspectable; safecall;
    function CreateBoolean(value: Boolean): IInspectable; safecall;
    function CreateString(value: HSTRING): IInspectable; safecall;
    function CreateInspectable(value: IInspectable): IInspectable; safecall;
    function CreateGuid(value: TGuid): IInspectable; safecall;
    function CreateDateTime(value: DateTime): IInspectable; safecall;
    function CreateTimeSpan(value: TimeSpan): IInspectable; safecall;
    function CreatePoint(value: TPointF): IInspectable; safecall;
    function CreateSize(value: TSizeF): IInspectable; safecall;
    function CreateRect(value: TRectF): IInspectable; safecall;
    function CreateUInt8Array({TODO: verify}value: PByte): IInspectable; safecall;
    function CreateInt16Array({TODO: verify}value: PSmallInt): IInspectable; safecall;
    function CreateUInt16Array({TODO: verify}value: PWord): IInspectable; safecall;
    function CreateInt32Array({TODO: verify}value: PInteger): IInspectable; safecall;
    function CreateUInt32Array({TODO: verify}value: PCardinal): IInspectable; safecall;
    function CreateInt64Array({TODO: verify}value: PInt64): IInspectable; safecall;
    function CreateUInt64Array({TODO: verify}value: PUInt64): IInspectable; safecall;
    function CreateSingleArray({TODO: verify}value: PSingle): IInspectable; safecall;
    function CreateDoubleArray({TODO: verify}value: PDouble): IInspectable; safecall;
    function CreateChar16Array({TODO: verify}value: PChar): IInspectable; safecall;
    function CreateBooleanArray({TODO: verify}value: PBoolean): IInspectable; safecall;
    function CreateStringArray({TODO: verify}value: PHSTRING): IInspectable; safecall;
    function CreateInspectableArray({TODO: verify}value: PIInspectable): IInspectable; safecall;
    function CreateGuidArray({TODO: verify}value: PGuid): IInspectable; safecall;
    function CreateDateTimeArray({TODO: verify}value: PDateTime): IInspectable; safecall;
    function CreateTimeSpanArray({TODO: verify}value: PTimeSpan): IInspectable; safecall;
    function CreatePointArray({TODO: verify}value: PPointF): IInspectable; safecall;
    function CreateSizeArray({TODO: verify}value: PSizeF): IInspectable; safecall;
    function CreateRectArray({TODO: verify}value: PRectF): IInspectable; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.Foundation.IStringable
  IStringable = interface(IInspectable)
  ['{96369F54-8EB6-48F0-ABCE-C1B211E627C3}']
    function ToString: HSTRING; safecall;
  end;


  {
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.AsyncStatus
  // Used Types:  Windows.Foundation.HResult
  // Used Types:  Void
  }
  // Windows.Foundation.IAsyncInfo
  IAsyncInfo = interface(IInspectable)
  ['{00000036-0000-0000-C000-000000000046}']
    function get_Id: Cardinal; safecall;
    function get_Status: AsyncStatus; safecall;
    function get_ErrorCode: HRESULT; safecall;
    procedure Cancel; safecall;
    procedure Close; safecall;
    property ErrorCode: HRESULT read get_ErrorCode;
    property Id: Cardinal read get_Id;
    property Status: AsyncStatus read get_Status;
  end;



  // UsedAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.AsyncActionCompletedHandler
  }
  // Windows.Foundation.IAsyncAction
  IAsyncAction = interface(IInspectable)
  ['{5A648006-843A-4DA9-865B-9D26E5DFAD7B}']
    procedure put_Completed(handler: AsyncActionCompletedHandler); safecall;
    function get_Completed: AsyncActionCompletedHandler; safecall;
    procedure GetResults; safecall;
    property Completed: AsyncActionCompletedHandler read get_Completed write put_Completed;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.IAsyncAction
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncActionCompletedHandler
  AsyncActionCompletedHandler = interface(IUnknown)
  ['{A4ED5C81-76C9-40BD-8BE6-B1D90FB20AE7}']
    procedure Invoke(asyncInfo: IAsyncAction; asyncStatus: AsyncStatus); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Void
  }
  // Windows.Foundation.IDeferral
  IDeferral = interface(IInspectable)
  ['{D6269732-3B7F-46A7-B40B-4FDCA2A2C693}']
    procedure Complete; safecall;
  end;

  {
  // Used Types:  Void
  }
  // Windows.Foundation.DeferralCompletedHandler
  DeferralCompletedHandler = interface(IUnknown)
  ['{ED32A372-F3C8-4FAA-9CFB-470148DA3888}']
    procedure Invoke; safecall;
  end;

  {
  // Used Types:  Windows.Foundation.IDeferral
  // Used Types:  Windows.Foundation.DeferralCompletedHandler
  }
  // Windows.Foundation.IDeferralFactory
  IDeferralFactory = interface(IInspectable)
  ['{65A1ECC5-3FB5-4832-8CA9-F061B281D13A}']
    function Create(handler: DeferralCompletedHandler): IDeferral; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.Foundation.IWwwFormUrlDecoderEntry
  IWwwFormUrlDecoderEntry = interface(IInspectable)
  ['{125E7431-F678-4E8E-B670-20A9B06C512D}']
    function get_Name: HSTRING; safecall;
    function get_Value: HSTRING; safecall;
    property Name: HSTRING read get_Name;
    property Value: HSTRING read get_Value;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IWwwFormUrlDecoderEntry
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.IWwwFormUrlDecoderEntry>
  IIterator_1__IWwwFormUrlDecoderEntry = interface(IInspectable)
  ['{32E54295-373C-50CB-80A1-468A990CA780}']
    function get_Current: IWwwFormUrlDecoderEntry; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(out {TODO: verify}items: PIWwwFormUrlDecoderEntry): Cardinal; safecall;
    property Current: IWwwFormUrlDecoderEntry read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Foundation.IWwwFormUrlDecoderEntry>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.IWwwFormUrlDecoderEntry>
  IIterable_1__IWwwFormUrlDecoderEntry = interface(IInspectable)
  ['{876BE83B-7218-5BFB-A169-83152EF7E146}']
    function First: IIterator_1__IWwwFormUrlDecoderEntry; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.Foundation.IWwwFormUrlDecoderRuntimeClass
  IWwwFormUrlDecoderRuntimeClass = interface(IInspectable)
  ['{D45A0451-F225-4542-9296-0E1DF5D254DF}']
    function GetFirstValueByName(name: HSTRING): HSTRING; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Foundation.IWwwFormUrlDecoderRuntimeClass
  // Used Types:  Int32
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  }
  // Windows.Foundation.IUriRuntimeClass
  IUriRuntimeClass = interface(IInspectable)
  ['{9E365E57-48B2-4160-956F-C7385120BBFC}']
    function get_AbsoluteUri: HSTRING; safecall;
    function get_DisplayUri: HSTRING; safecall;
    function get_Domain: HSTRING; safecall;
    function get_Extension: HSTRING; safecall;
    function get_Fragment: HSTRING; safecall;
    function get_Host: HSTRING; safecall;
    function get_Password: HSTRING; safecall;
    function get_Path: HSTRING; safecall;
    function get_Query: HSTRING; safecall;
    function get_QueryParsed: IWwwFormUrlDecoderRuntimeClass; safecall;
    function get_RawUri: HSTRING; safecall;
    function get_SchemeName: HSTRING; safecall;
    function get_UserName: HSTRING; safecall;
    function get_Port: Integer; safecall;
    function get_Suspicious: Boolean; safecall;
    function Equals(pUri: IUriRuntimeClass): Boolean; safecall;
    function CombineUri(relativeUri: HSTRING): IUriRuntimeClass; safecall;
    property AbsoluteUri: HSTRING read get_AbsoluteUri;
    property DisplayUri: HSTRING read get_DisplayUri;
    property Domain: HSTRING read get_Domain;
    property Extension: HSTRING read get_Extension;
    property Fragment: HSTRING read get_Fragment;
    property Host: HSTRING read get_Host;
    property Password: HSTRING read get_Password;
    property Path: HSTRING read get_Path;
    property Port: Integer read get_Port;
    property Query: HSTRING read get_Query;
    property QueryParsed: IWwwFormUrlDecoderRuntimeClass read get_QueryParsed;
    property RawUri: HSTRING read get_RawUri;
    property SchemeName: HSTRING read get_SchemeName;
    property Suspicious: Boolean read get_Suspicious;
    property UserName: HSTRING read get_UserName;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.Foundation.IUriRuntimeClassWithAbsoluteCanonicalUri
  IUriRuntimeClassWithAbsoluteCanonicalUri = interface(IInspectable)
  ['{758D9661-221C-480F-A339-50656673F46F}']
    function get_AbsoluteCanonicalUri: HSTRING; safecall;
    function get_DisplayIri: HSTRING; safecall;
    property AbsoluteCanonicalUri: HSTRING read get_AbsoluteCanonicalUri;
    property DisplayIri: HSTRING read get_DisplayIri;
  end;

  {
  // Used Types:  String
  }
  // Windows.Foundation.IUriEscapeStatics
  IUriEscapeStatics = interface(IInspectable)
  ['{C1D432BA-C824-4452-A7FD-512BC3BBE9A1}']
    function UnescapeComponent(toUnescape: HSTRING): HSTRING; safecall;
    function EscapeComponent(toEscape: HSTRING): HSTRING; safecall;
  end;

  {
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  // Used Types:  String
  }
  // Windows.Foundation.IUriRuntimeClassFactory
  IUriRuntimeClassFactory = interface(IInspectable)
  ['{44A9796F-723E-4FDF-A218-033E75B0C084}']
    function CreateUri(uri: HSTRING): IUriRuntimeClass; safecall;
    function CreateWithRelativeUri(baseUri: HSTRING; relativeUri: HSTRING): IUriRuntimeClass; safecall;
  end;

  {
  // Used Types:  Windows.Foundation.IWwwFormUrlDecoderRuntimeClass
  // Used Types:  String
  }
  // Windows.Foundation.IWwwFormUrlDecoderRuntimeClassFactory
  IWwwFormUrlDecoderRuntimeClassFactory = interface(IInspectable)
  ['{5B8C6B3D-24AE-41B5-A1BF-F0C3D544845B}']
    function CreateWwwFormUrlDecoder(query: HSTRING): IWwwFormUrlDecoderRuntimeClass; safecall;
  end;

  {
  // Used Types:  Object
  // Used Types:  String
  }
  // Windows.Foundation.IGetActivationFactory
  IGetActivationFactory = interface(IInspectable)
  ['{4EDB8EE2-96DD-49A7-94F7-4607DDAB8E3C}']
    function GetActivationFactory(activatableClassId: HSTRING): IInspectable; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.IMemoryBufferReference
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Foundation.IMemoryBufferReference,Object>
  TypedEventHandler_2__IMemoryBufferReference__IInspectable = interface(IUnknown)
  ['{F4637D4A-0760-5431-BFC0-24EB1D4F6C4F}']
    procedure Invoke(sender: IMemoryBufferReference; args: IInspectable); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Foundation.IMemoryBufferReference,Object>
  // Used Types:  Void
  }
  // Windows.Foundation.IMemoryBufferReference
  IMemoryBufferReference = interface(IInspectable)
  ['{FBC4DD29-245B-11E4-AF98-689423260CF8}']
    function get_Capacity: Cardinal; safecall;
    function add_Closed(handler: TypedEventHandler_2__IMemoryBufferReference__IInspectable): EventRegistrationToken; safecall;
    procedure remove_Closed(cookie: EventRegistrationToken); safecall;
    property Capacity: Cardinal read get_Capacity;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IMemoryBufferReference
  }
  // Windows.Foundation.IMemoryBuffer
  IMemoryBuffer = interface(IInspectable)
  ['{FBC4DD2A-245B-11E4-AF98-689423260CF8}']
    function CreateReference: IMemoryBufferReference; safecall;
  end;

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Foundation.IMemoryBuffer
  // Used Types:  UInt32
  }
  // Windows.Foundation.IMemoryBufferFactory
  IMemoryBufferFactory = interface(IInspectable)
  ['{FBC4DD2B-245B-11E4-AF98-689423260CF8}']
    function Create(capacity: Cardinal): IMemoryBuffer; safecall;
  end;

*)

  // UsedAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<UInt32,UInt32>
  // Used Types:  UInt32
  }
  // Windows.Foundation.AsyncOperationProgressHandler`2<UInt32,UInt32>
  AsyncOperationProgressHandler_2__Cardinal__Cardinal = interface(IUnknown)
  ['{EA0FE405-D432-5AC7-9EF8-5A65E1F97D7E}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__Cardinal__Cardinal; progressInfo: Cardinal); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<UInt32,UInt32>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<UInt32,UInt32>
  AsyncOperationWithProgressCompletedHandler_2__Cardinal__Cardinal = interface(IUnknown)
  ['{1E466DC5-840F-54F9-B877-5E3A9F4B6C74}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__Cardinal__Cardinal; asyncStatus: AsyncStatus); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.AsyncOperationProgressHandler`2<UInt32,UInt32>
  // Used Types:  Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<UInt32,UInt32>
  // Used Types:  UInt32
  }
  // Windows.Foundation.IAsyncOperationWithProgress`2<UInt32,UInt32>
  IAsyncOperationWithProgress_2__Cardinal__Cardinal = interface(IInspectable)
  ['{ECCB574A-C684-5572-A679-6B0842CFB57F}']
    procedure put_Progress(handler: AsyncOperationProgressHandler_2__Cardinal__Cardinal); safecall;
    function get_Progress: AsyncOperationProgressHandler_2__Cardinal__Cardinal; safecall;
    procedure put_Completed(handler: AsyncOperationWithProgressCompletedHandler_2__Cardinal__Cardinal); safecall;
    function get_Completed: AsyncOperationWithProgressCompletedHandler_2__Cardinal__Cardinal; safecall;
    function GetResults: Cardinal; safecall;
    property Progress: AsyncOperationProgressHandler_2__Cardinal__Cardinal read get_Progress write put_Progress;
    property Completed: AsyncOperationWithProgressCompletedHandler_2__Cardinal__Cardinal read get_Completed write put_Completed;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Boolean>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Boolean>
  AsyncOperationCompletedHandler_1__Boolean = interface(IUnknown)
  ['{C1D3D1A2-AE17-5A5F-B5A2-BDCC8844889A}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Boolean; asyncStatus: AsyncStatus); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Boolean>
  // Used Types:  Boolean
  }
  // Windows.Foundation.IAsyncOperation`1<Boolean>
  IAsyncOperation_1__Boolean = interface(IInspectable)
  ['{CDB5EFB3-5788-509D-9BE1-71CCB8A3362A}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Boolean); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Boolean; safecall;
    function GetResults: Boolean; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Boolean read get_Completed write put_Completed;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.IAsyncOperation`1<String>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<String>
  AsyncOperationCompletedHandler_1__HSTRING = interface(IUnknown)
  ['{B79A741F-7FB5-50AE-9E99-911201EC3D41}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__HSTRING; asyncStatus: AsyncStatus); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<String>
  // Used Types:  String
  }
  // Windows.Foundation.IAsyncOperation`1<String>
  IAsyncOperation_1__HSTRING = interface(IInspectable)
  ['{3E1FE603-F897-5263-B328-0806426B8A79}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__HSTRING); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__HSTRING; safecall;
    function GetResults: HSTRING; safecall;
    property Completed: AsyncOperationCompletedHandler_1__HSTRING read get_Completed write put_Completed;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.TimeSpan
  }
  // Windows.Foundation.IReference`1<Windows.Foundation.TimeSpan>
  IReference_1__TimeSpan = interface(IInspectable)
  ['{455ACF7B-8F11-5BB9-93BE-7A214CD5A134}']
    function get_Value: TimeSpan; safecall;
    property Value: TimeSpan read get_Value;
  end;

  // UsedAPI Interface
  {
  // Used Types:  UInt32
  }
  // Windows.Foundation.IReference`1<UInt32>
  IReference_1__Cardinal = interface(IInspectable)
  ['{513EF3AF-E784-5325-A91E-97C2B8111CF3}']
    function get_Value: Cardinal; safecall;
    property Value: Cardinal read get_Value;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.DateTime
  }
  // Windows.Foundation.IReference`1<Windows.Foundation.DateTime>
  IReference_1__DateTime = interface(IInspectable)
  ['{455ACF7B-8F11-5BB9-93BE-7A214CD5A134}']
    function get_Value: DateTime; safecall;
    property Value: DateTime read get_Value;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Int32>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Int32>
  AsyncOperationCompletedHandler_1__Integer = interface(IUnknown)
  ['{D60CAE9D-88CB-59F1-8576-3FBA44796BE8}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Integer; asyncStatus: AsyncStatus); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Int32>
  // Used Types:  Int32
  }
  // Windows.Foundation.IAsyncOperation`1<Int32>
  IAsyncOperation_1__Integer = interface(IInspectable)
  ['{968B9665-06ED-5774-8F53-8EDEABD5F7B5}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Integer); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Integer; safecall;
    function GetResults: Integer; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Integer read get_Completed write put_Completed;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Int32
  }
  // Windows.Foundation.IReference`1<Int32>
  IReference_1__Integer = interface(IInspectable)
  ['{548CEFBD-BC8A-5FA0-8DF2-957440FC8BF4}']
    function get_Value: Integer; safecall;
    property Value: Integer read get_Value;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Object>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Object>
  AsyncOperationCompletedHandler_1__IInspectable = interface(IUnknown)
  ['{3F08262E-A2E1-5134-9297-E9211F481A2D}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IInspectable; asyncStatus: AsyncStatus); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Object>
  // Used Types:  Object
  }
  // Windows.Foundation.IAsyncOperation`1<Object>
  IAsyncOperation_1__IInspectable = interface(IInspectable)
  ['{ABF53C57-EE50-5342-B52A-26E3B8CC024F}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IInspectable); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IInspectable; safecall;
    function GetResults: IInspectable; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IInspectable read get_Completed write put_Completed;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.IUriRuntimeClass>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.IUriRuntimeClass>
  AsyncOperationCompletedHandler_1__IUriRuntimeClass = interface(IUnknown)
  ['{A25BFF34-DC7C-5FBA-9850-5D6996615BF5}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IUriRuntimeClass; asyncStatus: AsyncStatus); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.IUriRuntimeClass>
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.IUriRuntimeClass>
  IAsyncOperation_1__IUriRuntimeClass = interface(IInspectable)
  ['{45BD84D5-E60D-5525-BC8F-B568B5538D2D}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IUriRuntimeClass); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IUriRuntimeClass; safecall;
    function GetResults: IUriRuntimeClass; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IUriRuntimeClass read get_Completed write put_Completed;
  end;

  {
  // Used Types:  Void
  // Used Types:  Object
  }
  // Windows.Foundation.EventHandler`1<Object>
  EventHandler_1__IInspectable = interface(IUnknown)
  ['{C50898F6-C536-5F47-8583-8B2C2438A13B}']
    procedure Invoke(sender: IInspectable; args: IInspectable); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.IAsyncOperation`1<UInt32>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<UInt32>
  AsyncOperationCompletedHandler_1__Cardinal = interface(IUnknown)
  ['{9343B6E7-E3D2-5E4A-AB2D-2BCE4919A6A4}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Cardinal; asyncStatus: AsyncStatus); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<UInt32>
  // Used Types:  UInt32
  }
  // Windows.Foundation.IAsyncOperation`1<UInt32>
  IAsyncOperation_1__Cardinal = interface(IInspectable)
  ['{EF60385F-BE78-584B-AAEF-7829ADA2B0DE}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Cardinal); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Cardinal; safecall;
    function GetResults: Cardinal; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Cardinal read get_Completed write put_Completed;
  end;

  // UsedAPI Interface
  {
  // Used Types:  UInt64
  }
  // Windows.Foundation.IReference`1<UInt64>
  IReference_1__UInt64 = interface(IInspectable)
  ['{6755E376-53BB-568B-A11D-17239868309E}']
    function get_Value: UInt64; safecall;
    property Value: UInt64 read get_Value;
  end;

  // UsedAPI Interface
  {
  // Used Types:  UInt8
  }
  // Windows.Foundation.IReference`1<UInt8>
  IReference_1__Byte = interface(IInspectable)
  ['{E5198CC8-2873-55F5-B0A1-84FF9E4AAD62}']
    function get_Value: Byte; safecall;
    property Value: Byte read get_Value;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Int16
  }
  // Windows.Foundation.IReference`1<Int16>
  IReference_1__SmallInt = interface(IInspectable)
  ['{6EC9E41B-6709-5647-9918-A1270110FC4E}']
    function get_Value: SmallInt; safecall;
    property Value: SmallInt read get_Value;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Double
  }
  // Windows.Foundation.IReference`1<Double>
  IReference_1__Double = interface(IInspectable)
  ['{2F2D6C29-5473-5F3E-92E7-96572BB990E2}']
    function get_Value: Double; safecall;
    property Value: Double read get_Value;
  end;

  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Guid>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Guid>
  AsyncOperationCompletedHandler_1__TGuid = interface(IUnknown)
  ['{5233899B-BA7E-504F-BB83-CEEBAC62DECF}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__TGuid; asyncStatus: AsyncStatus); safecall;
  end;

  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Guid>
  // Used Types:  Guid
  }
  // Windows.Foundation.IAsyncOperation`1<Guid>
  IAsyncOperation_1__TGuid = interface(IInspectable)
  ['{6607BC41-294B-5975-9C3F-4B49836D0916}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__TGuid); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__TGuid; safecall;
    function GetResults: TGuid; safecall;
    property Completed: AsyncOperationCompletedHandler_1__TGuid read get_Completed write put_Completed;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Int64>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Int64>
  AsyncOperationCompletedHandler_1__Int64 = interface(IUnknown)
  ['{D3EF5872-7D4E-59BB-95ED-79FE0F0DBE89}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Int64; asyncStatus: AsyncStatus); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Int64>
  // Used Types:  Int64
  }
  // Windows.Foundation.IAsyncOperation`1<Int64>
  IAsyncOperation_1__Int64 = interface(IInspectable)
  ['{CC468085-4BEF-5584-907C-9223D2679019}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Int64); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Int64; safecall;
    function GetResults: Int64; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Int64 read get_Completed write put_Completed;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Int64
  }
  // Windows.Foundation.IReference`1<Int64>
  IReference_1__Int64 = interface(IInspectable)
  ['{4DDA9E24-E69F-5C6A-A0A6-93427365AF2A}']
    function get_Value: Int64; safecall;
    property Value: Int64 read get_Value;
  end;

  {
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.IUriRuntimeClass>
  IIterator_1__IUriRuntimeClass = interface(IInspectable)
  ['{E070225C-CB16-5FE3-8CC4-CAB4CE987C97}']
    function get_Current: IUriRuntimeClass; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(out {TODO: verify}items: PIUriRuntimeClass): Cardinal; safecall;
    property Current: IUriRuntimeClass read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Foundation.IUriRuntimeClass>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.IUriRuntimeClass>
  IIterable_1__IUriRuntimeClass = interface(IInspectable)
  ['{EA0329A4-F285-5263-A1BA-D87F0BF8D236}']
    function First: IIterator_1__IUriRuntimeClass; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.TimeSpan
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.TimeSpan>
  IIterator_1__TimeSpan = interface(IInspectable)
  ['{752850B9-5ED2-5655-8DE2-262EFC26CF39}']
    function get_Current: TimeSpan; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(out {TODO: verify}items: PTimeSpan): Cardinal; safecall;
    property Current: TimeSpan read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Delegate for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.TimeSpan>
  IIterable_1__TimeSpan_Delegate_Base = interface(IUnknown)
  ['{E9F78726-829A-5F67-8D19-95EF154B7742}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Foundation.TimeSpan>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.TimeSpan>
  IIterable_1__TimeSpan = interface(IIterable_1__TimeSpan_Delegate_Base)
  ['{1B6614A1-8FC5-567D-9157-410A9E0ECBC5}']
    function First: IIterator_1__TimeSpan; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Single
  }
  // Windows.Foundation.IReference`1<Single>
  IReference_1__Single = interface(IInspectable)
  ['{719CC2BA-3E76-5DEF-9F1A-38D85A145EA8}']
    function get_Value: Single; safecall;
    property Value: Single read get_Value;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Boolean
  }
  // Windows.Foundation.IReference`1<Boolean>
  IReference_1__Boolean = interface(IInspectable)
  ['{3C00FD60-2950-5939-A21A-2D12C5A01B8A}']
    function get_Value: Boolean; safecall;
    property Value: Boolean read get_Value;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.IAsyncActionWithProgress`1<Double>
  // Used Types:  Double
  }
  // Windows.Foundation.AsyncActionProgressHandler`1<Double>
  AsyncActionProgressHandler_1__Double = interface(IUnknown)
  ['{44825C7C-0DA9-5691-B2B4-914F231EECED}']
    procedure Invoke(asyncInfo: IAsyncActionWithProgress_1__Double; progressInfo: Double); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.IAsyncActionWithProgress`1<Double>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncActionWithProgressCompletedHandler`1<Double>
  AsyncActionWithProgressCompletedHandler_1__Double = interface(IUnknown)
  ['{94D64AC6-4491-53EF-8BE8-36481F3FF1E8}']
    procedure Invoke(asyncInfo: IAsyncActionWithProgress_1__Double; asyncStatus: AsyncStatus); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.AsyncActionProgressHandler`1<Double>
  // Used Types:  Windows.Foundation.AsyncActionWithProgressCompletedHandler`1<Double>
  }
  // Windows.Foundation.IAsyncActionWithProgress`1<Double>
  IAsyncActionWithProgress_1__Double = interface(IInspectable)
  ['{4F1430A6-A825-56CA-B047-1A9BAD52BA67}']
    procedure put_Progress(handler: AsyncActionProgressHandler_1__Double); safecall;
    function get_Progress: AsyncActionProgressHandler_1__Double; safecall;
    procedure put_Completed(handler: AsyncActionWithProgressCompletedHandler_1__Double); safecall;
    function get_Completed: AsyncActionWithProgressCompletedHandler_1__Double; safecall;
    procedure GetResults; safecall;
    property Progress: AsyncActionProgressHandler_1__Double read get_Progress write put_Progress;
    property Completed: AsyncActionWithProgressCompletedHandler_1__Double read get_Completed write put_Completed;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<UInt64,UInt64>
  // Used Types:  UInt64
  }
  // Windows.Foundation.AsyncOperationProgressHandler`2<UInt64,UInt64>
  AsyncOperationProgressHandler_2__UInt64__UInt64 = interface(IUnknown)
  ['{FFB2B65D-4120-5D13-826D-107851E6BB1C}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__UInt64__UInt64; progressInfo: UInt64); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<UInt64,UInt64>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<UInt64,UInt64>
  AsyncOperationWithProgressCompletedHandler_2__UInt64__UInt64 = interface(IUnknown)
  ['{D2024E41-5500-5B5A-BA46-CB7009596A2F}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__UInt64__UInt64; asyncStatus: AsyncStatus); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.AsyncOperationProgressHandler`2<UInt64,UInt64>
  // Used Types:  Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<UInt64,UInt64>
  // Used Types:  UInt64
  }
  // Windows.Foundation.IAsyncOperationWithProgress`2<UInt64,UInt64>
  IAsyncOperationWithProgress_2__UInt64__UInt64 = interface(IInspectable)
  ['{8F1DB6E3-6556-5516-825C-1021EE27CD0C}']
    procedure put_Progress(handler: AsyncOperationProgressHandler_2__UInt64__UInt64); safecall;
    function get_Progress: AsyncOperationProgressHandler_2__UInt64__UInt64; safecall;
    procedure put_Completed(handler: AsyncOperationWithProgressCompletedHandler_2__UInt64__UInt64); safecall;
    function get_Completed: AsyncOperationWithProgressCompletedHandler_2__UInt64__UInt64; safecall;
    function GetResults: UInt64; safecall;
    property Progress: AsyncOperationProgressHandler_2__UInt64__UInt64 read get_Progress write put_Progress;
    property Completed: AsyncOperationWithProgressCompletedHandler_2__UInt64__UInt64 read get_Completed write put_Completed;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<String,UInt64>
  // Used Types:  UInt64
  }
  // Windows.Foundation.AsyncOperationProgressHandler`2<String,UInt64>
  AsyncOperationProgressHandler_2__HSTRING__UInt64 = interface(IUnknown)
  ['{14DA7DE7-40DF-5D4C-823F-CF310625AD39}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__HSTRING__UInt64; progressInfo: UInt64); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<String,UInt64>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<String,UInt64>
  AsyncOperationWithProgressCompletedHandler_2__HSTRING__UInt64 = interface(IUnknown)
  ['{BD75EEBE-E7B5-5AF6-8415-A4B9C9045202}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__HSTRING__UInt64; asyncStatus: AsyncStatus); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.AsyncOperationProgressHandler`2<String,UInt64>
  // Used Types:  Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<String,UInt64>
  // Used Types:  String
  }
  // Windows.Foundation.IAsyncOperationWithProgress`2<String,UInt64>
  IAsyncOperationWithProgress_2__HSTRING__UInt64 = interface(IInspectable)
  ['{C8BBCB29-6B64-5CE2-A831-038F6E02199E}']
    procedure put_Progress(handler: AsyncOperationProgressHandler_2__HSTRING__UInt64); safecall;
    function get_Progress: AsyncOperationProgressHandler_2__HSTRING__UInt64; safecall;
    procedure put_Completed(handler: AsyncOperationWithProgressCompletedHandler_2__HSTRING__UInt64); safecall;
    function get_Completed: AsyncOperationWithProgressCompletedHandler_2__HSTRING__UInt64; safecall;
    function GetResults: HSTRING; safecall;
    property Progress: AsyncOperationProgressHandler_2__HSTRING__UInt64 read get_Progress write put_Progress;
    property Completed: AsyncOperationWithProgressCompletedHandler_2__HSTRING__UInt64 read get_Completed write put_Completed;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Foundation.IUriRuntimeClass>
  IVectorView_1__IUriRuntimeClass = interface(IInspectable)
  ['{D38FF558-9620-5253-B2C2-7B2F4B27AF6F}']
    function GetAt(index: Cardinal): IUriRuntimeClass; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IUriRuntimeClass; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; out {TODO: verify}items: PIUriRuntimeClass): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  {
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Foundation.IUriRuntimeClass>
  // Used Types:  Boolean
  // Used Types:  Void
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Foundation.IUriRuntimeClass>
  IVector_1__IUriRuntimeClass = interface(IInspectable)
  ['{B13E7C58-8A01-5524-A397-45B4629C84C1}']
    function GetAt(index: Cardinal): IUriRuntimeClass; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__IUriRuntimeClass; safecall;
    function IndexOf(value: IUriRuntimeClass; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: IUriRuntimeClass); safecall;
    procedure InsertAt(index: Cardinal; value: IUriRuntimeClass); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: IUriRuntimeClass); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; out {TODO: verify}items: PIUriRuntimeClass): Cardinal; safecall;
    procedure ReplaceAll({TODO: verify}items: PIUriRuntimeClass); safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Guid
  }
  // Windows.Foundation.IReference`1<Guid>
  IReference_1__TGuid = interface(IInspectable)
  ['{7D50F649-632C-51F9-849A-EE49428933EA}']
    function get_Value: TGuid; safecall;
    property Value: TGuid read get_Value;
  end;

  {
  // Used Types:  Windows.Foundation.Point
  }
  // Windows.Foundation.IReference`1<Windows.Foundation.Point>
  IReference_1__Point = interface(IInspectable)
  ['{455ACF7B-8F11-5BB9-93BE-7A214CD5A134}']
    function get_Value: TPointF; safecall;
    property Value: TPointF read get_Value;
  end;

  {
  // Used Types:  Windows.Foundation.Rect
  }
  // Windows.Foundation.IReference`1<Windows.Foundation.Rect>
  IReference_1__Rect = interface(IInspectable)
  ['{455ACF7B-8F11-5BB9-93BE-7A214CD5A134}']
    function get_Value: TRectF; safecall;
    property Value: TRectF read get_Value;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Point
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Point>
  IIterator_1__Point = interface(IInspectable)
  ['{752850B9-5ED2-5655-8DE2-262EFC26CF39}']
    function get_Current: TPointF; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(out {TODO: verify}items: PPointF): Cardinal; safecall;
    property Current: TPointF read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Delegate for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Point>
  IIterable_1__Point_Delegate_Base = interface(IUnknown)
  ['{C192280D-3A09-5423-9DC5-67B83EBDE41D}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Point>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Point>
  IIterable_1__Point = interface(IIterable_1__Point_Delegate_Base)
  ['{1B6614A1-8FC5-567D-9157-410A9E0ECBC5}']
    function First: IIterator_1__Point; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.IAsyncActionWithProgress`1<UInt64>
  // Used Types:  UInt64
  }
  // Windows.Foundation.AsyncActionProgressHandler`1<UInt64>
  AsyncActionProgressHandler_1__UInt64 = interface(IUnknown)
  ['{55E233CA-F243-5AE2-853B-F9CC7C0AE0CF}']
    procedure Invoke(asyncInfo: IAsyncActionWithProgress_1__UInt64; progressInfo: UInt64); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.IAsyncActionWithProgress`1<UInt64>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncActionWithProgressCompletedHandler`1<UInt64>
  AsyncActionWithProgressCompletedHandler_1__UInt64 = interface(IUnknown)
  ['{E6FF857B-F160-571A-A934-2C61F98C862D}']
    procedure Invoke(asyncInfo: IAsyncActionWithProgress_1__UInt64; asyncStatus: AsyncStatus); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.AsyncActionProgressHandler`1<UInt64>
  // Used Types:  Windows.Foundation.AsyncActionWithProgressCompletedHandler`1<UInt64>
  }
  // Windows.Foundation.IAsyncActionWithProgress`1<UInt64>
  IAsyncActionWithProgress_1__UInt64 = interface(IInspectable)
  ['{43F713D0-C49D-5E55-AEBF-AF395768351E}']
    procedure put_Progress(handler: AsyncActionProgressHandler_1__UInt64); safecall;
    function get_Progress: AsyncActionProgressHandler_1__UInt64; safecall;
    procedure put_Completed(handler: AsyncActionWithProgressCompletedHandler_1__UInt64); safecall;
    function get_Completed: AsyncActionWithProgressCompletedHandler_1__UInt64; safecall;
    procedure GetResults; safecall;
    property Progress: AsyncActionProgressHandler_1__UInt64 read get_Progress write put_Progress;
    property Completed: AsyncActionWithProgressCompletedHandler_1__UInt64 read get_Completed write put_Completed;
  end;

  {
  // Used Types:  Windows.Foundation.DateTime
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.DateTime>
  IIterator_1__DateTime = interface(IInspectable)
  ['{752850B9-5ED2-5655-8DE2-262EFC26CF39}']
    function get_Current: DateTime; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(out {TODO: verify}items: PDateTime): Cardinal; safecall;
    property Current: DateTime read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Delegate for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.DateTime>
  IIterable_1__DateTime_Delegate_Base = interface(IUnknown)
  ['{576A207D-977C-5B36-B54D-624EC86C53A3}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Foundation.DateTime>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.DateTime>
  IIterable_1__DateTime = interface(IIterable_1__DateTime_Delegate_Base)
  ['{1B6614A1-8FC5-567D-9157-410A9E0ECBC5}']
    function First: IIterator_1__DateTime; safecall;
  end;

  {
  // Used Types:  Windows.Foundation.DateTime
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Foundation.DateTime>
  IVectorView_1__DateTime = interface(IInspectable)
  ['{86D0B56E-CB4E-58F0-B9A2-1528619DCD26}']
    function GetAt(index: Cardinal): DateTime; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: DateTime; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; out {TODO: verify}items: PDateTime): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  {
  // Used Types:  Windows.Foundation.DateTime
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Foundation.DateTime>
  // Used Types:  Boolean
  // Used Types:  Void
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Foundation.DateTime>
  IVector_1__DateTime = interface(IInspectable)
  ['{A4739064-B54E-55D4-8012-317E2B6A807B}']
    function GetAt(index: Cardinal): DateTime; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__DateTime; safecall;
    function IndexOf(value: DateTime; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: DateTime); safecall;
    procedure InsertAt(index: Cardinal; value: DateTime); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: DateTime); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; out {TODO: verify}items: PDateTime): Cardinal; safecall;
    procedure ReplaceAll({TODO: verify}items: PDateTime); safecall;
    property Size: Cardinal read get_Size;
  end;

  {
  // Used Types:  Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Point>
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Point>>
  IIterator_1__IIterable_1__Point = interface(IInspectable)
  ['{66C2C906-6BCA-5085-BBA5-C7D445D25EE6}']
    function get_Current: IIterable_1__Point; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(out {TODO: verify}items: PIIterable_1__Point): Cardinal; safecall;
    property Current: IIterable_1__Point read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Delegate for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Point>>
  IIterable_1__IIterable_1__Point_Delegate_Base = interface(IUnknown)
  ['{AE44597E-D411-5B7F-BBEC-6A96C94A107A}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Point>>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Point>>
  IIterable_1__IIterable_1__Point = interface(IIterable_1__IIterable_1__Point_Delegate_Base)
  ['{0FB49B66-3A39-5E05-B730-60ADDFB9795F}']
    function First: IIterator_1__IIterable_1__Point; safecall;
  end;

  {
  // Used Types:  Windows.Foundation.Point
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Foundation.Point>
  IVectorView_1__Point = interface(IInspectable)
  ['{86D0B56E-CB4E-58F0-B9A2-1528619DCD26}']
    function GetAt(index: Cardinal): TPointF; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: TPointF; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; out {TODO: verify}items: PPointF): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Foundation.Point
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Foundation.Point>
  // Used Types:  Boolean
  // Used Types:  Void
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Foundation.Point>
  IVector_1__Point = interface(IInspectable)
  ['{A4739064-B54E-55D4-8012-317E2B6A807B}']
    function GetAt(index: Cardinal): TPointF; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Point; safecall;
    function IndexOf(value: TPointF; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: TPointF); safecall;
    procedure InsertAt(index: Cardinal; value: TPointF); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: TPointF); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; out {TODO: verify}items: PPointF): Cardinal; safecall;
    procedure ReplaceAll({TODO: verify}items: PPointF); safecall;
    property Size: Cardinal read get_Size;
  end;

*)

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.IReference`1<Windows.Foundation.DateTime>>
  AsyncOperationCompletedHandler_1__IReference_1__DateTime_Delegate_Base = interface(IUnknown)
  ['{C4225D5E-1B7C-571E-9B88-2AB2EEFA8C8F}']
  end;
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.IReference`1<Windows.Foundation.DateTime>>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.IReference`1<Windows.Foundation.DateTime>>
  AsyncOperationCompletedHandler_1__IReference_1__DateTime = interface(AsyncOperationCompletedHandler_1__IReference_1__DateTime_Delegate_Base)
  ['{1AD5D0F6-8398-587D-AA9A-978252B1BBA2}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IReference_1__DateTime; asyncStatus: AsyncStatus); safecall;
  end;

  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.IReference`1<Windows.Foundation.DateTime>>
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.DateTime>
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.IReference`1<Windows.Foundation.DateTime>>
  IAsyncOperation_1__IReference_1__DateTime = interface(IInspectable)
  ['{00BEDA26-245F-5D19-B775-4DE00BBDC644}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IReference_1__DateTime); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IReference_1__DateTime; safecall;
    function GetResults: IReference_1__DateTime; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IReference_1__DateTime read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.IReference`1<Windows.Foundation.TimeSpan>>
  AsyncOperationCompletedHandler_1__IReference_1__TimeSpan_Delegate_Base = interface(IUnknown)
  ['{E137B677-BFEF-54B0-B200-95C5C2902A25}']
  end;
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.IReference`1<Windows.Foundation.TimeSpan>>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.IReference`1<Windows.Foundation.TimeSpan>>
  AsyncOperationCompletedHandler_1__IReference_1__TimeSpan = interface(AsyncOperationCompletedHandler_1__IReference_1__TimeSpan_Delegate_Base)
  ['{1AD5D0F6-8398-587D-AA9A-978252B1BBA2}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IReference_1__TimeSpan; asyncStatus: AsyncStatus); safecall;
  end;

  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.IReference`1<Windows.Foundation.TimeSpan>>
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.TimeSpan>
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.IReference`1<Windows.Foundation.TimeSpan>>
  IAsyncOperation_1__IReference_1__TimeSpan = interface(IInspectable)
  ['{00BEDA26-245F-5D19-B775-4DE00BBDC644}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IReference_1__TimeSpan); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IReference_1__TimeSpan; safecall;
    function GetResults: IReference_1__TimeSpan; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IReference_1__TimeSpan read get_Completed write put_Completed;
  end;


implementation

end.
