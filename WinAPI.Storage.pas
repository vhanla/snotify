{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2015-2015 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit WinAPI.Storage;

interface
uses 
  // Fixed Uses...
  // Internal Uses...
  WinAPI.Foundation,
  WinAPI.Storage.Streams,
  WinAPI.Foundation.Collections,
//  WinAPI.Data,
//  WinAPI.System,
  WinAPI.Foundation.Types,
  WinAPI.CommonTypes,
  Winapi.Winrt,
  System.Types;


{$SCOPEDENUMS ON}

const
  // Windows.Storage Class Names
  // Windows.Storage.Search.ContentIndexer
  // WinRT Only
  SSearch_ContentIndexer = 'Windows.Storage.Search.ContentIndexer';
  // Windows.Storage.Search.ValueAndLanguage
  // WinRT Only
  SSearch_ValueAndLanguage = 'Windows.Storage.Search.ValueAndLanguage';
  // Windows.Storage.Search.ContentIndexerQuery
  // WinRT Only
  SSearch_ContentIndexerQuery = 'Windows.Storage.Search.ContentIndexerQuery';
  // Windows.Storage.Search.IndexableContent
  // WinRT Only
  SSearch_IndexableContent = 'Windows.Storage.Search.IndexableContent';
  // Windows.Storage.Pickers.Provider.FileRemovedEventArgs
  // WinRT Only
  SPickers_Provider_FileRemovedEventArgs = 'Windows.Storage.Pickers.Provider.FileRemovedEventArgs';
  // Windows.Storage.Pickers.Provider.FileOpenPickerUI
  // WinRT Only
  SPickers_Provider_FileOpenPickerUI = 'Windows.Storage.Pickers.Provider.FileOpenPickerUI';
  // Windows.Storage.Pickers.Provider.PickerClosingEventArgs
  // WinRT Only
  SPickers_Provider_PickerClosingEventArgs = 'Windows.Storage.Pickers.Provider.PickerClosingEventArgs';
  // Windows.Storage.Pickers.Provider.PickerClosingOperation
  // WinRT Only
  SPickers_Provider_PickerClosingOperation = 'Windows.Storage.Pickers.Provider.PickerClosingOperation';
  // Windows.Storage.Pickers.Provider.PickerClosingDeferral
  // WinRT Only
  SPickers_Provider_PickerClosingDeferral = 'Windows.Storage.Pickers.Provider.PickerClosingDeferral';
  // Windows.Storage.Pickers.Provider.FileSavePickerUI
  // WinRT Only
  SPickers_Provider_FileSavePickerUI = 'Windows.Storage.Pickers.Provider.FileSavePickerUI';
  // Windows.Storage.Pickers.Provider.TargetFileRequestedEventArgs
  // WinRT Only
  SPickers_Provider_TargetFileRequestedEventArgs = 'Windows.Storage.Pickers.Provider.TargetFileRequestedEventArgs';
  // Windows.Storage.Pickers.Provider.TargetFileRequest
  // WinRT Only
  SPickers_Provider_TargetFileRequest = 'Windows.Storage.Pickers.Provider.TargetFileRequest';
  // Windows.Storage.Pickers.Provider.TargetFileRequestDeferral
  // WinRT Only
  SPickers_Provider_TargetFileRequestDeferral = 'Windows.Storage.Pickers.Provider.TargetFileRequestDeferral';
  // Windows.Storage.Provider.CachedFileUpdaterUI
  // WinRT Only
  SProvider_CachedFileUpdaterUI = 'Windows.Storage.Provider.CachedFileUpdaterUI';
  // Windows.Storage.Provider.FileUpdateRequestedEventArgs
  // WinRT Only
  SProvider_FileUpdateRequestedEventArgs = 'Windows.Storage.Provider.FileUpdateRequestedEventArgs';
  // Windows.Storage.Provider.FileUpdateRequest
  // WinRT Only
  SProvider_FileUpdateRequest = 'Windows.Storage.Provider.FileUpdateRequest';
  // Windows.Storage.Provider.FileUpdateRequestDeferral
  // WinRT Only
  SProvider_FileUpdateRequestDeferral = 'Windows.Storage.Provider.FileUpdateRequestDeferral';
  // Windows.Storage.FileProperties.GeotagHelper
  // DualAPI
  SFileProperties_GeotagHelper = 'Windows.Storage.FileProperties.GeotagHelper';
  // Windows.Storage.FileProperties.StorageItemThumbnail
  // WinRT Only
  SFileProperties_StorageItemThumbnail = 'Windows.Storage.FileProperties.StorageItemThumbnail';
  // Windows.Storage.FileProperties.MusicProperties
  // WinRT Only
  SFileProperties_MusicProperties = 'Windows.Storage.FileProperties.MusicProperties';
  // Windows.Storage.FileProperties.VideoProperties
  // WinRT Only
  SFileProperties_VideoProperties = 'Windows.Storage.FileProperties.VideoProperties';
  // Windows.Storage.FileProperties.ImageProperties
  // WinRT Only
  SFileProperties_ImageProperties = 'Windows.Storage.FileProperties.ImageProperties';
  // Windows.Storage.FileProperties.DocumentProperties
  // WinRT Only
  SFileProperties_DocumentProperties = 'Windows.Storage.FileProperties.DocumentProperties';
  // Windows.Storage.FileProperties.StorageItemContentProperties
  // WinRT Only
  SFileProperties_StorageItemContentProperties = 'Windows.Storage.FileProperties.StorageItemContentProperties';
  // Windows.Storage.FileProperties.BasicProperties
  // WinRT Only
  SFileProperties_BasicProperties = 'Windows.Storage.FileProperties.BasicProperties';
  // Windows.Storage.StorageLibrary
  // WinRT Only
  SStorageLibrary = 'Windows.Storage.StorageLibrary';
  // Windows.Storage.StorageFolder
  // WinRT Only
  SStorageFolder = 'Windows.Storage.StorageFolder';
  // Windows.Storage.KnownFolders
  // WinRT Only
  SKnownFolders = 'Windows.Storage.KnownFolders';
  // Windows.Storage.StorageFile
  // WinRT Only
  SStorageFile = 'Windows.Storage.StorageFile';
  // Windows.Storage.DownloadsFolder
  // WinRT Only
  SDownloadsFolder = 'Windows.Storage.DownloadsFolder';
  // Windows.Storage.StreamedFileDataRequest
  // WinRT Only
  SStreamedFileDataRequest = 'Windows.Storage.StreamedFileDataRequest';
  // Windows.Storage.StorageStreamTransaction
  // WinRT Only
  SStorageStreamTransaction = 'Windows.Storage.StorageStreamTransaction';
  // Windows.Storage.StorageProvider
  // WinRT Only
  SStorageProvider = 'Windows.Storage.StorageProvider';
  // Windows.Storage.Search.QueryOptions
  // WinRT Only
  SSearch_QueryOptions = 'Windows.Storage.Search.QueryOptions';
  // Windows.Storage.Search.StorageFileQueryResult
  // WinRT Only
  SSearch_StorageFileQueryResult = 'Windows.Storage.Search.StorageFileQueryResult';
  // Windows.Storage.Search.StorageFolderQueryResult
  // WinRT Only
  SSearch_StorageFolderQueryResult = 'Windows.Storage.Search.StorageFolderQueryResult';
  // Windows.Storage.Search.StorageItemQueryResult
  // WinRT Only
  SSearch_StorageItemQueryResult = 'Windows.Storage.Search.StorageItemQueryResult';
  // Windows.Storage.Provider.CachedFileUpdater
  // WinRT Only
  SProvider_CachedFileUpdater = 'Windows.Storage.Provider.CachedFileUpdater';
  // Windows.Storage.FileIO
  // WinRT Only
  SFileIO = 'Windows.Storage.FileIO';
  // Windows.Storage.PathIO
  // WinRT Only
  SPathIO = 'Windows.Storage.PathIO';
  // Windows.Storage.CachedFileManager
  // WinRT Only
  SCachedFileManager = 'Windows.Storage.CachedFileManager';
  // Windows.Storage.Search.SortEntryVector
  // WinRT Only
  SSearch_SortEntryVector = 'Windows.Storage.Search.SortEntryVector';
  // Windows.Storage.Search.StorageLibraryContentChangedTriggerDetails
  // WinRT Only
  SSearch_StorageLibraryContentChangedTriggerDetails = 'Windows.Storage.Search.StorageLibraryContentChangedTriggerDetails';
  // Windows.Storage.AccessCache.AccessListEntryView
  // WinRT Only
  SAccessCache_AccessListEntryView = 'Windows.Storage.AccessCache.AccessListEntryView';
  // Windows.Storage.AccessCache.StorageItemMostRecentlyUsedList
  // WinRT Only
  SAccessCache_StorageItemMostRecentlyUsedList = 'Windows.Storage.AccessCache.StorageItemMostRecentlyUsedList';
  // Windows.Storage.AccessCache.ItemRemovedEventArgs
  // WinRT Only
  SAccessCache_ItemRemovedEventArgs = 'Windows.Storage.AccessCache.ItemRemovedEventArgs';
  // Windows.Storage.AccessCache.StorageItemAccessList
  // WinRT Only
  SAccessCache_StorageItemAccessList = 'Windows.Storage.AccessCache.StorageItemAccessList';
  // Windows.Storage.AccessCache.StorageApplicationPermissions
  // WinRT Only
  SAccessCache_StorageApplicationPermissions = 'Windows.Storage.AccessCache.StorageApplicationPermissions';
  // Windows.Storage.BulkAccess.FileInformationFactory
  // WinRT Only
  SBulkAccess_FileInformationFactory = 'Windows.Storage.BulkAccess.FileInformationFactory';
  // Windows.Storage.BulkAccess.FileInformation
  // WinRT Only
  SBulkAccess_FileInformation = 'Windows.Storage.BulkAccess.FileInformation';
  // Windows.Storage.BulkAccess.FolderInformation
  // WinRT Only
  SBulkAccess_FolderInformation = 'Windows.Storage.BulkAccess.FolderInformation';
  // Windows.Storage.Pickers.FilePickerSelectedFilesArray
  // WinRT Only
  SPickers_FilePickerSelectedFilesArray = 'Windows.Storage.Pickers.FilePickerSelectedFilesArray';
  // Windows.Storage.Pickers.FilePickerFileTypesOrderedMap
  // WinRT Only
  SPickers_FilePickerFileTypesOrderedMap = 'Windows.Storage.Pickers.FilePickerFileTypesOrderedMap';
  // Windows.Storage.Pickers.FileExtensionVector
  // WinRT Only
  SPickers_FileExtensionVector = 'Windows.Storage.Pickers.FileExtensionVector';
  // Windows.Storage.Pickers.FileOpenPicker
  // WinRT Only
  SPickers_FileOpenPicker = 'Windows.Storage.Pickers.FileOpenPicker';
  // Windows.Storage.Pickers.FileSavePicker
  // WinRT Only
  SPickers_FileSavePicker = 'Windows.Storage.Pickers.FileSavePicker';
  // Windows.Storage.Pickers.FolderPicker
  // WinRT Only
  SPickers_FolderPicker = 'Windows.Storage.Pickers.FolderPicker';
  // Windows.Storage.SystemAudioProperties
  // WinRT Only
  SSystemAudioProperties = 'Windows.Storage.SystemAudioProperties';
  // Windows.Storage.SystemGPSProperties
  // WinRT Only
  SSystemGPSProperties = 'Windows.Storage.SystemGPSProperties';
  // Windows.Storage.SystemImageProperties
  // WinRT Only
  SSystemImageProperties = 'Windows.Storage.SystemImageProperties';
  // Windows.Storage.SystemMediaProperties
  // WinRT Only
  SSystemMediaProperties = 'Windows.Storage.SystemMediaProperties';
  // Windows.Storage.SystemMusicProperties
  // WinRT Only
  SSystemMusicProperties = 'Windows.Storage.SystemMusicProperties';
  // Windows.Storage.SystemPhotoProperties
  // WinRT Only
  SSystemPhotoProperties = 'Windows.Storage.SystemPhotoProperties';
  // Windows.Storage.SystemVideoProperties
  // WinRT Only
  SSystemVideoProperties = 'Windows.Storage.SystemVideoProperties';
  // Windows.Storage.SystemProperties
  // WinRT Only
  SSystemProperties = 'Windows.Storage.SystemProperties';
  // Windows.Storage.ApplicationData
  // DualAPI
  SApplicationData = 'Windows.Storage.ApplicationData';
  // Windows.Storage.SetVersionRequest
  // DualAPI
  SSetVersionRequest = 'Windows.Storage.SetVersionRequest';
  // Windows.Storage.ApplicationDataContainer
  // DualAPI
  SApplicationDataContainer = 'Windows.Storage.ApplicationDataContainer';
  // Windows.Storage.SetVersionDeferral
  // DualAPI
  SSetVersionDeferral = 'Windows.Storage.SetVersionDeferral';
  // Windows.Storage.ApplicationDataContainerSettings
  // DualAPI
  SApplicationDataContainerSettings = 'Windows.Storage.ApplicationDataContainerSettings';
  // Windows.Storage.ApplicationDataCompositeValue
  // DualAPI
  SApplicationDataCompositeValue = 'Windows.Storage.ApplicationDataCompositeValue';
  // Windows.Storage.Compression.Compressor
  // DualAPI
  SCompression_Compressor = 'Windows.Storage.Compression.Compressor';
  // Windows.Storage.Compression.Decompressor
  // DualAPI
  SCompression_Decompressor = 'Windows.Storage.Compression.Decompressor';


type

  // Forward declare interfaces
  // Windows.Storage.FileProperties.IBasicProperties
  FileProperties_IBasicProperties = interface;
  PFileProperties_IBasicProperties = ^FileProperties_IBasicProperties;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.FileProperties.IBasicProperties>
  AsyncOperationCompletedHandler_1__FileProperties_IBasicProperties = interface;
  PAsyncOperationCompletedHandler_1__FileProperties_IBasicProperties = ^AsyncOperationCompletedHandler_1__FileProperties_IBasicProperties;

  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.FileProperties.IBasicProperties>
  IAsyncOperation_1__FileProperties_IBasicProperties = interface;
  PIAsyncOperation_1__FileProperties_IBasicProperties = ^IAsyncOperation_1__FileProperties_IBasicProperties;

  // Windows.Storage.IStorageItem
  IStorageItem = interface;
  PIStorageItem = ^IStorageItem;

  // Windows.Storage.IStorageStreamTransaction
  IStorageStreamTransaction = interface;
  PIStorageStreamTransaction = ^IStorageStreamTransaction;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.IStorageStreamTransaction>
  AsyncOperationCompletedHandler_1__IStorageStreamTransaction = interface;
  PAsyncOperationCompletedHandler_1__IStorageStreamTransaction = ^AsyncOperationCompletedHandler_1__IStorageStreamTransaction;

  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.IStorageStreamTransaction>
  IAsyncOperation_1__IStorageStreamTransaction = interface;
  PIAsyncOperation_1__IStorageStreamTransaction = ^IAsyncOperation_1__IStorageStreamTransaction;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.IStorageFolder>
  AsyncOperationCompletedHandler_1__IStorageFolder = interface;
  PAsyncOperationCompletedHandler_1__IStorageFolder = ^AsyncOperationCompletedHandler_1__IStorageFolder;

  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.IStorageFolder>
  IAsyncOperation_1__IStorageFolder = interface;
  PIAsyncOperation_1__IStorageFolder = ^IAsyncOperation_1__IStorageFolder;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.IStorageItem>
  AsyncOperationCompletedHandler_1__IStorageItem = interface;
  PAsyncOperationCompletedHandler_1__IStorageItem = ^AsyncOperationCompletedHandler_1__IStorageItem;

  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.IStorageItem>
  IAsyncOperation_1__IStorageItem = interface;
  PIAsyncOperation_1__IStorageItem = ^IAsyncOperation_1__IStorageItem;

  // Windows.Foundation.Collections.IIterator`1<Windows.Storage.IStorageFile>
  IIterator_1__IStorageFile = interface;
  PIIterator_1__IStorageFile = ^IIterator_1__IStorageFile;

(*
  // Windows.Foundation.Collections.IIterable`1<Windows.Storage.IStorageFile>
  IIterable_1__IStorageFile = interface;
  PIIterable_1__IStorageFile = ^IIterable_1__IStorageFile;

*)

  // Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageFile>
  IVectorView_1__IStorageFile = interface;
  PIVectorView_1__IStorageFile = ^IVectorView_1__IStorageFile;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageFile>>
  AsyncOperationCompletedHandler_1__IVectorView_1__IStorageFile = interface;
  PAsyncOperationCompletedHandler_1__IVectorView_1__IStorageFile = ^AsyncOperationCompletedHandler_1__IVectorView_1__IStorageFile;

  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageFile>>
  IAsyncOperation_1__IVectorView_1__IStorageFile = interface;
  PIAsyncOperation_1__IVectorView_1__IStorageFile = ^IAsyncOperation_1__IVectorView_1__IStorageFile;

  // Windows.Foundation.Collections.IIterator`1<Windows.Storage.IStorageFolder>
  IIterator_1__IStorageFolder = interface;
  PIIterator_1__IStorageFolder = ^IIterator_1__IStorageFolder;

  // Windows.Foundation.Collections.IIterable`1<Windows.Storage.IStorageFolder>
  IIterable_1__IStorageFolder = interface;
  PIIterable_1__IStorageFolder = ^IIterable_1__IStorageFolder;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageFolder>
  IVectorView_1__IStorageFolder = interface;
  PIVectorView_1__IStorageFolder = ^IVectorView_1__IStorageFolder;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageFolder>>
  AsyncOperationCompletedHandler_1__IVectorView_1__IStorageFolder = interface;
  PAsyncOperationCompletedHandler_1__IVectorView_1__IStorageFolder = ^AsyncOperationCompletedHandler_1__IVectorView_1__IStorageFolder;

  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageFolder>>
  IAsyncOperation_1__IVectorView_1__IStorageFolder = interface;
  PIAsyncOperation_1__IVectorView_1__IStorageFolder = ^IAsyncOperation_1__IVectorView_1__IStorageFolder;

  // Windows.Foundation.Collections.IIterator`1<Windows.Storage.IStorageItem>
  IIterator_1__IStorageItem = interface;
  PIIterator_1__IStorageItem = ^IIterator_1__IStorageItem;

  // Windows.Foundation.Collections.IIterable`1<Windows.Storage.IStorageItem>
  IIterable_1__IStorageItem = interface;
  PIIterable_1__IStorageItem = ^IIterable_1__IStorageItem;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageItem>
  IVectorView_1__IStorageItem = interface;
  PIVectorView_1__IStorageItem = ^IVectorView_1__IStorageItem;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageItem>>
  AsyncOperationCompletedHandler_1__IVectorView_1__IStorageItem = interface;
  PAsyncOperationCompletedHandler_1__IVectorView_1__IStorageItem = ^AsyncOperationCompletedHandler_1__IVectorView_1__IStorageItem;

  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageItem>>
  IAsyncOperation_1__IVectorView_1__IStorageItem = interface;
  PIAsyncOperation_1__IVectorView_1__IStorageItem = ^IAsyncOperation_1__IVectorView_1__IStorageItem;

  // Windows.Storage.IStorageFolder
  IStorageFolder = interface;
  PIStorageFolder = ^IStorageFolder;

  // Windows.Storage.IStorageFile
  IStorageFile = interface;
  PIStorageFile = ^IStorageFile;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.IStorageFile>
  AsyncOperationCompletedHandler_1__IStorageFile = interface;
  PAsyncOperationCompletedHandler_1__IStorageFile = ^AsyncOperationCompletedHandler_1__IStorageFile;

  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.IStorageFile>
  IAsyncOperation_1__IStorageFile = interface;
  PIAsyncOperation_1__IStorageFile = ^IAsyncOperation_1__IStorageFile;

  // Windows.Foundation.Collections.IVector`1<Windows.Storage.IStorageFolder>
  IVector_1__IStorageFolder = interface;
  PIVector_1__IStorageFolder = ^IVector_1__IStorageFolder;

  // Windows.Foundation.Collections.VectorChangedEventHandler`1<Windows.Storage.IStorageFolder>
  VectorChangedEventHandler_1__IStorageFolder = interface;
  PVectorChangedEventHandler_1__IStorageFolder = ^VectorChangedEventHandler_1__IStorageFolder;

  // Windows.Foundation.Collections.IObservableVector`1<Windows.Storage.IStorageFolder>
  IObservableVector_1__IStorageFolder = interface;
  PIObservableVector_1__IStorageFolder = ^IObservableVector_1__IStorageFolder;

(*
  // Windows.Foundation.TypedEventHandler`2<Windows.Storage.IStorageLibrary,Object>
  TypedEventHandler_2__IStorageLibrary__IInspectable = interface;
  PTypedEventHandler_2__IStorageLibrary__IInspectable = ^TypedEventHandler_2__IStorageLibrary__IInspectable;

*)

(*
  // Windows.Storage.IStorageLibrary
  IStorageLibrary = interface;
  PIStorageLibrary = ^IStorageLibrary;

*)

(*
  // Windows.Foundation.Collections.IIterator`1<Windows.Storage.IStorageLibrary>
  IIterator_1__IStorageLibrary = interface;
  PIIterator_1__IStorageLibrary = ^IIterator_1__IStorageLibrary;

*)

(*
  // Windows.Foundation.Collections.IIterable`1<Windows.Storage.IStorageLibrary>
  IIterable_1__IStorageLibrary = interface;
  PIIterable_1__IStorageLibrary = ^IIterable_1__IStorageLibrary;

*)

(*
  // Windows.Storage.Provider.IFileUpdateRequestDeferral
  Provider_IFileUpdateRequestDeferral = interface;
  PProvider_IFileUpdateRequestDeferral = ^Provider_IFileUpdateRequestDeferral;

*)

(*
  // Windows.Storage.Provider.IFileUpdateRequest
  Provider_IFileUpdateRequest = interface;
  PProvider_IFileUpdateRequest = ^Provider_IFileUpdateRequest;

*)

(*
  // Windows.Foundation.TypedEventHandler`2<Windows.Storage.Search.IStorageQueryResultBase,Object>
  TypedEventHandler_2__Search_IStorageQueryResultBase__IInspectable = interface;
  PTypedEventHandler_2__Search_IStorageQueryResultBase__IInspectable = ^TypedEventHandler_2__Search_IStorageQueryResultBase__IInspectable;

*)

  // Windows.Foundation.Collections.IIterator`1<Windows.Storage.Search.SortEntry>
  IIterator_1__Search_SortEntry = interface;
  PIIterator_1__Search_SortEntry = ^IIterator_1__Search_SortEntry;

(*
  // Windows.Foundation.Collections.IIterable`1<Windows.Storage.Search.SortEntry>
  IIterable_1__Search_SortEntry = interface;
  PIIterable_1__Search_SortEntry = ^IIterable_1__Search_SortEntry;

*)

  // Windows.Foundation.Collections.IVectorView`1<Windows.Storage.Search.SortEntry>
  IVectorView_1__Search_SortEntry = interface;
  PIVectorView_1__Search_SortEntry = ^IVectorView_1__Search_SortEntry;

(*
  // Windows.Foundation.Collections.IVector`1<Windows.Storage.Search.SortEntry>
  IVector_1__Search_SortEntry = interface;
  PIVector_1__Search_SortEntry = ^IVector_1__Search_SortEntry;

*)

(*
  // Windows.Storage.Search.IQueryOptions
  Search_IQueryOptions = interface;
  PSearch_IQueryOptions = ^Search_IQueryOptions;

*)

(*
  // Windows.Storage.Search.IStorageQueryResultBase
  Search_IStorageQueryResultBase = interface;
  PSearch_IStorageQueryResultBase = ^Search_IStorageQueryResultBase;

*)

(*
  // Windows.Storage.Search.IStorageFileQueryResult
  Search_IStorageFileQueryResult = interface;
  PSearch_IStorageFileQueryResult = ^Search_IStorageFileQueryResult;

*)

(*
  // Windows.Storage.Pickers.Provider.IFileRemovedEventArgs
  Pickers_Provider_IFileRemovedEventArgs = interface;
  PPickers_Provider_IFileRemovedEventArgs = ^Pickers_Provider_IFileRemovedEventArgs;

*)

(*
  // Windows.Foundation.TypedEventHandler`2<Windows.Storage.Pickers.Provider.IFileOpenPickerUI,Windows.Storage.Pickers.Provider.IFileRemovedEventArgs>
  TypedEventHandler_2__Pickers_Provider_IFileOpenPickerUI__Pickers_Provider_IFileRemovedEventArgs = interface;
  PTypedEventHandler_2__Pickers_Provider_IFileOpenPickerUI__Pickers_Provider_IFileRemovedEventArgs = ^TypedEventHandler_2__Pickers_Provider_IFileOpenPickerUI__Pickers_Provider_IFileRemovedEventArgs;

*)

(*
  // Windows.Storage.Pickers.Provider.IPickerClosingDeferral
  Pickers_Provider_IPickerClosingDeferral = interface;
  PPickers_Provider_IPickerClosingDeferral = ^Pickers_Provider_IPickerClosingDeferral;

*)

(*
  // Windows.Storage.Pickers.Provider.IPickerClosingOperation
  Pickers_Provider_IPickerClosingOperation = interface;
  PPickers_Provider_IPickerClosingOperation = ^Pickers_Provider_IPickerClosingOperation;

*)

(*
  // Windows.Storage.Pickers.Provider.IPickerClosingEventArgs
  Pickers_Provider_IPickerClosingEventArgs = interface;
  PPickers_Provider_IPickerClosingEventArgs = ^Pickers_Provider_IPickerClosingEventArgs;

*)

(*
  // Windows.Foundation.TypedEventHandler`2<Windows.Storage.Pickers.Provider.IFileOpenPickerUI,Windows.Storage.Pickers.Provider.IPickerClosingEventArgs>
  TypedEventHandler_2__Pickers_Provider_IFileOpenPickerUI__Pickers_Provider_IPickerClosingEventArgs = interface;
  PTypedEventHandler_2__Pickers_Provider_IFileOpenPickerUI__Pickers_Provider_IPickerClosingEventArgs = ^TypedEventHandler_2__Pickers_Provider_IFileOpenPickerUI__Pickers_Provider_IPickerClosingEventArgs;

*)

(*
  // Windows.Storage.Pickers.Provider.IFileOpenPickerUI
  Pickers_Provider_IFileOpenPickerUI = interface;
  PPickers_Provider_IFileOpenPickerUI = ^Pickers_Provider_IFileOpenPickerUI;

*)

(*
  // Windows.Foundation.TypedEventHandler`2<Windows.Storage.Pickers.Provider.IFileSavePickerUI,Object>
  TypedEventHandler_2__Pickers_Provider_IFileSavePickerUI__IInspectable = interface;
  PTypedEventHandler_2__Pickers_Provider_IFileSavePickerUI__IInspectable = ^TypedEventHandler_2__Pickers_Provider_IFileSavePickerUI__IInspectable;

*)

(*
  // Windows.Storage.Pickers.Provider.ITargetFileRequestDeferral
  Pickers_Provider_ITargetFileRequestDeferral = interface;
  PPickers_Provider_ITargetFileRequestDeferral = ^Pickers_Provider_ITargetFileRequestDeferral;

*)

(*
  // Windows.Storage.Pickers.Provider.ITargetFileRequest
  Pickers_Provider_ITargetFileRequest = interface;
  PPickers_Provider_ITargetFileRequest = ^Pickers_Provider_ITargetFileRequest;

*)

(*
  // Windows.Storage.Pickers.Provider.ITargetFileRequestedEventArgs
  Pickers_Provider_ITargetFileRequestedEventArgs = interface;
  PPickers_Provider_ITargetFileRequestedEventArgs = ^Pickers_Provider_ITargetFileRequestedEventArgs;

*)

(*
  // Windows.Foundation.TypedEventHandler`2<Windows.Storage.Pickers.Provider.IFileSavePickerUI,Windows.Storage.Pickers.Provider.ITargetFileRequestedEventArgs>
  TypedEventHandler_2__Pickers_Provider_IFileSavePickerUI__Pickers_Provider_ITargetFileRequestedEventArgs = interface;
  PTypedEventHandler_2__Pickers_Provider_IFileSavePickerUI__Pickers_Provider_ITargetFileRequestedEventArgs = ^TypedEventHandler_2__Pickers_Provider_IFileSavePickerUI__Pickers_Provider_ITargetFileRequestedEventArgs;

*)

(*
  // Windows.Storage.Pickers.Provider.IFileSavePickerUI
  Pickers_Provider_IFileSavePickerUI = interface;
  PPickers_Provider_IFileSavePickerUI = ^Pickers_Provider_IFileSavePickerUI;

*)

(*
  // Windows.Storage.Provider.IFileUpdateRequestedEventArgs
  Provider_IFileUpdateRequestedEventArgs = interface;
  PProvider_IFileUpdateRequestedEventArgs = ^Provider_IFileUpdateRequestedEventArgs;

*)

(*
  // Windows.Foundation.TypedEventHandler`2<Windows.Storage.Provider.ICachedFileUpdaterUI,Windows.Storage.Provider.IFileUpdateRequestedEventArgs>
  TypedEventHandler_2__Provider_ICachedFileUpdaterUI__Provider_IFileUpdateRequestedEventArgs = interface;
  PTypedEventHandler_2__Provider_ICachedFileUpdaterUI__Provider_IFileUpdateRequestedEventArgs = ^TypedEventHandler_2__Provider_ICachedFileUpdaterUI__Provider_IFileUpdateRequestedEventArgs;

*)

(*
  // Windows.Foundation.TypedEventHandler`2<Windows.Storage.Provider.ICachedFileUpdaterUI,Object>
  TypedEventHandler_2__Provider_ICachedFileUpdaterUI__IInspectable = interface;
  PTypedEventHandler_2__Provider_ICachedFileUpdaterUI__IInspectable = ^TypedEventHandler_2__Provider_ICachedFileUpdaterUI__IInspectable;

*)

(*
  // Windows.Storage.Provider.ICachedFileUpdaterUI
  Provider_ICachedFileUpdaterUI = interface;
  PProvider_ICachedFileUpdaterUI = ^Provider_ICachedFileUpdaterUI;

*)

  // Windows.Storage.ISetVersionDeferral
  ISetVersionDeferral = interface;
  PISetVersionDeferral = ^ISetVersionDeferral;

  // Windows.Storage.ISetVersionRequest
  ISetVersionRequest = interface;
  PISetVersionRequest = ^ISetVersionRequest;

  // Windows.Storage.ApplicationDataSetVersionHandler
  ApplicationDataSetVersionHandler = interface;
  PApplicationDataSetVersionHandler = ^ApplicationDataSetVersionHandler;

  // Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Storage.IApplicationDataContainer>
  IKeyValuePair_2__HSTRING__IApplicationDataContainer = interface;
  PIKeyValuePair_2__HSTRING__IApplicationDataContainer = ^IKeyValuePair_2__HSTRING__IApplicationDataContainer;

  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Storage.IApplicationDataContainer>>
  IIterator_1__IKeyValuePair_2__HSTRING__IApplicationDataContainer = interface;
  PIIterator_1__IKeyValuePair_2__HSTRING__IApplicationDataContainer = ^IIterator_1__IKeyValuePair_2__HSTRING__IApplicationDataContainer;

  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Storage.IApplicationDataContainer>>
  IIterable_1__IKeyValuePair_2__HSTRING__IApplicationDataContainer = interface;
  PIIterable_1__IKeyValuePair_2__HSTRING__IApplicationDataContainer = ^IIterable_1__IKeyValuePair_2__HSTRING__IApplicationDataContainer;

  // Windows.Foundation.Collections.IMapView`2<String,Windows.Storage.IApplicationDataContainer>
  IMapView_2__HSTRING__IApplicationDataContainer = interface;
  PIMapView_2__HSTRING__IApplicationDataContainer = ^IMapView_2__HSTRING__IApplicationDataContainer;

  // Windows.Storage.IApplicationDataContainer
  IApplicationDataContainer = interface;
  PIApplicationDataContainer = ^IApplicationDataContainer;

  // Windows.Foundation.TypedEventHandler`2<Windows.Storage.IApplicationData,Object>
  TypedEventHandler_2__IApplicationData__IInspectable = interface;
  PTypedEventHandler_2__IApplicationData__IInspectable = ^TypedEventHandler_2__IApplicationData__IInspectable;

  // Windows.Storage.IApplicationData
  IApplicationData = interface;
  PIApplicationData = ^IApplicationData;

(*
  // Windows.Storage.FileProperties.IStorageItemExtraProperties
  FileProperties_IStorageItemExtraProperties = interface;
  PFileProperties_IStorageItemExtraProperties = ^FileProperties_IStorageItemExtraProperties;

*)

  // Windows.Storage.FileProperties.IMusicProperties
  FileProperties_IMusicProperties = interface;
  PFileProperties_IMusicProperties = ^FileProperties_IMusicProperties;

  // Windows.Storage.FileProperties.IVideoProperties
  FileProperties_IVideoProperties = interface;
  PFileProperties_IVideoProperties = ^FileProperties_IVideoProperties;

  // Windows.Foundation.Collections.IVector`1<Windows.Storage.IStorageFile>
  IVector_1__IStorageFile = interface;
  PIVector_1__IStorageFile = ^IVector_1__IStorageFile;

(*
  // Windows.Storage.Search.IIndexableContent
  Search_IIndexableContent = interface;
  PSearch_IIndexableContent = ^Search_IIndexableContent;

*)

(*
  // Windows.Storage.Search.IContentIndexer
  Search_IContentIndexer = interface;
  PSearch_IContentIndexer = ^Search_IContentIndexer;

*)

(*
  // Windows.Storage.Search.IContentIndexerStatics
  Search_IContentIndexerStatics = interface;
  PSearch_IContentIndexerStatics = ^Search_IContentIndexerStatics;

*)

(*
  // Windows.Storage.Search.IValueAndLanguage
  Search_IValueAndLanguage = interface;
  PSearch_IValueAndLanguage = ^Search_IValueAndLanguage;

*)

(*
  // Windows.Foundation.Collections.IIterator`1<Windows.Storage.Search.IIndexableContent>
  IIterator_1__Search_IIndexableContent = interface;
  PIIterator_1__Search_IIndexableContent = ^IIterator_1__Search_IIndexableContent;

*)

(*
  // Windows.Foundation.Collections.IIterable`1<Windows.Storage.Search.IIndexableContent>
  IIterable_1__Search_IIndexableContent = interface;
  PIIterable_1__Search_IIndexableContent = ^IIterable_1__Search_IIndexableContent;

*)

(*
  // Windows.Foundation.Collections.IVectorView`1<Windows.Storage.Search.IIndexableContent>
  IVectorView_1__Search_IIndexableContent = interface;
  PIVectorView_1__Search_IIndexableContent = ^IVectorView_1__Search_IIndexableContent;

*)

(*
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.Search.IIndexableContent>>
  AsyncOperationCompletedHandler_1__IVectorView_1__Search_IIndexableContent = interface;
  PAsyncOperationCompletedHandler_1__IVectorView_1__Search_IIndexableContent = ^AsyncOperationCompletedHandler_1__IVectorView_1__Search_IIndexableContent;

*)

(*
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.Search.IIndexableContent>>
  IAsyncOperation_1__IVectorView_1__Search_IIndexableContent = interface;
  PIAsyncOperation_1__IVectorView_1__Search_IIndexableContent = ^IAsyncOperation_1__IVectorView_1__Search_IIndexableContent;

*)

(*
  // Windows.Storage.Search.IContentIndexerQuery
  Search_IContentIndexerQuery = interface;
  PSearch_IContentIndexerQuery = ^Search_IContentIndexerQuery;

*)

(*
  // Windows.Storage.Search.IContentIndexerQueryOperations
  Search_IContentIndexerQueryOperations = interface;
  PSearch_IContentIndexerQueryOperations = ^Search_IContentIndexerQueryOperations;

*)

(*
  // Windows.Storage.Provider.ICachedFileUpdaterUI2
  Provider_ICachedFileUpdaterUI2 = interface;
  PProvider_ICachedFileUpdaterUI2 = ^Provider_ICachedFileUpdaterUI2;

*)

(*
  // Windows.Storage.Provider.IFileUpdateRequest2
  Provider_IFileUpdateRequest2 = interface;
  PProvider_IFileUpdateRequest2 = ^Provider_IFileUpdateRequest2;

*)

(*
  // Windows.Storage.FileProperties.IThumbnailProperties
  FileProperties_IThumbnailProperties = interface;
  PFileProperties_IThumbnailProperties = ^FileProperties_IThumbnailProperties;

*)

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.FileProperties.IMusicProperties>
  AsyncOperationCompletedHandler_1__FileProperties_IMusicProperties = interface;
  PAsyncOperationCompletedHandler_1__FileProperties_IMusicProperties = ^AsyncOperationCompletedHandler_1__FileProperties_IMusicProperties;

  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.FileProperties.IMusicProperties>
  IAsyncOperation_1__FileProperties_IMusicProperties = interface;
  PIAsyncOperation_1__FileProperties_IMusicProperties = ^IAsyncOperation_1__FileProperties_IMusicProperties;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.FileProperties.IVideoProperties>
  AsyncOperationCompletedHandler_1__FileProperties_IVideoProperties = interface;
  PAsyncOperationCompletedHandler_1__FileProperties_IVideoProperties = ^AsyncOperationCompletedHandler_1__FileProperties_IVideoProperties;

  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.FileProperties.IVideoProperties>
  IAsyncOperation_1__FileProperties_IVideoProperties = interface;
  PIAsyncOperation_1__FileProperties_IVideoProperties = ^IAsyncOperation_1__FileProperties_IVideoProperties;

(*
  // Windows.Storage.FileProperties.IImageProperties
  FileProperties_IImageProperties = interface;
  PFileProperties_IImageProperties = ^FileProperties_IImageProperties;

*)

(*
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.FileProperties.IImageProperties>
  AsyncOperationCompletedHandler_1__FileProperties_IImageProperties = interface;
  PAsyncOperationCompletedHandler_1__FileProperties_IImageProperties = ^AsyncOperationCompletedHandler_1__FileProperties_IImageProperties;

*)

(*
  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.FileProperties.IImageProperties>
  IAsyncOperation_1__FileProperties_IImageProperties = interface;
  PIAsyncOperation_1__FileProperties_IImageProperties = ^IAsyncOperation_1__FileProperties_IImageProperties;

*)

(*
  // Windows.Storage.FileProperties.IDocumentProperties
  FileProperties_IDocumentProperties = interface;
  PFileProperties_IDocumentProperties = ^FileProperties_IDocumentProperties;

*)

(*
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.FileProperties.IDocumentProperties>
  AsyncOperationCompletedHandler_1__FileProperties_IDocumentProperties = interface;
  PAsyncOperationCompletedHandler_1__FileProperties_IDocumentProperties = ^AsyncOperationCompletedHandler_1__FileProperties_IDocumentProperties;

*)

(*
  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.FileProperties.IDocumentProperties>
  IAsyncOperation_1__FileProperties_IDocumentProperties = interface;
  PIAsyncOperation_1__FileProperties_IDocumentProperties = ^IAsyncOperation_1__FileProperties_IDocumentProperties;

*)

(*
  // Windows.Storage.FileProperties.IStorageItemContentProperties
  FileProperties_IStorageItemContentProperties = interface;
  PFileProperties_IStorageItemContentProperties = ^FileProperties_IStorageItemContentProperties;

*)

(*
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.IStorageLibrary>
  AsyncOperationCompletedHandler_1__IStorageLibrary = interface;
  PAsyncOperationCompletedHandler_1__IStorageLibrary = ^AsyncOperationCompletedHandler_1__IStorageLibrary;

*)

(*
  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.IStorageLibrary>
  IAsyncOperation_1__IStorageLibrary = interface;
  PIAsyncOperation_1__IStorageLibrary = ^IAsyncOperation_1__IStorageLibrary;

*)

(*
  // Windows.Storage.IStorageLibraryStatics
  IStorageLibraryStatics = interface;
  PIStorageLibraryStatics = ^IStorageLibraryStatics;

*)

  // Windows.Storage.IKnownFoldersStatics
  IKnownFoldersStatics = interface;
  PIKnownFoldersStatics = ^IKnownFoldersStatics;

  // Windows.Storage.IKnownFoldersStatics2
  IKnownFoldersStatics2 = interface;
  PIKnownFoldersStatics2 = ^IKnownFoldersStatics2;

  // Windows.Storage.IKnownFoldersPlaylistsStatics
  IKnownFoldersPlaylistsStatics = interface;
  PIKnownFoldersPlaylistsStatics = ^IKnownFoldersPlaylistsStatics;

  // Windows.Storage.IKnownFoldersCameraRollStatics
  IKnownFoldersCameraRollStatics = interface;
  PIKnownFoldersCameraRollStatics = ^IKnownFoldersCameraRollStatics;

  // Windows.Storage.IKnownFoldersSavedPicturesStatics
  IKnownFoldersSavedPicturesStatics = interface;
  PIKnownFoldersSavedPicturesStatics = ^IKnownFoldersSavedPicturesStatics;

  // Windows.Storage.IDownloadsFolderStatics
  IDownloadsFolderStatics = interface;
  PIDownloadsFolderStatics = ^IDownloadsFolderStatics;

(*
  // Windows.Storage.IStreamedFileDataRequest
  IStreamedFileDataRequest = interface;
  PIStreamedFileDataRequest = ^IStreamedFileDataRequest;

*)

  // Windows.Storage.StreamedFileDataRequestedHandler
  StreamedFileDataRequestedHandler = interface;
  PStreamedFileDataRequestedHandler = ^StreamedFileDataRequestedHandler;

  // Windows.Storage.IStorageFileStatics
  IStorageFileStatics = interface;
  PIStorageFileStatics = ^IStorageFileStatics;

  // Windows.Storage.IStorageFolderStatics
  IStorageFolderStatics = interface;
  PIStorageFolderStatics = ^IStorageFolderStatics;

(*
  // Windows.Storage.IStorageItem2
  IStorageItem2 = interface;
  PIStorageItem2 = ^IStorageItem2;

*)

(*
  // Windows.Storage.IStorageItemProperties
  IStorageItemProperties = interface;
  PIStorageItemProperties = ^IStorageItemProperties;

*)

(*
  // Windows.Storage.IStorageItemProperties2
  IStorageItemProperties2 = interface;
  PIStorageItemProperties2 = ^IStorageItemProperties2;

*)

(*
  // Windows.Storage.IStorageProvider
  IStorageProvider = interface;
  PIStorageProvider = ^IStorageProvider;

*)

(*
  // Windows.Storage.IStorageItemPropertiesWithProvider
  IStorageItemPropertiesWithProvider = interface;
  PIStorageItemPropertiesWithProvider = ^IStorageItemPropertiesWithProvider;

*)

(*
  // Windows.Storage.IStorageFilePropertiesWithAvailability
  IStorageFilePropertiesWithAvailability = interface;
  PIStorageFilePropertiesWithAvailability = ^IStorageFilePropertiesWithAvailability;

*)

(*
  // Windows.Storage.Search.IQueryOptionsWithProviderFilter
  Search_IQueryOptionsWithProviderFilter = interface;
  PSearch_IQueryOptionsWithProviderFilter = ^Search_IQueryOptionsWithProviderFilter;

*)

(*
  // Windows.Storage.Search.IQueryOptionsFactory
  Search_IQueryOptionsFactory = interface;
  PSearch_IQueryOptionsFactory = ^Search_IQueryOptionsFactory;

*)

(*
  // Windows.Storage.Search.IStorageFileQueryResult2
  Search_IStorageFileQueryResult2 = interface;
  PSearch_IStorageFileQueryResult2 = ^Search_IStorageFileQueryResult2;

*)

(*
  // Windows.Storage.Search.IStorageFolderQueryResult
  Search_IStorageFolderQueryResult = interface;
  PSearch_IStorageFolderQueryResult = ^Search_IStorageFolderQueryResult;

*)

(*
  // Windows.Storage.Search.IStorageItemQueryResult
  Search_IStorageItemQueryResult = interface;
  PSearch_IStorageItemQueryResult = ^Search_IStorageItemQueryResult;

*)

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.Search.IndexedState>
  AsyncOperationCompletedHandler_1__Search_IndexedState = interface;
  PAsyncOperationCompletedHandler_1__Search_IndexedState = ^AsyncOperationCompletedHandler_1__Search_IndexedState;

  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.Search.IndexedState>
  IAsyncOperation_1__Search_IndexedState = interface;
  PIAsyncOperation_1__Search_IndexedState = ^IAsyncOperation_1__Search_IndexedState;

(*
  // Windows.Storage.Search.IStorageFolderQueryOperations
  Search_IStorageFolderQueryOperations = interface;
  PSearch_IStorageFolderQueryOperations = ^Search_IStorageFolderQueryOperations;

*)

  // Windows.Storage.Provider.ICachedFileUpdaterStatics
  Provider_ICachedFileUpdaterStatics = interface;
  PProvider_ICachedFileUpdaterStatics = ^Provider_ICachedFileUpdaterStatics;

(*
  // Windows.Storage.IStorageFolder2
  IStorageFolder2 = interface;
  PIStorageFolder2 = ^IStorageFolder2;

*)

(*
  // Windows.Storage.IStorageFile2
  IStorageFile2 = interface;
  PIStorageFile2 = ^IStorageFile2;

*)

  // Windows.Storage.IFileIOStatics
  IFileIOStatics = interface;
  PIFileIOStatics = ^IFileIOStatics;

  // Windows.Storage.IPathIOStatics
  IPathIOStatics = interface;
  PIPathIOStatics = ^IPathIOStatics;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.Provider.FileUpdateStatus>
  AsyncOperationCompletedHandler_1__Provider_FileUpdateStatus = interface;
  PAsyncOperationCompletedHandler_1__Provider_FileUpdateStatus = ^AsyncOperationCompletedHandler_1__Provider_FileUpdateStatus;

  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.Provider.FileUpdateStatus>
  IAsyncOperation_1__Provider_FileUpdateStatus = interface;
  PIAsyncOperation_1__Provider_FileUpdateStatus = ^IAsyncOperation_1__Provider_FileUpdateStatus;

  // Windows.Storage.ICachedFileManagerStatics
  ICachedFileManagerStatics = interface;
  PICachedFileManagerStatics = ^ICachedFileManagerStatics;

(*
  // Windows.Storage.Search.IStorageLibraryContentChangedTriggerDetails
  Search_IStorageLibraryContentChangedTriggerDetails = interface;
  PSearch_IStorageLibraryContentChangedTriggerDetails = ^Search_IStorageLibraryContentChangedTriggerDetails;

*)

(*
  // Windows.Storage.AccessCache.IItemRemovedEventArgs
  AccessCache_IItemRemovedEventArgs = interface;
  PAccessCache_IItemRemovedEventArgs = ^AccessCache_IItemRemovedEventArgs;

*)

  // Windows.Foundation.Collections.IIterator`1<Windows.Storage.AccessCache.AccessListEntry>
  IIterator_1__AccessCache_AccessListEntry = interface;
  PIIterator_1__AccessCache_AccessListEntry = ^IIterator_1__AccessCache_AccessListEntry;

(*
  // Windows.Foundation.Collections.IIterable`1<Windows.Storage.AccessCache.AccessListEntry>
  IIterable_1__AccessCache_AccessListEntry = interface;
  PIIterable_1__AccessCache_AccessListEntry = ^IIterable_1__AccessCache_AccessListEntry;

*)

(*
  // Windows.Foundation.Collections.IVectorView`1<Windows.Storage.AccessCache.AccessListEntry>
  IVectorView_1__AccessCache_AccessListEntry = interface;
  PIVectorView_1__AccessCache_AccessListEntry = ^IVectorView_1__AccessCache_AccessListEntry;

*)

(*
  // Windows.Storage.AccessCache.IStorageItemAccessList
  AccessCache_IStorageItemAccessList = interface;
  PAccessCache_IStorageItemAccessList = ^AccessCache_IStorageItemAccessList;

*)

(*
  // Windows.Foundation.TypedEventHandler`2<Windows.Storage.AccessCache.IStorageItemMostRecentlyUsedList,Windows.Storage.AccessCache.IItemRemovedEventArgs>
  TypedEventHandler_2__AccessCache_IStorageItemMostRecentlyUsedList__AccessCache_IItemRemovedEventArgs = interface;
  PTypedEventHandler_2__AccessCache_IStorageItemMostRecentlyUsedList__AccessCache_IItemRemovedEventArgs = ^TypedEventHandler_2__AccessCache_IStorageItemMostRecentlyUsedList__AccessCache_IItemRemovedEventArgs;

*)

(*
  // Windows.Storage.AccessCache.IStorageItemMostRecentlyUsedList
  AccessCache_IStorageItemMostRecentlyUsedList = interface;
  PAccessCache_IStorageItemMostRecentlyUsedList = ^AccessCache_IStorageItemMostRecentlyUsedList;

*)

(*
  // Windows.Storage.AccessCache.IStorageItemMostRecentlyUsedList2
  AccessCache_IStorageItemMostRecentlyUsedList2 = interface;
  PAccessCache_IStorageItemMostRecentlyUsedList2 = ^AccessCache_IStorageItemMostRecentlyUsedList2;

*)

(*
  // Windows.Storage.AccessCache.IStorageApplicationPermissionsStatics
  AccessCache_IStorageApplicationPermissionsStatics = interface;
  PAccessCache_IStorageApplicationPermissionsStatics = ^AccessCache_IStorageApplicationPermissionsStatics;

*)

(*
  // Windows.Foundation.TypedEventHandler`2<Windows.Storage.BulkAccess.IStorageItemInformation,Object>
  TypedEventHandler_2__BulkAccess_IStorageItemInformation__IInspectable = interface;
  PTypedEventHandler_2__BulkAccess_IStorageItemInformation__IInspectable = ^TypedEventHandler_2__BulkAccess_IStorageItemInformation__IInspectable;

*)

(*
  // Windows.Storage.BulkAccess.IStorageItemInformation
  BulkAccess_IStorageItemInformation = interface;
  PBulkAccess_IStorageItemInformation = ^BulkAccess_IStorageItemInformation;

*)

(*
  // Windows.Foundation.Collections.IIterator`1<Windows.Storage.BulkAccess.IStorageItemInformation>
  IIterator_1__BulkAccess_IStorageItemInformation = interface;
  PIIterator_1__BulkAccess_IStorageItemInformation = ^IIterator_1__BulkAccess_IStorageItemInformation;

*)

(*
  // Windows.Foundation.Collections.IIterable`1<Windows.Storage.BulkAccess.IStorageItemInformation>
  IIterable_1__BulkAccess_IStorageItemInformation = interface;
  PIIterable_1__BulkAccess_IStorageItemInformation = ^IIterable_1__BulkAccess_IStorageItemInformation;

*)

(*
  // Windows.Foundation.Collections.IVectorView`1<Windows.Storage.BulkAccess.IStorageItemInformation>
  IVectorView_1__BulkAccess_IStorageItemInformation = interface;
  PIVectorView_1__BulkAccess_IStorageItemInformation = ^IVectorView_1__BulkAccess_IStorageItemInformation;

*)

(*
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.BulkAccess.IStorageItemInformation>>
  AsyncOperationCompletedHandler_1__IVectorView_1__BulkAccess_IStorageItemInformation = interface;
  PAsyncOperationCompletedHandler_1__IVectorView_1__BulkAccess_IStorageItemInformation = ^AsyncOperationCompletedHandler_1__IVectorView_1__BulkAccess_IStorageItemInformation;

*)

(*
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.BulkAccess.IStorageItemInformation>>
  IAsyncOperation_1__IVectorView_1__BulkAccess_IStorageItemInformation = interface;
  PIAsyncOperation_1__IVectorView_1__BulkAccess_IStorageItemInformation = ^IAsyncOperation_1__IVectorView_1__BulkAccess_IStorageItemInformation;

*)

(*
  // Windows.Storage.BulkAccess.IFileInformationFactory
  BulkAccess_IFileInformationFactory = interface;
  PBulkAccess_IFileInformationFactory = ^BulkAccess_IFileInformationFactory;

*)

(*
  // Windows.Storage.BulkAccess.IFileInformationFactoryFactory
  BulkAccess_IFileInformationFactoryFactory = interface;
  PBulkAccess_IFileInformationFactoryFactory = ^BulkAccess_IFileInformationFactoryFactory;

*)

(*
  // Windows.Storage.Pickers.IFileOpenPicker
  Pickers_IFileOpenPicker = interface;
  PPickers_IFileOpenPicker = ^Pickers_IFileOpenPicker;

*)

(*
  // Windows.Storage.Pickers.IFileOpenPicker2
  Pickers_IFileOpenPicker2 = interface;
  PPickers_IFileOpenPicker2 = ^Pickers_IFileOpenPicker2;

*)

(*
  // Windows.Storage.Pickers.IFileOpenPickerWithOperationId
  Pickers_IFileOpenPickerWithOperationId = interface;
  PPickers_IFileOpenPickerWithOperationId = ^Pickers_IFileOpenPickerWithOperationId;

*)

  // Windows.Storage.Pickers.IFileOpenPickerStatics
  Pickers_IFileOpenPickerStatics = interface;
  PPickers_IFileOpenPickerStatics = ^Pickers_IFileOpenPickerStatics;

(*
  // Windows.Storage.Pickers.IFileSavePicker
  Pickers_IFileSavePicker = interface;
  PPickers_IFileSavePicker = ^Pickers_IFileSavePicker;

*)

(*
  // Windows.Storage.Pickers.IFileSavePicker2
  Pickers_IFileSavePicker2 = interface;
  PPickers_IFileSavePicker2 = ^Pickers_IFileSavePicker2;

*)

(*
  // Windows.Storage.Pickers.IFileSavePicker3
  Pickers_IFileSavePicker3 = interface;
  PPickers_IFileSavePicker3 = ^Pickers_IFileSavePicker3;

*)

(*
  // Windows.Storage.Pickers.IFolderPicker
  Pickers_IFolderPicker = interface;
  PPickers_IFolderPicker = ^Pickers_IFolderPicker;

*)

(*
  // Windows.Storage.Pickers.IFolderPicker2
  Pickers_IFolderPicker2 = interface;
  PPickers_IFolderPicker2 = ^Pickers_IFolderPicker2;

*)

(*
  // Windows.Storage.ISystemAudioProperties
  ISystemAudioProperties = interface;
  PISystemAudioProperties = ^ISystemAudioProperties;

*)

(*
  // Windows.Storage.ISystemGPSProperties
  ISystemGPSProperties = interface;
  PISystemGPSProperties = ^ISystemGPSProperties;

*)

(*
  // Windows.Storage.ISystemImageProperties
  ISystemImageProperties = interface;
  PISystemImageProperties = ^ISystemImageProperties;

*)

(*
  // Windows.Storage.ISystemMediaProperties
  ISystemMediaProperties = interface;
  PISystemMediaProperties = ^ISystemMediaProperties;

*)

(*
  // Windows.Storage.ISystemMusicProperties
  ISystemMusicProperties = interface;
  PISystemMusicProperties = ^ISystemMusicProperties;

*)

(*
  // Windows.Storage.ISystemPhotoProperties
  ISystemPhotoProperties = interface;
  PISystemPhotoProperties = ^ISystemPhotoProperties;

*)

(*
  // Windows.Storage.ISystemVideoProperties
  ISystemVideoProperties = interface;
  PISystemVideoProperties = ^ISystemVideoProperties;

*)

(*
  // Windows.Storage.ISystemProperties
  ISystemProperties = interface;
  PISystemProperties = ^ISystemProperties;

*)

  // Windows.Storage.IApplicationDataStatics
  IApplicationDataStatics = interface;
  PIApplicationDataStatics = ^IApplicationDataStatics;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.IApplicationData>
  AsyncOperationCompletedHandler_1__IApplicationData = interface;
  PAsyncOperationCompletedHandler_1__IApplicationData = ^AsyncOperationCompletedHandler_1__IApplicationData;

  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.IApplicationData>
  IAsyncOperation_1__IApplicationData = interface;
  PIAsyncOperation_1__IApplicationData = ^IAsyncOperation_1__IApplicationData;

  // Windows.Storage.IApplicationDataStatics2
  IApplicationDataStatics2 = interface;
  PIApplicationDataStatics2 = ^IApplicationDataStatics2;

  // Windows.Storage.IApplicationData2
  IApplicationData2 = interface;
  PIApplicationData2 = ^IApplicationData2;

  // Windows.Storage.IApplicationData3
  IApplicationData3 = interface;
  PIApplicationData3 = ^IApplicationData3;

  // Windows.Storage.Compression.ICompressor
  Compression_ICompressor = interface;
  PCompression_ICompressor = ^Compression_ICompressor;

  // Windows.Storage.Compression.IDecompressor
  Compression_IDecompressor = interface;
  PCompression_IDecompressor = ^Compression_IDecompressor;

  // Windows.Storage.Compression.ICompressorFactory
  Compression_ICompressorFactory = interface;
  PCompression_ICompressorFactory = ^Compression_ICompressorFactory;

  // Windows.Storage.Compression.IDecompressorFactory
  Compression_IDecompressorFactory = interface;
  PCompression_IDecompressorFactory = ^Compression_IDecompressorFactory;

  // Windows.Foundation.Collections.IVector`1<Windows.Storage.IStorageItem>
  IVector_1__IStorageItem = interface;
  PIVector_1__IStorageItem = ^IVector_1__IStorageItem;



  // Emit Forwarded interfaces
  // Windows.Storage Interfaces
  // UsedAPI Interface
  {
  // Used Types:  UInt64
  // Used Types:  Windows.Foundation.DateTime
  }
  // Windows.Storage.FileProperties.IBasicProperties
  FileProperties_IBasicProperties = interface(IInspectable)
  ['{D05D55DB-785E-4A66-BE02-9BEEC58AEA81}']
    function get_Size: UInt64; safecall;
    function get_DateModified: DateTime; safecall;
    function get_ItemDate: DateTime; safecall;
    property DateModified: DateTime read get_DateModified;
    property ItemDate: DateTime read get_ItemDate;
    property Size: UInt64 read get_Size;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.FileProperties.IBasicProperties>
  AsyncOperationCompletedHandler_1__FileProperties_IBasicProperties_Delegate_Base = interface(IUnknown)
  ['{C8659AAE-4926-52AD-8F60-D89FE5A8DF5F}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.FileProperties.IBasicProperties>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.FileProperties.IBasicProperties>
  AsyncOperationCompletedHandler_1__FileProperties_IBasicProperties = interface(AsyncOperationCompletedHandler_1__FileProperties_IBasicProperties_Delegate_Base)
  ['{129B0F62-E176-5FB1-A3B9-69FEEE1BFB29}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__FileProperties_IBasicProperties; asyncStatus: AsyncStatus); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.FileProperties.IBasicProperties>
  // Used Types:  Windows.Storage.FileProperties.IBasicProperties
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.FileProperties.IBasicProperties>
  IAsyncOperation_1__FileProperties_IBasicProperties = interface(IInspectable)
  ['{ADA07FD2-C777-5490-BD12-C0E6D722EAD7}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__FileProperties_IBasicProperties); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__FileProperties_IBasicProperties; safecall;
    function GetResults: FileProperties_IBasicProperties; safecall;
    property Completed: AsyncOperationCompletedHandler_1__FileProperties_IBasicProperties read get_Completed write put_Completed;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncAction
  // Used Types:  String
  // Used Types:  Windows.Storage.NameCollisionOption
  // Used Types:  Windows.Storage.StorageDeleteOption
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.FileProperties.IBasicProperties>
  // Used Types:  Windows.Storage.FileAttributes
  // Used Types:  Windows.Foundation.DateTime
  // Used Types:  Boolean
  // Used Types:  Windows.Storage.StorageItemTypes
  }
  // Windows.Storage.IStorageItem
  IStorageItem = interface(IInspectable)
  ['{4207A996-CA2F-42F7-BDE8-8B10457A7F30}']
    function RenameAsync(desiredName: HSTRING): IAsyncAction; safecall; overload;
    function RenameAsync(desiredName: HSTRING; option: NameCollisionOption): IAsyncAction; safecall; overload;
    function DeleteAsync: IAsyncAction; safecall; overload;
    function DeleteAsync(option: StorageDeleteOption): IAsyncAction; safecall; overload;
    function GetBasicPropertiesAsync: IAsyncOperation_1__FileProperties_IBasicProperties; safecall;
    function get_Name: HSTRING; safecall;
    function get_Path: HSTRING; safecall;
    function get_Attributes: FileAttributes; safecall;
    function get_DateCreated: DateTime; safecall;
    function IsOfType(&type: StorageItemTypes): Boolean; safecall;
    property Attributes: FileAttributes read get_Attributes;
    property DateCreated: DateTime read get_DateCreated;
    property Name: HSTRING read get_Name;
    property Path: HSTRING read get_Path;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Storage.Streams.IRandomAccessStream
  // Used Types:  Windows.Foundation.IAsyncAction
  }
  // Windows.Storage.IStorageStreamTransaction
  IStorageStreamTransaction = interface(IInspectable)
  ['{F67CF363-A53D-4D94-AE2C-67232D93ACDD}']
    function get_Stream: IRandomAccessStream; safecall;
    function CommitAsync: IAsyncAction; safecall;
    property Stream: IRandomAccessStream read get_Stream;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.IStorageStreamTransaction>
  AsyncOperationCompletedHandler_1__IStorageStreamTransaction_Delegate_Base = interface(IUnknown)
  ['{D11739E6-2995-5D33-BFFF-51B6041F68C1}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.IStorageStreamTransaction>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.IStorageStreamTransaction>
  AsyncOperationCompletedHandler_1__IStorageStreamTransaction = interface(AsyncOperationCompletedHandler_1__IStorageStreamTransaction_Delegate_Base)
  ['{4F03213E-DFDA-5E67-98AC-0D139B467B19}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IStorageStreamTransaction; asyncStatus: AsyncStatus); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.IStorageStreamTransaction>
  // Used Types:  Windows.Storage.IStorageStreamTransaction
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.IStorageStreamTransaction>
  IAsyncOperation_1__IStorageStreamTransaction = interface(IInspectable)
  ['{C5926392-4ECC-526D-BBC1-725AE3F7C449}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IStorageStreamTransaction); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IStorageStreamTransaction; safecall;
    function GetResults: IStorageStreamTransaction; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IStorageStreamTransaction read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.IStorageFolder>
  AsyncOperationCompletedHandler_1__IStorageFolder_Delegate_Base = interface(IUnknown)
  ['{C211026E-9E63-5452-BA54-3A07D6A96874}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.IStorageFolder>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.IStorageFolder>
  AsyncOperationCompletedHandler_1__IStorageFolder = interface(AsyncOperationCompletedHandler_1__IStorageFolder_Delegate_Base)
  ['{8254DF53-F8CD-570A-AEB9-F2C0AD5368AC}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IStorageFolder; asyncStatus: AsyncStatus); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.IStorageFolder>
  // Used Types:  Windows.Storage.IStorageFolder
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.IStorageFolder>
  IAsyncOperation_1__IStorageFolder = interface(IInspectable)
  ['{68EA25EA-D88C-5DB0-A24A-BBCBDFCD3ECC}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IStorageFolder); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IStorageFolder; safecall;
    function GetResults: IStorageFolder; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IStorageFolder read get_Completed write put_Completed;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.IStorageItem>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.IStorageItem>
  AsyncOperationCompletedHandler_1__IStorageItem = interface(IUnknown)
  ['{92C3102F-A327-5318-A6C1-76F6B2A0ABFB}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IStorageItem; asyncStatus: AsyncStatus); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.IStorageItem>
  // Used Types:  Windows.Storage.IStorageItem
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.IStorageItem>
  IAsyncOperation_1__IStorageItem = interface(IInspectable)
  ['{5FC9C137-EBB7-5E6C-9CBA-686F2EC2B0BB}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IStorageItem); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IStorageItem; safecall;
    function GetResults: IStorageItem; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IStorageItem read get_Completed write put_Completed;
  end;

  {
  // Used Types:  Windows.Storage.IStorageFile
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Storage.IStorageFile>
  IIterator_1__IStorageFile = interface(IInspectable)
  ['{314D2318-74EE-535C-B361-2144DBC573A0}']
    function get_Current: IStorageFile; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(out {TODO: verify}items: PIStorageFile): Cardinal; safecall;
    property Current: IStorageFile read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

(*
  // Generic Delegate for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Storage.IStorageFile>
  IIterable_1__IStorageFile_Delegate_Base = interface(IUnknown)
  ['{9AC00304-83EA-5688-87B6-AE38AAB65D0B}']
  end;
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Storage.IStorageFile>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Storage.IStorageFile>
  IIterable_1__IStorageFile = interface(IIterable_1__IStorageFile_Delegate_Base)
  ['{76D43C7E-FD09-5908-A2B9-A49B4848294B}']
    function First: IIterator_1__IStorageFile; safecall;
  end;

*)

  // UsedAPI Interface
  {
  // Used Types:  Windows.Storage.IStorageFile
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageFile>
  IVectorView_1__IStorageFile = interface(IInspectable)
  ['{4296B6E8-E219-5E74-8DDE-196F57200A82}']
    function GetAt(index: Cardinal): IStorageFile; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IStorageFile; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; out {TODO: verify}items: PIStorageFile): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageFile>>
  AsyncOperationCompletedHandler_1__IVectorView_1__IStorageFile_Delegate_Base = interface(IUnknown)
  ['{CB4206C5-0988-5104-AFA9-253C298F86FD}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageFile>>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageFile>>
  AsyncOperationCompletedHandler_1__IVectorView_1__IStorageFile = interface(AsyncOperationCompletedHandler_1__IVectorView_1__IStorageFile_Delegate_Base)
  ['{3B203E3A-6A0E-5FA3-A300-EAF350152625}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IVectorView_1__IStorageFile; asyncStatus: AsyncStatus); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageFile>>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageFile>
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageFile>>
  IAsyncOperation_1__IVectorView_1__IStorageFile = interface(IInspectable)
  ['{9751F304-CBA2-5A44-890D-0DBD9F173C43}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IVectorView_1__IStorageFile); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IVectorView_1__IStorageFile; safecall;
    function GetResults: IVectorView_1__IStorageFile; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IVectorView_1__IStorageFile read get_Completed write put_Completed;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Storage.IStorageFolder
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Storage.IStorageFolder>
  IIterator_1__IStorageFolder = interface(IInspectable)
  ['{73E42360-10FC-513C-9C38-D7FB007ABBC4}']
    function get_Current: IStorageFolder; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(out {TODO: verify}items: PIStorageFolder): Cardinal; safecall;
    property Current: IStorageFolder read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Delegate for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Storage.IStorageFolder>
  IIterable_1__IStorageFolder_Delegate_Base = interface(IUnknown)
  ['{4669BEFC-AE5C-52B1-8A97-5466CE61E94E}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Storage.IStorageFolder>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Storage.IStorageFolder>
  IIterable_1__IStorageFolder = interface(IIterable_1__IStorageFolder_Delegate_Base)
  ['{D09B688F-402A-5B3F-B552-1FFA23116952}']
    function First: IIterator_1__IStorageFolder; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Storage.IStorageFolder
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageFolder>
  IVectorView_1__IStorageFolder = interface(IInspectable)
  ['{6A8C9209-6392-5B08-AEE9-F2ADD7DECC49}']
    function GetAt(index: Cardinal): IStorageFolder; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IStorageFolder; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; out {TODO: verify}items: PIStorageFolder): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageFolder>>
  AsyncOperationCompletedHandler_1__IVectorView_1__IStorageFolder_Delegate_Base = interface(IUnknown)
  ['{ED2D1D9B-26EC-5BE7-A8A3-56458933D25F}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageFolder>>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageFolder>>
  AsyncOperationCompletedHandler_1__IVectorView_1__IStorageFolder = interface(AsyncOperationCompletedHandler_1__IVectorView_1__IStorageFolder_Delegate_Base)
  ['{AEF07EE0-9203-543D-90C9-088DE0DF94E4}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IVectorView_1__IStorageFolder; asyncStatus: AsyncStatus); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageFolder>>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageFolder>
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageFolder>>
  IAsyncOperation_1__IVectorView_1__IStorageFolder = interface(IInspectable)
  ['{A4D504A3-0D7B-5497-B35F-0889A2AF16FD}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IVectorView_1__IStorageFolder); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IVectorView_1__IStorageFolder; safecall;
    function GetResults: IVectorView_1__IStorageFolder; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IVectorView_1__IStorageFolder read get_Completed write put_Completed;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Storage.IStorageItem
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Storage.IStorageItem>
  IIterator_1__IStorageItem = interface(IInspectable)
  ['{05B487C2-3830-5D3C-98DA-25FA11542DBD}']
    function get_Current: IStorageItem; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(out {TODO: verify}items: PIStorageItem): Cardinal; safecall;
    property Current: IStorageItem read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Storage.IStorageItem>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Storage.IStorageItem>
  IIterable_1__IStorageItem = interface(IInspectable)
  ['{BB8B8418-65D1-544B-B083-6D172F568C73}']
    function First: IIterator_1__IStorageItem; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Storage.IStorageItem
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageItem>
  IVectorView_1__IStorageItem = interface(IInspectable)
  ['{85575A41-06CB-58D0-B98A-7C8F06E6E9D7}']
    function GetAt(index: Cardinal): IStorageItem; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IStorageItem; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; out {TODO: verify}items: PIStorageItem): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageItem>>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageItem>>
  AsyncOperationCompletedHandler_1__IVectorView_1__IStorageItem = interface(IUnknown)
  ['{51436E75-ACE1-5A68-B260-F843B846F0DB}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IVectorView_1__IStorageItem; asyncStatus: AsyncStatus); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageItem>>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageItem>
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageItem>>
  IAsyncOperation_1__IVectorView_1__IStorageItem = interface(IInspectable)
  ['{4B1C0FD7-7A01-5E7A-A6FE-BE4500283F23}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IVectorView_1__IStorageItem); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IVectorView_1__IStorageItem; safecall;
    function GetResults: IVectorView_1__IStorageItem; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IVectorView_1__IStorageItem read get_Completed write put_Completed;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.IStorageFile>
  // Used Types:  String
  // Used Types:  Windows.Storage.CreationCollisionOption
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.IStorageFolder>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.IStorageItem>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageFile>>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageFolder>>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageItem>>
  }
  // Windows.Storage.IStorageFolder
  IStorageFolder = interface(IInspectable)
  ['{72D1CB78-B3EF-4F75-A80B-6FD9DAE2944B}']
    function CreateFileAsync(desiredName: HSTRING): IAsyncOperation_1__IStorageFile; safecall; overload;
    function CreateFileAsync(desiredName: HSTRING; options: CreationCollisionOption): IAsyncOperation_1__IStorageFile; safecall; overload;
    function CreateFolderAsync(desiredName: HSTRING): IAsyncOperation_1__IStorageFolder; safecall; overload;
    function CreateFolderAsync(desiredName: HSTRING; options: CreationCollisionOption): IAsyncOperation_1__IStorageFolder; safecall; overload;
    function GetFileAsync(name: HSTRING): IAsyncOperation_1__IStorageFile; safecall;
    function GetFolderAsync(name: HSTRING): IAsyncOperation_1__IStorageFolder; safecall;
    function GetItemAsync(name: HSTRING): IAsyncOperation_1__IStorageItem; safecall;
    function GetFilesAsync: IAsyncOperation_1__IVectorView_1__IStorageFile; safecall;
    function GetFoldersAsync: IAsyncOperation_1__IVectorView_1__IStorageFolder; safecall;
    function GetItemsAsync: IAsyncOperation_1__IVectorView_1__IStorageItem; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.Streams.IRandomAccessStream>
  // Used Types:  Windows.Storage.FileAccessMode
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.IStorageStreamTransaction>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.IStorageFile>
  // Used Types:  Windows.Storage.IStorageFolder
  // Used Types:  Windows.Storage.NameCollisionOption
  // Used Types:  Windows.Foundation.IAsyncAction
  // Used Types:  Windows.Storage.IStorageFile
  }
  // Windows.Storage.IStorageFile
  IStorageFile = interface(IInspectable)
  ['{FA3F6186-4214-428C-A64C-14C9AC7315EA}']
    function get_FileType: HSTRING; safecall;
    function get_ContentType: HSTRING; safecall;
    function OpenAsync(accessMode: FileAccessMode): IAsyncOperation_1__IRandomAccessStream; safecall;
    function OpenTransactedWriteAsync: IAsyncOperation_1__IStorageStreamTransaction; safecall;
    function CopyAsync(destinationFolder: IStorageFolder): IAsyncOperation_1__IStorageFile; safecall; overload;
    function CopyAsync(destinationFolder: IStorageFolder; desiredNewName: HSTRING): IAsyncOperation_1__IStorageFile; safecall; overload;
    function CopyAsync(destinationFolder: IStorageFolder; desiredNewName: HSTRING; option: NameCollisionOption): IAsyncOperation_1__IStorageFile; safecall; overload;
    function CopyAndReplaceAsync(fileToReplace: IStorageFile): IAsyncAction; safecall;
    function MoveAsync(destinationFolder: IStorageFolder): IAsyncAction; safecall; overload;
    function MoveAsync(destinationFolder: IStorageFolder; desiredNewName: HSTRING): IAsyncAction; safecall; overload;
    function MoveAsync(destinationFolder: IStorageFolder; desiredNewName: HSTRING; option: NameCollisionOption): IAsyncAction; safecall; overload;
    function MoveAndReplaceAsync(fileToReplace: IStorageFile): IAsyncAction; safecall;
    property ContentType: HSTRING read get_ContentType;
    property FileType: HSTRING read get_FileType;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.IStorageFile>
  AsyncOperationCompletedHandler_1__IStorageFile_Delegate_Base = interface(IUnknown)
  ['{E521C894-2C26-5946-9E61-2B5E188D01ED}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.IStorageFile>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.IStorageFile>
  AsyncOperationCompletedHandler_1__IStorageFile = interface(AsyncOperationCompletedHandler_1__IStorageFile_Delegate_Base)
  ['{1247300D-7973-53D5-889F-5279D9322114}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IStorageFile; asyncStatus: AsyncStatus); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.IStorageFile>
  // Used Types:  Windows.Storage.IStorageFile
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.IStorageFile>
  IAsyncOperation_1__IStorageFile = interface(IInspectable)
  ['{31C5C3AB-4BF6-51D1-B590-C6EFC00E9FF2}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IStorageFile); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IStorageFile; safecall;
    function GetResults: IStorageFile; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IStorageFile read get_Completed write put_Completed;
  end;

  {
  // Used Types:  Windows.Storage.IStorageFolder
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageFolder>
  // Used Types:  Boolean
  // Used Types:  Void
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Storage.IStorageFolder>
  IVector_1__IStorageFolder = interface(IInspectable)
  ['{AD736464-7886-5872-88E3-395643C94759}']
    function GetAt(index: Cardinal): IStorageFolder; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__IStorageFolder; safecall;
    function IndexOf(value: IStorageFolder; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: IStorageFolder); safecall;
    procedure InsertAt(index: Cardinal; value: IStorageFolder); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: IStorageFolder); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; out {TODO: verify}items: PIStorageFolder): Cardinal; safecall;
    procedure ReplaceAll({TODO: verify}items: PIStorageFolder); safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Delegate for 
  // Windows.Foundation.Collections.VectorChangedEventHandler`1<Windows.Storage.IStorageFolder>
  VectorChangedEventHandler_1__IStorageFolder_Delegate_Base = interface(IUnknown)
  ['{2057B641-4B9B-5338-A19A-E9A951916775}']
  end;
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.Collections.IObservableVector`1<Windows.Storage.IStorageFolder>
  // Used Types:  Windows.Foundation.Collections.IVectorChangedEventArgs
  }
  // Windows.Foundation.Collections.VectorChangedEventHandler`1<Windows.Storage.IStorageFolder>
  VectorChangedEventHandler_1__IStorageFolder = interface(VectorChangedEventHandler_1__IStorageFolder_Delegate_Base)
  ['{02B1C206-D4FA-5E88-BD76-9C158F6CFAFF}']
    procedure Invoke(sender: IObservableVector_1__IStorageFolder; event: IVectorChangedEventArgs); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.Collections.VectorChangedEventHandler`1<Windows.Storage.IStorageFolder>
  // Used Types:  Void
  }
  // Windows.Foundation.Collections.IObservableVector`1<Windows.Storage.IStorageFolder>
  IObservableVector_1__IStorageFolder = interface(IInspectable)
  ['{772A1791-7293-589A-A10E-5F888E78FA05}']
    function add_VectorChanged(vhnd: VectorChangedEventHandler_1__IStorageFolder): EventRegistrationToken; safecall;
    procedure remove_VectorChanged(token: EventRegistrationToken); safecall;
  end;

(*
  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Storage.IStorageLibrary,Object>
  TypedEventHandler_2__IStorageLibrary__IInspectable_Delegate_Base = interface(IUnknown)
  ['{EDC09538-BBAE-5B2B-9E81-B449EA7E48FE}']
  end;
  // RemoveAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Storage.IStorageLibrary
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Storage.IStorageLibrary,Object>
  TypedEventHandler_2__IStorageLibrary__IInspectable = interface(TypedEventHandler_2__IStorageLibrary__IInspectable_Delegate_Base)
  ['{5C4086A0-EB5D-5F34-BA93-BF32A3F8E36C}']
    procedure Invoke(sender: IStorageLibrary; args: IInspectable); safecall;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.IStorageFolder>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Boolean>
  // Used Types:  Windows.Storage.IStorageFolder
  // Used Types:  Windows.Foundation.Collections.IObservableVector`1<Windows.Storage.IStorageFolder>
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Storage.IStorageLibrary,Object>
  // Used Types:  Void
  }
  // Windows.Storage.IStorageLibrary
  IStorageLibrary = interface(IInspectable)
  ['{1EDD7103-0E5E-4D6C-B5E8-9318983D6A03}']
    function RequestAddFolderAsync: IAsyncOperation_1__IStorageFolder; safecall;
    function RequestRemoveFolderAsync(folder: IStorageFolder): IAsyncOperation_1__Boolean; safecall;
    function get_Folders: IObservableVector_1__IStorageFolder; safecall;
    function get_SaveFolder: IStorageFolder; safecall;
    function add_DefinitionChanged(handler: TypedEventHandler_2__IStorageLibrary__IInspectable): EventRegistrationToken; safecall;
    procedure remove_DefinitionChanged(eventCookie: EventRegistrationToken); safecall;
    property Folders: IObservableVector_1__IStorageFolder read get_Folders;
    property SaveFolder: IStorageFolder read get_SaveFolder;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Storage.IStorageLibrary
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Storage.IStorageLibrary>
  IIterator_1__IStorageLibrary = interface(IInspectable)
  ['{8F9FEF7D-1F0A-585A-A842-6C1C7AC2013B}']
    function get_Current: IStorageLibrary; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(out {TODO: verify}items: PIStorageLibrary): Cardinal; safecall;
    property Current: IStorageLibrary read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

*)

(*
  // Generic Delegate for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Storage.IStorageLibrary>
  IIterable_1__IStorageLibrary_Delegate_Base = interface(IUnknown)
  ['{851E3CFD-306B-5C8E-AE3C-A8D83C623604}']
  end;
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Storage.IStorageLibrary>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Storage.IStorageLibrary>
  IIterable_1__IStorageLibrary = interface(IIterable_1__IStorageLibrary_Delegate_Base)
  ['{02164A5D-F072-54C7-95F4-76F9ED8C3127}']
    function First: IIterator_1__IStorageLibrary; safecall;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Void
  }
  // Windows.Storage.Provider.IFileUpdateRequestDeferral
  Provider_IFileUpdateRequestDeferral = interface(IInspectable)
  ['{FFCEDB2B-8ADE-44A5-BB00-164C4E72F13A}']
    procedure Complete; safecall;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Storage.IStorageFile
  // Used Types:  Windows.Storage.Provider.FileUpdateStatus
  // Used Types:  Void
  // Used Types:  Windows.Storage.Provider.IFileUpdateRequestDeferral
  }
  // Windows.Storage.Provider.IFileUpdateRequest
  Provider_IFileUpdateRequest = interface(IInspectable)
  ['{40C82536-C1FE-4D93-A792-1E736BC70837}']
    function get_ContentId: HSTRING; safecall;
    function get_File: IStorageFile; safecall;
    function get_Status: Provider_FileUpdateStatus; safecall;
    procedure put_Status(value: Provider_FileUpdateStatus); safecall;
    function GetDeferral: Provider_IFileUpdateRequestDeferral; safecall;
    procedure UpdateLocalFile(value: IStorageFile); safecall;
    property ContentId: HSTRING read get_ContentId;
    property &File: IStorageFile read get_File;
    property Status: Provider_FileUpdateStatus read get_Status write put_Status;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Storage.Search.IStorageQueryResultBase
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Storage.Search.IStorageQueryResultBase,Object>
  TypedEventHandler_2__Search_IStorageQueryResultBase__IInspectable = interface(IUnknown)
  ['{4BA22861-00C4-597F-B6BF-3AF516F3B870}']
    procedure Invoke(sender: Search_IStorageQueryResultBase; args: IInspectable); safecall;
  end;

*)

  {
  // Used Types:  Windows.Storage.Search.SortEntry
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Storage.Search.SortEntry>
  IIterator_1__Search_SortEntry = interface(IInspectable)
  ['{752850B9-5ED2-5655-8DE2-262EFC26CF39}']
    function get_Current: Search_SortEntry; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(out {TODO: verify}items: PSearch_SortEntry): Cardinal; safecall;
    property Current: Search_SortEntry read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

(*
  // Generic Delegate for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Storage.Search.SortEntry>
  IIterable_1__Search_SortEntry_Delegate_Base = interface(IUnknown)
  ['{35AFF6F9-EF75-5280-BB84-A2BF8317CF35}']
  end;
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Storage.Search.SortEntry>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Storage.Search.SortEntry>
  IIterable_1__Search_SortEntry = interface(IIterable_1__Search_SortEntry_Delegate_Base)
  ['{1B6614A1-8FC5-567D-9157-410A9E0ECBC5}']
    function First: IIterator_1__Search_SortEntry; safecall;
  end;

*)

  {
  // Used Types:  Windows.Storage.Search.SortEntry
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Storage.Search.SortEntry>
  IVectorView_1__Search_SortEntry = interface(IInspectable)
  ['{86D0B56E-CB4E-58F0-B9A2-1528619DCD26}']
    function GetAt(index: Cardinal): Search_SortEntry; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Search_SortEntry; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; out {TODO: verify}items: PSearch_SortEntry): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Storage.Search.SortEntry
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Storage.Search.SortEntry>
  // Used Types:  Boolean
  // Used Types:  Void
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Storage.Search.SortEntry>
  IVector_1__Search_SortEntry = interface(IInspectable)
  ['{A4739064-B54E-55D4-8012-317E2B6A807B}']
    function GetAt(index: Cardinal): Search_SortEntry; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Search_SortEntry; safecall;
    function IndexOf(value: Search_SortEntry; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Search_SortEntry); safecall;
    procedure InsertAt(index: Cardinal; value: Search_SortEntry); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Search_SortEntry); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; out {TODO: verify}items: PSearch_SortEntry): Cardinal; safecall;
    procedure ReplaceAll({TODO: verify}items: PSearch_SortEntry); safecall;
    property Size: Cardinal read get_Size;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVector`1<String>
  // Used Types:  Windows.Storage.Search.FolderDepth
  // Used Types:  Void
  // Used Types:  String
  // Used Types:  Windows.Storage.Search.IndexerOption
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Storage.Search.SortEntry>
  // Used Types:  Windows.Storage.Search.DateStackOption
  // Used Types:  Windows.Storage.FileProperties.ThumbnailMode
  // Used Types:  UInt32
  // Used Types:  Windows.Storage.FileProperties.ThumbnailOptions
  // Used Types:  Windows.Storage.FileProperties.PropertyPrefetchOptions
  // Used Types:  Windows.Foundation.Collections.IIterable`1<String>
  }
  // Windows.Storage.Search.IQueryOptions
  Search_IQueryOptions = interface(IInspectable)
  ['{1E5E46EE-0F45-4838-A8E9-D0479D446C30}']
    function get_FileTypeFilter: IVector_1__HSTRING; safecall;
    function get_FolderDepth: Search_FolderDepth; safecall;
    procedure put_FolderDepth(value: Search_FolderDepth); safecall;
    function get_ApplicationSearchFilter: HSTRING; safecall;
    procedure put_ApplicationSearchFilter(value: HSTRING); safecall;
    function get_UserSearchFilter: HSTRING; safecall;
    procedure put_UserSearchFilter(value: HSTRING); safecall;
    function get_Language: HSTRING; safecall;
    procedure put_Language(value: HSTRING); safecall;
    function get_IndexerOption: Search_IndexerOption; safecall;
    procedure put_IndexerOption(value: Search_IndexerOption); safecall;
    function get_SortOrder: IVector_1__Search_SortEntry; safecall;
    function get_GroupPropertyName: HSTRING; safecall;
    function get_DateStackOption: Search_DateStackOption; safecall;
    function SaveToString: HSTRING; safecall;
    procedure LoadFromString(value: HSTRING); safecall;
    procedure SetThumbnailPrefetch(mode: FileProperties_ThumbnailMode; requestedSize: Cardinal; options: FileProperties_ThumbnailOptions); safecall;
    procedure SetPropertyPrefetch(options: FileProperties_PropertyPrefetchOptions; propertiesToRetrieve: IIterable_1__HSTRING); safecall;
    property ApplicationSearchFilter: HSTRING read get_ApplicationSearchFilter write put_ApplicationSearchFilter;
    property DateStackOption: Search_DateStackOption read get_DateStackOption;
    property FileTypeFilter: IVector_1__HSTRING read get_FileTypeFilter;
    property FolderDepth: Search_FolderDepth read get_FolderDepth write put_FolderDepth;
    property GroupPropertyName: HSTRING read get_GroupPropertyName;
    property IndexerOption: Search_IndexerOption read get_IndexerOption write put_IndexerOption;
    property Language: HSTRING read get_Language write put_Language;
    property SortOrder: IVector_1__Search_SortEntry read get_SortOrder;
    property UserSearchFilter: HSTRING read get_UserSearchFilter write put_UserSearchFilter;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<UInt32>
  // Used Types:  Windows.Storage.IStorageFolder
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Storage.Search.IStorageQueryResultBase,Object>
  // Used Types:  Void
  // Used Types:  Object
  // Used Types:  Windows.Storage.Search.IQueryOptions
  }
  // Windows.Storage.Search.IStorageQueryResultBase
  Search_IStorageQueryResultBase = interface(IInspectable)
  ['{C297D70D-7353-47AB-BA58-8C61425DC54B}']
    function GetItemCountAsync: IAsyncOperation_1__Cardinal; safecall;
    function get_Folder: IStorageFolder; safecall;
    function add_ContentsChanged(handler: TypedEventHandler_2__Search_IStorageQueryResultBase__IInspectable): EventRegistrationToken; safecall;
    procedure remove_ContentsChanged(eventCookie: EventRegistrationToken); safecall;
    function add_OptionsChanged(changedHandler: TypedEventHandler_2__Search_IStorageQueryResultBase__IInspectable): EventRegistrationToken; safecall;
    procedure remove_OptionsChanged(eventCookie: EventRegistrationToken); safecall;
    function FindStartIndexAsync(value: IInspectable): IAsyncOperation_1__Cardinal; safecall;
    function GetCurrentQueryOptions: Search_IQueryOptions; safecall;
    procedure ApplyNewQueryOptions(newQueryOptions: Search_IQueryOptions); safecall;
    property Folder: IStorageFolder read get_Folder;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageFile>>
  // Used Types:  UInt32
  }
  // Windows.Storage.Search.IStorageFileQueryResult
  Search_IStorageFileQueryResult = interface(IInspectable)
  ['{52FDA447-2BAA-412C-B29F-D4B1778EFA1E}']
    function GetFilesAsync(startIndex: Cardinal; maxNumberOfItems: Cardinal): IAsyncOperation_1__IVectorView_1__IStorageFile; safecall; overload;
    function GetFilesAsync: IAsyncOperation_1__IVectorView_1__IStorageFile; safecall; overload;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  String
  }
  // Windows.Storage.Pickers.Provider.IFileRemovedEventArgs
  Pickers_Provider_IFileRemovedEventArgs = interface(IInspectable)
  ['{13043DA7-7FCA-4C2B-9ECA-6890F9F00185}']
    function get_Id: HSTRING; safecall;
    property Id: HSTRING read get_Id;
  end;

*)

(*
  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Storage.Pickers.Provider.IFileOpenPickerUI,Windows.Storage.Pickers.Provider.IFileRemovedEventArgs>
  TypedEventHandler_2__Pickers_Provider_IFileOpenPickerUI__Pickers_Provider_IFileRemovedEventArgs_Delegate_Base = interface(IUnknown)
  ['{F1FB2939-695B-5F56-841A-A52A7D148572}']
  end;
  // RemoveAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Storage.Pickers.Provider.IFileOpenPickerUI
  // Used Types:  Windows.Storage.Pickers.Provider.IFileRemovedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Storage.Pickers.Provider.IFileOpenPickerUI,Windows.Storage.Pickers.Provider.IFileRemovedEventArgs>
  TypedEventHandler_2__Pickers_Provider_IFileOpenPickerUI__Pickers_Provider_IFileRemovedEventArgs = interface(TypedEventHandler_2__Pickers_Provider_IFileOpenPickerUI__Pickers_Provider_IFileRemovedEventArgs_Delegate_Base)
  ['{9062BA3B-52D6-5970-A152-CA057E32A9C4}']
    procedure Invoke(sender: Pickers_Provider_IFileOpenPickerUI; args: Pickers_Provider_IFileRemovedEventArgs); safecall;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Void
  }
  // Windows.Storage.Pickers.Provider.IPickerClosingDeferral
  Pickers_Provider_IPickerClosingDeferral = interface(IInspectable)
  ['{7AF7F71E-1A67-4A31-AE80-E907708A619B}']
    procedure Complete; safecall;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Storage.Pickers.Provider.IPickerClosingDeferral
  // Used Types:  Windows.Foundation.DateTime
  }
  // Windows.Storage.Pickers.Provider.IPickerClosingOperation
  Pickers_Provider_IPickerClosingOperation = interface(IInspectable)
  ['{4CE9FB84-BEEE-4E39-A773-FC5F0EAE328D}']
    function GetDeferral: Pickers_Provider_IPickerClosingDeferral; safecall;
    function get_Deadline: DateTime; safecall;
    property Deadline: DateTime read get_Deadline;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Storage.Pickers.Provider.IPickerClosingOperation
  // Used Types:  Boolean
  }
  // Windows.Storage.Pickers.Provider.IPickerClosingEventArgs
  Pickers_Provider_IPickerClosingEventArgs = interface(IInspectable)
  ['{7E59F224-B332-4F12-8B9F-A8C2F06B32CD}']
    function get_ClosingOperation: Pickers_Provider_IPickerClosingOperation; safecall;
    function get_IsCanceled: Boolean; safecall;
    property ClosingOperation: Pickers_Provider_IPickerClosingOperation read get_ClosingOperation;
    property IsCanceled: Boolean read get_IsCanceled;
  end;

*)

(*
  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Storage.Pickers.Provider.IFileOpenPickerUI,Windows.Storage.Pickers.Provider.IPickerClosingEventArgs>
  TypedEventHandler_2__Pickers_Provider_IFileOpenPickerUI__Pickers_Provider_IPickerClosingEventArgs_Delegate_Base = interface(IUnknown)
  ['{2B06BDAC-983B-5552-B5C9-B0990A2DB3A1}']
  end;
  // RemoveAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Storage.Pickers.Provider.IFileOpenPickerUI
  // Used Types:  Windows.Storage.Pickers.Provider.IPickerClosingEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Storage.Pickers.Provider.IFileOpenPickerUI,Windows.Storage.Pickers.Provider.IPickerClosingEventArgs>
  TypedEventHandler_2__Pickers_Provider_IFileOpenPickerUI__Pickers_Provider_IPickerClosingEventArgs = interface(TypedEventHandler_2__Pickers_Provider_IFileOpenPickerUI__Pickers_Provider_IPickerClosingEventArgs_Delegate_Base)
  ['{48264217-467D-5D3F-9321-B49DC3C6CE4C}']
    procedure Invoke(sender: Pickers_Provider_IFileOpenPickerUI; args: Pickers_Provider_IPickerClosingEventArgs); safecall;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Storage.Pickers.Provider.AddFileResult
  // Used Types:  String
  // Used Types:  Windows.Storage.IStorageFile
  // Used Types:  Void
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<String>
  // Used Types:  Windows.Storage.Pickers.Provider.FileSelectionMode
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Storage.Pickers.Provider.IFileOpenPickerUI,Windows.Storage.Pickers.Provider.IFileRemovedEventArgs>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Storage.Pickers.Provider.IFileOpenPickerUI,Windows.Storage.Pickers.Provider.IPickerClosingEventArgs>
  }
  // Windows.Storage.Pickers.Provider.IFileOpenPickerUI
  Pickers_Provider_IFileOpenPickerUI = interface(IInspectable)
  ['{DDA45A10-F9D4-40C4-8AF5-C5B6B5A61D1D}']
    function AddFile(id: HSTRING; &file: IStorageFile): Pickers_Provider_AddFileResult; safecall;
    procedure RemoveFile(id: HSTRING); safecall;
    function ContainsFile(id: HSTRING): Boolean; safecall;
    function CanAddFile(&file: IStorageFile): Boolean; safecall;
    function get_AllowedFileTypes: IVectorView_1__HSTRING; safecall;
    function get_SelectionMode: Pickers_Provider_FileSelectionMode; safecall;
    function get_SettingsIdentifier: HSTRING; safecall;
    function get_Title: HSTRING; safecall;
    procedure put_Title(value: HSTRING); safecall;
    function add_FileRemoved(handler: TypedEventHandler_2__Pickers_Provider_IFileOpenPickerUI__Pickers_Provider_IFileRemovedEventArgs): EventRegistrationToken; safecall;
    procedure remove_FileRemoved(token: EventRegistrationToken); safecall;
    function add_Closing(handler: TypedEventHandler_2__Pickers_Provider_IFileOpenPickerUI__Pickers_Provider_IPickerClosingEventArgs): EventRegistrationToken; safecall;
    procedure remove_Closing(token: EventRegistrationToken); safecall;
    property AllowedFileTypes: IVectorView_1__HSTRING read get_AllowedFileTypes;
    property SelectionMode: Pickers_Provider_FileSelectionMode read get_SelectionMode;
    property SettingsIdentifier: HSTRING read get_SettingsIdentifier;
    property Title: HSTRING read get_Title write put_Title;
  end;

*)

(*
  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Storage.Pickers.Provider.IFileSavePickerUI,Object>
  TypedEventHandler_2__Pickers_Provider_IFileSavePickerUI__IInspectable_Delegate_Base = interface(IUnknown)
  ['{F1E6A632-F97F-54D9-9E1B-A714EDC3FF06}']
  end;
  // RemoveAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Storage.Pickers.Provider.IFileSavePickerUI
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Storage.Pickers.Provider.IFileSavePickerUI,Object>
  TypedEventHandler_2__Pickers_Provider_IFileSavePickerUI__IInspectable = interface(TypedEventHandler_2__Pickers_Provider_IFileSavePickerUI__IInspectable_Delegate_Base)
  ['{BB54A5EA-3A8B-57FC-81E5-AE9EB9864FAE}']
    procedure Invoke(sender: Pickers_Provider_IFileSavePickerUI; args: IInspectable); safecall;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Void
  }
  // Windows.Storage.Pickers.Provider.ITargetFileRequestDeferral
  Pickers_Provider_ITargetFileRequestDeferral = interface(IInspectable)
  ['{4AEE9D91-BF15-4DA9-95F6-F6B7D558225B}']
    procedure Complete; safecall;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Storage.IStorageFile
  // Used Types:  Void
  // Used Types:  Windows.Storage.Pickers.Provider.ITargetFileRequestDeferral
  }
  // Windows.Storage.Pickers.Provider.ITargetFileRequest
  Pickers_Provider_ITargetFileRequest = interface(IInspectable)
  ['{42BD3355-7F88-478B-8E81-690B20340678}']
    function get_TargetFile: IStorageFile; safecall;
    procedure put_TargetFile(value: IStorageFile); safecall;
    function GetDeferral: Pickers_Provider_ITargetFileRequestDeferral; safecall;
    property TargetFile: IStorageFile read get_TargetFile write put_TargetFile;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Storage.Pickers.Provider.ITargetFileRequest
  }
  // Windows.Storage.Pickers.Provider.ITargetFileRequestedEventArgs
  Pickers_Provider_ITargetFileRequestedEventArgs = interface(IInspectable)
  ['{B163DBC1-1B51-4C89-A591-0FD40B3C57C9}']
    function get_Request: Pickers_Provider_ITargetFileRequest; safecall;
    property Request: Pickers_Provider_ITargetFileRequest read get_Request;
  end;

*)

(*
  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Storage.Pickers.Provider.IFileSavePickerUI,Windows.Storage.Pickers.Provider.ITargetFileRequestedEventArgs>
  TypedEventHandler_2__Pickers_Provider_IFileSavePickerUI__Pickers_Provider_ITargetFileRequestedEventArgs_Delegate_Base = interface(IUnknown)
  ['{D3E1F8C7-45C5-5249-B336-A111BFAA985B}']
  end;
  // RemoveAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Storage.Pickers.Provider.IFileSavePickerUI
  // Used Types:  Windows.Storage.Pickers.Provider.ITargetFileRequestedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Storage.Pickers.Provider.IFileSavePickerUI,Windows.Storage.Pickers.Provider.ITargetFileRequestedEventArgs>
  TypedEventHandler_2__Pickers_Provider_IFileSavePickerUI__Pickers_Provider_ITargetFileRequestedEventArgs = interface(TypedEventHandler_2__Pickers_Provider_IFileSavePickerUI__Pickers_Provider_ITargetFileRequestedEventArgs_Delegate_Base)
  ['{87064D8A-E13C-537D-BD5D-DF5B0CB866CC}']
    procedure Invoke(sender: Pickers_Provider_IFileSavePickerUI; args: Pickers_Provider_ITargetFileRequestedEventArgs); safecall;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  String
  // Used Types:  Void
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<String>
  // Used Types:  Windows.Storage.Pickers.Provider.SetFileNameResult
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Storage.Pickers.Provider.IFileSavePickerUI,Object>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Storage.Pickers.Provider.IFileSavePickerUI,Windows.Storage.Pickers.Provider.ITargetFileRequestedEventArgs>
  }
  // Windows.Storage.Pickers.Provider.IFileSavePickerUI
  Pickers_Provider_IFileSavePickerUI = interface(IInspectable)
  ['{9656C1E7-3E56-43CC-8A39-33C73D9D542B}']
    function get_Title: HSTRING; safecall;
    procedure put_Title(value: HSTRING); safecall;
    function get_AllowedFileTypes: IVectorView_1__HSTRING; safecall;
    function get_SettingsIdentifier: HSTRING; safecall;
    function get_FileName: HSTRING; safecall;
    function TrySetFileName(value: HSTRING): Pickers_Provider_SetFileNameResult; safecall;
    function add_FileNameChanged(handler: TypedEventHandler_2__Pickers_Provider_IFileSavePickerUI__IInspectable): EventRegistrationToken; safecall;
    procedure remove_FileNameChanged(token: EventRegistrationToken); safecall;
    function add_TargetFileRequested(handler: TypedEventHandler_2__Pickers_Provider_IFileSavePickerUI__Pickers_Provider_ITargetFileRequestedEventArgs): EventRegistrationToken; safecall;
    procedure remove_TargetFileRequested(token: EventRegistrationToken); safecall;
    property AllowedFileTypes: IVectorView_1__HSTRING read get_AllowedFileTypes;
    property FileName: HSTRING read get_FileName;
    property SettingsIdentifier: HSTRING read get_SettingsIdentifier;
    property Title: HSTRING read get_Title write put_Title;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Storage.Provider.IFileUpdateRequest
  }
  // Windows.Storage.Provider.IFileUpdateRequestedEventArgs
  Provider_IFileUpdateRequestedEventArgs = interface(IInspectable)
  ['{7B0A9342-3905-438D-AAEF-78AE265F8DD2}']
    function get_Request: Provider_IFileUpdateRequest; safecall;
    property Request: Provider_IFileUpdateRequest read get_Request;
  end;

*)

(*
  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Storage.Provider.ICachedFileUpdaterUI,Windows.Storage.Provider.IFileUpdateRequestedEventArgs>
  TypedEventHandler_2__Provider_ICachedFileUpdaterUI__Provider_IFileUpdateRequestedEventArgs_Delegate_Base = interface(IUnknown)
  ['{ED56AB72-EBD3-52C8-B0AC-987D30090351}']
  end;
  // RemoveAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Storage.Provider.ICachedFileUpdaterUI
  // Used Types:  Windows.Storage.Provider.IFileUpdateRequestedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Storage.Provider.ICachedFileUpdaterUI,Windows.Storage.Provider.IFileUpdateRequestedEventArgs>
  TypedEventHandler_2__Provider_ICachedFileUpdaterUI__Provider_IFileUpdateRequestedEventArgs = interface(TypedEventHandler_2__Provider_ICachedFileUpdaterUI__Provider_IFileUpdateRequestedEventArgs_Delegate_Base)
  ['{79F8EA77-4833-55EF-9EF5-E1DE8A55D466}']
    procedure Invoke(sender: Provider_ICachedFileUpdaterUI; args: Provider_IFileUpdateRequestedEventArgs); safecall;
  end;

*)

(*
  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Storage.Provider.ICachedFileUpdaterUI,Object>
  TypedEventHandler_2__Provider_ICachedFileUpdaterUI__IInspectable_Delegate_Base = interface(IUnknown)
  ['{45FDD443-C0B9-57B0-A84F-7D876EDC3149}']
  end;
  // RemoveAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Storage.Provider.ICachedFileUpdaterUI
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Storage.Provider.ICachedFileUpdaterUI,Object>
  TypedEventHandler_2__Provider_ICachedFileUpdaterUI__IInspectable = interface(TypedEventHandler_2__Provider_ICachedFileUpdaterUI__IInspectable_Delegate_Base)
  ['{24C1E235-49C9-57D0-AAB2-00275EE76994}']
    procedure Invoke(sender: Provider_ICachedFileUpdaterUI; args: IInspectable); safecall;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  String
  // Used Types:  Void
  // Used Types:  Windows.Storage.Provider.CachedFileTarget
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Storage.Provider.ICachedFileUpdaterUI,Windows.Storage.Provider.IFileUpdateRequestedEventArgs>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Storage.Provider.ICachedFileUpdaterUI,Object>
  // Used Types:  Windows.Storage.Provider.UIStatus
  }
  // Windows.Storage.Provider.ICachedFileUpdaterUI
  Provider_ICachedFileUpdaterUI = interface(IInspectable)
  ['{9E6F41E6-BAF2-4A97-B600-9333F5DF80FD}']
    function get_Title: HSTRING; safecall;
    procedure put_Title(value: HSTRING); safecall;
    function get_UpdateTarget: Provider_CachedFileTarget; safecall;
    function add_FileUpdateRequested(handler: TypedEventHandler_2__Provider_ICachedFileUpdaterUI__Provider_IFileUpdateRequestedEventArgs): EventRegistrationToken; safecall;
    procedure remove_FileUpdateRequested(token: EventRegistrationToken); safecall;
    function add_UIRequested(handler: TypedEventHandler_2__Provider_ICachedFileUpdaterUI__IInspectable): EventRegistrationToken; safecall;
    procedure remove_UIRequested(token: EventRegistrationToken); safecall;
    function get_UIStatus: Provider_UIStatus; safecall;
    property Title: HSTRING read get_Title write put_Title;
    property UIStatus: Provider_UIStatus read get_UIStatus;
    property UpdateTarget: Provider_CachedFileTarget read get_UpdateTarget;
  end;

*)

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Void
  }
  // Windows.Storage.ISetVersionDeferral
  ISetVersionDeferral = interface(IInspectable)
  ['{033508A2-781A-437A-B078-3F32BADCFE47}']
    procedure Complete; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt32
  // Used Types:  Windows.Storage.ISetVersionDeferral
  }
  // Windows.Storage.ISetVersionRequest
  ISetVersionRequest = interface(IInspectable)
  ['{B9C76B9B-1056-4E69-8330-162619956F9B}']
    function get_CurrentVersion: Cardinal; safecall;
    function get_DesiredVersion: Cardinal; safecall;
    function GetDeferral: ISetVersionDeferral; safecall;
    property CurrentVersion: Cardinal read get_CurrentVersion;
    property DesiredVersion: Cardinal read get_DesiredVersion;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Storage.ISetVersionRequest
  }
  // Windows.Storage.ApplicationDataSetVersionHandler
  ApplicationDataSetVersionHandler = interface(IUnknown)
  ['{A05791E6-CC9F-4687-ACAB-A364FD785463}']
    procedure Invoke(setVersionRequest: ISetVersionRequest); safecall;
  end;

  {
  // Used Types:  String
  // Used Types:  Windows.Storage.IApplicationDataContainer
  }
  // Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Storage.IApplicationDataContainer>
  IKeyValuePair_2__HSTRING__IApplicationDataContainer = interface(IInspectable)
  ['{9C29CDD1-F5FA-5E4B-BC39-A1FDB2E48959}']
    function get_Key: HSTRING; safecall;
    function get_Value: IApplicationDataContainer; safecall;
    property Key: HSTRING read get_Key;
    property Value: IApplicationDataContainer read get_Value;
  end;

  {
  // Used Types:  Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Storage.IApplicationDataContainer>
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Storage.IApplicationDataContainer>>
  IIterator_1__IKeyValuePair_2__HSTRING__IApplicationDataContainer = interface(IInspectable)
  ['{C00495D1-304D-5005-8F60-35610C7A70A1}']
    function get_Current: IKeyValuePair_2__HSTRING__IApplicationDataContainer; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(out {TODO: verify}items: PIKeyValuePair_2__HSTRING__IApplicationDataContainer): Cardinal; safecall;
    property Current: IKeyValuePair_2__HSTRING__IApplicationDataContainer read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Storage.IApplicationDataContainer>>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Storage.IApplicationDataContainer>>
  IIterable_1__IKeyValuePair_2__HSTRING__IApplicationDataContainer = interface(IInspectable)
  ['{BE784D1D-41C6-557E-8776-DFDEF79D733E}']
    function First: IIterator_1__IKeyValuePair_2__HSTRING__IApplicationDataContainer; safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.Collections.IMapView`2<String,Windows.Storage.IApplicationDataContainer>
  IMapView_2__HSTRING__IApplicationDataContainer_Delegate_Base = interface(IUnknown)
  ['{13624F8D-85CC-5780-A78D-64DBA58F2C3C}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Storage.IApplicationDataContainer
  // Used Types:  String
  // Used Types:  UInt32
  // Used Types:  Boolean
  // Used Types:  Void
  // Used Types:  Windows.Foundation.Collections.IMapView`2<String,Windows.Storage.IApplicationDataContainer>
  }
  // Windows.Foundation.Collections.IMapView`2<String,Windows.Storage.IApplicationDataContainer>
  IMapView_2__HSTRING__IApplicationDataContainer = interface(IMapView_2__HSTRING__IApplicationDataContainer_Delegate_Base)
  ['{EB2E8596-3B90-592B-83DE-3A1AFD8B48A7}']
    function Lookup(key: HSTRING): IApplicationDataContainer; safecall;
    function get_Size: Cardinal; safecall;
    function HasKey(key: HSTRING): Boolean; safecall;
    procedure Split(out first: IMapView_2__HSTRING__IApplicationDataContainer; out second: IMapView_2__HSTRING__IApplicationDataContainer); safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Storage.ApplicationDataLocality
  // Used Types:  Windows.Foundation.Collections.IPropertySet
  // Used Types:  Windows.Foundation.Collections.IMapView`2<String,Windows.Storage.IApplicationDataContainer>
  // Used Types:  Windows.Storage.IApplicationDataContainer
  // Used Types:  Windows.Storage.ApplicationDataCreateDisposition
  // Used Types:  Void
  }
  // Windows.Storage.IApplicationDataContainer
  IApplicationDataContainer = interface(IInspectable)
  ['{C5AEFD1E-F467-40BA-8566-AB640A441E1D}']
    function get_Name: HSTRING; safecall;
    function get_Locality: ApplicationDataLocality; safecall;
    function get_Values: IPropertySet; safecall;
    function get_Containers: IMapView_2__HSTRING__IApplicationDataContainer; safecall;
    function CreateContainer(name: HSTRING; disposition: ApplicationDataCreateDisposition): IApplicationDataContainer; safecall;
    procedure DeleteContainer(name: HSTRING); safecall;
    property Containers: IMapView_2__HSTRING__IApplicationDataContainer read get_Containers;
    property Locality: ApplicationDataLocality read get_Locality;
    property Name: HSTRING read get_Name;
    property Values: IPropertySet read get_Values;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Storage.IApplicationData,Object>
  TypedEventHandler_2__IApplicationData__IInspectable_Delegate_Base = interface(IUnknown)
  ['{B5348B3B-5081-5AE9-8FA3-4D22D68FB0EA}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Storage.IApplicationData
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Storage.IApplicationData,Object>
  TypedEventHandler_2__IApplicationData__IInspectable = interface(TypedEventHandler_2__IApplicationData__IInspectable_Delegate_Base)
  ['{4E72D889-3D9A-5E3B-AA8A-3B37D17226DC}']
    procedure Invoke(sender: IApplicationData; args: IInspectable); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.IAsyncAction
  // Used Types:  Windows.Storage.ApplicationDataSetVersionHandler
  // Used Types:  Windows.Storage.ApplicationDataLocality
  // Used Types:  Windows.Storage.IApplicationDataContainer
  // Used Types:  Windows.Storage.IStorageFolder
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Storage.IApplicationData,Object>
  // Used Types:  Void
  // Used Types:  UInt64
  }
  // Windows.Storage.IApplicationData
  IApplicationData = interface(IInspectable)
  ['{C3DA6FB7-B744-4B45-B0B8-223A0938D0DC}']
    function get_Version: Cardinal; safecall;
    function SetVersionAsync(desiredVersion: Cardinal; handler: ApplicationDataSetVersionHandler): IAsyncAction; safecall;
    function ClearAsync: IAsyncAction; safecall; overload;
    function ClearAsync(locality: ApplicationDataLocality): IAsyncAction; safecall; overload;
    function get_LocalSettings: IApplicationDataContainer; safecall;
    function get_RoamingSettings: IApplicationDataContainer; safecall;
    function get_LocalFolder: IStorageFolder; safecall;
    function get_RoamingFolder: IStorageFolder; safecall;
    function get_TemporaryFolder: IStorageFolder; safecall;
    function add_DataChanged(handler: TypedEventHandler_2__IApplicationData__IInspectable): EventRegistrationToken; safecall;
    procedure remove_DataChanged(token: EventRegistrationToken); safecall;
    procedure SignalDataChanged; safecall;
    function get_RoamingStorageQuota: UInt64; safecall;
    property LocalFolder: IStorageFolder read get_LocalFolder;
    property LocalSettings: IApplicationDataContainer read get_LocalSettings;
    property RoamingFolder: IStorageFolder read get_RoamingFolder;
    property RoamingSettings: IApplicationDataContainer read get_RoamingSettings;
    property RoamingStorageQuota: UInt64 read get_RoamingStorageQuota;
    property TemporaryFolder: IStorageFolder read get_TemporaryFolder;
    property Version: Cardinal read get_Version;
  end;

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IMap`2<String,Object>>
  // Used Types:  Windows.Foundation.Collections.IIterable`1<String>
  // Used Types:  Windows.Foundation.IAsyncAction
  // Used Types:  Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Object>>
  }
  // Windows.Storage.FileProperties.IStorageItemExtraProperties
  FileProperties_IStorageItemExtraProperties = interface(IInspectable)
  ['{C54361B2-54CD-432B-BDBC-4B19C4B470D7}']
    function RetrievePropertiesAsync(propertiesToRetrieve: IIterable_1__HSTRING): IAsyncOperation_1__IMap_2__HSTRING__IInspectable; safecall;
    function SavePropertiesAsync(propertiesToSave: IIterable_1__IKeyValuePair_2__HSTRING__IInspectable): IAsyncAction; safecall; overload;
    function SavePropertiesAsync: IAsyncAction; safecall; overload;
  end;

*)

  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Void
  // Used Types:  Windows.Foundation.Collections.IVector`1<String>
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.TimeSpan
  }
  // Windows.Storage.FileProperties.IMusicProperties
  FileProperties_IMusicProperties = interface(IInspectable)
  ['{BC8AAB62-66EC-419A-BC5D-CA65A4CB46DA}']
    function get_Album: HSTRING; safecall;
    procedure put_Album(value: HSTRING); safecall;
    function get_Artist: HSTRING; safecall;
    procedure put_Artist(value: HSTRING); safecall;
    function get_Genre: IVector_1__HSTRING; safecall;
    function get_TrackNumber: Cardinal; safecall;
    procedure put_TrackNumber(value: Cardinal); safecall;
    function get_Title: HSTRING; safecall;
    procedure put_Title(value: HSTRING); safecall;
    function get_Rating: Cardinal; safecall;
    procedure put_Rating(value: Cardinal); safecall;
    function get_Duration: TimeSpan; safecall;
    function get_Bitrate: Cardinal; safecall;
    function get_AlbumArtist: HSTRING; safecall;
    procedure put_AlbumArtist(value: HSTRING); safecall;
    function get_Composers: IVector_1__HSTRING; safecall;
    function get_Conductors: IVector_1__HSTRING; safecall;
    function get_Subtitle: HSTRING; safecall;
    procedure put_Subtitle(value: HSTRING); safecall;
    function get_Producers: IVector_1__HSTRING; safecall;
    function get_Publisher: HSTRING; safecall;
    procedure put_Publisher(value: HSTRING); safecall;
    function get_Writers: IVector_1__HSTRING; safecall;
    function get_Year: Cardinal; safecall;
    procedure put_Year(value: Cardinal); safecall;
    property Album: HSTRING read get_Album write put_Album;
    property AlbumArtist: HSTRING read get_AlbumArtist write put_AlbumArtist;
    property Artist: HSTRING read get_Artist write put_Artist;
    property Bitrate: Cardinal read get_Bitrate;
    property Composers: IVector_1__HSTRING read get_Composers;
    property Conductors: IVector_1__HSTRING read get_Conductors;
    property Duration: TimeSpan read get_Duration;
    property Genre: IVector_1__HSTRING read get_Genre;
    property Producers: IVector_1__HSTRING read get_Producers;
    property Publisher: HSTRING read get_Publisher write put_Publisher;
    property Rating: Cardinal read get_Rating write put_Rating;
    property Subtitle: HSTRING read get_Subtitle write put_Subtitle;
    property Title: HSTRING read get_Title write put_Title;
    property TrackNumber: Cardinal read get_TrackNumber write put_TrackNumber;
    property Writers: IVector_1__HSTRING read get_Writers;
    property Year: Cardinal read get_Year write put_Year;
  end;

  // UsedAPI Interface
  {
  // Used Types:  UInt32
  // Used Types:  Void
  // Used Types:  Windows.Foundation.Collections.IVector`1<String>
  // Used Types:  Windows.Foundation.TimeSpan
  // Used Types:  Windows.Foundation.IReference`1<Double>
  // Used Types:  String
  // Used Types:  Windows.Storage.FileProperties.VideoOrientation
  }
  // Windows.Storage.FileProperties.IVideoProperties
  FileProperties_IVideoProperties = interface(IInspectable)
  ['{719AE507-68DE-4DB8-97DE-49998C059F2F}']
    function get_Rating: Cardinal; safecall;
    procedure put_Rating(value: Cardinal); safecall;
    function get_Keywords: IVector_1__HSTRING; safecall;
    function get_Width: Cardinal; safecall;
    function get_Height: Cardinal; safecall;
    function get_Duration: TimeSpan; safecall;
    function get_Latitude: IReference_1__Double; safecall;
    function get_Longitude: IReference_1__Double; safecall;
    function get_Title: HSTRING; safecall;
    procedure put_Title(value: HSTRING); safecall;
    function get_Subtitle: HSTRING; safecall;
    procedure put_Subtitle(value: HSTRING); safecall;
    function get_Producers: IVector_1__HSTRING; safecall;
    function get_Publisher: HSTRING; safecall;
    procedure put_Publisher(value: HSTRING); safecall;
    function get_Writers: IVector_1__HSTRING; safecall;
    function get_Year: Cardinal; safecall;
    procedure put_Year(value: Cardinal); safecall;
    function get_Bitrate: Cardinal; safecall;
    function get_Directors: IVector_1__HSTRING; safecall;
    function get_Orientation: FileProperties_VideoOrientation; safecall;
    property Bitrate: Cardinal read get_Bitrate;
    property Directors: IVector_1__HSTRING read get_Directors;
    property Duration: TimeSpan read get_Duration;
    property Height: Cardinal read get_Height;
    property Keywords: IVector_1__HSTRING read get_Keywords;
    property Latitude: IReference_1__Double read get_Latitude;
    property Longitude: IReference_1__Double read get_Longitude;
    property Orientation: FileProperties_VideoOrientation read get_Orientation;
    property Producers: IVector_1__HSTRING read get_Producers;
    property Publisher: HSTRING read get_Publisher write put_Publisher;
    property Rating: Cardinal read get_Rating write put_Rating;
    property Subtitle: HSTRING read get_Subtitle write put_Subtitle;
    property Title: HSTRING read get_Title write put_Title;
    property Width: Cardinal read get_Width;
    property Writers: IVector_1__HSTRING read get_Writers;
    property Year: Cardinal read get_Year write put_Year;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Storage.IStorageFile
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageFile>
  // Used Types:  Boolean
  // Used Types:  Void
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Storage.IStorageFile>
  IVector_1__IStorageFile = interface(IInspectable)
  ['{021A3F69-AD1E-5FB9-978A-056984AE2B2D}']
    function GetAt(index: Cardinal): IStorageFile; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__IStorageFile; safecall;
    function IndexOf(value: IStorageFile; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: IStorageFile); safecall;
    procedure InsertAt(index: Cardinal; value: IStorageFile); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: IStorageFile); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; out {TODO: verify}items: PIStorageFile): Cardinal; safecall;
    procedure ReplaceAll({TODO: verify}items: PIStorageFile); safecall;
    property Size: Cardinal read get_Size;
  end;

(*
  // RemoveAPI Interface
  {
  // Used Types:  String
  // Used Types:  Void
  // Used Types:  Windows.Foundation.Collections.IMap`2<String,Object>
  // Used Types:  Windows.Storage.Streams.IRandomAccessStream
  }
  // Windows.Storage.Search.IIndexableContent
  Search_IIndexableContent = interface(IInspectable)
  ['{CCF1A05F-D4B5-483A-B06E-E0DB1EC420E4}']
    function get_Id: HSTRING; safecall;
    procedure put_Id(value: HSTRING); safecall;
    function get_Properties: IMap_2__HSTRING__IInspectable; safecall;
    function get_Stream: IRandomAccessStream; safecall;
    procedure put_Stream(value: IRandomAccessStream); safecall;
    function get_StreamContentType: HSTRING; safecall;
    procedure put_StreamContentType(value: HSTRING); safecall;
    property Id: HSTRING read get_Id write put_Id;
    property Properties: IMap_2__HSTRING__IInspectable read get_Properties;
    property Stream: IRandomAccessStream read get_Stream write put_Stream;
    property StreamContentType: HSTRING read get_StreamContentType write put_StreamContentType;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncAction
  // Used Types:  Windows.Storage.Search.IIndexableContent
  // Used Types:  String
  // Used Types:  Windows.Foundation.Collections.IIterable`1<String>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IMapView`2<String,Object>>
  // Used Types:  UInt64
  }
  // Windows.Storage.Search.IContentIndexer
  Search_IContentIndexer = interface(IInspectable)
  ['{B1767F8D-F698-4982-B05F-3A6E8CAB01A2}']
    function AddAsync(indexableContent: Search_IIndexableContent): IAsyncAction; safecall;
    function UpdateAsync(indexableContent: Search_IIndexableContent): IAsyncAction; safecall;
    function DeleteAsync(contentId: HSTRING): IAsyncAction; safecall;
    function DeleteMultipleAsync(contentIds: IIterable_1__HSTRING): IAsyncAction; safecall;
    function DeleteAllAsync: IAsyncAction; safecall;
    function RetrievePropertiesAsync(contentId: HSTRING; propertiesToRetrieve: IIterable_1__HSTRING): IAsyncOperation_1__IMapView_2__HSTRING__IInspectable; safecall;
    function get_Revision: UInt64; safecall;
    property Revision: UInt64 read get_Revision;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Storage.Search.IContentIndexer
  // Used Types:  String
  }
  // Windows.Storage.Search.IContentIndexerStatics
  Search_IContentIndexerStatics = interface(IInspectable)
  ['{8C488375-B37E-4C60-9BA8-B760FDA3E59D}']
    function GetIndexer(indexName: HSTRING): Search_IContentIndexer; safecall; overload;
    function GetIndexer: Search_IContentIndexer; safecall; overload;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  String
  // Used Types:  Void
  // Used Types:  Object
  }
  // Windows.Storage.Search.IValueAndLanguage
  Search_IValueAndLanguage = interface(IInspectable)
  ['{B9914881-A1EE-4BC4-92A5-466968E30436}']
    function get_Language: HSTRING; safecall;
    procedure put_Language(value: HSTRING); safecall;
    function get_Value: IInspectable; safecall;
    procedure put_Value(value: IInspectable); safecall;
    property Language: HSTRING read get_Language write put_Language;
    property Value: IInspectable read get_Value write put_Value;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Storage.Search.IIndexableContent
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Storage.Search.IIndexableContent>
  IIterator_1__Search_IIndexableContent = interface(IInspectable)
  ['{6CDB32BA-2361-57A8-A39D-BE1DF041BDB8}']
    function get_Current: Search_IIndexableContent; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(out {TODO: verify}items: PSearch_IIndexableContent): Cardinal; safecall;
    property Current: Search_IIndexableContent read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Storage.Search.IIndexableContent>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Storage.Search.IIndexableContent>
  IIterable_1__Search_IIndexableContent = interface(IInspectable)
  ['{4A6EDBFE-0C41-5042-AC58-A885A8FC7928}']
    function First: IIterator_1__Search_IIndexableContent; safecall;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Storage.Search.IIndexableContent
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Storage.Search.IIndexableContent>
  IVectorView_1__Search_IIndexableContent = interface(IInspectable)
  ['{F4512416-6BB8-5C6F-B83A-BF8A2788CE9F}']
    function GetAt(index: Cardinal): Search_IIndexableContent; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Search_IIndexableContent; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; out {TODO: verify}items: PSearch_IIndexableContent): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.Search.IIndexableContent>>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.Search.IIndexableContent>>
  AsyncOperationCompletedHandler_1__IVectorView_1__Search_IIndexableContent = interface(IUnknown)
  ['{6A29F493-EFB7-5FDB-A13E-F2C28B4DAB58}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IVectorView_1__Search_IIndexableContent; asyncStatus: AsyncStatus); safecall;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.Search.IIndexableContent>>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Storage.Search.IIndexableContent>
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.Search.IIndexableContent>>
  IAsyncOperation_1__IVectorView_1__Search_IIndexableContent = interface(IInspectable)
  ['{919850E1-084B-5F9B-A0A0-50DB0CD5DA91}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IVectorView_1__Search_IIndexableContent); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IVectorView_1__Search_IIndexableContent; safecall;
    function GetResults: IVectorView_1__Search_IIndexableContent; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IVectorView_1__Search_IIndexableContent read get_Completed write put_Completed;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<UInt32>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Foundation.Collections.IMapView`2<String,Object>>>
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.Search.IIndexableContent>>
  // Used Types:  Windows.Storage.IStorageFolder
  }
  // Windows.Storage.Search.IContentIndexerQuery
  Search_IContentIndexerQuery = interface(IInspectable)
  ['{70E3B0F8-4BFC-428A-8889-CC51DA9A7B9D}']
    function GetCountAsync: IAsyncOperation_1__Cardinal; safecall;
    function GetPropertiesAsync: IAsyncOperation_1__IVectorView_1__IMapView_2__HSTRING__IInspectable; safecall; overload;
    function GetPropertiesAsync(startIndex: Cardinal; maxItems: Cardinal): IAsyncOperation_1__IVectorView_1__IMapView_2__HSTRING__IInspectable; safecall; overload;
    function GetAsync: IAsyncOperation_1__IVectorView_1__Search_IIndexableContent; safecall; overload;
    function GetAsync(startIndex: Cardinal; maxItems: Cardinal): IAsyncOperation_1__IVectorView_1__Search_IIndexableContent; safecall; overload;
    function get_QueryFolder: IStorageFolder; safecall;
    property QueryFolder: IStorageFolder read get_QueryFolder;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Storage.Search.IContentIndexerQuery
  // Used Types:  String
  // Used Types:  Windows.Foundation.Collections.IIterable`1<String>
  // Used Types:  Windows.Foundation.Collections.IIterable`1<Windows.Storage.Search.SortEntry>
  }
  // Windows.Storage.Search.IContentIndexerQueryOperations
  Search_IContentIndexerQueryOperations = interface(IInspectable)
  ['{28823E10-4786-42F1-9730-792B3566B150}']
    function CreateQuery(searchFilter: HSTRING; propertiesToRetrieve: IIterable_1__HSTRING; sortOrder: IIterable_1__Search_SortEntry; searchFilterLanguage: HSTRING): Search_IContentIndexerQuery; safecall; overload;
    function CreateQuery(searchFilter: HSTRING; propertiesToRetrieve: IIterable_1__HSTRING; sortOrder: IIterable_1__Search_SortEntry): Search_IContentIndexerQuery; safecall; overload;
    function CreateQuery(searchFilter: HSTRING; propertiesToRetrieve: IIterable_1__HSTRING): Search_IContentIndexerQuery; safecall; overload;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Storage.Provider.IFileUpdateRequest
  // Used Types:  Windows.Storage.Provider.IFileUpdateRequestDeferral
  }
  // Windows.Storage.Provider.ICachedFileUpdaterUI2
  Provider_ICachedFileUpdaterUI2 = interface(IInspectable)
  ['{8856A21C-8699-4340-9F49-F7CAD7FE8991}']
    function get_UpdateRequest: Provider_IFileUpdateRequest; safecall;
    function GetDeferral: Provider_IFileUpdateRequestDeferral; safecall;
    property UpdateRequest: Provider_IFileUpdateRequest read get_UpdateRequest;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  String
  // Used Types:  Void
  }
  // Windows.Storage.Provider.IFileUpdateRequest2
  Provider_IFileUpdateRequest2 = interface(IInspectable)
  ['{82484648-BDBE-447B-A2EE-7AFE6A032A94}']
    function get_UserInputNeededMessage: HSTRING; safecall;
    procedure put_UserInputNeededMessage(value: HSTRING); safecall;
    property UserInputNeededMessage: HSTRING read get_UserInputNeededMessage write put_UserInputNeededMessage;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  UInt32
  // Used Types:  Boolean
  // Used Types:  Windows.Storage.FileProperties.ThumbnailType
  }
  // Windows.Storage.FileProperties.IThumbnailProperties
  FileProperties_IThumbnailProperties = interface(IInspectable)
  ['{693DD42F-DBE7-49B5-B3B3-2893AC5D3423}']
    function get_OriginalWidth: Cardinal; safecall;
    function get_OriginalHeight: Cardinal; safecall;
    function get_ReturnedSmallerCachedSize: Boolean; safecall;
    function get_Type: FileProperties_ThumbnailType; safecall;
    property OriginalHeight: Cardinal read get_OriginalHeight;
    property OriginalWidth: Cardinal read get_OriginalWidth;
    property ReturnedSmallerCachedSize: Boolean read get_ReturnedSmallerCachedSize;
    property &Type: FileProperties_ThumbnailType read get_Type;
  end;

*)

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.FileProperties.IMusicProperties>
  AsyncOperationCompletedHandler_1__FileProperties_IMusicProperties_Delegate_Base = interface(IUnknown)
  ['{D84E1312-D661-5B7F-9566-7421BDEDC1EA}']
  end;
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.FileProperties.IMusicProperties>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.FileProperties.IMusicProperties>
  AsyncOperationCompletedHandler_1__FileProperties_IMusicProperties = interface(AsyncOperationCompletedHandler_1__FileProperties_IMusicProperties_Delegate_Base)
  ['{AE688CD9-E302-5657-82B5-1B974D1FA81F}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__FileProperties_IMusicProperties; asyncStatus: AsyncStatus); safecall;
  end;

  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.FileProperties.IMusicProperties>
  // Used Types:  Windows.Storage.FileProperties.IMusicProperties
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.FileProperties.IMusicProperties>
  IAsyncOperation_1__FileProperties_IMusicProperties = interface(IInspectable)
  ['{D3A7B974-3A90-55E8-82D0-D22F2A7B4856}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__FileProperties_IMusicProperties); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__FileProperties_IMusicProperties; safecall;
    function GetResults: FileProperties_IMusicProperties; safecall;
    property Completed: AsyncOperationCompletedHandler_1__FileProperties_IMusicProperties read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.FileProperties.IVideoProperties>
  AsyncOperationCompletedHandler_1__FileProperties_IVideoProperties_Delegate_Base = interface(IUnknown)
  ['{43401D34-61AB-5CF2-921F-55B616631D1D}']
  end;
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.FileProperties.IVideoProperties>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.FileProperties.IVideoProperties>
  AsyncOperationCompletedHandler_1__FileProperties_IVideoProperties = interface(AsyncOperationCompletedHandler_1__FileProperties_IVideoProperties_Delegate_Base)
  ['{75953071-FA00-5044-9240-B48C6CEF57B0}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__FileProperties_IVideoProperties; asyncStatus: AsyncStatus); safecall;
  end;

  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.FileProperties.IVideoProperties>
  // Used Types:  Windows.Storage.FileProperties.IVideoProperties
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.FileProperties.IVideoProperties>
  IAsyncOperation_1__FileProperties_IVideoProperties = interface(IInspectable)
  ['{C5B61E97-459B-5AA8-B350-2CF55E7C7D47}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__FileProperties_IVideoProperties); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__FileProperties_IVideoProperties; safecall;
    function GetResults: FileProperties_IVideoProperties; safecall;
    property Completed: AsyncOperationCompletedHandler_1__FileProperties_IVideoProperties read get_Completed write put_Completed;
  end;

(*
  // RemoveAPI Interface
  {
  // Used Types:  UInt32
  // Used Types:  Void
  // Used Types:  Windows.Foundation.Collections.IVector`1<String>
  // Used Types:  Windows.Foundation.DateTime
  // Used Types:  String
  // Used Types:  Windows.Foundation.IReference`1<Double>
  // Used Types:  Windows.Storage.FileProperties.PhotoOrientation
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<String>
  }
  // Windows.Storage.FileProperties.IImageProperties
  FileProperties_IImageProperties = interface(IInspectable)
  ['{523C9424-FCFF-4275-AFEE-ECDB9AB47973}']
    function get_Rating: Cardinal; safecall;
    procedure put_Rating(value: Cardinal); safecall;
    function get_Keywords: IVector_1__HSTRING; safecall;
    function get_DateTaken: DateTime; safecall;
    procedure put_DateTaken(value: DateTime); safecall;
    function get_Width: Cardinal; safecall;
    function get_Height: Cardinal; safecall;
    function get_Title: HSTRING; safecall;
    procedure put_Title(value: HSTRING); safecall;
    function get_Latitude: IReference_1__Double; safecall;
    function get_Longitude: IReference_1__Double; safecall;
    function get_CameraManufacturer: HSTRING; safecall;
    procedure put_CameraManufacturer(value: HSTRING); safecall;
    function get_CameraModel: HSTRING; safecall;
    procedure put_CameraModel(value: HSTRING); safecall;
    function get_Orientation: FileProperties_PhotoOrientation; safecall;
    function get_PeopleNames: IVectorView_1__HSTRING; safecall;
    property CameraManufacturer: HSTRING read get_CameraManufacturer write put_CameraManufacturer;
    property CameraModel: HSTRING read get_CameraModel write put_CameraModel;
    property DateTaken: DateTime read get_DateTaken write put_DateTaken;
    property Height: Cardinal read get_Height;
    property Keywords: IVector_1__HSTRING read get_Keywords;
    property Latitude: IReference_1__Double read get_Latitude;
    property Longitude: IReference_1__Double read get_Longitude;
    property Orientation: FileProperties_PhotoOrientation read get_Orientation;
    property PeopleNames: IVectorView_1__HSTRING read get_PeopleNames;
    property Rating: Cardinal read get_Rating write put_Rating;
    property Title: HSTRING read get_Title write put_Title;
    property Width: Cardinal read get_Width;
  end;

*)

(*
  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.FileProperties.IImageProperties>
  AsyncOperationCompletedHandler_1__FileProperties_IImageProperties_Delegate_Base = interface(IUnknown)
  ['{C63729BC-E4C3-564C-B137-2CB4F5966A83}']
  end;
  // RemoveAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.FileProperties.IImageProperties>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.FileProperties.IImageProperties>
  AsyncOperationCompletedHandler_1__FileProperties_IImageProperties = interface(AsyncOperationCompletedHandler_1__FileProperties_IImageProperties_Delegate_Base)
  ['{3E47A7AF-FC5E-5D68-A93B-98CEA696089D}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__FileProperties_IImageProperties; asyncStatus: AsyncStatus); safecall;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.FileProperties.IImageProperties>
  // Used Types:  Windows.Storage.FileProperties.IImageProperties
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.FileProperties.IImageProperties>
  IAsyncOperation_1__FileProperties_IImageProperties = interface(IInspectable)
  ['{6248A622-38DA-5FC3-AA6B-374D26DAC6BA}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__FileProperties_IImageProperties); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__FileProperties_IImageProperties; safecall;
    function GetResults: FileProperties_IImageProperties; safecall;
    property Completed: AsyncOperationCompletedHandler_1__FileProperties_IImageProperties read get_Completed write put_Completed;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVector`1<String>
  // Used Types:  String
  // Used Types:  Void
  }
  // Windows.Storage.FileProperties.IDocumentProperties
  FileProperties_IDocumentProperties = interface(IInspectable)
  ['{7EAB19BC-1821-4923-B4A9-0AEA404D0070}']
    function get_Author: IVector_1__HSTRING; safecall;
    function get_Title: HSTRING; safecall;
    procedure put_Title(value: HSTRING); safecall;
    function get_Keywords: IVector_1__HSTRING; safecall;
    function get_Comment: HSTRING; safecall;
    procedure put_Comment(value: HSTRING); safecall;
    property Author: IVector_1__HSTRING read get_Author;
    property Comment: HSTRING read get_Comment write put_Comment;
    property Keywords: IVector_1__HSTRING read get_Keywords;
    property Title: HSTRING read get_Title write put_Title;
  end;

*)

(*
  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.FileProperties.IDocumentProperties>
  AsyncOperationCompletedHandler_1__FileProperties_IDocumentProperties_Delegate_Base = interface(IUnknown)
  ['{4452ED4C-642B-501B-9617-7D68B4AC3C66}']
  end;
  // RemoveAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.FileProperties.IDocumentProperties>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.FileProperties.IDocumentProperties>
  AsyncOperationCompletedHandler_1__FileProperties_IDocumentProperties = interface(AsyncOperationCompletedHandler_1__FileProperties_IDocumentProperties_Delegate_Base)
  ['{E4B7DD5B-B84A-5EF6-884A-5383529B637B}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__FileProperties_IDocumentProperties; asyncStatus: AsyncStatus); safecall;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.FileProperties.IDocumentProperties>
  // Used Types:  Windows.Storage.FileProperties.IDocumentProperties
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.FileProperties.IDocumentProperties>
  IAsyncOperation_1__FileProperties_IDocumentProperties = interface(IInspectable)
  ['{A861F227-13B9-5FA3-A62E-01F9C918BA48}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__FileProperties_IDocumentProperties); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__FileProperties_IDocumentProperties; safecall;
    function GetResults: FileProperties_IDocumentProperties; safecall;
    property Completed: AsyncOperationCompletedHandler_1__FileProperties_IDocumentProperties read get_Completed write put_Completed;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.FileProperties.IMusicProperties>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.FileProperties.IVideoProperties>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.FileProperties.IImageProperties>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.FileProperties.IDocumentProperties>
  }
  // Windows.Storage.FileProperties.IStorageItemContentProperties
  FileProperties_IStorageItemContentProperties = interface(IInspectable)
  ['{05294BAD-BC38-48BF-85D7-770E0E2AE0BA}']
    function GetMusicPropertiesAsync: IAsyncOperation_1__FileProperties_IMusicProperties; safecall;
    function GetVideoPropertiesAsync: IAsyncOperation_1__FileProperties_IVideoProperties; safecall;
    function GetImagePropertiesAsync: IAsyncOperation_1__FileProperties_IImageProperties; safecall;
    function GetDocumentPropertiesAsync: IAsyncOperation_1__FileProperties_IDocumentProperties; safecall;
  end;

*)

(*
  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.IStorageLibrary>
  AsyncOperationCompletedHandler_1__IStorageLibrary_Delegate_Base = interface(IUnknown)
  ['{36D560C3-731F-5C70-B907-30BC99BC300F}']
  end;
  // RemoveAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.IStorageLibrary>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.IStorageLibrary>
  AsyncOperationCompletedHandler_1__IStorageLibrary = interface(AsyncOperationCompletedHandler_1__IStorageLibrary_Delegate_Base)
  ['{96ED7550-8A62-536C-86D6-49F6D6633431}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IStorageLibrary; asyncStatus: AsyncStatus); safecall;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.IStorageLibrary>
  // Used Types:  Windows.Storage.IStorageLibrary
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.IStorageLibrary>
  IAsyncOperation_1__IStorageLibrary = interface(IInspectable)
  ['{75B39646-56DF-5F84-8B4A-714E9FEE7C82}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IStorageLibrary); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IStorageLibrary; safecall;
    function GetResults: IStorageLibrary; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IStorageLibrary read get_Completed write put_Completed;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.IStorageLibrary>
  // Used Types:  Windows.Storage.KnownLibraryId
  }
  // Windows.Storage.IStorageLibraryStatics
  IStorageLibraryStatics = interface(IInspectable)
  ['{4208A6DB-684A-49C6-9E59-90121EE050D6}']
    function GetLibraryAsync(libraryId: KnownLibraryId): IAsyncOperation_1__IStorageLibrary; safecall;
  end;

*)

  {
  // Used Types:  Windows.Storage.IStorageFolder
  }
  // Windows.Storage.IKnownFoldersStatics
  IKnownFoldersStatics = interface(IInspectable)
  ['{5A2A7520-4802-452D-9AD9-4351ADA7EC35}']
    function get_MusicLibrary: IStorageFolder; safecall;
    function get_PicturesLibrary: IStorageFolder; safecall;
    function get_VideosLibrary: IStorageFolder; safecall;
    function get_DocumentsLibrary: IStorageFolder; safecall;
    function get_HomeGroup: IStorageFolder; safecall;
    function get_RemovableDevices: IStorageFolder; safecall;
    function get_MediaServerDevices: IStorageFolder; safecall;
    property DocumentsLibrary: IStorageFolder read get_DocumentsLibrary;
    property HomeGroup: IStorageFolder read get_HomeGroup;
    property MediaServerDevices: IStorageFolder read get_MediaServerDevices;
    property MusicLibrary: IStorageFolder read get_MusicLibrary;
    property PicturesLibrary: IStorageFolder read get_PicturesLibrary;
    property RemovableDevices: IStorageFolder read get_RemovableDevices;
    property VideosLibrary: IStorageFolder read get_VideosLibrary;
  end;

  {
  // Used Types:  Windows.Storage.IStorageFolder
  }
  // Windows.Storage.IKnownFoldersStatics2
  IKnownFoldersStatics2 = interface(IInspectable)
  ['{194BD0CD-CF6E-4D07-9D53-E9163A2536E9}']
    function get_Objects3D: IStorageFolder; safecall;
    function get_AppCaptures: IStorageFolder; safecall;
    function get_RecordedCalls: IStorageFolder; safecall;
    property AppCaptures: IStorageFolder read get_AppCaptures;
    property Objects3D: IStorageFolder read get_Objects3D;
    property RecordedCalls: IStorageFolder read get_RecordedCalls;
  end;

  {
  // Used Types:  Windows.Storage.IStorageFolder
  }
  // Windows.Storage.IKnownFoldersPlaylistsStatics
  IKnownFoldersPlaylistsStatics = interface(IInspectable)
  ['{DAD5ECD6-306F-4D6A-B496-46BA8EB106CE}']
    function get_Playlists: IStorageFolder; safecall;
    property Playlists: IStorageFolder read get_Playlists;
  end;

  {
  // Used Types:  Windows.Storage.IStorageFolder
  }
  // Windows.Storage.IKnownFoldersCameraRollStatics
  IKnownFoldersCameraRollStatics = interface(IInspectable)
  ['{5D115E66-27E8-492F-B8E5-2F90896CD4CD}']
    function get_CameraRoll: IStorageFolder; safecall;
    property CameraRoll: IStorageFolder read get_CameraRoll;
  end;

  {
  // Used Types:  Windows.Storage.IStorageFolder
  }
  // Windows.Storage.IKnownFoldersSavedPicturesStatics
  IKnownFoldersSavedPicturesStatics = interface(IInspectable)
  ['{055C93EA-253D-467C-B6CA-A97DA1E9A18D}']
    function get_SavedPictures: IStorageFolder; safecall;
    property SavedPictures: IStorageFolder read get_SavedPictures;
  end;

  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.IStorageFile>
  // Used Types:  String
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.IStorageFolder>
  // Used Types:  Windows.Storage.CreationCollisionOption
  }
  // Windows.Storage.IDownloadsFolderStatics
  IDownloadsFolderStatics = interface(IInspectable)
  ['{27862ED0-404E-47DF-A1E2-E37308BE7B37}']
    function CreateFileAsync(desiredName: HSTRING): IAsyncOperation_1__IStorageFile; safecall; overload;
    function CreateFolderAsync(desiredName: HSTRING): IAsyncOperation_1__IStorageFolder; safecall; overload;
    function CreateFileAsync(desiredName: HSTRING; option: CreationCollisionOption): IAsyncOperation_1__IStorageFile; safecall; overload;
    function CreateFolderAsync(desiredName: HSTRING; option: CreationCollisionOption): IAsyncOperation_1__IStorageFolder; safecall; overload;
  end;

(*
  // RemoveAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Storage.StreamedFileFailureMode
  }
  // Windows.Storage.IStreamedFileDataRequest
  IStreamedFileDataRequest = interface(IInspectable)
  ['{1673FCCE-DABD-4D50-BEEE-180B8A8191B6}']
    procedure FailAndClose(failureMode: StreamedFileFailureMode); safecall;
  end;

*)

  {
  // Used Types:  Void
  // Used Types:  Windows.Storage.Streams.IOutputStream
  }
  // Windows.Storage.StreamedFileDataRequestedHandler
  StreamedFileDataRequestedHandler = interface(IUnknown)
  ['{FEF6A824-2FE1-4D07-A35B-B77C50B5F4CC}']
    procedure Invoke(stream: IOutputStream); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.IStorageFile>
  // Used Types:  String
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  // Used Types:  Windows.Storage.StreamedFileDataRequestedHandler
  // Used Types:  Windows.Storage.Streams.IRandomAccessStreamReference
  // Used Types:  Windows.Storage.IStorageFile
  }
  // Windows.Storage.IStorageFileStatics
  IStorageFileStatics = interface(IInspectable)
  ['{5984C710-DAF2-43C8-8BB4-A4D3EACFD03F}']
    function GetFileFromPathAsync(path: HSTRING): IAsyncOperation_1__IStorageFile; safecall;
    function GetFileFromApplicationUriAsync(uri: IUriRuntimeClass): IAsyncOperation_1__IStorageFile; safecall;
    function CreateStreamedFileAsync(displayNameWithExtension: HSTRING; dataRequested: StreamedFileDataRequestedHandler; thumbnail: IRandomAccessStreamReference): IAsyncOperation_1__IStorageFile; safecall;
    function ReplaceWithStreamedFileAsync(fileToReplace: IStorageFile; dataRequested: StreamedFileDataRequestedHandler; thumbnail: IRandomAccessStreamReference): IAsyncOperation_1__IStorageFile; safecall;
    function CreateStreamedFileFromUriAsync(displayNameWithExtension: HSTRING; uri: IUriRuntimeClass; thumbnail: IRandomAccessStreamReference): IAsyncOperation_1__IStorageFile; safecall;
    function ReplaceWithStreamedFileFromUriAsync(fileToReplace: IStorageFile; uri: IUriRuntimeClass; thumbnail: IRandomAccessStreamReference): IAsyncOperation_1__IStorageFile; safecall;
  end;

  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.IStorageFolder>
  // Used Types:  String
  }
  // Windows.Storage.IStorageFolderStatics
  IStorageFolderStatics = interface(IInspectable)
  ['{08F327FF-85D5-48B9-AEE9-28511E339F9F}']
    function GetFolderFromPathAsync(path: HSTRING): IAsyncOperation_1__IStorageFolder; safecall;
  end;

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.IStorageFolder>
  // Used Types:  Boolean
  // Used Types:  Windows.Storage.IStorageItem
  }
  // Windows.Storage.IStorageItem2
  IStorageItem2 = interface(IInspectable)
  ['{53F926D2-083C-4283-B45B-81C007237E44}']
    function GetParentAsync: IAsyncOperation_1__IStorageFolder; safecall;
    function IsEqual(item: IStorageItem): Boolean; safecall;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.Streams.IRandomAccessStreamWithContentType>
  // Used Types:  Windows.Storage.FileProperties.ThumbnailMode
  // Used Types:  UInt32
  // Used Types:  Windows.Storage.FileProperties.ThumbnailOptions
  // Used Types:  String
  // Used Types:  Windows.Storage.FileProperties.IStorageItemContentProperties
  }
  // Windows.Storage.IStorageItemProperties
  IStorageItemProperties = interface(IInspectable)
  ['{86664478-8029-46FE-A789-1C2F3E2FFB5C}']
    function GetThumbnailAsync(mode: FileProperties_ThumbnailMode): IAsyncOperation_1__IRandomAccessStreamWithContentType; safecall; overload;
    function GetThumbnailAsync(mode: FileProperties_ThumbnailMode; requestedSize: Cardinal): IAsyncOperation_1__IRandomAccessStreamWithContentType; safecall; overload;
    function GetThumbnailAsync(mode: FileProperties_ThumbnailMode; requestedSize: Cardinal; options: FileProperties_ThumbnailOptions): IAsyncOperation_1__IRandomAccessStreamWithContentType; safecall; overload;
    function get_DisplayName: HSTRING; safecall;
    function get_DisplayType: HSTRING; safecall;
    function get_FolderRelativeId: HSTRING; safecall;
    function get_Properties: FileProperties_IStorageItemContentProperties; safecall;
    property DisplayName: HSTRING read get_DisplayName;
    property DisplayType: HSTRING read get_DisplayType;
    property FolderRelativeId: HSTRING read get_FolderRelativeId;
    property Properties: FileProperties_IStorageItemContentProperties read get_Properties;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.Streams.IRandomAccessStreamWithContentType>
  // Used Types:  Windows.Storage.FileProperties.ThumbnailMode
  // Used Types:  UInt32
  // Used Types:  Windows.Storage.FileProperties.ThumbnailOptions
  }
  // Windows.Storage.IStorageItemProperties2
  IStorageItemProperties2 = interface(IInspectable)
  ['{8E86A951-04B9-4BD2-929D-FEF3F71621D0}']
    function GetScaledImageAsThumbnailAsync(mode: FileProperties_ThumbnailMode): IAsyncOperation_1__IRandomAccessStreamWithContentType; safecall; overload;
    function GetScaledImageAsThumbnailAsync(mode: FileProperties_ThumbnailMode; requestedSize: Cardinal): IAsyncOperation_1__IRandomAccessStreamWithContentType; safecall; overload;
    function GetScaledImageAsThumbnailAsync(mode: FileProperties_ThumbnailMode; requestedSize: Cardinal; options: FileProperties_ThumbnailOptions): IAsyncOperation_1__IRandomAccessStreamWithContentType; safecall; overload;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  String
  }
  // Windows.Storage.IStorageProvider
  IStorageProvider = interface(IInspectable)
  ['{E705EED4-D478-47D6-BA46-1A8EBE114A20}']
    function get_Id: HSTRING; safecall;
    function get_DisplayName: HSTRING; safecall;
    property DisplayName: HSTRING read get_DisplayName;
    property Id: HSTRING read get_Id;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Storage.IStorageProvider
  }
  // Windows.Storage.IStorageItemPropertiesWithProvider
  IStorageItemPropertiesWithProvider = interface(IInspectable)
  ['{861BF39B-6368-4DEE-B40E-74684A5CE714}']
    function get_Provider: IStorageProvider; safecall;
    property Provider: IStorageProvider read get_Provider;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Boolean
  }
  // Windows.Storage.IStorageFilePropertiesWithAvailability
  IStorageFilePropertiesWithAvailability = interface(IInspectable)
  ['{AFCBBE9B-582B-4133-9648-E44CA46EE491}']
    function get_IsAvailable: Boolean; safecall;
    property IsAvailable: Boolean read get_IsAvailable;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVector`1<String>
  }
  // Windows.Storage.Search.IQueryOptionsWithProviderFilter
  Search_IQueryOptionsWithProviderFilter = interface(IInspectable)
  ['{5B9D1026-15C4-44DD-B89A-47A59B7D7C4F}']
    function get_StorageProviderIdFilter: IVector_1__HSTRING; safecall;
    property StorageProviderIdFilter: IVector_1__HSTRING read get_StorageProviderIdFilter;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Storage.Search.IQueryOptions
  // Used Types:  Windows.Storage.Search.CommonFileQuery
  // Used Types:  Windows.Foundation.Collections.IIterable`1<String>
  // Used Types:  Windows.Storage.Search.CommonFolderQuery
  }
  // Windows.Storage.Search.IQueryOptionsFactory
  Search_IQueryOptionsFactory = interface(IInspectable)
  ['{032E1F8C-A9C1-4E71-8011-0DEE9D4811A3}']
    function CreateCommonFileQuery(query: Search_CommonFileQuery; fileTypeFilter: IIterable_1__HSTRING): Search_IQueryOptions; safecall;
    function CreateCommonFolderQuery(query: Search_CommonFolderQuery): Search_IQueryOptions; safecall;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IMap`2<String,Windows.Foundation.Collections.IVectorView`1<Windows.Data.Text.TextSegment>>
  // Used Types:  Windows.Storage.IStorageFile
  }
  // Windows.Storage.Search.IStorageFileQueryResult2
  Search_IStorageFileQueryResult2 = interface(IInspectable)
  ['{4E5DB9DD-7141-46C4-8BE3-E9DC9E27275C}']
    function GetMatchingPropertiesWithRanges(&file: IStorageFile): IInspectable{IMap_2__HSTRING__IVectorView_1__Text_TextSegment}; safecall;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageFolder>>
  // Used Types:  UInt32
  }
  // Windows.Storage.Search.IStorageFolderQueryResult
  Search_IStorageFolderQueryResult = interface(IInspectable)
  ['{6654C911-7D66-46FA-AECF-E4A4BAA93AB8}']
    function GetFoldersAsync(startIndex: Cardinal; maxNumberOfItems: Cardinal): IAsyncOperation_1__IVectorView_1__IStorageFolder; safecall; overload;
    function GetFoldersAsync: IAsyncOperation_1__IVectorView_1__IStorageFolder; safecall; overload;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageItem>>
  // Used Types:  UInt32
  }
  // Windows.Storage.Search.IStorageItemQueryResult
  Search_IStorageItemQueryResult = interface(IInspectable)
  ['{E8948079-9D58-47B8-B2B2-41B07F4795F9}']
    function GetItemsAsync(startIndex: Cardinal; maxNumberOfItems: Cardinal): IAsyncOperation_1__IVectorView_1__IStorageItem; safecall; overload;
    function GetItemsAsync: IAsyncOperation_1__IVectorView_1__IStorageItem; safecall; overload;
  end;

*)

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.Search.IndexedState>
  AsyncOperationCompletedHandler_1__Search_IndexedState_Delegate_Base = interface(IUnknown)
  ['{B67A3CBA-F5F7-5E51-968A-385126D1F918}']
  end;
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.Search.IndexedState>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.Search.IndexedState>
  AsyncOperationCompletedHandler_1__Search_IndexedState = interface(AsyncOperationCompletedHandler_1__Search_IndexedState_Delegate_Base)
  ['{E08EC1E0-E4AE-55A1-9A15-180859E0FA0F}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Search_IndexedState; asyncStatus: AsyncStatus); safecall;
  end;

  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.Search.IndexedState>
  // Used Types:  Windows.Storage.Search.IndexedState
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.Search.IndexedState>
  IAsyncOperation_1__Search_IndexedState = interface(IInspectable)
  ['{CA76FC11-A2C1-513E-B837-B4E39C42DC6B}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Search_IndexedState); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Search_IndexedState; safecall;
    function GetResults: Search_IndexedState; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Search_IndexedState read get_Completed write put_Completed;
  end;

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.Search.IndexedState>
  // Used Types:  Windows.Storage.Search.IStorageFileQueryResult
  // Used Types:  Windows.Storage.Search.CommonFileQuery
  // Used Types:  Windows.Storage.Search.IQueryOptions
  // Used Types:  Windows.Storage.Search.IStorageFolderQueryResult
  // Used Types:  Windows.Storage.Search.CommonFolderQuery
  // Used Types:  Windows.Storage.Search.IStorageItemQueryResult
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageFile>>
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageFolder>>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageItem>>
  // Used Types:  Boolean
  }
  // Windows.Storage.Search.IStorageFolderQueryOperations
  Search_IStorageFolderQueryOperations = interface(IInspectable)
  ['{CB43CCC9-446B-4A4F-BE97-757771BE5203}']
    function GetIndexedStateAsync: IAsyncOperation_1__Search_IndexedState; safecall;
    function CreateFileQuery: Search_IStorageFileQueryResult; safecall; overload;
    function CreateFileQuery(query: Search_CommonFileQuery): Search_IStorageFileQueryResult; safecall; overload;
    function CreateFileQueryWithOptions(queryOptions: Search_IQueryOptions): Search_IStorageFileQueryResult; safecall;
    function CreateFolderQuery: Search_IStorageFolderQueryResult; safecall; overload;
    function CreateFolderQuery(query: Search_CommonFolderQuery): Search_IStorageFolderQueryResult; safecall; overload;
    function CreateFolderQueryWithOptions(queryOptions: Search_IQueryOptions): Search_IStorageFolderQueryResult; safecall;
    function CreateItemQuery: Search_IStorageItemQueryResult; safecall;
    function CreateItemQueryWithOptions(queryOptions: Search_IQueryOptions): Search_IStorageItemQueryResult; safecall;
    function GetFilesAsync(query: Search_CommonFileQuery; startIndex: Cardinal; maxItemsToRetrieve: Cardinal): IAsyncOperation_1__IVectorView_1__IStorageFile; safecall; overload;
    function GetFilesAsync(query: Search_CommonFileQuery): IAsyncOperation_1__IVectorView_1__IStorageFile; safecall; overload;
    function GetFoldersAsync(query: Search_CommonFolderQuery; startIndex: Cardinal; maxItemsToRetrieve: Cardinal): IAsyncOperation_1__IVectorView_1__IStorageFolder; safecall; overload;
    function GetFoldersAsync(query: Search_CommonFolderQuery): IAsyncOperation_1__IVectorView_1__IStorageFolder; safecall; overload;
    function GetItemsAsync(startIndex: Cardinal; maxItemsToRetrieve: Cardinal): IAsyncOperation_1__IVectorView_1__IStorageItem; safecall;
    function AreQueryOptionsSupported(queryOptions: Search_IQueryOptions): Boolean; safecall;
    function IsCommonFolderQuerySupported(query: Search_CommonFolderQuery): Boolean; safecall;
    function IsCommonFileQuerySupported(query: Search_CommonFileQuery): Boolean; safecall;
  end;

*)

  {
  // Used Types:  Void
  // Used Types:  Windows.Storage.IStorageFile
  // Used Types:  String
  // Used Types:  Windows.Storage.Provider.ReadActivationMode
  // Used Types:  Windows.Storage.Provider.WriteActivationMode
  // Used Types:  Windows.Storage.Provider.CachedFileOptions
  }
  // Windows.Storage.Provider.ICachedFileUpdaterStatics
  Provider_ICachedFileUpdaterStatics = interface(IInspectable)
  ['{9FC90920-7BCF-4888-A81E-102D7034D7CE}']
    procedure SetUpdateInformation(&file: IStorageFile; contentId: HSTRING; readMode: Provider_ReadActivationMode; writeMode: Provider_WriteActivationMode; options: Provider_CachedFileOptions); safecall;
  end;

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.IStorageItem>
  // Used Types:  String
  }
  // Windows.Storage.IStorageFolder2
  IStorageFolder2 = interface(IInspectable)
  ['{E827E8B9-08D9-4A8E-A0AC-FE5ED3CBBBD3}']
    function TryGetItemAsync(name: HSTRING): IAsyncOperation_1__IStorageItem; safecall;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.Streams.IRandomAccessStream>
  // Used Types:  Windows.Storage.FileAccessMode
  // Used Types:  Windows.Storage.StorageOpenOptions
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.IStorageStreamTransaction>
  }
  // Windows.Storage.IStorageFile2
  IStorageFile2 = interface(IInspectable)
  ['{954E4BCF-0A77-42FB-B777-C2ED58A52E44}']
    function OpenAsync(accessMode: FileAccessMode; options: StorageOpenOptions): IAsyncOperation_1__IRandomAccessStream; safecall;
    function OpenTransactedWriteAsync(options: StorageOpenOptions): IAsyncOperation_1__IStorageStreamTransaction; safecall;
  end;

*)

  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<String>
  // Used Types:  Windows.Storage.IStorageFile
  // Used Types:  Windows.Storage.Streams.UnicodeEncoding
  // Used Types:  Windows.Foundation.IAsyncAction
  // Used Types:  String
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVector`1<String>>
  // Used Types:  Windows.Foundation.Collections.IIterable`1<String>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.Streams.IBuffer>
  // Used Types:  Windows.Storage.Streams.IBuffer
  // Used Types:  UInt8
  }
  // Windows.Storage.IFileIOStatics
  IFileIOStatics = interface(IInspectable)
  ['{887411EB-7F54-4732-A5F0-5E43E3B8C2F5}']
    function ReadTextAsync(&file: IStorageFile): IAsyncOperation_1__HSTRING; safecall; overload;
    function ReadTextAsync(&file: IStorageFile; encoding: UnicodeEncoding): IAsyncOperation_1__HSTRING; safecall; overload;
    function WriteTextAsync(&file: IStorageFile; contents: HSTRING): IAsyncAction; safecall; overload;
    function WriteTextAsync(&file: IStorageFile; contents: HSTRING; encoding: UnicodeEncoding): IAsyncAction; safecall; overload;
    function AppendTextAsync(&file: IStorageFile; contents: HSTRING): IAsyncAction; safecall; overload;
    function AppendTextAsync(&file: IStorageFile; contents: HSTRING; encoding: UnicodeEncoding): IAsyncAction; safecall; overload;
    function ReadLinesAsync(&file: IStorageFile): IAsyncOperation_1__IVector_1__HSTRING; safecall; overload;
    function ReadLinesAsync(&file: IStorageFile; encoding: UnicodeEncoding): IAsyncOperation_1__IVector_1__HSTRING; safecall; overload;
    function WriteLinesAsync(&file: IStorageFile; lines: IIterable_1__HSTRING): IAsyncAction; safecall; overload;
    function WriteLinesAsync(&file: IStorageFile; lines: IIterable_1__HSTRING; encoding: UnicodeEncoding): IAsyncAction; safecall; overload;
    function AppendLinesAsync(&file: IStorageFile; lines: IIterable_1__HSTRING): IAsyncAction; safecall; overload;
    function AppendLinesAsync(&file: IStorageFile; lines: IIterable_1__HSTRING; encoding: UnicodeEncoding): IAsyncAction; safecall; overload;
    function ReadBufferAsync(&file: IStorageFile): IAsyncOperation_1__IBuffer; safecall;
    function WriteBufferAsync(&file: IStorageFile; buffer: IBuffer): IAsyncAction; safecall;
    function WriteBytesAsync(&file: IStorageFile; {TODO: verify}buffer: PByte): IAsyncAction; safecall;
  end;

  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<String>
  // Used Types:  String
  // Used Types:  Windows.Storage.Streams.UnicodeEncoding
  // Used Types:  Windows.Foundation.IAsyncAction
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVector`1<String>>
  // Used Types:  Windows.Foundation.Collections.IIterable`1<String>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.Streams.IBuffer>
  // Used Types:  Windows.Storage.Streams.IBuffer
  // Used Types:  UInt8
  }
  // Windows.Storage.IPathIOStatics
  IPathIOStatics = interface(IInspectable)
  ['{0F2F3758-8EC7-4381-922B-8F6C07D288F3}']
    function ReadTextAsync(absolutePath: HSTRING): IAsyncOperation_1__HSTRING; safecall; overload;
    function ReadTextAsync(absolutePath: HSTRING; encoding: UnicodeEncoding): IAsyncOperation_1__HSTRING; safecall; overload;
    function WriteTextAsync(absolutePath: HSTRING; contents: HSTRING): IAsyncAction; safecall; overload;
    function WriteTextAsync(absolutePath: HSTRING; contents: HSTRING; encoding: UnicodeEncoding): IAsyncAction; safecall; overload;
    function AppendTextAsync(absolutePath: HSTRING; contents: HSTRING): IAsyncAction; safecall; overload;
    function AppendTextAsync(absolutePath: HSTRING; contents: HSTRING; encoding: UnicodeEncoding): IAsyncAction; safecall; overload;
    function ReadLinesAsync(absolutePath: HSTRING): IAsyncOperation_1__IVector_1__HSTRING; safecall; overload;
    function ReadLinesAsync(absolutePath: HSTRING; encoding: UnicodeEncoding): IAsyncOperation_1__IVector_1__HSTRING; safecall; overload;
    function WriteLinesAsync(absolutePath: HSTRING; lines: IIterable_1__HSTRING): IAsyncAction; safecall; overload;
    function WriteLinesAsync(absolutePath: HSTRING; lines: IIterable_1__HSTRING; encoding: UnicodeEncoding): IAsyncAction; safecall; overload;
    function AppendLinesAsync(absolutePath: HSTRING; lines: IIterable_1__HSTRING): IAsyncAction; safecall; overload;
    function AppendLinesAsync(absolutePath: HSTRING; lines: IIterable_1__HSTRING; encoding: UnicodeEncoding): IAsyncAction; safecall; overload;
    function ReadBufferAsync(absolutePath: HSTRING): IAsyncOperation_1__IBuffer; safecall;
    function WriteBufferAsync(absolutePath: HSTRING; buffer: IBuffer): IAsyncAction; safecall;
    function WriteBytesAsync(absolutePath: HSTRING; {TODO: verify}buffer: PByte): IAsyncAction; safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.Provider.FileUpdateStatus>
  AsyncOperationCompletedHandler_1__Provider_FileUpdateStatus_Delegate_Base = interface(IUnknown)
  ['{BB185A07-0285-5F37-9C7D-2FC6A3E0E6E5}']
  end;
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.Provider.FileUpdateStatus>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.Provider.FileUpdateStatus>
  AsyncOperationCompletedHandler_1__Provider_FileUpdateStatus = interface(AsyncOperationCompletedHandler_1__Provider_FileUpdateStatus_Delegate_Base)
  ['{E08EC1E0-E4AE-55A1-9A15-180859E0FA0F}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Provider_FileUpdateStatus; asyncStatus: AsyncStatus); safecall;
  end;

  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.Provider.FileUpdateStatus>
  // Used Types:  Windows.Storage.Provider.FileUpdateStatus
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.Provider.FileUpdateStatus>
  IAsyncOperation_1__Provider_FileUpdateStatus = interface(IInspectable)
  ['{CA76FC11-A2C1-513E-B837-B4E39C42DC6B}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Provider_FileUpdateStatus); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Provider_FileUpdateStatus; safecall;
    function GetResults: Provider_FileUpdateStatus; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Provider_FileUpdateStatus read get_Completed write put_Completed;
  end;

  {
  // Used Types:  Void
  // Used Types:  Windows.Storage.IStorageFile
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.Provider.FileUpdateStatus>
  }
  // Windows.Storage.ICachedFileManagerStatics
  ICachedFileManagerStatics = interface(IInspectable)
  ['{8FFC224A-E782-495D-B614-654C4F0B2370}']
    procedure DeferUpdates(&file: IStorageFile); safecall;
    function CompleteUpdatesAsync(&file: IStorageFile): IAsyncOperation_1__Provider_FileUpdateStatus; safecall;
  end;

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Storage.IStorageFolder
  // Used Types:  Windows.Storage.Search.IStorageItemQueryResult
  // Used Types:  Windows.Foundation.DateTime
  }
  // Windows.Storage.Search.IStorageLibraryContentChangedTriggerDetails
  Search_IStorageLibraryContentChangedTriggerDetails = interface(IInspectable)
  ['{2A371977-ABBF-4E1D-8AA5-6385D8884799}']
    function get_Folder: IStorageFolder; safecall;
    function CreateModifiedSinceQuery(lastQueryTime: DateTime): Search_IStorageItemQueryResult; safecall;
    property Folder: IStorageFolder read get_Folder;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Storage.AccessCache.AccessListEntry
  }
  // Windows.Storage.AccessCache.IItemRemovedEventArgs
  AccessCache_IItemRemovedEventArgs = interface(IInspectable)
  ['{59677E5C-55BE-4C66-BA66-5EAEA79D2631}']
    function get_RemovedEntry: AccessCache_AccessListEntry; safecall;
    property RemovedEntry: AccessCache_AccessListEntry read get_RemovedEntry;
  end;

*)

  {
  // Used Types:  Windows.Storage.AccessCache.AccessListEntry
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Storage.AccessCache.AccessListEntry>
  IIterator_1__AccessCache_AccessListEntry = interface(IInspectable)
  ['{752850B9-5ED2-5655-8DE2-262EFC26CF39}']
    function get_Current: AccessCache_AccessListEntry; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(out {TODO: verify}items: PAccessCache_AccessListEntry): Cardinal; safecall;
    property Current: AccessCache_AccessListEntry read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

(*
  // Generic Delegate for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Storage.AccessCache.AccessListEntry>
  IIterable_1__AccessCache_AccessListEntry_Delegate_Base = interface(IUnknown)
  ['{4995C2B0-736B-588D-AE42-6F69B025B388}']
  end;
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Storage.AccessCache.AccessListEntry>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Storage.AccessCache.AccessListEntry>
  IIterable_1__AccessCache_AccessListEntry = interface(IIterable_1__AccessCache_AccessListEntry_Delegate_Base)
  ['{1B6614A1-8FC5-567D-9157-410A9E0ECBC5}']
    function First: IIterator_1__AccessCache_AccessListEntry; safecall;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Storage.AccessCache.AccessListEntry
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Storage.AccessCache.AccessListEntry>
  IVectorView_1__AccessCache_AccessListEntry = interface(IInspectable)
  ['{86D0B56E-CB4E-58F0-B9A2-1528619DCD26}']
    function GetAt(index: Cardinal): AccessCache_AccessListEntry; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: AccessCache_AccessListEntry; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; out {TODO: verify}items: PAccessCache_AccessListEntry): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Storage.IStorageItem
  // Used Types:  Void
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.IStorageItem>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.IStorageFile>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.IStorageFolder>
  // Used Types:  Windows.Storage.AccessCache.AccessCacheOptions
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Storage.AccessCache.AccessListEntry>
  // Used Types:  UInt32
  }
  // Windows.Storage.AccessCache.IStorageItemAccessList
  AccessCache_IStorageItemAccessList = interface(IInspectable)
  ['{2CAFF6AD-DE90-47F5-B2C3-DD36C9FDD453}']
    function Add(&file: IStorageItem): HSTRING; safecall; overload;
    function Add(&file: IStorageItem; metadata: HSTRING): HSTRING; safecall; overload;
    procedure AddOrReplace(token: HSTRING; &file: IStorageItem); safecall; overload;
    procedure AddOrReplace(token: HSTRING; &file: IStorageItem; metadata: HSTRING); safecall; overload;
    function GetItemAsync(token: HSTRING): IAsyncOperation_1__IStorageItem; safecall; overload;
    function GetFileAsync(token: HSTRING): IAsyncOperation_1__IStorageFile; safecall; overload;
    function GetFolderAsync(token: HSTRING): IAsyncOperation_1__IStorageFolder; safecall; overload;
    function GetItemAsync(token: HSTRING; options: AccessCache_AccessCacheOptions): IAsyncOperation_1__IStorageItem; safecall; overload;
    function GetFileAsync(token: HSTRING; options: AccessCache_AccessCacheOptions): IAsyncOperation_1__IStorageFile; safecall; overload;
    function GetFolderAsync(token: HSTRING; options: AccessCache_AccessCacheOptions): IAsyncOperation_1__IStorageFolder; safecall; overload;
    procedure Remove(token: HSTRING); safecall;
    function ContainsItem(token: HSTRING): Boolean; safecall;
    procedure Clear; safecall;
    function CheckAccess(&file: IStorageItem): Boolean; safecall;
    function get_Entries: IVectorView_1__AccessCache_AccessListEntry; safecall;
    function get_MaximumItemsAllowed: Cardinal; safecall;
    property Entries: IVectorView_1__AccessCache_AccessListEntry read get_Entries;
    property MaximumItemsAllowed: Cardinal read get_MaximumItemsAllowed;
  end;

*)

(*
  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Storage.AccessCache.IStorageItemMostRecentlyUsedList,Windows.Storage.AccessCache.IItemRemovedEventArgs>
  TypedEventHandler_2__AccessCache_IStorageItemMostRecentlyUsedList__AccessCache_IItemRemovedEventArgs_Delegate_Base = interface(IUnknown)
  ['{029DACE8-98D1-5BF7-B780-9717E95027FF}']
  end;
  // RemoveAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Storage.AccessCache.IStorageItemMostRecentlyUsedList
  // Used Types:  Windows.Storage.AccessCache.IItemRemovedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Storage.AccessCache.IStorageItemMostRecentlyUsedList,Windows.Storage.AccessCache.IItemRemovedEventArgs>
  TypedEventHandler_2__AccessCache_IStorageItemMostRecentlyUsedList__AccessCache_IItemRemovedEventArgs = interface(TypedEventHandler_2__AccessCache_IStorageItemMostRecentlyUsedList__AccessCache_IItemRemovedEventArgs_Delegate_Base)
  ['{F6EF8253-DC64-5847-B825-E65F789A7085}']
    procedure Invoke(sender: AccessCache_IStorageItemMostRecentlyUsedList; args: AccessCache_IItemRemovedEventArgs); safecall;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Storage.AccessCache.IStorageItemMostRecentlyUsedList,Windows.Storage.AccessCache.IItemRemovedEventArgs>
  // Used Types:  Void
  }
  // Windows.Storage.AccessCache.IStorageItemMostRecentlyUsedList
  AccessCache_IStorageItemMostRecentlyUsedList = interface(IInspectable)
  ['{016239D5-510D-411E-8CF1-C3D1EFFA4C33}']
    function add_ItemRemoved(handler: TypedEventHandler_2__AccessCache_IStorageItemMostRecentlyUsedList__AccessCache_IItemRemovedEventArgs): EventRegistrationToken; safecall;
    procedure remove_ItemRemoved(eventCookie: EventRegistrationToken); safecall;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Storage.IStorageItem
  // Used Types:  Windows.Storage.AccessCache.RecentStorageItemVisibility
  // Used Types:  Void
  }
  // Windows.Storage.AccessCache.IStorageItemMostRecentlyUsedList2
  AccessCache_IStorageItemMostRecentlyUsedList2 = interface(IInspectable)
  ['{DA481EA0-ED8D-4731-A1DB-E44EE2204093}']
    function Add(&file: IStorageItem; metadata: HSTRING; visibility: AccessCache_RecentStorageItemVisibility): HSTRING; safecall;
    procedure AddOrReplace(token: HSTRING; &file: IStorageItem; metadata: HSTRING; visibility: AccessCache_RecentStorageItemVisibility); safecall;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Storage.AccessCache.IStorageItemAccessList
  // Used Types:  Windows.Storage.AccessCache.IStorageItemMostRecentlyUsedList
  }
  // Windows.Storage.AccessCache.IStorageApplicationPermissionsStatics
  AccessCache_IStorageApplicationPermissionsStatics = interface(IInspectable)
  ['{4391DFAA-D033-48F9-8060-3EC847D2E3F1}']
    function get_FutureAccessList: AccessCache_IStorageItemAccessList; safecall;
    function get_MostRecentlyUsedList: AccessCache_IStorageItemMostRecentlyUsedList; safecall;
    property FutureAccessList: AccessCache_IStorageItemAccessList read get_FutureAccessList;
    property MostRecentlyUsedList: AccessCache_IStorageItemMostRecentlyUsedList read get_MostRecentlyUsedList;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Storage.BulkAccess.IStorageItemInformation
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Storage.BulkAccess.IStorageItemInformation,Object>
  TypedEventHandler_2__BulkAccess_IStorageItemInformation__IInspectable = interface(IUnknown)
  ['{5B98B352-E0CF-58DE-B2EC-4FD786BBB5A7}']
    procedure Invoke(sender: BulkAccess_IStorageItemInformation; args: IInspectable); safecall;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Storage.FileProperties.IMusicProperties
  // Used Types:  Windows.Storage.FileProperties.IVideoProperties
  // Used Types:  Windows.Storage.FileProperties.IImageProperties
  // Used Types:  Windows.Storage.FileProperties.IDocumentProperties
  // Used Types:  Windows.Storage.FileProperties.IBasicProperties
  // Used Types:  Windows.Storage.Streams.IRandomAccessStreamWithContentType
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Storage.BulkAccess.IStorageItemInformation,Object>
  // Used Types:  Void
  }
  // Windows.Storage.BulkAccess.IStorageItemInformation
  BulkAccess_IStorageItemInformation = interface(IInspectable)
  ['{87A5CB8B-8972-4F40-8DE0-D86FB179D8FA}']
    function get_MusicProperties: FileProperties_IMusicProperties; safecall;
    function get_VideoProperties: FileProperties_IVideoProperties; safecall;
    function get_ImageProperties: FileProperties_IImageProperties; safecall;
    function get_DocumentProperties: FileProperties_IDocumentProperties; safecall;
    function get_BasicProperties: FileProperties_IBasicProperties; safecall;
    function get_Thumbnail: IRandomAccessStreamWithContentType; safecall;
    function add_ThumbnailUpdated(changedHandler: TypedEventHandler_2__BulkAccess_IStorageItemInformation__IInspectable): EventRegistrationToken; safecall;
    procedure remove_ThumbnailUpdated(eventCookie: EventRegistrationToken); safecall;
    function add_PropertiesUpdated(changedHandler: TypedEventHandler_2__BulkAccess_IStorageItemInformation__IInspectable): EventRegistrationToken; safecall;
    procedure remove_PropertiesUpdated(eventCookie: EventRegistrationToken); safecall;
    property BasicProperties: FileProperties_IBasicProperties read get_BasicProperties;
    property DocumentProperties: FileProperties_IDocumentProperties read get_DocumentProperties;
    property ImageProperties: FileProperties_IImageProperties read get_ImageProperties;
    property MusicProperties: FileProperties_IMusicProperties read get_MusicProperties;
    property Thumbnail: IRandomAccessStreamWithContentType read get_Thumbnail;
    property VideoProperties: FileProperties_IVideoProperties read get_VideoProperties;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Storage.BulkAccess.IStorageItemInformation
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Storage.BulkAccess.IStorageItemInformation>
  IIterator_1__BulkAccess_IStorageItemInformation = interface(IInspectable)
  ['{3DA6401D-1279-55A1-962C-25CD23B99B27}']
    function get_Current: BulkAccess_IStorageItemInformation; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(out {TODO: verify}items: PBulkAccess_IStorageItemInformation): Cardinal; safecall;
    property Current: BulkAccess_IStorageItemInformation read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Storage.BulkAccess.IStorageItemInformation>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Storage.BulkAccess.IStorageItemInformation>
  IIterable_1__BulkAccess_IStorageItemInformation = interface(IInspectable)
  ['{43BC252E-A3D6-5F00-A12C-B088D3B912D4}']
    function First: IIterator_1__BulkAccess_IStorageItemInformation; safecall;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Storage.BulkAccess.IStorageItemInformation
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Storage.BulkAccess.IStorageItemInformation>
  IVectorView_1__BulkAccess_IStorageItemInformation = interface(IInspectable)
  ['{DA3A4EF8-D315-529B-A73B-524490573F7E}']
    function GetAt(index: Cardinal): BulkAccess_IStorageItemInformation; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: BulkAccess_IStorageItemInformation; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; out {TODO: verify}items: PBulkAccess_IStorageItemInformation): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.BulkAccess.IStorageItemInformation>>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.BulkAccess.IStorageItemInformation>>
  AsyncOperationCompletedHandler_1__IVectorView_1__BulkAccess_IStorageItemInformation = interface(IUnknown)
  ['{FF163034-ECE9-55BE-A6F8-08C72AAE56B4}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IVectorView_1__BulkAccess_IStorageItemInformation; asyncStatus: AsyncStatus); safecall;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.BulkAccess.IStorageItemInformation>>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Storage.BulkAccess.IStorageItemInformation>
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.BulkAccess.IStorageItemInformation>>
  IAsyncOperation_1__IVectorView_1__BulkAccess_IStorageItemInformation = interface(IInspectable)
  ['{413D160C-3E1A-5603-ACBA-1E176D6A6082}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IVectorView_1__BulkAccess_IStorageItemInformation); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IVectorView_1__BulkAccess_IStorageItemInformation; safecall;
    function GetResults: IVectorView_1__BulkAccess_IStorageItemInformation; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IVectorView_1__BulkAccess_IStorageItemInformation read get_Completed write put_Completed;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.BulkAccess.IStorageItemInformation>>
  // Used Types:  UInt32
  // Used Types:  Object
  }
  // Windows.Storage.BulkAccess.IFileInformationFactory
  BulkAccess_IFileInformationFactory = interface(IInspectable)
  ['{401D88BE-960F-4D6D-A7D0-1A3861E76C83}']
    function GetItemsAsync(startIndex: Cardinal; maxItemsToRetrieve: Cardinal): IAsyncOperation_1__IVectorView_1__BulkAccess_IStorageItemInformation; safecall; overload;
    function GetItemsAsync: IAsyncOperation_1__IVectorView_1__BulkAccess_IStorageItemInformation; safecall; overload;
    function GetFilesAsync(startIndex: Cardinal; maxItemsToRetrieve: Cardinal): IAsyncOperation_1__IVectorView_1__BulkAccess_IStorageItemInformation; safecall; overload;
    function GetFilesAsync: IAsyncOperation_1__IVectorView_1__BulkAccess_IStorageItemInformation; safecall; overload;
    function GetFoldersAsync(startIndex: Cardinal; maxItemsToRetrieve: Cardinal): IAsyncOperation_1__IVectorView_1__BulkAccess_IStorageItemInformation; safecall; overload;
    function GetFoldersAsync: IAsyncOperation_1__IVectorView_1__BulkAccess_IStorageItemInformation; safecall; overload;
    function GetVirtualizedItemsVector: IInspectable; safecall;
    function GetVirtualizedFilesVector: IInspectable; safecall;
    function GetVirtualizedFoldersVector: IInspectable; safecall;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Storage.BulkAccess.IFileInformationFactory
  // Used Types:  Windows.Storage.Search.IStorageQueryResultBase
  // Used Types:  Windows.Storage.FileProperties.ThumbnailMode
  // Used Types:  UInt32
  // Used Types:  Windows.Storage.FileProperties.ThumbnailOptions
  // Used Types:  Boolean
  }
  // Windows.Storage.BulkAccess.IFileInformationFactoryFactory
  BulkAccess_IFileInformationFactoryFactory = interface(IInspectable)
  ['{84EA0E7D-E4A2-4F00-8AFA-AF5E0F826BD5}']
    function CreateWithMode(queryResult: Search_IStorageQueryResultBase; mode: FileProperties_ThumbnailMode): BulkAccess_IFileInformationFactory; safecall;
    function CreateWithModeAndSize(queryResult: Search_IStorageQueryResultBase; mode: FileProperties_ThumbnailMode; requestedThumbnailSize: Cardinal): BulkAccess_IFileInformationFactory; safecall;
    function CreateWithModeAndSizeAndOptions(queryResult: Search_IStorageQueryResultBase; mode: FileProperties_ThumbnailMode; requestedThumbnailSize: Cardinal; thumbnailOptions: FileProperties_ThumbnailOptions): BulkAccess_IFileInformationFactory; safecall;
    function CreateWithModeAndSizeAndOptionsAndFlags(queryResult: Search_IStorageQueryResultBase; mode: FileProperties_ThumbnailMode; requestedThumbnailSize: Cardinal; thumbnailOptions: FileProperties_ThumbnailOptions; delayLoad: Boolean): BulkAccess_IFileInformationFactory; safecall;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Storage.Pickers.PickerViewMode
  // Used Types:  Void
  // Used Types:  String
  // Used Types:  Windows.Storage.Pickers.PickerLocationId
  // Used Types:  Windows.Foundation.Collections.IVector`1<String>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.IStorageFile>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageFile>>
  }
  // Windows.Storage.Pickers.IFileOpenPicker
  Pickers_IFileOpenPicker = interface(IInspectable)
  ['{2CA8278A-12C5-4C5F-8977-94547793C241}']
    function get_ViewMode: Pickers_PickerViewMode; safecall;
    procedure put_ViewMode(value: Pickers_PickerViewMode); safecall;
    function get_SettingsIdentifier: HSTRING; safecall;
    procedure put_SettingsIdentifier(value: HSTRING); safecall;
    function get_SuggestedStartLocation: Pickers_PickerLocationId; safecall;
    procedure put_SuggestedStartLocation(value: Pickers_PickerLocationId); safecall;
    function get_CommitButtonText: HSTRING; safecall;
    procedure put_CommitButtonText(value: HSTRING); safecall;
    function get_FileTypeFilter: IVector_1__HSTRING; safecall;
    function PickSingleFileAsync: IAsyncOperation_1__IStorageFile; safecall;
    function PickMultipleFilesAsync: IAsyncOperation_1__IVectorView_1__IStorageFile; safecall;
    property CommitButtonText: HSTRING read get_CommitButtonText write put_CommitButtonText;
    property FileTypeFilter: IVector_1__HSTRING read get_FileTypeFilter;
    property SettingsIdentifier: HSTRING read get_SettingsIdentifier write put_SettingsIdentifier;
    property SuggestedStartLocation: Pickers_PickerLocationId read get_SuggestedStartLocation write put_SuggestedStartLocation;
    property ViewMode: Pickers_PickerViewMode read get_ViewMode write put_ViewMode;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IPropertySet
  // Used Types:  Void
  }
  // Windows.Storage.Pickers.IFileOpenPicker2
  Pickers_IFileOpenPicker2 = interface(IInspectable)
  ['{8CEB6CD2-B446-46F7-B265-90F8E55AD650}']
    function get_ContinuationData: IPropertySet; safecall;
    procedure PickSingleFileAndContinue; safecall;
    procedure PickMultipleFilesAndContinue; safecall;
    property ContinuationData: IPropertySet read get_ContinuationData;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.IStorageFile>
  // Used Types:  String
  }
  // Windows.Storage.Pickers.IFileOpenPickerWithOperationId
  Pickers_IFileOpenPickerWithOperationId = interface(IInspectable)
  ['{3F57B569-2522-4CA5-AA73-A15509F1FCBF}']
    function PickSingleFileAsync(pickerOperationId: HSTRING): IAsyncOperation_1__IStorageFile; safecall;
  end;

*)

  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.IStorageFile>
  }
  // Windows.Storage.Pickers.IFileOpenPickerStatics
  Pickers_IFileOpenPickerStatics = interface(IInspectable)
  ['{6821573B-2F02-4833-96D4-ABBFAD72B67B}']
    function ResumePickSingleFileAsync: IAsyncOperation_1__IStorageFile; safecall;
  end;

(*
  // RemoveAPI Interface
  {
  // Used Types:  String
  // Used Types:  Void
  // Used Types:  Windows.Storage.Pickers.PickerLocationId
  // Used Types:  Windows.Foundation.Collections.IMap`2<String,Windows.Foundation.Collections.IVector`1<String>>
  // Used Types:  Windows.Storage.IStorageFile
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.IStorageFile>
  }
  // Windows.Storage.Pickers.IFileSavePicker
  Pickers_IFileSavePicker = interface(IInspectable)
  ['{3286FFCB-617F-4CC5-AF6A-B3FDF29AD145}']
    function get_SettingsIdentifier: HSTRING; safecall;
    procedure put_SettingsIdentifier(value: HSTRING); safecall;
    function get_SuggestedStartLocation: Pickers_PickerLocationId; safecall;
    procedure put_SuggestedStartLocation(value: Pickers_PickerLocationId); safecall;
    function get_CommitButtonText: HSTRING; safecall;
    procedure put_CommitButtonText(value: HSTRING); safecall;
    function get_FileTypeChoices: IMap_2__HSTRING__IVector_1__HSTRING; safecall;
    function get_DefaultFileExtension: HSTRING; safecall;
    procedure put_DefaultFileExtension(value: HSTRING); safecall;
    function get_SuggestedSaveFile: IStorageFile; safecall;
    procedure put_SuggestedSaveFile(value: IStorageFile); safecall;
    function get_SuggestedFileName: HSTRING; safecall;
    procedure put_SuggestedFileName(value: HSTRING); safecall;
    function PickSaveFileAsync: IAsyncOperation_1__IStorageFile; safecall;
    property CommitButtonText: HSTRING read get_CommitButtonText write put_CommitButtonText;
    property DefaultFileExtension: HSTRING read get_DefaultFileExtension write put_DefaultFileExtension;
    property FileTypeChoices: IMap_2__HSTRING__IVector_1__HSTRING read get_FileTypeChoices;
    property SettingsIdentifier: HSTRING read get_SettingsIdentifier write put_SettingsIdentifier;
    property SuggestedFileName: HSTRING read get_SuggestedFileName write put_SuggestedFileName;
    property SuggestedSaveFile: IStorageFile read get_SuggestedSaveFile write put_SuggestedSaveFile;
    property SuggestedStartLocation: Pickers_PickerLocationId read get_SuggestedStartLocation write put_SuggestedStartLocation;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IPropertySet
  // Used Types:  Void
  }
  // Windows.Storage.Pickers.IFileSavePicker2
  Pickers_IFileSavePicker2 = interface(IInspectable)
  ['{0EC313A2-D24B-449A-8197-E89104FD42CC}']
    function get_ContinuationData: IPropertySet; safecall;
    procedure PickSaveFileAndContinue; safecall;
    property ContinuationData: IPropertySet read get_ContinuationData;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  String
  // Used Types:  Void
  }
  // Windows.Storage.Pickers.IFileSavePicker3
  Pickers_IFileSavePicker3 = interface(IInspectable)
  ['{698AEC69-BA3C-4E51-BD90-4ABCBBF4CFAF}']
    function get_EnterpriseId: HSTRING; safecall;
    procedure put_EnterpriseId(value: HSTRING); safecall;
    property EnterpriseId: HSTRING read get_EnterpriseId write put_EnterpriseId;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Storage.Pickers.PickerViewMode
  // Used Types:  Void
  // Used Types:  String
  // Used Types:  Windows.Storage.Pickers.PickerLocationId
  // Used Types:  Windows.Foundation.Collections.IVector`1<String>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.IStorageFolder>
  }
  // Windows.Storage.Pickers.IFolderPicker
  Pickers_IFolderPicker = interface(IInspectable)
  ['{084F7799-F3FB-400A-99B1-7B4A772FD60D}']
    function get_ViewMode: Pickers_PickerViewMode; safecall;
    procedure put_ViewMode(value: Pickers_PickerViewMode); safecall;
    function get_SettingsIdentifier: HSTRING; safecall;
    procedure put_SettingsIdentifier(value: HSTRING); safecall;
    function get_SuggestedStartLocation: Pickers_PickerLocationId; safecall;
    procedure put_SuggestedStartLocation(value: Pickers_PickerLocationId); safecall;
    function get_CommitButtonText: HSTRING; safecall;
    procedure put_CommitButtonText(value: HSTRING); safecall;
    function get_FileTypeFilter: IVector_1__HSTRING; safecall;
    function PickSingleFolderAsync: IAsyncOperation_1__IStorageFolder; safecall;
    property CommitButtonText: HSTRING read get_CommitButtonText write put_CommitButtonText;
    property FileTypeFilter: IVector_1__HSTRING read get_FileTypeFilter;
    property SettingsIdentifier: HSTRING read get_SettingsIdentifier write put_SettingsIdentifier;
    property SuggestedStartLocation: Pickers_PickerLocationId read get_SuggestedStartLocation write put_SuggestedStartLocation;
    property ViewMode: Pickers_PickerViewMode read get_ViewMode write put_ViewMode;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IPropertySet
  // Used Types:  Void
  }
  // Windows.Storage.Pickers.IFolderPicker2
  Pickers_IFolderPicker2 = interface(IInspectable)
  ['{8EB3BA97-DC85-4616-BE94-9660881F2F5D}']
    function get_ContinuationData: IPropertySet; safecall;
    procedure PickFolderAndContinue; safecall;
    property ContinuationData: IPropertySet read get_ContinuationData;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  String
  }
  // Windows.Storage.ISystemAudioProperties
  ISystemAudioProperties = interface(IInspectable)
  ['{3F8F38B7-308C-47E1-924D-8645348E5DB7}']
    function get_EncodingBitrate: HSTRING; safecall;
    property EncodingBitrate: HSTRING read get_EncodingBitrate;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  String
  }
  // Windows.Storage.ISystemGPSProperties
  ISystemGPSProperties = interface(IInspectable)
  ['{C0F46EB4-C174-481A-BC25-921986F6A6F3}']
    function get_LatitudeDecimal: HSTRING; safecall;
    function get_LongitudeDecimal: HSTRING; safecall;
    property LatitudeDecimal: HSTRING read get_LatitudeDecimal;
    property LongitudeDecimal: HSTRING read get_LongitudeDecimal;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  String
  }
  // Windows.Storage.ISystemImageProperties
  ISystemImageProperties = interface(IInspectable)
  ['{011B2E30-8B39-4308-BEA1-E8AA61E47826}']
    function get_HorizontalSize: HSTRING; safecall;
    function get_VerticalSize: HSTRING; safecall;
    property HorizontalSize: HSTRING read get_HorizontalSize;
    property VerticalSize: HSTRING read get_VerticalSize;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  String
  }
  // Windows.Storage.ISystemMediaProperties
  ISystemMediaProperties = interface(IInspectable)
  ['{A42B3316-8415-40DC-8C44-98361D235430}']
    function get_Duration: HSTRING; safecall;
    function get_Producer: HSTRING; safecall;
    function get_Publisher: HSTRING; safecall;
    function get_SubTitle: HSTRING; safecall;
    function get_Writer: HSTRING; safecall;
    function get_Year: HSTRING; safecall;
    property Duration: HSTRING read get_Duration;
    property Producer: HSTRING read get_Producer;
    property Publisher: HSTRING read get_Publisher;
    property SubTitle: HSTRING read get_SubTitle;
    property Writer: HSTRING read get_Writer;
    property Year: HSTRING read get_Year;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  String
  }
  // Windows.Storage.ISystemMusicProperties
  ISystemMusicProperties = interface(IInspectable)
  ['{B47988D5-67AF-4BC3-8D39-5B89022026A1}']
    function get_AlbumArtist: HSTRING; safecall;
    function get_AlbumTitle: HSTRING; safecall;
    function get_Artist: HSTRING; safecall;
    function get_Composer: HSTRING; safecall;
    function get_Conductor: HSTRING; safecall;
    function get_DisplayArtist: HSTRING; safecall;
    function get_Genre: HSTRING; safecall;
    function get_TrackNumber: HSTRING; safecall;
    property AlbumArtist: HSTRING read get_AlbumArtist;
    property AlbumTitle: HSTRING read get_AlbumTitle;
    property Artist: HSTRING read get_Artist;
    property Composer: HSTRING read get_Composer;
    property Conductor: HSTRING read get_Conductor;
    property DisplayArtist: HSTRING read get_DisplayArtist;
    property Genre: HSTRING read get_Genre;
    property TrackNumber: HSTRING read get_TrackNumber;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  String
  }
  // Windows.Storage.ISystemPhotoProperties
  ISystemPhotoProperties = interface(IInspectable)
  ['{4734FC3D-AB21-4424-B735-F4353A56C8FC}']
    function get_CameraManufacturer: HSTRING; safecall;
    function get_CameraModel: HSTRING; safecall;
    function get_DateTaken: HSTRING; safecall;
    function get_Orientation: HSTRING; safecall;
    function get_PeopleNames: HSTRING; safecall;
    property CameraManufacturer: HSTRING read get_CameraManufacturer;
    property CameraModel: HSTRING read get_CameraModel;
    property DateTaken: HSTRING read get_DateTaken;
    property Orientation: HSTRING read get_Orientation;
    property PeopleNames: HSTRING read get_PeopleNames;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  String
  }
  // Windows.Storage.ISystemVideoProperties
  ISystemVideoProperties = interface(IInspectable)
  ['{2040F715-67F8-4322-9B80-4FA9FEFB83E8}']
    function get_Director: HSTRING; safecall;
    function get_FrameHeight: HSTRING; safecall;
    function get_FrameWidth: HSTRING; safecall;
    function get_Orientation: HSTRING; safecall;
    function get_TotalBitrate: HSTRING; safecall;
    property Director: HSTRING read get_Director;
    property FrameHeight: HSTRING read get_FrameHeight;
    property FrameWidth: HSTRING read get_FrameWidth;
    property Orientation: HSTRING read get_Orientation;
    property TotalBitrate: HSTRING read get_TotalBitrate;
  end;

*)

(*
  // RemoveAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Storage.ISystemAudioProperties
  // Used Types:  Windows.Storage.ISystemGPSProperties
  // Used Types:  Windows.Storage.ISystemMediaProperties
  // Used Types:  Windows.Storage.ISystemMusicProperties
  // Used Types:  Windows.Storage.ISystemPhotoProperties
  // Used Types:  Windows.Storage.ISystemVideoProperties
  // Used Types:  Windows.Storage.ISystemImageProperties
  }
  // Windows.Storage.ISystemProperties
  ISystemProperties = interface(IInspectable)
  ['{917A71C1-85F3-4DD1-B001-A50BFD21C8D2}']
    function get_Author: HSTRING; safecall;
    function get_Comment: HSTRING; safecall;
    function get_ItemNameDisplay: HSTRING; safecall;
    function get_Keywords: HSTRING; safecall;
    function get_Rating: HSTRING; safecall;
    function get_Title: HSTRING; safecall;
    function get_Audio: ISystemAudioProperties; safecall;
    function get_GPS: ISystemGPSProperties; safecall;
    function get_Media: ISystemMediaProperties; safecall;
    function get_Music: ISystemMusicProperties; safecall;
    function get_Photo: ISystemPhotoProperties; safecall;
    function get_Video: ISystemVideoProperties; safecall;
    function get_Image: ISystemImageProperties; safecall;
    property Audio: ISystemAudioProperties read get_Audio;
    property Author: HSTRING read get_Author;
    property Comment: HSTRING read get_Comment;
    property GPS: ISystemGPSProperties read get_GPS;
    property Image: ISystemImageProperties read get_Image;
    property ItemNameDisplay: HSTRING read get_ItemNameDisplay;
    property Keywords: HSTRING read get_Keywords;
    property Media: ISystemMediaProperties read get_Media;
    property Music: ISystemMusicProperties read get_Music;
    property Photo: ISystemPhotoProperties read get_Photo;
    property Rating: HSTRING read get_Rating;
    property Title: HSTRING read get_Title;
    property Video: ISystemVideoProperties read get_Video;
  end;

*)

  {
  // Used Types:  Windows.Storage.IApplicationData
  }
  // Windows.Storage.IApplicationDataStatics
  IApplicationDataStatics = interface(IInspectable)
  ['{5612147B-E843-45E3-94D8-06169E3C8E17}']
    function get_Current: IApplicationData; safecall;
    property Current: IApplicationData read get_Current;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.IApplicationData>
  AsyncOperationCompletedHandler_1__IApplicationData_Delegate_Base = interface(IUnknown)
  ['{ABAFE590-65FE-520A-9D7C-6AB5F1882237}']
  end;
  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.IApplicationData>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.IApplicationData>
  AsyncOperationCompletedHandler_1__IApplicationData = interface(AsyncOperationCompletedHandler_1__IApplicationData_Delegate_Base)
  ['{C30AEE19-A1A1-5CBD-9B91-DCC5DB72F16B}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IApplicationData; asyncStatus: AsyncStatus); safecall;
  end;

  {
  // Used Types:  Void
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.IApplicationData>
  // Used Types:  Windows.Storage.IApplicationData
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.IApplicationData>
  IAsyncOperation_1__IApplicationData = interface(IInspectable)
  ['{141FA633-8D79-53C8-991A-60A5DA990CAE}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IApplicationData); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IApplicationData; safecall;
    function GetResults: IApplicationData; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IApplicationData read get_Completed write put_Completed;
  end;

  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.IApplicationData>
  // Used Types:  Windows.System.IUser
  }
  // Windows.Storage.IApplicationDataStatics2
  IApplicationDataStatics2 = interface(IInspectable)
  ['{CD606211-CF49-40A4-A47C-C7F0DBBA8107}']
    function GetForUserAsync(user: IInspectable{IUser}): IAsyncOperation_1__IApplicationData; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Storage.IStorageFolder
  }
  // Windows.Storage.IApplicationData2
  IApplicationData2 = interface(IInspectable)
  ['{9E65CD69-0BA3-4E32-BE29-B02DE6607638}']
    function get_LocalCacheFolder: IStorageFolder; safecall;
    property LocalCacheFolder: IStorageFolder read get_LocalCacheFolder;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Storage.IStorageFolder
  // Used Types:  String
  // Used Types:  Windows.Foundation.IAsyncAction
  }
  // Windows.Storage.IApplicationData3
  IApplicationData3 = interface(IInspectable)
  ['{DC222CF4-2772-4C1D-AA2C-C9F743ADE8D1}']
    function GetPublisherCacheFolder(folderName: HSTRING): IStorageFolder; safecall;
    function ClearPublisherCacheFolderAsync(folderName: HSTRING): IAsyncAction; safecall;
    function get_SharedLocalFolder: IStorageFolder; safecall;
    property SharedLocalFolder: IStorageFolder read get_SharedLocalFolder;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Boolean>
  // Used Types:  Windows.Storage.Streams.IOutputStream
  }
  // Windows.Storage.Compression.ICompressor
  Compression_ICompressor = interface(IInspectable)
  ['{0AC3645A-57AC-4EE1-B702-84D39D5424E0}']
    function FinishAsync: IAsyncOperation_1__Boolean; safecall;
    function DetachStream: IOutputStream; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Storage.Streams.IInputStream
  }
  // Windows.Storage.Compression.IDecompressor
  Compression_IDecompressor = interface(IInspectable)
  ['{B883FE46-D68A-4C8B-ADA0-4EE813FC5283}']
    function DetachStream: IInputStream; safecall;
  end;

  {
  // Used Types:  Windows.Storage.Compression.ICompressor
  // Used Types:  Windows.Storage.Streams.IOutputStream
  // Used Types:  Windows.Storage.Compression.CompressAlgorithm
  // Used Types:  UInt32
  }
  // Windows.Storage.Compression.ICompressorFactory
  Compression_ICompressorFactory = interface(IInspectable)
  ['{5F3D96A4-2CFB-442C-A8BA-D7D11B039DA0}']
    function CreateCompressor(underlyingStream: IOutputStream): Compression_ICompressor; safecall;
    function CreateCompressorEx(underlyingStream: IOutputStream; algorithm: Compression_CompressAlgorithm; blockSize: Cardinal): Compression_ICompressor; safecall;
  end;

  {
  // Used Types:  Windows.Storage.Compression.IDecompressor
  // Used Types:  Windows.Storage.Streams.IInputStream
  }
  // Windows.Storage.Compression.IDecompressorFactory
  Compression_IDecompressorFactory = interface(IInspectable)
  ['{5337E252-1DA2-42E1-8834-0379D28D742F}']
    function CreateDecompressor(underlyingStream: IInputStream): Compression_IDecompressor; safecall;
  end;

  {
  // Used Types:  Windows.Storage.IStorageItem
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageItem>
  // Used Types:  Boolean
  // Used Types:  Void
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Storage.IStorageItem>
  IVector_1__IStorageItem = interface(IInspectable)
  ['{802508E2-9C2C-5B91-89A8-39BCF7223344}']
    function GetAt(index: Cardinal): IStorageItem; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__IStorageItem; safecall;
    function IndexOf(value: IStorageItem; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: IStorageItem); safecall;
    procedure InsertAt(index: Cardinal; value: IStorageItem); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: IStorageItem); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; out {TODO: verify}items: PIStorageItem): Cardinal; safecall;
    procedure ReplaceAll({TODO: verify}items: PIStorageItem); safecall;
    property Size: Cardinal read get_Size;
  end;


implementation

end.
