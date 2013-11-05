object Form14: TForm14
  Left = 603
  Top = 566
  Width = 265
  Height = 163
  Caption = #1044#1086#1089#1090#1072#1074#1082#1072
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
    Left = 120
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 120
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object Edit3: TEdit
    Left = 120
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object StaticText1: TStaticText
    Left = 8
    Top = 32
    Width = 35
    Height = 17
    Caption = #1040#1076#1088#1077#1089
    TabOrder = 3
  end
  object StaticText2: TStaticText
    Left = 8
    Top = 8
    Width = 52
    Height = 17
    Caption = #1047#1072#1082#1072#1079#1095#1080#1082
    TabOrder = 4
  end
  object StaticText3: TStaticText
    Left = 8
    Top = 56
    Width = 111
    Height = 17
    Caption = #1050#1086#1085#1090#1072#1082#1090#1085#1099#1081' '#1090#1077#1083#1077#1092#1086#1085
    TabOrder = 5
  end
  object Button1: TButton
    Left = 24
    Top = 88
    Width = 81
    Height = 25
    Caption = #1054#1082
    TabOrder = 6
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 136
    Top = 88
    Width = 81
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 7
    OnClick = Button2Click
  end
  object ZConnection1: TZConnection
    Protocol = 'mysql-5'
    Properties.Strings = (
      'codepage=cp1251')
    TransactIsolationLevel = tiRepeatableRead
    Left = 56
    Top = 8
  end
  object ZQuery1: TZQuery
    Connection = ZConnection1
    Params = <>
    Left = 88
    Top = 8
  end
end
