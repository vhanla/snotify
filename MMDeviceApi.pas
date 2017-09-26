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
{ Removed keyword "const" from IMMNotificationClient.OnPropertyValueChanged.   }
{ Param "key" has to be passed by value.                                       }
{ Added safecall declarations.                                                 }
{ BOOL as input parameter changed to Longint.                                  }
{                                                                              }
{ Contributors:                                                                }
{                                                                              }
{                                                                              }
{******************************************************************************}
unit MMDeviceApi;

// {$DEFINE USE_SAFECALL}

{$HPPEMIT ''}
{$HPPEMIT '#include "mmdeviceapi.h"'}
{$HPPEMIT '#include "audioclient.h"'}
{$HPPEMIT '#include "audiosessiontypes.h"'}
{$HPPEMIT '#include "audiopolicy.h"'}
{$HPPEMIT '#include "endpointvolume.h"'}
{$HPPEMIT '#include "dsound.h"'}

{$ALIGN ON}
{$MINENUMSIZE 4}

{$IFNDEF ConditionalExpressions}
  'Untested Delphi version';
{$ENDIF}
{$IF CompilerVersion < 15.00}
  'Untested Delphi version';
{$IFEND}

interface

uses
   Windows,
   PropSysHlp,
   MMSystem, // For WaveFormatEx
   ActiveX;

{$IF CompilerVersion < 20.00}
type
  UINT32      = LongWord;
  {$EXTERNALSYM UINT32}
{$IFEND}

const
  CLASS_IMMDeviceEnumerator             : TGUID = '{BCDE0395-E52F-467C-8E3D-C4579291692E}';
  IID_IMMDeviceEnumerator               : TGUID = '{A95664D2-9614-4F35-A746-DE8DB63617E6}';
  {$EXTERNALSYM IID_IMMDeviceEnumerator}
  IID_IMMDevice                         : TGUID = '{D666063F-1587-4E43-81F1-B948E807363F}';
  {$EXTERNALSYM IID_IMMDevice}
  IID_IMMEndpoint                       : TGUID = '{1BE09788-6894-4089-8586-9A2A6C265AC5}';
  {$EXTERNALSYM IID_IMMEndpoint}
  IID_IMMDeviceCollection               : TGUID = '{0BD7A1BE-7A1A-44DB-8397-CC5392387B5E}';
  {$EXTERNALSYM IID_IMMDeviceCollection}
  IID_IAudioEndpointVolume              : TGUID = '{5CDF2C82-841E-4546-9722-0CF74078229A}';
  {$EXTERNALSYM IID_IAudioEndpointVolume}
  IID_IAudioMeterInformation            : TGUID = '{C02216F6-8C67-4B5B-9D00-D008E73E0064}';
  {$EXTERNALSYM IID_IAudioMeterInformation}
  IID_IAudioEndpointVolumeCallback      : TGUID = '{657804FA-D6AD-4496-8A60-352752AF4F89}';
  {$EXTERNALSYM IID_IAudioEndpointVolumeCallback}  
  IID_IAudioSessionEvents               : TGUID = '{24918ACC-64B3-37C1-8CA9-74A66E9957A8}';
  {$EXTERNALSYM IID_IAudioSessionEvents}
  IID_IAudioSessionControl              : TGUID = '{F4B1A599-7266-4319-A8CA-E70ACB11E8CD}';
  {$EXTERNALSYM IID_IAudioSessionControl}
  IID_IAudioSessionControl2             : TGUID = '{bfb7ff88-7239-4fc9-8fa2-07c950be9c6d}'; // Windows 7
  {$EXTERNALSYM IID_IAudioSessionControl2}
  IID_ISimpleAudioVolume                : TGUID = '{87CE5498-68D6-44E5-9215-6DA47EF883D8}';
  {$EXTERNALSYM IID_ISimpleAudioVolume}
  IID_IAudioSessionManager              : TGUID = '{BFA971F1-4D5E-40BB-935E-967039BFBEE4}';
  {$EXTERNALSYM IID_IAudioSessionManager}
  IID_IAudioClient                      : TGUID = '{1CB9AD4C-DBFA-4c32-B178-C2F568A703B2}';
  {$EXTERNALSYM IID_IAudioClient}

  DEVICE_STATE_ACTIVE                   = $00000001;
  {$EXTERNALSYM DEVICE_STATE_ACTIVE}
  DEVICE_STATE_DISABLED                 = $00000002;
  {$EXTERNALSYM DEVICE_STATE_DISABLED}
  DEVICE_STATE_NOTPRESENT               = $00000004;
  {$EXTERNALSYM DEVICE_STATE_NOTPRESENT}
  DEVICE_STATE_UNPLUGGED                = $00000008;
  {$EXTERNALSYM DEVICE_STATE_UNPLUGGED}
  DEVICE_STATEMASK_ALL                  = $0000000F;
  {$EXTERNALSYM DEVICE_STATEMASK_ALL}

  PKEY_Device_FriendlyName: TPropertyKey =(
        fmtid: (D1:$a45c254e; D2:$df1c ; D3:$4efd;
                D4: ($80, $20, $67, $d1, $46, $a8, $50, $e0));
                pid:14);

  PKEY_AudioEndpoint_FormFactor : TPropertyKey = (
        fmtid: (D1: $1da5d803; D2: $d492; D3: $4edd;
                D4: ($8c, $23, $e0, $c0, $ff, $ee, $7f, $0e));
                pid: 0);
  {$EXTERNALSYM PKEY_AudioEndpoint_FormFactor}
  PKEY_AudioEndpoint_ControlPanelPageProvider : TPropertyKey = (
        fmtid: (D1: $1da5d803; D2: $d492; D3: $4edd;
                D4: ($8c, $23, $e0, $c0, $ff, $ee, $7f, $0e));
                pid: 1);
  {$EXTERNALSYM PKEY_AudioEndpoint_ControlPanelPageProvider}
  PKEY_AudioEndpoint_Association : TPropertyKey = (
        fmtid: (D1: $1da5d803; D2: $d492; D3: $4edd;
                D4: ($8c, $23, $e0, $c0, $ff, $ee, $7f, $0e));
                pid: 2);
  {$EXTERNALSYM PKEY_AudioEndpoint_Association}
  PKEY_AudioEndpoint_PhysicalSpeakers : TPropertyKey = (
        fmtid: (D1: $1da5d803; D2: $d492; D3: $4edd;
                D4: ($8c, $23, $e0, $c0, $ff, $ee, $7f, $0e));
                pid: 3);
  {$EXTERNALSYM PKEY_AudioEndpoint_PhysicalSpeakers}
  PKEY_AudioEndpoint_GUID : TPropertyKey = (
        fmtid: (D1: $1da5d803; D2: $d492; D3: $4edd;
                D4: ($8c, $23, $e0, $c0, $ff, $ee, $7f, $0e));
                pid: 4);
  {$EXTERNALSYM PKEY_AudioEndpoint_GUID}
  PKEY_AudioEndpoint_Disable_SysFx : TPropertyKey = (
        fmtid: (D1: $1da5d803; D2: $d492; D3: $4edd;
                D4: ($8c, $23, $e0, $c0, $ff, $ee, $7f, $0e));
                pid: 5);
  {$EXTERNALSYM PKEY_AudioEndpoint_Disable_SysFx}
  ENDPOINT_SYSFX_ENABLED         = $00000000;  // System Effects are enabled.
  {$EXTERNALSYM ENDPOINT_SYSFX_ENABLED}
  ENDPOINT_SYSFX_DISABLED        = $00000001;  // System Effects are disabled.
  {$EXTERNALSYM ENDPOINT_SYSFX_DISABLED}
  PKEY_AudioEndpoint_FullRangeSpeakers : TPropertyKey = (
        fmtid: (D1: $1da5d803; D2: $d492; D3: $4edd;
                D4: ($8c, $23, $e0, $c0, $ff, $ee, $7f, $0e));
                pid: 6);
  {$EXTERNALSYM PKEY_AudioEndpoint_FullRangeSpeakers}
  PKEY_AudioEndpoint_Supports_EventDriven_Mode : TPropertyKey = (
        fmtid: (D1: $1da5d803; D2: $d492; D3: $4edd;
                D4: ($8c, $23, $e0, $c0, $ff, $ee, $7f, $0e));
                pid: 7);
  {$EXTERNALSYM PKEY_AudioEndpoint_Supports_EventDriven_Mode}
  PKEY_AudioEndpoint_JackSubType : TPropertyKey = (
        fmtid: (D1: $1da5d803; D2: $d492; D3: $4edd;
                D4: ($8c, $23, $e0, $c0, $ff, $ee, $7f, $0e));
                pid: 8);
  {$EXTERNALSYM PKEY_AudioEndpoint_JackSubType}
  PKEY_AudioEngine_DeviceFormat : TPropertyKey = (
        fmtid: (D1: $f19f064d; D2: $82c; D3: $4e27;
                D4: ($bc, $73, $68, $82, $a1, $bb, $8e, $4c));
                pid: 0);
  {$EXTERNALSYM PKEY_AudioEngine_DeviceFormat}
  PKEY_AudioEngine_OEMFormat : TPropertyKey = (
        fmtid: (D1: $e4870e26; D2: $3cc5; D3: $4cd2;
                D4: ($ba, $46, $ca, $a, $9a, $70, $ed, $4));
                pid: 3);
  {$EXTERNALSYM PKEY_AudioEngine_OEMFormat}

type
  tagDIRECTX_AUDIO_ACTIVATION_PARAMS = packed record
    cbDirectXAudioActivationParams : DWORD;
    guidAudioSession               : TGUID;
    dwAudioStreamFlags             : DWORD;
  end;
  {$EXTERNALSYM tagDIRECTX_AUDIO_ACTIVATION_PARAMS}
  DIRECTX_AUDIO_ACTIVATION_PARAMS = tagDIRECTX_AUDIO_ACTIVATION_PARAMS;
  {$EXTERNALSYM DIRECTX_AUDIO_ACTIVATION_PARAMS}
  PDIRECTX_AUDIO_ACTIVATION_PARAMS = ^tagDIRECTX_AUDIO_ACTIVATION_PARAMS;
  {$EXTERNALSYM PDIRECTX_AUDIO_ACTIVATION_PARAMS}
  TDirectXAudioActivationParams = tagDIRECTX_AUDIO_ACTIVATION_PARAMS;
  PDirectXAudioActivationParams = PDIRECTX_AUDIO_ACTIVATION_PARAMS;

type
  __MIDL___MIDL_itf_mmdeviceapi_0000_0000_0001 = TOleEnum;
  {$EXTERNALSYM __MIDL___MIDL_itf_mmdeviceapi_0000_0000_0001}
  EDataFlow = __MIDL___MIDL_itf_mmdeviceapi_0000_0000_0001;
  {$EXTERNALSYM EDataFlow}
const
  eRender                               = 0;
  {$EXTERNALSYM eRender}
  eCapture                              = eRender + 1;
  {$EXTERNALSYM eCapture}
  eAll                                  = eCapture + 1;
  {$EXTERNALSYM eAll}
  EDataFlow_enum_count                  = eAll + 1;
  {$EXTERNALSYM EDataFlow_enum_count}

type
  __MIDL___MIDL_itf_mmdeviceapi_0000_0000_0002 = TOleEnum;
  {$EXTERNALSYM __MIDL___MIDL_itf_mmdeviceapi_0000_0000_0002}
  ERole = __MIDL___MIDL_itf_mmdeviceapi_0000_0000_0002;
  {$EXTERNALSYM ERole}
const
  eConsole                              = 0;
  {$EXTERNALSYM eConsole}
  eMultimedia                           = eConsole + 1;
  {$EXTERNALSYM eMultimedia}
  eCommunications                       = eMultimedia + 1;
  {$EXTERNALSYM eCommunications}
  ERole_enum_count                      = eCommunications + 1;
  {$EXTERNALSYM ERole_enum_count}

type
  __MIDL___MIDL_itf_mmdeviceapi_0000_0000_0003 = TOleEnum;
  {$EXTERNALSYM __MIDL___MIDL_itf_mmdeviceapi_0000_0000_0003}
  EndpointFormFactor = __MIDL___MIDL_itf_mmdeviceapi_0000_0000_0003;
  {$EXTERNALSYM EndpointFormFactor}
const
  RemoteNetworkDevice                   = 0;
  {$EXTERNALSYM RemoteNetworkDevice}
  Speakers                              = RemoteNetworkDevice + 1;
  {$EXTERNALSYM Speakers}
  LineLevel                             = Speakers + 1;
  {$EXTERNALSYM LineLevel}
  Headphones                            = LineLevel + 1;
  {$EXTERNALSYM Headphones}
  Microphone                            = Headphones + 1;
  {$EXTERNALSYM Microphone}
  Headset                               = Microphone + 1;
  {$EXTERNALSYM Headset}
  Handset                               = Headset + 1;
  {$EXTERNALSYM Handset}
  UnknownDigitalPassthrough             = Handset + 1;
  {$EXTERNALSYM UnknownDigitalPassthrough}
  SPDIF                                 = UnknownDigitalPassthrough + 1;
  {$EXTERNALSYM SPDIF}
  DigitalAudioDisplayDevice             = SPDIF + 1;
  {$EXTERNALSYM DigitalAudioDisplayDevice}
  UnknownFormFactor                     = DigitalAudioDisplayDevice + 1;
  {$EXTERNALSYM UnknownFormFactor}
  EndpointFormFactor_enum_count         = UnknownFormFactor + 1;
  {$EXTERNALSYM EndpointFormFactor_enum_count}

type
  REFERENCE_TIME                        = LONGLONG;
  {$EXTERNALSYM REFERENCE_TIME}
  TReferenceTime                        = REFERENCE_TIME;
  LPREFERENCE_TIME                      = ^REFERENCE_TIME;
  {$EXTERNALSYM LPREFERENCE_TIME}
  PReferenceTime                        = LPREFERENCE_TIME;
  MUSIC_TIME                            = Longint;
  {$EXTERNALSYM MUSIC_TIME}

const
  // QueryHardwareSupport from endpointvolume.h
  ENDPOINT_HARDWARE_SUPPORT_VOLUME      = $00000001;
  {$EXTERNALSYM ENDPOINT_HARDWARE_SUPPORT_VOLUME}
  ENDPOINT_HARDWARE_SUPPORT_MUTE        = $00000002;
  {$EXTERNALSYM ENDPOINT_HARDWARE_SUPPORT_MUTE}
  ENDPOINT_HARDWARE_SUPPORT_METER       = $00000004;
  {$EXTERNALSYM ENDPOINT_HARDWARE_SUPPORT_METER}

type
  // AudioSessionState
  {
  AudioSessionStateInactive             = 0;
  AudioSessionStateActive               = 1;
  AudioSessionStateExpired              = 2;
  }
  AudioSessionState = (AudioSessionStateInactive, AudioSessionStateActive,
                       AudioSessionStateExpired);
  {$EXTERNALSYM AudioSessionState}
  TAudioSessionState = AudioSessionState;

  //AUDCLNT_SHAREMODE
  {
  AUDCLNT_SHAREMODE_SHARED              = 0;
  AUDCLNT_SHAREMODE_EXCLUSIVE           = 1;
  }
  AUDCLNT_SHAREMODE  = (AUDCLNT_SHAREMODE_SHARED, AUDCLNT_SHAREMODE_EXCLUSIVE);
  {$EXTERNALSYM AUDCLNT_SHAREMODE}
  TAudClntShareMode  = AUDCLNT_SHAREMODE;

  // AudioSessionDisconnectReason
  {
  DisconnectReasonDeviceRemoval         = 0;
  DisconnectReasonServerShutdown        = DisconnectReasonDeviceRemoval + 1;
  DisconnectReasonFormatChanged         = DisconnectReasonServerShutdown + 1;
  DisconnectReasonSessionLogoff         = DisconnectReasonFormatChanged + 1;
  DisconnectReasonSessionDisconnected   = DisconnectReasonSessionLogoff + 1;
  DisconnectReasonExclusiveModeOverride = DisconnectReasonSessionDisconnected + 1;
  }
  AudioSessionDisconnectReason = (DisconnectReasonDeviceRemoval,
    DisconnectReasonServerShutdown, DisconnectReasonFormatChanged,
    DisconnectReasonSessionLogoff, DisconnectReasonSessionDisconnected,
    DisconnectReasonExclusiveModeOverride);
  {$EXTERNALSYM AudioSessionDisconnectReason}
  TAudioSessionDisconnectReason = AudioSessionDisconnectReason;

  PAUDIO_VOLUME_NOTIFICATION_DATA = ^AUDIO_VOLUME_NOTIFICATION_DATA;
  {$EXTERNALSYM PAUDIO_VOLUME_NOTIFICATION_DATA}
  AUDIO_VOLUME_NOTIFICATION_DATA = packed record
    guidEventContext  : TGUID;
    bMuted            : BOOL;
    fMasterVolume     : Single;
    nChannels         : UINT;
    afChannelVolumes  : array [0..0] of Single;
  end;
  {$EXTERNALSYM AUDIO_VOLUME_NOTIFICATION_DATA}
  TAudioVolumeNotificationData = AUDIO_VOLUME_NOTIFICATION_DATA;
  PAudioVolumeNotificationData = PAUDIO_VOLUME_NOTIFICATION_DATA;

  {$EXTERNALSYM IAudioClient}
  IAudioClient = interface(IUnknown)
  ['{1CB9AD4C-DBFA-4c32-B178-C2F568A703B2}']
{$IFNDEF USE_SAFECALL}
    function Initialize(ShareMode         : TAudClntShareMode; // AUDCLNT_SHAREMODE;
                        StreamFlags       : DWORD;
                        hnsBufferDuration : TReferenceTime;
                        hnsPeriodicity    : TReferenceTime;
                        const pFormat     : PWaveFormatEx;
                        AudioSessionGuid  : PGUID): HRESULT; stdcall;
    function GetBufferSize(out pNumBufferFrames: UINT32): HRESULT; stdcall;
    function GetStreamLatency(out phnsLatency: TReferenceTime): HRESULT; stdcall;
    function GetCurrentPadding(out pNumPaddingFrames: UINT): HRESULT; stdcall;
    function IsFormatSupported(ShareMode          : TAudClntShareMode; // AUDCLNT_SHAREMODE;
                               const pFormat      : PWaveFormatEx;
                               out ppClosestMatch : PWaveFormatEx): HRESULT; stdcall;
    function GetMixFormat(out ppDeviceFormat: PWaveFormatEx): HRESULT; stdcall;
    function GetDevicePeriod(out phnsDefaultDevicePeriod: TReferenceTime;
                             out phnsMinimumDevicePeriod: TReferenceTime): HRESULT; stdcall;
    function Start: HRESULT; stdcall;
    function Stop: HRESULT; stdcall;
    function Reset: HRESULT; stdcall;
    function SetEventHandle(eventHandle: THandle): HRESULT; stdcall;
    function GetService(const riid: TGUID; out ppv): HRESULT; stdcall;
{$ELSE}
    procedure Initialize(ShareMode         : TAudClntShareMode; // AUDCLNT_SHAREMODE;
                         StreamFlags       : DWORD;
                         hnsBufferDuration : TReferenceTime;
                         hnsPeriodicity    : TReferenceTime;
                         const pFormat     : PWaveFormatEx;
                         AudioSessionGuid  : PGUID); safecall;
    function GetBufferSize: UINT32; safecall;
    function GetStreamLatency: TReferenceTime; safecall;
    function GetCurrentPadding: UINT; safecall;
    procedure IsFormatSupported(ShareMode          : TAudClntShareMode; // AUDCLNT_SHAREMODE;
                                const pFormat      : PWaveFormatEx;
                                out ppClosestMatch : PWaveFormatEx); safecall;
    procedure GetMixFormat(out ppDeviceFormat: PWaveFormatEx); safecall;
    procedure GetDevicePeriod(out phnsDefaultDevicePeriod: TReferenceTime;
                              out phnsMinimumDevicePeriod: TReferenceTime); safecall;
    procedure Start; safecall;
    procedure Stop; safecall;
    procedure Reset; safecall;
    procedure SetEventHandle(eventHandle: THandle); safecall;
    procedure GetService(const riid: TGUID; out ppv); safecall;
{$ENDIF}
  end;

  {$EXTERNALSYM IAudioEndpointVolumeCallback}
  IAudioEndpointVolumeCallback = interface(IUnknown)
  ['{657804FA-D6AD-4496-8A60-352752AF4F89}']
{$IFNDEF USE_SAFECALL}
    function OnNotify(pNotify: PAudioVolumeNotificationData): HRESULT; stdcall;
{$ELSE}
    procedure OnNotify(pNotify: PAudioVolumeNotificationData); safecall;
{$ENDIF}
  end;

  {$EXTERNALSYM IAudioEndpointVolume}
  IAudioEndpointVolume = interface(IUnknown)
  ['{5CDF2C82-841E-4546-9722-0CF74078229A}']
{$IFNDEF USE_SAFECALL}
    function RegisterControlChangeNotify(pNotify: IAudioEndpointVolumeCallback): HRESULT; stdcall;
    function UnregisterControlChangeNotify(pNotify: IAudioEndpointVolumeCallback): HRESULT; stdcall;
    function GetChannelCount(out pnChannelCount: UINT): HRESULT; stdcall;
    function SetMasterVolumeLevel(fLevelDB: Single; pguidEventContext: PGUID): HRESULT; stdcall;
    function SetMasterVolumeLevelScalar(fLevel: Single; pguidEventContext: PGUID): HRESULT; stdcall;
    function GetMasterVolumeLevel(out pfLevelDB: Single): HRESULT; stdcall;
    function GetMasterVolumeLevelScalar(out pfLevel: Single): HRESULT; stdcall;
    function SetChannelVolumeLevel(nChannel: UINT; fLevelDB: Single; pguidEventContext: PGUID): HRESULT; stdcall;
    function SetChannelVolumeLevelScalar(nChannel: UINT; fLevel: Single; pguidEventContext: PGUID): HRESULT; stdcall;
    function GetChannelVolumeLevel(nChannel: UINT; out fLevelDB: Single): HRESULT; stdcall;
    function GetChannelVolumeLevelScalar(nChannel: UINT; out fLevel: Single): HRESULT; stdcall;
    // bMute either TRUE = 1 or FALSE = 0 !
    function SetMute(bMute: Longint; pguidEventContext: PGUID): HRESULT; stdcall;
    function GetMute(out pbMute: BOOL): HRESULT; stdcall;
    function GetVolumeStepInfo(out pnStep: UINT; out pnStepCount: UINT): HRESULT; stdcall;
    function VolumeStepUp(pguidEventContext: PGUID): HRESULT; stdcall;
    function VolumeStepDown(pguidEventContext: PGUID): HRESULT; stdcall;
    function QueryHardwareSupport(out pdwHardwareSupportMask: UINT): HRESULT; stdcall;
    function GetVolumeRange(out pflVolumeMindB: Single; out pflVolumeMaxdB: Single;
                            out pflVolumeIncrementdB: Single): HRESULT; stdcall;
{$ELSE}
    procedure RegisterControlChangeNotify(pNotify: IAudioEndpointVolumeCallback); safecall;
    procedure UnregisterControlChangeNotify(pNotify: IAudioEndpointVolumeCallback); safecall;
    function GetChannelCount: UINT; safecall;
    procedure SetMasterVolumeLevel(fLevelDB: Single; pguidEventContext: PGUID); safecall;
    procedure SetMasterVolumeLevelScalar(fLevel: Single; pguidEventContext: PGUID); safecall;
    function GetMasterVolumeLevel: Single; safecall;
    function GetMasterVolumeLevelScalar: Single; safecall;
    procedure SetChannelVolumeLevel(nChannel: UINT; fLevelDB: Single; pguidEventContext: PGUID); safecall;
    procedure SetChannelVolumeLevelScalar(nChannel: UINT; fLevel: Single; pguidEventContext: PGUID); safecall;
    function GetChannelVolumeLevel(nChannel: UINT): Single; safecall;
    function GetChannelVolumeLevelScalar(nChannel: UINT): Single; safecall;
    // bMute either TRUE = 1 or FALSE = 0 !
    procedure SetMute(bMute: Longint; pguidEventContext: PGUID); safecall;
    function GetMute: BOOL; safecall;
    procedure GetVolumeStepInfo(out pnStep: UINT; out pnStepCount: UINT); safecall;
    procedure VolumeStepUp(pguidEventContext: PGUID); safecall;
    procedure VolumeStepDown(pguidEventContext: PGUID); safecall;
    function QueryHardwareSupport: UINT; safecall;
    procedure GetVolumeRange(out pflVolumeMindB: Single; out pflVolumeMaxdB: Single;
                             out pflVolumeIncrementdB: Single); safecall;
{$ENDIF}
  end;

  {$EXTERNALSYM IAudioMeterInformation}
  IAudioMeterInformation = interface(IUnknown)
  ['{C02216F6-8C67-4B5B-9D00-D008E73E0064}']
{$IFNDEF USE_SAFECALL}
    function GetPeakValue(out pfPeak: Single): HRESULT; stdcall;
    function GetMeteringChannelCount(out pnChannelCount: UINT): HRESULT; stdcall;
    function GetChannelsPeakValues(u32ChannelCount: UINT32; out afPeakValues: Single): HRESULT; stdcall;
    function QueryHardwareSupport(out pdwHardwareSupportMask: DWORD): HRESULT; stdcall;
{$ELSE}
    function GetPeakValue: Single; safecall;
    function GetMeteringChannelCount: UINT; safecall;
    function GetChannelsPeakValues(u32ChannelCount: UINT32): Single; safecall;
    function QueryHardwareSupport: DWORD; safecall;
{$ENDIF}
  end;

  {$EXTERNALSYM IMMDevice}
  IMMDevice = interface(IUnknown)
  ['{D666063F-1587-4E43-81F1-B948E807363F}']
{$IFNDEF USE_SAFECALL}
    function Activate(const iid: TGUID; dwClsCtx: DWORD; pActivationParams: PPropVariant; out ppInterface): HRESULT; stdcall;
    function OpenPropertyStore(stgmAccess: DWORD; out ppProperties: IPropertyStore): HRESULT; stdcall;
    function GetId(out ppstrId: LPWSTR): HRESULT; stdcall;
    function GetState(out pdwState: DWORD): HRESULT; stdcall;
{$ELSE}
    procedure Activate(const iid: TGUID; dwClsCtx: DWORD; pActivationParams: PPropVariant; out ppInterface); safecall;
    function OpenPropertyStore(stgmAccess: DWORD): IPropertyStore; safecall;
    function GetId: LPWSTR; safecall;
    function GetState: DWORD; safecall;
{$ENDIF}
  end;

  {$EXTERNALSYM IMMEndpoint}
  IMMEndpoint = interface(IUnknown)
  ['{1BE09788-6894-4089-8586-9A2A6C265AC5}']
{$IFNDEF USE_SAFECALL}
    function GetDataFlow(out pDataFlow: EDataFlow): HRESULT; stdcall;
{$ELSE}
    function GetDataFlow: EDataFlow; safecall;
{$ENDIF}
  end;
  
  {$EXTERNALSYM IMMDeviceCollection}
  IMMDeviceCollection = interface(IUnknown)
  ['{0BD7A1BE-7A1A-44DB-8397-CC5392387B5E}']
{$IFNDEF USE_SAFECALL}
    function GetCount(out pcDevices: UINT): HRESULT; stdcall;
    function Item(nDevice: UINT; out ppDevice: IMMDevice): HRESULT; stdcall;
{$ELSE}
    function GetCount: UINT; safecall;
    function Item(nDevice: UINT): IMMDevice; safecall;
{$ENDIF}
  end;

  {$EXTERNALSYM IMMNotificationClient}
  IMMNotificationClient = interface(IUnknown)
  ['{7991EEC9-7E89-4D85-8390-6C703CEC60C0}']
{$IFNDEF USE_SAFECALL}
    function OnDeviceStateChanged(pwstrDeviceId: LPCWSTR; dwNewState: DWORD): HRESULT; stdcall;
    function OnDeviceAdded(pwstrDeviceId: LPCWSTR): HRESULT; stdcall;
    function OnDeviceRemoved(pwstrDeviceId: LPCWSTR): HRESULT; stdcall;
    function OnDefaultDeviceChanged(flow: EDataFlow; role: ERole; pwstrDefaultDeviceId: LPCWSTR): HRESULT; stdcall;
    function OnPropertyValueChanged(pwstrDeviceId: LPCWSTR; {const} key: PROPERTYKEY): HRESULT; stdcall;
{$ELSE}
    procedure OnDeviceStateChanged(pwstrDeviceId: LPCWSTR; dwNewState: DWORD); safecall;
    procedure OnDeviceAdded(pwstrDeviceId: LPCWSTR); safecall;
    procedure OnDeviceRemoved(pwstrDeviceId: LPCWSTR); safecall;
    procedure OnDefaultDeviceChanged(flow: EDataFlow; role: ERole; pwstrDefaultDeviceId: LPCWSTR); safecall;
    procedure OnPropertyValueChanged(pwstrDeviceId: LPCWSTR; {const} key: PROPERTYKEY); safecall;
{$ENDIF}
  end;

  {$EXTERNALSYM IMMDeviceEnumerator}
  IMMDeviceEnumerator = interface(IUnknown)
  ['{A95664D2-9614-4F35-A746-DE8DB63617E6}']
{$IFNDEF USE_SAFECALL}
    function EnumAudioEndpoints(dataFlow: EDataFlow; dwStateMask: DWORD;
      out ppDevices: IMMDeviceCollection): HRESULT; stdcall;
    function GetDefaultAudioEndpoint(dataFlow: EDataFlow; role: ERole;
      out ppEndpoint: IMMDevice): HRESULT; stdcall;
    function GetDevice(pwstrId: LPCWSTR; out ppDevice: IMMDevice): HRESULT; stdcall;
    function RegisterEndpointNotificationCallback(const pClient: IMMNotificationClient): HRESULT; stdcall;
    function UnregisterEndpointNotificationCallback(const pClient: IMMNotificationClient): HRESULT; stdcall;
{$ELSE}
    function EnumAudioEndpoints(dataFlow: EDataFlow; dwStateMask: DWORD): IMMDeviceCollection; safecall;
    function GetDefaultAudioEndpoint(dataFlow: EDataFlow; role: ERole): IMMDevice; safecall;
    function GetDevice(pwstrId: LPCWSTR): IMMDevice; safecall;
    procedure RegisterEndpointNotificationCallback(const pClient: IMMNotificationClient); safecall;
    procedure UnregisterEndpointNotificationCallback(const pClient: IMMNotificationClient); safecall;
{$ENDIF}
  end;
  
  {$EXTERNALSYM IAudioSessionEvents}
  IAudioSessionEvents = interface(IUnknown)
  ['{24918ACC-64B3-37C1-8CA9-74A66E9957A8}']
{$IFNDEF USE_SAFECALL}
    function OnDisplayNameChanged(NewDisplayName: LPCWSTR; EventContext: PGUID): HRESULT; stdcall;
    function OnIconPathChanged(NewIconPath: LPCWSTR; EventContext: PGUID): HRESULT; stdcall;
    function OnSimpleVolumeChanged(NewVolume    : Single;
                                   NewMute      : BOOL;
                                   EventContext : PGUID): HRESULT; stdcall;
    function OnChannelVolumeChanged(ChannelCount    : UINT;
                                    NewChannelArray : PSingle;
                                    ChangedChannel  : UINT;
                                    EventContext    : PGUID): HRESULT; stdcall;
    function OnGroupingParamChanged(NewGroupingParam,
                                    EventContext: PGUID): HRESULT; stdcall;
    function OnStateChanged(NewState: TAudioSessionState): HRESULT; stdcall;
    function OnSessionDisconnected(
              DisconnectReason: TAudioSessionDisconnectReason): HRESULT; stdcall;
{$ELSE}
    procedure OnDisplayNameChanged(NewDisplayName: LPCWSTR; EventContext: PGUID); safecall;
    procedure OnIconPathChanged(NewIconPath: LPCWSTR; EventContext: PGUID); safecall;
    procedure OnSimpleVolumeChanged(NewVolume    : Single;
                                   NewMute      : BOOL;
                                   EventContext : PGUID); safecall;
    procedure OnChannelVolumeChanged(ChannelCount    : UINT;
                                    NewChannelArray : PSingle;
                                    ChangedChannel  : UINT;
                                    EventContext    : PGUID); safecall;
    procedure OnGroupingParamChanged(NewGroupingParam,
                                    EventContext: PGUID); safecall;
    procedure OnStateChanged(NewState: TAudioSessionState); safecall;
    procedure OnSessionDisconnected(
              DisconnectReason: TAudioSessionDisconnectReason); safecall;
{$ENDIF}
  end;

  {$EXTERNALSYM IAudioSessionControl}
  IAudioSessionControl = interface(IUnknown)
  ['{F4B1A599-7266-4319-A8CA-E70ACB11E8CD}']
{$IFNDEF USE_SAFECALL}
    function GetState(out pRetVal: TAudioSessionState): HRESULT; stdcall;
    function GetDisplayName(out pRetVal: LPWSTR): HRESULT; stdcall; // pRetVal must be freed by CoTaskMemFree
    function SetDisplayName(Value: LPCWSTR; EventContext: PGUID): HRESULT; stdcall;
    function GetIconPath(out pRetVal: LPWSTR): HRESULT; stdcall;  // pRetVal must be freed by CoTaskMemFree
    function SetIconPath(Value: LPCWSTR; EventContext: PGUID): HRESULT; stdcall;
    function GetGroupingParam(pRetVal: PGUID): HRESULT; stdcall;
    function SetGroupingParam(OverrideValue, EventContext: PGUID): HRESULT; stdcall;
    function RegisterAudioSessionNotification(
                 const NewNotifications: IAudioSessionEvents): HRESULT; stdcall;
    function UnregisterAudioSessionNotification(
                 const NewNotifications: IAudioSessionEvents): HRESULT; stdcall;
{$ELSE}
    function GetState: TAudioSessionState; safecall;
    function GetDisplayName: LPWSTR; safecall; // Result must be freed by CoTaskMemFree
    procedure SetDisplayName(Value: LPCWSTR; EventContext: PGUID); safecall;
    function GetIconPath: LPWSTR; safecall;    // Result must be freed by CoTaskMemFree
    procedure SetIconPath(Value: LPCWSTR; EventContext: PGUID); safecall;
    function GetGroupingParam: PGUID; safecall;
    procedure SetGroupingParam(OverrideValue, EventContext: PGUID); safecall;
    procedure RegisterAudioSessionNotification(
                 const NewNotifications: IAudioSessionEvents); safecall;
    procedure UnregisterAudioSessionNotification(
                 const NewNotifications: IAudioSessionEvents); safecall;
{$ENDIF}
  end;

  {$EXTERNALSYM IAudioSessionControl2} // Windows 7
  IAudioSessionControl2 = interface(IAudioSessionControl)
  ['{bfb7ff88-7239-4fc9-8fa2-07c950be9c6d}']
{$IFNDEF USE_SAFECALL}
    function GetSessionIdentifier(out pRetVal: LPWSTR): HRESULT; stdcall;
    function GetSessionInstanceIdentifier(out pRetVal: LPWSTR): HRESULT; stdcall;
    function GetProcessId(out pRetVal: DWORD): HRESULT; stdcall;
    function IsSystemSoundsSession: HRESULT; stdcall;
    function SetDuckingPreference(optOut: Longint): HRESULT; stdcall;
{$ELSE}
    function GetSessionIdentifier: LPWSTR; safecall;
    function GetSessionInstanceIdentifier: LPWSTR; safecall;
    function GetProcessId: DWORD; safecall;
    function IsSystemSoundsSession: HRESULT; stdcall;
    procedure SetDuckingPreference(optOut: Longint); safecall;
{$ENDIF}
  end;

  {$EXTERNALSYM ISimpleAudioVolume}
  ISimpleAudioVolume = interface(IUnknown)
  ['{87CE5498-68D6-44E5-9215-6DA47EF883D8}']
{$IFNDEF USE_SAFECALL}
    function SetMasterVolume(fLevel: Single; EventContext: PGUID): HRESULT; stdcall;
    function GetMasterVolume(out fLevel: Single): HRESULT; stdcall;
    // bMute either TRUE = 1 or FALSE = 0 !
    function SetMute(bMute: Longint; EventContext: PGUID): HRESULT; stdcall;
    function GetMute(out bMute: BOOL): HRESULT; stdcall;
{$ELSE}
    procedure SetMasterVolume(fLevel: Single; EventContext: PGUID); safecall;
    function GetMasterVolume: Single; safecall;
    // bMute either TRUE = 1 or FALSE = 0 !
    procedure SetMute(bMute: Longint; EventContext: PGUID); safecall;
    function GetMute: BOOL; safecall;
{$ENDIF}
  end;

  {$EXTERNALSYM IAudioSessionManager}
  IAudioSessionManager = interface(IUnknown)
  ['{BFA971F1-4D5E-40BB-935E-967039BFBEE4}']
{$IFNDEF USE_SAFECALL}
    function GetAudioSessionControl(AudioSessionGuid: PGUID; StreamFlag : UINT;
                    out SessionControl: IAudioSessionControl): HRESULT; stdcall;
    function GetSimpleAudioVolume(AudioSessionGuid: PGUID; StreamFlag: UINT;
                         out AudioVolume: ISimpleAudioVolume): HRESULT; stdcall;
{$ELSE}
    function GetAudioSessionControl(AudioSessionGuid: PGUID; StreamFlag : UINT): IAudioSessionControl; safecall;
    function GetSimpleAudioVolume(AudioSessionGuid: PGUID; StreamFlag: UINT): ISimpleAudioVolume; safecall;
{$ENDIF}
  end;

implementation

end.




