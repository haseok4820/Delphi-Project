object Form_ENV4_1: TForm_ENV4_1
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Form_ENV4_1'
  ClientHeight = 3186
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
    Height = 3186
    HorzScrollBar.Tracking = True
    VertScrollBar.Tracking = True
    Align = alClient
    BevelOuter = bvNone
    Padding.Left = 15
    Padding.Right = 15
    Padding.Bottom = 15
    TabOrder = 0
    DesignSize = (
      836
      3182)
    object Label_Title: TLabel
      Left = 15
      Top = 0
      Width = 806
      Height = 60
      Align = alTop
      AutoSize = False
      Caption = '4-1. '#44208#51228#44288#47532
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 10770443
      Font.Height = -27
      Font.Name = #44256#46020' B'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 781
    end
    object Label_Execute: TLabel
      Left = 15
      Top = 416
      Width = 505
      Height = 30
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = #49892#54665' '#50976#47924' :  '#54869#51064#51473'...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = #44256#46020' B'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      Visible = False
    end
    object Label_Version: TLabel
      Left = 15
      Top = 452
      Width = 505
      Height = 30
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = #54028#51068' '#48260#51204' :  1.1.0 '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = #44256#46020' B'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      Visible = False
    end
    object Label_Path: TLabel
      Left = 15
      Top = 488
      Width = 505
      Height = 30
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = #49444#52824' '#44221#47196' : C:\Program Files(x86)\KCP'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = #44256#46020' B'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      Visible = False
    end
    object Button_Install: TButton
      Left = 563
      Top = 411
      Width = 250
      Height = 110
      Hint = ' '#50640#51060#51204#53944' '#45796#50868#47196#46300
      Anchors = [akTop, akRight]
      Caption = ' '#50640#51060#51204#53944' '#45796#50868#47196#46300
      Constraints.MinHeight = 110
      TabOrder = 1
      WordWrap = True
      OnClick = Button_InstallClick
    end
    object GroupBox_CARD: TGroupBox
      Left = 15
      Top = 60
      Width = 806
      Height = 350
      Align = alTop
      Caption = '-1. VAN '#49444#51221
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = #44256#46020' B'
      Font.Style = []
      Padding.Left = 10
      Padding.Top = 10
      Padding.Right = 10
      Padding.Bottom = 10
      ParentFont = False
      TabOrder = 0
      DesignSize = (
        806
        350)
      object Label_MSG1: TLabel
        Left = 550
        Top = 36
        Width = 250
        Height = 30
        Anchors = [akRight]
        AutoSize = False
        Caption = #50640#51060#51204#53944' '#49324#50857#49884' '#47532#45908#44592' '#54252#53944#50640' '#49444#51221
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -16
        Font.Name = #44256#46020' B'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
      end
      object Panel_VanList: TPanel
        Left = 13
        Top = 35
        Width = 505
        Height = 302
        Anchors = [akLeft, akTop, akBottom]
        BevelOuter = bvNone
        Color = clWhite
        DoubleBuffered = True
        ParentBackground = False
        ParentDoubleBuffered = False
        TabOrder = 0
      end
      inline Frame_ComboBox_Port1: TFrame_ENV_ComboBox
        Left = 550
        Top = 72
        Width = 250
        Height = 53
        Hint = #52852#46300#47532#45908#44592' '
        Anchors = [akRight]
        DoubleBuffered = True
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = #44256#46020' B'
        Font.Style = []
        Padding.Left = 2
        Padding.Top = 2
        Padding.Right = 2
        Padding.Bottom = 2
        ParentBackground = False
        ParentColor = False
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 1
        OnClick = Frame_ComboBox_PortClick
        ExplicitLeft = 550
        ExplicitTop = 72
        ExplicitWidth = 250
        ExplicitHeight = 53
        inherited Label_Key: TLabel
          Width = 184
          Height = 49
          Caption = #47532#45908#44592' '#54252#53944
          ExplicitWidth = 216
          ExplicitHeight = 49
        end
        inherited Label1: TLabel
          Left = 198
          Height = 49
          ExplicitLeft = 230
          ExplicitHeight = 49
        end
      end
      inline Frame_ComboBox_Port2: TFrame_ENV_ComboBox
        Left = 550
        Top = 131
        Width = 250
        Height = 53
        Hint = #45800#47568#44592' '
        Anchors = [akRight]
        DoubleBuffered = True
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = #44256#46020' B'
        Font.Style = []
        Padding.Left = 2
        Padding.Top = 2
        Padding.Right = 2
        Padding.Bottom = 2
        ParentBackground = False
        ParentColor = False
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 2
        OnClick = Frame_ComboBox_PortClick
        ExplicitLeft = 550
        ExplicitTop = 131
        ExplicitWidth = 250
        ExplicitHeight = 53
        inherited Label_Key: TLabel
          Width = 184
          Height = 49
          Caption = #45800#47568#44592' '#54252#53944
          ExplicitWidth = 216
          ExplicitHeight = 49
        end
        inherited Label1: TLabel
          Left = 198
          Height = 49
          ExplicitLeft = 230
          ExplicitHeight = 49
        end
      end
      inline Frame_ComboBox_Port3: TFrame_ENV_ComboBox
        Left = 550
        Top = 190
        Width = 250
        Height = 53
        Hint = #49436#47749#54056#46300' '
        Anchors = [akRight]
        DoubleBuffered = True
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = #44256#46020' B'
        Font.Style = []
        Padding.Left = 2
        Padding.Top = 2
        Padding.Right = 2
        Padding.Bottom = 2
        ParentBackground = False
        ParentColor = False
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 3
        OnClick = Frame_ComboBox_PortClick
        ExplicitLeft = 550
        ExplicitTop = 190
        ExplicitWidth = 250
        ExplicitHeight = 53
        inherited Label_Key: TLabel
          Width = 184
          Height = 49
          Caption = #49436#47749#54056#46300' '#54252#53944
          ExplicitLeft = -42
          ExplicitTop = -14
          ExplicitWidth = 220
          ExplicitHeight = 49
        end
        inherited Label1: TLabel
          Left = 198
          Height = 49
          ExplicitLeft = 230
          ExplicitHeight = 49
        end
      end
      inline Frame_Edit_TID: TFrame_ENV_Edit
        Left = 550
        Top = 285
        Width = 250
        Height = 49
        Anchors = [akRight, akBottom]
        DoubleBuffered = True
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = #44256#46020' B'
        Font.Style = []
        Padding.Left = 1
        Padding.Top = 1
        Padding.Right = 1
        Padding.Bottom = 1
        ParentBackground = False
        ParentColor = False
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 4
        ExplicitLeft = 550
        ExplicitTop = 285
        ExplicitWidth = 250
        inherited Label_Key: TLabel
          Width = 80
          Caption = 'TID'
          ExplicitWidth = 80
          ExplicitHeight = 47
        end
        inherited Panel_Body: TPanel
          Left = 81
          Width = 168
          ExplicitLeft = 181
          ExplicitTop = 1
          ExplicitWidth = 68
          inherited Edit_Value: TEdit
            Width = 135
            ExplicitWidth = 35
          end
        end
      end
    end
    object ProgressBar1: TProgressBar
      Left = 563
      Top = 501
      Width = 250
      Height = 20
      Anchors = [akTop, akRight]
      BorderWidth = 2
      TabOrder = 2
      Visible = False
    end
  end
  object Timer_Progress: TTimer
    Enabled = False
    OnTimer = Timer_ProgressTimer
    Left = 408
    Top = 432
  end
end
