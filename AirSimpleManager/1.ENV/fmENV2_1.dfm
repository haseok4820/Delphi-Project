object Form_ENV2_1: TForm_ENV2_1
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Form_ENV2_1'
  ClientHeight = 540
  ClientWidth = 840
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -21
  Font.Name = #44256#46020' B'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 24
  object ScrollBox_Main: TScrollBox
    Left = 0
    Top = 0
    Width = 840
    Height = 540
    HorzScrollBar.Tracking = True
    VertScrollBar.Tracking = True
    Align = alClient
    BevelOuter = bvNone
    Padding.Left = 15
    Padding.Right = 15
    Padding.Bottom = 10
    TabOrder = 0
    object Label_Title: TLabel
      Left = 15
      Top = 0
      Width = 806
      Height = 60
      Align = alTop
      AutoSize = False
      Caption = '2-1. '#44592#53440#49444#51221
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 10770443
      Font.Height = -27
      Font.Name = #44256#46020' B'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 781
    end
    object GroupBox_Device: TGroupBox
      Left = 15
      Top = 60
      Width = 806
      Height = 466
      Align = alClient
      Caption = '-1. '#49324#50857#51088' '#49444#51221
      TabOrder = 0
      inline Frame_CheckBox_useOrdCashRecp: TFrame_ENV_CheckBox
        Left = 2
        Top = 86
        Width = 802
        Height = 60
        Align = alTop
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = #44256#46020' B'
        Font.Style = []
        Padding.Left = 10
        Padding.Top = 5
        Padding.Right = 5
        Padding.Bottom = 5
        ParentBackground = False
        ParentColor = False
        ParentFont = False
        TabOrder = 0
        ExplicitLeft = 2
        ExplicitTop = 86
        ExplicitWidth = 802
        inherited Label_MSG: TLabel
          Width = 719
          Height = 50
          Caption = #54788#44552#44208#51228#49884' '#54788#44552#50689#49688#51613' '#48156#54665#50976#47924#47484' '#54869#51064#54633#45768#45796'.'
          ExplicitWidth = 415
        end
        inherited Label2: TLabel
          Height = 50
        end
      end
      inline Frame_CheckBox_QuesAppr: TFrame_ENV_CheckBox
        Left = 2
        Top = 26
        Width = 802
        Height = 60
        Align = alTop
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = #44256#46020' B'
        Font.Style = []
        Padding.Left = 10
        Padding.Top = 5
        Padding.Right = 5
        Padding.Bottom = 5
        ParentBackground = False
        ParentColor = False
        ParentFont = False
        TabOrder = 1
        ExplicitLeft = 2
        ExplicitTop = 26
        ExplicitWidth = 802
        inherited Label_MSG: TLabel
          Width = 719
          Height = 50
          Caption = #44208#51228#51204' '#51656#51032#52285#51012' '#54364#49884#54616#50668', '#49324#50857#51088' '#54869#51064' '#54980' '#51652#54665#54633#45768#45796'.'
          ExplicitWidth = 478
        end
        inherited Label2: TLabel
          Height = 50
        end
      end
      inline Frame_CheckBox_useIDSave: TFrame_ENV_CheckBox
        Left = 2
        Top = 146
        Width = 802
        Height = 60
        Align = alTop
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = #44256#46020' B'
        Font.Style = []
        Padding.Left = 10
        Padding.Top = 5
        Padding.Right = 5
        Padding.Bottom = 5
        ParentBackground = False
        ParentColor = False
        ParentFont = False
        TabOrder = 2
        ExplicitLeft = 2
        ExplicitTop = 146
        ExplicitWidth = 802
        inherited Label_MSG: TLabel
          Width = 719
          Height = 50
          Caption = #47196#44536#51064' '#51221#48372#47484' '#51200#51109#54633#45768#45796'.'
          ExplicitWidth = 233
        end
        inherited Label2: TLabel
          Height = 50
        end
      end
    end
  end
end
