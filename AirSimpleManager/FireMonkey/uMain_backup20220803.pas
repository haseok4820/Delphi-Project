unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, FMX.Platform.Win,
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, iniFiles,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts,
  FMX.ScrollBox, FMX.Memo;

type
  TPreviewInfo = record
    sText: String; // ��� ���ڿ�
    iScale: Byte;
    { Ȯ�� ������
      0 : 1X1,
      1 : 2X2,
      2 : 2X1,
      3 : 1X2
    }
  end;

  TForm_SMPreview = class(TForm)
    ScrollBox_Parent: TScrollBox;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    Memo_Test: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure RadioButton3Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Label_MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure Label_MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure Label_MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Single);

  private
    { Private declarations }
    procedure PreviewClear; // �̸����� �ʱ�ȭ
    procedure PreviewSet(iType: Byte); // �̸����� �� ����

    function iniInfo_Get(iType: Byte): Integer;
    procedure InstallFont(iType: Byte);
    function MenuFormat(str1, str2, str3, str4: String): String;
    function PrnFormat(int_Align: Byte; str: String): String;

  public
    { Public declarations }
    function ShowMSG(str: String): Boolean;
    function WndProc(HWND: HWND; Msg: UINT; wParam: wParam; lParam: lParam): LResult;
  end;

const
  sLF = #13#10;
  sPreview_FontName = 'D2Coding';

var
  FormHandle: HWND;
  NewWndProc: Long;

  bScroll: Boolean;
  iScroll_Y: Single;

  Form_SMPreview: TForm_SMPreview;
  arr_PreviewList: array of TPreviewInfo;
  sl_PrnText: TStringList;
  arr_Prn: array of Boolean;
  arr_PrnExtend: array of Boolean;
  iNum: Byte;

  Egg: String;
  GMZName, GMZSeqNO, GMZOwner, GMZAddr1, GMZAddr2, GMZTel: String;

  TitleRecp, TitleKit, TitleOrder: String;
  PrnMemo, PrnKitMemo: array [1 .. 10] of String;

  int_ExtendSize, int_LineCnt: Byte; // ���Ȯ�� ������,  ���κ� ��� ���ڼ�
  str_Line: String;

implementation

{$R *.fmx}
{$R *.Surface.fmx MSWINDOWS}
{$R *.Windows.fmx MSWINDOWS}

{ TForm_SMPreview }
function WindowProc(HWND: HWND; Msg: UINT; wParam: wParam; lParam: lParam): LResult; stdcall;
begin
  Result := Form_SMPreview.WndProc(HWND, Msg, wParam, lParam);
end;

function TForm_SMPreview.WndProc(HWND: HWND; Msg: UINT; wParam: wParam; lParam: lParam): LResult;
var
  RecvMsg: String;
begin
  Result := 0;
  if Msg = WM_COPYDATA then
  begin
    RecvMsg := PChar(PCopyDataStruct(lParam)^.lpData);
    PreviewClear;
    PreviewSet(StrToIntDef(RecvMsg, 0));
  end;

  Result := CallWindowProc(Ptr(NewWndProc), HWND, Msg, wParam, lParam);
end;

procedure TForm_SMPreview.FormCreate(Sender: TObject);
begin
  FormHandle := FmxHandleToHWND(Handle);
  NewWndProc := GetWindowLongPtr(FormHandle, GWL_WNDPROC);
  SetWindowLongPtr(FormHandle, GWL_WNDPROC, NativeInt(@WindowProc));
end;

procedure TForm_SMPreview.FormDestroy(Sender: TObject);
begin
  SetWindowLongPtr(FormHandle, GWL_WNDPROC, NewWndProc);
  InstallFont(0);
end;

procedure TForm_SMPreview.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  Egg := Egg + KeyChar;
end;

procedure TForm_SMPreview.FormShow(Sender: TObject);
begin
{$IFDEF DEBUG}
  GroupBox1.Visible := True;
{$ENDIF}
  InstallFont(1);
  PreviewClear;
  PreviewSet(255);
end;

procedure TForm_SMPreview.Label_MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  bScroll := True;
  iScroll_Y := Screen.MousePos.Y;
end;

procedure TForm_SMPreview.Label_MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Single);
var
  iLabelTop, iMove, iMouse: Single;

begin

  iLabelTop := 60;
  iMouse := Screen.MousePos.Y;

  if (iLabelTop + iMouse <= Form_SMPreview.Top) OR (iLabelTop + iMouse >= (Form_SMPreview.Top + Form_SMPreview.Height))
  then
    bScroll := False;

  if bScroll then
  begin
    iMove := iMouse - iScroll_Y;
    if iMove < 0 then
      iMove := -5
    else if iMove > 0 then
      iMove := 5;
    ScrollBox_Parent.ScrollBy(0, iMove);

  end;
end;

procedure TForm_SMPreview.Label_MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  bScroll := False;
end;

function TForm_SMPreview.iniInfo_Get(iType: Byte): Integer;
var
  ini: Tinifile;
  i, j: Byte;
begin
  //
  iNum := 0;
  ini := Tinifile.Create('.\Prn_Sample.ini');
  try

    with ini do
    begin
      if iType = 255 then
        iType := ReadInteger('PREVIEW', 'ViewType', 0);

      GMZName := ReadString('AIRPOS', 'GMZNM', '(��)��������');
      GMZSeqNO := ReadString('AIRPOS', 'GRegNo', '214-87-26177');
      GMZOwner := ReadString('AIRPOS', 'gBoss', 'õ����');
      GMZAddr1 := ReadString('AIRPOS', 'gAddr1', '����� �������� ���η� 775');
      GMZAddr2 := ReadString('AIRPOS', 'gAddr2', '���̽�������ũ��Ƽ 1�� 721ȣ');
      GMZTel := ReadString('AIRPOS', 'GTelNO', '02-1588-9218');

      TitleRecp := ReadString('AIRPOS', 'PrnTitle1', '< �� �� �� >');
      TitleOrder := ReadString('AIRPOS', 'PrnTitle2', '< �� �� �� �� �� >');
      TitleKit := ReadString('AIRPOS', 'PrnTitle3', '< �� �� �� �� �� >');

      int_LineCnt := ReadInteger('AIRPOS', 'RecColCnt', 40);
      str_Line := '--------------------------------------------------';
      str_Line := Copy(str_Line, 1, int_LineCnt);

      int_ExtendSize := ReadInteger('AIRPOS', 'KitFontSize', 0);

      if iType = 0 then
        int_ExtendSize := 0;
      { [ 0 : 1 X 2 ], [ 1 : 2 X 1 ], [ 2 : 2 X 2 ] }

      if iType in [0, 2] then
      begin
        // ������/�ֹ� �ϴܹ���
        for i := 1 to 10 do
        begin
          if (iType = 0) AND (ini.ValueExists('AIRPOS', 'r_Bigo' + IntTostr(i))) then
            PrnMemo[i] := ReadString('AIRPOS', 'r_Bigo' + IntTostr(i), '');

          if (iType = 2) AND (ini.ValueExists('AIRPOS', 'kit_Bigo' + IntTostr(i))) then
            PrnKitMemo[i] := ReadString('AIRPOS', 'kit_Bigo' + IntTostr(i), '');
        end;
      end;

      case iType of
        0: // ������
          begin
            SetLength(arr_Prn, 10);
            SetLength(arr_PrnExtend, 8);

            // �μ�����
            for i := Low(arr_Prn) to High(arr_Prn) do
            begin
              case i of
                0 .. 7:
                  begin
                    arr_Prn[i] := ReadBool('AIRPOS', 'recPrn' + IntTostr(i + 1), True);
                  end;
                8:
                  begin
                    arr_Prn[i] := ReadBool('AIRPOS', 'RecOrdNoUpPrn', False);
                  end;
                9:
                  begin
                    arr_Prn[i] := ReadBool('AIRPOS', 'RecOrdNoDownPrn', False);
                  end;
              end;
            end;

            // Ȯ������
            for i := Low(arr_PrnExtend) to High(arr_PrnExtend) do
              arr_PrnExtend[i] := ReadBool('AIRPOS', 'RecFnt' + IntTostr(i + 1), True);
          end;
        1:
          begin

          end;
        2: // ���ֹ���, �ֹ��ֹ���, ��ȯ��
          begin
            SetLength(arr_Prn, 10);
            SetLength(arr_PrnExtend, 9);

            // �μ�����
            for i := Low(arr_Prn) to High(arr_Prn) do
            begin
              case i of
                0 .. 5, 9:
                  begin
                    arr_Prn[i] := ReadBool('AIRPOS', 'ordPrn' + IntTostr(i + 1), True);
                  end;
                6:
                  begin
                    arr_Prn[i] := ReadBool('AIRPOS', 'KitOrdNoPrn', False);
                  end;
                7:
                  begin
                    arr_Prn[i] := ReadBool('AIRPOS', 'kitOrdNoUpPrn', False);
                  end;
                8:
                  begin
                    arr_Prn[i] := ReadBool('AIRPOS', 'kitOrdNoDownPrn', False);
                  end;
              end;
            end;

            // Ȯ������
            for i := Low(arr_PrnExtend) to High(arr_PrnExtend) do
            begin
              case i of
                0 .. 7:
                  begin
                    arr_PrnExtend[i] := ReadBool('AIRPOS', 'ordfnt' + IntTostr(i + 1), True);
                  end;
                8:
                  begin
                    arr_PrnExtend[i] := ReadBool('AIRPOS', 'ordfnt10', True);
                  end;
              end;
            end;

          end;
      end;
    end;
  finally
    ini.Free;
    Result := iType;
  end;
end;

procedure TForm_SMPreview.InstallFont(iType: Byte);
begin
  // ������ ��Ʈ ��ġ ( D2Coding )
  if iType = 1 then
  begin
    if FileExists('Font\D2Coding.ttf') then
    begin
      AddFontResource(PChar('Font\D2Coding.ttf'));
    end
    else
    begin
      ShowMSG('������ ��Ʈ�� ã�� �� �����ϴ�.' + #13#10 + '���α׷� ������Ʈ �� �ٽ� �õ����ּ���.');
    end;
  end
  else
  begin
    RemoveFontResource(PChar('\Font\D2Coding.fft'));
  end;
  SendMessage(HWND_BROADCAST, WM_FONTCHANGE, 0, 0);
end;

function TForm_SMPreview.MenuFormat(str1, str2, str3, str4: String): String;
var
  iAnsi, iWide: Byte;
  iVal: array [0 .. 3] of Byte;
  i: Byte;
begin
  //
  for i := Low(iVal) to High(iVal) do
  begin
    case i of
      0:
        begin
          iAnsi := Length(AnsiString(str1));
          iWide := Length(str1);
        end;
      1:
        begin
          iAnsi := Length(AnsiString(str2));
          iWide := Length(str2);
        end;
      2:
        begin
          iAnsi := Length(AnsiString(str3));
          iWide := Length(str3);
        end;
      3:
        begin
          iAnsi := Length(AnsiString(str4));
          iWide := Length(str4);
        end;
    end;

    iVal[i] := iAnsi - iWide;
  end;

  Result := format('%-' + IntTostr((int_LineCnt div 2) - iVal[0]) + 's', [str1]) +
    format('%' + IntTostr(4 - iVal[1]) + 's', [str2]) + format('%' + IntTostr(8 - iVal[2]) + 's', [str3]) +
    format('%' + IntTostr(int_LineCnt - ((int_LineCnt div 2) + 12) - iVal[3]) + 's', [str4]) + sLF;

end;

procedure TForm_SMPreview.PreviewClear;
var
  i: Integer;
begin
  //
  if ScrollBox_Parent.ComponentCount <> 0 then
  begin
    for i := ScrollBox_Parent.ComponentCount - 1 Downto 0 do
    begin
      if ScrollBox_Parent.Components[i] is TLabel then
        (ScrollBox_Parent.Components[i] as TLabel).Free;
    end;
  end;

end;

procedure TForm_SMPreview.PreviewSet(iType: Byte);
var
  i, j: Integer;
  slList: TStringList;
begin
  //
  iType := iniInfo_Get(iType);
  try
    slList := TStringList.Create;

    for i := Low(arr_Prn) to High(arr_Prn) do
    begin
      if arr_Prn[i] = False then
        Continue;

      with TLabel.Create(Self) do
      begin
        Align := TAlignLayout.Bottom;
        WordWrap := True;
        Parent := ScrollBox_Parent;
        Visible := True;
        Name := 'Label_PreView' + IntTostr(i);
        Tag := i;
        HitTest := True;

        OnMouseDown := Label_MouseDown;
        OnMouseMove := Label_MouseMove;
        OnMouseUp := Label_MouseUp;

        Align := TAlignLayout.Top;
        with TextSettings do
        begin
          WordWrap := True;
          Font.Family := 'D2Coding';
          Font.Size := 16;
        end;

        Text := '';
        case iType of
          0: // ������
            begin
              case i of
                0:
                  begin
                    // Ÿ��Ʋ
                    Text := PrnFormat(2, TitleRecp);
                  end;
                1: // ��������
                  begin
                    Text := GMZName + sLF;
                    Text := Text + format('%-14s', [GMZSeqNO]) + format('%-8s', [GMZOwner]) + 'T.' + GMZTel + sLF;
                    Text := Text + GMZAddr1 + sLF + GMZAddr2 + sLF;
                  end;
                2: // ������ ��ȣ
                  begin
                    Text := 'S.No  : ' + FormatDateTime('YYMMDD', NOW) + '01001';
                  end;
                3: // ���̺��
                  begin

                  end;
                4: // �ο�
                  begin
                    Text := '';
                  end;
                5: // �޴�
                  begin
                    Text := str_Line + sLF + MenuFormat('��ǰ��', '����', '�ܰ�', '�� ��') + str_Line + sLF;
                    Text := Text + MenuFormat('ICE�Ƹ޸�ī��', '4', '500', '2000');
                    Text := Text + MenuFormat('(S)���߰�', '4', '300', '1200');
                    Text := Text + MenuFormat('HOTī���', '1', '1000', '1000');
                    Text := Text + str_Line;
                    Text := Text + PrnFormat(1, '�ֹ����� :        9');
                    Text := Text + PrnFormat(1, '�����հ� :        0');
                    Text := Text + PrnFormat(1, 'Sub Total :     4200');
                    Text := Text + str_Line;
                    Text := Text + PrnFormat(1, '�հ�ݾ� :     4200');
                    Text := Text + PrnFormat(1, '�� �� �� :        0');
                    Text := Text + str_Line;
                    Text := Text + '������� : ī��' + sLF;
                    Text := Text + '�Ǹ��Ͻ� : ' + FormatDateTime('YYYY-MM-DD HH:MM', NOW);
                  end;
                6: // �ֹ���(�����)
                  begin
                    Text := '�� �� �� : ������' + sLF;
                  end;
                8: // ��� �ֹ���ȣ
                  begin
                    Align := TAlignLayout.MostTop;
                    Text := str_Line + sLF + '�ֹ���ȣ : 29' + sLF + str_Line;
                  end;
                9: // �ϴ� �ֹ���ȣ
                  begin
                    Text := str_Line + sLF + '�ֹ���ȣ : 29' + sLF + str_Line;
                  end;
                10:
                  begin
                    // ������ �ϴܹ���
                    Text := '';
                    for j := Low(PrnMemo) to High(PrnMemo) do
                    begin
                      Text := Text + PrnMemo[j];
                    end;
                  end;
              end;
            end;
          1: // ���ֹ���
            begin

            end;
          2: // �ֹ��ֹ���
            begin
              case i of
                0:
                  begin
                    // Ÿ��Ʋ
                    Text := PrnFormat(2, TitleKit);
                  end;
                1:
                  begin
                    // ���̺��
                  end;
                2:
                  begin
                    // POS��ȣ
                    Text := '������ȣ : 1';
                  end;
                3:
                  begin
                    // ��½ð�
                    Text := FormatDateTime('YYYY-MM-DD HH:MM:SS', NOW);
                  end;
                4:
                  begin
                    // �ο�
                  end;
                5:
                  begin
                    // �ֹ���(�����)
                    Text := '�ֹ��� : ������';
                  end;
                6:
                  begin
                    // �ֹ���ȣ

                  end;
                7:
                  begin
                    // �ֹ���ȣ (�ϴ�)
                    Text := str_Line + sLF + '�ֹ���ȣ : 29' + sLF + str_Line;
                  end;
                8:
                  begin
                    // �ֹ���ȣ(���)
                    Align := TAlignLayout.MostTop;
                    Text := str_Line + sLF + '�ֹ���ȣ : 29' + sLF + str_Line;
                  end;
              end;

            end;
        end;

        case arr_PreviewList[i].iScale of
          0:
            begin
              Scale.X := 1;
              Scale.Y := 1;
              Height := 20;
            end;
          1:
            begin
              Scale.X := 2;
              Scale.Y := 2;
              Height := 22;
            end;
          2:
            begin
              Scale.X := 2;
              Scale.Y := 1;
              Height := 20;
            end;
          3:
            begin
              Scale.X := 1;
              Scale.Y := 2;
              Height := 22;
            end;
        end;

      end;

    end;
  finally
    slList.Free;
  end;

  {
    iType := iniInfo_Get(iType);

    SetLength(arr_PreviewList, 0);
    SetLength(arr_PreviewList, 50);

    for i := Low(arr_PreviewList) to High(arr_PreviewList) do
    arr_PreviewList[i].iScale := 0;
    case iType of
    0: // ������
    begin
    PreViewSetText(str_Line);

    // �ֹ���ȣ ���
    if bOrdNoUpPrn then
    begin
    PreViewSetText('�ֹ���ȣ: 14820');
    if arr_PrnExtend[0] then
    arr_PreviewList[iNum - 1].iScale := int_ExtendSize;
    end;

    PreViewSetText(str_Line);

    // Ÿ��Ʋ
    if arr_Prn[1] then
    begin
    PreViewSetText(PrnFormat(2, TitleRecp));
    if arr_PrnExtend[0] then
    arr_PreviewList[iNum - 1].iScale := int_ExtendSize;
    end;

    // ��������
    if arr_Prn[2] then
    begin
    PreViewSetText(GMZName);
    if arr_PrnExtend[0] then
    arr_PreviewList[iNum - 1].iScale := 3;

    PreViewSetText(format('%12s', [GMZSeqNO]) + '  ' + GMZOwner);
    if arr_PrnExtend[0] then
    arr_PreviewList[iNum - 1].iScale := 3;

    PreViewSetText(GMZAddr1);
    if arr_PrnExtend[0] then
    arr_PreviewList[iNum - 1].iScale := 3;

    PreViewSetText(GMZAddr2);
    if arr_PrnExtend[0] then
    arr_PreviewList[iNum - 1].iScale := 3;
    end;

    // ������ ��ȣ
    if arr_Prn[3] then
    begin
    PreViewSetText('S.No  : ' + formatDateTime('YYMMDD-01-0001', Now));
    if arr_PrnExtend[0] then
    arr_PreviewList[iNum - 1].iScale := int_ExtendSize;
    end;

    // �޴�
    if arr_Prn[6] then
    begin
    PreViewSetText(str_Line);
    PreViewSetText(MenuFormat('��ǰ��', '����', '�ܰ�', '�� ��'));
    PreViewSetText(str_Line);
    PreViewSetText(MenuFormat('(ICE)�Ƹ޸�ī��', '2', '3,000', '6,000'));
    if arr_PrnExtend[0] then
    arr_PreviewList[iNum - 1].iScale := int_ExtendSize;
    PreViewSetText(MenuFormat('(S)�������', '2', '1,000', '2,000'));
    if arr_PrnExtend[0] then
    arr_PreviewList[iNum - 1].iScale := int_ExtendSize;
    PreViewSetText(MenuFormat('�������̾���������', '99', '10,000', '990,000'));
    if arr_PrnExtend[0] then
    arr_PreviewList[iNum - 1].iScale := int_ExtendSize;
    end;

    PreViewSetText(str_Line);
    PreViewSetText(PrnFormat(1, '�ֹ����� :        101'));
    PreViewSetText(PrnFormat(1, '�����հ� :          0'));
    PreViewSetText(PrnFormat(1, 'Sub Total:    998,000'));
    PreViewSetText(str_Line);
    PreViewSetText(PrnFormat(1, '�հ�ݾ� :    998,000'));
    arr_PreviewList[iNum - 1].iScale := 3;
    PreViewSetText(PrnFormat(1, '�� �� �� :    998,000'));
    PreViewSetText(str_Line);
    PreViewSetText('@ǥ�� ��ǰ�� �鼼�Դϴ�.');
    PreViewSetText('������� : ����');
    PreViewSetText('�Ǹ��Ͻ� : ' + formatDateTime('YYYY-MM-DD HH:MM', Now) + '');

    // �ֹ���(�����)
    if arr_Prn[7] then
    begin
    PreViewSetText('�� �� �� : ������');
    if arr_PrnExtend[0] then
    arr_PreviewList[iNum - 1].iScale := 3;
    end;

    PreViewSetText(str_Line);

    for i := Low(PrnMemo) to High(PrnMemo) do
    PreViewSetText(PrnMemo[i]);

    // �ֹ���ȣ �ϴ�
    if bOrdNoDownPrn then
    begin
    PreViewSetText('�ֹ���ȣ: 1');
    if arr_PrnExtend[0] then
    arr_PreviewList[iNum - 1].iScale := 3;
    end;

    end;
    1: // ���ֹ���
    begin
    for i := Low(arr_PreviewList) to High(arr_PreviewList) do
    arr_PreviewList[i].iScale := 0;

    PreViewSetText(PrnFormat(2, TitleOrder));
    if arr_PrnExtend[0] then
    arr_PreviewList[iNum - 1].iScale := 3;
    PreViewSetText(str_Line);
    PreViewSetText(MenuFormat('��ǰ��', '����', '�ܰ�', '�� ��'));
    PreViewSetText(str_Line);
    PreViewSetText(MenuFormat('(ICE)�Ƹ޸�ī��', '2', '3,000', '6,000'));
    if arr_PrnExtend[0] then
    arr_PreviewList[iNum - 1].iScale := int_ExtendSize;
    PreViewSetText(MenuFormat('(S)�������', '2', '1,000', '2,000'));
    if arr_PrnExtend[0] then
    arr_PreviewList[iNum - 1].iScale := int_ExtendSize;
    PreViewSetText(MenuFormat('�������̾���������', '99', '10,000', '990,000'));
    if arr_PrnExtend[0] then
    arr_PreviewList[iNum - 1].iScale := 3;
    PreViewSetText(str_Line);
    PreViewSetText(PrnFormat(1, '���αݾ� :          0'));
    PreViewSetText(PrnFormat(1, 'Sub Total:    998,000'));
    if arr_PrnExtend[0] then
    arr_PreviewList[iNum - 1].iScale := 3;
    PreViewSetText('�Ǹ��Ͻ� : ' + formatDateTime('YYYY-MM-DD HH:MM', Now) + '');
    end;
    2: // �ֹ��ֹ���
    begin

    for i := Low(arr_PreviewList) to High(arr_PreviewList) do
    arr_PreviewList[i].iScale := 0;

    PreViewSetText(str_Line);
    PreViewSetText('�ֹ���ȣ: 1');
    PreViewSetText(str_Line);
    PreViewSetText(PrnFormat(2, TitleKit));
    PreViewSetText(str_Line);
    PreViewSetText(MenuFormat('(ICE)�Ƹ޸�ī��', '2', '3,000', '6,000'));
    PreViewSetText(MenuFormat('(S)�������', '2', '1,000', '2,000'));
    PreViewSetText(MenuFormat('�������̾���������', '99', '10,000', '990,000'));
    PreViewSetText(str_Line);
    PreViewSetText('��  �� : ' + formatDateTime('YYYY-MM-DD HH:MM', Now) + '');

    end;
    end;
    SetLength(arr_PreviewList, iNum);

    {$IFDEF DEBUG }
  {
    Memo_Test.Visible := True;
    Memo_Test.Lines.Clear;
    for i := 0 to High(arr_PreviewList) do
    begin
    with arr_PreviewList[i] do
    begin
    Memo_Test.Lines.Add(sText);
    end;
    end;
    {$ENDIF }
  { PreviewShow;
  }
end;

{
  procedure TForm_SMPreview.PreviewShow;
  var
  i: Integer;
  fi: Single;
  begin
  Memo_Test.Lines.Clear;
  for i := Low(arr_PreviewList) to High(arr_PreviewList) do
  begin
  if Trim(arr_PreviewList[i].sText) = '' then
  Continue;

  with TLabel.Create(ScrollBox_Parent) do
  begin
  Align := TAlignLayout.MostTop;
  Parent := ScrollBox_Parent;
  AutoSize := False;
  WordWrap := False;
  Visible := True;

  Name := 'Label_Preview' + IntTostr(i);
  Tag := i;
  Text := arr_PreviewList[i].sText;

  StyledSettings := StyledSettings - [TStyledSetting.Size, TStyledSetting.Family];
  TextSettings.Font.Family := 'D2Coding';
  TextSettings.Font.Size := 16;

  HitTest := True;
  OnMouseDown := Label_MouseDown;
  OnMouseMove := Label_MouseMove;
  OnMouseUp := Label_MouseUp;

  if fi <> 0 then
  begin
  Position.Y := fi + 10;
  end
  else
  begin
  Position.Y := 0;
  end;
  fi := Position.Y + Height;
  {$IFDEF DEBUG }
{
  Memo_Test.Visible := True;
  Memo_Test.Lines.Add(IntTostr(i) + ' ' + FloatToStr(fi) + ' ' + Text);
  {$ENDIF }
{
  case arr_PreviewList[i].iScale of
  0:
  begin
  Scale.X := 1;
  Scale.Y := 1;
  Height := 20;
  end;
  1:
  begin
  Scale.X := 2;
  Scale.Y := 2;
  Height := 22;
  end;
  2:
  begin
  Scale.X := 2;
  Scale.Y := 1;
  Height := 20;
  end;
  3:
  begin
  Scale.X := 1;
  Scale.Y := 2;
  Height := 22;
  end;
  end;
  end;

  end;
  end;
}

function TForm_SMPreview.PrnFormat(int_Align: Byte; str: String): String;
var
  i: Byte;
  iAnsi, iWide, iVal: Byte;
  sLeft: String;
begin
  //
  iAnsi := Length(AnsiString(str));
  iWide := Length(str);
  iVal := iAnsi - iWide;

  case int_Align of
    0: // Left
      begin
        Result := format('%-' + IntTostr(int_LineCnt - iVal) + 's', [str]);
      end;
    1: // Rigth
      begin
        Result := format('%' + IntTostr(int_LineCnt - iVal) + 's', [str]);
      end;
    2: // Center
      begin
        sLeft := '';
        for i := 0 to (int_LineCnt - iAnsi) div 2 do
          sLeft := sLeft + ' ';

        Result := sLeft + str + sLF;
      end;
  end;
end;

procedure TForm_SMPreview.RadioButton3Click(Sender: TObject);
begin
  PreviewClear;
{$IFDEF DEBUG}
  Memo_Test.Lines.Clear;
  Memo_Test.Text := '  ';
  PreviewSet((Sender as TRadioButton).Tag);
{$ENDIF}
end;

function TForm_SMPreview.ShowMSG(str: String): Boolean;
begin
  ShowMEssage(str);
end;

end.
