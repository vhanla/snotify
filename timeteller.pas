{
  This unit will render (as sound) using whether
  SAPI 5.4 api or mp3 files (zara radio compatible)
  to tell the time to the user

  Supported languages: EN, ES

  - Requirement: SpeechLib_TLB (sapi dll installed on windows)
  BassDLL
}
unit timeteller;

interface

uses Sysutils, SpeechLib_TLB, Classes, StdCtrls, Bass, Windows, ExtCtrls;

type
  TTimeTeller = class
  private
    language: String;
    usingsapi: Boolean;
    usemp3: Boolean;
    timeString: String;
    spvoice: TSpVoice;
    voiceslist: TStringList;
    currentVoiceIndex: Integer;
    strs: array[0..128] of HSTREAM;
    strc: Integer;
    mp3timer: TTimer;
    curcaster: String;
  protected
    procedure Timer(Sender: TObject);
  public
    constructor Create(Handle: HWND);
    destructor Destroy; override;
    function prepareTimeString: string;
    procedure GetVoicesList(var list: TListBox);
    procedure GetCastersList(var list: TComboBox);
    procedure SetCurrentVoice(voiceIndex: Integer);
    procedure Say(const text: string);
    procedure SayMp3;
  //published
    property Voice: Integer read currentVoiceIndex write SetCurrentVoice;
    property TimeStr: string Read prepareTimeString;
    property Caster: string read curcaster write curcaster;
    property Locale: string read language write language;
  end;

implementation

function TimeToEnglish: string;
var
  time: TDateTime;
  h,m,s,ms: Word;
  fullstring: string;
  hour, minute: string;
  nexthour: string;

begin
  fullstring := 'It is ';
  time := Now;
  DecodeTime(time, h, m, s, ms);

  if h > 12 then // am or pm
    h := h - 12;

  if h = 12 then
    nexthour := '1'
  else if h < 12 then
    nexthour := IntToStr(h + 1);

  case m of
    0:
      hour := IntToStr(h) + ' o''clock';
    1..14:
      hour := IntToStr(m) + ' past ' +IntToStr(h);
    15:
      hour := IntToStr(m) + ' quarter past ' +IntToStr(h);
    16..29:
      hour := IntToStr(m) + ' past ' +IntToStr(h);
    30:
      hour := IntToStr(m) + ' half past ' +IntToStr(h);
    31..44:
      hour := IntToStr(60-m) + ' to ' + nexthour;
    45:
      hour := IntToStr(60-m) + ' quarter to ' + nexthour;
    46..59:
      hour := IntToStr(60-m) + ' to ' + nexthour;
  end;
  fullstring := fullstring + hour;
  Result := fullstring;
end;

function TimeToSpanish: string;
var
  time: TDateTime;
  h,m,s,ms: Word;
  fullstring: string;
  hour, minute: string;
  nexthour: string;
  ahour: string;
begin

  fullstring := 'Son las ';
  time := Now;
  DecodeTime(time, h, m, s, ms);

  if h > 12 then // am or pm
    h := h - 12;

  if h = 1 then
    fullstring := 'Es la ';

  if h = 12 then
    nexthour := '1'
  else if h < 12 then
    nexthour := IntToStr(h + 1);

  case h of
    0: ahour := IntToStr(12);
    1: ahour := 'una';
    else ahour := IntToStr(h);
  end;

  case m of
    0:
      hour := ahour + ' en punto';
    1..14:
      hour := ahour + ' y ' +IntToStr(m);
    15:
      hour := ahour + ' y cuarto';
    16..29:
      hour := ahour + ' y ' +IntToStr(m);
    30:
      hour := ahour + ' y media';
    31..44:
      hour := ahour + ' y ' +IntToStr(m);
    45:
      begin
        if nexthour = '1' then
        begin
          fullstring := 'Es un cuarto para la ';
          hour := 'una';
        end
        else
        begin
          fullstring := 'Es un cuarto para las ';
          hour := nexthour;
        end;
      end;
    46..59:
      begin
        if nexthour = '1' then
        begin
          if m = 59 then
            fullstring := 'Es una para la '
          else
            fullstring := 'Son '+IntToStr(60-m)+' para la ';
          hour := 'una';
        end
        else
        begin
          if m = 59 then
            fullstring := 'Es una para las '
          else
            fullstring := 'Son '+IntToStr(60-m)+' para las ';
          hour := nexthour;
        end;
      end;
  end;
  fullstring := fullstring + hour;
  Result := fullstring;
end;

{ TTimeTeller }

constructor TTimeTeller.Create;
begin
  language := 'ES';
  spvoice := TSpVoice.Create(nil);
  voiceslist := TStringList.Create;


  strc:= 0;
	// check the correct BASS was loaded
	if (HIWORD(BASS_GetVersion) <> BASSVERSION) then
	begin
		MessageBox(0,'An incorrect version of BASS.DLL was loaded',nil,MB_ICONERROR);
		Halt;
	end;

	// Initialize audio - default device, 44100hz, stereo, 16 bits
	if not BASS_Init(-1, 44100, 0, Handle, nil) then
    raise Exception.Create('Error initializing audio!');

  mp3timer := TTimer.Create(nil);
  mp3timer.Enabled := False;
  mp3timer.Interval := 250;
  mp3timer.OnTimer := Timer;
end;

destructor TTimeTeller.Destroy;
var
  I: Integer;
begin
  mp3timer.Free;
  if strc > 0 then
    for I := 0 to strc - 1 do
      BASS_StreamFree(strs[I]);

  BASS_Free();
  voiceslist.Free;
  spvoice.Free;
  inherited;
end;

procedure TTimeTeller.GetCastersList(var list: TComboBox);
var
  search: TSearchRec;
  finder: Integer;
  voicesPath : String;
  dirName: String;
begin
  voicesPath := ExtractFilePath(ParamStr(0))+'voices\';
  if DirectoryExists(voicesPath) then
  begin
    finder := FindFirst(voicesPath + '*.', faAnyFile, search);
    while finder = 0 do
    begin    
      dirName := search.Name;
      if (dirName <> '.') 
      and (dirName <> '..')
      and (DirectoryExists(voicesPath+dirName))
      then
      begin
        list.Items.Add(dirName);
      end;          
      finder := FindNext(search);
    end;
  end;  
end;

procedure TTimeTeller.GetVoicesList(var list: TListBox);
var
  I: Integer;
  voices: ISpeechObjectTokens;
  strvoice: String;
begin
  list.Clear;
  voiceslist.Clear;
  voices := spvoice.GetVoices('','');
  for I := 0 to voices.Count - 1 do
  begin
    strvoice := voices.Item(I).GetDescription(0);
    voiceslist.Add(strvoice);
    list.Items.Add(strvoice);
  end;

end;

function TTimeTeller.prepareTimeString: string;
begin
  if language = 'EN' then
    timeString := TimeToEnglish
  else
    timeString := TimeToSpanish;
  Result := timeString;
end;

procedure TTimeTeller.Say(const text: string);
begin
  spvoice.Speak(text,0);
end;

procedure TTimeTeller.SayMp3;
var
  hour, minute: string;
  time: TDateTime;
  h,m,s,ms: Word;
  oclock: Boolean;
  f : PChar;
begin
  time := Now;  
  DecodeTime(time, h, m, s, ms);
  oclock := False;

  if m = 0 then
    oclock := True;
  if oclock then
  begin
    hour := 'HRS'+SysUtils.Format('%.*d',[2,h])+'_O.mp3';
    if not FileExists(PChar(extractfilepath(ParamStr(0))+'voices\'+curcaster+'\'+hour)) then
      hour := 'HRS'+SysUtils.Format('%.*d',[2,h])+'.mp3';       
  end
  else
    hour := 'HRS'+SysUtils.Format('%.*d',[2,h])+'.mp3';   
  
  f := PChar(extractfilepath(ParamStr(0))+'voices\'+curcaster+'\'+hour);

  strs[0] := BASS_StreamCreateFile(False, f, 0, 0, BASS_UNICODE);
  if not BASS_ChannelPlay(strs[0], False) then
    raise Exception.Create('Error Playing mp3');
  if not oclock then
    mp3timer.Enabled := True;  

  if oclock then minute := '';
  minute := 'MIN'+SysUtils.Format('%.*d',[2,m])+'.mp3';
  
  f := PChar(extractfilepath(ParamStr(0))+'voices\'+curcaster+'\'+minute);
  strs[1] := BASS_StreamCreateFile(False, f, 0, 0, BASS_UNICODE);
  
end;

procedure TTimeTeller.SetCurrentVoice(voiceIndex: Integer);
begin
  currentVoiceIndex := voiceIndex;
  SpVoice.Voice := SpVoice.GetVoices('','').Item(voiceIndex);
end;

procedure TTimeTeller.Timer(Sender: TObject);
var
  bassstatus: DWORD;
begin
  bassstatus := BASS_ChannelIsActive(strs[0]);
  if bassstatus = BASS_ACTIVE_STOPPED then
  begin
    if not BASS_ChannelPlay(strs[1], False) then
      raise Exception.Create('Error Playing mp3');
    mp3timer.Enabled := False;
  end;
end;

end.
