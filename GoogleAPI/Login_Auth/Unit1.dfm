object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 235
  ClientWidth = 527
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -21
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 25
  object Button1: TButton
    Left = 0
    Top = 185
    Width = 527
    Height = 50
    Align = alBottom
    Caption = 'Server Start!!'
    TabOrder = 0
    OnClick = Button1Click
    ExplicitTop = 191
  end
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 527
    Height = 185
    Align = alClient
    Lines.Strings = (
      'https://accounts.google.com/o/oauth2/v2/auth'
      '?client_id=831687569751-'
      'enafvgs3k6lalv5ilan7f5vbpo3jl37q.apps.googleusercont'
      'ent.com'
      '&redirect_uri=http://127.0.0.1/'
      '&scope=https://www.googleapis.com/auth/drive.read'
      'only'
      '&response_type=code')
    TabOrder = 1
    ExplicitTop = -6
    ExplicitWidth = 350
  end
  object IdHTTPServer1: TIdHTTPServer
    Bindings = <>
    OnCommandGet = IdHTTPServer1CommandGet
    Left = 48
    Top = 32
  end
end
