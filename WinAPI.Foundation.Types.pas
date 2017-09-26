unit WinAPI.Foundation.Types;

interface

uses
  Winapi.Winrt,
  System.Types;

{$SCOPEDENUMS ON}

type
  // Windows.Foundation Enums
  // Windows.Foundation.PropertyType
  PropertyType = (
    Empty = 0,
    UInt8 = 1,
    Int16 = 2,
    UInt16 = 3,
    Int32 = 4,
    UInt32 = 5,
    Int64 = 6,
    UInt64 = 7,
    Single = 8,
    Double = 9,
    Char16 = 10,
    Boolean = 11,
    &String = 12,
    Inspectable = 13,
    DateTime = 14,
    TimeSpan = 15,
    Guid = 16,
    Point = 17,
    Size = 18,
    Rect = 19,
    OtherType = 20,
    UInt8Array = 1025,
    Int16Array = 1026,
    UInt16Array = 1027,
    Int32Array = 1028,
    UInt32Array = 1029,
    Int64Array = 1030,
    UInt64Array = 1031,
    SingleArray = 1032,
    DoubleArray = 1033,
    Char16Array = 1034,
    BooleanArray = 1035,
    StringArray = 1036,
    InspectableArray = 1037,
    DateTimeArray = 1038,
    TimeSpanArray = 1039,
    GuidArray = 1040,
    PointArray = 1041,
    SizeArray = 1042,
    RectArray = 1043,
    OtherTypeArray = 1044
  );
  PPropertyType = ^PropertyType;

  // Windows.Foundation.AsyncStatus
  AsyncStatus = (
    Canceled = 2,
    Completed = 1,
    Error = 3,
    Started = 0
  );
  PAsyncStatus = ^AsyncStatus;



  // Windows.Foundation Records
  // Windows.Foundation.DateTime
  DateTime = record
    UniversalTime: Int64;
  end;
  PDateTime = ^DateTime;

  // Windows.Foundation.TimeSpan
  TimeSpan = record
    Duration: Int64;
  end;
  PTimeSpan = ^TimeSpan;

  // Windows.Foundation.EventRegistrationToken
  EventRegistrationToken = record
    Value: Int64;
  end;
  PEventRegistrationToken = ^EventRegistrationToken;

  // Windows.Foundation.FoundationContract
  FoundationContract = record
  end;
  PFoundationContract = ^FoundationContract;

  // Windows.Foundation.Numerics.Vector2
  Numerics_Vector2 = record
    X: Single;
    Y: Single;
  end;
  PNumerics_Vector2 = ^Numerics_Vector2;

  // Windows.Foundation.Numerics.Vector3
  Numerics_Vector3 = record
    X: Single;
    Y: Single;
    Z: Single;
  end;
  PNumerics_Vector3 = ^Numerics_Vector3;

  // Windows.Foundation.Numerics.Vector4
  Numerics_Vector4 = record
    X: Single;
    Y: Single;
    Z: Single;
    W: Single;
  end;
  PNumerics_Vector4 = ^Numerics_Vector4;

  // Windows.Foundation.Numerics.Matrix3x2
  Numerics_Matrix3x2 = record
    M11: Single;
    M12: Single;
    M21: Single;
    M22: Single;
    M31: Single;
    M32: Single;
  end;
  PNumerics_Matrix3x2 = ^Numerics_Matrix3x2;

  // Windows.Foundation.Numerics.Matrix4x4
  Numerics_Matrix4x4 = record
    M11: Single;
    M12: Single;
    M13: Single;
    M14: Single;
    M21: Single;
    M22: Single;
    M23: Single;
    M24: Single;
    M31: Single;
    M32: Single;
    M33: Single;
    M34: Single;
    M41: Single;
    M42: Single;
    M43: Single;
    M44: Single;
  end;
  PNumerics_Matrix4x4 = ^Numerics_Matrix4x4;

  // Windows.Foundation.Numerics.Plane
  Numerics_Plane = record
    Normal: Numerics_Vector3;
    D: Single;
  end;
  PNumerics_Plane = ^Numerics_Plane;

  // Windows.Foundation.Numerics.Quaternion
  Numerics_Quaternion = record
    X: Single;
    Y: Single;
    Z: Single;
    W: Single;
  end;
  PNumerics_Quaternion = ^Numerics_Quaternion;

  // Windows.Foundation.UniversalApiContract
  UniversalApiContract = record
  end;
  PUniversalApiContract = ^UniversalApiContract;




implementation

end.
