program Project_PreView;

uses
  System.StartUpCopy,
  FMX.Forms,
  Windows,
  uMain in 'uMain.pas' {Form_SMPreview} ,
  uTextBackup in 'uTextBackup.pas' {fmBackup} ,
  uForm_Receipt in 'uForm_Receipt.pas' {Form_Receipt};


// 일 존나 하기 싫음
// 왜냐고?
// 시발 일 열심히 하면 뭐해, 보상도 없고,
// 누구처럼 편하게 핸폰만 해도, 나랑 월급 같거나, 더 받는데,
// 누가 열심히 일하고 싶겠어.
// 우리 회사 너무 멋져.
// 빨리 다 갈아엎어버리고 싶다.
// 내가 생각하는 회사가 살아나갈 길일듯.

// 아냐 다시 생각해보니까,
// 그냥 여긴 공부해서 빨리 다른 회사로 가라는 거 같아.
// 빨리 실력 키워서 다른데 가는걸 원하는데,
// 그렇게 해줘야지 뭐.
{$R *.res}

var
  PreView_Mutex: THandle;
  Exe_Handle: Integer;

begin
  PreView_Mutex := CreateMutex(nil, True, 'MutexFM_Preivew');
  if (PreView_Mutex > 0) AND (GetLastError = 0) then
  begin
    try
      Application.Initialize;
      Application.CreateForm(TForm_SMPreview, Form_SMPreview);
      Application.Run;
    except
      Application.Terminate;
    end;

    if PreView_Mutex > 0 then
      CloseHandle(PreView_Mutex);
  end
  else
  begin
    Exe_Handle := FindWindow('', nil);
    ShowWindow(Exe_Handle, SW_SHOW);
  end;

end.
