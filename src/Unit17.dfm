object Form17: TForm17
  Left = 409
  Top = 674
  Width = 600
  Height = 315
  Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1085#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1099
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
  object Gauge1: TGauge
    Left = 8
    Top = 256
    Width = 577
    Height = 17
    Progress = 0
  end
  object Label1: TLabel
    Left = 248
    Top = 224
    Width = 53
    Height = 13
    Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103
  end
  object Button1: TButton
    Left = 8
    Top = 224
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1088#1099#1090#1100
    TabOrder = 0
    OnClick = Button1Click
  end
  object StringGrid1: TStringGrid
    Left = 8
    Top = 8
    Width = 577
    Height = 209
    DefaultRowHeight = 16
    TabOrder = 1
  end
  object Button2: TButton
    Left = 88
    Top = 224
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 168
    Top = 224
    Width = 75
    Height = 25
    Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
    TabOrder = 3
  end
  object ComboBox1: TComboBox
    Left = 304
    Top = 224
    Width = 185
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 4
  end
  object OpenDialog1: TOpenDialog
    Left = 560
    Top = 224
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckNewInstance
    AutoQuit = False
    Left = 496
    Top = 224
  end
  object ZQuery1: TZQuery
    Connection = DM.ZConnection3
    Params = <>
    Left = 528
    Top = 224
  end
end
