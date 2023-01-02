unit uNumPad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Panel2: TPanel;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Panel3: TPanel;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Panel4: TPanel;
    Button10: TButton;
    Button11: TButton;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  SetWindowLong(Self.Handle, GWL_EXSTYLE, WS_EX_NOACTIVATE);
end;

end.
