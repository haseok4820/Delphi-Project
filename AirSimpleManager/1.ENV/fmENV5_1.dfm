object Form_ENV5_1: TForm_ENV5_1
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Form_ENV5_1'
  ClientHeight = 550
  ClientWidth = 830
  Color = clWhite
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -21
  Font.Name = #44256#46020' B'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 24
  object ScrollBox_Main: TScrollBox
    Left = 0
    Top = 0
    Width = 830
    Height = 550
    HorzScrollBar.Tracking = True
    VertScrollBar.Tracking = True
    Align = alClient
    Color = clWhite
    Padding.Left = 15
    Padding.Top = 15
    Padding.Right = 10
    Padding.Bottom = 10
    ParentColor = False
    TabOrder = 0
    object Label_Title: TLabel
      Left = 15
      Top = 15
      Width = 801
      Height = 40
      Align = alTop
      AutoSize = False
      Caption = '5-1. '#49345#54408#51221#48372' '#44288#47532
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 10770443
      Font.Height = -27
      Font.Name = #44256#46020' B'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
      ExplicitLeft = 18
      ExplicitTop = 18
    end
    object Panel_FormBody: TPanel
      Left = 15
      Top = 55
      Width = 801
      Height = 481
      Align = alClient
      BevelOuter = bvNone
      Padding.Left = 10
      Padding.Top = 10
      Padding.Right = 10
      Padding.Bottom = 10
      ShowCaption = False
      TabOrder = 0
      object GroupBox1: TGroupBox
        Left = 10
        Top = 10
        Width = 167
        Height = 361
        Align = alLeft
        Caption = #49345#54408#44536#47353
        TabOrder = 0
        object Button8: TButton
          Left = 2
          Top = 309
          Width = 163
          Height = 50
          Align = alBottom
          Caption = '+'
          TabOrder = 0
        end
        object ScrollBox2: TScrollBox
          Left = 2
          Top = 26
          Width = 163
          Height = 283
          Align = alClient
          BorderStyle = bsNone
          Color = clWhite
          ParentColor = False
          TabOrder = 1
        end
      end
      object GroupBox2: TGroupBox
        Left = 177
        Top = 10
        Width = 614
        Height = 361
        Align = alClient
        Caption = #49345#54408' '#51221#48372
        TabOrder = 1
        object Panel_MenuInfo_Column: TPanel
          Left = 2
          Top = 26
          Width = 610
          Height = 41
          Align = alTop
          BevelOuter = bvNone
          ShowCaption = False
          TabOrder = 0
          object Label1: TLabel
            Left = 130
            Top = 0
            Width = 280
            Height = 41
            Align = alClient
            Alignment = taCenter
            AutoSize = False
            Caption = #49345#54408#47749
            Layout = tlCenter
            ExplicitLeft = 100
            ExplicitWidth = 306
          end
          object Label2: TLabel
            Left = 0
            Top = 0
            Width = 130
            Height = 41
            Align = alLeft
            AutoSize = False
            Caption = ' '#9633' '#49345#54408#53076#46300
            Layout = tlCenter
          end
          object Label3: TLabel
            Left = 410
            Top = 0
            Width = 100
            Height = 41
            Align = alRight
            Alignment = taCenter
            AutoSize = False
            Caption = #44552' '#50529
            Layout = tlCenter
            ExplicitLeft = 8
          end
          object Label4: TLabel
            Left = 510
            Top = 0
            Width = 100
            Height = 41
            Align = alRight
            Alignment = taCenter
            AutoSize = False
            Caption = #51452#48169#52636#47141
            Layout = tlCenter
            ExplicitLeft = 8
          end
        end
        object ScrollBox1: TScrollBox
          Left = 2
          Top = 67
          Width = 610
          Height = 292
          VertScrollBar.Smooth = True
          VertScrollBar.Tracking = True
          Align = alClient
          TabOrder = 1
          inline Frame_ENV_MenuInfo10: TFrame_ENV_MenuInfo
            Left = 0
            Top = 0
            Width = 589
            Height = 30
            Align = alTop
            Color = clBtnFace
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
            ParentFont = False
            TabOrder = 0
            ExplicitWidth = 589
            ExplicitHeight = 30
            inherited Image_MenuCheck: TImage
              Height = 26
              ExplicitHeight = 26
            end
            inherited Label1: TLabel
              Height = 26
              ExplicitHeight = 26
            end
            inherited Frame_MenuKit: TFrame_ENV_ComboBox
              Left = 487
              Height = 26
              ExplicitLeft = 487
              ExplicitTop = 2
              ExplicitHeight = 26
              inherited Label_Key: TLabel
                Left = 14
                Width = 64
                Height = 22
                ExplicitLeft = 14
                ExplicitWidth = 64
                ExplicitHeight = 22
              end
              inherited Label1: TLabel
                Height = 22
                ExplicitHeight = 22
              end
              inherited Label_Hide: TLabel
                Height = 22
              end
            end
            inherited Edit_MenuName: TEdit
              Width = 239
              Height = 26
              ExplicitLeft = 148
              ExplicitWidth = 239
            end
            inherited Edit_MenuAmount: TEdit
              Left = 387
              Height = 26
              ExplicitLeft = 387
              ExplicitTop = 2
              ExplicitHeight = 32
            end
          end
          inline Frame_ENV_MenuInfo01: TFrame_ENV_MenuInfo
            Left = 0
            Top = 270
            Width = 589
            Height = 30
            Align = alTop
            Color = clBtnFace
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
            ParentFont = False
            TabOrder = 1
            ExplicitTop = 270
            ExplicitWidth = 589
            ExplicitHeight = 30
            inherited Image_MenuCheck: TImage
              Height = 26
              ExplicitHeight = 26
            end
            inherited Label1: TLabel
              Height = 26
              ExplicitHeight = 26
            end
            inherited Frame_MenuKit: TFrame_ENV_ComboBox
              Left = 487
              Height = 26
              ExplicitLeft = 487
              ExplicitTop = 2
              ExplicitHeight = 26
              inherited Label_Key: TLabel
                Left = 14
                Width = 64
                Height = 22
                ExplicitLeft = 14
                ExplicitWidth = 64
                ExplicitHeight = 22
              end
              inherited Label1: TLabel
                Height = 22
                ExplicitHeight = 22
              end
              inherited Label_Hide: TLabel
                Height = 22
              end
            end
            inherited Edit_MenuName: TEdit
              Width = 239
              Height = 26
              ExplicitLeft = 148
              ExplicitWidth = 239
            end
            inherited Edit_MenuAmount: TEdit
              Left = 387
              Height = 26
              ExplicitLeft = 387
              ExplicitTop = 2
              ExplicitHeight = 32
            end
          end
          inline Frame_ENV_MenuInfo02: TFrame_ENV_MenuInfo
            Left = 0
            Top = 240
            Width = 589
            Height = 30
            Align = alTop
            Color = clBtnFace
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
            ParentFont = False
            TabOrder = 2
            ExplicitTop = 240
            ExplicitWidth = 589
            ExplicitHeight = 30
            inherited Image_MenuCheck: TImage
              Height = 26
              ExplicitHeight = 26
            end
            inherited Label1: TLabel
              Height = 26
              ExplicitHeight = 26
            end
            inherited Frame_MenuKit: TFrame_ENV_ComboBox
              Left = 487
              Height = 26
              ExplicitLeft = 487
              ExplicitTop = 2
              ExplicitHeight = 26
              inherited Label_Key: TLabel
                Left = 14
                Width = 64
                Height = 22
                ExplicitLeft = 14
                ExplicitWidth = 64
                ExplicitHeight = 22
              end
              inherited Label1: TLabel
                Height = 22
                ExplicitHeight = 22
              end
              inherited Label_Hide: TLabel
                Height = 22
              end
            end
            inherited Edit_MenuName: TEdit
              Width = 239
              Height = 26
              ExplicitLeft = 148
              ExplicitWidth = 239
            end
            inherited Edit_MenuAmount: TEdit
              Left = 387
              Height = 26
              ExplicitLeft = 387
              ExplicitTop = 2
              ExplicitHeight = 32
            end
          end
          inline Frame_ENV_MenuInfo03: TFrame_ENV_MenuInfo
            Left = 0
            Top = 210
            Width = 589
            Height = 30
            Align = alTop
            Color = clBtnFace
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
            ParentFont = False
            TabOrder = 3
            ExplicitTop = 210
            ExplicitWidth = 589
            ExplicitHeight = 30
            inherited Image_MenuCheck: TImage
              Height = 26
              ExplicitHeight = 26
            end
            inherited Label1: TLabel
              Height = 26
              ExplicitHeight = 26
            end
            inherited Frame_MenuKit: TFrame_ENV_ComboBox
              Left = 487
              Height = 26
              ExplicitLeft = 487
              ExplicitTop = 2
              ExplicitHeight = 26
              inherited Label_Key: TLabel
                Left = 14
                Width = 64
                Height = 22
                ExplicitLeft = 14
                ExplicitWidth = 64
                ExplicitHeight = 22
              end
              inherited Label1: TLabel
                Height = 22
                ExplicitHeight = 22
              end
              inherited Label_Hide: TLabel
                Height = 22
              end
            end
            inherited Edit_MenuName: TEdit
              Width = 239
              Height = 26
              ExplicitLeft = 148
              ExplicitWidth = 239
            end
            inherited Edit_MenuAmount: TEdit
              Left = 387
              Height = 26
              ExplicitLeft = 387
              ExplicitTop = 2
              ExplicitHeight = 32
            end
          end
          inline Frame_ENV_MenuInfo04: TFrame_ENV_MenuInfo
            Left = 0
            Top = 180
            Width = 589
            Height = 30
            Align = alTop
            Color = clBtnFace
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
            ParentFont = False
            TabOrder = 4
            ExplicitTop = 180
            ExplicitWidth = 589
            ExplicitHeight = 30
            inherited Image_MenuCheck: TImage
              Height = 26
              ExplicitHeight = 26
            end
            inherited Label1: TLabel
              Height = 26
              ExplicitHeight = 26
            end
            inherited Frame_MenuKit: TFrame_ENV_ComboBox
              Left = 487
              Height = 26
              ExplicitLeft = 487
              ExplicitTop = 2
              ExplicitHeight = 26
              inherited Label_Key: TLabel
                Left = 14
                Width = 64
                Height = 22
                ExplicitLeft = 14
                ExplicitWidth = 64
                ExplicitHeight = 22
              end
              inherited Label1: TLabel
                Height = 22
                ExplicitHeight = 22
              end
              inherited Label_Hide: TLabel
                Height = 22
              end
            end
            inherited Edit_MenuName: TEdit
              Width = 239
              Height = 26
              ExplicitLeft = 148
              ExplicitWidth = 239
            end
            inherited Edit_MenuAmount: TEdit
              Left = 387
              Height = 26
              ExplicitLeft = 387
              ExplicitTop = 2
              ExplicitHeight = 32
            end
          end
          inline Frame_ENV_MenuInfo05: TFrame_ENV_MenuInfo
            Left = 0
            Top = 150
            Width = 589
            Height = 30
            Align = alTop
            Color = clBtnFace
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
            ParentFont = False
            TabOrder = 5
            ExplicitTop = 150
            ExplicitWidth = 589
            ExplicitHeight = 30
            inherited Image_MenuCheck: TImage
              Height = 26
              ExplicitHeight = 26
            end
            inherited Label1: TLabel
              Height = 26
              ExplicitHeight = 26
            end
            inherited Frame_MenuKit: TFrame_ENV_ComboBox
              Left = 487
              Height = 26
              ExplicitLeft = 487
              ExplicitTop = 2
              ExplicitHeight = 26
              inherited Label_Key: TLabel
                Left = 14
                Width = 64
                Height = 22
                ExplicitLeft = 14
                ExplicitWidth = 64
                ExplicitHeight = 22
              end
              inherited Label1: TLabel
                Height = 22
                ExplicitHeight = 22
              end
              inherited Label_Hide: TLabel
                Height = 22
              end
            end
            inherited Edit_MenuName: TEdit
              Width = 239
              Height = 26
              ExplicitLeft = 148
              ExplicitWidth = 239
            end
            inherited Edit_MenuAmount: TEdit
              Left = 387
              Height = 26
              ExplicitLeft = 387
              ExplicitTop = 2
              ExplicitHeight = 32
            end
          end
          inline Frame_ENV_MenuInfo06: TFrame_ENV_MenuInfo
            Left = 0
            Top = 120
            Width = 589
            Height = 30
            Align = alTop
            Color = clBtnFace
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
            ParentFont = False
            TabOrder = 6
            ExplicitTop = 120
            ExplicitWidth = 589
            ExplicitHeight = 30
            inherited Image_MenuCheck: TImage
              Height = 26
              ExplicitHeight = 26
            end
            inherited Label1: TLabel
              Height = 26
              ExplicitHeight = 26
            end
            inherited Frame_MenuKit: TFrame_ENV_ComboBox
              Left = 487
              Height = 26
              ExplicitLeft = 487
              ExplicitTop = 2
              ExplicitHeight = 26
              inherited Label_Key: TLabel
                Left = 14
                Width = 64
                Height = 22
                ExplicitLeft = 14
                ExplicitWidth = 64
                ExplicitHeight = 22
              end
              inherited Label1: TLabel
                Height = 22
                ExplicitHeight = 22
              end
              inherited Label_Hide: TLabel
                Height = 22
              end
            end
            inherited Edit_MenuName: TEdit
              Width = 239
              Height = 26
              ExplicitLeft = 148
              ExplicitWidth = 239
            end
            inherited Edit_MenuAmount: TEdit
              Left = 387
              Height = 26
              ExplicitLeft = 387
              ExplicitTop = 2
              ExplicitHeight = 32
            end
          end
          inline Frame_ENV_MenuInfo07: TFrame_ENV_MenuInfo
            Left = 0
            Top = 90
            Width = 589
            Height = 30
            Align = alTop
            Color = clBtnFace
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
            ParentFont = False
            TabOrder = 7
            ExplicitTop = 90
            ExplicitWidth = 589
            ExplicitHeight = 30
            inherited Image_MenuCheck: TImage
              Height = 26
              ExplicitHeight = 26
            end
            inherited Label1: TLabel
              Height = 26
              ExplicitHeight = 26
            end
            inherited Frame_MenuKit: TFrame_ENV_ComboBox
              Left = 487
              Height = 26
              ExplicitLeft = 487
              ExplicitTop = 2
              ExplicitHeight = 26
              inherited Label_Key: TLabel
                Left = 14
                Width = 64
                Height = 22
                ExplicitLeft = 14
                ExplicitWidth = 64
                ExplicitHeight = 22
              end
              inherited Label1: TLabel
                Height = 22
                ExplicitHeight = 22
              end
              inherited Label_Hide: TLabel
                Height = 22
              end
            end
            inherited Edit_MenuName: TEdit
              Width = 239
              Height = 26
              ExplicitLeft = 148
              ExplicitWidth = 239
            end
            inherited Edit_MenuAmount: TEdit
              Left = 387
              Height = 26
              ExplicitLeft = 387
              ExplicitTop = 2
              ExplicitHeight = 32
            end
          end
          inline Frame_ENV_MenuInfo08: TFrame_ENV_MenuInfo
            Left = 0
            Top = 60
            Width = 589
            Height = 30
            Align = alTop
            Color = clBtnFace
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
            ParentFont = False
            TabOrder = 8
            ExplicitTop = 60
            ExplicitWidth = 589
            ExplicitHeight = 30
            inherited Image_MenuCheck: TImage
              Height = 26
              ExplicitHeight = 26
            end
            inherited Label1: TLabel
              Height = 26
              ExplicitHeight = 26
            end
            inherited Frame_MenuKit: TFrame_ENV_ComboBox
              Left = 487
              Height = 26
              ExplicitLeft = 487
              ExplicitTop = 2
              ExplicitHeight = 26
              inherited Label_Key: TLabel
                Left = 14
                Width = 64
                Height = 22
                ExplicitLeft = 14
                ExplicitWidth = 64
                ExplicitHeight = 22
              end
              inherited Label1: TLabel
                Height = 22
                ExplicitHeight = 22
              end
              inherited Label_Hide: TLabel
                Height = 22
              end
            end
            inherited Edit_MenuName: TEdit
              Width = 239
              Height = 26
              ExplicitLeft = 148
              ExplicitWidth = 239
            end
            inherited Edit_MenuAmount: TEdit
              Left = 387
              Height = 26
              ExplicitLeft = 387
              ExplicitTop = 2
              ExplicitHeight = 32
            end
          end
          inline Frame_ENV_MenuInfo09: TFrame_ENV_MenuInfo
            Left = 0
            Top = 30
            Width = 589
            Height = 30
            Align = alTop
            Color = clBtnFace
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
            ParentFont = False
            TabOrder = 9
            ExplicitTop = 30
            ExplicitWidth = 589
            ExplicitHeight = 30
            inherited Image_MenuCheck: TImage
              Height = 26
              ExplicitHeight = 26
            end
            inherited Label1: TLabel
              Height = 26
              ExplicitHeight = 26
            end
            inherited Frame_MenuKit: TFrame_ENV_ComboBox
              Left = 487
              Height = 26
              ExplicitLeft = 487
              ExplicitTop = 2
              ExplicitHeight = 26
              inherited Label_Key: TLabel
                Left = 14
                Width = 64
                Height = 22
                ExplicitLeft = 14
                ExplicitWidth = 64
                ExplicitHeight = 22
              end
              inherited Label1: TLabel
                Height = 22
                ExplicitHeight = 22
              end
              inherited Label_Hide: TLabel
                Height = 22
              end
            end
            inherited Edit_MenuName: TEdit
              Width = 239
              Height = 26
              ExplicitLeft = 148
              ExplicitWidth = 239
            end
            inherited Edit_MenuAmount: TEdit
              Left = 387
              Height = 26
              ExplicitLeft = 387
              ExplicitTop = 2
              ExplicitHeight = 32
            end
          end
        end
      end
      object Panel1: TPanel
        Left = 10
        Top = 371
        Width = 781
        Height = 100
        Align = alBottom
        BevelOuter = bvNone
        Padding.Top = 5
        ShowCaption = False
        TabOrder = 2
        object Button1: TButton
          Left = 678
          Top = 5
          Width = 103
          Height = 95
          Align = alRight
          Caption = #49325#51228
          TabOrder = 0
        end
        object Button2: TButton
          Left = 575
          Top = 5
          Width = 103
          Height = 95
          Align = alRight
          Caption = #49688#51221
          TabOrder = 1
        end
        object Button3: TButton
          Left = 472
          Top = 5
          Width = 103
          Height = 95
          Align = alRight
          Caption = #46321#47197
          TabOrder = 2
        end
        object Panel2: TPanel
          Left = 0
          Top = 5
          Width = 472
          Height = 95
          Align = alClient
          BevelOuter = bvNone
          Padding.Right = 10
          ShowCaption = False
          TabOrder = 3
          inline Frame_ENV_Edit1: TFrame_ENV_Edit
            Left = 0
            Top = 0
            Width = 462
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
            TabOrder = 0
            ExplicitWidth = 462
            ExplicitHeight = 50
            inherited Label_Key: TLabel
              Height = 48
            end
            inherited Panel_Body: TPanel
              Width = 280
              Height = 48
              ExplicitLeft = 181
              ExplicitTop = 1
              ExplicitWidth = 280
              ExplicitHeight = 48
              inherited Edit_Value: TEdit
                Width = 247
                Height = 38
                ExplicitWidth = 247
                ExplicitHeight = 38
              end
            end
          end
          object CheckBox1: TCheckBox
            Left = 0
            Top = 50
            Width = 193
            Height = 45
            Align = alLeft
            Caption = #48176#52824#46108' '#47700#45684#47564' '#54364#49884
            TabOrder = 1
          end
          object CheckBox2: TCheckBox
            Left = 193
            Top = 50
            Width = 193
            Height = 45
            Align = alLeft
            Caption = #53945#51221' '#47700#45684#47564' '#54364#49884
            TabOrder = 2
          end
        end
      end
    end
  end
end
