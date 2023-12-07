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
  TResult_BS = record
    bBool: Boolean;
    sStr: String;
  end;

  TPreviewInfo = record
    bPrn: array of Boolean; // 인쇄유무
    bExt: array of Boolean; // 확대유무
    iTop_Len, iBot_Len: Integer; // 상하단 여백
    sBigo: String; // 하단 문구
  end;

  TForm_SMPreview = class(TForm)
    ScrollBox_Parent: TScrollBox;
    Label_MSG: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Label_MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure Label_MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure Label_MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Single);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);

  private
    { Private declarations }
    procedure PreviewClear; // 미리보기 초기화
    procedure PreviewSet; // 미리보기 값 세팅
    procedure PreviewView(iType: Byte; sTextVal: String; bExtend: Boolean); // 미리보기 값 화면처리
    { iType
      0: Left ALign;
      1: Right ALign;
      2: Center ALign;
      3: Menu ALign;

    }

    procedure iniInfo_Get;
    procedure InstallFont(iType: Byte);
    function PrnFormat(int_Align: Byte; str: String; bExtend: Boolean): String;
    function MenuFormat(iType: Byte; str: String; bExtend: Boolean): String;
    { iType
      0 : 상품명, 수량, 단가, 금액
      1 : 상품명, 수량
      2 : 상품명 수량, 금액

    }

  public
    { Public declarations }
    function ShowMSG(str: String): Boolean;
    function WndProc(HWND: HWND; Msg: UINT; wParam: wParam; lParam: lParam): LResult;
  end;

const
  sLF = #13#10;

var
  FormHandle: HWND;
  NewWndProc: Long;

  bScroll: Boolean;
  iScroll_Y: Single;

  Form_SMPreview: TForm_SMPreview;
  arr_PreviewList: TPreviewInfo;

  iPreviewType: Byte;
  iPreviewCnt: Integer;
  GMZName, GMZSeqNO, GMZOwner, GMZAddr1, GMZAddr2, GMZTel: String;
  TitleRecp, TitleKit, TitleOrder: String;

  int_ExtendSize, int_LineCnt: Byte; // 출력확대 사이즈,  라인별 출력 문자수
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
    // 프로그램 종료 요청
    if RecvMsg = '0' then
    begin
      InstallFont(0);
      Application.Terminate;
    end
    // 미리보기 요청
    else
    begin
      PreviewClear;
      iniInfo_Get;
      PreviewSet;
    end;

  end;

  Result := CallWindowProc(Ptr(NewWndProc), HWND, Msg, wParam, lParam);
end;

procedure TForm_SMPreview.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  InstallFont(0);
end;

procedure TForm_SMPreview.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin

  InstallFont(0);
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

procedure TForm_SMPreview.FormShow(Sender: TObject);
begin
  Width := 380;
  Height := 550;
  InstallFont(1);
  PreviewClear;
  iniInfo_Get;

  PreviewSet;
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

procedure TForm_SMPreview.iniInfo_Get;
var
  ini: Tinifile;
  i, j: Byte;
begin
  PreviewClear;
  SetLength(arr_PreviewList.bPrn, 0);
  SetLength(arr_PreviewList.bExt, 0);
  ini := Tinifile.Create('.\Prn_Sample.ini');
  try

    with ini do
    begin
      // 0 : 영수증, 1 : 고객주문서, 2 : 주방주문서
      iPreviewType := ReadInteger('PREVIEW', 'VIEWTYPE', 2);

      GMZName := ReadString('AIRPOS', 'GMZNM', '(주)에어포스');
      GMZSeqNO := ReadString('AIRPOS', 'GRegNo', '214-87-26177');
      GMZOwner := ReadString('AIRPOS', 'gBoss', '천태진');
      GMZAddr1 := ReadString('AIRPOS', 'gAddr1', '서울특별시 영등포구 경인로775(문래동3가)');
      GMZAddr2 := ReadString('AIRPOS', 'gAddr2', '에이스하이테크시티 1동 721호');
      GMZTel := ReadString('AIRPOS', 'GTelNO', '02-1588-9218');

      TitleRecp := ReadString('AIRPOS', 'PrnTitle1', '< 영 수 증 >');
      TitleOrder := ReadString('AIRPOS', 'PrnTitle2', '< 고 객 주 문 서 >');
      TitleKit := ReadString('AIRPOS', 'PrnTitle3', '< 주 방 주 문 서 >');

      int_LineCnt := ReadInteger('AIRPOS', 'RecColCnt', 40);
      str_Line := '--------------------------------------------------';
      str_Line := Copy(str_Line, 1, int_LineCnt);

      int_ExtendSize := ReadInteger('AIRPOS', 'KitFontSize', 0);

      if iPreviewType in [0, 1] then
        int_ExtendSize := 2;
      { [ 0 : 2 X 2 ], [ 1 : 2 X 1 ], [ 2 : 1 X 2 ] }

      with arr_PreviewList do
      begin
        sBigo := '';
        case iPreviewType of
          0: // 영수증
            begin
              SetLength(bPrn, 11);
              SetLength(bExt, 8);
              iTop_Len := ReadInteger('AIRPOS', 'RecTopCnt', iTop_Len);
              iBot_Len := ReadInteger('AIRPOS', 'RecBotCnt', iBot_Len);

              // 인쇄유무
              for i := Low(bPrn) to High(bPrn) do
              begin
                case i of
                  0 .. 7:
                    begin
                      bPrn[i] := ReadBool('AIRPOS', 'recPrn' + IntTostr(i + 1), True);
                    end;
                  8:
                    begin
                      bPrn[i] := ReadBool('AIRPOS', 'RecOrdNoUpPrn', True);
                    end;
                  9:
                    begin
                      bPrn[i] := ReadBool('AIRPOS', 'RecOrdNoDownPrn', True);
                    end;
                end;
              end;

              // 확대유무
              for i := Low(bExt) to High(bExt) do
                bExt[i] := ReadBool('AIRPOS', 'RecFnt' + IntTostr(i + 1), True);

              for i := 1 to 10 do
              begin
                if ReadString('AIRPOS', 'kit_Bigo' + IntTostr(i), '') = '' then
                  Break;
                if (iPreviewType = 0) AND (ini.ValueExists('AIRPOS', 'r_Bigo' + IntTostr(i))) then
                  sBigo := sBigo + sLF + ReadString('AIRPOS', 'r_Bigo' + IntTostr(i), '');
              end;
            end;
          1, 2: // 주방주문서
            begin
              SetLength(bPrn, 10);
              SetLength(bExt, 9);
              iTop_Len := ReadInteger('AIRPOS', 'kitTopCnt', iTop_Len);
              iBot_Len := ReadInteger('AIRPOS', 'kitBotCnt', iBot_Len);

              // 인쇄유무
              for i := Low(bPrn) to High(bPrn) do
              begin
                case i of
                  0 .. 5, 9:
                    begin
                      bPrn[i] := ReadBool('AIRPOS', 'ordPrn' + IntTostr(i + 1), True);
                    end;
                  6:
                    begin
                      bPrn[i] := ReadBool('AIRPOS', 'KitOrdNoPrn', False);
                    end;
                  7:
                    begin
                      bPrn[i] := ReadBool('AIRPOS', 'kitOrdNoUpPrn', False);
                    end;
                  8:
                    begin
                      bPrn[i] := ReadBool('AIRPOS', 'kitOrdNoDownPrn', False);
                    end;
                end;
              end;

              // 확대유무
              for i := Low(bExt) to High(bExt) do
              begin
                case i of
                  0 .. 7:
                    begin
                      bExt[i] := ReadBool('AIRPOS', 'ordfnt' + IntTostr(i + 1), True);
                    end;
                  8:
                    begin
                      bExt[i] := ReadBool('AIRPOS', 'ordfnt10', True);
                    end;
                end;
              end;

              for i := 1 to 4 do
              begin
                if ReadString('AIRPOS', 'kit_Bigo' + IntTostr(i), '') = '' then
                  Break;
                if (iPreviewType = 2) AND (ini.ValueExists('AIRPOS', 'kit_Bigo' + IntTostr(i))) then
                  sBigo := sBigo + ReadString('AIRPOS', 'kit_Bigo' + IntTostr(i), '');
              end;

              if iPreviewType = 1 then
              begin
                SetLength(bPrn, 12);
                iTop_Len := ReadInteger('AIRPOS', 'hggTopCnt', iTop_Len);
                iBot_Len := ReadInteger('AIRPOS', 'hggBotCnt', iBot_Len);
                bPrn[10] := ReadBool('AIRPOS', 'ggprnnogmz', True);
                bPrn[11] := ReadBool('AIRPOS', 'ggRecBigo', True);

                for i := 1 to 10 do
                begin
                  if ReadString('AIRPOS', 'r_Bigo' + IntTostr(i), '') = '' then
                    Break;

                  if (iPreviewType = 0) AND (ini.ValueExists('AIRPOS', 'r_Bigo' + IntTostr(i))) then
                    sBigo := sBigo + sLF + ReadString('AIRPOS', 'r_Bigo' + IntTostr(i), '');
                end;
              end;
            end;
        end;
        sBigo := StringReplace(sBigo, '|', sLF, [rfReplaceAll]);
      end;
    end;
  finally
    ini.Free;
  end;
end;

procedure TForm_SMPreview.InstallFont(iType: Byte);
begin
  // 프린터 폰트 설치 ( D2Coding )
  if iType = 1 then
  begin
    if FileExists('Font\D2Coding.ttf') then
    begin
      AddFontResource(PChar('Font\D2Coding.ttf'));
    end
    else
    begin
      ShowMSG('프린터 폰트를 찾을 수 없습니다.' + #13#10 + '프로그램 업데이트 후 다시 시도해주세요.');
{$IFDEF RELEASE}
      Application.Terminate;
{$ENDIF RELEASE}
    end;
  end
  else
  begin
    RemoveFontResource(PChar('\Font\D2Coding.fft'));
  end;
  SendMessage(HWND_BROADCAST, WM_FONTCHANGE, 0, 0);
end;

function TForm_SMPreview.MenuFormat(iType: Byte; str: String; bExtend: Boolean): String;
var
  iAnsi, iWide, iCnt: Byte;
  arrVal: array of Byte;
  arrStr: array of String;
  sFormat: String;
  i: Byte;
begin
  //
  if bExtend then
    iCnt := int_LineCnt div 2
  else
    iCnt := int_LineCnt;
  Result := '';

  case iType of
    0:
      begin
        SetLength(arrVal, 4);

      end;
    1:
      begin
        SetLength(arrVal, 2);
      end;
    2:
      begin
        SetLength(arrVal, 3);
      end;
  end;

  SetLength(arrStr, Length(arrVal));

  for i := Low(arrVal) to High(arrVal) do
  begin

    if POS('|', str) = 0 then
      arrStr[i] := str
    else
      arrStr[i] := Copy(str, 1, POS('|', str) - 1);
    str := Copy(str, POS('|', str) + 1, Length(str));
    iAnsi := Length(AnsiString(arrStr[i]));
    iWide := Length(arrStr[i]);

    arrVal[i] := iAnsi - iWide;

    case iType of
      0:
        begin
          case i of
            0: // 상품명
              sFormat := '%-' + IntTostr((iCnt div 2) - arrVal[i]) + 's';
            1: // 수량
              sFormat := '%' + IntTostr(3 - arrVal[i]) + 's';
            2: // 단가
              sFormat := '%' + IntTostr(8 - arrVal[i]) + 's';
            3: // 금액
              sFormat := '%' + IntTostr(iCnt - ((iCnt div 2) + 12) - arrVal[i]) + 's';
          end;
        end;
      1:
        begin
          case i of
            0: // 상품명
              sFormat := '%-' + IntTostr((iCnt - 3) - arrVal[i]) + 's';
            1: // 수량
              sFormat := '%3s';
          end;
        end;
      2:
        begin
          case i of
            0: // 상품명
              sFormat := '%-' + IntTostr((iCnt - 3) - arrVal[i]) + 's';
            1: // 수량
              sFormat := '%3s';
            2: // 금액
              sFormat := '%3s';
          end;
        end;
    end;

    Result := Result + format(sFormat, [arrStr[i]]);
  end;
end;

procedure TForm_SMPreview.PreviewClear;
var
  i: Integer;
begin
  //
  iPreviewCnt := 0;
  if ScrollBox_Parent.ComponentCount <> 0 then
  begin
    for i := ScrollBox_Parent.ComponentCount - 1 Downto 0 do
    begin
      if ScrollBox_Parent.Components[i] is TLabel then
        (ScrollBox_Parent.Components[i] as TLabel).Free;
    end;
  end;
  Application.ProcessMessages;
end;

procedure TForm_SMPreview.PreviewSet;
var
  i, j: Integer;
begin
  //
  iniInfo_Get;
  ScrollBox_Parent.Visible := False;
  ScrollBox_Parent.Height := 2000;
  Label_MSG.Visible := True;
  try
    with arr_PreviewList do
    begin
      case iPreviewType of
        0: // 영수증
          begin

            // 주문번호 상단
            if bPrn[7] AND bPrn[8] then
            begin
              i := 7;
              PreviewView(0, str_Line, False);
              PreviewView(0, '주문번호 : 29', bExt[i]);
              PreviewView(0, str_Line, False);
            end;

            // 타이틀
            if bPrn[0] then
            begin
              i := 0;
              PreviewView(2, TitleRecp, bExt[i]);
            end;

            // 매장정보
            if bPrn[1] then
            begin
              i := 1;
              PreviewView(0, GMZName, bExt[i]);
              PreviewView(0, format('%-14s', [GMZSeqNO]) + format('%-8s', [GMZOwner]) + 'T.' + GMZTel, bExt[i]);
              PreviewView(0, GMZAddr1 + sLF + GMZAddr2, bExt[i]);
            end;
            // 영수증 번호
            if bPrn[2] then
            begin

              i := 2;
              PreviewView(0, 'S.No  : ' + FormatDateTime('YYMMDD', NOW) + '01001', bExt[i]);
            end;
            // 테이블명
            if bPrn[3] then
            begin

              i := 3;
            end;
            // 인원
            if bPrn[4] then
            begin

              i := 4;
            end;
            // 메뉴
            if bPrn[5] then
            begin

              i := 5;
              PreviewView(0, str_Line, False);
              PreviewView(3, '상품명|수량|단가|금 액', False);
              PreviewView(0, str_Line, False);
              PreviewView(3, '아이스 아메리카노|4|500|2000', bExt[i]);
              PreviewView(3, '(S)샷추가|4|300|1200', bExt[i]);
              PreviewView(3, 'HOT카페라떼|1|1000|1000', bExt[i]);
              PreviewView(0, str_Line, False);
              PreviewView(1, '주문갯수 :        9', False);
              PreviewView(1, '할인합계 :        0', False);
              PreviewView(1, 'Sub Total:     4200', bExt[i]);
              PreviewView(0, str_Line, False);
              PreviewView(1, '합계금액 :     4200', bExt[i]);
              PreviewView(1, '받 은 돈 :        0', False);
              PreviewView(0, str_Line, False);
              PreviewView(0, '결제방법 : 카드', False);
              PreviewView(0, '판매일시 : ' + FormatDateTime('YYYY-MM-DD HH:MM', NOW), False);
            end;
            // 주문자(배달자)
            if bPrn[6] then
            begin

              i := 6;
              PreviewView(0, '계 산 자 : 관리자', bExt[i]);
            end;

            // 영수증 하단문구
            if sBigo <> '' then
            begin
              begin
                PreviewView(0, str_Line, False);
                PreviewView(0, sBigo, False);
              end;
            end;

            // 주문번호 하단
            if bPrn[7] AND bPrn[9] then
            begin
              i := 7;
              PreviewView(0, str_Line, False);
              PreviewView(0, '주문번호 : 29', bExt[i]);
              PreviewView(0, str_Line, False);
            end;
          end;
        1: // 고객주문서
          begin
            // 타이틀
            i := 0;
            PreviewView(2, TitleOrder, bExt[i]);

            // 매장정보
            if bPrn[10] then
            begin
              PreviewView(0, GMZName, bExt[i]);
              PreviewView(0, format('%-14s', [GMZSeqNO]) + format('%-8s', [GMZOwner]) + 'T.' + GMZTel, bExt[i]);
              PreviewView(0, GMZAddr1 + sLF + GMZAddr2, bExt[i]);
            end;

            // 메뉴
            i := 6;
            PreviewView(0, str_Line, False);
            PreviewView(3, '상품명|수량|단가|금 액', False);
            PreviewView(0, str_Line, False);
            PreviewView(3, '아이스 아메리카노|4|500|2000', bExt[i]);
            PreviewView(3, '(S)샷추가|4|300|1200', bExt[i]);
            PreviewView(3, 'HOT카페라떼|1|1000|1000', bExt[i]);
            PreviewView(0, str_Line, False);

            // 주문금액
            PreviewView(1, '할인합계 :        0', False);
            PreviewView(1, 'Sub Total:     4200', True);
            // 판매정보
            PreviewView(0, '판매일시 : ' + FormatDateTime('YYYY-MM-DD HH:MM', NOW), False);

            // 하단문구
            if bPrn[11] then
            begin
              PreviewView(0, str_Line, False);
              PreviewView(0, sBigo, False);
            end;

          end;
        2: // 주방주문서
          begin
            // 주문번호 (상단)
            if bPrn[6] AND bPrn[7] then
            begin
              i := 7;
              PreviewView(0, str_Line, False);
              PreviewView(0, '주문번호 : 29', bExt[i]);
              PreviewView(0, str_Line, False);
            end;

            // 타이틀
            if bPrn[0] then
            begin
              i := 0;
              PreviewView(2, TitleKit, bExt[i]);
            end;

            // POS 번호
            if bPrn[2] then
            begin
              i := 2;
              PreviewView(0, '포스번호 : 1', bExt[i]);
            end;

            // 메뉴
            i := 6;
            PreviewView(0, str_Line, False);
            PreviewView(4, '아이스 아메리카노|4', bExt[i]);
            PreviewView(4, '(S)샷추가|4', bExt[i]);
            PreviewView(4, 'HOT카페라떼|1', bExt[i]);
            PreviewView(0, str_Line, True);

            // 출력시간
            if bPrn[3] then
            begin
              i := 3;
              PreviewView(0, '시  간 : ' + FormatDateTime('YYYY-MM-DD HH:MM', NOW), False);
            end;

            // 주문자 (배달자)
            if bPrn[5] then
            begin
              i := 5;
              PreviewView(0, '주문자 : 관리자', False);
            end;

            // 영수번호
            if bPrn[9] then
            begin
              i := 7;
              PreviewView(0, '영수NO : 1-1', False);
            end;

            // 하단문구
            if sBigo <> '' then
            begin
              PreviewView(0, str_Line, False);
              PreviewView(0, sBigo, False);
            end;

            // 주문번호 (하단)
            if bPrn[6] AND bPrn[8] then
            begin
              i := 7;
              PreviewView(0, str_Line, False);
              PreviewView(0, '주문번호 : 29', bExt[i]);
              PreviewView(0, str_Line, False);
            end;
          end;
      end;

    end;

  finally
    ScrollBox_Parent.Visible := True;
    Label_MSG.Visible := False;
    ScrollBox_Parent.Height := 500;
  end;

end;

procedure TForm_SMPreview.PreviewView(iType: Byte; sTextVal: String; bExtend: Boolean);
var
  bExtChk: Boolean;
begin
  inc(iPreviewCnt);
  bExtChk := bExtend;
  if bExtChk AND (int_ExtendSize = 2) then
    bExtChk := False;
  case iType of
    0, 1, 2:
      begin
        sTextVal := PrnFormat(iType, sTextVal, bExtChk);
      end;
    3, 4, 5:
      begin
        sTextVal := MenuFormat(iType - 3, sTextVal, bExtChk);
      end;
  end;

  with TLabel.Create(ScrollBox_Parent) do
  begin

    Align := TAlignLayout.Bottom;
    WordWrap := True;
    AutoSize := True;
    Parent := ScrollBox_Parent;
    Visible := True;
    Name := 'Label_PreView' + IntTostr(iPreviewCnt);
    Tag := iPreviewCnt;
    HitTest := True;

    OnMouseDown := Label_MouseDown;
    OnMouseMove := Label_MouseMove;
    OnMouseUp := Label_MouseUp;

    with TextSettings do
    begin
      WordWrap := True;
      Font.Family := 'D2Coding';
      Font.Size := 16;

    end;

    StyledSettings := StyledSettings - [TStyledSetting.Size, TStyledSetting.Family];
    Text := sTextVal;

    Application.ProcessMessages;
    Align := TAlignLayout.Top;
    Application.ProcessMessages;
    if bExtend then
    begin
      TextSettings.Font.Style := [TFontStyle.fsBold];
      case int_ExtendSize of
        0: // 2X2
          begin
            Scale.X := 2;
            Scale.Y := 2;
          end;
        1: // 2X1
          begin
            Scale.X := 2;
            Scale.Y := 1;
          end;
        2: // !X2
          begin
            Scale.X := 1;
            Scale.Y := 2;
          end;
      end;
    end
    else
    begin
      Scale.X := 1;
      Scale.Y := 1;
    end;

  end;

end;

function TForm_SMPreview.PrnFormat(int_Align: Byte; str: String; bExtend: Boolean): String;
var
  i: Byte;
  iAnsi, iWide, iVal, iCnt: Byte;
begin
  //
  if bExtend AND (str = str_Line) then
  begin
    Result := Copy(str_Line, 1, Length(str_Line) div 2);
    Exit;
  end;

  iAnsi := Length(AnsiString(str));
  iWide := Length(str);
  iVal := iAnsi - iWide;
  iCnt := int_LineCnt;

  if bExtend AND ((int_ExtendSize = 0) or (int_ExtendSize = 1)) then
  begin
    iCnt := int_LineCnt div 2;
  end
  else
  begin
    iCnt := int_LineCnt;
  end;

  case int_Align of
    0: // Left
      begin
        Result := format('%-' + IntTostr(iCnt - iVal) + 's', [str]);
      end;
    1: // Rigth
      begin
        Result := format('%' + IntTostr(iCnt - iVal) + 's', [str]);
      end;
    2: // Center
      begin
        Result := format('%' + IntTostr(ROUND((iCnt - iAnsi) / 2)) + 's', [' ']) + str;
      end;
  end;
end;

function TForm_SMPreview.ShowMSG(str: String): Boolean;
begin
  ShowMEssage(str);
end;

end.
