unit uPopup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TForm_Popup = class(TForm)
    Panel_Footer: TPanel;
    Label_MSG: TLabel;
    Timer_Timeout: TTimer;
    Label_Time: TLabel;
    procedure PopupShow(Sender: TObject);
    procedure Timer_TimeoutTimer(Sender: TObject);
    procedure Label_MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Label_MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    procedure BtnClick(Sender: TObject);
    procedure BtnCreate(iBtnType: Integer; ViewAlign: TAlign);
  public
    { Public declarations }
    procedure MngCancel;
  end;

var
  Form_Popup: TForm_Popup;

implementation

{$R *.dfm}

uses uMain;

procedure TForm_Popup.BtnClick(Sender: TObject);
begin
  ModalResult := (Sender as TLabel).Tag;
end;

procedure TForm_Popup.BtnCreate(iBtnType: Integer; ViewAlign: TAlign);
begin
  with TLabel.Create(Self) do
  begin
    Parent := Panel_Footer;
    Align := ViewAlign;
    Layout := tlCenter;
    Alignment := taCenter;
    AutoSize := False;
    Transparent := False;
    Color := clWhite;
    Tag := iBtnType;

    case iBtnType of
      mrOk:
        begin
          Name := 'Panel_OK';
          Caption := '확인';
          Hint := 'OK';

          Font.Color := $00FF8000;
        end;
      mrCancel:
        begin
          Name := 'Panel_Cancel';
          Caption := '취소';
          Hint := 'Cancel';

          Font.Color := clGray;
        end;
      mrYes:
        begin
          Name := 'Panel_YES';
          Caption := '예';
          Hint := 'YES';

          Font.Color := $00FF8000;
        end;
      mrNo:
        begin
          Name := 'Panel_NO';
          Caption := '아니요';
          Hint := 'NO';

          Font.Color := clGray;
        end;

    end;

    if ViewAlign <> alClient then
    begin
      Width := Panel_Footer.Width div 2 - 1;
    end;

    with Font do
    begin
      Name := '맑은 고딕';
      Size := 20;
      Style := [fsBold];
    end;

    onClick := BtnClick;
    OnMouseDown := Label_MouseDown;
    OnMouseUp := Label_MouseUp;
  end;
end;

procedure TForm_Popup.Label_MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  with (Sender as TLabel) do
  begin
    Color := clGray;
    Font.Color := clWhite;
  end;
end;

procedure TForm_Popup.Label_MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  with (Sender as TLabel) do
  begin
    Color := clWhite;
    Font.Color := clBlack;
  end;
end;

procedure TForm_Popup.MngCancel;
begin
  ModalResult := mrCancel;
end;

procedure TForm_Popup.PopupShow(Sender: TObject);
begin
  left := (Screen.Monitors[0].Width - Width) div 2;
  Top := (Screen.Monitors[0].Height - Height) div 2;

  case Tag of
    POPUP_Ok: // 확인만 표시
      begin
        BtnCreate(mrOk, alClient);
      end;
    POPUP_YesNO: // 예 아니요 표시
      begin
        BtnCreate(mrYes, alRight);
        BtnCreate(mrNo, alLeft);
      end;
    POPUP_OkCancle: // 확인 취소 표시
      begin
        BtnCreate(mrOk, alRight);
        BtnCreate(mrCancel, alLeft);
      end;
  end;

  SetWindowPos(Self.Handle, HWND_TOPMOST, left, Top, Width, Height, 0);
  with ClientRect do
  begin
    SetWindowRgn(Handle, CreateRoundRectRgn(left, Top, Right + 1, Bottom + 1, 40, 40), TRue);
  end;

  if Hint = '' then
  begin
    Hint := '초 후 창이 닫힙니다.';
  end;

  if Hint <> 'False' then
  begin
    Label_Time.Caption := IntToStr(Timer_Timeout.Tag) + Hint;
    Timer_Timeout.Enabled := TRue;
  end;
end;

procedure TForm_Popup.Timer_TimeoutTimer(Sender: TObject);
var
  iTag: Integer;
begin
  iTag := Timer_Timeout.Tag;
  if iTag <= 0 then
  begin
    ModalResult := mrCancel;
    Close;
  end
  else
  begin
    Dec(iTag);
  end;
  Timer_Timeout.Tag := iTag;
  Label_Time.Caption := IntToStr(Timer_Timeout.Tag) + Hint;
end;

end.
