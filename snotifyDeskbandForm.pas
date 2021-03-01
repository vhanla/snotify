unit snotifyDeskbandForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SHDocVw, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.ToolWin, System.ImageList, Vcl.ImgList, GR32_Image, Vcl.Imaging.pngimage,
  ES.BaseControls, ES.Images, Vcl.ExtCtrls, iTunes,
  snotifyDeskbandHoverForm, Spotify, Vcl.Menus, ShellApi;

type
  TsnotiForm = class(TForm)
    ToolBar1: TToolBar;
    tbPrevious: TToolButton;
    tbPlayPause: TToolButton;
    ImageList1: TImageList;
    tbNext: TToolButton;
    Image1: TImage;
    Timer1: TTimer;
    PopupMenu1: TPopupMenu;
    mnuAbout: TMenuItem;
    mnuSettings: TMenuItem;
    tmrPictureUpdater: TTimer;
    procedure FormDestroy(Sender: TObject);
    procedure Image1MouseEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbPreviousClick(Sender: TObject);
    procedure tbPlayPauseClick(Sender: TObject);
    procedure tbNextClick(Sender: TObject);
    procedure tbPlayClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure mnuAboutClick(Sender: TObject);
    procedure mnuSettingsClick(Sender: TObject);
    procedure Image1MouseLeave(Sender: TObject);
    procedure tmrPictureUpdaterTimer(Sender: TObject);
  private
    { Private declarations }
    FArtist: string;
    FSong: string;
    iTunesClient: TiTunes;

    FIE: IWebBrowser2;
    Hover: TForm2;
    SpotifyClient: TSpotify;
    procedure SetIE(const Value: IWebBrowser2);
  public
    { Public declarations }
    property IE: IWebBrowser2 read FIE write SetIE;
  end;

var
  snotiForm: TsnotiForm;

implementation

{$R *.dfm}

{ TsnotiForm }

procedure TsnotiForm.mnuAboutClick(Sender: TObject);
begin
  MessageDlg('About Snotify Deskband v1.0'#13#10#13#10'Author: vhanla', mtInformation, [mbOK], 0);
end;

procedure TsnotiForm.FormCreate(Sender: TObject);
begin
  if not Assigned(Hover) then
    Hover := TForm2.Create(Self);
  //if not Assigned(SpotifyClient) then
  SpotifyClient := TSpotify.Create;
  iTunesClient := TiTunes.Create;
  FArtist := '';
  FSong := '';
end;

procedure TsnotiForm.FormDestroy(Sender: TObject);
begin
  FreeAndNil(iTunesClient);
  FreeAndNil(SpotifyClient);
  FreeAndNil(Hover);
  FIE := nil;
end;

procedure TsnotiForm.Image1MouseEnter(Sender: TObject);
var
  ABData: TAppBarData;
begin
  ABData.cbSize := SizeOf(TAppBarData);
  if SHAppBarMessage(ABM_GETTASKBARPOS, ABData) <> 0 then
  begin
    case ABData.uEdge of
      ABE_LEFT:
        begin
          Hover.Top := ABData.rc.Top + Self.Top;
          Hover.Left := ABData.rc.Left + ABData.rc.Width;
        end;
      ABE_TOP:
        begin
          Hover.Top := ABData.rc.Top + ABData.rc.Height;
          Hover.Left := ABData.rc.Left + Self.Left;
        end;
      ABE_RIGHT:
        begin
          Hover.Top := ABData.rc.Top + Self.Top;
          Hover.Left := ABData.rc.Left - Hover.Width;
        end;
      ABE_BOTTOM:
        begin
          Hover.Top := ABData.rc.Top - Hover.Height;
          Hover.Left := ABData.rc.Left + Self.Left;
        end;
    end;
  end;
  AnimateWindow(Hover.Handle, 100, AW_CENTER);
  //Hover.Show;
end;

procedure TsnotiForm.Image1MouseLeave(Sender: TObject);
begin
  AnimateWindow(Hover.Handle, 100, AW_HIDE);
//  Hover.Close;
  ShowWindow(Hover.Handle,  SW_HIDE);
end;

procedure TsnotiForm.SetIE(const Value: IWebBrowser2);
begin
  FIE := Value;
end;

procedure TsnotiForm.mnuSettingsClick(Sender: TObject);
begin
  Hover.Show;
end;

procedure TsnotiForm.tbPreviousClick(Sender: TObject);
begin
  SpotifyClient.PlayPrevious(True);
end;

procedure TsnotiForm.Timer1Timer(Sender: TObject);
begin
  Hover.lblArtist.Caption := SpotifyClient.GetCurrentArtist;
  Hover.lblSong.Caption := SpotifyClient.GetCurrentSong;
  if Trim(Hover.lblArtist.Caption) <> '' then
    tbPlayPause.ImageIndex := 1
  else
    tbPlayPause.ImageIndex := 2;


  if ((Hover.lblArtist.Caption <> '') and (Hover.lblSong.Caption <> ''))
  and ((Hover.lblArtist.Caption <> FArtist) or (Hover.lblSong.Caption <> FSong))
  then
  begin
    FArtist := Hover.lblArtist.Caption;
    FSong := Hover.lblSong.Caption;
    // Update cover art
    iTunesClient.QueryArtistBySong(FArtist, FSong);
    tmrPictureUpdater.Enabled := True;
  end;
end;

procedure TsnotiForm.tmrPictureUpdaterTimer(Sender: TObject);
begin
  if iTunesClient.Updated then
  begin
    tmrPictureUpdater.Enabled := False;
    Image1.Picture.Assign(iTunesClient.FPicture);
    Hover.Image1.Picture.Assign(iTunesClient.FPicture);
  end;
end;

procedure TsnotiForm.tbPlayPauseClick(Sender: TObject);
begin
  SpotifyClient.PlayPause(True);
end;

procedure TsnotiForm.tbPlayClick(Sender: TObject);
begin
  SpotifyClient.PlayPause(True);
end;

procedure TsnotiForm.tbNextClick(Sender: TObject);
begin
  SpotifyClient.PlayNext(True);
end;

end.
