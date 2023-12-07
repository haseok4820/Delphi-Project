object Form_ENV3_1: TForm_ENV3_1
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Form_ENV3_1'
  ClientHeight = 1000
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
    Height = 1000
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
      Height = 40
      Align = alTop
      AutoSize = False
      Caption = '3-1. '#51452#48320#51109#52824#44288#47532
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
      Top = 40
      Width = 806
      Height = 50
      Align = alTop
      AutoSize = False
      Caption = ' -1. '#50689#49688#51613' '#48143' '#51452#48169' '#54532#47536#53552' '#46321' '#51109#52824#50672#44208#51012' '#44288#47532#54624' '#49688' '#51080#49845#45768#45796'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 10770443
      Font.Height = -21
      Font.Name = #44256#46020' B'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      ExplicitLeft = 18
      ExplicitTop = 34
    end
    object GroupBox_Device_Ext: TGroupBox
      Left = 15
      Top = 478
      Width = 806
      Height = 285
      Align = alTop
      Caption = #9679' '#50808#48512#51109#52824' '#50672#44208' '#49444#51221' [ '#54869#51109#54252#53944' ]'
      Padding.Left = 10
      Padding.Top = 10
      Padding.Right = 10
      Padding.Bottom = 10
      TabOrder = 0
      object Panel3: TPanel
        Left = 12
        Top = 36
        Width = 489
        Height = 237
        Align = alLeft
        BevelOuter = bvNone
        Caption = 'Panel3'
        TabOrder = 0
        inline Frame_ExtComboBox_Title1: TFrame_ENV_DoubleComboBox_Title
          Left = 0
          Top = 0
          Width = 489
          Height = 78
          Align = alTop
          DoubleBuffered = True
          Color = clGray
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
          ExplicitWidth = 489
          inherited Panel_Parent: TPanel
            Width = 487
            ExplicitWidth = 487
            inherited Label_Title: TLabel
              Width = 100
              Caption = #54252#53944' '#49440#53469
              ExplicitWidth = 100
            end
            inherited Label_hide: TLabel
              Left = 110
              Height = 56
              ExplicitLeft = 120
            end
            inherited Label1: TLabel
              Left = 306
              Height = 56
              ExplicitLeft = 149
            end
            inherited Label2: TLabel
              Left = 300
              Height = 56
              ExplicitLeft = 143
            end
            inherited COMBO_1: TFrame_ENV_ComboBox
              Left = 116
              Width = 184
              ExplicitLeft = 116
              ExplicitWidth = 184
              inherited Label_Key: TLabel
                Width = 128
                Font.Height = -19
                ParentFont = False
                ExplicitWidth = 246
              end
              inherited Label1: TLabel
                Left = 142
                Width = 40
                ExplicitLeft = 127
                ExplicitWidth = 40
                ExplicitHeight = 52
              end
              inherited Label_Hide: TLabel
                Height = 52
              end
            end
            inherited COMBO_2: TFrame_ENV_ComboBox
              Left = 312
              Width = 165
              ExplicitLeft = 312
              ExplicitWidth = 165
              inherited Label_Key: TLabel
                Width = 109
                Caption = #51452#48169#53945#48324' '#51204#49569#50976#47924#47484' '#49440#53469#54644#51452#49464#50836'.'
                Font.Height = -19
                ParentFont = False
                ExplicitWidth = 254
              end
              inherited Label1: TLabel
                Left = 123
                Width = 40
                ExplicitLeft = 108
                ExplicitWidth = 40
                ExplicitHeight = 52
              end
              inherited Label_Hide: TLabel
                Height = 52
              end
            end
          end
        end
        inline Frame_ExtComboBox_Title2: TFrame_ENV_DoubleComboBox_Title
          Left = 0
          Top = 78
          Width = 489
          Height = 78
          Align = alTop
          DoubleBuffered = True
          Color = clGray
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
          ExplicitTop = 78
          ExplicitWidth = 489
          inherited Panel_Parent: TPanel
            Width = 487
            ExplicitWidth = 487
            inherited Label_Title: TLabel
              Width = 100
              Caption = #54252#53944' '#49440#53469
              ExplicitWidth = 100
            end
            inherited Label_hide: TLabel
              Left = 110
              Height = 56
              ExplicitLeft = 120
            end
            inherited Label1: TLabel
              Left = 306
              Height = 56
              ExplicitLeft = 149
            end
            inherited Label2: TLabel
              Left = 300
              Height = 56
              ExplicitLeft = 143
            end
            inherited COMBO_1: TFrame_ENV_ComboBox
              Left = 116
              Width = 184
              ExplicitLeft = 116
              ExplicitWidth = 184
              inherited Label_Key: TLabel
                Width = 128
                Font.Height = -19
                ParentFont = False
                ExplicitWidth = 246
              end
              inherited Label1: TLabel
                Left = 142
                Width = 40
                ExplicitLeft = 127
                ExplicitWidth = 40
                ExplicitHeight = 52
              end
              inherited Label_Hide: TLabel
                Height = 52
              end
            end
            inherited COMBO_2: TFrame_ENV_ComboBox
              Left = 312
              Width = 165
              ExplicitLeft = 312
              ExplicitWidth = 165
              inherited Label_Key: TLabel
                Width = 109
                Caption = #51452#48169#53945#48324' '#51204#49569#50976#47924#47484' '#49440#53469#54644#51452#49464#50836'.'
                Font.Height = -19
                ParentFont = False
                ExplicitWidth = 254
              end
              inherited Label1: TLabel
                Left = 123
                Width = 40
                ExplicitLeft = 108
                ExplicitWidth = 40
                ExplicitHeight = 52
              end
              inherited Label_Hide: TLabel
                Height = 52
              end
            end
          end
        end
        inline Frame_ExtComboBox_Title3: TFrame_ENV_DoubleComboBox_Title
          Left = 0
          Top = 156
          Width = 489
          Height = 78
          Align = alTop
          DoubleBuffered = True
          Color = clGray
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
          ExplicitTop = 156
          ExplicitWidth = 489
          inherited Panel_Parent: TPanel
            Width = 487
            ExplicitWidth = 487
            inherited Label_Title: TLabel
              Width = 100
              Caption = #54252#53944' '#49440#53469
              ExplicitWidth = 100
            end
            inherited Label_hide: TLabel
              Left = 110
              Height = 56
              ExplicitLeft = 120
            end
            inherited Label1: TLabel
              Left = 306
              Height = 56
              ExplicitLeft = 149
            end
            inherited Label2: TLabel
              Left = 300
              Height = 56
              ExplicitLeft = 143
            end
            inherited COMBO_1: TFrame_ENV_ComboBox
              Left = 116
              Width = 184
              ExplicitLeft = 116
              ExplicitWidth = 184
              inherited Label_Key: TLabel
                Width = 128
                Font.Height = -19
                ParentFont = False
                ExplicitWidth = 246
              end
              inherited Label1: TLabel
                Left = 142
                Width = 40
                ExplicitLeft = 127
                ExplicitWidth = 40
                ExplicitHeight = 52
              end
              inherited Label_Hide: TLabel
                Height = 52
              end
            end
            inherited COMBO_2: TFrame_ENV_ComboBox
              Left = 312
              Width = 165
              ExplicitLeft = 312
              ExplicitWidth = 165
              inherited Label_Key: TLabel
                Width = 109
                Caption = #51452#48169#53945#48324' '#51204#49569#50976#47924#47484' '#49440#53469#54644#51452#49464#50836'.'
                Font.Height = -19
                ParentFont = False
                ExplicitWidth = 254
              end
              inherited Label1: TLabel
                Left = 123
                Width = 40
                ExplicitLeft = 108
                ExplicitWidth = 40
                ExplicitHeight = 52
              end
              inherited Label_Hide: TLabel
                Height = 52
              end
            end
          end
        end
      end
      object Panel4: TPanel
        Left = 501
        Top = 36
        Width = 293
        Height = 237
        Align = alClient
        BevelOuter = bvNone
        ShowCaption = False
        TabOrder = 1
        object Panel5: TPanel
          Left = 0
          Top = 156
          Width = 293
          Height = 78
          Align = alTop
          BevelKind = bkFlat
          BevelOuter = bvNone
          Caption = 'Panel5'
          Padding.Left = 10
          Padding.Top = 11
          Padding.Right = 10
          Padding.Bottom = 11
          TabOrder = 0
          inline Frame_ExtComboBox_Type3: TFrame_ENV_ComboBox
            Left = 10
            Top = 11
            Width = 269
            Height = 52
            Align = alClient
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
            TabOrder = 0
            ExplicitLeft = 10
            ExplicitTop = 11
            ExplicitWidth = 269
            ExplicitHeight = 52
            inherited Label_Key: TLabel
              Width = 203
              Height = 48
              Caption = #51109#52824'/'#44592#51333#51012' '#49440#53469#54644#51452#49464#50836'.'
              Font.Height = -19
              ParentFont = False
              ExplicitWidth = 203
              ExplicitHeight = 48
            end
            inherited Label1: TLabel
              Left = 217
              Height = 48
              ExplicitLeft = 217
              ExplicitHeight = 48
            end
            inherited Label_Hide: TLabel
              Height = 48
            end
          end
        end
        object Panel6: TPanel
          Left = 0
          Top = 78
          Width = 293
          Height = 78
          Align = alTop
          BevelKind = bkFlat
          BevelOuter = bvNone
          Caption = 'Panel5'
          Padding.Left = 10
          Padding.Top = 11
          Padding.Right = 10
          Padding.Bottom = 11
          TabOrder = 1
          inline Frame_ExtComboBox_Type2: TFrame_ENV_ComboBox
            Left = 10
            Top = 11
            Width = 269
            Height = 52
            Align = alClient
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
            TabOrder = 0
            ExplicitLeft = 10
            ExplicitTop = 11
            ExplicitWidth = 269
            ExplicitHeight = 52
            inherited Label_Key: TLabel
              Width = 203
              Height = 48
              Caption = #51109#52824'/'#44592#51333#51012' '#49440#53469#54644#51452#49464#50836'.'
              Font.Height = -19
              ParentFont = False
              ExplicitWidth = 203
              ExplicitHeight = 48
            end
            inherited Label1: TLabel
              Left = 217
              Height = 48
              ExplicitLeft = 217
              ExplicitHeight = 48
            end
            inherited Label_Hide: TLabel
              Height = 48
            end
          end
        end
        object Panel7: TPanel
          Left = 0
          Top = 0
          Width = 293
          Height = 78
          Align = alTop
          BevelKind = bkFlat
          BevelOuter = bvNone
          Caption = 'Panel5'
          Padding.Left = 10
          Padding.Top = 11
          Padding.Right = 10
          Padding.Bottom = 11
          TabOrder = 2
          inline Frame_ExtComboBox_Type1: TFrame_ENV_ComboBox
            Left = 10
            Top = 11
            Width = 269
            Height = 52
            Align = alClient
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
            TabOrder = 0
            ExplicitLeft = 10
            ExplicitTop = 11
            ExplicitWidth = 269
            ExplicitHeight = 52
            inherited Label_Key: TLabel
              Width = 203
              Height = 48
              Caption = #51109#52824'/'#44592#51333#51012' '#49440#53469#54644#51452#49464#50836'.'
              Font.Height = -19
              ParentFont = False
              ExplicitWidth = 203
              ExplicitHeight = 48
            end
            inherited Label1: TLabel
              Left = 217
              Height = 48
              ExplicitLeft = 217
              ExplicitHeight = 48
            end
            inherited Label_Hide: TLabel
              Height = 48
            end
          end
        end
      end
    end
    object GroupBox_Device: TGroupBox
      Left = 15
      Top = 90
      Width = 806
      Height = 388
      Align = alTop
      Caption = #9679' '#50808#48512#51109#52824' '#50672#44208' '#49444#51221' [ '#44592#48376' ]'
      Padding.Left = 10
      Padding.Top = 10
      Padding.Right = 10
      Padding.Bottom = 10
      TabOrder = 1
      object Panel1: TPanel
        Left = 12
        Top = 36
        Width = 490
        Height = 340
        Align = alLeft
        BevelOuter = bvNone
        Padding.Left = 5
        ShowCaption = False
        TabOrder = 0
        inline Frame_ComboBox_Prn4: TFrame_ENV_DoubleComboBox_Title
          Left = 5
          Top = 255
          Width = 485
          Height = 85
          Align = alTop
          DoubleBuffered = True
          Color = clGray
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
          ExplicitLeft = 5
          ExplicitTop = 255
          ExplicitWidth = 485
          ExplicitHeight = 85
          inherited Panel_Parent: TPanel
            Width = 483
            Height = 83
            ExplicitWidth = 483
            ExplicitHeight = 83
            inherited Label_Title: TLabel
              Width = 100
              Height = 63
              Caption = 'COM4'
              ExplicitLeft = 12
              ExplicitTop = 5
              ExplicitWidth = 100
              ExplicitHeight = 63
            end
            inherited Label_hide: TLabel
              Left = 110
              Height = 63
              ExplicitLeft = 110
            end
            inherited Label1: TLabel
              Left = 302
              Height = 63
              ExplicitLeft = 302
            end
            inherited Label2: TLabel
              Left = 296
              Height = 63
              ExplicitLeft = 296
            end
            inherited COMBO_1: TFrame_ENV_ComboBox
              Left = 116
              Width = 180
              Height = 63
              ExplicitLeft = 116
              ExplicitWidth = 180
              ExplicitHeight = 63
              inherited Label_Key: TLabel
                Width = 124
                Height = 59
                Font.Height = -19
                ParentFont = False
                ExplicitWidth = 124
                ExplicitHeight = 59
              end
              inherited Label1: TLabel
                Left = 138
                Width = 40
                Height = 59
                ExplicitLeft = 118
                ExplicitWidth = 40
                ExplicitHeight = 59
              end
              inherited Label_Hide: TLabel
                Height = 59
              end
            end
            inherited COMBO_2: TFrame_ENV_ComboBox
              Left = 308
              Width = 165
              Height = 63
              ExplicitLeft = 308
              ExplicitWidth = 165
              ExplicitHeight = 63
              inherited Label_Key: TLabel
                Width = 109
                Height = 59
                Caption = #51452#48169#53945#48324' '#51204#49569#50976#47924#47484' '#49440#53469#54644#51452#49464#50836'.'
                Font.Height = -19
                ParentFont = False
                ExplicitWidth = 109
                ExplicitHeight = 59
              end
              inherited Label1: TLabel
                Left = 123
                Width = 40
                Height = 59
                ExplicitLeft = 123
                ExplicitWidth = 40
                ExplicitHeight = 59
              end
              inherited Label_Hide: TLabel
                Height = 59
              end
            end
          end
        end
        inline Frame_ComboBox_Prn3: TFrame_ENV_DoubleComboBox_Title
          Left = 5
          Top = 170
          Width = 485
          Height = 85
          Align = alTop
          DoubleBuffered = True
          Color = clGray
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
          ExplicitLeft = 5
          ExplicitTop = 170
          ExplicitWidth = 485
          ExplicitHeight = 85
          inherited Panel_Parent: TPanel
            Width = 483
            Height = 83
            ExplicitWidth = 483
            ExplicitHeight = 83
            inherited Label_Title: TLabel
              Width = 100
              Height = 63
              Caption = 'COM3'
              ExplicitWidth = 100
              ExplicitHeight = 63
            end
            inherited Label_hide: TLabel
              Left = 110
              Height = 63
              ExplicitLeft = 110
            end
            inherited Label1: TLabel
              Left = 302
              Height = 63
              ExplicitLeft = 302
            end
            inherited Label2: TLabel
              Left = 296
              Height = 63
              ExplicitLeft = 296
            end
            inherited COMBO_1: TFrame_ENV_ComboBox
              Left = 116
              Width = 180
              Height = 63
              ExplicitLeft = 116
              ExplicitWidth = 180
              ExplicitHeight = 63
              inherited Label_Key: TLabel
                Width = 124
                Height = 59
                Font.Height = -19
                ParentFont = False
                ExplicitWidth = 139
                ExplicitHeight = 59
              end
              inherited Label1: TLabel
                Left = 138
                Width = 40
                Height = 59
                ExplicitLeft = 118
                ExplicitWidth = 40
                ExplicitHeight = 59
              end
              inherited Label_Hide: TLabel
                Height = 59
              end
            end
            inherited COMBO_2: TFrame_ENV_ComboBox
              Left = 308
              Width = 165
              Height = 63
              ExplicitLeft = 308
              ExplicitWidth = 165
              ExplicitHeight = 63
              inherited Label_Key: TLabel
                Width = 109
                Height = 59
                Caption = #51452#48169#53945#48324' '#51204#49569#50976#47924#47484' '#49440#53469#54644#51452#49464#50836'.'
                Font.Height = -19
                ParentFont = False
                ExplicitWidth = 134
                ExplicitHeight = 59
              end
              inherited Label1: TLabel
                Left = 123
                Width = 40
                Height = 59
                ExplicitLeft = 123
                ExplicitWidth = 40
                ExplicitHeight = 59
              end
              inherited Label_Hide: TLabel
                Height = 59
              end
            end
          end
        end
        inline Frame_ComboBox_Prn2: TFrame_ENV_DoubleComboBox_Title
          Left = 5
          Top = 85
          Width = 485
          Height = 85
          Align = alTop
          DoubleBuffered = True
          Color = clGray
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
          ExplicitLeft = 5
          ExplicitTop = 85
          ExplicitWidth = 485
          ExplicitHeight = 85
          inherited Panel_Parent: TPanel
            Width = 483
            Height = 83
            ExplicitWidth = 483
            ExplicitHeight = 83
            inherited Label_Title: TLabel
              Width = 100
              Height = 63
              Caption = 'COM2'
              ExplicitWidth = 100
              ExplicitHeight = 63
            end
            inherited Label_hide: TLabel
              Left = 110
              Height = 63
              ExplicitLeft = 110
            end
            inherited Label1: TLabel
              Left = 302
              Height = 63
              ExplicitLeft = 302
            end
            inherited Label2: TLabel
              Left = 296
              Height = 63
              ExplicitLeft = 296
            end
            inherited COMBO_1: TFrame_ENV_ComboBox
              Left = 116
              Width = 180
              Height = 63
              ExplicitLeft = 116
              ExplicitWidth = 180
              ExplicitHeight = 63
              inherited Label_Key: TLabel
                Width = 124
                Height = 59
                Font.Height = -19
                ParentFont = False
                ExplicitWidth = 139
                ExplicitHeight = 59
              end
              inherited Label1: TLabel
                Left = 138
                Width = 40
                Height = 59
                ExplicitLeft = 118
                ExplicitWidth = 40
                ExplicitHeight = 59
              end
              inherited Label_Hide: TLabel
                Height = 59
              end
            end
            inherited COMBO_2: TFrame_ENV_ComboBox
              Left = 308
              Width = 165
              Height = 63
              ExplicitLeft = 308
              ExplicitWidth = 165
              ExplicitHeight = 63
              inherited Label_Key: TLabel
                Width = 109
                Height = 59
                Caption = #51452#48169#53945#48324' '#51204#49569#50976#47924#47484' '#49440#53469#54644#51452#49464#50836'.'
                Font.Height = -19
                ParentFont = False
                ExplicitWidth = 134
                ExplicitHeight = 59
              end
              inherited Label1: TLabel
                Left = 123
                Width = 40
                Height = 59
                ExplicitLeft = 123
                ExplicitWidth = 40
                ExplicitHeight = 59
              end
              inherited Label_Hide: TLabel
                Height = 59
              end
            end
          end
        end
        inline Frame_ComboBox_Prn1: TFrame_ENV_DoubleComboBox_Title
          Left = 5
          Top = 0
          Width = 485
          Height = 85
          Align = alTop
          DoubleBuffered = True
          Color = clGray
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
          ExplicitLeft = 5
          ExplicitWidth = 485
          ExplicitHeight = 85
          inherited Panel_Parent: TPanel
            Width = 483
            Height = 83
            ExplicitWidth = 483
            ExplicitHeight = 83
            inherited Label_Title: TLabel
              Width = 100
              Height = 63
              Caption = 'COM1'
              ExplicitWidth = 100
              ExplicitHeight = 63
            end
            inherited Label_hide: TLabel
              Left = 110
              Height = 63
              ExplicitLeft = 110
            end
            inherited Label1: TLabel
              Left = 302
              Height = 63
              ExplicitLeft = 302
            end
            inherited Label2: TLabel
              Left = 296
              Height = 63
              ExplicitLeft = 296
            end
            inherited COMBO_1: TFrame_ENV_ComboBox
              Left = 116
              Width = 180
              Height = 63
              ExplicitLeft = 116
              ExplicitWidth = 180
              ExplicitHeight = 63
              inherited Label_Key: TLabel
                Width = 124
                Height = 59
                Font.Height = -19
                ParentFont = False
                ExplicitWidth = 139
                ExplicitHeight = 59
              end
              inherited Label1: TLabel
                Left = 138
                Width = 40
                Height = 59
                ExplicitLeft = 118
                ExplicitWidth = 40
                ExplicitHeight = 59
              end
              inherited Label_Hide: TLabel
                Height = 59
              end
            end
            inherited COMBO_2: TFrame_ENV_ComboBox
              Left = 308
              Width = 165
              Height = 63
              ExplicitLeft = 308
              ExplicitWidth = 165
              ExplicitHeight = 63
              inherited Label_Key: TLabel
                Width = 109
                Height = 59
                Font.Height = -19
                ParentFont = False
                ExplicitWidth = 134
                ExplicitHeight = 59
              end
              inherited Label1: TLabel
                Left = 123
                Width = 40
                Height = 59
                ExplicitLeft = 123
                ExplicitWidth = 40
                ExplicitHeight = 59
              end
              inherited Label_Hide: TLabel
                Height = 59
              end
            end
          end
        end
      end
      object Panel2: TPanel
        Left = 502
        Top = 36
        Width = 292
        Height = 340
        Align = alClient
        BevelKind = bkFlat
        BevelOuter = bvNone
        Padding.Left = 5
        Padding.Top = 5
        Padding.Right = 5
        Padding.Bottom = 5
        ShowCaption = False
        TabOrder = 1
        object GroupBox4: TGroupBox
          Left = 5
          Top = 5
          Width = 278
          Height = 105
          Align = alTop
          Caption = #50689#49688#51613' '#49549#46020#44050'(or'#44592#51333')'
          Padding.Left = 10
          Padding.Top = 10
          Padding.Right = 10
          Padding.Bottom = 15
          TabOrder = 0
          inline Frame_ComboBox_RecPrnType: TFrame_ENV_ComboBox
            Left = 12
            Top = 36
            Width = 254
            Height = 52
            Hint = #50689#49688#51613
            Align = alClient
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
            TabOrder = 0
            OnClick = Frame_ComboBox_PrnTypeClick
            ExplicitLeft = 12
            ExplicitTop = 36
            ExplicitWidth = 254
            ExplicitHeight = 52
            inherited Label_Key: TLabel
              Width = 188
              Height = 48
              ExplicitWidth = 228
              ExplicitHeight = 48
            end
            inherited Label1: TLabel
              Left = 202
              Height = 48
              ExplicitLeft = 242
              ExplicitHeight = 48
            end
            inherited Label_Hide: TLabel
              Height = 48
            end
          end
        end
        object GroupBox5: TGroupBox
          Left = 5
          Top = 110
          Width = 278
          Height = 105
          Align = alTop
          Caption = #51452#48169#54532#47536#53552' '#49549#46020#44050'(or'#44592#51333')'
          Padding.Left = 10
          Padding.Top = 10
          Padding.Right = 10
          Padding.Bottom = 15
          TabOrder = 1
          inline Frame_ComboBox_KitPrnType: TFrame_ENV_ComboBox
            Tag = 1
            Left = 12
            Top = 36
            Width = 254
            Height = 52
            Hint = #51452#48169#54532#47536#53552
            Align = alClient
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
            TabOrder = 0
            OnClick = Frame_ComboBox_PrnTypeClick
            ExplicitLeft = 12
            ExplicitTop = 36
            ExplicitWidth = 254
            ExplicitHeight = 52
            inherited Label_Key: TLabel
              Width = 188
              Height = 48
              ExplicitWidth = 228
              ExplicitHeight = 48
            end
            inherited Label1: TLabel
              Left = 202
              Height = 48
              ExplicitLeft = 242
              ExplicitHeight = 48
            end
            inherited Label_Hide: TLabel
              Height = 48
            end
          end
        end
        inline Frame_CheckBox_KitDriverPrint: TFrame_ENV_CheckBox
          Left = 5
          Top = 269
          Width = 278
          Height = 62
          Align = alBottom
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
          ExplicitLeft = 5
          ExplicitTop = 269
          ExplicitWidth = 278
          ExplicitHeight = 62
          inherited Image_Check: TImage
            Height = 52
            ExplicitHeight = 52
          end
          inherited Label_MSG: TLabel
            Width = 195
            Height = 52
            Caption = #51452#48169#46300#46972#51060#48260' '#44277#50976#48169#49885' '#49324#50857
            Font.Height = -17
            ParentFont = False
            ExplicitLeft = 60
            ExplicitWidth = 201
            ExplicitHeight = 19
          end
          inherited Label2: TLabel
            Height = 52
          end
        end
        object Button1: TButton
          Left = 5
          Top = 219
          Width = 278
          Height = 50
          Align = alBottom
          Caption = #54252#53944' '#53580#49828#53944'('#54532#47536#53552')'
          TabOrder = 3
          OnClick = Button1Click
        end
      end
    end
  end
end
