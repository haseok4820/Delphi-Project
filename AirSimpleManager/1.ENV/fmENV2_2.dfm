object Form_ENV2_2: TForm_ENV2_2
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Form_ENV2_2'
  ClientHeight = 550
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
    Height = 550
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
      Caption = '2-2. '#48372#51312#47784#45768#53552' '#49444#51221
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 10770443
      Font.Height = -27
      Font.Name = #44256#46020' B'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 781
    end
    object Panel1: TPanel
      Left = 15
      Top = 60
      Width = 806
      Height = 75
      Align = alTop
      BevelOuter = bvNone
      Padding.Bottom = 20
      ShowCaption = False
      TabOrder = 0
      inline Frame_CheckBox_useDualMonitor: TFrame_ENV_CheckBox
        Left = 0
        Top = 0
        Width = 250
        Height = 55
        Align = alLeft
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
        Padding.Bottom = 1
        ParentBackground = False
        ParentColor = False
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 0
        ExplicitWidth = 250
        ExplicitHeight = 55
        inherited Image_Check: TImage
          Height = 49
          ExplicitHeight = 49
        end
        inherited Label_MSG: TLabel
          Width = 167
          Height = 49
          Caption = #48372#51312#47784#45768#53552' '#49324#50857
          ExplicitWidth = 140
        end
        inherited Label2: TLabel
          Height = 49
        end
      end
      inline Frame_Edit_DualDisplayText: TFrame_ENV_Edit
        Left = 250
        Top = 0
        Width = 556
        Height = 55
        Align = alClient
        DoubleBuffered = True
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
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
        TabOrder = 1
        ExplicitLeft = 250
        ExplicitWidth = 556
        ExplicitHeight = 55
        inherited Label_Key: TLabel
          Width = 120
          Height = 53
          Caption = #54616#45800' '#52636#47141' '#47928#44396
          ExplicitWidth = 120
          ExplicitHeight = 53
        end
        inherited Panel_Body: TPanel
          Left = 121
          Width = 434
          Height = 53
          ExplicitLeft = 121
          ExplicitWidth = 434
          ExplicitHeight = 53
          inherited Edit_Value: TEdit
            Width = 401
            Height = 43
            ExplicitWidth = 401
            ExplicitHeight = 43
          end
        end
      end
    end
    object Panel2: TPanel
      Left = 15
      Top = 135
      Width = 806
      Height = 350
      Align = alTop
      BevelOuter = bvNone
      Caption = 'Panel2'
      TabOrder = 1
      object GroupBox2: TGroupBox
        Left = 498
        Top = 0
        Width = 308
        Height = 350
        Align = alClient
        Caption = #9679' '#48120#46356#50612' '#51116#49373' '#53580#49828#53944
        Color = clWhite
        Padding.Left = 5
        Padding.Top = 10
        Padding.Right = 5
        Padding.Bottom = 10
        ParentBackground = False
        ParentColor = False
        TabOrder = 0
        object WindowsMediaPlayer1: TWindowsMediaPlayer
          Left = 7
          Top = 36
          Width = 294
          Height = 252
          Align = alClient
          TabOrder = 0
          ExplicitLeft = 95
          ExplicitTop = 68
          ControlData = {
            0003000008000200000000000500000000000000F03F03000000000005000000
            00000000000008000200000000000300010000000B00FFFF0300000000000B00
            FFFF08000200000000000300320000000B00FFFF08000A0000006E006F006E00
            650000000B00FFFF0B00FFFF0B0000000B00FFFF0B0000000800020000000000
            0800020000000000080002000000000008000200000000000B000000631E0000
            0C1A0000}
        end
        object Button2: TButton
          Left = 7
          Top = 288
          Width = 294
          Height = 50
          Align = alBottom
          Caption = #53580#49828#53944#54624' '#48120#46356#50612' '#44032#51256#50724#44592
          TabOrder = 1
          OnClick = Button2Click
        end
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 498
        Height = 350
        Align = alLeft
        Caption = #9679' '#48372#51312#47784#45768#53552#50640' '#54364#49884#54624' '#48120#46356#50612' '#49440#53469
        Color = clWhite
        Padding.Left = 5
        Padding.Top = 10
        Padding.Right = 5
        Padding.Bottom = 5
        ParentBackground = False
        ParentColor = False
        TabOrder = 1
        inline Frame_ENV_LoadFile5: TFrame_ENV_LoadFile
          Left = 7
          Top = 276
          Width = 484
          Height = 60
          Align = alTop
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
          TabOrder = 0
          ExplicitLeft = 7
          ExplicitTop = 276
          ExplicitWidth = 484
          inherited Label_Title: TLabel
            Width = 100
            Caption = #48120#46356#50612' 5'
            ExplicitLeft = 2
            ExplicitTop = 2
            ExplicitWidth = 100
            ExplicitHeight = 56
          end
          inherited Label_Clear: TLabel
            Left = 383
            ExplicitLeft = 383
          end
          inherited Label_Value: TLabel
            Left = 101
            Width = 282
            ExplicitLeft = 101
            ExplicitWidth = 282
          end
        end
        inline Frame_ENV_LoadFile4: TFrame_ENV_LoadFile
          Left = 7
          Top = 216
          Width = 484
          Height = 60
          Align = alTop
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
          TabOrder = 1
          ExplicitLeft = 7
          ExplicitTop = 216
          ExplicitWidth = 484
          inherited Label_Title: TLabel
            Width = 100
            Caption = #48120#46356#50612' 4'
            ExplicitLeft = 2
            ExplicitTop = 2
            ExplicitWidth = 100
            ExplicitHeight = 56
          end
          inherited Label_Clear: TLabel
            Left = 383
            ExplicitLeft = 422
          end
          inherited Label_Value: TLabel
            Left = 101
            Width = 282
            ExplicitLeft = 102
            ExplicitWidth = 320
          end
        end
        inline Frame_ENV_LoadFile3: TFrame_ENV_LoadFile
          Left = 7
          Top = 156
          Width = 484
          Height = 60
          Align = alTop
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
          TabOrder = 2
          ExplicitLeft = 7
          ExplicitTop = 156
          ExplicitWidth = 484
          inherited Label_Title: TLabel
            Width = 100
            Caption = #48120#46356#50612' 3'
            ExplicitLeft = 2
            ExplicitTop = 2
            ExplicitWidth = 100
            ExplicitHeight = 56
          end
          inherited Label_Clear: TLabel
            Left = 383
            ExplicitLeft = 422
          end
          inherited Label_Value: TLabel
            Left = 101
            Width = 282
            ExplicitLeft = 102
            ExplicitWidth = 320
          end
        end
        inline Frame_ENV_LoadFile2: TFrame_ENV_LoadFile
          Left = 7
          Top = 96
          Width = 484
          Height = 60
          Align = alTop
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
          TabOrder = 3
          ExplicitLeft = 7
          ExplicitTop = 96
          ExplicitWidth = 484
          inherited Label_Title: TLabel
            Width = 100
            Caption = #48120#46356#50612' 2'
            ExplicitLeft = 2
            ExplicitTop = 2
            ExplicitWidth = 100
            ExplicitHeight = 56
          end
          inherited Label_Clear: TLabel
            Left = 383
            ExplicitLeft = 422
          end
          inherited Label_Value: TLabel
            Left = 101
            Width = 282
            OnClick = Frame_ENV_LoadFile2Label_ValueClick
            ExplicitLeft = 102
            ExplicitWidth = 320
          end
        end
        inline Frame_ENV_LoadFile1: TFrame_ENV_LoadFile
          Left = 7
          Top = 36
          Width = 484
          Height = 60
          Align = alTop
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
          ExplicitLeft = 7
          ExplicitTop = 36
          ExplicitWidth = 484
          inherited Label_Title: TLabel
            Width = 100
            Caption = #48120#46356#50612' 1'
            ExplicitLeft = 2
            ExplicitTop = 2
            ExplicitWidth = 100
            ExplicitHeight = 56
          end
          inherited Label_Clear: TLabel
            Left = 383
            ExplicitLeft = 422
          end
          inherited Label_Value: TLabel
            Left = 101
            Width = 282
            ExplicitLeft = 102
            ExplicitWidth = 320
          end
        end
      end
    end
  end
end
