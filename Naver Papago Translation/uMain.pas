unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.JSON, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Net.URLClient, System.Net.HttpClient,
  System.Net.HttpClientComponent, Vcl.ExtCtrls, ImagingComponents;

type
  TPapagoTrans_Res = record
    srcLangType: String; // 입력 언어
    tarLangType: String; // 변환 언어
    sResLangText: String; // 변환값
    sVer: String; // 버전
    sType: String; // 유형
    sService: String; // 네이버
  end;

  TForm5 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Label3: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    Button1: TButton;
    Image1: TImage;
    NetHTTPRequest_Naver: TNetHTTPRequest;
    NetHTTPClient_Naver: TNetHTTPClient;
    procedure Button1Click(Sender: TObject);
    procedure NetHTTPRequest_NaverRequestCompleted(const Sender: TObject; const AResponse: IHTTPResponse);
    procedure NetHTTPRequest_NaverRequestError(const Sender: TObject; const AError: string);
    function EncodeURIComponent(const ASrc: string): UTF8String;
    procedure FormShow(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
    procedure SetComboboxItem;
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

  arrPapagoLang: array [0 .. 12] of String = (
    'ko (한국어|한국어)',
    'en (영어|ENGLISH)',
    'ja (일본어|日本語)',
    'zh-CN (중국어 간체|简体中文)',
    'zh-TW (중국어 번체|繁體中文)',
    'vi (베트남어|Tiếng Việt)',
    'id (인도네시아어|Bahasa Indonesia)',
    'th (태국어|ภาษาไทย)',
    'de (독일어|deutsche Sprache)',
    'ru (러시아어|Русский)',
    'es (스페인어|castellano)',
    'it (이탈리아어|la lingua italiana)',
    'fr (프랑스어|français)'
  );

implementation

{$R *.dfm}

procedure TForm5.Button1Click(Sender: TObject);
var

  sl: TStringList;
  ss: TStringStream;
begin

  // Request Info
  sl := TStringList.Create;
  try
    NetHTTPRequest_Naver.URL := 'https://openapi.naver.com/v1/papago/n2mt';
    // NetHTTPRequest_Naver.MethodString := 'source=ko;target=en;text=테스트입니다.';

    // Custom Header
    NetHTTPRequest_Naver.AcceptEncoding := 'UTF-8';
    NetHTTPRequest_Naver.CustomHeaders['X-Naver-Client-Id'] := Edit1.Text;
    NetHTTPRequest_Naver.CustomHeaders['X-Naver-Client-Secret'] := Edit2.Text;
    NetHTTPClient_Naver.ContentType := 'application/x-www-form-urlencoded; charset=UTF-8';

    // Asynchronous Requests
    NetHTTPRequest_Naver.Asynchronous := False;

    sl.Add('source=' + COPY(ComboBox1.Text, 0, POS('(', ComboBox1.Text) - 2) + '&');
    sl.Add('target=' + COPY(ComboBox2.Text, 0, POS('(', ComboBox2.Text) - 2) + '&');
    sl.Add('text=' + Memo1.Text); { EncodeURIComponent(Memo1.Text) }

    ss := TStringStream.Create(sl.Text, TEncoding.UTF8);

    with NetHTTPRequest_Naver do
    begin
      NetHTTPRequest_Naver.Post(URL, ss);
    end;
  finally
    sl.Free;
    ss.Free;
  end;
end;

function TForm5.EncodeURIComponent(const ASrc: string): UTF8String;
const
  HexMap: UTF8String = '0123456789ABCDEF';

  function IsSafeChar(ch: Integer): Boolean;
  begin
    if (ch >= 48) and (ch <= 57) then
      Result := True // 0-9
    else if (ch >= 65) and (ch <= 90) then
      Result := True // A-Z
    else if (ch >= 97) and (ch <= 122) then
      Result := True // a-z
    else if (ch = 33) then
      Result := True // !
    else if (ch >= 39) and (ch <= 42) then
      Result := True // '()*
    else if (ch >= 45) and (ch <= 46) then
      Result := True // -.
    else if (ch = 95) then
      Result := True // _
    else if (ch = 126) then
      Result := True // ~
    else
      Result := False;
  end;

var
  I, J: Integer;
  ASrcUTF8: UTF8String;
begin
  Result := ''; { Do not Localize }

  ASrcUTF8 := UTF8Encode(ASrc);
  // UTF8Encode call not strictly necessary but
  // prevents implicit conversion warning

  I := 1;
  J := 1;
  SetLength(Result, Length(ASrcUTF8) * 3); // space to %xx encode every byte
  while I <= Length(ASrcUTF8) do
  begin
    if IsSafeChar(Ord(ASrcUTF8[I])) then
    begin
      Result[J] := ASrcUTF8[I];
      Inc(J);
    end
    else
    begin
      Result[J] := '%';
      Result[J + 1] := HexMap[(Ord(ASrcUTF8[I]) shr 4) + 1];
      Result[J + 2] := HexMap[(Ord(ASrcUTF8[I]) and 15) + 1];
      Inc(J, 3);
    end;
    Inc(I);
  end;
  SetLength(Result, J - 1);

end;

procedure TForm5.FormShow(Sender: TObject);
begin
  SetComboboxItem;
end;

procedure TForm5.Image1Click(Sender: TObject);
var
  i_Type: Cardinal;
begin
  i_Type := ComboBox2.ItemIndex;

  ComboBox2.ItemIndex := ComboBox1.ItemIndex;
  ComboBox1.ItemIndex := i_Type;

  Memo1.Text := Memo2.Text;
  if Trim(Memo1.Text) <> '' then
    Button1Click(nil);
end;

procedure TForm5.NetHTTPRequest_NaverRequestCompleted(const Sender: TObject; const AResponse: IHTTPResponse);
var
  sRes: String;
  jsonObj, jsonVal_Msg, jsonVal_res: TJSONObject;

  ResInfo: TPapagoTrans_Res;
begin
  // Response
  if AResponse.StatusCode <> 200 then
    Memo2.Lines.Add(IntToStr(AResponse.StatusCode) + ' : ' + AResponse.StatusText)
  else
  begin

    sRes := AResponse.ContentAsString(TEncoding.UTF8);

    jsonObj := TJSONObject.ParseJSONValue(sRes) as TJSONObject;
    try
      try
        with ResInfo do
        begin
          jsonVal_Msg := jsonObj.GetValue('message') as TJSONObject;
          sVer := jsonVal_Msg.GetValue('@version', '');
          sType := jsonVal_Msg.GetValue('@type', '');
          sService := jsonVal_Msg.GetValue('@service', '');

          jsonVal_res := jsonVal_Msg.GetValue('result') as TJSONObject;
          srcLangType := jsonVal_res.GetValue('srcLangType', '');
          tarLangType := jsonVal_res.GetValue('tarLangType', '');
          sResLangText := jsonVal_res.GetValue('translatedText', '');
        end;

        Memo2.Text := ResInfo.sResLangText;
      except
        ON E: Exception do
        begin
          Memo2.Text := '처리중 에러가 발생하였습니다.';
          sRes := E.Message;
        end;
      end;
    finally
      jsonObj.Free;
    end;
  end;

end;

procedure TForm5.NetHTTPRequest_NaverRequestError(const Sender: TObject; const AError: string);
begin
  // Res Err
  InputBox('Naver Papago Error', ' Error MSG', AError);
end;

procedure TForm5.SetComboboxItem;
var
  I, J: Cardinal;
begin
  //
  for I := 1 to 2 do
  begin
    with (FindComponent('ComboBox' + IntToStr(I)) as TComboBox) do
    begin
      Items.Clear;
      for J := Low(arrPapagoLang) to High(arrPapagoLang) do
        Items.Add(arrPapagoLang[J]);

      ItemIndex := I - 1;
    end;

  end;

end;

end.
