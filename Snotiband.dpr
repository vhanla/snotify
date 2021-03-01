library Snotiband;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  ComServ,
  snotifyDeskband in 'snotifyDeskband.pas',
  snotifyDeskbandForm in 'snotifyDeskbandForm.pas' {snotiForm},
  snotifyDeskbandHoverForm in 'snotifyDeskbandHoverForm.pas' {Form2},
  iTunes in 'iTunes.pas';

{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers.
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}

const
  SnotifyDeskbarMajorVersion = 1;
  SnotifyDeskbarMinorVersion = 0;

  LIBID_SnotifyDeskBar: TGUID = '{B2B14484-5E75-4BBD-99C9-4D6C16AD5741}';

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;
{$R *.res}

begin
end.
