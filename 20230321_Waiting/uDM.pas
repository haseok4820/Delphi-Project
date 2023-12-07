unit uDM;
interface

uses
  System.SysUtils, System.Classes, System.Win.Registry, System.Net.URLClient, System.inifiles, System.StrUtils,
  System.Net.HttpClient, System.Net.HttpClientComponent, //

  Vcl.Forms, Vcl.StdCtrls, Vcl.Graphics, Vcl.ExtCtrls, Vcl.Controls, Vcl.ComCtrls, //

  Winapi.Windows, Winapi.TlHelp32, Winapi.ShellApi, Winapi.Messages, //

  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Phys.FBDef,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Phys.IBBase, FireDAC.Phys.FB, FireDAC.Comp.DataSet
//{$IFDEF WIN32}
    , CPort
//{$ENDIF}
    ;

Function Wow64DisableWow64FsRedirection(Var Wow64FsEnableRedirection: LongBool): LongBool; StdCall; // Win64 리다이렉트 해제
External 'Kernel32.dll' Name 'Wow64DisableWow64FsRedirection';
Function Wow64EnableWow64FsRedirection(Wow64FsEnableRedirection: LongBool): LongBool; StdCall; // Win64 리다이렉트 재실행
External 'Kernel32.dll' Name 'Wow64EnableWow64FsRedirection';

type
  TResult_IS = record
    iRes: Integer;
    sRes: String;
  end;

  TDB_TABLE = record
    iSeq: Integer;
    sTableName: String;
    bUsing: Boolean;
    iX, iY, iW, iH: Integer;
  end;

  TDB_STOCK = record
    sCode: String; // 상품코드
    sName: String; // 상품명
    sNotice: String; // 상품설명
    iMAX: Integer; // 최대수량
    iAmt: Integer; // 가격
    bUsed: Boolean; // 표시유무
  end;

  TPRN_TICKEET = record
    bUsed: Boolean; // 출력유무
    sName: String; // 구분명
    sText: String; // 출력명
    iAlign: Integer; // 출력정렬 (중앙, 우측, 좌측) 미리보기 전용
    iExtend_X: Byte; // 확대 길이
    iExtend_Y: Byte; // 확대 높이
  end;

{$IFDEF WIN32}

  TCOMPORT_Thread = Class(TThread)
    Comport: TComPort;

    sPort: String;
    iBaudRate: Integer;
    slSendText: TStringList;
    bEnd: Boolean;

    resInfo: TResult_IS;
  private
  public
    constructor Create(CreateSuspended: Boolean);
  protected
    procedure Execute; override;

  End;
{$ENDIF}

  TFDCONN_Thread = class(TThread)
    bRes, bEnd: Boolean;
  protected
    procedure Execute; override;
  end;

  THTTP_Thread = Class(TThread)
    HTTP_Request: TNetHTTPRequest;
    HTTP_Client: TNetHTTPClient;
  public
    constructor Create(CreateSuspended: Boolean);
  protected
    procedure Execute; override;
  End;

  TDM = class(TDataModule)
    FDQ: TFDQuery;
    FBDriver: TFDPhysFBDriverLink;
    FDConn: TFDConnection;
    HttpClient: TNetHTTPClient;
    HTTPRequest: TNetHTTPRequest;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    procedure FontExecute(iFontType: Byte);
  public
    { Public declarations }
    function DB_Connect: Boolean;
    procedure Loadini;
    procedure Saveini;
    procedure LogText(sText: String);
    function SetResult(iRes: Integer; sRes: String): TResult_IS;
    function GetComport: TResult_IS;
    function GetFonts: TResult_IS;
    function GetProcessChk(sEXEName: String): Cardinal;
{$IFDEF WIN32}
    function PrintTest(sSerialPort: String; iSerialBaudRate: Integer): TResult_IS;
    function PrintTicket: TResult_IS;
{$ENDIF}
    function SetPrtText(iTextSize: Byte; sText: String): String; overload;
    function SetPrtText(sText: String): String; overload;
    function SetPrtLine: String;

    function PopupMsg(iPopupType: Byte; sTitle, sMsg: String): Integer; overload;
    function PopupMsg(iPopupType: Byte; sMsg: String): Integer; overload;
    function PopupMsg(sMsg: String): Integer; overload;

    function PopupKeyPad(sType: String): String;
    function PopupList(arrName: array of String): TResult_IS;
    Procedure PopupKeyboard;

    procedure SetBG(bSet: Boolean);
    procedure RoundPanel(Sender: TObject);

    function NextSeq(sTableName, sColName: String): Integer;
    function NextOrderNO: Integer;
    procedure SetTables;
    function SetMenus: Integer;
    function GetMenus: Integer;

    function SetWaiting(iSetType: Byte; sTelNo: String): TResult_IS;
    function GetWait: Integer;

    function Translation(iLangType: Byte; sText: String): TResult_IS;

  end;

const
  sPRT_UNUSED = '사용안함';

  iFONT_INSTALL = 1;
  iFONT_UNINSTALL = 2;

  iPOPUP_OK = 1;
  iPOPUP_YESNO = 2;
  iPOPUP_OKCANCEL = 3;

  iPOPUP_USERCANCEL = -1;
  iPOPUP_RESULT_OK = 0;
  iPOPUP_RESULT_CANCEL = 1;

  iWAITING_INSERT = 0;
  iWAITING_UPDATE = 1;
  iWAITING_DELETE = 2;

var
  DM: TDM;
  iDB_POSNO: Integer = 1;
  sDB_IP: String = '127.0.0.1';
  sDB_PATH: String = 'c:\foodcafe\database\pos';
  sDB_ID: String = 'sysdba';
  sDB_PW: String = 'masterkey';

  // Common
  Scn_X, Scn_Y, Scn_W, Scn_H: Integer; // 모니터 사이즈 정보
  bWIN64: Boolean = False;
  arrComPort: array of String;
  arrFont: array of String;
  arrYN: array [0 .. 1] of String = (
    '□', // NO
    '■' // YES
  );

  // Wait Info
  iWaitTeam: Integer = 0; // 대기팀수
  iWaitTime: String = ''; // 접수시간 : YYYY-MM-DD HH24:MM:SS
  // Print Info
  sTicketPRT_PORT: String = sPRT_UNUSED;
  iTicketPRT_BaudRate: Integer = 3;
  sTicket_PrintIP: array of String;

  iTicket_Length: Integer = 40;
  arrTicket_Info: array of TPRN_TICKEET;

  // System
  sAPPPATH: String;

  cMain_BG: TColor = $00222222;

  arrTables: array of TDB_TABLE; // 좌석 정보 unused
  arrStocks: array of TDB_STOCK; // 상품 목록 unused

  sSystemFont: String = '고도 B'; // 화면 표시폰트
  iCnt_Rows: Byte = 1; // 메뉴 배열 정보
  iCnt_Cols: Byte = 1;
  iKakaoAlert: Integer = 0; // 0 : 사용안함, 1 : 선택형, 2 : 필수
  bBreakTime: Boolean = False; // 브레이크 타임 사용유무
  tBreakStart: TTime;
  tBreakEnd: TTime;
  iMenuViewType: Integer = 0;

  iTicketType: Integer = 0; // 티켓 유형
  iTicketCnt: Integer = 1; // 티켓 발행 수량
  sTicketTitle: String = '[ 대 기 권 ]'; // 티켓 타이틀
  iTicketTopNil: Integer = 3; // 티켓 상단 여백
  iTicketBotNil: Integer = 3; // 티켓 하단 여백
  iLanguage_Default: Integer = 0; // 한글, 영어, 일본어, 중국어
  bLanguage_KOR: Boolean = True;
  bLanguage_ENG: Boolean = True;
  bLanguage_JPN: Boolean = True;
  bLanguage_CHA: Boolean = True;

  arrWaitingInfo: array of TResult_IS; // 인원수, 인원 구분명(성인, 소인 등)
  arrTicket_1: array [0 .. 4] of String = (
    'TITLE',
    'ORDERNO',
    'WAITPEOPLE',
    'PRNTIME',
    'NOTICE'
  );

  bTicket_DefaultUsed: Boolean = True;
  iTicket_DefaultExtend: Word = 1;
  arrBaudRateType: array [0 .. 3] of String = (
    '9600',
    '19200',
    '38400',
    '115200'
  );

  arrTicket_DefaultName: array [0 .. 5] of String = (
    '타이틀',
    '대기/주문번호',
    '대기접수인원',
    '접수(출력)일시',
    '매장정보',
    '비고'
  );

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uPOPUP, uBG, fmMain, uKeyPad, fmMain_Re, uListBOX;
{$R *.dfm}
{ TDataModule1 }

function TDM.PopupMsg(iPopupType: Byte; sTitle, sMsg: String): Integer;
var
  iW, iH: Integer;
begin
  LogText('POPUP(' + IntToStr(iPopupType) + ') : ' + sMsg);
  SetBG(True);
  Form_POPUP := TForm_POPUP.Create(Self);
  try
    try
      with Form_POPUP do
      begin
        iH := Scn_H div 2;
        iW := Scn_W div 5;

        SetBounds(Left, Top, iW, iH);

        SetWindowPos(Form_POPUP.Handle, HWND_TOPMOST, Left, Top, Width, Height, 0);
        Label_Title.Caption := sTitle;
        Label_MSG.Caption := Stringreplace(sMsg, '#13', #13#10, [rfReplaceAll]);


        case iPopupType of
          iPOPUP_OK:
            begin
              with TLabel.Create(nil) do
              begin
                Parent := Panel_Footer;
                Alignment := taCenter;
                Layout := tlCenter;
                AutoSize := False;
                Name := 'FrameImageLabel_OK';
                Tag := iPOPUP_RESULT_OK;
                Caption := '확인';
                Transparent := False;
                Color := clWhite;

                SetBounds(0, Panel_Footer.Padding.Top, Panel_Footer.ClientWidth, Panel_Footer.Height);
                OnClick := PopupClick;
                OnMouseEnter := Popup_MouseEnter;
                OnMouseLeave := Popup_MouseLeave;
              end;
            end;
          iPOPUP_YESNO, iPOPUP_OKCANCEL:
            begin
              // YES, OK
              with TLabel.Create(Form_POPUP) do
              begin
                Parent := Panel_Footer;
                Alignment := taCenter;
                Layout := tlCenter;
                AutoSize := False;
                Transparent := False;
                Color := clWhite;

                Name := 'FrameImageLabel_NO';
                Tag := iPOPUP_RESULT_CANCEL;
                Caption := '취소(아니요)';

                SetBounds(0, Panel_Footer.Padding.Top, Panel_Footer.Width div 2 - 3, Panel_Footer.Height);
                OnClick := PopupClick;
                OnMouseEnter := Popup_MouseEnter;
                OnMouseLeave := Popup_MouseLeave;
              end;

              // NO, CANCEL
              with TLabel.Create(Form_POPUP) do
              begin
                Parent := Panel_Footer;
                Alignment := taCenter;
                Layout := tlCenter;
                AutoSize := False;
                Transparent := False;
                Color := clWhite;

                Name := 'FrameImageLabel_YES';
                Tag := iPOPUP_RESULT_OK;
                Caption := '확인(예)';

                SetBounds(Panel_Footer.Width div 2 + 3, Panel_Footer.Padding.Top, Panel_Footer.Width div 2, Panel_Footer.Height);
                OnClick := PopupClick;
                OnMouseEnter := Popup_MouseEnter;
                OnMouseLeave := Popup_MouseLeave;
              end;
            end;
        else
          begin
            Tag := -1;
            LogText('POPUP Fail : Bad Request');
          end;
        end;
        if Tag <> -1 then
        begin
          ShowModal;
          Result := Tag;
          LogText(IntToStr(Result) + ' - Click');
        end;
      end;

    except
      On E: Exception do
      begin
        LogText('POPUP Exception : ' + E.Message);

      end;
    end;
  finally
    SetBG(False);
    FreeAndNil(Form_POPUP);
  end;

end;

function TDM.PopupMsg(iPopupType: Byte; sMsg: String): Integer;
begin
  Result := PopupMsg(iPopupType, '안내', sMsg);

end;

function TDM.PopupMsg(sMsg: String): Integer;
begin
  Result := PopupMsg(iPOPUP_OK, '안내', sMsg);
end;

{$IFDEF WIN32}

function TDM.PrintTest(sSerialPort: String; iSerialBaudRate: Integer): TResult_IS;
var
  TestPrt: TCOMPORT_Thread;
  sLen: String;
  i: Integer;
begin
  //
  TestPrt := TCOMPORT_Thread.Create(True);
  sLen := '-';
  sLen := DupeString(sLen, iTicket_Length - (Length(AnsiString(sLen)) - Length(AnsiString(sLen))));
  try
    with TestPrt do
    begin
      sPort := sSerialPort;
      iBaudRate := iSerialBaudRate;
      with slSendText do
      begin
        Add(#$1b + #$40);
        Add(#$1b + #$61 + #$31);
        Add(#$1D + #$21 + #$11);
        Add('PORT     : ' + sPort + #13#10);
        Add('BaudRate : ' + arrBaudRateType[iSerialBaudRate] + #13#10);
        Add('');
        Add(SetPrtLine);
        Add(#13#10);
        Add(#13#10);
        Add(#$1D + #$21 + #$00);
        Add('가나다라마바사아자카파타하' + #13#10);
        Add('ABCDEFGHIJKLMNOPQRSTUVXWYZ' + #13#10);
        Add(#13#10);
        sLen := '';
        for i := 1 to iTicket_Length do
          sLen := sLen + IntToStr(i mod 10);
        Add(sLen);
        for i := 0 to 2 do
          Add(#10#13);
        Add(#$1b + #$6D + #10);
      end;

      TestPrt.Resume;
      repeat
        Application.ProcessMessages;
      until (bEnd);
      Result := resInfo;
    end;
  finally
    FreeAndNil(TestPrt);
  end;

end;

function TDM.PrintTicket: TResult_IS;
const
  CRLF = #13#10;
  FontSelf = #$1D + #$21;
  FontDef = #$1D + #$21 + #$00;
var
  PrtTicket_Thread: TCOMPORT_Thread;
  sLine: String;
  i: Integer;
begin
  // 0 : 성공, 1 : 실패
  Result := SetResult(1, '');
  if (sTicketPRT_PORT = sPRT_UNUSED) then
  begin
    Result := SetResult(0, '티켓 출력 사용안함');
    Exit;
  end;

  PrtTicket_Thread := TCOMPORT_Thread.Create(True);
  sLine := '-';
  sLine := DupeString(sLine, iTicket_Length - (Length(AnsiString(sLine)) - Length(AnsiString(sLine))));
  try
    with PrtTicket_Thread do
    begin
      sPort := sTicketPRT_PORT;
      iBaudRate := iTicketPRT_BaudRate;
      with slSendText do
      begin
        // Page Mode Start
        Add(#$1b + #$40);

        // Align Center
        Add(#$1b + #$61 + #$31);

        Add(DupeString(CRLF, iTicketTopNil));
        for i := Low(arrTicket_Info) to High(arrTicket_Info) do
        begin
          with arrTicket_Info[i] do
          begin
            if bUsed then
            begin
              Add( //
                FontSelf + Chr(iExtend_X * 16 + iExtend_Y) + //
                sText + CRLF + CRLF + //
                FontDef //
                );
            end;
          end;
        end;

        Add(DupeString(CRLF, iTicketBotNil));
        // Cutting;
        Add(#$1b + #$6D + #10);
      end;

      PrtTicket_Thread.Resume;
      repeat
        Application.ProcessMessages;
      until (bEnd);
    end;
  finally
    Result := PrtTicket_Thread.resInfo;
    FreeAndNil(PrtTicket_Thread);
  end;

end;
{$ENDIF}

procedure TDM.RoundPanel(Sender: TObject);
begin
  if Sender is TPanel then
  begin
    with (Sender as TPanel) do
    begin
      with ClientRect do
      begin
        SetWindowRgn(Handle, CreateRoundRectRgn(Left, Top, Right + 1, Bottom + 1, 30, 30), True);
      end;
    end;
  end
  else if Sender is TScrollBox then
  begin
    with (Sender as TScrollBox) do
    begin
      with ClientRect do
      begin
        SetWindowRgn(Handle, CreateRoundRectRgn(Left, Top, Right + 1, Bottom + 1, 30, 30), True);
      end;
    end;
  end
  else if Sender is TFrame then
  begin
    with (Sender as TFrame) do
    begin
      with ClientRect do
      begin
        SetWindowRgn(Handle, CreateRoundRectRgn(Left, Top, Right + 1, Bottom + 1, 30, 30), True);
      end;
    end;
  end;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
{$IFDEF DEBUG}
var
  dtDateChk: TDateTime;
{$ENDIF}
begin
{$IFDEF DEBUG}
  dtDateChk := StrToDateTime('2023-05-31 오전 04:00:40');
  if dtDateChk < NOW then
  begin
    PopupMsg('테스트 기간이 종료되었습니다.#13담당자에게 문의해주세요.');
    Application.Terminate;
  end;
{$ENDIF}
  bWIN64 := TOSVersion.Architecture in [arIntelX64, arARM64];
  sAPPPATH := ExtractFilePath(Application.ExeName);

  GetFonts;
  GetComport;


  Loadini;
  FontExecute(iFONT_INSTALL);

  // db Conn
  if NOT DB_Connect then
  begin
    PopupMsg('데이터를 연결하지 못했습니다.#13설정 및 인터넷을 확인해주세요.#13');
  end;
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  Saveini;
  SetMenus;
  FontExecute(iFONT_UNINSTALL);
end;

function TDM.DB_Connect: Boolean;
var
  FDConn_Thread: TFDCONN_Thread;
  iTime: Byte;
  Form_Alert: TForm_POPUP;

  iH, iW: Integer;
  dExitCode: DWORD;
begin
  FDConn_Thread := TFDCONN_Thread.Create(True);
  Form_Alert := TForm_POPUP.Create(Self);
  try
    iTime := 0;
    FDConn_Thread.Resume;
    repeat
      Application.ProcessMessages;
      Sleep(500);
      if iTime < 50 then
      begin
        inc(iTime);
        if iTime = 5 then
        begin
          with Form_Alert do
          begin
            iH := Scn_H div 2;
            iW := Scn_W div 5;

            SetBounds(Left, Top, iW, iH);
            Timer_Timeout.Enabled := False;
            ImageCancel.Visible := False;
            Label_Title.Caption := '알림';
            Label_MSG.Caption := '메인 장치와 연결중입니다.' + #13#10 + '잠시만 기다려주세요.' + #13#10 + #13#10 + #13#10 + 'IP : ' + sDB_IP;
            Label_Timeout.Caption := sDB_PATH;
            Panel_Footer.Visible := False;
            Show;
          end;
        end;
        {
          else if iTime = 50 then
          begin
          FDConn_Thread.bRes := False;
          FDConn_Thread.bEnd := True;

          GetExitCodeThread(FDConn_Thread.Handle, dExitCode);
          TerminateThread(FDConn_Thread.Handle, dExitCode);

          Result := False;
          FDConn.Connected := False;
          end;
        }
      end;
    until (FDConn_Thread.bEnd);
    GetExitCodeThread(FDConn_Thread.Handle, dExitCode);
    TerminateThread(FDConn_Thread.Handle, dExitCode);
  finally

    Result := FDConn_Thread.bRes;
    FreeAndNil(Form_Alert);
    FreeAndNil(FDConn_Thread);
  end;
end;

procedure TDM.FontExecute(iFontType: Byte);
var
  i: Byte;
  slFontList: TStringList;
  SR_: TSearchRec;
begin
  if NOT DirectoryExists(sAPPPATH + 'Font') then
    Exit;

  slFontList := TStringList.Create;
  try
    // 폰트 파일 리스트
    if FindFirst(sAPPPATH + 'Font\*.ttf', faArchive, SR_) = 0 then
    begin
      repeat
        slFontList.Add(sAPPPATH + 'Font\' + SR_.Name);
      until FindNExt(SR_) <> 0;
      System.SysUtils.FindClose(SR_);
    end;

    LogText('Find Font File List : ' + #13#10 + slFontList.Text);

    case iFontType of
      iFONT_INSTALL:
        begin
          for i := 0 to slFontList.Count - 1 do
            AddFontResource(PChar(slFontList[i]));
        end;
      iFONT_UNINSTALL:
        begin
          for i := 0 to slFontList.Count - 1 do
            RemoveFontResource(PChar(slFontList[i]));
        end;
    end;
    PostMessage(HWND_BROADCAST, WM_FONTCHANGE, 0, 0);
  finally
    FreeAndNil(slFontList);
  end;

end;

function TDM.SetMenus: Integer;
var
  i: Cardinal;
  sSection: String;
  ini: TMemIniFile;
begin
  Result := -1;

  ini := TMemIniFile.Create(sAPPPATH + 'AIRORDER_PEOPLE.ini', TEncoding.UTF8);
  ini.Clear;
  try
    with ini do
    begin
      if Length(arrStocks) = 0 then
        Exit;

      for i := Low(arrStocks) to High(arrStocks) do
      begin
        sSection := 'PEOPLE_' + IntToStr(i);
        with arrStocks[i] do
        begin
          WriteString(sSection, 'CODE', sCode);
          WriteString(sSection, 'NAME', sName);
          WriteString(sSection, 'sNotice', sNotice);
          WriteInteger(sSection, 'MAXORDER', iMAX);
          WriteInteger(sSection, 'AMOUNT', iAmt);
          WriteBool(sSection, 'USED', bUsed);
        end;
      end;
    end;
  finally
    ini.UpdateFile;
    ini.Free;
  end;

end;

function TDM.GetMenus: Integer;
var
  i: Cardinal;
  SL: TStringList;
  ini: TMemIniFile;
begin
  Result := -1;
  ini := TMemIniFile.Create(sAPPPATH + 'AIRORDER_PEOPLE.ini', TEncoding.UTF8);
  SL := TStringList.Create;
  try
    with ini do
    begin
      ini.ReadSections(SL);
      if SL.Count = 0 then
        Exit
      else
        SetLength(arrStocks, SL.Count);

      for i := Low(arrStocks) to High(arrStocks) do
      begin
        with arrStocks[i] do
        begin
          sCode := ReadString(SL[i], 'CODE', '');
          sName := ReadString(SL[i], 'NAME', '');
          sNotice := ReadString(SL[i], 'sNotice', '');
          iMAX := ReadInteger(SL[i], 'MAXORDER', 0);
          iAmt := ReadInteger(SL[i], 'AMOUNT', 0);
          bUsed := ReadBool(SL[i], 'USED', True);
        end;
      end;
    end;
  finally
    Result := SL.Count;
    SL.Free;
    ini.Free;
  end;
end;

function TDM.SetResult(iRes: Integer; sRes: String): TResult_IS;
begin
  //
  LogText('Result CODE : ' + IntToStr(iRes) + ', MSG :' + sRes);
  Result.iRes := iRes;
  Result.sRes := sRes;
end;

function TDM.GetComport: TResult_IS;
var
  i: Integer;
  Reg: TRegistry;
  regList: TStringList;
begin
  try
    try
      Reg := TRegistry.Create;
      regList := TStringList.Create;

      with Reg do
      begin
        RootKey := HKEY_LOCAL_MACHINE;
        if OpenKey('\HARDWARE\DEVICEMAP\SERIALCOMM', False) then
        begin
          GetValueNames(regList);
          SetLength(arrComPort, regList.Count + 1);
          arrComPort[Low(arrComPort)] := sPRT_UNUSED;
          if regList.Count = 0 then
          begin
            Result.iRes := 0;
            Result.sRes := '사용 가능한 포트가 없습니다.';
          end
          else
          begin
            for i := 0 to regList.Count - 1 do
            begin
              arrComPort[i + 1] := ReadString(regList[i]);
              Result.sRes := Result.sRes + ReadString(regList[i]) + #13#10;
            end;
            Result.iRes := regList.Count;
          end;
        end;
      end;
    except
      ON E: Exception do
      begin
        LogText('프린터 포트 가져오는 중 오류 : ' + E.Message);
        PopupMsg('프린터 포트 정보를 가져올 수 없습니다.');
      end;
    end;
  finally
    Reg.CloseKey;
    FreeAndNil(regList);
    FreeAndNil(Reg);
  end;
end;

function TDM.GetFonts: TResult_IS;
var
  i, j: Integer;
begin
  SetLength(arrFont, Screen.Fonts.Count);
  j := 0;
  for i := 0 to Screen.Fonts.Count - 1 do
  begin
    if Pos('@', Screen.Fonts[i]) = 0 then
    begin
      arrFont[j] := Screen.Fonts[i];
      inc(j);
    end;
  end;

  Result.iRes := Screen.Fonts.Count;
  Result.sRes := Screen.Fonts.Text;

end;

function TDM.GetProcessChk(sEXEName: String): Cardinal;
var
  Process32: TProcessEntry32;
  ExeHandle: THandle;
  NExt: Boolean;

begin
  Result := 0;
  Process32.dwSize := Sizeof(TProcessEntry32);
  ExeHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  try
    try
      if Process32First(ExeHandle, Process32) then
      begin
        repeat
          NExt := Process32Next(ExeHandle, Process32);
          if AnsiCompareText(Process32.szExeFile, Trim(sEXEName)) = 0 then
          begin
            Result := Process32.th32ProcessID;
            break;
          end;
        until NOT NExt;
      end;
    except
      ON E: Exception do
      begin
        LogText('GetProcessChk Err : ' + E.Message);
        Result := 0;
      end;
    end;
  finally
    CloseHandle(ExeHandle);
  end;
end;

function TDM.GetWait: Integer;
begin
  if NOT FDConn.Connected then
  begin
    Result := 0;
    Exit;
  end;
  // 대기팀 검색
  with FDQ do
  begin
    if Active then
      Active := False;

    SQl.Text := 'SELECT COUNT(h.TOTLACNT) as "WAITCnt" FROM ' + //
      '(' + //
      '	SELECT COUNT(PSEQ) AS TOTLACNT FROM HREADYTABLE ' + //
      '	WHERE KITPRN1 = 0 ' + //
      '	GROUP BY PSEQ ' + //
      ') AS H'; //
    Open;
    if Not Eof then
    begin
      iWaitTeam := FieldByName('WAITCnt').AsInteger;

    end
    else
    begin
      iWaitTeam := 0;
    end;
  end;
  Result := iWaitTeam;
end;

procedure TDM.PopupKeyboard;
var
  Red: LongBool;
  oskHandle: THandle;
begin
  if bWIN64 then
  begin
    if Wow64DisableWow64FsRedirection(Red) then
    begin
      ShellExecute(Application.Handle, 'open', PChar('C:\Windows\System32\osk.exe'), nil, nil, SW_SHOWNORMAL);
      if Not Wow64EnableWow64FsRedirection(Red) then
        RaiseLastOSError;
    end
    else
      RaiseLastOSError;
  end
  else
    ShellExecute(Application.Handle, 'open', PChar('C:\Windows\System32\osk.exe'), nil, nil, SW_SHOWNORMAL);
end;

function TDM.PopupKeyPad(sType: String): String;
var
  FormBG: TForm;
  iW, iH: Integer;
begin
  //
  try
    FormBG := TForm_BG.Create(Self);
    FormBG.Show;

    Form_Keypad := TForm_Keypad.Create(Self);
    try
      with Form_Keypad do
      begin
        iH := Scn_H div 2;
        iW := FormMain_Re.Width div 5;

        SetBounds(Left, Top, iW, iH);
        if sType <> '' then
        begin
          Hint := sType;
        end;
        ShowModal;
        if ModalResult = mrOK then
        begin
          Result := sTel;
        end
        else
          Result := 'Cancel';
      end;
    finally
      Form_Keypad.Free;
      Form_Keypad := nil;
    end;
  finally
    FormBG.Free;
    FormBG := nil;
  end;
end;

function TDM.PopupList(arrName: array of String): TResult_IS;
var
  ListItem: TListItem;
  i: Integer;

  iW, iH: Integer;
  FormBG: TForm;
begin

  //
  FormBG := TForm_BG.Create(Self);
  FormBG.Show;
  FormList := TFormList.Create(Self);
  try
    FormList.ListViewList.Clear;
    for i := Low(arrName) to High(arrName) do
    begin
      ListItem := FormList.ListViewList.Items.Add;
      ListItem.Caption := arrName[i];
    end;

    with FormList do
    begin
      iH := FormMain_Re.Height div 2;
      iW := FormMain_Re.Width div 5;

      SetBounds(Left, Top, iW, iH);

      ShowModal;
      if ModalResult = mrOK then
        Result := SetResult(ListViewList.Selected.Index, ListViewList.Selected.Caption)
      else
        Result := SetResult(iPOPUP_USERCANCEL, '취소/실패');
    end;
  finally
    FormList.Free;
    FormList := nil;
    FormBG.Free;
    FormBG := nil;
  end;
end;

procedure TDM.Loadini;
const
  cPRT = 'PRT';
  cTICKET = 'TICKET';
  cSYSTEM = 'AIRORDER';
  cDB = 'DATABASE';

var
  memini: TMemIniFile;
  i: Word;
begin
  //
  LogText('Loadini Start');
  memini := TMemIniFile.Create(sAPPPATH + 'AIRORDER.ini', TEncoding.UTF8);
  try
    with memini do
    begin
      sTicketPRT_PORT := ReadString(cPRT, 'PORT', sTicketPRT_PORT);
      iTicketPRT_BaudRate := ReadInteger(cPRT, 'BAUDRATE', iTicketPRT_BaudRate);
      iTicket_Length := ReadInteger(cPRT, 'LINELENGTH', iTicket_Length);

      iTicketType := ReadInteger(cTICKET, 'TICKETTYPE', iTicketType);
      iTicketCnt := ReadInteger(cTICKET, 'TICKETCOUNT', iTicketCnt);
      iTicketTopNil := ReadInteger(cTICKET, 'TICKET_TOP', iTicketTopNil);
      iTicketBotNil := ReadInteger(cTICKET, 'TICKET_BOT', iTicketBotNil);

      sSystemFont := ReadString(cSYSTEM, 'SYSTEMFONT', sSystemFont);
      iCnt_Rows := ReadInteger(cSYSTEM, 'IROWS', iCnt_Rows);
      iCnt_Cols := ReadInteger(cSYSTEM, 'ICOLS', iCnt_Cols);
      iMenuViewType := ReadInteger(cSYSTEM, 'MENUVIEWTYPE', iMenuViewType);
      bBreakTime := ReadBool(cSYSTEM, 'BREAKTIME', bBreakTime);
      tBreakStart := ReadTime('cSYSTEM', 'BREAKTIME_START', tBreakStart);
      tBreakEnd := ReadTime('cSYSTEM', 'BREAKTIME_END', tBreakEnd);

      iKakaoAlert := ReadInteger(cSYSTEM, 'KAKAOALERT', iKakaoAlert);
      iLanguage_Default := ReadInteger(cSYSTEM, 'LANGUAGE_DEFAULT', iLanguage_Default);
      bLanguage_KOR := ReadBool(cSYSTEM, 'LANGUAGE_KOREA', bLanguage_KOR);
      bLanguage_ENG := ReadBool(cSYSTEM, 'LANGUAGE_ENGLISH', bLanguage_ENG);
      bLanguage_JPN := ReadBool(cSYSTEM, 'LANGUAGE_JAPEN', bLanguage_JPN);
      bLanguage_CHA := ReadBool(cSYSTEM, 'LANGUAGE_CHINA', bLanguage_CHA);

      iDB_POSNO := ReadInteger(cDB, 'POSNO', iDB_POSNO);
      sDB_IP := ReadString(cDB, 'DBIP', sDB_IP);
      sDB_PATH := ReadString(cDB, 'DBPATH', sDB_PATH);
      sDB_ID := ReadString(cDB, 'DBID', sDB_ID);
      sDB_PW := ReadString(cDB, 'DBPW', sDB_PW);

      SetLength(arrTicket_Info, Length(arrTicket_1));
      for i := Low(arrTicket_Info) to High(arrTicket_Info) do
      begin
        with arrTicket_Info[i] do
        begin
          bUsed := ReadBool(cTICKET, arrTicket_1[i] + '_USED', bTicket_DefaultUsed);
          sName := ReadString(cTICKET, arrTicket_1[i] + '_NAME', arrTicket_DefaultName[i]);
          iExtend_X := ReadInteger(cTICKET, arrTicket_1[i] + '_X', iTicket_DefaultExtend);
          iExtend_Y := ReadInteger(cTICKET, arrTicket_1[i] + '_Y', iTicket_DefaultExtend);
          iAlign := ReadInteger(cTICKET, arrTicket_1[i] + '_Align', 0);

        end;

      end;
    end;

  finally
    FreeAndNil(memini);
    LogText('Loadini End');
  end;
end;

procedure TDM.Saveini;
const
  cPRT = 'PRT';
  cTICKET = 'TICKET';
  cSYSTEM = 'AIRORDER';
  cDB = 'DATABASE';

var
  i: Word;
  memini: TMemIniFile;
begin
  //
  LogText('Saveini Start');
  memini := TMemIniFile.Create(sAPPPATH + 'AIRORDER.ini', TEncoding.UTF8);
  try
    with memini do
    begin
      WriteString(cPRT, '', '');
      WriteString(cPRT, 'PORT', sTicketPRT_PORT);
      WriteInteger(cPRT, 'BAUDRATE', iTicketPRT_BaudRate);
      WriteInteger(cPRT, 'LINELENGTH', iTicket_Length);

      WriteInteger(cTICKET, 'TICKETTYPE', iTicketType);
      WriteInteger(cTICKET, 'TICKETCOUNT', iTicketCnt);
      WriteInteger(cTICKET, 'TICKET_TOP', iTicketTopNil);
      WriteInteger(cTICKET, 'TICKET_BOT', iTicketBotNil);

      WriteString(cSYSTEM, 'SYSTEMFONT', sSystemFont);
      WriteInteger(cSYSTEM, 'IROWS', iCnt_Rows);
      WriteInteger(cSYSTEM, 'ICOLS', iCnt_Cols);
      WriteInteger(cSYSTEM, 'MENUVIEWTYPE', iMenuViewType);
      WriteBool(cSYSTEM, 'BREAKTIME', bBreakTime);
      WriteTime('cSYSTEM', 'BREAKTIME_START', tBreakStart);
      WriteTime('cSYSTEM', 'BREAKTIME_END', tBreakEnd);

      WriteInteger(cSYSTEM, 'KAKAOALERT', iKakaoAlert);
      WriteInteger(cSYSTEM, 'LANGUAGE_DEFAULT', iLanguage_Default);
      WriteBool(cSYSTEM, 'LANGUAGE_KOREA', bLanguage_KOR);
      WriteBool(cSYSTEM, 'LANGUAGE_ENGLISH', bLanguage_ENG);
      WriteBool(cSYSTEM, 'LANGUAGE_JAPEN', bLanguage_JPN);
      WriteBool(cSYSTEM, 'LANGUAGE_CHINA', bLanguage_CHA);

      WriteInteger(cDB, 'POSNO', iDB_POSNO);
      WriteString(cDB, 'DBIP', sDB_IP);
      WriteString(cDB, 'DB_PATH', sDB_PATH);
      WriteString(cDB, 'DB_ID', sDB_ID);
      WriteString(cDB, 'DB_PW', sDB_PW);

      for i := Low(arrTicket_Info) to High(arrTicket_Info) do
      begin
        with arrTicket_Info[i] do
        begin
          if i = Low(arrTicket_Info) then
          begin
            sText := sTicketTitle;
            iAlign := 0;
          end
          else
          begin
            iAlign := 0;
            case i of
              1:
                begin
                  sText := '대기번호 : 24';
                end;
              2:
                begin
                  sText := '대기인원 : 4';
                end;
              3:
                begin
                  sText := '접수일시 : 2023-01-01 12:50:00';
                end;
              4:
                begin
                  sText := '입장시 해당 출력물을 꼭 지참해주세요!';
                end;
            end;
          end;

          WriteBool(cTICKET, arrTicket_1[i] + '_USED', bUsed);
          WriteString(cTICKET, arrTicket_1[i] + '_NAME', sName);
          WriteInteger(cTICKET, arrTicket_1[i] + '_X', iExtend_X);
          WriteInteger(cTICKET, arrTicket_1[i] + '_Y', iExtend_Y);
          WriteInteger(cTICKET, arrTicket_1[i] + '_X', iExtend_X);
          WriteInteger(cTICKET, arrTicket_1[i] + '_Y', iExtend_Y);
          WriteString(cTICKET, arrTicket_1[i] + '_Text', sText);
          WriteInteger(cTICKET, arrTicket_1[i] + '_Align', iAlign);

        end;
      end;

    end;
  finally
    memini.UpdateFile;
    FreeAndNil(memini);
    LogText('Saveini End');
  end;
end;

procedure TDM.LogText(sText: String);
var
  F: TextFile;
  FName: String;

  ErrMSG: String;
begin
  try
    try
      CreateDir(sAPPPATH + 'Log');

      FName := sAPPPATH + 'Log\AIRK2_Log' + FormatDateTime('YYYYMMDD', NOW) + '.txt';
      AssignFile(F, FName);
      if FileExists(FName) then
      begin
        Append(F);
      end
      else
      begin
        Rewrite(F);
      end;

      WriteLn(F, FormatDateTime('YYYYMMDD HH:MM:SS', NOW) + ' : ' + sText);
      CloseFile(F);
    except
      On E: Exception do
      begin
        ErrMSG := E.Message;
        CloseFile(F);
      end;
    end;

  finally
  end;
end;

function TDM.NextOrderNO: Integer;
begin
  //
end;

function TDM.NextSeq(sTableName, sColName: String): Integer;
begin
  //
  if NOT FDConn.Connected then
  begin
    Result := -1;
    Exit;
  end;

  try
    with FDQ do
    begin
      if Active then
        Active := False;

      SQl.Text := 'SELECT MAX(' + sColName + ') AS "MAXSEQ" FROM ' + sTableName;
      // ParamByName('sColName').AsString := sColName;
      // ParamByName('sTableName').AsString := sTableName;
      Open;
      if Not Eof then
      begin
        Result := FieldByName('MAXSEQ').AsInteger + 1;
      end
      else
      begin
        Result := 1;
      end;
    end;
  except
    ON E: Exception do
    begin
      LogText('DB_NEXTSEQ Fail : ' + E.Message);
      Result := -1;
    end;
  end;

end;

procedure TDM.SetBG(bSet: Boolean);
begin
  if bSet then
  begin
    if NOT Assigned(Form_BG) then
    begin
      Form_BG := TForm_BG.Create(Self);
      with Form_BG do
      begin
        with Form_BG do
        begin
          AlphaBlend := True;
          AlphaBlendValue := 200;
          SetBounds(Scn_X, Scn_Y, Scn_W, Scn_H);
          Show;
        end;
      end;
    end;
  end
  else
  begin
    if Assigned(Form_BG) then
    begin
      FreeAndNil(Form_BG);
    end;
  end;
end;

function TDM.SetPrtLine: String;
begin
  //
  Result := #$10;
  Result := Result + '---------------------' + #13#10;
  Result := Result + #$1D + #$21 + #$00;
end;

function TDM.SetPrtText(sText: String): String;
begin
  Result := SetPrtText(11, sText);
end;

function TDM.SetPrtText(iTextSize: Byte; sText: String): String;
begin
  Result := #$1D + #$21 + IntToHex(iTextSize);
  Result := Result + Stringreplace(sText, '#13', #13#10, [rfReplaceAll]) + #13#10;
  Result := Result + #$1D + #$21 + #$00;
end;

procedure TDM.SetTables;
var
  i: Integer;
begin
  //
  with FDQ do
  begin
    if Active then
      Active := False;

    OptionsIntf.FetchOptions.RecordCountMode := cmTotal;
    try
      SQl.Text := 'SELECT POSNO, ISEQ, TNAME, POSX, POSY, Width, Height FROM HTABLE_NM';
      Open;
      if RecordCount <> 0 then
      begin
        SetLength(arrTables, RecordCount);
        i := 0;
        While Not Eof do
        begin
          with arrTables[i] do
          begin
            iSeq := FieldByName('ISEQ').AsInteger;
            sTableName := FieldByName('TName').AsString;
            iX := FieldByName('POSX').AsInteger;
            iY := FieldByName('POSY').AsInteger;
            iW := FieldByName('Width').AsInteger;
            iH := FieldByName('Height').AsInteger;
          end;
          inc(i);
          NExt;
        end;
      end
      else
      begin
        PopupMsg('좌석 정보가 없습니다.#13매장직원에게 문의해주세요.');
      end;
    finally
      OptionsIntf.FetchOptions.RecordCountMode := cmVisible;
    end;
  end;
end;

function TDM.SetWaiting(iSetType: Byte; sTelNo: String): TResult_IS;
{ 0 : 성공, 1 : 실패 }
var
  WaitSeq, WaitNo, i: Integer;
  sSTOCKNAME: AnsiString;
begin
  Result.iRes := 1;
  Result.sRes := 'DB 연결안됨';
  if NOT FDConn.Connected then
    Exit;
  with FDQ do
  begin;
    // Get Seq
    WaitSeq := NextSeq('HReadyTable', 'iseq');
    if WaitSeq <> -1 then
    begin
      if Active then
        Active := False;
      SQl.Clear;

      case iSetType of
        iWAITING_INSERT:
          begin
            WaitNo := NextSeq('HREADYTABLE', 'TABLENO');
            for i := Low(arrWaitingInfo) to High(arrWaitingInfo) do
            begin
              if arrWaitingInfo[i].iRes = 0 then
                Continue;

              sSTOCKNAME := AnsiString(arrWaitingInfo[i].sRes);
              sSTOCKNAME := Format('%-' + IntToStr(Length(sSTOCKNAME)) + 's', [sSTOCKNAME]);

              SQl.Clear;
              SQl.Add(' INSERT INTO HREADYTABLE (ISEQ, POSNO, PNDT, PSEQ, TABLENO, RTIME, KITPRN1, DLADDR, STOCKNAME, QTY) ');
              SQl.Add(' VALUES (:ISEQ, :POSNO, :PNDT, :PSEQ, :TABLENO, :RTIME, :KITPRN1, :DLADDR, :STOCKNAME, :QTY)');
              ParamByName('ISEQ').AsInteger := WaitSeq;
              ParamByName('POSNO').AsInteger := iDB_POSNO;
              ParamByName('PNDT').AsString := FormatDateTime('YYYYMMDD', NOW);
              ParamByName('PSEQ').AsInteger := WaitNo;
              ParamByName('TABLENO').AsInteger := WaitNo;
              ParamByName('RTIME').AsString := FormatDateTime('HHMMSS', NOW);
              ParamByName('KITPRN1').AsString := '0';
              ParamByName('DLADDR').AsString := sTelNo;

              ParamByName('STOCKNAME').AsString := sSTOCKNAME;
              ParamByName('QTY').AsInteger := arrWaitingInfo[i].iRes;

              ExecSQL;
            end;
          end;
        iWAITING_UPDATE:
          begin
            // Unused;
          end;
        iWAITING_DELETE:
          begin
            SQl.Add(' DELETE FROM hreadytable WHERE DLADDR = :DLADDR');
            ParamByName('DLADDR').AsString := sTelNo;
            ExecSQL;
          end;
      end;

      try
        Result.iRes := 0;
        Result.sRes := IntToStr(WaitNo);
      except
        ON E: Exception do
        begin
          LogText('DB_WAITING/TicketPrint Fail : ' + E.Message);
          Result.iRes := 1;
          Result.sRes := 'DB/프린터 처리실패';
        end;
      end;
    end;
    GetWait;
  end;
end;

function TDM.Translation(iLangType: Byte; sText: String): TResult_IS;
begin
  //
end;

{ TCOMPORT_Thread }

{$IFDEF WIN32}

constructor TCOMPORT_Thread.Create(CreateSuspended: Boolean);
begin
  //
  inherited;
  Comport := TComPort.Create(nil);
  slSendText := TStringList.Create;
  bEnd := False;
end;

procedure TCOMPORT_Thread.Execute;
var
  i: Integer;
begin
  inherited;
  //
  with Comport do
  begin
    TriggersOnRxChar := False;
    SyncMethod := smNone;
    Port := sPort;
    case iBaudRate of
      0:
        BaudRate := br9600;
      1:
        BaudRate := br19200;
      2:
        BaudRate := br38400;
      3:
        BaudRate := br115200;
    end;

    try
      try
        Comport.Open;
        if NOT Connected then
          resInfo := DM.SetResult(-1, '포트연결 실패')
        else
        begin
          for i := 0 to slSendText.Count - 1 do
            WriteStr(AnsiString(slSendText[i]));

          resInfo := DM.SetResult(0, '출력전송 완료');
        end;
      except
        ON E: Exception do
        begin
          DM.LogText('PRT Thread Error : ' + E.Message);
          resInfo := DM.SetResult(1, '티켓을 정상적으로 출력하지 못했습니다.' + #13#10 + '프린터 포트 및 연결 상태를 확인해주세요.');
          // '출력 처리중 실패 : ' + E.Message
        end;
      end;
    finally
      bEnd := True;
      FreeAndNil(Comport);
      FreeAndNil(slSendText);
    end;
  end;
end;
{$ENDIF}
{ THTTP_Thread }

constructor THTTP_Thread.Create(CreateSuspended: Boolean);
begin
  inherited;
  HTTP_Request := TNetHTTPRequest.Create(nil);
  HTTP_Client := TNetHTTPClient.Create(nil);
end;

procedure THTTP_Thread.Execute;
begin
  inherited;
  try

  finally

  end;
end;

{ TFDCONN_Thread }

procedure TFDCONN_Thread.Execute;
begin
  inherited;
  bRes := False;
  bEnd := False;
  try
    try
      with DM do
      begin
        if FDConn.Connected then
          FDConn.Connected := False;

        with FDConn do
        begin
          LoginPrompt := False;
          DriverName := 'FB';

          with Params do
          begin
            Database := sDB_IP + ':' + sDB_PATH;
            DriverID := 'FB';
            UserName := sDB_ID;
            Password := sDB_PW;
            Connected := True;
          end;
          bRes := True;
        end;
      end;
    except
      On E: Exception do
      begin
        DM.LogText('DB_Connect Fail : ' + E.Message);
        // DM.PopupMsg('메인DB와 연결하지 못했습니다.#13인터넷 및 장치상태를 확인해주세요.');
        bRes := False;
      end;
    end;
  finally
    bEnd := True;
  end;

end;

end.