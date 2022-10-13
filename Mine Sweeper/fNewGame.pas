unit fNewGame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TfmNew = class(TForm)
    Group2: TGroupBox;
    Panel_Footer: TPanel;
    Button_OK: TButton;
    Group1: TRadioGroup;
    Panel1: TPanel;
    Panel2: TPanel;
    CheckBox_Self: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit_Width: TEdit;
    Edit_Height: TEdit;
    TrackBar_: TTrackBar;
    Label_Hint: TLabel;
    CheckBox_Timer: TCheckBox;
    procedure Button_OKClick(Sender: TObject);
    procedure CheckBox_SelfClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmNew: TfmNew;

implementation

{$R *.dfm}

procedure TfmNew.Button_OKClick(Sender: TObject);
begin
  // 만들기 클릭
  if CheckBox_Self.Checked then
  begin
    if StrToIntDef(Edit_Width.Text, 8) < 1 then
      Edit_Width.Text := '1'
    else if StrToIntDef(Edit_Width.Text, 8) > 255 then
      Edit_Width.Text := '255';

    if StrToIntDef(Edit_Height.Text, 8) < 1 then
      Edit_Height.Text := '1'
    else if StrToIntDef(Edit_Height.Text, 8) > 255 then
      Edit_Height.Text := '255';
  end;

  ModalResult := mrOK;
end;

procedure TfmNew.CheckBox_SelfClick(Sender: TObject);
begin
  if (Sender as TCheckBox).Checked then
  begin
    Group1.Visible := False;
    Group2.Visible := true;
  end
  else
  begin
    Group1.Visible := true;
    Group2.Visible := False;
  end;
end;

end.
