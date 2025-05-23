object fmMain: TfmMain
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'Mine'
  ClientHeight = 240
  ClientWidth = 350
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = #47569#51008' '#44256#46357
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 21
  object Panel_Header: TPanel
    Left = 0
    Top = 0
    Width = 350
    Height = 50
    Align = alTop
    BevelOuter = bvNone
    ShowCaption = False
    TabOrder = 0
    object Image_Icon: TImage
      Left = 0
      Top = 0
      Width = 350
      Height = 50
      Align = alClient
      Center = True
      ParentShowHint = False
      Picture.Data = {
        0B54496D6167696E67504E4789504E470D0A1A0A0000000D4948445200000028
        0000002808060000008CFEB86D0000017149444154789CED9841B2823010443B
        556E388BF73F0A6771397F93F0C738C9F42448B4CAB75260322F1D40F0860FE7
        E61DB09A3304C5D99F9CFD5D46050F2979DC7BC7216DBB9E4058362A28802FA5
        D1C72A595A34222811318B529F45294946309C9A873CEE749A9EE0746A2D844C
        B327F836398DFCA7694A7A092EA72578497A05E9A468095E2A579086647889D3
        B61F9FD9898CD4146AC16E7ABA11F277AF61A4468C14E904EB467A7BABE1484D
        0D2DB80A2DB8E4E2A8916A99E90473A1B9BD850CD4D4D082C06B43A6910CD468
        428240BC01305653080B5ECD4F7096AF124C69DB97DF0BF3157F3C307C55821F
        492DB87499EBE505C80453E0E983851DD3125C926232D203DAE7E093A4A8DFD3
        59716B9C961C402E31F0F41EFBB2CD63A4A6D0133497DA98B90BF11A31F4E20E
        6449C06E124D43A32637F5D707900748275E385E6A1A46B0D04D93814D4D1311
        04F2C04514F065ABF394162B44050B47232DDB202CA51915D44C09789C21F856
        FE00139BC0473ED743290000000049454E44AE426082}
      ShowHint = True
      OnClick = Image_IconClick
      ExplicitTop = -6
      ExplicitHeight = 40
    end
  end
  object Panel_Footer: TPanel
    Left = 0
    Top = 210
    Width = 350
    Height = 30
    Align = alBottom
    BevelOuter = bvNone
    Padding.Left = 5
    Padding.Right = 5
    ShowCaption = False
    TabOrder = 1
    object Label_Time: TLabel
      Left = 230
      Top = 0
      Width = 115
      Height = 30
      Hint = 'Time : '
      Align = alRight
      Caption = 'Time : 00:00:00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      Visible = False
      ExplicitHeight = 21
    end
    object Label1: TLabel
      Left = 5
      Top = 0
      Width = 194
      Height = 30
      Align = alLeft
      Caption = 'Copyright 2022 Miniuser. All Rights Reserved.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitHeight = 12
    end
  end
  object Panel_Map: TPanel
    Left = 0
    Top = 50
    Width = 350
    Height = 160
    Align = alClient
    BevelOuter = bvNone
    Caption = '953'
    Color = clWhite
    Padding.Top = 10
    Padding.Bottom = 10
    ParentBackground = False
    ShowCaption = False
    TabOrder = 2
  end
  object MainMenu1: TMainMenu
    Left = 8
    Top = 16
    object N1: TMenuItem
      Caption = #44172#51076'(Game)'
      object N2: TMenuItem
        Caption = #49352#47196' '#49884#51089'(New Game)'
        OnClick = NewClick
      end
      object N5: TMenuItem
        Caption = #45149#45236#44592'(Exit)'
        OnClick = ExitClick
      end
    end
    object Help1: TMenuItem
      Caption = #44592#53440'(Other)'
      object N4: TMenuItem
        Caption = #54532#47196#44536#47016' '#51221#48372' (Program Info)'
        OnClick = N4Click
      end
    end
  end
  object Timer: TTimer
    Enabled = False
    OnTimer = TimerTimer
    Left = 8
    Top = 64
  end
end
