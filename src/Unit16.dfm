object Form16: TForm16
  Left = 945
  Top = 530
  Width = 330
  Height = 130
  Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100
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
    Left = 88
    Top = 8
    Width = 225
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 88
    Top = 32
    Width = 225
    Height = 21
    TabOrder = 1
  end
  object StaticText1: TStaticText
    Left = 8
    Top = 8
    Width = 80
    Height = 17
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    TabOrder = 2
  end
  object StaticText2: TStaticText
    Left = 48
    Top = 32
    Width = 35
    Height = 17
    Caption = #1040#1076#1088#1077#1089
    TabOrder = 3
  end
  object Button1: TButton
    Left = 16
    Top = 64
    Width = 121
    Height = 25
    Caption = #1054#1082
    TabOrder = 4
  end
  object Button2: TButton
    Left = 184
    Top = 64
    Width = 123
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 5
    OnClick = Button2Click
  end
  object ZQuery1: TZQuery
    Connection = DM.ZConnection2
    Params = <>
    Left = 144
    Top = 64
  end
end
