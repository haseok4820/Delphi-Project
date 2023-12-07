unit fmENV3_1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Frame_YN, Frame_CheckBox,
  Frame_ComboBox, Vcl.ExtCtrls, Vcl.StdCtrls,
  Frame_ComboBox_Title, Frame_doubleComboBox_Title;

type
  TForm_ENV3_1 = class(TForm)
    ScrollBox_Main: TScrollBox;
    Label_Title: TLabel;
    Label_Guide1: TLabel;
    GroupBox_Device_Ext: TGroupBox;
    GroupBox_Device: TGroupBox;
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox4: TGroupBox;
    Frame_ComboBox_RecPrnType: TFrame_ENV_ComboBox;
    GroupBox5: TGroupBox;
    Frame_ComboBox_KitPrnType: TFrame_ENV_ComboBox;
    Frame_CheckBox_KitDriverPrint: TFrame_ENV_CheckBox;
    Button1: TButton;
    Frame_ComboBox_Prn4: TFrame_ENV_DoubleComboBox_Title;
    Frame_ComboBox_Prn3: TFrame_ENV_DoubleComboBox_Title;
    Frame_ComboBox_Prn2: TFrame_ENV_DoubleComboBox_Title;
    Frame_ComboBox_Prn1: TFrame_ENV_DoubleComboBox_Title;
    Panel3: TPanel;
    Frame_ExtComboBox_Title1: TFrame_ENV_DoubleComboBox_Title;
    Frame_ExtComboBox_Title2: TFrame_ENV_DoubleComboBox_Title;
    Frame_ExtComboBox_Title3: TFrame_ENV_DoubleComboBox_Title;
    Panel4: TPanel;
    Panel5: TPanel;
    Frame_ExtComboBox_Type3: TFrame_ENV_ComboBox;
    Panel6: TPanel;
    Frame_ExtComboBox_Type2: TFrame_ENV_ComboBox;
    Panel7: TPanel;
    Frame_ExtComboBox_Type1: TFrame_ENV_ComboBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Frame_ComboBox_PrnTypeClick(Sender: TObject);
    procedure Frame_ENV_DoubleComboBox_Title1Label_TitleClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure FrameCOMBOClick(Sender: TObject);
  public
    { Public declarations }
  end;

var
  Form_ENV3_1: TForm_ENV3_1;

implementation

{$R *.dfm}

uses uDM, ufmPrnTest;

procedure TForm_ENV3_1.Button1Click(Sender: TObject);
begin
  fmPrnTest := TfmPrnTest.Create(Self);
  with fmPrnTest do
  begin
    if Frame_CheckBox_KitDriverPrint.Tag <> 0 then
      Tag := 1;

    ShowModal;
  end;
end;

procedure TForm_ENV3_1.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: integer;
begin

  for i := Low(Port_List) to High(Port_List) do
  begin
    with (FindComponent('Frame_ComboBox_Prn' + IntToSTr(i)) as TFrame_ENV_DoubleComboBox_Title) do
    begin
      Port_List[i].iType := COMBO_1.Tag;
      Port_List[i].iKit_Spc := COMBO_2.Tag;
    end;
  end;

  for i := Low(ExtPort_List) to High(ExtPort_List) do
  begin
    with (FindComponent('Frame_ExtComboBox_Title' + IntToSTr(i)) as TFrame_ENV_DoubleComboBox_Title) do
    begin
      ExtPort_List[i].iPort := Label_Title.Tag;
      ExtPort_List[i].iType := COMBO_1.Tag;
      ExtPort_List[i].iKit_Spc := COMBO_2.Tag;
    end;

    with (FindComponent('Frame_ExtComboBox_Type' + IntToSTr(i)) as TFrame_ENV_ComboBox) do
    begin
      ExtPort_List[i].iMachineType := Tag;
    end;

  end;

  RecPrnType := Frame_ComboBox_RecPrnType.Tag;
  KitPrnType := Frame_ComboBox_KitPrnType.Tag;

  KitDriverPrint := Frame_CheckBox_KitDriverPrint.Tag <> 0;

end;

procedure TForm_ENV3_1.FormShow(Sender: TObject);
var
  i: integer;
begin
  // COM 1~4
  for i := Low(Port_List) to High(Port_List) do
  begin
    with (FindComponent('Frame_ComboBox_Prn' + IntToSTr(i)) as TFrame_ENV_DoubleComboBox_Title) do
    begin
      if Port_List[i].iType <> 0 then
      begin
        COMBO_1.Tag := Port_List[i].iType;
      end
      else if Port_List[i].iKit <> 0 then
      begin
        COMBO_1.Tag := Port_List[i].iKit + 10;
      end
      else
        COMBO_1.Tag := 0;

      COMBO_1.Label_Key.Caption := arrPortType_OPTION[COMBO_1.Tag];
      COMBO_1.Hint := 'TYPE1';

      COMBO_1.OnClick := FrameCOMBOClick;

      COMBO_2.Tag := Port_List[i].iKit_Spc;
      COMBO_2.Label_Key.Caption := arrPortType_Kit[COMBO_2.Tag];
      COMBO_2.Hint := 'TYPE2';
      COMBO_2.OnClick := FrameCOMBOClick;
    end;
  end;

  // 확장포트
  for i := Low(ExtPort_List) to High(ExtPort_List) do
  begin
    with (FindComponent('Frame_ExtComboBox_Title' + IntToSTr(i)) as TFrame_ENV_DoubleComboBox_Title) do
    begin
      if ExtPort_List[i].iType <> 0 then
      begin
        COMBO_1.Tag := ExtPort_List[i].iType;
      end
      else
        COMBO_1.Tag := 0;
      COMBO_2.Tag := ExtPort_List[i].iKit_Spc;

      Label_Title.Caption := ExtPortList[ExtPort_List[i].iPort];
      Label_Title.Tag := ExtPort_List[i].iPort;
      Label_Title.OnClick := Frame_ENV_DoubleComboBox_Title1Label_TitleClick;

      COMBO_1.Label_Key.Caption := arrPortType_OPTION2[COMBO_1.Tag];
      COMBO_1.Hint := 'TYPE3';
      COMBO_1.OnClick := FrameCOMBOClick;

      COMBO_2.Label_Key.Caption := arrPortType_Kit[COMBO_2.Tag];
      COMBO_2.Hint := 'TYPE2';
      COMBO_2.OnClick := FrameCOMBOClick;
    end;

    with (FindComponent('Frame_ExtComboBox_Type' + IntToSTr(i)) as TFrame_ENV_ComboBox) do
    begin
      Tag := ExtPort_List[i].iMachineType;
      Label_Key.Caption := arrExtPrnType_OPTION[Tag];
      Hint := 'TYPE4';
      OnClick := FrameCOMBOClick;
    end;

  end;

  Frame_ComboBox_RecPrnType.Label_Key.Caption := arrRecPrnType_OPTION[RecPrnType];
  Frame_ComboBox_RecPrnType.Tag := RecPrnType;
  Frame_ComboBox_KitPrnType.Label_Key.Caption := arrKitPrnType_OPTION[KitPrnType];
  Frame_ComboBox_KitPrnType.Tag := KitPrnType;
  DM.Image_CheckBOX(StrToInt(BoolToStr(NOT KitDriverPrint)), Frame_CheckBox_KitDriverPrint);
end;

procedure TForm_ENV3_1.FrameCOMBOClick(Sender: TObject);
var
  Result_IS: TResult_IS;
begin
  //
  if NOT(Sender is TFrame_ENV_ComboBox) then
    Exit;

  with (Sender as TFrame_ENV_ComboBox) do
  begin
    if Hint = 'TYPE1' then
    begin
      Result_IS := DM.GetList('장치 유형을 선택해주세요.', arrPortType_OPTION);
    end
    else if Hint = 'TYPE2' then
    begin
      Result_IS := DM.GetList('주방특별 유형을 선택해주세요.', arrPortType_Kit);
    end
    else if Hint = 'TYPE3' then
    begin
      Result_IS := DM.GetList('장치 유형을 선택해주세요.(확장포트)', arrPortType_OPTION2);
    end
    else if Hint = 'TYPE4' then
    begin
      Result_IS := DM.GetList('속도/기종을 선택해주세요.', arrExtPrnType_OPTION);
    end
    else
    begin
      DM.GetPopup(0, '잘못된 요청', '잘못된 요청입니다. 프로그램 업체에 문의해주세요.', '');
      Exit;
    end;

    if Result_IS.Result_int <> -99 then
    begin
      Tag := Result_IS.Result_int;
      Label_Key.Caption := Result_IS.Result_Str;
    end;
  end;
end;


procedure TForm_ENV3_1.Frame_ComboBox_PrnTypeClick(Sender: TObject);
var
  Result_IS: TResult_IS;
  sMSg: String;
begin
  //
  if NOT(Sender is TFrame_ENV_ComboBox) then
    Exit;

  with (Sender as TFrame_ENV_ComboBox) do
  begin
    sMSg := Hint;
    if sMSg = '영수증' then
    begin
      Result_IS := DM.GetList(Hint + ' 속도(or유형)을 선택해주세요.', arrRecPrnType_OPTION);
    end
    else
    begin
      Result_IS := DM.GetList(Hint + ' 속도(or유형)을 선택해주세요.', arrKitPrnType_OPTION);
    end;

    if Result_IS.Result_int <> -99 then
    begin
      Tag := Result_IS.Result_int;
      Label_Key.Caption := Result_IS.Result_Str;
    end;
  end;
end;

procedure TForm_ENV3_1.Frame_ENV_DoubleComboBox_Title1Label_TitleClick(Sender: TObject);
var
  Result_IS: TResult_IS;
begin
  with (Sender as TLabel) do
  begin
    Result_IS := DM.GetList(Hint + ' 포트를 선택해주세요.', ExtPortList);
    if Result_IS.Result_int <> -99 then
    begin
      Tag := Result_IS.Result_int;
      Caption := Hint + Result_IS.Result_Str;
    end;
  end;
end;

end.
