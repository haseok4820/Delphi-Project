object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = #49707#51088#54056#46300' (Copyright @ Miniuser All Rights reserved.)'
  ClientHeight = 320
  ClientWidth = 360
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -24
  Font.Name = #47569#51008' '#44256#46357
  Font.Style = [fsBold]
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 32
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 360
    Height = 80
    Align = alTop
    BevelOuter = bvNone
    Padding.Top = 5
    ShowCaption = False
    TabOrder = 0
    object Button1: TButton
      Left = 0
      Top = 5
      Width = 120
      Height = 75
      Align = alLeft
      Caption = '1'
      TabOrder = 0
      ExplicitTop = 0
      ExplicitHeight = 110
    end
    object Button2: TButton
      Left = 120
      Top = 5
      Width = 120
      Height = 75
      Align = alClient
      Caption = '2'
      TabOrder = 1
      ExplicitLeft = 288
      ExplicitTop = -72
      ExplicitHeight = 110
    end
    object Button3: TButton
      Left = 240
      Top = 5
      Width = 120
      Height = 75
      Align = alRight
      Caption = '3'
      TabOrder = 2
      ExplicitLeft = 304
      ExplicitTop = -56
      ExplicitHeight = 110
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 80
    Width = 360
    Height = 80
    Align = alTop
    BevelOuter = bvNone
    Padding.Top = 5
    ShowCaption = False
    TabOrder = 1
    ExplicitTop = 110
    object Button4: TButton
      Left = 0
      Top = 5
      Width = 120
      Height = 75
      Align = alLeft
      Caption = '4'
      TabOrder = 0
      ExplicitLeft = -6
      ExplicitTop = 6
    end
    object Button5: TButton
      Left = 120
      Top = 5
      Width = 120
      Height = 75
      Align = alClient
      Caption = '5'
      TabOrder = 1
      ExplicitHeight = 100
    end
    object Button6: TButton
      Left = 240
      Top = 5
      Width = 120
      Height = 75
      Align = alRight
      Caption = '6'
      TabOrder = 2
      ExplicitHeight = 100
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 160
    Width = 360
    Height = 80
    Align = alTop
    BevelOuter = bvNone
    Padding.Top = 5
    ShowCaption = False
    TabOrder = 2
    ExplicitTop = 220
    object Button7: TButton
      Left = 0
      Top = 5
      Width = 120
      Height = 75
      Align = alLeft
      Caption = '7'
      TabOrder = 0
      ExplicitHeight = 100
    end
    object Button8: TButton
      Left = 120
      Top = 5
      Width = 120
      Height = 75
      Align = alClient
      Caption = '8'
      TabOrder = 1
      ExplicitHeight = 100
    end
    object Button9: TButton
      Left = 240
      Top = 5
      Width = 120
      Height = 75
      Align = alRight
      Caption = '9'
      TabOrder = 2
      ExplicitHeight = 100
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 240
    Width = 360
    Height = 80
    Align = alTop
    BevelOuter = bvNone
    Padding.Top = 5
    Padding.Bottom = 5
    ShowCaption = False
    TabOrder = 3
    ExplicitTop = 168
    object Button10: TButton
      Left = 240
      Top = 5
      Width = 120
      Height = 70
      Align = alClient
      Caption = 'Other'
      TabOrder = 0
      ExplicitLeft = 296
      ExplicitTop = 6
    end
    object Button11: TButton
      Left = 0
      Top = 5
      Width = 240
      Height = 70
      Align = alLeft
      Caption = '0'
      TabOrder = 1
      ExplicitLeft = 120
      ExplicitWidth = 120
    end
  end
end
