object Form_ENV1_2: TForm_ENV1_2
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Form_ENV1_2'
  ClientHeight = 540
  ClientWidth = 833
  Color = clWhite
  DoubleBuffered = True
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
    Width = 833
    Height = 540
    HorzScrollBar.Tracking = True
    VertScrollBar.Position = 284
    VertScrollBar.Tracking = True
    Align = alClient
    BevelOuter = bvNone
    Padding.Left = 15
    Padding.Right = 40
    Padding.Bottom = 10
    TabOrder = 0
    object Label_Title: TLabel
      Left = 15
      Top = -284
      Width = 757
      Height = 40
      Align = alTop
      AutoSize = False
      Caption = '1-2. '#50868#50689#51221#48372
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 10770443
      Font.Height = -27
      Font.Name = #44256#46020' B'
      Font.Style = []
      ParentFont = False
      Layout = tlBottom
      ExplicitLeft = 32
      ExplicitTop = 40
      ExplicitWidth = 840
    end
    object Label_Guide1: TLabel
      Left = 15
      Top = -244
      Width = 757
      Height = 50
      Align = alTop
      AutoSize = False
      Caption = ' -1. '#44060#51216'/'#47560#44048' '#51221#48372#47484' '#44288#47532#54624' '#49688' '#51080#49845#45768#45796'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 10770443
      Font.Height = -21
      Font.Name = #44256#46020' B'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      ExplicitLeft = 18
      ExplicitTop = 39
      ExplicitWidth = 781
    end
    object Label_Guide2: TLabel
      Left = 15
      Top = -14
      Width = 757
      Height = 60
      Align = alTop
      AutoSize = False
      Caption = ' -2. '#47588#51109' '#50868#50689' '#51221#48372#47484' '#49444#51221#54624' '#49688' '#51080#49845#45768#45796'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 10770443
      Font.Height = -21
      Font.Name = #44256#46020' B'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      ExplicitTop = 210
      ExplicitWidth = 781
    end
    object Panel2: TPanel
      Left = 15
      Top = 46
      Width = 757
      Height = 60
      Align = alTop
      BevelOuter = bvNone
      Color = clWhite
      Padding.Left = 50
      Padding.Bottom = 10
      ParentBackground = False
      ShowCaption = False
      TabOrder = 0
      object Label2: TLabel
        Left = 50
        Top = 0
        Width = 387
        Height = 50
        Align = alClient
        AutoSize = False
        Caption = '-  '#54032#47588#48169#48277' ('#44592#48376' : '#51340#49437#51228')'
        Layout = tlCenter
        ExplicitLeft = 0
        ExplicitWidth = 225
        ExplicitHeight = 60
      end
      inline Frame_YN_useAdvance: TFrame_ENV_YN
        Left = 437
        Top = 0
        Width = 320
        Height = 50
        Align = alRight
        DoubleBuffered = True
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
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
        TabOrder = 0
        ExplicitLeft = 437
        ExplicitHeight = 50
        inherited Label_Y: TLabel
          Height = 46
          Caption = #49440#48520#51228
          Color = 10770443
          Font.Color = clWhite
          ExplicitLeft = 82
          ExplicitTop = 34
          ExplicitHeight = 46
        end
        inherited Label_N: TLabel
          Height = 46
          Caption = #51340#49437#51228
          ExplicitHeight = 46
        end
      end
    end
    object Panel3: TPanel
      Left = 15
      Top = 106
      Width = 757
      Height = 60
      Align = alTop
      BevelOuter = bvNone
      Color = clWhite
      Padding.Left = 50
      Padding.Bottom = 10
      ParentBackground = False
      ShowCaption = False
      TabOrder = 1
      object Label3: TLabel
        Left = 50
        Top = 0
        Width = 387
        Height = 50
        Align = alClient
        AutoSize = False
        Caption = '-  '#47588#51109#50976#54805
        Layout = tlCenter
        ExplicitLeft = 46
        ExplicitTop = -4
        ExplicitWidth = 390
        ExplicitHeight = 490
      end
      inline Frame_YN_useTimeSale: TFrame_ENV_YN
        Left = 437
        Top = 0
        Width = 320
        Height = 50
        Align = alRight
        DoubleBuffered = True
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
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
        TabOrder = 0
        OnClick = Frame_YN_useTimeSaleClick
        ExplicitLeft = 437
        ExplicitHeight = 50
        inherited Label_Y: TLabel
          Height = 46
          Caption = 'AirTime'
          Color = 10770443
          Font.Color = clWhite
          Font.Height = -21
          ExplicitLeft = 82
          ExplicitTop = 34
          ExplicitHeight = 46
        end
        inherited Label_N: TLabel
          Height = 46
          Caption = 'AirCafe('#44592#48376')'
          ExplicitHeight = 46
        end
      end
    end
    object Panel1: TPanel
      Left = 15
      Top = -74
      Width = 757
      Height = 60
      Align = alTop
      BevelOuter = bvNone
      Color = clWhite
      Padding.Left = 50
      Padding.Bottom = 10
      ParentBackground = False
      ShowCaption = False
      TabOrder = 2
      object Label1: TLabel
        Left = 50
        Top = 0
        Width = 552
        Height = 50
        Align = alClient
        AutoSize = False
        Caption = '-  '#51088#46041' '#47560#44048'/'#44060#51216' '#49884#44036' :  '
        Layout = tlCenter
        ExplicitLeft = 1
        ExplicitTop = -30
        ExplicitWidth = 183
        ExplicitHeight = 71
      end
      object DateTimePicker1: TDateTimePicker
        Left = 602
        Top = 0
        Width = 155
        Height = 50
        Cursor = crHandPoint
        Align = alRight
        BevelInner = bvNone
        Date = 36645.166666666660000000
        Format = '  HH:mm'
        Time = 36645.166666666660000000
        DateMode = dmUpDown
        DoubleBuffered = True
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -35
        Font.Name = #44256#46020' B'
        Font.Style = []
        Kind = dtkTime
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 0
      end
    end
    object GroupBox_TimeOption: TGroupBox
      AlignWithMargins = True
      Left = 65
      Top = 166
      Width = 707
      Height = 300
      Margins.Left = 50
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 10
      Align = alTop
      Caption = #49884#44036#51228' '#51204#50857' '#49444#51221
      Padding.Top = 10
      TabOrder = 3
      inline Frame_CheckBox_useTimeChange: TFrame_ENV_CheckBox
        Left = 2
        Top = 216
        Width = 703
        Height = 60
        Align = alTop
        DoubleBuffered = True
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
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 0
        ExplicitLeft = 2
        ExplicitTop = 216
        ExplicitWidth = 703
        inherited Label_MSG: TLabel
          Width = 620
          Height = 50
          Caption = #52628#44032#49884#44036' '#48148#47196#51201#50857
          ExplicitWidth = 160
        end
        inherited Label2: TLabel
          Height = 50
        end
      end
      inline Frame_CheckBox_useTimeOverChg: TFrame_ENV_CheckBox
        Left = 2
        Top = 156
        Width = 703
        Height = 60
        Align = alTop
        DoubleBuffered = True
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
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 1
        ExplicitLeft = 2
        ExplicitTop = 156
        ExplicitWidth = 703
        inherited Label_MSG: TLabel
          Width = 620
          Height = 50
          Caption = #51077#49892#49884#44036' '#48320#44221' '#49324#50857
          ExplicitWidth = 165
        end
        inherited Label2: TLabel
          Height = 50
        end
      end
      inline Frame_CheckBox_TimeSaleNoAdvance: TFrame_ENV_CheckBox
        Left = 2
        Top = 96
        Width = 703
        Height = 60
        Align = alTop
        DoubleBuffered = True
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
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 2
        ExplicitLeft = 2
        ExplicitTop = 96
        ExplicitWidth = 703
        inherited Label_MSG: TLabel
          Width = 620
          Height = 50
          Caption = #54980#48520#44208#51228' '#49324#50857
          ExplicitWidth = 123
        end
        inherited Label2: TLabel
          Height = 50
        end
      end
      inline Frame_CheckBox_TimeSaleStaticLock: TFrame_ENV_CheckBox
        Left = 2
        Top = 36
        Width = 703
        Height = 60
        Align = alTop
        DoubleBuffered = True
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
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 3
        ExplicitLeft = 2
        ExplicitTop = 36
        ExplicitWidth = 703
        inherited Label_MSG: TLabel
          Width = 620
          Height = 50
          Caption = #44256#51221#46973#52964' '#49324#50857' ('#48120#49324#50857#49884', '#53580#51060#48660' '#53468#44536#48169#49885' '#51088#46041' '#52376#47532')'
          ExplicitWidth = 464
        end
        inherited Label2: TLabel
          Height = 50
        end
      end
    end
    inline Frame_CheckBox_optCloseSale: TFrame_ENV_CheckBox
      AlignWithMargins = True
      Left = 65
      Top = -194
      Width = 707
      Height = 60
      Margins.Left = 50
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alTop
      DoubleBuffered = True
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
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 4
      OnClick = Frame_CheckBox_useSale24Click
      ExplicitLeft = 65
      ExplicitTop = -194
      ExplicitWidth = 707
      inherited Image_Check: TImage
        ExplicitLeft = 13
        ExplicitTop = 6
      end
      inherited Label_MSG: TLabel
        Width = 624
        Height = 50
        Caption = #54252#49828#48324' '#44060#51216'/'#47560#44048' '#47784#46300' ('#49324#50857#49884' '#54252#49828#48324#47196' '#44033#44033' '#46384#47196' '#44060#51216'/'#47560#44048' '#52376#47532')'
        ExplicitWidth = 581
      end
      inherited Label2: TLabel
        Height = 50
      end
    end
    inline Frame_CheckBox_useSale24: TFrame_ENV_CheckBox
      AlignWithMargins = True
      Left = 65
      Top = -134
      Width = 707
      Height = 60
      Margins.Left = 50
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alTop
      DoubleBuffered = True
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
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 5
      OnClick = Frame_CheckBox_useSale24Click
      ExplicitLeft = 65
      ExplicitTop = -134
      ExplicitWidth = 707
      inherited Image_Check: TImage
        ExplicitLeft = 13
        ExplicitTop = 6
      end
      inherited Label_MSG: TLabel
        Width = 624
        Height = 50
        Caption = #51088#46041' '#44060#51216'/'#47560#44048' '#49324#50857
        ExplicitWidth = 175
      end
      inherited Label2: TLabel
        Height = 50
      end
    end
    inline Frame_CheckBox_NewDelv: TFrame_ENV_CheckBox
      AlignWithMargins = True
      Left = 65
      Top = 476
      Width = 707
      Height = 60
      Margins.Left = 50
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alTop
      DoubleBuffered = True
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
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 6
      OnClick = Frame_CheckBox_NewDelvClick
      ExplicitLeft = 65
      ExplicitTop = 476
      ExplicitWidth = 707
      inherited Label_MSG: TLabel
        Width = 624
        Height = 50
        Caption = #48176#45804' '#49324#50857#50976#47924
        ExplicitWidth = 124
      end
      inherited Label2: TLabel
        Height = 50
      end
    end
  end
end
