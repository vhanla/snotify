{******************************************************************************}
{                                                                              }
{ Interface Unit for Delphi                                                    }
{                                                                              }
{ Portions created by Microsoft are Copyright (C) Microsoft                    }
{ Corporation. All Rights Reserved.                                            }
{                                                                              }
{ The contents of this file are used with permission, subject to the Mozilla   }
{ Public License Version 1.1 (the "License"); you may not use this file except }
{ in compliance with the License. You may obtain a copy of the License at      }
{ http://www.mozilla.org/MPL/MPL-1.1.html                                      }
{                                                                              }
{ Software distributed under the License is distributed on an "AS IS" basis,   }
{ WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for }
{ the specific language governing rights and limitations under the License.    }
{                                                                              }
{ The Initial Developer of the Original Code is Arno Garrels. Portions created }
{ by Arno Garrels are Copyright (C) Arno Garrels. All Rights Reserved.         }
{                                                                              }
{ Changelog:                                                                   }
{                                                                              }
{ Contributors:                                                                }
{                                                                              }
{                                                                              }
{******************************************************************************}
unit PropSysHlp;

{$ALIGN ON}

{$IFNDEF ConditionalExpressions}
  'Untested Delphi version';
{$ENDIF}
{$IF CompilerVersion < 15.00}
  'Untested Delphi version';
{$IFEND}

interface

uses Windows,
{$IF CompilerVersion >= 21.0}
  PropSys,
{$ELSE}
{$IF CompilerVersion >= 18.5}
  ShlObj,
{$IFEND}
{$IFEND}
  ActiveX;

const
{$IF CompilerVersion < 18.5}
  SID_IPropertyStore              = '{886d8eeb-8cf2-4446-8d02-cdba1dbdcf99}';
{$ELSE}
  {$IF CompilerVersion >= 21.0}
  SID_IPropertyStore              = PropSys.SID_IPropertyStore;
{$ELSE}
  SID_IPropertyStore              = ShlObj.SID_IPropertyStore;
{$IFEND}
{$IFEND}
{$IF CompilerVersion < 21.0}
  SID_IPropertyStoreCapabilities  = '{c8e2d566-186e-4d49-bf41-6909ead56acc}';
  SID_IInitializeWithFile         = '{b7d14566-0509-4cce-a71f-0a554233bd9b}';
  SID_IInitializeWithStream       = '{b824b49d-22ac-4161-ac8a-9916e8fa3f7f}';
{$ELSE}
  SID_IPropertyStoreCapabilities  = PropSys.SID_IPropertyStoreCapabilities;
  SID_IInitializeWithFile         = PropSys.SID_IInitializeWithFile;
  SID_IInitializeWithStream       = PropSys.SID_IInitializeWithStream;
{$IFEND}
  
type
{$IF CompilerVersion < 18.5}
  {$EXTERNALSYM _tagpropertykey}
  _tagpropertykey = packed record
    fmtid : TGUID;
    pid   : DWORD;
  end;
  {$EXTERNALSYM PROPERTYKEY}
  PROPERTYKEY = _tagpropertykey;
  PPropertyKey = ^TPropertyKey;
  TPropertyKey = _tagpropertykey;

  {$EXTERNALSYM IPropertyStore}
  IPropertyStore = interface(IUnknown)
    [SID_IPropertyStore]
    function GetCount(out cProps: DWORD): HResult; stdcall;
    function GetAt(iProp: DWORD; out pkey: TPropertyKey): HRESULT; stdcall;
    function GetValue(const key: TPropertyKey; out pv: TPropVariant): HResult; stdcall;
    function SetValue(const key: TPropertyKey; const propvar: TPropVariant): HResult; stdcall;
    function Commit: HResult; stdcall;
  end;
{$ELSE}
  _tagpropertykey = ActiveX._tagpropertykey;
  {$EXTERNALSYM _tagpropertykey}
  PROPERTYKEY     = ActiveX.PROPERTYKEY;
  {$EXTERNALSYM PROPERTYKEY}
  PPropertyKey    = ActiveX.PPropertyKey;
  {$EXTERNALSYM PPropertyKey}
  TPropertyKey    = ActiveX.TPropertyKey;
  {$EXTERNALSYM TPropertyKey}
{$IF CompilerVersion >= 21.0}
  IPropertyStore  = PropSys.IPropertyStore;
  {$EXTERNALSYM IPropertyStore}
{$ELSE}
  IPropertyStore  = ShlObj.IPropertyStore;
  {$EXTERNALSYM IPropertyStore}
{$IFEND}
{$IFEND}

{$IF CompilerVersion < 21.0}
  {$EXTERNALSYM IPropertyStoreCapabilities}
  IPropertyStoreCapabilities = interface(IUnknown)
    [SID_IPropertyStoreCapabilities]
    function IsPropertyWritable(pPropKey: PPropertyKey): HRESULT; stdcall;
  end;

  {$EXTERNALSYM IInitializeWithFile}
  IInitializeWithFile = interface(IUnknown)
    [SID_IInitializeWithFile]
    function Initialize(pszFilePath: PAnsiChar; grfMode: DWORD): HRESULT; stdcall;
  end;

  {$EXTERNALSYM IInitializeWithStream}
  IInitializeWithStream = interface(IUnknown)
    [SID_IInitializeWithStream]
    function Initialize(var pIStream: IStream; grfMode: DWORD): HRESULT; stdcall;
  end;
{$ELSE}
  IPropertyStoreCapabilities = PropSys.IPropertyStoreCapabilities;
  IInitializeWithFile        = PropSys.IInitializeWithFile;
  IInitializeWithStream      = PropSys.IInitializeWithStream;
{$IFEND}

procedure PropVariantInit(var pv : TPropVariant);
function  PropVariantClear(pvar: PPropVariant): HRESULT; stdcall;

implementation

function PropVariantClear;  external 'ole32.dll' name 'PropVariantClear';

procedure PropVariantInit(var pv : TPropVariant);
begin
    FillChar(pv, SizeOf(TPropVariant), 0);
end;

end.
