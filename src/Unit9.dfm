object Form9: TForm9
  Left = 156
  Top = 435
  Width = 1066
  Height = 591
  Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1079#1072#1082#1072#1079#1077
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
  object Label1: TLabel
    Left = 480
    Top = 192
    Width = 59
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
  end
  object Label2: TLabel
    Left = 552
    Top = 192
    Width = 81
    Height = 13
    Caption = #1054#1090#1087#1091#1089#1082#1085#1072#1103' '#1094#1077#1085#1072
  end
  object Label3: TLabel
    Left = 664
    Top = 208
    Width = 55
    Height = 13
    Caption = #1053#1077' '#1074#1099#1073#1088#1072#1085
    Color = clBtnFace
    ParentColor = False
  end
  object SpeedButton1: TSpeedButton
    Left = 640
    Top = 208
    Width = 23
    Height = 22
    OnClick = SpeedButton1Click
  end
  object Label4: TLabel
    Left = 640
    Top = 192
    Width = 54
    Height = 13
    Caption = #1058#1088#1072#1085#1089#1087#1086#1088#1090
  end
  object SpeedButton2: TSpeedButton
    Left = 560
    Top = 8
    Width = 23
    Height = 22
    OnClick = SpeedButton2Click
  end
  object Label8: TLabel
    Left = 176
    Top = 200
    Width = 3
    Height = 13
  end
  object Label9: TLabel
    Left = 192
    Top = 504
    Width = 59
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
  end
  object Label10: TLabel
    Left = 320
    Top = 504
    Width = 26
    Height = 13
    Caption = #1062#1077#1085#1072
  end
  object ListView1: TListView
    Left = 8
    Top = 40
    Width = 801
    Height = 145
    Columns = <>
    HotTrackStyles = [htUnderlineCold, htUnderlineHot]
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
    OnSelectItem = ListView1SelectItem
  end
  object ListView2: TListView
    Left = 8
    Top = 232
    Width = 801
    Height = 265
    Columns = <>
    ReadOnly = True
    RowSelect = True
    PopupMenu = PopupMenu1
    TabOrder = 1
    ViewStyle = vsReport
    OnSelectItem = ListView2SelectItem
  end
  object Button1: TButton
    Left = 16
    Top = 8
    Width = 75
    Height = 25
    Caption = #1054#1073#1085#1086#1074#1080#1090#1100
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 16
    Top = 192
    Width = 153
    Height = 33
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1080#1079#1076#1077#1083#1080#1077' '#1074' '#1079#1072#1082#1072#1079
    TabOrder = 3
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 480
    Top = 208
    Width = 65
    Height = 21
    TabOrder = 4
    Text = '1'
    OnChange = Edit1Change
  end
  object Edit2: TEdit
    Left = 552
    Top = 208
    Width = 81
    Height = 21
    TabOrder = 5
    OnChange = Edit2Change
  end
  object Panel1: TPanel
    Left = 344
    Top = 232
    Width = 425
    Height = 185
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = 'Panel1'
    TabOrder = 6
    Visible = False
    object ListView3: TListView
      Left = 2
      Top = 2
      Width = 421
      Height = 181
      Align = alClient
      Columns = <>
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
      OnSelectItem = ListView3SelectItem
    end
  end
  object Panel2: TPanel
    Left = 560
    Top = 32
    Width = 225
    Height = 137
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 7
    Visible = False
    object Label5: TLabel
      Left = 16
      Top = 48
      Width = 130
      Height = 13
      Caption = #1044#1072#1090#1072' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103' '#1079#1072#1082#1072#1079#1072
    end
    object SpeedButton3: TSpeedButton
      Left = 16
      Top = 104
      Width = 23
      Height = 22
      OnClick = SpeedButton3Click
    end
    object Label6: TLabel
      Left = 48
      Top = 104
      Width = 55
      Height = 13
      Caption = #1053#1077' '#1074#1099#1073#1088#1072#1085
    end
    object Label7: TLabel
      Left = 16
      Top = 88
      Width = 50
      Height = 13
      Caption = #1044#1086#1089#1090#1072#1074#1082#1072
    end
    object LabeledEdit1: TLabeledEdit
      Left = 16
      Top = 24
      Width = 177
      Height = 21
      EditLabel.Width = 114
      EditLabel.Height = 13
      EditLabel.Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1079#1072#1082#1072#1079#1077
      TabOrder = 0
    end
    object DateTimePicker1: TDateTimePicker
      Left = 16
      Top = 64
      Width = 186
      Height = 21
      Date = 40526.644032685190000000
      Time = 40526.644032685190000000
      TabOrder = 1
    end
  end
  object Panel3: TPanel
    Left = 456
    Top = 160
    Width = 305
    Height = 121
    BevelInner = bvLowered
    Caption = 'Panel3'
    TabOrder = 8
    Visible = False
    object ListView4: TListView
      Left = 2
      Top = 2
      Width = 301
      Height = 117
      Align = alTop
      Columns = <>
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
      OnDblClick = ListView4DblClick
      OnSelectItem = ListView4SelectItem
    end
  end
  object Memo1: TMemo
    Left = 824
    Top = 72
    Width = 225
    Height = 289
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 9
  end
  object Button3: TButton
    Left = 720
    Top = 504
    Width = 99
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1082#1072#1079
    TabOrder = 10
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 16
    Top = 504
    Width = 169
    Height = 33
    Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1080#1079#1076#1077#1083#1080#1077' '#1074' '#1079#1072#1082#1072#1079#1077
    TabOrder = 11
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 616
    Top = 504
    Width = 99
    Height = 25
    Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1079#1072#1082#1072#1079
    TabOrder = 12
    OnClick = Button5Click
  end
  object Edit3: TEdit
    Left = 192
    Top = 520
    Width = 121
    Height = 21
    TabOrder = 13
    Text = '0'
    OnChange = Edit3Change
  end
  object Edit4: TEdit
    Left = 320
    Top = 520
    Width = 121
    Height = 21
    TabOrder = 14
    Text = '0'
    OnChange = Edit4Change
  end
  object ZConnection1: TZConnection
    Protocol = 'mysql-5'
    Properties.Strings = (
      'codepage=cp1251')
    TransactIsolationLevel = tiSerializable
    Left = 856
    Top = 416
  end
  object ZConnection2: TZConnection
    Protocol = 'mysql-5'
    Properties.Strings = (
      'codepage=cp1251')
    TransactIsolationLevel = tiSerializable
    Left = 888
    Top = 416
  end
  object PopupMenu1: TPopupMenu
    Left = 920
    Top = 416
    object Bpvtyn1: TMenuItem
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object N2: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
    end
    object N3: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object N5: TMenuItem
      Caption = #1054#1090#1084#1077#1085#1072
    end
  end
  object ZQuery1: TZQuery
    Connection = ZConnection1
    SortType = stIgnored
    Params = <>
    Left = 952
    Top = 416
  end
  object ZConnection3: TZConnection
    Protocol = 'mysql-5'
    Properties.Strings = (
      'codepage=cp1251')
    TransactIsolationLevel = tiSerializable
    Left = 856
    Top = 448
  end
end
