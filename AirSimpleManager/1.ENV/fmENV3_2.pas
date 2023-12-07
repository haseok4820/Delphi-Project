unit fmENV3_2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, uDM, inifiles,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Frame_Nav,
  Frame_ComboBox, Frame_CheckBox_Prn, Frame_Edit, Frame_CheckBox, Frame_YN;

type

  TForm_ENV3_2 = class(TForm)
    ScrollBox_Main: TScrollBox;
    Label_Title: TLabel;
    GroupBox1_Type: TGroupBox;
    Panel_Manage: TPanel;
    Panel_PrnType: TPanel;
    Shape_Hide1: TShape;
    Frame_ComboBox_PrnType: TFrame_ENV_ComboBox;
    Frame_Edit_prnCnt: TFrame_ENV_Edit;
    Frame_Edit_title: TFrame_ENV_Edit;
    Panel_Margin: TPanel;
    Frame_Edit_Bot: TFrame_ENV_Edit;
    Frame_Edit_Top: TFrame_ENV_Edit;
    Button_Preview1: TButton;
    GroupBox2_Option: TGroupBox;
    ScrollBox_PrnOption: TScrollBox;
    Panel_Header: TPanel;
    Button_Preview2: TButton;
    Frame_ComboBox_PrnOption: TFrame_ENV_ComboBox;
    Panel_Right: TPanel;
    Label_guideText: TLabel;
    Memo_Bigo: TMemo;
    Label_GuideText2: TLabel;
    Frame_ComboBox_Option: TFrame_ENV_ComboBox;
    Shape1: TShape;
    GroupBox1: TGroupBox;
    Frame_CheckBox_BCPaper: TFrame_ENV_CheckBox;
    Frame_CheckBox_recCardSlip: TFrame_ENV_CheckBox;
    procedure FormShow(Sender: TObject);
    procedure Frame_ComboBox_PrnTypeClick(Sender: TObject); // �������
    procedure Frame_ComboBox_PrnOptionClick(Sender: TObject); // �ɼ� ����Ʈ
    procedure Frame_ComboBox_PrnOption2Click(Sender: TObject);
    procedure Timer_PreviewExecuteChkTimer(Sender: TObject);
    procedure Button_Preview1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure GetPrnInfo(iReqType: Integer); // ������� �ɼ� (��¼���, ����, Ÿ��Ʋ ��)
    procedure GetPrnOptionList(iReqType: Integer); // ��������� ����Ʈ(�μ�����, Ȯ������ ��)
    procedure SetPrnInfo(iReqType: Integer); // ������ ����
    procedure SetPreView; // �̸����� ����
    procedure PreViewSendMsg(iType: Byte); // �̸����� ǥ������ ����ó��
    procedure PrnIni(iType: Integer); // �̸����� ������ ini ó��

  public
    { Public declarations }
  end;

var
  Form_ENV3_2: TForm_ENV3_2;
  bPreviewChk: Boolean;

  Select_PrtType: Byte;
  PreViewLine: String;
  PreViewHandle: THandle;

implementation

{$R *.dfm}

uses uMain;

procedure TForm_ENV3_2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PreViewHandle := FindWindow(nil, PChar('�μ� �̸�����'));
  if PreViewHandle <> 0 then
  begin
    PreViewSendMsg(0);
  end;
  SetPrnInfo(Frame_ComboBox_PrnOption.Tag);

  recCardSlip := Frame_CheckBox_recCardSlip.Tag <> 0;
  BCPaper := Frame_CheckBox_BCPaper.Tag <> 0;
end;

procedure TForm_ENV3_2.FormShow(Sender: TObject);
begin
  Button_Preview1.Visible := True;
  Button_Preview2.Visible := True;
  Select_PrtType := 0;
  GetPrnInfo(0);

  DM.Image_CheckBOX(StrToInt(BoolToStr(NOT recCardSlip)), Frame_CheckBox_recCardSlip);
  DM.Image_CheckBOX(StrToInt(BoolToStr(NOT BCPaper)), Frame_CheckBox_BCPaper);
end;

procedure TForm_ENV3_2.Button_Preview1Click(Sender: TObject);
begin
  SetPrnInfo(Frame_ComboBox_PrnOption.Tag);
  PrnIni(Select_PrtType);
  SetPreView;
  PreViewSendMsg(1);
end;

procedure TForm_ENV3_2.Frame_ComboBox_PrnOption2Click(Sender: TObject);
var
  Result_IS: TResult_IS;
begin
  //
  with (Sender as TFrame_ENV_ComboBox) do
  begin
    case Select_PrtType of
      0: // ������
        begin
          Result_IS := DM.GetList('������ ���� ����� �������ּ���.', arrRecType);
        end;
      1: // ���ֹ���
        begin
          Result_IS := DM.GetList('���ֹ��� ���� ������ �������ּ���.', arrYN);
        end;
      2: // �ֹ��ֹ���
        begin
          Result_IS := DM.GetList('�ֹ� Ȯ�� ����� �������ּ���.', arrKitExtType);
        end;
    end;

    if Result_IS.Result_int <> -99 then
    begin
      Tag := Result_IS.Result_int;
      Label_Key.Caption := Result_IS.Result_Str;
    end;
  end;

end;

procedure TForm_ENV3_2.Frame_ComboBox_PrnOptionClick(Sender: TObject);
var
  Result_IS: TResult_IS;
  arrPrnOptionList: array [0 .. 1] of String;
begin
  if Select_PrtType = 1 then
    Exit;

  arrPrnOptionList[0] := '�μ�����';
  arrPrnOptionList[1] := 'Ȯ������';
  with (Sender as TFrame_ENV_ComboBox) do
  begin
    Result_IS := DM.GetList('�����Ͻ� �۾��� �������ּ���.', arrPrnOptionList);
    if Result_IS.Result_int <> -99 then
    begin
      SetPrnInfo(Frame_ComboBox_PrnOption.Tag);
      Tag := Result_IS.Result_int;
      Label_Key.Caption := Result_IS.Result_Str;
      GetPrnOptionList(Tag);
    end;
  end;
end;

procedure TForm_ENV3_2.Frame_ComboBox_PrnTypeClick(Sender: TObject);
var
  Result_IS: TResult_IS;
begin
  // ��� ���� ǥ�� ������, �ֹ��ֹ���, ���ֹ���&��ȯ��
  with (Sender as TFrame_ENV_ComboBox) do
  begin
    Result_IS := DM.GetList('��������� �������ּ���.', arrPrnList);
    if Result_IS.Result_int <> -99 then
    begin
      SetPrnInfo(Frame_ComboBox_PrnOption.Tag);

      Select_PrtType := Result_IS.Result_int;
      Tag := Result_IS.Result_int;
      Label_Key.Caption := Result_IS.Result_Str;
      if FindWindow(nil, PChar('�μ� �̸�����')) <> 0 then
        PreViewSendMsg(1);
      GetPrnInfo(Select_PrtType);
    end;
  end;
end;

procedure TForm_ENV3_2.GetPrnOptionList(iReqType: Integer);
var
  i_Low, i_High: Byte;
  i: Integer;
  sCaption: String;
  bBool: Boolean;
begin

  // 0 : �μ�����, 1 : Ȯ������
  with ScrollBox_PrnOption do
  begin
    if ScrollBox_PrnOption.ControlCount <> 0 then
    begin
      for i := ControlCount - 1 Downto 0 do
      begin
        if Controls[i] is TFrame_ENV_CheckBox then
          (Controls[i] as TFrame_ENV_CheckBox).Free;
      end;
    end;

  end;

  with arrPrnOptionList[Select_PrtType] do
  begin
    case iReqType of
      0:
        begin
          i_Low := Low(BS_Prn);
          i_High := High(BS_Prn);
        end;
      1:
        begin
          i_Low := Low(BS_Ext);
          i_High := High(BS_Ext);
        end;
    else
      Exit;
    end;

    for i := i_Low to i_High do
    begin
      bBool := False;
      with TFrame_ENV_CheckBox.Create(Self) do
      begin
        Parent := ScrollBox_PrnOption;
        Align := alBottom;
        Name := 'Frame_CheckBox_Prn' + IntToStr(i);

        case iReqType of
          0:
            begin
              bBool := BS_Prn[i].Result_Bool;
              sCaption := BS_Prn[i].Result_Str;

              Hint := 'BS_Prn';
            end;
          1:
            begin
              bBool := BS_Ext[i].Result_Bool;
              sCaption := BS_Ext[i].Result_Str;

              Hint := 'BS_Ext';
            end;
        end;

        if bBool then
          Tag := 1
        else
          Tag := 0;

        with Image_Check do
        begin
          Width := 38;
          if bBool then
          begin
            Tag := 1;
            Picture.LoadFromFile(IMG_PATH + 'Check_ON.png');
          end
          else
          begin
            Tag := 0;
            Picture.LoadFromFile(IMG_PATH + 'Check_OFF.png');
          end;
        end;

        with Label_MSG do
        begin
          Caption := sCaption;
        end;
        Height := 48;

        Align := alTop;
      end;
    end;
  end;
end;

procedure TForm_ENV3_2.GetPrnInfo(iReqType: Integer);
var
  i: Byte;
begin
  i := 0;
  Frame_ComboBox_PrnOption.OnClick := Frame_ComboBox_PrnOptionClick;
  case Select_PrtType of
    0:
      begin
        i := 10;
        Memo_Bigo.Visible := True;
        Label_guideText.Visible := True;
        Frame_Edit_prnCnt.Visible := True;
        Shape_Hide1.Visible := True;
        Label_GuideText2.Caption := '- ������ ��������';
        Frame_ComboBox_Option.Label_Key.Caption := arrRecType[ReceiptPrn];
        Frame_ComboBox_Option.Tag := ReceiptPrn;
      end;
    1:
      begin
        i := 10;
        Memo_Bigo.Visible := False;
        Label_guideText.Visible := False;
        Shape_Hide1.Visible := False;
        Frame_Edit_prnCnt.Visible := False;

        Label_GuideText2.Caption := '- ���ֹ��� ��������';

        if UseggPrn then

          Frame_ComboBox_Option.Label_Key.Caption := arrYN[1]
        else
          Frame_ComboBox_Option.Label_Key.Caption := arrYN[0];
        Frame_ComboBox_Option.Tag := StrToIntDef(BoolToStr(UseggPrn), 0);

        Frame_ComboBox_PrnOption.Tag := 0;
        Frame_ComboBox_PrnOption.Label_Key.Caption := '�μ����� ����Ʈ';
        Frame_ComboBox_PrnOption.OnClick := nil;
      end;
    2:
      begin
        i := 4;
        Memo_Bigo.Visible := True;
        Label_guideText.Visible := True;

        Frame_Edit_prnCnt.Visible := True;
        Shape_Hide1.Visible := True;
        Label_GuideText2.Caption := '- �ֹ�/��ȯ�� Ȯ����Ʈ ������';
        Frame_ComboBox_Option.Label_Key.Caption := arrKitExtType[KitFontSize];
        Frame_ComboBox_Option.Tag := KitFontSize;
      end;
  end;
  Label_guideText.Caption := '-' + arrPrnList[Select_PrtType] + ' �ϴܹ��� (�ִ� ' + IntToStr(i) + '��)';

  with arrPrnOptionList[iReqType] do
  begin
    Frame_Edit_title.Edit_Value.Text := sTitle;
    Frame_Edit_prnCnt.Edit_Value.Text := IntToStr(iPrnCnt);
    Frame_Edit_Top.Edit_Value.Text := IntToStr(iTop_Len);
    Frame_Edit_Bot.Edit_Value.Text := IntToStr(iBot_Len);
    Memo_Bigo.Text := slMemo.Text;
  end;

  Select_PrtType := iReqType;
  GetPrnOptionList(Frame_ComboBox_PrnOption.Tag);
end;

procedure TForm_ENV3_2.PreViewSendMsg(iType: Byte);
var
  cds: TCopyDataStruct;
begin
  //
  try
    PreViewHandle := FindWindow(nil, PChar('�μ� �̸�����'));

    if PreViewHandle <> 0 then
    begin
      with cds do
      begin
        dwData := 0;
        cbData := (Length(IntToStr(iType)) * Sizeof(char)) + 1;
        lpData := PChar(IntToStr(iType));
        SetForegroundWindow(PreViewHandle);
      end;
      SendMessage(PreViewHandle, WM_COPYDATA, Application.Handle, Integer(@cds));
    end
    else
    begin
      SetPreView;
    end;
  except
    On E: Exception do
    begin
    end;
  end;
end;

procedure TForm_ENV3_2.SetPrnInfo(iReqType: Integer);
var
  i: Integer;
begin
  with arrPrnOptionList[Select_PrtType] do
  begin
    sTitle := Frame_Edit_title.Edit_Value.Text;
    iTop_Len := StrToIntDef(Frame_Edit_Top.Edit_Value.Text, iTop_Len);
    iBot_Len := StrToIntDef(Frame_Edit_Bot.Edit_Value.Text, iBot_Len);

    if Select_PrtType in [0, 2] then
    begin
      iPrnCnt := StrToIntDef(Frame_Edit_prnCnt.Edit_Value.Text, iPrnCnt);
      slMemo.Text := Memo_Bigo.Text;
    end
    else
    begin
      iPrnCnt := 0;
      slMemo.Clear;
    end;

    case Select_PrtType of
      0:
        begin
          ReceiptPrn := Frame_ComboBox_Option.Tag;
        end;
      1:
        begin
          UseggPrn := Frame_ComboBox_Option.Tag <> 0;
        end;
      2:
        begin
          KitFontSize := Frame_ComboBox_Option.Tag;
        end;
    end;

    case iReqType of
      0: // �μ�����
        begin
          for i := Low(BS_Prn) to High(BS_Prn) do
            BS_Prn[i].Result_Bool := (FindComponent('Frame_CheckBox_Prn' + IntToStr(i)) as TFrame_ENV_CheckBox).Tag <> 0;
        end;
      1: // Ȯ������
        begin
          for i := Low(BS_Ext) to High(BS_Ext) do
            BS_Ext[i].Result_Bool := (FindComponent('Frame_CheckBox_Prn' + IntToStr(i)) as TFrame_ENV_CheckBox).Tag <> 0;
        end;
    end;

  end;
end;

procedure TForm_ENV3_2.PrnIni(iType: Integer);
const
  Airpos_Seaction = 'AIRPOS';
var
  j: Integer;
  ini: TiniFile;
begin
  //
  ini := TiniFile.Create('.\Prn_Sample.ini');
  try
    with arrPrnOptionList[Select_PrtType] do
    begin
      ini.WriteInteger('PREVIEW', 'VIEWTYPE', iType);

      ini.WriteString('AIRPOS', 'GMZNM', StoreName);
      ini.WriteString('AIRPOS', 'GRegNo', StoreSeq);
      ini.WriteString('AIRPOS', 'gBoss', StoreOwner);
      ini.WriteString('AIRPOS', 'gAddr1', StoreAddr1);
      ini.WriteString('AIRPOS', 'gAddr2', StoreAddr2);
      ini.WriteString('AIRPOS', 'GTelNO', StoreTel);

      ini.WriteString(Airpos_Seaction, 'PrnTitle' + IntToStr(iType + 1), sTitle);
      case iType of
        0, 1: // ������
          begin
            for j := Low(BS_Prn) to High(BS_Prn) do
            begin
              case j of
                0 .. 7:
                  begin
                    ini.WriteString(Airpos_Seaction, 'recPrn' + IntToStr(j + 1), BoolToStr(BS_Prn[j].Result_Bool));
                  end;
                8:
                  begin
                    ini.WriteString(Airpos_Seaction, 'RecOrdNoUpPrn', BoolToStr(BS_Prn[j].Result_Bool));
                  end;
                9:
                  begin
                    ini.WriteString(Airpos_Seaction, 'RecOrdNoDownPrn', BoolToStr(BS_Prn[j].Result_Bool));
                  end;
              end;
            end;

            for j := Low(BS_Ext) to High(BS_Ext) do
              ini.WriteString(Airpos_Seaction, 'RecFnt' + IntToStr(j + 1), BoolToStr(BS_Ext[j].Result_Bool));

            for j := 1 to 10 do
            begin
              if (j) > slMemo.Count then
                ini.WriteString(Airpos_Seaction, 'r_Bigo' + IntToStr(j), '')
              else
                ini.WriteString(Airpos_Seaction, 'r_Bigo' + IntToStr(j), slMemo[j - 1]);
            end;

            // ���ֹ���
            if iType = 1 then
            begin
              ini.WriteInteger('AIRPOS', 'hggTopCnt', iTop_Len);
              ini.WriteInteger('AIRPOS', 'hggBotCnt', iBot_Len);
              ini.WriteBool('AIRPOS', 'ggprnnogmz', BS_Prn[0].Result_Bool);
              ini.WriteBool('AIRPOS', 'ggRecBigo', BS_Prn[1].Result_Bool);
            end;
          end;
        2: // �ֹ��ֹ���
          // 50 50 16.5 10 6 5
          begin
            ini.WriteInteger('AIRPOS', 'KitFontSize', KitFontSize);

            for j := Low(BS_Prn) to High(BS_Prn) do
            begin
              case j of
                0 .. 5, 9:
                  begin
                    ini.WriteString(Airpos_Seaction, 'ordPrn' + IntToStr(j + 1), BoolToStr(BS_Prn[j].Result_Bool));
                  end;
                6:
                  begin
                    ini.WriteString(Airpos_Seaction, 'KitOrdNoPrn', BoolToStr(BS_Prn[j].Result_Bool));
                  end;
                7:
                  begin
                    ini.WriteString(Airpos_Seaction, 'kitOrdNoUpPrn', BoolToStr(BS_Prn[j].Result_Bool));
                  end;
                8:
                  begin
                    ini.WriteString(Airpos_Seaction, 'kitOrdNoDownPrn', BoolToStr(BS_Prn[j].Result_Bool));
                  end;
              end;
            end;

            for j := Low(BS_Ext) to High(BS_Ext) do
            begin
              ini.WriteString(Airpos_Seaction, 'OrdFnt' + IntToStr(j + 1), BoolToStr(BS_Ext[j].Result_Bool));
            end;
            for j := 1 to 4 do
            begin
              if (j) > slMemo.Count then
                ini.WriteString(Airpos_Seaction, 'kit_Bigo' + IntToStr(j), '')
              else
                ini.WriteString(Airpos_Seaction, 'kit_Bigo' + IntToStr(j), slMemo[j - 1]);
            end;
          end;
      end;
    end;

  finally
    ini.Free;
  end;
end;

procedure TForm_ENV3_2.SetPreView;
begin
  //
  PreViewHandle := FindWindow(nil, PChar('�μ� �̸�����'));
  if DM.ControlProgram(2, 'Project_PreView.exe').Result_int = 0 then
  begin
    if DM.ControlProgram(0, 'Project_PreView.exe').Result_int = 0 then
    begin
      DM.GetPopup(1, '������ �̸����� ó���ȵ�1', '������ �̸����� ������ �Ұ��մϴ�. ������Ʈ �� �ٽ� �õ����ּ���.', '');
      bPreviewChk := False;
    end;
  end;
end;

procedure TForm_ENV3_2.Timer_PreviewExecuteChkTimer(Sender: TObject);
begin
  PreViewHandle := FindWindow(nil, PChar('�μ� �̸�����'));
  if PreViewHandle = 0 then
  begin
    if DM.ControlProgram(0, 'Project_PreView.exe').Result_int = 0 then
    begin
      DM.GetPopup(1, '������ �̸����� ó���ȵ�3', '������ �̸����� ������ �Ұ��մϴ�. ������Ʈ �� �ٽ� �õ����ּ���.', '');
      Exit;
    end
  end;
end;

end.
