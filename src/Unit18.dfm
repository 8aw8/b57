object Form18: TForm18
  Left = 425
  Top = 619
  Width = 459
  Height = 394
  Caption = #1053#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnDeactivate = FormDeactivate
  DesignSize = (
    451
    360)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 44
    Height = 13
    Caption = #1048#1079#1076#1077#1083#1080#1077
  end
  object Label2: TLabel
    Left = 8
    Top = 56
    Width = 19
    Height = 13
    Caption = #1042#1077#1089
  end
  object Label3: TLabel
    Left = 184
    Top = 56
    Width = 35
    Height = 13
    Caption = #1054#1073#1098#1077#1084
  end
  object Label4: TLabel
    Left = 8
    Top = 104
    Width = 79
    Height = 13
    Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1080
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 24
    Width = 417
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 0
    OnChange = ComboBox1Change
  end
  object Edit1: TEdit
    Left = 8
    Top = 72
    Width = 121
    Height = 21
    TabOrder = 1
    Text = '0'
    OnChange = Edit1Change
  end
  object Edit2: TEdit
    Left = 184
    Top = 72
    Width = 121
    Height = 21
    TabOrder = 2
    Text = '0'
    OnChange = Edit2Change
  end
  object ListView1: TListView
    Left = 8
    Top = 120
    Width = 433
    Height = 233
    Anchors = [akLeft, akTop, akRight, akBottom]
    Columns = <>
    ReadOnly = True
    RowSelect = True
    PopupMenu = PopupMenu1
    TabOrder = 3
    ViewStyle = vsReport
    OnDblClick = N4Click
  end
  object Button1: TButton
    Left = 320
    Top = 72
    Width = 89
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 4
    OnClick = Button1Click
  end
  object PopupMenu1: TPopupMenu
    Left = 416
    Top = 72
    object N1: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1074#1086#1076'-'#1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object N3: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1094#1077#1085#1091
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1094#1077#1085#1091
      OnClick = N4Click
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object N6: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1094#1077#1085#1091
    end
  end
end
