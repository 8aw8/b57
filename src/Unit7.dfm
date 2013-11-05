object Form7: TForm7
  Left = 300
  Top = 527
  Width = 640
  Height = 441
  Caption = #1048#1079#1076#1077#1083#1080#1077
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnDestroy = FormDestroy
  DesignSize = (
    632
    407)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 76
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
  end
  object Label2: TLabel
    Left = 56
    Top = 40
    Width = 35
    Height = 13
    Caption = #1054#1073#1098#1077#1084
  end
  object Label3: TLabel
    Left = 72
    Top = 64
    Width = 19
    Height = 13
    Caption = #1042#1077#1089
  end
  object SpeedButton1: TSpeedButton
    Left = 96
    Top = 128
    Width = 23
    Height = 17
    OnClick = SpeedButton1Click
  end
  object Label4: TLabel
    Left = 64
    Top = 88
    Width = 26
    Height = 13
    Caption = #1062#1077#1085#1072
  end
  object Label5: TLabel
    Left = 120
    Top = 128
    Width = 52
    Height = 13
    Caption = #1053#1077' '#1091#1082#1072#1079#1072#1085
  end
  object SpeedButton2: TSpeedButton
    Left = 264
    Top = 128
    Width = 23
    Height = 17
    OnClick = SpeedButton2Click
  end
  object Label6: TLabel
    Left = 288
    Top = 128
    Width = 58
    Height = 13
    Caption = #1053#1077' '#1091#1082#1072#1079#1072#1085#1072
  end
  object ListView1: TListView
    Left = 8
    Top = 152
    Width = 617
    Height = 249
    Anchors = [akLeft, akTop, akRight, akBottom]
    Columns = <>
    HotTrackStyles = [htUnderlineCold, htUnderlineHot]
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
    OnSelectItem = ListView1SelectItem
  end
  object Edit1: TEdit
    Left = 96
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object Edit2: TEdit
    Left = 96
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 2
    Text = '0.00'
    OnChange = Edit2Change
  end
  object Button1: TButton
    Left = 424
    Top = 16
    Width = 75
    Height = 25
    Caption = #1054#1073#1085#1086#1074#1080#1090#1100
    TabOrder = 3
    OnClick = Button1Click
  end
  object Edit3: TEdit
    Left = 96
    Top = 64
    Width = 121
    Height = 21
    TabOrder = 4
    Text = '0.00'
    OnChange = Edit3Change
  end
  object Button2: TButton
    Left = 344
    Top = 16
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 5
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 264
    Top = 16
    Width = 75
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 6
    OnClick = Button3Click
  end
  object StaticText1: TStaticText
    Left = 96
    Top = 112
    Width = 94
    Height = 17
    Caption = #1047#1072#1074#1086#1076' '#1087#1086#1089#1090#1072#1074#1097#1080#1082
    TabOrder = 7
  end
  object Edit4: TEdit
    Left = 96
    Top = 88
    Width = 121
    Height = 21
    TabOrder = 8
    Text = '0.00'
    OnChange = Edit4Change
  end
  object StaticText2: TStaticText
    Left = 264
    Top = 112
    Width = 106
    Height = 17
    Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1087#1088#1086#1076#1091#1082#1090#1072
    TabOrder = 9
  end
  object Panel1: TPanel
    Left = 8
    Top = 144
    Width = 249
    Height = 145
    BevelInner = bvLowered
    Caption = 'Panel1'
    TabOrder = 10
    Visible = False
    object ListView2: TListView
      Left = 2
      Top = 2
      Width = 245
      Height = 141
      Align = alClient
      Columns = <>
      ReadOnly = True
      PopupMenu = PopupMenu1
      TabOrder = 0
      ViewStyle = vsReport
      OnDblClick = ListView2DblClick
    end
  end
  object Panel2: TPanel
    Left = 264
    Top = 144
    Width = 185
    Height = 145
    BevelInner = bvLowered
    Caption = 'Panel2'
    TabOrder = 11
    Visible = False
    object ListView3: TListView
      Left = 2
      Top = 2
      Width = 181
      Height = 141
      Align = alClient
      Columns = <>
      ReadOnly = True
      TabOrder = 0
      ViewStyle = vsReport
      OnDblClick = ListView3DblClick
    end
  end
  object ZQuery1: TZQuery
    Connection = ZConnection1
    Params = <>
    Left = 576
    Top = 16
  end
  object ZConnection1: TZConnection
    Protocol = 'mysql-5'
    Properties.Strings = (
      'codepage=cp1251')
    TransactIsolationLevel = tiSerializable
    Left = 528
    Top = 64
  end
  object ZConnection2: TZConnection
    Protocol = 'mysql-5'
    Properties.Strings = (
      'codepage=cp1251')
    TransactIsolationLevel = tiReadCommitted
    Left = 560
    Top = 64
  end
  object ZConnection3: TZConnection
    Protocol = 'mysql-5'
    Properties.Strings = (
      'codepage=cp1251')
    TransactIsolationLevel = tiSerializable
    Left = 592
    Top = 64
  end
  object PopupMenu1: TPopupMenu
    Left = 456
    Top = 72
    object N1: TMenuItem
      Caption = #1042#1099#1073#1088#1072#1090#1100
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object N3: TMenuItem
      Caption = #1057#1086#1079#1076#1072#1090#1100
    end
    object N4: TMenuItem
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      OnClick = N4Click
    end
  end
end
