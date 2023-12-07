unit fmENV5_1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.OleCtrls,
  AcroPDFLib_TLB, Vcl.ExtCtrls, Frame_MenuInfo, Frame_Edit;

type
  TForm_ENV5_1 = class(TForm)
    ScrollBox_Main: TScrollBox;
    Label_Title: TLabel;
    Panel_FormBody: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Panel1: TPanel;
    Panel_MenuInfo_Column: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ScrollBox1: TScrollBox;
    Frame_ENV_MenuInfo10: TFrame_ENV_MenuInfo;
    Frame_ENV_MenuInfo01: TFrame_ENV_MenuInfo;
    Frame_ENV_MenuInfo02: TFrame_ENV_MenuInfo;
    Frame_ENV_MenuInfo03: TFrame_ENV_MenuInfo;
    Frame_ENV_MenuInfo04: TFrame_ENV_MenuInfo;
    Frame_ENV_MenuInfo05: TFrame_ENV_MenuInfo;
    Frame_ENV_MenuInfo06: TFrame_ENV_MenuInfo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Panel2: TPanel;
    Frame_ENV_Edit1: TFrame_ENV_Edit;
    Button8: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Frame_ENV_MenuInfo07: TFrame_ENV_MenuInfo;
    Frame_ENV_MenuInfo08: TFrame_ENV_MenuInfo;
    Frame_ENV_MenuInfo09: TFrame_ENV_MenuInfo;
    ScrollBox2: TScrollBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_ENV5_1: TForm_ENV5_1;

implementation

{$R *.dfm}

uses uDM;

end.
