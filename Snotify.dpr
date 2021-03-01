program Snotify;





{$R *.dres}

uses
  FastMM4,
  Winapi.Windows,
  Vcl.Forms,
  frmMain in 'frmMain.pas' {Form1},
  Spotify in 'Spotify.pas',
  Vcl.Themes,
  Vcl.Styles,
  timeteller in 'timeteller.pas',
  frmAbout in 'frmAbout.pas' {frmSplash},
  InterfaceSpotify in 'InterfaceSpotify.pas',
  functions in 'functions.pas';

{$R *.res}
var
  AppHandle: HWND;
begin
  AppHandle := FindWindow('SnotifyCLS', nil);
  if AppHandle > 0 then
  begin
//    Application.Terminate;
    Exit;
  end;

  Application.Initialize;
  Application.ShowMainForm := False;
  Application.MainFormOnTaskbar := False;
  TStyleManager.TrySetStyle('Spotify Dark Theme');
  Application.CreateForm(TMainForm, MainForm);
  //  Application.CreateForm(TfrmSplash, frmSplash);
  Application.Run;
end.
