unit fNewGame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfmNew = class(TForm)
    GroupBox2: TGroupBox;
    Panel_Footer: TPanel;
    Button1: TButton;
    RadioGroup1: TRadioGroup;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmNew: TfmNew;

implementation

{$R *.dfm}

procedure TfmNew.Button1Click(Sender: TObject);
begin
  // 만들기 클릭
  ModalResult := mrOK;
end;

end.
