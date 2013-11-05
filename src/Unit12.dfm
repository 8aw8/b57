object Form12: TForm12
  Left = 396
  Top = 315
  Width = 1114
  Height = 630
  Caption = #1060#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1079#1072#1082#1072#1079#1072
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
    1106
    596)
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 384
    Top = 8
    Width = 23
    Height = 22
    OnClick = SpeedButton1Click
  end
  object Label3: TLabel
    Left = 416
    Top = 8
    Width = 55
    Height = 13
    Caption = #1053#1077' '#1074#1099#1073#1088#1072#1085
  end
  object Label8: TLabel
    Left = 8
    Top = 8
    Width = 3
    Height = 13
  end
  object Shape1: TShape
    Left = 1074
    Top = 570
    Width = 16
    Height = 16
    Anchors = [akRight]
    Brush.Color = clLime
    Pen.Width = 3
    Shape = stCircle
  end
  object StringGrid1: TStringGrid
    Left = 8
    Top = 32
    Width = 860
    Height = 261
    Anchors = [akLeft, akTop, akRight, akBottom]
    ColCount = 13
    DefaultRowHeight = 18
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goColSizing, goEditing, goTabs]
    PopupMenu = PopupMenu1
    TabOrder = 9
    OnDrawCell = StringGrid1DrawCell
    OnKeyPress = StringGrid1KeyPress
    OnSelectCell = StringGrid1SelectCell
    OnSetEditText = StringGrid1SetEditText
  end
  object ListView2: TListView
    Left = 8
    Top = 298
    Width = 860
    Height = 195
    Anchors = [akLeft, akRight, akBottom]
    Columns = <
      item
        Caption = #1048#1079#1076#1077#1083#1080#1077
      end
      item
        Caption = #1054#1073#1098#1077#1084
      end
      item
        Caption = #1042#1077#1089
      end
      item
        Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100
      end
      item
        Caption = #1040#1076#1088#1077#1089' '#1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1103
      end
      item
        Caption = #1047#1072#1082#1091#1087#1086#1095#1085#1072#1103' '#1094#1077#1085#1072
      end>
    ReadOnly = True
    RowSelect = True
    PopupMenu = PopupMenu2
    TabOrder = 1
    ViewStyle = vsReport
    OnDblClick = Button7Click
  end
  object GroupBox1: TGroupBox
    Left = 871
    Top = 40
    Width = 229
    Height = 483
    Anchors = [akTop, akRight, akBottom]
    Caption = #1055#1088#1086#1084#1077#1078#1091#1090#1086#1095#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103
    TabOrder = 2
    object Label4: TLabel
      Left = 8
      Top = 16
      Width = 32
      Height = 13
      Caption = 'Label4'
    end
    object Label5: TLabel
      Left = 8
      Top = 48
      Width = 32
      Height = 13
      Caption = 'Label5'
    end
    object Label6: TLabel
      Left = 8
      Top = 104
      Width = 32
      Height = 13
      Caption = 'Label6'
    end
    object Label7: TLabel
      Left = 144
      Top = 464
      Width = 72
      Height = 13
      Caption = '____________'
    end
    object Label9: TLabel
      Left = 8
      Top = 32
      Width = 32
      Height = 13
      Caption = 'Label9'
    end
    object Label10: TLabel
      Left = 8
      Top = 64
      Width = 38
      Height = 13
      Caption = 'Label10'
    end
    object Edit2: TEdit
      Left = 88
      Top = 80
      Width = 65
      Height = 21
      TabOrder = 0
      Text = '10000'
      OnChange = Edit2Change
    end
    object StaticText2: TStaticText
      Left = 8
      Top = 80
      Width = 75
      Height = 17
      Caption = #1062#1077#1085#1072' '#1084#1072#1096#1080#1085#1099
      TabOrder = 1
    end
    object Button4: TButton
      Left = 8
      Top = 264
      Width = 75
      Height = 25
      Caption = 'Excel'
      TabOrder = 2
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 8
      Top = 120
      Width = 75
      Height = 25
      Caption = #1051#1086#1075#1080#1089#1090#1080#1082#1072
      TabOrder = 3
      OnClick = Button5Click
    end
  end
  object Button1: TButton
    Left = 883
    Top = 530
    Width = 97
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 995
    Top = 530
    Width = 89
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100
    TabOrder = 4
    OnClick = Button2Click
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 498
    Width = 860
    Height = 73
    Anchors = [akLeft, akRight, akBottom]
    Caption = #1042#1099#1073#1086#1088' '#1085#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1099
    TabOrder = 5
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 53
      Height = 13
      Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103
    end
    object Label2: TLabel
      Left = 208
      Top = 24
      Width = 92
      Height = 13
      Caption = #1055#1086#1080#1089#1082' '#1087#1086' '#1087#1086#1079#1080#1094#1080#1080
    end
    object ComboBox1: TComboBox
      Left = 8
      Top = 40
      Width = 193
      Height = 19
      Style = csOwnerDrawFixed
      ItemHeight = 13
      TabOrder = 0
      OnChange = ComboBox1Change
    end
    object Edit1: TEdit
      Left = 208
      Top = 40
      Width = 169
      Height = 21
      TabOrder = 1
      OnChange = Edit1Change
    end
    object Button7: TButton
      Left = 536
      Top = 40
      Width = 75
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 2
      OnClick = Button7Click
    end
    object DateTimePicker1: TDateTimePicker
      Left = 384
      Top = 40
      Width = 145
      Height = 21
      Date = 40674.596830069430000000
      Time = 40674.596830069430000000
      TabOrder = 3
      OnChange = DateTimePicker1Change
    end
  end
  object StaticText1: TStaticText
    Left = 328
    Top = 8
    Width = 55
    Height = 17
    Caption = #1047#1072#1082#1072#1079#1095#1080#1082':'
    TabOrder = 6
  end
  object ListView3: TListView
    Left = 240
    Top = 32
    Width = 377
    Height = 150
    BevelKind = bkSoft
    Columns = <>
    ReadOnly = True
    RowSelect = True
    PopupMenu = PopupMenu3
    TabOrder = 7
    ViewStyle = vsReport
    Visible = False
    OnDblClick = ListView3DblClick
  end
  object Memo1: TMemo
    Left = 880
    Top = 344
    Width = 136
    Height = 169
    Lines.Strings = (
      'Memo1')
    TabOrder = 8
    Visible = False
  end
  object Button3: TButton
    Left = 883
    Top = 530
    Width = 89
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 10
    OnClick = Button3Click
  end
  object ListView1: TListView
    Left = 1112
    Top = 64
    Width = 81
    Height = 97
    Columns = <
      item
        Caption = #8470' '#1087#1086#1079
      end
      item
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 100
      end
      item
        Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
        Width = 80
      end
      item
        Caption = #1042#1077#1089', '#1090#1085
      end
      item
        Caption = #1062#1077#1085#1072' '#1079#1072#1082#1091#1087#1082#1080
        Width = 100
      end
      item
        Caption = #1062#1077#1085#1072' '#1087#1088#1086#1076#1072#1078#1080
        Width = 100
      end
      item
      end
      item
      end>
    ReadOnly = True
    RowSelect = True
    PopupMenu = PopupMenu1
    TabOrder = 0
    ViewStyle = vsReport
    Visible = False
  end
  object ZConnection1: TZConnection
    Protocol = 'mysql-5'
    Properties.Strings = (
      'codepage=cp1251')
    TransactIsolationLevel = tiReadCommitted
    Left = 608
    Top = 8
  end
  object ZConnection2: TZConnection
    Protocol = 'mysql-5'
    Properties.Strings = (
      'codepage=cp1251')
    TransactIsolationLevel = tiReadCommitted
    Left = 640
    Top = 8
  end
  object ZConnection3: TZConnection
    Protocol = 'mysql-5'
    Properties.Strings = (
      'codepage=cp1251')
    TransactIsolationLevel = tiSerializable
    Left = 672
    Top = 8
  end
  object ZQuery1: TZQuery
    Connection = ZConnection3
    Params = <>
    Left = 736
    Top = 8
  end
  object PopupMenu1: TPopupMenu
    Left = 768
    Top = 8
    object N1: TMenuItem
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    end
    object N2: TMenuItem
      Caption = '-'
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
  object ZConnection4: TZConnection
    Protocol = 'mysql-5'
    Properties.Strings = (
      'codepage=cp1251')
    TransactIsolationLevel = tiReadCommitted
    Left = 704
    Top = 8
  end
  object PopupMenu2: TPopupMenu
    Left = 800
    Top = 8
    object N6: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082' '#1079#1072#1082#1072#1079#1091
      OnClick = Button7Click
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object N9: TMenuItem
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1080#1079#1076#1077#1083#1080#1077
      OnClick = N9Click
    end
    object N10: TMenuItem
      Caption = '-'
    end
    object N8: TMenuItem
      Caption = #1054#1090#1084#1077#1085#1072
    end
  end
  object PopupMenu3: TPopupMenu
    Left = 800
    Top = 40
    object N14: TMenuItem
      Caption = #1042#1099#1073#1088#1072#1090#1100
      OnClick = ListView3DblClick
    end
    object N12: TMenuItem
      Caption = '-'
    end
    object N11: TMenuItem
      Caption = #1053#1086#1074#1099#1081' '#1079#1072#1082#1072#1079#1095#1080#1082
      OnClick = N11Click
    end
    object N13: TMenuItem
      Caption = #1048#1084#1077#1085#1080#1090#1100' '#1079#1072#1082#1072#1079#1095#1080#1082#1072
      OnClick = N13Click
    end
    object N15: TMenuItem
      Caption = '-'
    end
    object N17: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnClick = N17Click
    end
    object N16: TMenuItem
      Caption = #1054#1090#1084#1077#1085#1072
    end
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 832
    Top = 8
  end
end
