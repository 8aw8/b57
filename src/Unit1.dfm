object Form1: TForm1
  Left = 295
  Top = 224
  Width = 1184
  Height = 708
  Caption = 'f'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  DesignSize = (
    1176
    654)
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 976
    Top = 16
    Width = 32
    Height = 13
    Caption = 'Label2'
  end
  object ListView1: TListView
    Left = 208
    Top = 40
    Width = 964
    Height = 577
    Anchors = [akLeft, akTop, akRight, akBottom]
    Columns = <
      item
        AutoSize = True
      end
      item
        AutoSize = True
      end
      item
        AutoSize = True
      end
      item
        AutoSize = True
      end
      item
        AutoSize = True
      end
      item
        AutoSize = True
      end>
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = '@Arial Unicode MS'
    Font.Style = []
    ReadOnly = True
    RowSelect = True
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 0
    ViewStyle = vsReport
    OnCustomDrawItem = ListView1CustomDrawItem
    OnDblClick = ListView1DblClick
  end
  object Button2: TButton
    Left = 328
    Top = 8
    Width = 145
    Height = 25
    Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1079#1072#1082#1072#1079#1086#1074
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button4: TButton
    Left = 8
    Top = 8
    Width = 153
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1091
    TabOrder = 2
    OnClick = N10Click
  end
  object Button5: TButton
    Left = 168
    Top = 8
    Width = 153
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1080#1079#1076#1077#1083#1080#1077
    TabOrder = 3
    OnClick = Button5Click
  end
  object Button1: TButton
    Left = 640
    Top = 8
    Width = 153
    Height = 25
    Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1079#1072#1082#1072#1079
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button3: TButton
    Left = 800
    Top = 8
    Width = 75
    Height = 25
    Caption = #1047#1072#1082#1072#1079#1095#1080#1082
    TabOrder = 5
    OnClick = Button3Click
  end
  object Panel1: TPanel
    Left = 0
    Top = 624
    Width = 1176
    Height = 30
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 6
    DesignSize = (
      1176
      30)
    object Shape1: TShape
      Left = 1147
      Top = 8
      Width = 16
      Height = 16
      Anchors = [akRight]
      Brush.Color = clLime
      Pen.Width = 3
      Shape = stCircle
    end
    object Label1: TLabel
      Left = 891
      Top = 8
      Width = 32
      Height = 13
      Anchors = [akRight]
      Caption = 'Label1'
    end
  end
  object CheckBox1: TCheckBox
    Left = 480
    Top = 8
    Width = 137
    Height = 25
    Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1091#1076#1072#1083#1077#1085#1085#1099#1093
    TabOrder = 7
  end
  object TreeView1: TTreeView
    Left = 8
    Top = 40
    Width = 193
    Height = 577
    Anchors = [akLeft, akTop, akBottom]
    Indent = 19
    TabOrder = 8
    OnChange = TreeView1Change
    Items.Data = {
      020000001F0000000000000001000000FFFFFFFFFFFFFFFF0000000001000000
      06C7E0FFE2EAE826000000000000000B000000FFFFFFFFFFFFFFFF0000000000
      0000000DD1EFE8F1EEEA20E7E0FFE2EEEA220000000000000002000000FFFFFF
      FFFFFFFFFF000000000000000009CBEEE3E8F1F2E8EAE0}
  end
  object MainMenu1: TMainMenu
    Left = 880
    Top = 8
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object N5: TMenuItem
        Caption = #1055#1077#1088#1077#1087#1086#1076#1082#1083#1102#1095#1080#1090#1100
        OnClick = N5Click
      end
      object N2: TMenuItem
        Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103
        OnClick = N2Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object N4: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = N4Click
      end
    end
    object N6: TMenuItem
      Caption = #1047#1072#1082#1072#1079#1099
      object N7: TMenuItem
        Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1079#1072#1082#1072#1079
        OnClick = Button1Click
      end
    end
    object N8: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      object N9: TMenuItem
        Caption = #1047#1072#1082#1072#1079#1095#1080#1082#1080
        OnClick = Button3Click
      end
      object N16: TMenuItem
        Caption = '-'
      end
      object N10: TMenuItem
        Caption = #1053#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1072
        OnClick = N10Click
      end
      object N18: TMenuItem
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1085#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1091
        OnClick = N18Click
      end
      object N17: TMenuItem
        Caption = '-'
      end
      object N11: TMenuItem
        Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1080
      end
      object N23: TMenuItem
        Caption = '-'
      end
      object N24: TMenuItem
        Caption = #1051#1086#1075#1080#1089#1090#1080#1082#1072
        object N25: TMenuItem
          Caption = #1044#1080#1089#1087#1077#1090#1095#1077#1088#1072
          OnClick = N25Click
        end
        object N26: TMenuItem
          Caption = #1042#1086#1076#1080#1090#1077#1083#1080
          OnClick = N26Click
        end
        object N28: TMenuItem
          Caption = #1042#1083#1072#1076#1077#1083#1100#1094#1099' '#1072#1074#1090#1086#1084#1086#1073#1080#1083#1077#1081
          OnClick = N28Click
        end
        object N29: TMenuItem
          Caption = '-'
        end
        object N27: TMenuItem
          Caption = #1040#1074#1090#1086#1084#1086#1073#1080#1083#1080
          OnClick = N27Click
        end
      end
    end
    object N19: TMenuItem
      Caption = #1047#1072#1103#1074#1082#1080
      object N20: TMenuItem
        Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1079#1072#1103#1074#1082#1091
        OnClick = N20Click
      end
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 912
    Top = 8
    object N12: TMenuItem
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1079#1072#1082#1072#1079
      OnClick = ListView1DblClick
    end
    object N13: TMenuItem
      Caption = '-'
    end
    object N14: TMenuItem
      Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1079#1072#1082#1072#1079
      OnClick = Button1Click
    end
    object N15: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1082#1072#1079
      OnClick = N15Click
    end
    object N21: TMenuItem
      Caption = '-'
    end
    object N22: TMenuItem
      Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1079#1072#1103#1074#1082#1091
      OnClick = N22Click
    end
  end
end
