object Form_ENV3_2: TForm_ENV3_2
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Form_ENV3_2'
  ClientHeight = 1100
  ClientWidth = 847
  Color = clWhite
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -27
  Font.Name = #44256#46020' B'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 31
  object ScrollBox_Main: TScrollBox
    Left = 0
    Top = 0
    Width = 847
    Height = 1100
    HorzScrollBar.Tracking = True
    VertScrollBar.Tracking = True
    Align = alClient
    BevelOuter = bvNone
    Padding.Left = 15
    Padding.Top = 15
    Padding.Right = 15
    TabOrder = 0
    object Label_Title: TLabel
      Left = 15
      Top = 15
      Width = 813
      Height = 40
      Align = alTop
      AutoSize = False
      Caption = '3-2. '#52636#47141#49444#51221
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 10770443
      Font.Height = -27
      Font.Name = #44256#46020' B'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      ExplicitTop = 0
      ExplicitWidth = 821
    end
    object GroupBox1_Type: TGroupBox
      Left = 15
      Top = 55
      Width = 813
      Height = 170
      Align = alTop
      Caption = #9679' '#52636#47141#50976#54805' '#44288#47532
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 10770443
      Font.Height = -21
      Font.Name = #44256#46020' B'
      Font.Style = []
      Padding.Left = 5
      Padding.Top = 10
      Padding.Right = 10
      Padding.Bottom = 10
      ParentFont = False
      TabOrder = 0
      object Panel_Manage: TPanel
        Left = 7
        Top = 36
        Width = 450
        Height = 122
        Align = alLeft
        BevelOuter = bvNone
        Padding.Right = 10
        ShowCaption = False
        TabOrder = 0
        object Panel_PrnType: TPanel
          Left = 0
          Top = 0
          Width = 440
          Height = 55
          Align = alTop
          BevelOuter = bvNone
          ShowCaption = False
          TabOrder = 0
          object Shape_Hide1: TShape
            Left = 240
            Top = 0
            Width = 10
            Height = 55
            Align = alRight
            Pen.Style = psClear
            ExplicitLeft = 230
          end
          inline Frame_ComboBox_PrnType: TFrame_ENV_ComboBox
            Left = 0
            Top = 0
            Width = 240
            Height = 55
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
            ExplicitWidth = 240
            ExplicitHeight = 55
            inherited Label_Key: TLabel
              Width = 174
              Height = 51
              Caption = #50689#49688#51613
              ExplicitLeft = 36
              ExplicitTop = 27
              ExplicitWidth = 222
              ExplicitHeight = 38
            end
            inherited Label1: TLabel
              Left = 188
              Height = 51
              ExplicitLeft = 185
              ExplicitTop = 5
              ExplicitHeight = 51
            end
            inherited Label_Hide: TLabel
              Height = 51
            end
          end
          inline Frame_Edit_prnCnt: TFrame_ENV_Edit
            Left = 250
            Top = 0
            Width = 190
            Height = 55
            Align = alRight
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
            ExplicitLeft = 250
            ExplicitWidth = 190
            ExplicitHeight = 55
            inherited Label_Key: TLabel
              Width = 100
              Height = 53
              Caption = #52636#47141#49688#47049
              ExplicitWidth = 100
              ExplicitHeight = 53
            end
            inherited Panel_Body: TPanel
              Left = 101
              Width = 88
              Height = 53
              ExplicitLeft = 181
              ExplicitTop = 1
              ExplicitWidth = 8
              ExplicitHeight = 53
              inherited Edit_Value: TEdit
                Width = 55
                Height = 43
                ExplicitHeight = 43
              end
            end
          end
        end
        inline Frame_Edit_title: TFrame_ENV_Edit
          Left = 0
          Top = 67
          Width = 440
          Height = 55
          Align = alBottom
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
          ExplicitTop = 67
          ExplicitWidth = 440
          ExplicitHeight = 55
          inherited Label_Key: TLabel
            Height = 53
            Caption = #52636#47141' '#53440#51060#53952
            ExplicitHeight = 53
          end
          inherited Panel_Body: TPanel
            Width = 258
            Height = 53
            ExplicitLeft = 181
            ExplicitTop = 1
            ExplicitWidth = 258
            ExplicitHeight = 53
            inherited Edit_Value: TEdit
              Width = 225
              Height = 43
              ExplicitWidth = 225
              ExplicitHeight = 43
            end
          end
        end
      end
      object Panel_Margin: TPanel
        Left = 457
        Top = 36
        Width = 219
        Height = 122
        Align = alClient
        BevelOuter = bvNone
        Padding.Right = 10
        ShowCaption = False
        TabOrder = 1
        inline Frame_Edit_Bot: TFrame_ENV_Edit
          Left = 0
          Top = 67
          Width = 209
          Height = 55
          Align = alBottom
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
          ExplicitTop = 67
          ExplicitWidth = 209
          ExplicitHeight = 55
          inherited Label_Key: TLabel
            Width = 100
            Height = 53
            Caption = #54616#45800' '#50668#48177
            ExplicitWidth = 100
            ExplicitHeight = 53
          end
          inherited Panel_Body: TPanel
            Left = 101
            Width = 107
            Height = 53
            ExplicitLeft = 181
            ExplicitTop = 1
            ExplicitWidth = 27
            ExplicitHeight = 53
            inherited Edit_Value: TEdit
              Width = 74
              Height = 43
              ExplicitHeight = 43
            end
          end
        end
        inline Frame_Edit_Top: TFrame_ENV_Edit
          Left = 0
          Top = 0
          Width = 209
          Height = 55
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
          ExplicitWidth = 209
          ExplicitHeight = 55
          inherited Label_Key: TLabel
            Width = 100
            Height = 53
            Caption = #49345#45800' '#50668#48177
            ExplicitWidth = 100
            ExplicitHeight = 53
          end
          inherited Panel_Body: TPanel
            Left = 101
            Width = 107
            Height = 53
            ExplicitLeft = 181
            ExplicitTop = 1
            ExplicitWidth = 27
            ExplicitHeight = 53
            inherited Edit_Value: TEdit
              Width = 74
              Height = 43
              ExplicitHeight = 43
            end
          end
        end
      end
      object Button_Preview1: TButton
        Left = 676
        Top = 36
        Width = 125
        Height = 122
        Align = alRight
        Caption = #48120#47532#48372#44592
        TabOrder = 2
        Visible = False
        OnClick = Button_Preview1Click
      end
    end
    object GroupBox2_Option: TGroupBox
      Left = 15
      Top = 225
      Width = 813
      Height = 580
      Align = alTop
      Caption = #51064#49604#44288#47532
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 10770443
      Font.Height = -21
      Font.Name = #44256#46020' B'
      Font.Style = []
      Padding.Left = 5
      Padding.Top = 5
      Padding.Right = 10
      Padding.Bottom = 10
      ParentFont = False
      TabOrder = 1
      object ScrollBox_PrnOption: TScrollBox
        Left = 7
        Top = 31
        Width = 380
        Height = 537
        VertScrollBar.Tracking = True
        Align = alLeft
        BorderStyle = bsNone
        Color = 15592941
        Padding.Left = 2
        Padding.Top = 2
        Padding.Right = 2
        Padding.Bottom = 2
        ParentColor = False
        TabOrder = 0
        object Panel_Header: TPanel
          Left = 2
          Top = 2
          Width = 376
          Height = 50
          Align = alTop
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 0
          object Button_Preview2: TButton
            Left = 251
            Top = 0
            Width = 125
            Height = 50
            Align = alRight
            Caption = #51064#49604' '#48120#47532#48372#44592
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 10770443
            Font.Height = -16
            Font.Name = #44256#46020' B'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnClick = Button_Preview1Click
          end
          inline Frame_ComboBox_PrnOption: TFrame_ENV_ComboBox
            Left = 0
            Top = 0
            Width = 251
            Height = 50
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
            TabOrder = 1
            OnClick = Frame_ComboBox_PrnOptionClick
            ExplicitWidth = 251
            inherited Label_Key: TLabel
              Width = 185
              Caption = #51064#49604#50976#47924' '#47532#49828#53944
              ExplicitWidth = 248
              ExplicitHeight = 33
            end
            inherited Label1: TLabel
              Left = 199
              ExplicitLeft = 211
            end
            inherited Label_Hide: TLabel
              Height = 46
            end
          end
        end
      end
      object Panel_Right: TPanel
        Left = 387
        Top = 31
        Width = 414
        Height = 537
        Align = alClient
        BevelOuter = bvNone
        Padding.Left = 10
        ShowCaption = False
        TabOrder = 1
        object Label_guideText: TLabel
          Left = 10
          Top = 110
          Width = 404
          Height = 40
          Align = alTop
          AutoSize = False
          Caption = '- '#54616#45800' '#52636#47141#47928#44396' [ '#52572#45824' 10'#51460' ]'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 10770443
          Font.Height = -19
          Font.Name = #44256#46020' B'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
        end
        object Label_GuideText2: TLabel
          Left = 10
          Top = 0
          Width = 404
          Height = 50
          Align = alTop
          AutoSize = False
          Caption = '- '#50689#49688#51613' '#48156#54665#50976#47924#54805#53468' '#48143' '#51452#48169#54869#45824#54256#53944' '#49324#51060#51592
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 10770443
          Font.Height = -19
          Font.Name = #44256#46020' B'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
          ExplicitWidth = 427
        end
        object Shape1: TShape
          Left = 10
          Top = 100
          Width = 404
          Height = 10
          Align = alTop
          Pen.Style = psClear
        end
        object Memo_Bigo: TMemo
          Left = 10
          Top = 150
          Width = 404
          Height = 387
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -20
          Font.Name = #44256#46020' B'
          Font.Style = []
          ParentFont = False
          ScrollBars = ssBoth
          TabOrder = 0
        end
        inline Frame_ComboBox_Option: TFrame_ENV_ComboBox
          Left = 10
          Top = 50
          Width = 404
          Height = 50
          Align = alTop
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
          OnClick = Frame_ComboBox_PrnOption2Click
          ExplicitLeft = 10
          ExplicitTop = 50
          ExplicitWidth = 404
          inherited Label_Key: TLabel
            Width = 338
            Caption = #50864#47532' '#55192#45236#51088'. '#51064#49373' '#47952' '#51080#45264','
            ExplicitWidth = 344
          end
          inherited Label1: TLabel
            Left = 352
            ExplicitLeft = 358
          end
          inherited Label_Hide: TLabel
            Height = 46
          end
        end
      end
    end
    object GroupBox1: TGroupBox
      Left = 15
      Top = 846
      Width = 813
      Height = 250
      Align = alBottom
      Caption = #49888#50857' '#51064#49604#49444#51221' ('#8251' '#54392#46300#52852#54168' '#51204#50857')'
      Padding.Left = 5
      Padding.Top = 5
      Padding.Right = 5
      Padding.Bottom = 5
      TabOrder = 2
      Visible = False
      inline Frame_CheckBox_BCPaper: TFrame_ENV_CheckBox
        Left = 7
        Top = 98
        Width = 799
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
        ExplicitLeft = 7
        ExplicitTop = 98
        ExplicitWidth = 799
        inherited Label_MSG: TLabel
          Width = 716
          Height = 50
          Caption = #44256#44061#50857' ('#52852#46300#44208#51228#49884' '#49888#50857#51204#54364' '#48156#54665#50976#47924#47484' '#49440#53469#54633#45768#45796'.)'
          ExplicitWidth = 469
        end
        inherited Label2: TLabel
          Height = 50
        end
      end
      inline Frame_CheckBox_recCardSlip: TFrame_ENV_CheckBox
        Left = 7
        Top = 38
        Width = 799
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
        ExplicitLeft = 7
        ExplicitTop = 38
        ExplicitWidth = 799
        inherited Label_MSG: TLabel
          Width = 716
          Height = 50
          Caption = #44256#44061#50857' '#51452#47928#45236#50669' '#51064#49604' ('#49888#50857#51204#54364#50752' '#50689#49688#51613#51012' '#54633#52432#49436' '#52636#47141#54633#45768#45796'.)'
          ExplicitWidth = 560
        end
        inherited Label2: TLabel
          Height = 50
        end
      end
    end
  end
end
