object Form_ENV1_4: TForm_ENV1_4
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Form_ENV1_4'
  ClientHeight = 750
  ClientWidth = 840
  Color = clBtnFace
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
    Width = 840
    Height = 750
    HorzScrollBar.Tracking = True
    VertScrollBar.Tracking = True
    Align = alClient
    Color = clWhite
    Padding.Left = 15
    Padding.Right = 25
    Padding.Bottom = 10
    ParentColor = False
    TabOrder = 0
    object Label_Title: TLabel
      Left = 15
      Top = 0
      Width = 796
      Height = 40
      Align = alTop
      AutoSize = False
      Caption = '1-3. '#44288#47532#51088' '#49444#51221
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 10770443
      Font.Height = -27
      Font.Name = #44256#46020' B'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
      ExplicitLeft = 0
      ExplicitWidth = 840
    end
    object Label_FoodcafeChk: TLabel
      Left = 15
      Top = 40
      Width = 796
      Height = 50
      Align = alTop
      AutoSize = False
      Caption = #8251' '#49444#51221#51012' '#50756#47308#54620' '#54980' '#54392#46300#52852#54168' '#48143' '#44288#47144' '#54532#47196#44536#47016#51060' '#44053#51228#47196' '#51116#49892#54665#46121#45768#45796'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -21
      Font.Name = #44256#46020' B'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      Visible = False
      ExplicitLeft = 183
      ExplicitTop = 475
      ExplicitWidth = 811
    end
    object GroupBox1: TGroupBox
      Left = 15
      Top = 380
      Width = 796
      Height = 350
      Align = alTop
      Caption = '-2. '#54252#49828' '#51221#48372' '#44288#47532
      Padding.Left = 10
      Padding.Top = 10
      Padding.Right = 5
      Padding.Bottom = 5
      ParentBackground = False
      TabOrder = 0
      object Panel1: TPanel
        Left = 12
        Top = 36
        Width = 460
        Height = 307
        Align = alLeft
        BevelOuter = bvNone
        Padding.Right = 10
        Padding.Bottom = 10
        ShowCaption = False
        TabOrder = 0
        object Label1: TLabel
          Left = 0
          Top = 0
          Width = 450
          Height = 50
          Align = alTop
          AutoSize = False
          Caption = #9679' '#54252#49828' '#44288#47532
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = #44256#46020' B'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
          ExplicitLeft = 8
          ExplicitTop = 8
          ExplicitWidth = 330
        end
        inline Frame_Edit_DBPath: TFrame_ENV_Edit
          Left = 0
          Top = 110
          Width = 450
          Height = 50
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
          ExplicitTop = 110
          ExplicitWidth = 450
          ExplicitHeight = 50
          inherited Label_Key: TLabel
            Width = 120
            Height = 48
            Caption = 'DB '#54028#51068#44221#47196
            ExplicitWidth = 120
            ExplicitHeight = 48
          end
          inherited Panel_Body: TPanel
            Left = 121
            Width = 328
            Height = 48
            Padding.Left = 5
            ExplicitLeft = 121
            ExplicitTop = 1
            ExplicitWidth = 328
            ExplicitHeight = 48
            inherited Edit_Value: TEdit
              Left = 5
              Width = 305
              Height = 38
              Font.Height = -17
              ExplicitWidth = 295
              ExplicitHeight = 38
            end
          end
        end
        object Panel3: TPanel
          Left = 0
          Top = 50
          Width = 450
          Height = 60
          Align = alTop
          BevelOuter = bvNone
          Padding.Bottom = 10
          ShowCaption = False
          TabOrder = 0
          inline Frame_Edit_HostIP: TFrame_ENV_Edit
            Left = 0
            Top = 0
            Width = 285
            Height = 50
            Align = alLeft
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
            ExplicitWidth = 285
            ExplicitHeight = 50
            inherited Label_Key: TLabel
              Width = 120
              Height = 48
              Caption = 'DB IP  '#51452#49548
              ExplicitWidth = 120
              ExplicitHeight = 48
            end
            inherited Panel_Body: TPanel
              Left = 121
              Width = 163
              Height = 48
              ExplicitLeft = 121
              ExplicitTop = 1
              ExplicitWidth = 175
              ExplicitHeight = 48
              inherited Edit_Value: TEdit
                Width = 130
                Height = 38
                ExplicitWidth = 142
                ExplicitHeight = 38
              end
            end
          end
          inline Frame_Edit_PosNo: TFrame_ENV_Edit
            Left = 285
            Top = 0
            Width = 165
            Height = 50
            Align = alClient
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
            ExplicitLeft = 297
            ExplicitWidth = 153
            ExplicitHeight = 50
            inherited Label_Key: TLabel
              Width = 100
              Height = 48
              Caption = #54252#49828#48264#54840
              ExplicitWidth = 100
              ExplicitHeight = 48
            end
            inherited Panel_Body: TPanel
              Left = 101
              Width = 63
              Height = 48
              ExplicitLeft = 101
              ExplicitTop = 1
              ExplicitWidth = 51
              ExplicitHeight = 48
              inherited Edit_Value: TEdit
                Width = 30
                Height = 38
                TextHint = ''
                ExplicitWidth = 18
                ExplicitHeight = 38
              end
            end
          end
        end
        object Button1: TButton
          Left = 0
          Top = 247
          Width = 450
          Height = 50
          Align = alBottom
          Caption = 'DB '#44221#47196', '#51452#49548' '#44592#48376#44050
          TabOrder = 2
          OnClick = Button1Click
          ExplicitTop = 257
        end
        object Button2: TButton
          Left = 0
          Top = 197
          Width = 450
          Height = 50
          Align = alBottom
          Caption = 'DB '#44221#47196' '#52286#50500#48372#44592
          ImageMargins.Left = -3
          ImageMargins.Top = -3
          ImageMargins.Right = -3
          ImageMargins.Bottom = -3
          TabOrder = 3
          OnClick = Button2Click
          ExplicitTop = 257
        end
      end
      object Panel2: TPanel
        Left = 472
        Top = 36
        Width = 317
        Height = 307
        Align = alClient
        BevelOuter = bvNone
        Padding.Bottom = 10
        ShowCaption = False
        TabOrder = 1
        object Label_Guide2: TLabel
          Left = 0
          Top = 0
          Width = 317
          Height = 50
          Align = alTop
          AutoSize = False
          Caption = #9679' '#51064#49604#44536#47353' '#48324#46020#51648#51221'('#52572#45824' 20'#44060')'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = #44256#46020' B'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
          ExplicitLeft = 8
          ExplicitTop = 8
          ExplicitWidth = 422
        end
        object Memo1: TMemo
          Left = 0
          Top = 50
          Width = 317
          Height = 247
          Hint = #51064#49604#44536#47353
          Align = alClient
          ScrollBars = ssVertical
          TabOrder = 0
          OnExit = Memo1Exit
          OnKeyPress = Memo1KeyPress
        end
      end
    end
    object GroupBox2: TGroupBox
      Left = 15
      Top = 90
      Width = 796
      Height = 290
      Align = alTop
      Caption = '-1. ASP '#44288#47532
      Padding.Left = 10
      Padding.Top = 10
      Padding.Right = 10
      Padding.Bottom = 10
      ParentBackground = False
      TabOrder = 1
      inline Frame_CheckBox_useNotStock: TFrame_ENV_CheckBox
        Left = 12
        Top = 96
        Width = 772
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
        ExplicitLeft = 12
        ExplicitTop = 96
        ExplicitWidth = 772
        inherited Label_MSG: TLabel
          Width = 689
          Height = 50
          Caption = #49345#54408#51221#48372#47484' '#49688#51221#54616#51648' '#47803#54616#44172' '#54633#45768#45796'.'
          ExplicitWidth = 313
        end
        inherited Label2: TLabel
          Height = 50
        end
      end
      inline Frame_CheckBox_CloseUpUpdate: TFrame_ENV_CheckBox
        Left = 12
        Top = 156
        Width = 772
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
        ExplicitLeft = 12
        ExplicitTop = 156
        ExplicitWidth = 772
        inherited Label_MSG: TLabel
          Width = 689
          Height = 50
          Caption = #47560#44048#46108' '#51088#47308#47484' '#49688#51221#54616#51648' '#47803#54616#44172' '#54633#45768#45796'.'
          ExplicitWidth = 339
        end
        inherited Label2: TLabel
          Height = 50
        end
      end
      object Panel_ASP: TPanel
        Left = 12
        Top = 36
        Width = 772
        Height = 60
        Align = alTop
        BevelOuter = bvNone
        Padding.Bottom = 10
        ShowCaption = False
        TabOrder = 2
        inline Frame_Edit_GMZNO: TFrame_ENV_Edit
          Left = 0
          Top = 0
          Width = 483
          Height = 50
          Align = alLeft
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
          ExplicitWidth = 483
          ExplicitHeight = 50
          inherited Label_Key: TLabel
            Height = 48
            Caption = 'ASP '#48264#54840
            ExplicitHeight = 48
          end
          inherited Panel_Body: TPanel
            Width = 301
            Height = 48
            ExplicitLeft = 181
            ExplicitTop = 1
            ExplicitWidth = 301
            ExplicitHeight = 48
            inherited Edit_Value: TEdit
              Width = 268
              Height = 38
              ExplicitWidth = 268
              ExplicitHeight = 38
            end
          end
        end
        inline Frame_ComboBox_ASPAutoDown: TFrame_ENV_ComboBox
          Left = 452
          Top = 0
          Width = 320
          Height = 50
          Align = alRight
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
          OnClick = Frame_ComboBox_ASPAutoDownClick
          ExplicitLeft = 452
          inherited Label_Key: TLabel
            Caption = #47588#45684#54032' '#45796#50868#47196#46300' '#50976#47924
            ExplicitHeight = 44
          end
          inherited Label1: TLabel
            ExplicitHeight = 44
          end
          inherited Label_Hide: TLabel
            Height = 46
          end
        end
      end
      inline Frame_CheckBox_NotSaleSend: TFrame_ENV_CheckBox
        Left = 12
        Top = 216
        Width = 772
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
        OnClick = Frame_CheckBox_NotSaleSendClick
        ExplicitLeft = 12
        ExplicitTop = 216
        ExplicitWidth = 772
        inherited Label_MSG: TLabel
          Width = 689
          Height = 50
          Caption = #47588#51109' '#47588#52636#51012' ASP'#47196' '#51204#49569#54616#51648' '#50506#49845#45768#45796'.'
          ExplicitWidth = 345
        end
        inherited Label2: TLabel
          Height = 50
        end
      end
    end
  end
end
