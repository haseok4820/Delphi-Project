unit Frame_doubleComboBox_Title;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Frame_ComboBox, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFrame_ENV_DoubleComboBox_Title = class(TFrame)
    Panel_Parent: TPanel;
    Label_Title: TLabel;
    COMBO_1: TFrame_ENV_ComboBox;
    COMBO_2: TFrame_ENV_ComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses uDM;

end.
