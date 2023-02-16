unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.DateUtils, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Notification, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TNotification_Info = record
    Iseq: Integer;
    sName: String;
    sTitle: String;
    sContent: String;
    bSchedule: Boolean;
    sSchedule: TDateTime;
  end;

  TForm5 = class(TForm)
    NotificationCenter: TNotificationCenter;
    ListView_Notification: TListView;
    Edit_Title: TEdit;
    Memo_Content: TMemo;
    Panel_BtnEvent: TPanel;
    DateTimePicker_Date: TDateTimePicker;
    CheckBox_Schedule: TCheckBox;
    DateTimePicker_Time: TDateTimePicker;
    Button1: TButton;
    Timer_ButtonSet: TTimer;
    procedure ListView_NotificationSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
    procedure NotificationCenterReceiveLocalNotification(Sender: TObject; ANotification: TNotification);
    procedure FormShow(Sender: TObject);
    procedure BtnEvt(Sender: TObject);
    procedure Timer_ButtonSetTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure BtnClear;
    procedure BtnSet(iSetType: Byte);

    procedure NotificationSet(iType: Byte; NotifiInfo: TNotification_Info);
    procedure ListSet;
    function IsWindows8orLater: Boolean;

  end;

const
  cBtn_Create = 1; // Create
  cBtn_EditDelNew = 2; // Update & Del

  cBtnEvt_NEW = 0;
  cBtnEvt_CREATE = 1;
  cBtnEvt_UPDATE = 2;
  cBtnEvt_DELETE = 3;
  cBtnEvt_ALLDEL = 4;

var
  Form5: TForm5;
  i: Integer = 0;
  iNotifoTag: Integer = 0;
  arrNotificationInfo: array of TNotification_Info;

implementation

{$R *.dfm}

procedure TForm5.BtnClear;
var
  i: Integer;
begin
  with Panel_BtnEvent do
  begin
    for i := ControlCount - 1 Downto 0 do
    begin
      (Controls[i] as TButton).Free;
    end;
  end;
end;

procedure TForm5.BtnEvt(Sender: TObject);
var
  i, iTag: Integer;
begin
  // 버튼 클릭
  if (NOT(Sender is TButton)) OR (IsWindows8orLater = False) then
    Exit;

  i := -2;
  iTag := (Sender as TButton).Tag;
  case iTag of
    cBtnEvt_NEW:
      begin
        i := 0;
      end;
    cBtnEvt_CREATE:
      begin
        SetLength(arrNotificationInfo, Length(arrNotificationInfo) + 1);
        i := High(arrNotificationInfo);
        with arrNotificationInfo[i] do
        begin
          Iseq := iNotifoTag;
          sName := 'Notification_' + IntToStr(iNotifoTag);
          sTitle := Edit_Title.Text;
          sContent := Memo_Content.Text;
          bSchedule := CheckBox_Schedule.Checked;
          if bSchedule then
            sSchedule := StrToDateTime(DateToStr(DateTimePicker_Date.Date) + ' ' + TimeToStr(DateTimePicker_Time.Time))
          else
            sSchedule := Now;
          inc(iNotifoTag);
        end;
      end;
    cBtnEvt_UPDATE:
      begin
        for i := Low(arrNotificationInfo) to High(arrNotificationInfo) do
          if arrNotificationInfo[i].Iseq = Edit_Title.Tag then
            Break;

        with arrNotificationInfo[i] do
        begin
          sTitle := Edit_Title.Text;
          sContent := Memo_Content.Text;
          bSchedule := CheckBox_Schedule.Checked;
          if bSchedule then
            sSchedule := StrToDateTime(DateToStr(DateTimePicker_Date.Date) + ' ' + TimeToStr(DateTimePicker_Time.Time))
          else
            sSchedule := Now;
        end;
      end;
    cBtnEvt_DELETE:
      begin
        for i := Low(arrNotificationInfo) to High(arrNotificationInfo) do
        begin
          if arrNotificationInfo[i].Iseq = Edit_Title.Tag then
            Break;
        end;

      end;
    cBtnEvt_ALLDEL:
      begin
        i := 0;
      end;
  end;

  if iTag <> cBtnEvt_CREATE then
  begin
    Edit_Title.Clear;
    Memo_Content.Clear;
    CheckBox_Schedule.Checked := False;
    DateTimePicker_Date.Date := Now;
    DateTimePicker_Time.Time := Now;

    Timer_ButtonSet.Tag := cBtn_Create;
    Timer_ButtonSet.Enabled := True;
  end;

  if (NOT(i < 0)) AND (Length(arrNotificationInfo) <> 0) then
  begin
    NotificationSet(iTag, arrNotificationInfo[i]);
    ListSet;
  end;

end;

procedure TForm5.BtnSet(iSetType: Byte);
begin
  BtnClear;
  Panel_BtnEvent.Tag := iSetType;
  case iSetType of
    cBtn_Create:
      begin
        // 새 알림
        with TButton.Create(Self) do
        begin
          Parent := Panel_BtnEvent;
          Align := alClient;
          Name := 'Button_CREATE';
          Caption := 'Notification Create';
          Tag := cBtnEvt_CREATE;

          OnClick := BtnEvt;
        end;
      end;
    // 알림 수정/삭제/새로
    cBtn_EditDelNew:
      begin
        with TButton.Create(Self) do
        begin
          Parent := Panel_BtnEvent;
          Align := alTop;
          Name := 'Button_UPDATE';
          Caption := 'Edit Notification';
          Tag := cBtnEvt_UPDATE;

          OnClick := BtnEvt;
          Height := Panel_BtnEvent.ClientHeight div 3;
        end;
        with TButton.Create(Self) do
        begin
          Parent := Panel_BtnEvent;
          Align := alTop;
          Name := 'Button_DELETE';
          Caption := 'Delete Notification';
          Tag := cBtnEvt_DELETE;

          OnClick := BtnEvt;
          Height := Panel_BtnEvent.ClientHeight div 3;
        end;
        with TButton.Create(Self) do
        begin
          Parent := Panel_BtnEvent;
          Align := alTop;
          Name := 'Button_NEW';
          Caption := 'New Notification';
          Tag := cBtnEvt_NEW;

          OnClick := BtnEvt;
          Height := Panel_BtnEvent.ClientHeight div 3;
        end;

      end;

  end;

end;

procedure TForm5.FormShow(Sender: TObject);
begin
  BtnSet(cBtn_Create);
end;

{
  procedure TForm5.Button1Click(Sender: TObject);
  var
  MyNotification: TNotification; // Defines a TNotification variable
  begin
  inc(i);
  MyNotification := NotificationCenter1.CreateNotification; // Creates the notification
  try
  MyNotification.Name := 'Window_Notification_' + IntToSTr(i);
  MyNotification.Title := '윈도우 알림메세지'; // Defines the name that appears when the notification is presented.
  MyNotification.AlertBody := '#1 번째 알림메세지입니다. 델파이로 만들었으며, '; // Defines the body of the notification that appears below the title.

  NotificationCenter1.PresentNotification(MyNotification); // Presents the notification on the screen.
  finally
  MyNotification.Free; // Frees the variable
  end;
  end;

  procedure TForm5.Button3Click(Sender: TObject);
  begin
  NotificationCenter1.CancelNotification('Windows10Notification');
  end;
}
procedure TForm5.ListSet;
var
  listInfo: TListItem;
  i: Integer;
begin
  //
  ListView_Notification.Clear;
  Application.ProcessMessages;
  Sleep(10);
  if Length(arrNotificationInfo) <= 0 then
    Exit;
  try
    for i := Low(arrNotificationInfo) to High(arrNotificationInfo) do
    begin
      listInfo := ListView_Notification.Items.Add;
      if arrNotificationInfo[i].sTitle = '' then
        Break;

      with listInfo do
      begin
        Caption := IntToStr(arrNotificationInfo[i].Iseq);
        SubItems.Add(arrNotificationInfo[i].sTitle);
        SubItems.Add(arrNotificationInfo[i].sContent);
        if arrNotificationInfo[i].bSchedule then
        begin
          SubItems.Add(DateTimeToStr(arrNotificationInfo[i].sSchedule));
        end
        else
          SubItems.Add('NONE');

      end;
    end;
  except
    On E: exception do
    begin
      ShowMEssage('Error :' + E.Message + #13#10 + 'Line : ' + IntToStr(i));
    end;
  end;
end;

procedure TForm5.ListView_NotificationSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
begin
  //
  if Selected then
  begin
    if Panel_BtnEvent.Tag = cBtn_Create then
      BtnSet(cBtn_EditDelNew);
    Edit_Title.Tag := StrToIntDef(Item.Caption, 0);
    Edit_Title.Text := Item.SubItems[0];
    Memo_Content.Text := Item.SubItems[1];
  end;
end;

procedure TForm5.NotificationCenterReceiveLocalNotification(Sender: TObject; ANotification: TNotification);
var
  i: Integer;
begin
  for i := Low(arrNotificationInfo) to High(arrNotificationInfo) do
  begin
    with arrNotificationInfo[i] do
    begin
      if ANotification.Name = sName then
      begin
        Delete(arrNotificationInfo, i, 1);
        ListSet;
        Break;
      end;
    end;
  end;
end;

procedure TForm5.NotificationSet(iType: Byte; NotifiInfo: TNotification_Info);
var
  Notice: TNotification;
  i: Integer;
begin
  case iType of
    cBtnEvt_CREATE, cBtnEvt_UPDATE:
      begin
        if (Trim(NotifiInfo.sTitle) = '') then
        begin
          Edit_Title.SetFocus;
          Exit;
        end;

        Notice := NotificationCenter.CreateNotification;
        with Notice do
        begin
          Name := NotifiInfo.sName;
          Title := NotifiInfo.sTitle;
          AlertBody := NotifiInfo.sContent;

          if NotifiInfo.bSchedule then
          begin
            FireDate := NotifiInfo.sSchedule;

            NotificationCenter.ScheduleNotification(Notice);
          end
          else
            NotificationCenter.PresentNotification(Notice)
        end;
      end;
    cBtnEvt_DELETE:
      begin
        NotificationCenter.CancelNotification(NotifiInfo.sName);
        for i := Low(arrNotificationInfo) to High(arrNotificationInfo) do
        begin
          if arrNotificationInfo[i].Iseq = NotifiInfo.Iseq then
          begin
            Delete(arrNotificationInfo, i, 1);
            Break;
          end;
        end;
      end;
    cBtnEvt_ALLDEL:
      begin
        NotificationCenter.CancelAll;
        Delete(arrNotificationInfo, 0, Length(arrNotificationInfo));
      end;
  end;
end;

procedure TForm5.Timer_ButtonSetTimer(Sender: TObject);
begin
  Timer_ButtonSet.Enabled := False;
  BtnSet(Timer_ButtonSet.Tag);
end;

function TForm5.IsWindows8orLater: Boolean;
begin
  Result := False;
  if (Win32MajorVersion > 6) or ((Win32MajorVersion = 6) AND (Win32MinorVersion >= 2)) then
    Result := True;

  if Result = False then
    ShowMEssage('Windows 8 이상 사용 가능합니다.');
end;

end.
