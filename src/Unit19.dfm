object Form19: TForm19
  Left = 699
  Top = 667
  Width = 311
  Height = 204
  Caption = #1062#1077#1085#1072' '#1080#1079#1076#1077#1083#1080#1103
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnDeactivate = FormDeactivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 32
    Width = 111
    Height = 13
    Caption = #1047#1072#1074#1086#1076'-'#1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100
  end
  object Label2: TLabel
    Left = 8
    Top = 8
    Width = 32
    Height = 13
    Caption = 'Label2'
  end
  object Label3: TLabel
    Left = 8
    Top = 80
    Width = 26
    Height = 13
    Caption = #1062#1077#1085#1072
  end
  object Label4: TLabel
    Left = 136
    Top = 80
    Width = 134
    Height = 13
    Caption = #1044#1072#1090#1072' '#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1103' '#1094#1077#1085#1099
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 48
    Width = 289
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 1
  end
  object Edit1: TEdit
    Left = 8
    Top = 96
    Width = 121
    Height = 21
    TabOrder = 2
    Text = '0'
    OnChange = Edit1Change
  end
  object Button1: TButton
    Left = 16
    Top = 136
    Width = 105
    Height = 25
    Caption = #1054#1082
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 176
    Top = 136
    Width = 105
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 0
    OnClick = Button2Click
  end
  object DateTimePicker1: TDateTimePicker
    Left = 136
    Top = 96
    Width = 161
    Height = 21
    Date = 40730.711025046290000000
    Time = 40730.711025046290000000
    TabOrder = 4
  end
end
