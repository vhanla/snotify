unit frmAbout;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,GDIPAPI,GDIpOBJ,Activex;

type
  TfrmSplash = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  protected
    procedure WMNCHitTest(var message: TWMNCHitTest); message WM_NCHITTEST;
  public
    { Public declarations }
    procedure Execute;
  end;

var
  frmSplash: TfrmSplash;

implementation

{$R *.dfm}

uses frmMain;

type
  TFixedStreamAdapter = class(TStreamAdapter)
  public
//    function Stat(out statstg: TStatStg; grfStatFlag: Longint): HResult; override; stdcall;
    function Stat(out statstg: TStatStg; grfStatFlag: DWORD): HResult; virtual; stdcall;
  end;

function TFixedStreamAdapter.Stat(out statstg: TStatStg; grfStatFlag: DWORD): HResult;
begin
  Result := inherited Stat(statstg, grfStatFlag);
  statstg.pwcsName := nil;
end;


procedure PremultiplyBitmap(Bitmap: TBitmap);
var
  Row, Col: integer;
  p: PRGBQuad;
  PreMult: array[byte, byte] of byte;
begin
  // precalculate all possible values of a*b
  for Row := 0 to 255 do
    for Col := Row to 255 do
    begin
      PreMult[Row, Col] := Row*Col div 255;
      if (Row <> Col) then
        PreMult[Col, Row] := PreMult[Row, Col]; // a*b = b*a
    end;

  for Row := 0 to Bitmap.Height-1 do
  begin
    Col := Bitmap.Width;
    p := Bitmap.ScanLine[Row];
    while (Col > 0) do
    begin
      p.rgbBlue := PreMult[p.rgbReserved, p.rgbBlue];
      p.rgbGreen := PreMult[p.rgbReserved, p.rgbGreen];
      p.rgbRed := PreMult[p.rgbReserved, p.rgbRed];
      inc(p);
      dec(Col);
    end;
  end;
end;



procedure TfrmSplash.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MainForm.Enabled := True;
  Action := caFree;
end;

procedure TfrmSplash.FormCreate(Sender: TObject);
begin
  Position := poOwnerFormCenter;
  FormStyle := fsStayOnTop;
  BorderStyle := bsSingle;
  BorderIcons := [biSystemMenu];
  SetWindowLong(Self.Handle, GWL_EXSTYLE,
  GetWindowLong(Self.Handle, GWL_EXSTYLE) and not WS_EX_APPWINDOW
  or WS_EX_TOOLWINDOW);
end;

procedure TfrmSplash.FormKeyPress(Sender: TObject; var Key: Char);
begin
  Close;
end;

procedure TfrmSplash.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (X > ClientWidth - 315) and (X < ClientWidth - 215)
  and (Y > ClientHeight - 74) and (Y < ClientHeight - 44)
  then Close
end;

procedure TfrmSplash.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if (X > ClientWidth - 315) and (X < ClientWidth - 215)
  and (Y > ClientHeight - 74) and (Y < ClientHeight - 44)
  then Cursor := crHandPoint
  else
    Cursor := crDefault;
end;

procedure TfrmSplash.FormShow(Sender: TObject);
begin
//  ShowWindow(Application.Handle, SW_HIDE);
end;

procedure TfrmSplash.Execute;
var
  Ticks: DWORD;
  BlendFunction: TBlendFunction;
  BitmapPos: TPoint;
  BitmapSize: TSize;
  exStyle: DWORD;
  Bitmap: TBitmap;
  PNGBitmap: TGPBitmap;
  BitmapHandle: HBITMAP;
  Stream: TStream;
  StreamAdapter: IStream;
begin
  // Enable window layering
  exStyle := GetWindowLongA(Handle, GWL_EXSTYLE);
  if (exStyle and WS_EX_LAYERED = 0) then
    SetWindowLong(Handle, GWL_EXSTYLE, exStyle or WS_EX_LAYERED);

  Bitmap := TBitmap.Create;
  try
    // Load the PNG from a resource
    Stream := TResourceStream.Create(HInstance, 'ABOUT', RT_RCDATA);
    try
      // Wrap the VCL stream in a COM IStream
      StreamAdapter := TFixedStreamAdapter.Create(Stream);
      try
        // Create and load a GDI+ bitmap from the stream
        PNGBitmap := TGPBitmap.Create(StreamAdapter);
        try
          // Convert the PNG to a 32 bit bitmap
          PNGBitmap.GetHBITMAP(MakeColor(0,0,0,0), BitmapHandle);
          // Wrap the bitmap in a VCL TBitmap
          Bitmap.Handle := BitmapHandle;
        finally
          PNGBitmap.Free;
        end;
      finally
        StreamAdapter := nil;
      end;
    finally
      Stream.Free;
    end;

    ASSERT(Bitmap.PixelFormat = pf32bit, 'Wrong bitmap format - must be 32 bits/pixel');

    // Perform run-time premultiplication
    PremultiplyBitmap(Bitmap);


    // Resize form to fit bitmap
    ClientWidth := Bitmap.Width;
    ClientHeight := Bitmap.Height;

    // Position bitmap on form
    BitmapPos := Point(0, 0);
    BitmapSize.cx := Bitmap.Width;
    BitmapSize.cy := Bitmap.Height;

    // Setup alpha blending parameters
    BlendFunction.BlendOp := AC_SRC_OVER;
    BlendFunction.BlendFlags := 0;
    BlendFunction.SourceConstantAlpha := 0; // Start completely transparent
    BlendFunction.AlphaFormat := AC_SRC_ALPHA;

    Show;
    // ... and action!
    Ticks := 0;
    while (BlendFunction.SourceConstantAlpha < 255) do
    begin
      while (Ticks = GetTickCount) do
        Sleep(9); // Don't fade too fast
      Ticks := GetTickCount;
      inc(BlendFunction.SourceConstantAlpha,
        (255-BlendFunction.SourceConstantAlpha) div 32+1); // Fade in
      UpdateLayeredWindow(Handle, 0, nil, @BitmapSize, Bitmap.Canvas.Handle,
        @BitmapPos, 0, @BlendFunction, ULW_ALPHA);
    end;
  finally
    Bitmap.Free;
  end;
  // Start timer to hide form after a short while
  //TimerSplash.Enabled := True;

end;

procedure TfrmSplash.WMNCHitTest(var message: TWMNCHitTest);
begin
  Message.Result:=HTCAPTION;
end;

end.


