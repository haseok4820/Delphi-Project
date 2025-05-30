unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IdBaseComponent, IdComponent, IdCustomTCPServer,
  IdCustomHTTPServer, IdHTTPServer, IdContext, Winapi.ShellApi, IPPeerClient, Data.Bind.Components,
  Data.Bind.ObjectScope, REST.Client, REST.Authenticator.OAuth, Vcl.ExtCtrls, IdTCPConnection, IdTCPClient, IdHTTP,
  System.Net.URLClient, System.Net.HttpClient, System.Net.HttpClientComponent, IdGlobal, REST.Types;

type
  TForm1 = class(TForm)
    IdHTTPServer1: TIdHTTPServer;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    Panel_Left: TPanel;
    Button_Login: TButton;
    Memo1: TMemo;
    NetHTTPRequest1: TNetHTTPRequest;
    Memo_Res: TMemo;
    NetHTTPClient1: TNetHTTPClient;
    Panel_SheetAPI: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    procedure Button_LoginClick(Sender: TObject);
    procedure IdHTTPServer1CommandGet(AContext: TIdContext; ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  sAuth_URL = 'https://accounts.google.com/o/oauth2/v2/auth';
  sToken_URL = 'https://oauth2.googleapis.com/token';

  iAuth_REQ = 0;
  iToken_REQ = 1;

var
  Form1: TForm1;
  iHTTP_ReqType: Byte; // 0 : Auth , 1 : Token

  sAuth_ClientID, sAuth_ClientSecret, sAuth_ReURL, sAuth_Scope, sAuth_Code: String;
  sToken_ReURL, sToken_Secret: String;
  {
    Google Sheet API : https://developers.google.com/sheets/api/guides/concepts?hl=ko
    REST API : https://stackoverflow.com/questions/76184528/delphi-restrequest-unable-to-get-authorization

    범위
    https://www.googleapis.com/auth/drive	                Google Drive 파일 보기, 수정, 생성, 삭제
    https://www.googleapis.com/auth/drive.file	          이 앱에서 사용하는 특정 Google Drive 파일만 보고, 수정하고, 만들고, 삭제합니다.
    https://www.googleapis.com/auth/drive.readonly	      모든 Google Drive 파일을 보고 다운로드합니다.
    https://www.googleapis.com/auth/spreadsheets	        모든 Google Sheets 스프레드시트를 보고, 수정하고, 만들고, 삭제합니다.
    https://www.googleapis.com/auth/spreadsheets.readonly	모든 Google Sheets 스프레드시트를 확인합니다.

    참고사항
    ※ 새로운 액세스 토큰을 생성하면, 이전에 생성된 토큰은 사용하지 못합니다.
    ※ RESTAPI Auth 설정시, 인코딩을 적용하지 않게, poDoNotEncode을 설정해야합니다.
  }

implementation

{$R *.dfm}

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  IdHTTPServer1.Active := False;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  iHTTP_ReqType := iAuth_REQ;
  with IdHTTPServer1 do
  begin
    if Active then
    begin
      Active := False;
    end
    else
    begin
      DefaultPort := 4227;
      Active := True;
      AutoStartSession := True;
    end;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
const
  SHEET_CREATE = 0;
  SHEET_SHOW = 1;
  SHEET_READ = 2;
  SHEET_WRITE = 3;
  SHEET_DELETE = 4;
var
  i: Byte;
begin
  //
  // uth2Authenticator1.AccessToken := Memo_Res.Text;
  // RESTClient1.Authenticator := OAuth2Authenticator1;
  RESTClient1.BaseURL := 'https://sheets.googleapis.com';
  RESTRequest1.Client := RESTClient1;
  RESTRequest1.Response := RESTResponse1;
  RESTRequest1.Resource := 'v4/spreadsheets/12MAlJ6bD8eci-vUfRG0IiDLtEv-69HijPabm3MgGWOw/values/Test_Sheet!A1:D5';
    with RESTRequest1.Params.AddItem do
    begin
    ContentType := ctNone;
    Kind := pkHTTPHEADER;
    name := 'Authorization';
    Value := Memo_Res.Text;
    Options := [poDoNotEncode];
    end;

  RESTRequest1.Execute;

  Memo_Res.Lines.Add(RESTResponse1.Content);
end;

procedure TForm1.Button_LoginClick(Sender: TObject);
var
  TokenData: String;
  ss: TStringStream;
  AResponse: IHTTPResponse;
  sRes: String;
begin
  case iHTTP_ReqType of
    iAuth_REQ:
      begin
        ShellExecute(HANDLE_FLAG_INHERIT, 'Open', '"shell:Appsfolder\Microsoft.MicrosoftEdge_8wekyb3d8bbwe!MicrosoftEdge"',
          PChar(Memo1.Text), nil, SW_SHOWNORMAL);
      end;
    iToken_REQ:
      begin
        TokenData := '';
        TokenData := sAuth_Code + '&';
        TokenData := TokenData + 'client_id=831687569751-enafvgs3k6lalv5ilan7f5vbpo3jl37q.apps.googleusercontent.com&';
        TokenData := TokenData + 'client_secret=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&';
        TokenData := TokenData + 'redirect_uri=http://127.0.0.1:4227/&';
        TokenData := TokenData + 'grant_type=authorization_code';
        ss := TStringStream.Create(TokenData, TEncoding.UTF8);
        try
          with NetHTTPRequest1 do
          begin
            URL := 'https://oauth2.googleapis.com/token';
            AcceptEncoding := 'utf-8';
            NetHTTPClient1.ContentType := 'application/x-www-form-urlencoded';
            Asynchronous := False;

            Memo_Res.Lines.Add(URL);
            Memo_Res.Lines.Add(TokenData);

            AResponse := Post(URL, ss);

            sRes := AResponse.ContentAsString(TEncoding.UTF8);

            Memo_Res.Lines.Add(sRes);
          end;
        finally
          ss.Free;
        end;
      end;
  end;

end;

procedure TForm1.IdHTTPServer1CommandGet(AContext: TIdContext; ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
var
  i: Byte;
  wResText: RawByteString;
  sResText: String;
  ResStream: TStream;
begin
  // 요청값 분석
  with Memo_Res.Lines do
  begin
    Add('RequestInfo URI : ' + ARequestInfo.URI);
    Add('RequestInfo Command  : ' + ARequestInfo.Command);
    Add('ARequestInfo.Params.Count : ' + IntToSTr(ARequestInfo.Params.Count));
    wResText := UTF8Encode(ARequestInfo.Params.Text);
    SetCodePage(wResText, 949, False);
    sResText := UnicodeString(wResText);

    Add('ARequestInfo.Params.Text : ' + sResText);
    Add('ARequestInfo.Params.FormParams : ' + ARequestInfo.FormParams);
    Add('ARequestInfo.Params.FormParams : ' + ARequestInfo.UnparsedParams);

    try
      ResStream := ARequestInfo.PostStream;
      if Assigned(ResStream) then
      begin
        ResStream.Position := 0;
        // 기본
        // sResText := ReadStringFromStream(ResStream);

        // 한글 깨짐시
        sResText := ReadStringFromStream(ResStream, -1, IndyTextEncoding_UTF8);
        Add('ARequestInfo.PostStream : ' + sResText);
      end;
    finally
    end;
    if ARequestInfo.Params.Count > 0 then
    begin
      for i := 0 to ARequestInfo.Params.Count - 1 do
        Add('ARequestInfo.Params' + IntToSTr(i) + ' : ' + ARequestInfo.Params[i]);
    end;

    Add('===========================================================');
  end;

  // 요청 유형별 처리
  case iHTTP_ReqType of
    iAuth_REQ: // 로그인
      begin
        with ARequestInfo do
        begin
          for i := 0 to Params.Count - 1 do
          begin
            if Pos('code=', Params[i]) > 0 then
              sAuth_Code := Params[i]
            else if Pos('code=', Params[i]) > 0 then
              sAuth_Code := Params[i];
          end;
        end;
        sResText := '구글 로그인 성공, 창을 닫고, 앱으로 돌아가주세요.';
        // sResText := '구글 연동 토큰 처리중.. 잠시만 기다려주세요.';
        with AResponseInfo do
        begin
          ContentStream := TStringStream.Create(sResText, TEncoding.UTF8);
          ContentType := 'text/html; charset=utf-8';
        end;
        iHTTP_ReqType := iToken_REQ;
        Button_LoginClick(nil);
      end;
    iToken_REQ: // 토큰
      begin
        sResText := '구글 연동 토큰 처리완료.. 창을 닫고 앱으로 돌아가주세요.';
        with AResponseInfo do
        begin
          ContentStream := TStringStream.Create(sResText, TEncoding.UTF8);
          ContentType := 'text/html; charset=utf-8';
        end;
      end;

  end;

end;

end.
