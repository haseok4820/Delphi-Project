unit fmENV1_1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Frame_Edit, Vcl.ExtCtrls,
  Vcl.Mask, Frame_ComboBox, Frame_CheckBox;

type
  TForm_ENV1_1 = class(TForm)
    ScrollBox_Main: TScrollBox;
    Frame_ENV_StoreOwner: TFrame_ENV_Edit;
    Frame_ENV_StoreName: TFrame_ENV_Edit;
    Frame_ENV_StoreType: TFrame_ENV_Edit;
    Frame_ENV_StoreSeq: TFrame_ENV_Edit;
    Frame_ENV_StoreTel: TFrame_ENV_Edit;
    Frame_ENV_StoreAddr1: TFrame_ENV_Edit;
    Label_Guide1: TLabel;
    Label_Title: TLabel;
    Frame_ENV_StoreAddr2: TFrame_ENV_Edit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_ENV1_1: TForm_ENV1_1;

implementation

{$R *.dfm}

uses uDM;

procedure TForm_ENV1_1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  StoreName := Frame_ENV_StoreName.Edit_Value.Text;
  StoreOwner := Frame_ENV_StoreOwner.Edit_Value.Text;
  StoreType := Frame_ENV_StoreType.Edit_Value.Text;
  StoreSeq := Frame_ENV_StoreSeq.Edit_Value.Text;
  StoreTel := Frame_ENV_StoreTel.Edit_Value.Text;
  StoreAddr1 := Frame_ENV_StoreAddr1.Edit_Value.Text;
  StoreAddr2 := Frame_ENV_StoreAddr2.Edit_Value.Text;
end;

procedure TForm_ENV1_1.FormShow(Sender: TObject);
begin
  Frame_ENV_StoreName.Edit_Value.Text := StoreName;
  Frame_ENV_StoreOwner.Edit_Value.Text := StoreOwner;
  Frame_ENV_StoreType.Edit_Value.Text := StoreType;
  Frame_ENV_StoreSeq.Edit_Value.Text := StoreSeq;
  Frame_ENV_StoreTel.Edit_Value.Text := StoreTel;
  Frame_ENV_StoreAddr1.Edit_Value.Text := StoreAddr1;
  Frame_ENV_StoreAddr2.Edit_Value.Text := StoreAddr2;
end;

end.
