object Form15: TForm15
  Left = 327
  Top = 537
  Width = 217
  Height = 98
  Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = 80
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 0
    Text = '1'
    OnChange = Edit1Change
    OnEnter = Button1Click
    OnKeyPress = Edit1KeyPress
  end
  object StaticText1: TStaticText
    Left = 16
    Top = 8
    Width = 63
    Height = 17
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
    TabOrder = 1
  end
  object Button1: TButton
    Left = 16
    Top = 32
    Width = 81
    Height = 25
    Caption = #1054#1082
    TabOrder = 2
    TabStop = False
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 112
    Top = 32
    Width = 83
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 3
    TabStop = False
    OnClick = Button2Click
  end
end
