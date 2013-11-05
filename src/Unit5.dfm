object Form5: TForm5
  Left = 562
  Top = 391
  Width = 758
  Height = 482
  Caption = #1047#1072#1082#1072#1079#1095#1080#1082#1080
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
    742
    444)
  PixelsPerInch = 96
  TextHeight = 13
  object ListView1: TListView
    Left = 8
    Top = 8
    Width = 737
    Height = 401
    Anchors = [akLeft, akTop, akRight, akBottom]
    Columns = <>
    ReadOnly = True
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
    OnDblClick = ListView1DblClick
  end
  object Button1: TButton
    Left = 88
    Top = 416
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 416
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1054#1073#1085#1086#1074#1080#1090#1100
    TabOrder = 2
    OnClick = Button2Click
  end
  object ZConnection1: TZConnection
    Protocol = 'mysql-5'
    Properties.Strings = (
      'codepage=cp1251')
    Left = 344
    Top = 416
  end
  object PopupMenu1: TPopupMenu
    Left = 400
    Top = 416
  end
end
