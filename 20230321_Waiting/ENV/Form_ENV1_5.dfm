object fmENV1_5: TfmENV1_5
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'fmENV1_5'
  ClientHeight = 600
  ClientWidth = 366
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -27
  Font.Name = #44256#46020' B'
  Font.Style = []
  Padding.Left = 10
  Padding.Top = 10
  Padding.Right = 10
  Padding.Bottom = 10
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 31
  object Label_MSG: TLabel
    Left = 10
    Top = 10
    Width = 346
    Height = 523
    Align = alClient
    Alignment = taCenter
    Caption = 'Wizhelper '#52404#53356#51473
    Layout = tlCenter
    ExplicitWidth = 213
    ExplicitHeight = 31
  end
  object Button_SetCode: TButton
    Left = 10
    Top = 533
    Width = 346
    Height = 57
    Align = alBottom
    Caption = #54924#49324#53076#46300' '#51077#47141
    TabOrder = 0
    OnClick = Timer_WizheloerCheckTimer
  end
  object Timer_WizheloerCheck: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = Timer_WizheloerCheckTimer
    Left = 168
    Top = 288
  end
end
