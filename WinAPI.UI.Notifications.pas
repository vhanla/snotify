{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2015-2015 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit WinAPI.UI.Notifications;

interface
uses 
  // Fixed Uses...
  WinAPI.Data,
  // Internal Uses...
  WinAPI.Foundation,
  WinAPI.Foundation.Collections,
  WinAPI.Foundation.Types,
  WinAPI.CommonTypes,
  Winapi.Winrt,
  System.Types;


{$SCOPEDENUMS ON}

const
  // Windows.UI.Notifications Class Names
  // Windows.UI.Notifications.TileUpdater
  // WinRT Only
  STileUpdater = 'Windows.UI.Notifications.TileUpdater';
  // Windows.UI.Notifications.TileNotification
  // WinRT Only
  STileNotification = 'Windows.UI.Notifications.TileNotification';
  // Windows.UI.Notifications.ScheduledTileNotification
  // WinRT Only
  SScheduledTileNotification = 'Windows.UI.Notifications.ScheduledTileNotification';
  // Windows.UI.Notifications.TileFlyoutUpdater
  // WinRT Only
  STileFlyoutUpdater = 'Windows.UI.Notifications.TileFlyoutUpdater';
  // Windows.UI.Notifications.TileFlyoutNotification
  // WinRT Only
  STileFlyoutNotification = 'Windows.UI.Notifications.TileFlyoutNotification';
  // Windows.UI.Notifications.BadgeUpdater
  // WinRT Only
  SBadgeUpdater = 'Windows.UI.Notifications.BadgeUpdater';
  // Windows.UI.Notifications.BadgeNotification
  // WinRT Only
  SBadgeNotification = 'Windows.UI.Notifications.BadgeNotification';
  // Windows.UI.Notifications.ToastNotifier
  // DualAPI
  SToastNotifier = 'Windows.UI.Notifications.ToastNotifier';
  // Windows.UI.Notifications.ToastNotification
  // DualAPI
  SToastNotification = 'Windows.UI.Notifications.ToastNotification';
  // Windows.UI.Notifications.ScheduledToastNotification
  // WinRT Only
  SScheduledToastNotification = 'Windows.UI.Notifications.ScheduledToastNotification';
  // Windows.UI.Notifications.ToastDismissedEventArgs
  // DualAPI
  SToastDismissedEventArgs = 'Windows.UI.Notifications.ToastDismissedEventArgs';
  // Windows.UI.Notifications.ToastFailedEventArgs
  // DualAPI
  SToastFailedEventArgs = 'Windows.UI.Notifications.ToastFailedEventArgs';
  // Windows.UI.Notifications.ToastNotificationHistory
  // WinRT Only
  SToastNotificationHistory = 'Windows.UI.Notifications.ToastNotificationHistory';
  // Windows.UI.Notifications.TileUpdateManager
  // WinRT Only
  STileUpdateManager = 'Windows.UI.Notifications.TileUpdateManager';
  // Windows.UI.Notifications.BadgeUpdateManager
  // WinRT Only
  SBadgeUpdateManager = 'Windows.UI.Notifications.BadgeUpdateManager';
  // Windows.UI.Notifications.TileFlyoutUpdateManager
  // WinRT Only
  STileFlyoutUpdateManager = 'Windows.UI.Notifications.TileFlyoutUpdateManager';
  // Windows.UI.Notifications.ToastNotificationManager
  // DualAPI
  SToastNotificationManager = 'Windows.UI.Notifications.ToastNotificationManager';
  // Windows.UI.Notifications.ToastActivatedEventArgs
  // DualAPI
  SToastActivatedEventArgs = 'Windows.UI.Notifications.ToastActivatedEventArgs';
  // Windows.UI.Notifications.ToastNotificationHistoryChangedTriggerDetail
  // WinRT Only
  SToastNotificationHistoryChangedTriggerDetail = 'Windows.UI.Notifications.ToastNotificationHistoryChangedTriggerDetail';
  // Windows.UI.Notifications.ToastNotificationActionTriggerDetail
  // WinRT Only
  SToastNotificationActionTriggerDetail = 'Windows.UI.Notifications.ToastNotificationActionTriggerDetail';


type

  // Forward declare interfaces
  // Windows.UI.Notifications.IToastDismissedEventArgs
  IToastDismissedEventArgs = interface;
  PIToastDismissedEventArgs = ^IToastDismissedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Notifications.IToastNotification,Windows.UI.Notifications.IToastDismissedEventArgs>
  TypedEventHandler_2__IToastNotification__IToastDismissedEventArgs = interface;
  PTypedEventHandler_2__IToastNotification__IToastDismissedEventArgs = ^TypedEventHandler_2__IToastNotification__IToastDismissedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Notifications.IToastNotification,Object>
  TypedEventHandler_2__IToastNotification__IInspectable = interface;
  PTypedEventHandler_2__IToastNotification__IInspectable = ^TypedEventHandler_2__IToastNotification__IInspectable;

  // Windows.UI.Notifications.IToastFailedEventArgs
  IToastFailedEventArgs = interface;
  PIToastFailedEventArgs = ^IToastFailedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Notifications.IToastNotification,Windows.UI.Notifications.IToastFailedEventArgs>
  TypedEventHandler_2__IToastNotification__IToastFailedEventArgs = interface;
  PTypedEventHandler_2__IToastNotification__IToastFailedEventArgs = ^TypedEventHandler_2__IToastNotification__IToastFailedEventArgs;

  // Windows.UI.Notifications.IToastNotification
  IToastNotification = interface;
  PIToastNotification = ^IToastNotification;

(*
  // Windows.UI.Notifications.ITileNotification
  ITileNotification = interface;
  PITileNotification = ^ITileNotification;

*)

(*
  // Windows.UI.Notifications.IBadgeNotification
  IBadgeNotification = interface;
  PIBadgeNotification = ^IBadgeNotification;

*)

  // Windows.UI.Notifications.IToastActivatedEventArgs
  IToastActivatedEventArgs = interface;
  PIToastActivatedEventArgs = ^IToastActivatedEventArgs;

(*
  // Windows.UI.Notifications.IScheduledTileNotification
  IScheduledTileNotification = interface;
  PIScheduledTileNotification = ^IScheduledTileNotification;

*)

(*
  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Notifications.IScheduledTileNotification>
  IIterator_1__IScheduledTileNotification = interface;
  PIIterator_1__IScheduledTileNotification = ^IIterator_1__IScheduledTileNotification;

*)

(*
  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Notifications.IScheduledTileNotification>
  IIterable_1__IScheduledTileNotification = interface;
  PIIterable_1__IScheduledTileNotification = ^IIterable_1__IScheduledTileNotification;

*)

(*
  // Windows.Foundation.Collections.IVectorView`1<Windows.UI.Notifications.IScheduledTileNotification>
  IVectorView_1__IScheduledTileNotification = interface;
  PIVectorView_1__IScheduledTileNotification = ^IVectorView_1__IScheduledTileNotification;

*)

(*
  // Windows.UI.Notifications.ITileUpdater
  ITileUpdater = interface;
  PITileUpdater = ^ITileUpdater;

*)

(*
  // Windows.UI.Notifications.ITileUpdateManagerStatics
  ITileUpdateManagerStatics = interface;
  PITileUpdateManagerStatics = ^ITileUpdateManagerStatics;

*)

(*
  // Windows.UI.Notifications.ITileUpdater2
  ITileUpdater2 = interface;
  PITileUpdater2 = ^ITileUpdater2;

*)

(*
  // Windows.UI.Notifications.ITileFlyoutNotification
  ITileFlyoutNotification = interface;
  PITileFlyoutNotification = ^ITileFlyoutNotification;

*)

(*
  // Windows.UI.Notifications.ITileFlyoutUpdater
  ITileFlyoutUpdater = interface;
  PITileFlyoutUpdater = ^ITileFlyoutUpdater;

*)

(*
  // Windows.UI.Notifications.ITileFlyoutUpdateManagerStatics
  ITileFlyoutUpdateManagerStatics = interface;
  PITileFlyoutUpdateManagerStatics = ^ITileFlyoutUpdateManagerStatics;

*)

(*
  // Windows.UI.Notifications.IBadgeUpdater
  IBadgeUpdater = interface;
  PIBadgeUpdater = ^IBadgeUpdater;

*)

(*
  // Windows.UI.Notifications.IBadgeUpdateManagerStatics
  IBadgeUpdateManagerStatics = interface;
  PIBadgeUpdateManagerStatics = ^IBadgeUpdateManagerStatics;

*)

  // Windows.UI.Notifications.IScheduledToastNotification
  IScheduledToastNotification = interface;
  PIScheduledToastNotification = ^IScheduledToastNotification;

  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Notifications.IScheduledToastNotification>
  IIterator_1__IScheduledToastNotification = interface;
  PIIterator_1__IScheduledToastNotification = ^IIterator_1__IScheduledToastNotification;

  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Notifications.IScheduledToastNotification>
  IIterable_1__IScheduledToastNotification = interface;
  PIIterable_1__IScheduledToastNotification = ^IIterable_1__IScheduledToastNotification;

  // Windows.Foundation.Collections.IVectorView`1<Windows.UI.Notifications.IScheduledToastNotification>
  IVectorView_1__IScheduledToastNotification = interface;
  PIVectorView_1__IScheduledToastNotification = ^IVectorView_1__IScheduledToastNotification;

  // Windows.UI.Notifications.IToastNotifier
  IToastNotifier = interface;
  PIToastNotifier = ^IToastNotifier;

  // Windows.UI.Notifications.IToastNotificationManagerStatics
  IToastNotificationManagerStatics = interface;
  PIToastNotificationManagerStatics = ^IToastNotificationManagerStatics;

(*
  // Windows.UI.Notifications.ITileNotificationFactory
  ITileNotificationFactory = interface;
  PITileNotificationFactory = ^ITileNotificationFactory;

*)

(*
  // Windows.UI.Notifications.ITileFlyoutNotificationFactory
  ITileFlyoutNotificationFactory = interface;
  PITileFlyoutNotificationFactory = ^ITileFlyoutNotificationFactory;

*)

(*
  // Windows.UI.Notifications.IBadgeNotificationFactory
  IBadgeNotificationFactory = interface;
  PIBadgeNotificationFactory = ^IBadgeNotificationFactory;

*)

  // Windows.UI.Notifications.IToastNotificationFactory
  IToastNotificationFactory = interface;
  PIToastNotificationFactory = ^IToastNotificationFactory;

  // Windows.UI.Notifications.IToastNotification2
  IToastNotification2 = interface;
  PIToastNotification2 = ^IToastNotification2;

(*
  // Windows.UI.Notifications.IScheduledToastNotificationFactory
  IScheduledToastNotificationFactory = interface;
  PIScheduledToastNotificationFactory = ^IScheduledToastNotificationFactory;

*)

(*
  // Windows.UI.Notifications.IScheduledToastNotification2
  IScheduledToastNotification2 = interface;
  PIScheduledToastNotification2 = ^IScheduledToastNotification2;

*)

(*
  // Windows.UI.Notifications.IScheduledTileNotificationFactory
  IScheduledTileNotificationFactory = interface;
  PIScheduledTileNotificationFactory = ^IScheduledTileNotificationFactory;

*)

(*
  // Windows.UI.Notifications.IToastNotificationHistory
  IToastNotificationHistory = interface;
  PIToastNotificationHistory = ^IToastNotificationHistory;

*)

(*
  // Windows.UI.Notifications.IToastNotificationManagerStatics2
  IToastNotificationManagerStatics2 = interface;
  PIToastNotificationManagerStatics2 = ^IToastNotificationManagerStatics2;

*)

  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Notifications.IToastNotification>
  IIterator_1__IToastNotification = interface;
  PIIterator_1__IToastNotification = ^IIterator_1__IToastNotification;

  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Notifications.IToastNotification>
  IIterable_1__IToastNotification = interface;
  PIIterable_1__IToastNotification = ^IIterable_1__IToastNotification;

  // Windows.Foundation.Collections.IVectorView`1<Windows.UI.Notifications.IToastNotification>
  IVectorView_1__IToastNotification = interface;
  PIVectorView_1__IToastNotification = ^IVectorView_1__IToastNotification;

(*
  // Windows.UI.Notifications.IToastNotificationHistory2
  IToastNotificationHistory2 = interface;
  PIToastNotificationHistory2 = ^IToastNotificationHistory2;

*)

(*
  // Windows.UI.Notifications.IToastNotificationHistoryChangedTriggerDetail
  IToastNotificationHistoryChangedTriggerDetail = interface;
  PIToastNotificationHistoryChangedTriggerDetail = ^IToastNotificationHistoryChangedTriggerDetail;

*)

(*
  // Windows.UI.Notifications.IToastNotificationActionTriggerDetail
  IToastNotificationActionTriggerDetail = interface;
  PIToastNotificationActionTriggerDetail = ^IToastNotificationActionTriggerDetail;

*)



  // Emit Forwarded interfaces
  // Windows.UI.Notifications Interfaces
  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Notifications.ToastDismissalReason
  }
  // Windows.UI.Notifications.IToastDismissedEventArgs
  IToastDismissedEventArgs = interface(IInspectable)
  ['{3F89D935-D9CB-4538-A0F0-FFE7659938F8}']
    function get_Reason: ToastDismissalReason; safecall;
    property Reason: ToastDismissalReason read get_Reason;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Notifications.IToastNotification,Windows.UI.Notifications.IToastDismissedEventArgs>
  TypedEventHandler_2__IToastNotification__IToastDismissedEventArgs_Delegate_Base = interface(IUnknown)
  ['{61C2402F-0ED0-5A18-AB69-59F4AA99A368}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.UI.Notifications.IToastNotification
  // Used Types:  Windows.UI.Notifications.IToastDismissedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Notifications.IToastNotification,Windows.UI.Notifications.IToastDismissedEventArgs>
  TypedEventHandler_2__IToastNotification__IToastDismissedEventArgs = interface(TypedEventHandler_2__IToastNotification__IToastDismissedEventArgs_Delegate_Base)
  ['{52B78A8E-3D0A-5C4D-BBBA-24FAF495B9D4}']
    procedure Invoke(sender: IToastNotification; args: IToastDismissedEventArgs); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Notifications.IToastNotification,Object>
  TypedEventHandler_2__IToastNotification__IInspectable_Delegate_Base = interface(IUnknown)
  ['{AB54DE2D-97D9-5528-B6AD-105AFE156530}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.UI.Notifications.IToastNotification
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Notifications.IToastNotification,Object>
  TypedEventHandler_2__IToastNotification__IInspectable = interface(TypedEventHandler_2__IToastNotification__IInspectable_Delegate_Base)
  ['{93621AAC-6E87-5F7A-AA83-927B2D905518}']
    procedure Invoke(sender: IToastNotification; args: IInspectable); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.HResult
  }
  // Windows.UI.Notifications.IToastFailedEventArgs
  IToastFailedEventArgs = interface(IInspectable)
  ['{35176862-CFD4-44F8-AD64-F500FD896C3B}']
    function get_ErrorCode: HRESULT; safecall;
    property ErrorCode: HRESULT read get_ErrorCode;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Notifications.IToastNotification,Windows.UI.Notifications.IToastFailedEventArgs>
  TypedEventHandler_2__IToastNotification__IToastFailedEventArgs_Delegate_Base = interface(IUnknown)
  ['{95E3E803-C969-5E3A-9753-EA2AD22A9A33}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.UI.Notifications.IToastNotification
  // Used Types:  Windows.UI.Notifications.IToastFailedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Notifications.IToastNotification,Windows.UI.Notifications.IToastFailedEventArgs>
  TypedEventHandler_2__IToastNotification__IToastFailedEventArgs = interface(TypedEventHandler_2__IToastNotification__IToastFailedEventArgs_Delegate_Base)
  ['{DB5E9BE6-9CDD-589F-96DA-A4A5D3697DFD}']
    procedure Invoke(sender: IToastNotification; args: IToastFailedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Data.Xml.Dom.IXmlDocument
  // Used Types:  Void
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.DateTime>
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.UI.Notifications.IToastNotification,Windows.UI.Notifications.IToastDismissedEventArgs>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.UI.Notifications.IToastNotification,Object>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.UI.Notifications.IToastNotification,Windows.UI.Notifications.IToastFailedEventArgs>
  }
  // Windows.UI.Notifications.IToastNotification
  IToastNotification = interface(IInspectable)
  ['{997E2675-059E-4E60-8B06-1760917C8B80}']
    function get_Content: Xml_Dom_IXmlDocument; safecall;
    procedure put_ExpirationTime(value: IReference_1__DateTime); safecall;
    function get_ExpirationTime: IReference_1__DateTime; safecall;
    function add_Dismissed(handler: TypedEventHandler_2__IToastNotification__IToastDismissedEventArgs): EventRegistrationToken; safecall;
    procedure remove_Dismissed(cookie: EventRegistrationToken); safecall;
    function add_Activated(handler: TypedEventHandler_2__IToastNotification__IInspectable): EventRegistrationToken; safecall;
    procedure remove_Activated(cookie: EventRegistrationToken); safecall;
    function add_Failed(handler: TypedEventHandler_2__IToastNotification__IToastFailedEventArgs): EventRegistrationToken; safecall;
    procedure remove_Failed(token: EventRegistrationToken); safecall;
    property Content: Xml_Dom_IXmlDocument read get_Content;
    property ExpirationTime: IReference_1__DateTime read get_ExpirationTime write put_ExpirationTime;
  end;

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Data.Xml.Dom.IXmlDocument
  // Used Types:  Void
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.DateTime>
  // Used Types:  String
  }
  // Windows.UI.Notifications.ITileNotification
  ITileNotification = interface(IInspectable)
  ['{EBAEC8FA-50EC-4C18-B4D0-3AF02E5540AB}']
    function get_Content: Xml_Dom_IXmlDocument; safecall;
    procedure put_ExpirationTime(value: IReference_1__DateTime); safecall;
    function get_ExpirationTime: IReference_1__DateTime; safecall;
    procedure put_Tag(value: HSTRING); safecall;
    function get_Tag: HSTRING; safecall;
    property Content: Xml_Dom_IXmlDocument read get_Content;
    property ExpirationTime: IReference_1__DateTime read get_ExpirationTime write put_ExpirationTime;
    property Tag: HSTRING read get_Tag write put_Tag;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Data.Xml.Dom.IXmlDocument
  // Used Types:  Void
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.DateTime>
  }
  // Windows.UI.Notifications.IBadgeNotification
  IBadgeNotification = interface(IInspectable)
  ['{075CB4CA-D08A-4E2F-9233-7E289C1F7722}']
    function get_Content: Xml_Dom_IXmlDocument; safecall;
    procedure put_ExpirationTime(value: IReference_1__DateTime); safecall;
    function get_ExpirationTime: IReference_1__DateTime; safecall;
    property Content: Xml_Dom_IXmlDocument read get_Content;
    property ExpirationTime: IReference_1__DateTime read get_ExpirationTime write put_ExpirationTime;
  end;

*)

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.UI.Notifications.IToastActivatedEventArgs
  IToastActivatedEventArgs = interface(IInspectable)
  ['{E3BF92F3-C197-436F-8265-0625824F8DAC}']
    function get_Arguments: HSTRING; safecall;
    property Arguments: HSTRING read get_Arguments;
  end;

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Data.Xml.Dom.IXmlDocument
  // Used Types:  Windows.Foundation.DateTime
  // Used Types:  Void
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.DateTime>
  // Used Types:  String
  }
  // Windows.UI.Notifications.IScheduledTileNotification
  IScheduledTileNotification = interface(IInspectable)
  ['{0ABCA6D5-99DC-4C78-A11C-C9E7F86D7EF7}']
    function get_Content: Xml_Dom_IXmlDocument; safecall;
    function get_DeliveryTime: DateTime; safecall;
    procedure put_ExpirationTime(value: IReference_1__DateTime); safecall;
    function get_ExpirationTime: IReference_1__DateTime; safecall;
    procedure put_Tag(value: HSTRING); safecall;
    function get_Tag: HSTRING; safecall;
    procedure put_Id(value: HSTRING); safecall;
    function get_Id: HSTRING; safecall;
    property Content: Xml_Dom_IXmlDocument read get_Content;
    property DeliveryTime: DateTime read get_DeliveryTime;
    property ExpirationTime: IReference_1__DateTime read get_ExpirationTime write put_ExpirationTime;
    property Id: HSTRING read get_Id write put_Id;
    property Tag: HSTRING read get_Tag write put_Tag;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.UI.Notifications.IScheduledTileNotification
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Notifications.IScheduledTileNotification>
  IIterator_1__IScheduledTileNotification = interface(IInspectable)
  ['{FBFAEA5C-FD0F-5A52-9292-C373BEF95D84}']
    function get_Current: IScheduledTileNotification; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(out {TODO: verify}items: PIScheduledTileNotification): Cardinal; safecall;
    property Current: IScheduledTileNotification read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

*)

(*
  // Generic Delegate for 
  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Notifications.IScheduledTileNotification>
  IIterable_1__IScheduledTileNotification_Delegate_Base = interface(IUnknown)
  ['{4B60D1E5-52AE-5766-9720-BE4AD086F952}']
  end;
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.UI.Notifications.IScheduledTileNotification>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Notifications.IScheduledTileNotification>
  IIterable_1__IScheduledTileNotification = interface(IIterable_1__IScheduledTileNotification_Delegate_Base)
  ['{12099FA8-B76A-591A-8EBA-C6F4FB5D883B}']
    function First: IIterator_1__IScheduledTileNotification; safecall;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.UI.Notifications.IScheduledTileNotification
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.UI.Notifications.IScheduledTileNotification>
  IVectorView_1__IScheduledTileNotification = interface(IInspectable)
  ['{EA5D1830-98CE-5FEE-A55E-EE2E3948C241}']
    function GetAt(index: Cardinal): IScheduledTileNotification; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IScheduledTileNotification; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; out {TODO: verify}items: PIScheduledTileNotification): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.UI.Notifications.ITileNotification
  // Used Types:  Boolean
  // Used Types:  Windows.UI.Notifications.NotificationSetting
  // Used Types:  Windows.UI.Notifications.IScheduledTileNotification
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.UI.Notifications.IScheduledTileNotification>
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  // Used Types:  Windows.UI.Notifications.PeriodicUpdateRecurrence
  // Used Types:  Windows.Foundation.DateTime
  // Used Types:  Windows.Foundation.Collections.IIterable`1<Windows.Foundation.IUriRuntimeClass>
  }
  // Windows.UI.Notifications.ITileUpdater
  ITileUpdater = interface(IInspectable)
  ['{0942A48B-1D91-44EC-9243-C1E821C29A20}']
    procedure Update(notification: ITileNotification); safecall;
    procedure Clear; safecall;
    procedure EnableNotificationQueue(enable: Boolean); safecall;
    function get_Setting: NotificationSetting; safecall;
    procedure AddToSchedule(scheduledTile: IScheduledTileNotification); safecall;
    procedure RemoveFromSchedule(scheduledTile: IScheduledTileNotification); safecall;
    function GetScheduledTileNotifications: IVectorView_1__IScheduledTileNotification; safecall;
    procedure StartPeriodicUpdate(tileContent: IUriRuntimeClass; requestedInterval: PeriodicUpdateRecurrence); safecall; overload;
    procedure StartPeriodicUpdate(tileContent: IUriRuntimeClass; startTime: DateTime; requestedInterval: PeriodicUpdateRecurrence); safecall; overload;
    procedure StopPeriodicUpdate; safecall;
    procedure StartPeriodicUpdateBatch(tileContents: IIterable_1__IUriRuntimeClass; requestedInterval: PeriodicUpdateRecurrence); safecall; overload;
    procedure StartPeriodicUpdateBatch(tileContents: IIterable_1__IUriRuntimeClass; startTime: DateTime; requestedInterval: PeriodicUpdateRecurrence); safecall; overload;
    property Setting: NotificationSetting read get_Setting;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.UI.Notifications.ITileUpdater
  // Used Types:  String
  // Used Types:  Windows.Data.Xml.Dom.IXmlDocument
  // Used Types:  Windows.UI.Notifications.TileTemplateType
  }
  // Windows.UI.Notifications.ITileUpdateManagerStatics
  ITileUpdateManagerStatics = interface(IInspectable)
  ['{DA159E5D-3EA9-4986-8D84-B09D5E12276D}']
    function CreateTileUpdaterForApplication: ITileUpdater; safecall; overload;
    function CreateTileUpdaterForApplication(applicationId: HSTRING): ITileUpdater; safecall; overload;
    function CreateTileUpdaterForSecondaryTile(tileId: HSTRING): ITileUpdater; safecall;
    function GetTemplateContent(&type: TileTemplateType): Xml_Dom_IXmlDocument; safecall;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Boolean
  }
  // Windows.UI.Notifications.ITileUpdater2
  ITileUpdater2 = interface(IInspectable)
  ['{A2266E12-15EE-43ED-83F5-65B352BB1A84}']
    procedure EnableNotificationQueueForSquare150x150(enable: Boolean); safecall;
    procedure EnableNotificationQueueForWide310x150(enable: Boolean); safecall;
    procedure EnableNotificationQueueForSquare310x310(enable: Boolean); safecall;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Data.Xml.Dom.IXmlDocument
  // Used Types:  Void
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.DateTime>
  }
  // Windows.UI.Notifications.ITileFlyoutNotification
  ITileFlyoutNotification = interface(IInspectable)
  ['{9A53B261-C70C-42BE-B2F3-F42AA97D34E5}']
    function get_Content: Xml_Dom_IXmlDocument; safecall;
    procedure put_ExpirationTime(value: IReference_1__DateTime); safecall;
    function get_ExpirationTime: IReference_1__DateTime; safecall;
    property Content: Xml_Dom_IXmlDocument read get_Content;
    property ExpirationTime: IReference_1__DateTime read get_ExpirationTime write put_ExpirationTime;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.UI.Notifications.ITileFlyoutNotification
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  // Used Types:  Windows.UI.Notifications.PeriodicUpdateRecurrence
  // Used Types:  Windows.Foundation.DateTime
  // Used Types:  Windows.UI.Notifications.NotificationSetting
  }
  // Windows.UI.Notifications.ITileFlyoutUpdater
  ITileFlyoutUpdater = interface(IInspectable)
  ['{8D40C76A-C465-4052-A740-5C2654C1A089}']
    procedure Update(notification: ITileFlyoutNotification); safecall;
    procedure Clear; safecall;
    procedure StartPeriodicUpdate(tileFlyoutContent: IUriRuntimeClass; requestedInterval: PeriodicUpdateRecurrence); safecall; overload;
    procedure StartPeriodicUpdate(tileFlyoutContent: IUriRuntimeClass; startTime: DateTime; requestedInterval: PeriodicUpdateRecurrence); safecall; overload;
    procedure StopPeriodicUpdate; safecall;
    function get_Setting: NotificationSetting; safecall;
    property Setting: NotificationSetting read get_Setting;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.UI.Notifications.ITileFlyoutUpdater
  // Used Types:  String
  // Used Types:  Windows.Data.Xml.Dom.IXmlDocument
  // Used Types:  Windows.UI.Notifications.TileFlyoutTemplateType
  }
  // Windows.UI.Notifications.ITileFlyoutUpdateManagerStatics
  ITileFlyoutUpdateManagerStatics = interface(IInspectable)
  ['{04363B0B-1AC0-4B99-88E7-ADA83E953D48}']
    function CreateTileFlyoutUpdaterForApplication: ITileFlyoutUpdater; safecall; overload;
    function CreateTileFlyoutUpdaterForApplication(applicationId: HSTRING): ITileFlyoutUpdater; safecall; overload;
    function CreateTileFlyoutUpdaterForSecondaryTile(tileId: HSTRING): ITileFlyoutUpdater; safecall;
    function GetTemplateContent(&type: TileFlyoutTemplateType): Xml_Dom_IXmlDocument; safecall;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.UI.Notifications.IBadgeNotification
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  // Used Types:  Windows.UI.Notifications.PeriodicUpdateRecurrence
  // Used Types:  Windows.Foundation.DateTime
  }
  // Windows.UI.Notifications.IBadgeUpdater
  IBadgeUpdater = interface(IInspectable)
  ['{B5FA1FD4-7562-4F6C-BFA3-1B6ED2E57F2F}']
    procedure Update(notification: IBadgeNotification); safecall;
    procedure Clear; safecall;
    procedure StartPeriodicUpdate(badgeContent: IUriRuntimeClass; requestedInterval: PeriodicUpdateRecurrence); safecall; overload;
    procedure StartPeriodicUpdate(badgeContent: IUriRuntimeClass; startTime: DateTime; requestedInterval: PeriodicUpdateRecurrence); safecall; overload;
    procedure StopPeriodicUpdate; safecall;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.UI.Notifications.IBadgeUpdater
  // Used Types:  String
  // Used Types:  Windows.Data.Xml.Dom.IXmlDocument
  // Used Types:  Windows.UI.Notifications.BadgeTemplateType
  }
  // Windows.UI.Notifications.IBadgeUpdateManagerStatics
  IBadgeUpdateManagerStatics = interface(IInspectable)
  ['{33400FAA-6DD5-4105-AEBC-9B50FCA492DA}']
    function CreateBadgeUpdaterForApplication: IBadgeUpdater; safecall; overload;
    function CreateBadgeUpdaterForApplication(applicationId: HSTRING): IBadgeUpdater; safecall; overload;
    function CreateBadgeUpdaterForSecondaryTile(tileId: HSTRING): IBadgeUpdater; safecall;
    function GetTemplateContent(&type: BadgeTemplateType): Xml_Dom_IXmlDocument; safecall;
  end;

*)

  // UsedAPI Interface
  {
  // Used Types:  Windows.Data.Xml.Dom.IXmlDocument
  // Used Types:  Windows.Foundation.DateTime
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.TimeSpan>
  // Used Types:  UInt32
  // Used Types:  Void
  // Used Types:  String
  }
  // Windows.UI.Notifications.IScheduledToastNotification
  IScheduledToastNotification = interface(IInspectable)
  ['{79F577F8-0DE7-48CD-9740-9B370490C838}']
    function get_Content: Xml_Dom_IXmlDocument; safecall;
    function get_DeliveryTime: DateTime; safecall;
    function get_SnoozeInterval: IReference_1__TimeSpan; safecall;
    function get_MaximumSnoozeCount: Cardinal; safecall;
    procedure put_Id(value: HSTRING); safecall;
    function get_Id: HSTRING; safecall;
    property Content: Xml_Dom_IXmlDocument read get_Content;
    property DeliveryTime: DateTime read get_DeliveryTime;
    property Id: HSTRING read get_Id write put_Id;
    property MaximumSnoozeCount: Cardinal read get_MaximumSnoozeCount;
    property SnoozeInterval: IReference_1__TimeSpan read get_SnoozeInterval;
  end;

  {
  // Used Types:  Windows.UI.Notifications.IScheduledToastNotification
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Notifications.IScheduledToastNotification>
  IIterator_1__IScheduledToastNotification = interface(IInspectable)
  ['{6C34AAF7-B3EF-5E61-ADA9-2024702696C6}']
    function get_Current: IScheduledToastNotification; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(out {TODO: verify}items: PIScheduledToastNotification): Cardinal; safecall;
    property Current: IScheduledToastNotification read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Delegate for 
  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Notifications.IScheduledToastNotification>
  IIterable_1__IScheduledToastNotification_Delegate_Base = interface(IUnknown)
  ['{7A7B2A51-C182-5846-A861-4F9C036F24AD}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.UI.Notifications.IScheduledToastNotification>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Notifications.IScheduledToastNotification>
  IIterable_1__IScheduledToastNotification = interface(IIterable_1__IScheduledToastNotification_Delegate_Base)
  ['{92B73B0F-5001-54D8-B43C-AAB6D146FBC9}']
    function First: IIterator_1__IScheduledToastNotification; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Notifications.IScheduledToastNotification
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.UI.Notifications.IScheduledToastNotification>
  IVectorView_1__IScheduledToastNotification = interface(IInspectable)
  ['{762EC9E6-C409-5C27-B61F-C480347C1816}']
    function GetAt(index: Cardinal): IScheduledToastNotification; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IScheduledToastNotification; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; out {TODO: verify}items: PIScheduledToastNotification): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.UI.Notifications.IToastNotification
  // Used Types:  Windows.UI.Notifications.NotificationSetting
  // Used Types:  Windows.UI.Notifications.IScheduledToastNotification
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.UI.Notifications.IScheduledToastNotification>
  }
  // Windows.UI.Notifications.IToastNotifier
  IToastNotifier = interface(IInspectable)
  ['{75927B93-03F3-41EC-91D3-6E5BAC1B38E7}']
    procedure Show(notification: IToastNotification); safecall;
    procedure Hide(notification: IToastNotification); safecall;
    function get_Setting: NotificationSetting; safecall;
    procedure AddToSchedule(scheduledToast: IScheduledToastNotification); safecall;
    procedure RemoveFromSchedule(scheduledToast: IScheduledToastNotification); safecall;
    function GetScheduledToastNotifications: IVectorView_1__IScheduledToastNotification; safecall;
    property Setting: NotificationSetting read get_Setting;
  end;

  {
  // Used Types:  Windows.UI.Notifications.IToastNotifier
  // Used Types:  String
  // Used Types:  Windows.Data.Xml.Dom.IXmlDocument
  // Used Types:  Windows.UI.Notifications.ToastTemplateType
  }
  // Windows.UI.Notifications.IToastNotificationManagerStatics
  IToastNotificationManagerStatics = interface(IInspectable)
  ['{50AC103F-D235-4598-BBEF-98FE4D1A3AD4}']
    function CreateToastNotifier: IToastNotifier; safecall; overload;
    function CreateToastNotifier(applicationId: HSTRING): IToastNotifier; safecall; overload;
    function GetTemplateContent(&type: ToastTemplateType): Xml_Dom_IXmlDocument; safecall;
  end;

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.UI.Notifications.ITileNotification
  // Used Types:  Windows.Data.Xml.Dom.IXmlDocument
  }
  // Windows.UI.Notifications.ITileNotificationFactory
  ITileNotificationFactory = interface(IInspectable)
  ['{C6ABDD6E-4928-46C8-BDBF-81A047DEA0D4}']
    function CreateTileNotification(content: Xml_Dom_IXmlDocument): ITileNotification; safecall;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.UI.Notifications.ITileFlyoutNotification
  // Used Types:  Windows.Data.Xml.Dom.IXmlDocument
  }
  // Windows.UI.Notifications.ITileFlyoutNotificationFactory
  ITileFlyoutNotificationFactory = interface(IInspectable)
  ['{EF556FF5-5226-4F2B-B278-88A35DFE569F}']
    function CreateTileFlyoutNotification(content: Xml_Dom_IXmlDocument): ITileFlyoutNotification; safecall;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.UI.Notifications.IBadgeNotification
  // Used Types:  Windows.Data.Xml.Dom.IXmlDocument
  }
  // Windows.UI.Notifications.IBadgeNotificationFactory
  IBadgeNotificationFactory = interface(IInspectable)
  ['{EDF255CE-0618-4D59-948A-5A61040C52F9}']
    function CreateBadgeNotification(content: Xml_Dom_IXmlDocument): IBadgeNotification; safecall;
  end;

*)

  {
  // Used Types:  Windows.UI.Notifications.IToastNotification
  // Used Types:  Windows.Data.Xml.Dom.IXmlDocument
  }
  // Windows.UI.Notifications.IToastNotificationFactory
  IToastNotificationFactory = interface(IInspectable)
  ['{04124B20-82C6-4229-B109-FD9ED4662B53}']
    function CreateToastNotification(content: Xml_Dom_IXmlDocument): IToastNotification; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Void
  // Used Types:  String
  // Used Types:  Boolean
  }
  // Windows.UI.Notifications.IToastNotification2
  IToastNotification2 = interface(IInspectable)
  ['{9DFB9FD1-143A-490E-90BF-B9FBA7132DE7}']
    procedure put_Tag(value: HSTRING); safecall;
    function get_Tag: HSTRING; safecall;
    procedure put_Group(value: HSTRING); safecall;
    function get_Group: HSTRING; safecall;
    procedure put_SuppressPopup(value: Boolean); safecall;
    function get_SuppressPopup: Boolean; safecall;
    property Group: HSTRING read get_Group write put_Group;
    property SuppressPopup: Boolean read get_SuppressPopup write put_SuppressPopup;
    property Tag: HSTRING read get_Tag write put_Tag;
  end;

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.UI.Notifications.IScheduledToastNotification
  // Used Types:  Windows.Data.Xml.Dom.IXmlDocument
  // Used Types:  Windows.Foundation.DateTime
  // Used Types:  Windows.Foundation.TimeSpan
  // Used Types:  UInt32
  }
  // Windows.UI.Notifications.IScheduledToastNotificationFactory
  IScheduledToastNotificationFactory = interface(IInspectable)
  ['{E7BED191-0BB9-4189-8394-31761B476FD7}']
    function CreateScheduledToastNotification(content: Xml_Dom_IXmlDocument; deliveryTime: DateTime): IScheduledToastNotification; safecall;
    function CreateScheduledToastNotificationRecurring(content: Xml_Dom_IXmlDocument; deliveryTime: DateTime; snoozeInterval: TimeSpan; maximumSnoozeCount: Cardinal): IScheduledToastNotification; safecall;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Void
  // Used Types:  String
  // Used Types:  Boolean
  }
  // Windows.UI.Notifications.IScheduledToastNotification2
  IScheduledToastNotification2 = interface(IInspectable)
  ['{A66EA09C-31B4-43B0-B5DD-7A40E85363B1}']
    procedure put_Tag(value: HSTRING); safecall;
    function get_Tag: HSTRING; safecall;
    procedure put_Group(value: HSTRING); safecall;
    function get_Group: HSTRING; safecall;
    procedure put_SuppressPopup(value: Boolean); safecall;
    function get_SuppressPopup: Boolean; safecall;
    property Group: HSTRING read get_Group write put_Group;
    property SuppressPopup: Boolean read get_SuppressPopup write put_SuppressPopup;
    property Tag: HSTRING read get_Tag write put_Tag;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.UI.Notifications.IScheduledTileNotification
  // Used Types:  Windows.Data.Xml.Dom.IXmlDocument
  // Used Types:  Windows.Foundation.DateTime
  }
  // Windows.UI.Notifications.IScheduledTileNotificationFactory
  IScheduledTileNotificationFactory = interface(IInspectable)
  ['{3383138A-98C0-4C3B-BBD6-4A633C7CFC29}']
    function CreateScheduledTileNotification(content: Xml_Dom_IXmlDocument; deliveryTime: DateTime): IScheduledTileNotification; safecall;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Void
  // Used Types:  String
  }
  // Windows.UI.Notifications.IToastNotificationHistory
  IToastNotificationHistory = interface(IInspectable)
  ['{5CADDC63-01D3-4C97-986F-0533483FEE14}']
    procedure RemoveGroup(group: HSTRING); safecall; overload;
    procedure RemoveGroup(group: HSTRING; applicationId: HSTRING); safecall; overload;
    procedure Remove(tag: HSTRING; group: HSTRING; applicationId: HSTRING); safecall; overload;
    procedure Remove(tag: HSTRING; group: HSTRING); safecall; overload;
    procedure Remove(tag: HSTRING); safecall; overload;
    procedure Clear; safecall; overload;
    procedure Clear(applicationId: HSTRING); safecall; overload;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.UI.Notifications.IToastNotificationHistory
  }
  // Windows.UI.Notifications.IToastNotificationManagerStatics2
  IToastNotificationManagerStatics2 = interface(IInspectable)
  ['{7AB93C52-0E48-4750-BA9D-1A4113981847}']
    function get_History: IToastNotificationHistory; safecall;
    property History: IToastNotificationHistory read get_History;
  end;

*)

  {
  // Used Types:  Windows.UI.Notifications.IToastNotification
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Notifications.IToastNotification>
  IIterator_1__IToastNotification = interface(IInspectable)
  ['{ABA5D40A-4EF1-5090-8A7E-B2B779BCCBB7}']
    function get_Current: IToastNotification; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(out {TODO: verify}items: PIToastNotification): Cardinal; safecall;
    property Current: IToastNotification read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Delegate for 
  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Notifications.IToastNotification>
  IIterable_1__IToastNotification_Delegate_Base = interface(IUnknown)
  ['{52C9428B-D37A-554D-BF55-B8685D5F552D}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.UI.Notifications.IToastNotification>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Notifications.IToastNotification>
  IIterable_1__IToastNotification = interface(IIterable_1__IToastNotification_Delegate_Base)
  ['{DD43185C-C276-593B-B076-B598FCD176DB}']
    function First: IIterator_1__IToastNotification; safecall;
  end;

  {
  // Used Types:  Windows.UI.Notifications.IToastNotification
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.UI.Notifications.IToastNotification>
  IVectorView_1__IToastNotification = interface(IInspectable)
  ['{82CB31B6-357F-581F-A6C9-CBCB308BAEC8}']
    function GetAt(index: Cardinal): IToastNotification; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IToastNotification; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; out {TODO: verify}items: PIToastNotification): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.UI.Notifications.IToastNotification>
  // Used Types:  String
  }
  // Windows.UI.Notifications.IToastNotificationHistory2
  IToastNotificationHistory2 = interface(IInspectable)
  ['{3BC3D253-2F31-4092-9129-8AD5ABF067DA}']
    function GetHistory: IVectorView_1__IToastNotification; safecall; overload;
    function GetHistory(applicationId: HSTRING): IVectorView_1__IToastNotification; safecall; overload;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.UI.Notifications.ToastHistoryChangedType
  }
  // Windows.UI.Notifications.IToastNotificationHistoryChangedTriggerDetail
  IToastNotificationHistoryChangedTriggerDetail = interface(IInspectable)
  ['{DB037FFA-0068-412C-9C83-267C37F65670}']
    function get_ChangeType: ToastHistoryChangedType; safecall;
    property ChangeType: ToastHistoryChangedType read get_ChangeType;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Foundation.Collections.IPropertySet
  }
  // Windows.UI.Notifications.IToastNotificationActionTriggerDetail
  IToastNotificationActionTriggerDetail = interface(IInspectable)
  ['{9445135A-38F3-42F6-96AA-7955B0F03DA2}']
    function get_Argument: HSTRING; safecall;
    function get_UserInput: IPropertySet; safecall;
    property Argument: HSTRING read get_Argument;
    property UserInput: IPropertySet read get_UserInput;
  end;

*)


implementation

end.
