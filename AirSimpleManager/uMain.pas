unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Imaging.JPEG, Vcl.Imaging.pngImage, Vcl.Imaging.GIFImg, ShellApi,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Frame_Nav,
  Frame_ComboBox, ImagingComponents;

type

  TForm_AirManager = class(TForm)
    Panel_Header: TPanel;
    Panel_Body: TPanel;
    Panel_Booter: TPanel;
    Panel_Nav: TPanel;
    Label_Version: TLabel;
    Label_title: TLabel;
    ColorDialog1: TColorDialog;
    Image_ToolBar: TImage;
    Panel_Left: TPanel;
    Panel_Form: TPanel;
    Image_Close: TImage;
    Image_reSize: TImage; // 5일 남음
    Image_Hide: TImage;
    Frame_ENV_TouchKeyBoard: TFrame_ENV_Nav;
    Label_Eg: TLabel;
    Label_WiseSaying: TLabel;
    Frame_ENV_ComboBox1: TFrame_ENV_ComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

    procedure Panel_HeaderMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
    procedure Image_ToolBarClick(Sender: TObject);
    procedure Image_CloseClick(Sender: TObject);
    procedure Image_reSizeClick(Sender: TObject);
    procedure Image_HideClick(Sender: TObject);

    procedure Label_VersionClick(Sender: TObject);
    procedure Label_EgClick(Sender: TObject);

    procedure GetCategory(iType: integer);
    procedure CategoryClick(Sender: TObject);
    procedure GetNav(CategoryNum: Byte);
    procedure NavClick(Sender: TObject);
    procedure GetEnvForm(CategoryNum, NavNum: Byte);

    procedure Frame_ENV_SaveClick(Sender: TObject);
    procedure Frame_ENV_ASClick(Sender: TObject);
    procedure Frame_ENV_TouchKeyBoardClick(Sender: TObject);
    procedure Frame_ENV_TouchKeyBoardLabel_ValueClick(Sender: TObject);

    procedure Recv_Msg(var MSG: TWMCopyData); message WM_COPYDATA;
  private
    { Private declarations }
  public
    { Public declarations }
    Select_Category, Select_Nav: Byte;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure FormResizeMSG(var Message: TMessage); message WM_EXITSIZEMOVE;
  end;

var
  Form_AirManager: TForm_AirManager;
  BodyClass: TPersistentClass;
  BodyForm: TForm;
  bMainForm_Move: Boolean = False;
  iMainForm_MoveCnt, iMainForm_MoveX, iMainForm_MoveY: integer;
  iViewType: integer;

  bLogin_ENV1_4: Boolean;
  arrWiseSaying: array [0 .. 7] of String = (
    '나 아닌 누구도 자신을 구원할 수 없다. 스스로의 길을 걸어가야 한다.',
    '남을 위한다는 명분으로 자신의 욕망을 합리화하지 말라',
    '오늘의 우리는 과거의 우리가 생각한 모습이다. 인간은 생각한대로 이루어진다.',
    '나는 어떤 행동에도 변하지 않고 닥쳐오는 운명의 존재를 믿지 않는다, 그러나, 행동하지 않는 사람에게 다가오는 운명은 믿는다.',
    '활을 쏠때, 흔들리는 건 내 눈과, 솰시위를 당기는 손, 명중할 수 있을까 의심하는 마음이다. 과녁은 늘 제자리에 있다.',
    '스스로 알을 꺠면 한 마리의 병아리가 되지만, 남이 깨주면 계란 프라이가 된다.',
    '인생에서 가장 슬픈 세가지, 할 수 있었는데, 해야 했는데, 해야만 했는데',
    '실패는 잊어라, 그러나 그것이 주는 교훈을 절대 잊어서는 안된다.   - Herbert Spencer Gasser'
  );

implementation

{$R *.dfm}

uses uDM, fmENV1_1, fmENV3_2, MiniEgg, fmENV5_1, fmENV1_4,
  fmENV1_2, fmENV2_1, fmENV3_1, fmENV4_1, fmENV1_3, fmENV3_3, fmENV2_2, uNav, fmSYS1_1, fmSYS1_2, fmSYS1_3, fmDATA1_1,
  fmDATA1_2, fmDATA1_3, fmDATA2_1, fmDATA2_2, fmDATA2_3;

procedure TForm_AirManager.CreateParams(var Params: TCreateParams);
begin
  inherited;
  // 폼 사이즈 조절
  Params.ExStyle := Params.ExStyle or WS_EX_STATICEDGE;
  Params.Style := Params.Style or WS_SIZEBOX;
end;

procedure TForm_AirManager.FormCreate(Sender: TObject);
begin
  Select_Nav := 255;
  RegisterClass(TForm_ENV1_1);
  RegisterClass(TForm_ENV1_2);
  RegisterClass(TForm_ENV1_3);
  RegisterClass(TForm_ENV1_4);

  RegisterClass(TForm_ENV2_1);
  RegisterClass(TForm_ENV2_2);

  RegisterClass(TForm_ENV3_1);
  RegisterClass(TForm_ENV3_2);
  RegisterClass(TForm_ENV3_3);

  RegisterClass(TForm_ENV4_1);
  RegisterClass(TForm_ENV5_1);

  RegisterClass(TForm_DATA1_1);
  RegisterClass(TForm_DATA1_2);
  RegisterClass(TForm_DATA1_3);

  RegisterClass(TForm_DATA2_1);
  RegisterClass(TForm_DATA2_2);
  RegisterClass(TForm_DATA2_3);

  RegisterClass(TForm_SYS1_1);
  RegisterClass(TForm_SYS1_2);
  RegisterClass(TForm_SYS1_3);
end;

procedure TForm_AirManager.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = 121) then
  begin
    Key := 0;
    Self.OnKeyDown := nil;
    Image_ToolBarClick(Image_ToolBar);
  end;
end;

procedure TForm_AirManager.FormResizeMSG(var Message: TMessage);
begin
  SendMessage(Panel_Nav.Handle, WM_SETREDRAW, 1, 0);
  RedrawWindow(Panel_Nav.Handle, nil, 0, RDW_ERASE or RDW_INVALIDATE or RDW_FRAME or RDW_ALLCHILDREN);

  if BodyForm <> nil then
    SendMessage(BodyForm.Handle, WM_EXITSIZEMOVE, 0, 0);
end;

procedure TForm_AirManager.FormShow(Sender: TObject);
begin
{$IFDEF DEBUG}
  Label_title.Caption := Label_title.Caption + ' [개발자 모드]';
  with Screen.Monitors[Screen.MonitorCount - 1] do
{$ELSE}
  with Screen.Monitors[0] do
{$ENDIF}
  begin
    Frame_ENV_TouchKeyBoard.Label_Value.ShowHint := False;
    SetBounds(Left, Top, Width, Height);
  end;
  BodyForm := nil;
  DM.GetENVList;
  GetCategory(SideNav_ENV);

  bLogin_ENV1_4 := False;
  Constraints.MinHeight := 620;
  Constraints.MinWidth := 1024;

  Label_Version.Caption := ProgramVer;
  Label_WiseSaying.Visible := bUpdate;
end;

procedure TForm_AirManager.Frame_ENV_ASClick(Sender: TObject);
begin
  try
    ShellExecute(HANDLE_FLAG_INHERIT, 'Open', Pchar('"shell:Appsfolder\Microsoft.MicrosoftEdge_8wekyb3d8bbwe!MicrosoftEdge"'),
      'https://www.whelper.co.kr/client/main.do', nil, SW_SHOWMAXIMIZED);
  except
    ON E: Exception do
    begin
      ShellExecute(HANDLE_FLAG_INHERIT, 'Open', 'iexplore', 'https://www.whelper.co.kr/client/main.do', nil, SW_SHOWMAXIMIZED);
    end;
  end;
end;

procedure TForm_AirManager.Frame_ENV_SaveClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm_AirManager.Frame_ENV_TouchKeyBoardClick(Sender: TObject);
begin
  DM.TouchKeyBoard;
end;

procedure TForm_AirManager.Frame_ENV_TouchKeyBoardLabel_ValueClick(Sender: TObject);
begin
  Frame_ENV_TouchKeyBoard.Label_ValueClick(Sender);

end;

procedure TForm_AirManager.GetCategory(iType: integer);
var
  i: Byte;
  arrDynamic: TDyanmicArr_Str;
begin
  if Panel_Left.ControlCount <> 0 then
  begin
    with Panel_Left do
    begin
      for i := ControlCount - 1 Downto 0 do
      begin
        if Controls[i] is TFrame_ENV_Nav then
        begin
          if (Controls[i] as TFrame_ENV_Nav).Align <> alBottom then
            (Controls[i] as TFrame_ENV_Nav).Free;
        end;

      end;
    end;

  end;
  case iType of
    SideNav_ENV:
      begin
        arrDynamic := DM.CopyArr(arrENV_Category);
      end;
    SideNav_Data:
      begin
        arrDynamic := DM.CopyArr(arrData_Category);
      end;
    SideNav_System:
      begin
        arrDynamic := DM.CopyArr(arrSystem_Category);
      end;
  end;

  // 설정 대분류 가져오기
  begin
    for i := Low(arrDynamic) to High(arrDynamic) do
    begin
      with TFrame_ENV_Nav.Create(Self) do
      begin
        Parent := Panel_Left;
        Align := alBottom;
        Color := Panel_Left.Color;
        Name := 'Category_' + IntToStr(i);
        Hint := arrDynamic[i];
        Tag := i;

        Height := 80;
        Top := i * 100;

        with Label_Value do
        begin
          Caption := arrDynamic[i];
          font.Color := clWhite;
        end;

        Color := $00A4580B;
        Label_Value.Color := $00A4580B;

        OnClick := CategoryClick;
        Align := alTop;
      end;
    end;

  end;
  GetNav(0);
end;

procedure TForm_AirManager.GetNav(CategoryNum: Byte);
var
  i: Byte;
  arrDynamic: TDyanmicArr_Str;
begin
  //
  if Panel_Nav.ControlCount <> 0 then
  begin
    for i := Panel_Nav.ControlCount - 1 Downto 0 do
    begin
      if Panel_Nav.Controls[i] is TFrame_ENV_Nav then
        TFrame_ENV_Nav(Panel_Nav.Controls[i]).Free;
    end;
  end;

  i := CategoryNum;
  case iViewType of
    SideNav_ENV:
      begin
        arrDynamic := DM.CopyArr(arrENV_Nav[i]);
      end;
    SideNav_Data:
      begin
        arrDynamic := DM.CopyArr(arrData_Nav[i]);
      end;
    SideNav_System:
      begin
        arrDynamic := DM.CopyArr(arrSystem_Nav[i]);
      end;
  end;

  for i := Low(arrDynamic) to High(arrDynamic) do
  begin
    if arrDynamic[i] = '' then
      continue;

    if (iViewType = SideNav_Data) AND (CategoryNum = 1) AND (i = 2) AND (TimeSaleStaticLock = False) then
    begin
      continue;
    end;

    with TFrame_ENV_Nav.Create(Self) do
    begin
      Visible := False;
      DoubleBuffered := True;
      Width := 180;
      Left := Panel_Nav.Width - Width;
      Parent := Panel_Nav;
      Align := alLeft;
      Name := 'Nav_' + IntToStr(i);
      Color := Panel_Nav.Color;
      Hint := arrDynamic[i];
      Tag := i;

      with ClientRect do
      begin
        SetWindowRgn(Handle, CreateRoundRectRgn(Left, Top, Right + 1, Bottom + 1, 10, 10), True);
      end;

      with Label_Value do
      begin
        Tag := i;
        Caption := arrDynamic[i];
        font.Color := clWhite;
      end;

      Color := $00814608;
      Label_Value.Color := $00814608;

      OnClick := NavClick;
      Visible := True;
    end;
  end;

  NavClick(TFrame_ENV_Nav(FindComponent('Nav_0')));
end;

procedure TForm_AirManager.NavClick(Sender: TObject);
var
  i: integer;
begin
  if bSQLExecute then
    Exit;

  Select_Nav := (Sender as TFrame_ENV_Nav).Tag;
  for i := 0 to Panel_Nav.ControlCount - 1 do
  begin
    if (Panel_Nav.Controls[i] is TFrame_ENV_Nav) then
    begin
      with TFrame_ENV_Nav(Panel_Nav.Controls[i]) do
      begin
        if Tag = Select_Nav then
        begin
          Color := clWhite; // $00BD864D;
          Label_Value.Color := clWhite;
          Label_Value.font.Color := cLabel_Font;
        end
        else
        begin
          Color := $00814608;
          Label_Value.Color := $00814608;
          Label_Value.font.Color := cSelLabel_Font;
        end;
      end;
    end;
  end;
  GetEnvForm(Select_Category, Select_Nav);
end;

procedure TForm_AirManager.GetEnvForm(CategoryNum, NavNum: Byte);
var
  j: Byte;
  sFormType: String;
begin
  try
    if Assigned(BodyForm) then
    begin
      BodyForm.Close;
      FreeAndNil(BodyForm);
    end;
    Application.ProcessMessages;
  finally
    BodyForm := nil;
  end;

  case iViewType of
    SideNav_ENV:
      begin
        sFormType := 'ENV';
      end;
    SideNav_Data:
      begin
        sFormType := 'DATA';
      end;
    SideNav_System:
      begin
        sFormType := 'SYS';
      end;
  end;
  try
    // 로그인 체크
    if (CategoryNum = 0) AND (NavNum = 3) AND (NOT bLogin_ENV1_4) then
    begin
      if (DM.GetLogin('').Result_int = 0) then
      begin
        DM.GetPopup(0, '사용자 로그인 실패', '로그인 후 이용 가능합니다.', '');
        Exit;
      end
      else
        bLogin_ENV1_4 := True;
    end;

    BodyClass := FindClass('TForm_' + sFormType + IntToStr(CategoryNum + 1) + '_' + IntToStr(NavNum + 1));

    if BodyClass.InheritsFrom(TForm) then
      BodyForm := TFormClass(BodyClass).Create(Panel_Form);
  except
    On E: Exception do
    begin
      DM.SetLog('Form 처리오류 : ' + E.Message);
      DM.GetPopup(0, 'Notice', '폼을 불러올 수 없습니다.', '');
    end;

  end;

  if BodyForm <> nil then
  begin
    Panel_Form.Caption := '';
    with BodyForm do
    begin
      Visible := False;
      BevelOuter := bvNone;
      Parent := Panel_Form;
      Align := alClient;

      Application.ProcessMessages;
      Visible := True;
    end;
  end
  else
  begin
    BodyForm.Free;
    with Panel_Form do
    begin
      if ControlCount <> 0 then
      begin
        for j := ControlCount - 1 Downto 0 do
        begin
          if Controls[j] is TForm then
            TForm(Controls[j]).Free;
        end;
      end;
      if (CategoryNum = 0) AND (NavNum = 3) then
        Caption := '관리자 로그인 후 사용 가능한 페이지입니다. 다시 시도해주세요.'
      else
        Caption := '페이지를 찾을 수 없습니다. 다시 시도해주세요.';
      ShowCaption := True;
    end;
  end;
end;

procedure TForm_AirManager.CategoryClick(Sender: TObject);
var
  i: Byte;
begin
  if bSQLExecute then
    Exit;
  Select_Category := (Sender as TFrame_ENV_Nav).Tag;
  //
  for i := 0 to Panel_Left.ControlCount - 1 do
  begin
    if Panel_Left.Controls[i] is TFrame_ENV_Nav then
    begin
      if TFrame_ENV_Nav(Panel_Left.Controls[i]).Name = 'Frame_ENV_AS' then
        continue;

      with TFrame_ENV_Nav(Panel_Left.Controls[i]) do
      begin
        if Tag = Select_Category then
        begin
          Color := $00BD864D;
          Label_Value.Color := $00BD864D;
        end
        else
        begin
          Color := $00A4580B;
          Label_Value.Color := $00A4580B;
        end;
      end;
    end;
  end;
  GetNav(Select_Category);
end;

procedure TForm_AirManager.Image_CloseClick(Sender: TObject);
var
  i: Byte;
begin
  // 프로그램 종료 전 체크
  try
    if Assigned(DownloadURL) then
    begin
      i := 0;
      if (DM.GetPopup(1, '프로그램 종료 체크', '파일을 다운로드 중입니다.' + #13#10 + '다운로드를 취소하고 프로그램을 종료하시겠습니까?', '').Result_int = 0) then
        Exit
      else
      begin
        if Assigned(DownloadURL) then
          DownloadURL.bCancel := True;

        repeat
          Sleep(100);
          Application.ProcessMessages;
          inc(i);

        until (DownloadURL = nil) OR (i >= 30);
      end;
    end;
  finally

  end;

  try
    if BodyForm <> nil then
    begin
      BodyForm.Close;
      BodyForm.Free;
    end;

    if FindWindow(nil, Pchar('인쇄 미리보기')) <> 0 then
    begin
      DM.ControlProgram(1, 'Project_PreView.exe');
    end;
    DM.iniInfo(1, '.\AirControl.ini');
    DM.iniInfo(1, 'C:\FOODCAFE\Servers.ini');

    if bFoodcafeRestart then
    begin
      DM.ControlProgram(1, 'AirTrain.exe');
      repeat
        Application.ProcessMessages;
        Sleep(100);

      until DM.ControlProgram(2, 'AirTrain.exe').Result_int = 0;
      if GMZNO <> '' then
        DM.ControlProgram(0, 'C:\FOODCAFE\AirTrain.exe');
    end;

    Self.Hide;
    DM.iniInfo(1, 'C:\FOODCAFE\AIRPOS.ini');
    if DM.ControlProgram(2, 'FOODCAFE_X.exe').Result_int = 1 then
    begin
      if bFoodcafeRestart OR (DM.GetPopup(1, '프로그램 확인', '설정 적용을 위해 푸드카페를 재실행하시겠습니까?', '').Result_int = 1) then
      begin
        DM.ControlProgram(1, 'FOODCAFE_X.exe');
        repeat
          Application.ProcessMessages;
          Sleep(100);

        until DM.ControlProgram(2, 'FOODCAFE_X.exe').Result_int = 0;
        DM.ControlProgram(0, 'C:\FOODCAFE\FOODCAFE_X.exe');
      end;
    end;
  finally
    BodyForm := nil;
    Application.Terminate;
  end;
end;

procedure TForm_AirManager.Image_HideClick(Sender: TObject);
begin
  ShowWindow(Handle, SW_MINIMIZE);
end;

procedure TForm_AirManager.Image_reSizeClick(Sender: TObject);
{$IFDEF DEBUG}
var
  i: Byte;
{$ENDIF}
begin
{$IFDEF DEBUG}
  i := Screen.MonitorCount - 1;
  if (Top = Screen.Monitors[i].Top) AND (Width = Screen.Monitors[i].Width) AND (Height = Screen.Monitors[i].Height) then
{$ELSE}
  if (Top = Screen.Monitors[0].Top) AND (Width = Screen.Monitors[0].Width) AND (Height = Screen.Monitors[0].Height) then
{$ENDIF}
  begin
    with Form_AirManager do
    begin
      Width := 1024;
      Height := 620;
      Hint := '';
    end;
  end
  else
  begin
{$IFDEF DEBUG}
    with Screen.Monitors[i] do
{$ENDIF}
{$IFDEF RELEASE}
      with Screen.Monitors[0] do
{$ENDIF}
      begin
        Self.Top := Top;
        Self.Left := Left;
        Self.Width := Width;
        Self.Height := Height;
      end;
  end;

  if BodyForm <> nil then
    SendMessage(BodyForm.Handle, WM_EXITSIZEMOVE, 0, 0);
end;

procedure TForm_AirManager.Image_ToolBarClick(Sender: TObject);
var
  i: integer;
  FreeForm: TForm;
begin
  if bSQLExecute then
    Exit;

  Application.ProcessMessages;
  DM.SetBG(0);
  Form_Nav := TForm_Nav.Create(Self);
  try
    with Form_Nav do
    begin
      ShowModal;

      if ModalResult = mrOK then
      begin
        {
          for i := Panel_Form.ControlCount - 1 Downto 0 do
          begin
          if Panel_Form.Controls[i] is TForm then
          begin
          FreeForm := (Panel_Form.Controls[i] as TForm);
          FreeForm.Close;
          Break;
          end;
          end;
        }

        iViewType := Tag;
        Select_Category := 0;
        Form_AirManager.Label_title.Caption := Form_Nav.Hint
{$IFDEF DEBUG}
          + ' [개발자 모드]'
{$ENDIF};
        GetCategory(iViewType);
      end;
    end;
  finally
    OnKeyDown := FormKeyDown;
    Form_Nav.Free;
    Application.ProcessMessages;
    DM.SetBG(1);
  end;
end;

procedure TForm_AirManager.Label_EgClick(Sender: TObject);
begin
{$IFDEF DEBUG}
  Exit;
  DM.ControlProgram(0, '');
{$ENDIF}
  ShowMEssage('오늘도 고생하셨어요~ 좋은 하루 보내세요!' + #13#10 + 'Have a nice day!');
end;

procedure TForm_AirManager.Label_VersionClick(Sender: TObject);
begin
  //
  Label_WiseSaying.Visible := True;
  Label_WiseSaying.Caption := arrWiseSaying[Random(Length(arrWiseSaying))];
end;

procedure TForm_AirManager.Panel_HeaderMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  ReleaseCapture;
  SendMessage(Handle, WM_NCLBUTTONDOWN, HTCAPTION, 0);
end;

procedure TForm_AirManager.Recv_Msg(var MSG: TWMCopyData);
begin
  DM.Recv_Msg(MSG);
end;

end.
