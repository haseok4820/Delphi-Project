unit uPOPUP;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, ImagingComponents;

type
  TForm_POPUP = class(TForm)
    Label_Title: TLabel;
    Panel_Footer: TPanel;
    Label_MSG: TLabel;
    Timer_Timeout: TTimer;
    Label_Timeout: TLabel;
    ImageCancel: TImage;
    procedure PopupClick(Sender: TObject);
    procedure Timer_TimeoutTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure Popup_MouseEnter(Sender: TObject);
    procedure Popup_MouseLeave(Sender: TObject);
    procedure ImageCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_POPUP: TForm_POPUP;

implementation

{$R *.dfm}

procedure TForm_POPUP.FormShow(Sender: TObject);
begin
  if Panel_Footer.Visible then
    Timer_Timeout.Enabled := True;
  with ClientRect do
  begin
    SetWindowRgn(Handle, CreateRoundRectRgn(Left, Top, Right + 1, Bottom + 1, 30, 30), True);
  end;
end;

procedure TForm_POPUP.ImageCancelClick(Sender: TObject);
begin
  Tag := ImageCancel.Tag;
  ModalResult := mrCancel;
end;

procedure TForm_POPUP.PopupClick(Sender: TObject);
begin
  try
    {
      try
      // 타임아웃 처리시, 취소 처리
      if Sender = nil then
      Tag := POPUP_TAG_CANCEL
      else
      Tag := (Sender as TFrameImageLabel).Tag;
      except
      ON E: Exception do
      begin
      LogText('Popup ImageLabel Error : ' + E.Message);
      Tag := POPUP_TAG_ERROR;
      end;
      end;
    }
    TAg := (Sender as TLabel).TAg;
  finally
    ModalResult := mrOK;
  end;

end;

procedure TForm_POPUP.Popup_MouseEnter(Sender: TObject);
begin

  with (Sender as TLabel) do
  begin
    Color := $007E7E7E;
    Font.Color := clWhite;
  end;
end;

procedure TForm_POPUP.Popup_MouseLeave(Sender: TObject);
begin

  with (Sender as TLabel) do
  begin
    Color := clWhite;
    Font.Color := clBlack;
  end;
end;

procedure TForm_POPUP.Timer_TimeoutTimer(Sender: TObject);
var
  tTag: Integer;
begin
  tTag := Timer_Timeout.TAg;

  if tTag >= 30 then
  begin
    Timer_Timeout.Enabled := False;
    ImageCancelClick(nil);
  end
  else
    inc(tTag);

  Label_Timeout.Caption := IntToStr(30 - tTag) + Label_Timeout.Hint;
  Timer_Timeout.TAg := tTag;
end;

end.
