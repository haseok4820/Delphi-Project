unit fmENV1_4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Frame_ComboBox,
  Frame_Edit, Vcl.ExtCtrls, Frame_CheckBox;

type
  TForm_ENV1_4 = class(TForm)
    ScrollBox_Main: TScrollBox;
    Label_Title: TLabel;
    Label_FoodcafeChk: TLabel;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    Panel2: TPanel;
    Memo1: TMemo;
    Label_Guide2: TLabel;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    Frame_CheckBox_useNotStock: TFrame_ENV_CheckBox;
    Frame_CheckBox_CloseUpUpdate: TFrame_ENV_CheckBox;
    Panel_ASP: TPanel;
    Frame_Edit_GMZNO: TFrame_ENV_Edit;
    Frame_ComboBox_ASPAutoDown: TFrame_ENV_ComboBox;
    Frame_Edit_DBPath: TFrame_ENV_Edit;
    Panel3: TPanel;
    Frame_Edit_HostIP: TFrame_ENV_Edit;
    Frame_Edit_PosNo: TFrame_ENV_Edit;
    Frame_CheckBox_NotSaleSend: TFrame_ENV_CheckBox;
    Button1: TButton;
    Button2: TButton;
    procedure FormShow(Sender: TObject);
    procedure Frame_ComboBox_ASPAutoDownClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Frame_Edit_DBPathClick(Sender: TObject);
    procedure Frame_CheckBox_NotSaleSendClick(Sender: TObject);
    procedure Frame_ENV_Edit1Edit_ValueExit(Sender: TObject);
    procedure Memo1Exit(Sender: TObject);
    procedure Memo1KeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_ENV1_4: TForm_ENV1_4;

implementation

{$R *.dfm}

uses uDM;

procedure TForm_ENV1_4.Button1Click(Sender: TObject);
begin
  Frame_Edit_HostIP.Edit_Value.Text := '127.0.0.1';
  Frame_Edit_DBPath.Edit_Value.Text := 'C:\FOODCAFE\DATABASE\';
end;

procedure TForm_ENV1_4.Button2Click(Sender: TObject);
begin
  if DM.OpenDialog.Execute then
  begin
    Frame_Edit_DBPath.Edit_Value.Text := ExtractFilePath(DM.OpenDialog.FileName);
  end;
end;

procedure TForm_ENV1_4.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: Integer;
begin
  GMZNO := Frame_Edit_GMZNO.Edit_Value.Text;
  useAutoDown := Frame_ComboBox_ASPAutoDown.Tag;

  useNotStock := Frame_CheckBox_useNotStock.Tag <> 0;
  CloseNoUpdate := Frame_CheckBox_CloseUpUpdate.Tag <> 0;
  NotSaleSend := Frame_CheckBox_NotSaleSend.Tag <> 0;

  PosNo := StrToIntDef(Frame_Edit_PosNo.Edit_Value.Text, PosNo);
  if (PosNo = 0) OR (PosNo > 50) then
  begin
    DM.GetPopup(0, '잘못된 요청', '포스번호가 올바르지 않아, 1번으로 초기화됩니다.', '');
    PosNo := 1;
  end;
  HostIP := Frame_Edit_HostIP.Edit_Value.Text;
  DBPath := Frame_Edit_DBPath.Edit_Value.Text;

  for i := Low(arrkitCommIP) to High(arrkitCommIP) do
  begin
    if i <= Memo1.Lines.Count then
      arrkitCommIP[i] := Memo1.Lines[i -1]
    else
      arrkitCommIP[i] := '';
  end;

end;

procedure TForm_ENV1_4.FormShow(Sender: TObject);
var
  i: Integer;
begin
  //
  if (DM.ControlProgram(2, 'airTrain.exe').Result_int <> 0) OR (DM.ControlProgram(2, 'AirServer.exe').Result_int <> 0) then
  begin
    Label_FoodcafeChk.Visible := True;
    bFoodcafeRestart := True;
  end
  else
    bFoodcafeRestart := False;

  Frame_Edit_GMZNO.Edit_Value.Text := GMZNO;
  Frame_ComboBox_ASPAutoDown.Label_Key.Caption := arrAspAutoDown[useAutoDown];
  Frame_ComboBox_ASPAutoDown.Tag := useAutoDown;

  DM.Image_CheckBOX(StrToInt(BoolToStr(NOT useNotStock)), Frame_CheckBox_useNotStock);
  DM.Image_CheckBOX(StrToInt(BoolToStr(NOT CloseNoUpdate)), Frame_CheckBox_CloseUpUpdate);
  DM.Image_CheckBOX(StrToInt(BoolToStr(NOT NotSaleSend)), Frame_CheckBox_NotSaleSend);

  Frame_Edit_PosNo.Edit_Value.Text := IntToStr(PosNo);
  Frame_Edit_HostIP.Edit_Value.Text := HostIP;
  Frame_Edit_DBPath.Edit_Value.Text := DBPath;

  for i := Low(arrkitCommIP) to High(arrkitCommIP) do
  begin
    if arrkitCommIP[i] <> '' then
      Memo1.Lines.Add(arrkitCommIP[i]);
  end;

end;

procedure TForm_ENV1_4.Frame_CheckBox_NotSaleSendClick(Sender: TObject);
begin
  if Frame_CheckBox_NotSaleSend.Tag = 1 then
  begin
    if DM.GetPopup(1, '사용자 확인', '해당 기능 체크시 ASP로 매출이 전송되지 않습니다. 계속 진행하시겠습니까?', '').Result_int = 0 then
    begin
      DM.Image_CheckBOX(1, Frame_CheckBox_NotSaleSend);
    end;
  end;
end;

procedure TForm_ENV1_4.Frame_ComboBox_ASPAutoDownClick(Sender: TObject);
var
  Result_IS: TResult_IS;
begin
  with (Sender as TFrame_ENV_ComboBox) do
  begin
    Result_IS := DM.GetList('상품 다운로드 유형을 선택해주세요.', arrAspAutoDown);
    if Result_IS.Result_int <> -99 then
    begin
      Tag := Result_IS.Result_int;
      Label_Key.Caption := Result_IS.Result_Str;
    end;
  end;
end;

procedure TForm_ENV1_4.Frame_Edit_DBPathClick(Sender: TObject);
var
  Result_IS: TResult_IS;
begin
  Result_IS := DM.GetOpen(0);
  if Result_IS.Result_int <> 0 then
  begin
    Frame_Edit_DBPath.Edit_Value.Text := ExtractFilePath(Result_IS.Result_Str);
  end;
end;

procedure TForm_ENV1_4.Frame_ENV_Edit1Edit_ValueExit(Sender: TObject);
begin
  with (Sender as TEdit) do
  begin
    if NOT DM.IPValueCheck(Text) then
    begin
      DM.GetPopup(0, Hint + ' 처리 실패', Hint + ' 주소를 확인해주세요.', '');
    end;
  end;

end;

procedure TForm_ENV1_4.Memo1Exit(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to Memo1.Lines.Count - 1 do
  begin
    if Memo1.Lines[i] = '' then
      Continue;
    if NOT DM.IPValueCheck(Memo1.Lines[i]) then
    begin
      DM.GetPopup(0, Memo1.Hint + ' 처리 실패', IntToStr(i + 1) + '번째 ' + Memo1.Hint + ' 주소를 확인해주세요.', '');
      Break;
    end;
  end;
end;

procedure TForm_ENV1_4.Memo1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Memo1Exit(nil);
  end;
end;

end.
