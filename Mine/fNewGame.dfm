object fmNew: TfmNew
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = #49352#47196' '#47564#46308#44592
  ClientHeight = 220
  ClientWidth = 320
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = #47569#51008' '#44256#46357
  Font.Style = []
  Padding.Left = 10
  Padding.Top = 10
  Padding.Right = 10
  Padding.Bottom = 10
  OldCreateOrder = False
  Position = poMainFormCenter
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 21
  object GroupBox2: TGroupBox
    Left = 10
    Top = 90
    Width = 300
    Height = 80
    Align = alTop
    Caption = #49324#50857#51088' '#51648#51221
    TabOrder = 0
    ExplicitWidth = 340
  end
  object Panel_Footer: TPanel
    Left = 10
    Top = 169
    Width = 300
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Padding.Left = 5
    Padding.Top = 5
    Padding.Right = 5
    Padding.Bottom = 5
    ShowCaption = False
    TabOrder = 1
    ExplicitLeft = 88
    ExplicitTop = 104
    ExplicitWidth = 185
    object Button1: TButton
      Left = 220
      Top = 5
      Width = 75
      Height = 31
      Align = alRight
      Caption = #47564#46308#44592
      TabOrder = 0
      OnClick = Button1Click
      ExplicitLeft = 136
      ExplicitTop = 8
      ExplicitHeight = 25
    end
  end
  object RadioGroup1: TRadioGroup
    Left = 10
    Top = 10
    Width = 300
    Height = 80
    Align = alTop
    Caption = #45212#51060#46020
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      '(8X8)'
      '(32X32)'
      '(128X128)')
    TabOrder = 2
    ExplicitWidth = 340
  end
end
