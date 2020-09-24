object MainForm: TMainForm
  Left = 498
  Top = 129
  ActiveControl = ButUret
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #350'ifre '#220'reteci v1.2'
  ClientHeight = 261
  ClientWidth = 263
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object LabSifreUzunlugu: TLabel
    Left = 128
    Top = 91
    Width = 70
    Height = 13
    Caption = #350'ifre uzunlu'#287'u:'
  end
  object LabOzel: TLabel
    Left = 16
    Top = 152
    Width = 78
    Height = 13
    Caption = #214'zel Karakterler:'
  end
  object ButUret: TButton
    Left = 16
    Top = 224
    Width = 75
    Height = 25
    Caption = #220'ret'
    TabOrder = 0
    OnClick = ButUretClick
  end
  object ButKopyala: TButton
    Left = 104
    Top = 224
    Width = 75
    Height = 25
    Caption = 'Kopyala'
    TabOrder = 1
    OnClick = ButKopyalaClick
  end
  object MemSifre: TMemo
    Left = 16
    Top = 16
    Width = 233
    Height = 62
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
  end
  object CheBRakam: TCheckBox
    Left = 16
    Top = 91
    Width = 97
    Height = 17
    Caption = 'Rakam kullan'
    Checked = True
    State = cbChecked
    TabOrder = 3
  end
  object CheBBuyuk: TCheckBox
    Left = 16
    Top = 107
    Width = 105
    Height = 17
    Caption = 'B'#252'y'#252'k harf kullan'
    Checked = True
    State = cbChecked
    TabOrder = 4
  end
  object CheBKucuk: TCheckBox
    Left = 16
    Top = 123
    Width = 105
    Height = 17
    Caption = 'K'#252#231#252'k harf kullan'
    Checked = True
    State = cbChecked
    TabOrder = 5
  end
  object SpiELen: TSpinEdit
    Left = 128
    Top = 107
    Width = 81
    Height = 22
    MaxValue = 2147483647
    MinValue = 1
    TabOrder = 6
    Value = 12
  end
  object EdiOzel: TEdit
    Left = 16
    Top = 168
    Width = 233
    Height = 21
    TabOrder = 7
    Text = '/\"!'#39'^$+%&{}[]()=*?_-@'#8364'i~'#230'<>|.,;`'
  end
  object CheBOzel: TCheckBox
    Left = 16
    Top = 192
    Width = 121
    Height = 17
    Caption = #214'zel karakter kullan'
    Checked = True
    State = cbChecked
    TabOrder = 8
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 1
    Left = 216
    Top = 16
  end
end
