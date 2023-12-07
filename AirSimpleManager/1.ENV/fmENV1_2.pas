unit fmENV1_2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Frame_Edit, Vcl.StdCtrls,
  Frame_CheckBox, Frame_ComboBox, Vcl.ExtCtrls, Frame_YN,
  Vcl.ComCtrls;

type
  TForm_ENV1_2 = class(TForm)
    ScrollBox_Main: TScrollBox;
    Label_Title: TLabel;
    Label_Guide1: TLabel;
    Label_Guide2: TLabel;
    Panel2: TPanel;
    Label2: TLabel;
    Frame_YN_useAdvance: TFrame_ENV_YN;
    Panel3: TPanel;
    Label3: TLabel;
    Frame_YN_useTimeSale: TFrame_ENV_YN;
    Panel1: TPanel;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    GroupBox_TimeOption: TGroupBox;
    Frame_CheckBox_optCloseSale: TFrame_ENV_CheckBox;
    Frame_CheckBox_useSale24: TFrame_ENV_CheckBox;
    Frame_CheckBox_NewDelv: TFrame_ENV_CheckBox;

    Frame_CheckBox_TimeSaleStaticLock: TFrame_ENV_CheckBox;
    Frame_CheckBox_TimeSaleNoAdvance: TFrame_ENV_CheckBox;
    Frame_CheckBox_useTimeOverChg: TFrame_ENV_CheckBox;
    Frame_CheckBox_useTimeChange: TFrame_ENV_CheckBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Frame_CheckBox_useSale24Click(Sender: TObject);
    procedure Frame_CheckBox_NewDelvClick(Sender: TObject);
    procedure Frame_YN_useTimeSaleClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_ENV1_2: TForm_ENV1_2;

implementation

{$R *.dfm}

uses uDM;

procedure TForm_ENV1_2.FormClose(Sender: TObject; var Action: TCloseAction);
var
  fmtTime: TFormatSettings;
begin
  fmtTime.TimeSeparator := ':';
  fmtTime.LongTimeFormat := 'HH:MM';

  optCloseSale := Frame_CheckBox_optCloseSale.Tag <> 0;
  useSale24 := Frame_CheckBox_useSale24.Tag <> 0;
  TimeOrigin := TimeToStr(DateTimePicker1.Time, fmtTime);
  useTimeSale := Frame_YN_useTimeSale.Tag = 1;
  useAdvance := Frame_YN_useAdvance.Tag = 1;
  NewDelv := Frame_CheckBox_NewDelv.Tag <> 0;

  if useTimeSale then
  begin
    TimeSaleStaticLock := Frame_CheckBox_TimeSaleStaticLock.Tag <> 0;
    TimeAutoLockerLayer := NOT TimeSaleStaticLock;
    TimeTableTag := NOT TimeSaleStaticLock;
    TimeSaleNoAdvance := Frame_CheckBox_TimeSaleNoAdvance.Tag <> 0;
    useTimeOverChg := Frame_CheckBox_useTimeOverChg.Tag <> 0;
    useTimeChange := Frame_CheckBox_useTimeChange.Tag <> 0;
  end
  else
  begin
    TimeSaleStaticLock := False;
    TimeAutoLockerLayer := False;
    TimeTableTag := False;
    TimeSaleNoAdvance := False;
    useTimeOverChg := False;
    useTimeChange := False;
  end;

end;

procedure TForm_ENV1_2.FormShow(Sender: TObject);
begin

  DM.Image_CheckBOX(StrToInt(BoolToStr(NOT optCloseSale)), Frame_CheckBox_optCloseSale);
  DM.Image_CheckBOX(StrToInt(BoolToStr(NOT useSale24)), Frame_CheckBox_useSale24);
  DateTimePicker1.Enabled := useSale24;
  DateTimePicker1.Time := StrToTime(TimeOrigin);

  DM.Label_YN(useTimeSale, Frame_YN_useTimeSale);
  DM.Label_YN(useAdvance, Frame_YN_useAdvance);
  DM.Image_CheckBOX(StrToInt(BoolToStr(NOT NewDelv)), Frame_CheckBox_NewDelv);

  GroupBox_TimeOption.Visible := useTimeSale;
  DM.Image_CheckBOX(StrToInt(BoolToStr(NOT TimeSaleStaticLock)), Frame_CheckBox_TimeSaleStaticLock);
  DM.Image_CheckBOX(StrToInt(BoolToStr(NOT TimeSaleNoAdvance)), Frame_CheckBox_TimeSaleNoAdvance);
  DM.Image_CheckBOX(StrToInt(BoolToStr(NOT useTimeOverChg)), Frame_CheckBox_useTimeOverChg);
  DM.Image_CheckBOX(StrToInt(BoolToStr(NOT useTimeChange)), Frame_CheckBox_useTimeChange);

end;

procedure TForm_ENV1_2.Frame_CheckBox_NewDelvClick(Sender: TObject);
begin
  //
  if (Frame_YN_useAdvance.Tag = 1) AND (Frame_CheckBox_NewDelv.Tag = 1) AND
    (DM.GetPopup(1, '바로가기 추가', '기타기능 바로가기에 배달을 추가하시겠습니까?', '').Result_int = 1) then
  begin
    ordFuncType := True;
    arrLetsGoordID[1] := 59;
  end;
end;

procedure TForm_ENV1_2.Frame_CheckBox_useSale24Click(Sender: TObject);
begin
  DateTimePicker1.Enabled := Frame_CheckBox_useSale24.Tag <> 0;
end;

procedure TForm_ENV1_2.Frame_YN_useTimeSaleClick(Sender: TObject);
begin
  // 시간제 전용 기능 처리 (시간제 유형(락커/테이블, 추가시간 적용구분 등))
  GroupBox_TimeOption.Visible := Frame_YN_useTimeSale.Tag = 1;
end;

end.
