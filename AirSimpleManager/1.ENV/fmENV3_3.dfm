object Form_ENV3_3: TForm_ENV3_3
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Form_ENV3_3'
  ClientHeight = 550
  ClientWidth = 840
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
    Width = 840
    Height = 550
    HorzScrollBar.Tracking = True
    VertScrollBar.Tracking = True
    Align = alClient
    BevelOuter = bvNone
    Padding.Left = 15
    Padding.Right = 30
    Padding.Bottom = 10
    TabOrder = 0
    object Label_Guide1: TLabel
      Left = 15
      Top = 0
      Width = 791
      Height = 50
      Align = alTop
      AutoSize = False
      Caption = ' -3. '#44032#49345#54252#53944' '#44288#47532
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 10770443
      Font.Height = -27
      Font.Name = #44256#46020' B'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      ExplicitLeft = 12
      ExplicitTop = 4
      ExplicitWidth = 811
    end
    object Panel1: TPanel
      Left = 15
      Top = 150
      Width = 791
      Height = 80
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Padding.Left = 80
      Padding.Bottom = 30
      ShowCaption = False
      TabOrder = 0
      inline Frame_CheckBox_vDelvRec: TFrame_ENV_CheckBox
        Left = 80
        Top = 0
        Width = 711
        Height = 80
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
        Padding.Bottom = 30
        ParentBackground = False
        ParentColor = False
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 0
        ExplicitLeft = 80
        ExplicitWidth = 711
        ExplicitHeight = 80
        inherited Image_Check: TImage
          Left = 661
          Width = 45
          Height = 45
          Align = alRight
          ExplicitLeft = 691
          ExplicitWidth = 45
          ExplicitHeight = 45
        end
        inherited Label_MSG: TLabel
          Left = 10
          Width = 395
          Height = 45
          Align = alLeft
          Caption = #9679'  '#44032#49345#54252#53944' '#49688#49888#51221#48372' '#50689#49688#51613' '#54532#47536#53552#47196' '#51204#49569' '
          ExplicitLeft = 10
          ExplicitWidth = 395
        end
        inherited Label2: TLabel
          Left = 405
          Height = 45
          ExplicitLeft = 404
        end
      end
    end
    object Panel2: TPanel
      Left = 15
      Top = 50
      Width = 791
      Height = 100
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Padding.Left = 50
      Padding.Right = 5
      Padding.Bottom = 40
      ShowCaption = False
      TabOrder = 1
      object Label2: TLabel
        Left = 50
        Top = 0
        Width = 416
        Height = 60
        Align = alClient
        Caption = '- '#44032#49345#54252#53944' '#48264#54840' [ '#44032#49345#54252#53944#51473' '#45230#51008' '#48264#54840' '#49440#53469' ]'
        Layout = tlCenter
        ExplicitWidth = 408
        ExplicitHeight = 24
      end
      inline Frame_ComboBox_vDelvPort: TFrame_ENV_ComboBox
        Left = 466
        Top = 0
        Width = 320
        Height = 60
        Hint = #44032#49345#54252#53944
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
        TabOrder = 0
        OnClick = Frame_ComboBox_Click
        ExplicitLeft = 466
        ExplicitHeight = 60
        inherited Label_Key: TLabel
          Width = 248
          Height = 56
          Caption = #44032#49345#54252#53944' '#49324#50857#50504#54632
          ExplicitWidth = 745
          ExplicitHeight = 56
        end
        inherited Label1: TLabel
          Left = 262
          Width = 56
          Height = 56
          ExplicitLeft = 268
          ExplicitWidth = 56
          ExplicitHeight = 56
        end
        inherited Label_Hide: TLabel
          Height = 56
        end
      end
    end
    object Panel3: TPanel
      Left = 15
      Top = 230
      Width = 791
      Height = 60
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Padding.Left = 90
      Padding.Right = 5
      Padding.Bottom = 10
      ShowCaption = False
      TabOrder = 2
      object Label1: TLabel
        Left = 90
        Top = 0
        Width = 202
        Height = 50
        Align = alLeft
        Caption = #9679'  '#44032#49345#54252#53944' '#51452#48169' '#51204#49569
        Layout = tlCenter
        ExplicitHeight = 24
      end
      inline Frame_ComboBox_vDelvKitNumber: TFrame_ENV_ComboBox
        Left = 466
        Top = 0
        Width = 320
        Height = 50
        Hint = #51452#48169#51204#49569
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
        TabOrder = 0
        OnClick = Frame_ComboBox_Click
        ExplicitLeft = 466
        inherited Label_Key: TLabel
          Width = 248
          Caption = #51204#49569#50504#54632
          ExplicitWidth = 745
          ExplicitHeight = 56
        end
        inherited Label1: TLabel
          Left = 262
          Width = 56
          ExplicitLeft = 268
          ExplicitWidth = 56
          ExplicitHeight = 56
        end
        inherited Label_Hide: TLabel
          Height = 46
        end
      end
    end
    object Button_Install: TButton
      Left = 15
      Top = 476
      Width = 791
      Height = 60
      Align = alBottom
      Caption = #44032#49345#54252#53944' '#49444#52824
      TabOrder = 3
      OnClick = Button_InstallClick
    end
  end
end
