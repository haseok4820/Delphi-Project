object Form_ENV1_1: TForm_ENV1_1
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Form_ENV1_1'
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
  Position = poDesigned
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
    Padding.Right = 10
    Padding.Bottom = 10
    TabOrder = 0
    object Label_Guide1: TLabel
      Left = 15
      Top = 40
      Width = 811
      Height = 50
      Align = alTop
      AutoSize = False
      Caption = ' -1. '#47588#51109#51221#48372'   ['#51077#47141#54616#49888' '#51221#48372#45716' '#50689#49688#51613#50640' '#52636#47141#46121#45768#45796'.]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 10770443
      Font.Height = -21
      Font.Name = #44256#46020' B'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      ExplicitLeft = 12
      ExplicitTop = 4
    end
    object Label_Title: TLabel
      Left = 15
      Top = 0
      Width = 811
      Height = 40
      Align = alTop
      AutoSize = False
      Caption = '1-1. '#47588#51109#51221#48372
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
    inline Frame_ENV_StoreOwner: TFrame_ENV_Edit
      Left = 15
      Top = 139
      Width = 811
      Height = 49
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
      ExplicitLeft = 15
      ExplicitTop = 139
      ExplicitWidth = 811
      inherited Label_Key: TLabel
        Caption = #45824'  '#54364'  '#51088
      end
      inherited Panel_Body: TPanel
        Width = 629
        ExplicitLeft = 181
        ExplicitTop = 1
        ExplicitWidth = 629
        inherited Edit_Value: TEdit
          Width = 596
          ExplicitWidth = 596
        end
      end
    end
    inline Frame_ENV_StoreName: TFrame_ENV_Edit
      Left = 15
      Top = 90
      Width = 811
      Height = 49
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
      ExplicitLeft = 15
      ExplicitTop = 90
      ExplicitWidth = 811
      inherited Label_Key: TLabel
        Caption = #47588'  '#51109'  '#47749
      end
      inherited Panel_Body: TPanel
        Width = 629
        ExplicitLeft = 181
        ExplicitTop = 1
        ExplicitWidth = 629
        inherited Edit_Value: TEdit
          Width = 596
          ExplicitWidth = 596
        end
      end
    end
    inline Frame_ENV_StoreType: TFrame_ENV_Edit
      Left = 15
      Top = 188
      Width = 811
      Height = 49
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
      ExplicitLeft = 15
      ExplicitTop = 188
      ExplicitWidth = 811
      inherited Label_Key: TLabel
        Caption = #50629'       '#51333
      end
      inherited Panel_Body: TPanel
        Width = 629
        ExplicitLeft = 181
        ExplicitTop = 1
        ExplicitWidth = 629
        inherited Edit_Value: TEdit
          Width = 596
          ExplicitWidth = 596
        end
      end
    end
    inline Frame_ENV_StoreSeq: TFrame_ENV_Edit
      Left = 15
      Top = 237
      Width = 811
      Height = 49
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
      ExplicitLeft = 15
      ExplicitTop = 237
      ExplicitWidth = 811
      inherited Label_Key: TLabel
        Caption = #49324#50629#51088#48264#54840
      end
      inherited Panel_Body: TPanel
        Width = 629
        ExplicitLeft = 181
        ExplicitTop = 1
        ExplicitWidth = 629
        inherited Edit_Value: TEdit
          Width = 596
          ExplicitWidth = 596
        end
      end
    end
    inline Frame_ENV_StoreTel: TFrame_ENV_Edit
      Left = 15
      Top = 286
      Width = 811
      Height = 49
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
      ExplicitLeft = 15
      ExplicitTop = 286
      ExplicitWidth = 811
      inherited Label_Key: TLabel
        Caption = #51204' '#54868' '#48264' '#54840
      end
      inherited Panel_Body: TPanel
        Width = 629
        ExplicitLeft = 181
        ExplicitTop = 1
        ExplicitWidth = 629
        inherited Edit_Value: TEdit
          Width = 596
          ExplicitWidth = 596
        end
      end
    end
    inline Frame_ENV_StoreAddr1: TFrame_ENV_Edit
      Left = 15
      Top = 335
      Width = 811
      Height = 49
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
      TabOrder = 5
      ExplicitLeft = 15
      ExplicitTop = 335
      ExplicitWidth = 811
      inherited Label_Key: TLabel
        Caption = #47588' '#51109' '#51452' '#49548
      end
      inherited Panel_Body: TPanel
        Width = 629
        ExplicitLeft = 181
        ExplicitTop = 1
        ExplicitWidth = 629
        inherited Edit_Value: TEdit
          Width = 596
          ExplicitWidth = 596
        end
      end
    end
    inline Frame_ENV_StoreAddr2: TFrame_ENV_Edit
      Left = 15
      Top = 384
      Width = 811
      Height = 49
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
      TabOrder = 6
      ExplicitLeft = 15
      ExplicitTop = 384
      ExplicitWidth = 811
      inherited Label_Key: TLabel
        Caption = #49345' '#49464' '#51452' '#49548
      end
      inherited Panel_Body: TPanel
        Width = 629
        ExplicitLeft = 181
        ExplicitTop = 1
        ExplicitWidth = 629
        inherited Edit_Value: TEdit
          Width = 596
          ExplicitWidth = 596
        end
      end
    end
  end
end
