object checkAccountStatementSelectionProcessForm: TcheckAccountStatementSelectionProcessForm
  Left = 0
  Top = 0
  Caption = 'Consultar estado de cuenta'
  ClientHeight = 256
  ClientWidth = 505
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object welcomeLabel: TLabel
    Left = 8
    Top = 47
    Width = 50
    Height = 13
    Caption = 'Welcome, '
  end
  object nameLabel: TLabel
    Left = 64
    Top = 47
    Width = 27
    Height = 13
    Caption = 'Name'
  end
  object bankSystemPanel: TPanel
    Left = 0
    Top = 0
    Width = 505
    Height = 41
    Align = alTop
    Color = 921596
    ParentBackground = False
    TabOrder = 0
    object bankSystemLabel: TLabel
      Left = 16
      Top = 14
      Width = 61
      Height = 13
      Caption = 'Bank System'
      Color = clWhite
      ParentColor = False
    end
  end
  object checkAccountStatementPanel: TPanel
    Left = 16
    Top = 74
    Width = 473
    Height = 23
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Caption = 'Check Account Statement'
    Color = 13750737
    ParentBackground = False
    TabOrder = 1
  end
  object accountComboBox: TComboBox
    Left = 16
    Top = 128
    Width = 137
    Height = 21
    TabOrder = 2
    Text = 'Select an account'
  end
  object yearComboBox: TComboBox
    Left = 176
    Top = 128
    Width = 145
    Height = 21
    TabOrder = 3
    Text = 'Select a year'
    Items.Strings = (
      '2021'
      '2020'
      '2019'
      '2018')
  end
  object monthComboBox: TComboBox
    Left = 344
    Top = 128
    Width = 145
    Height = 21
    TabOrder = 4
    Text = 'Select a Month'
    Items.Strings = (
      'January'
      'February'
      'March'
      'April'
      'May'
      'June'
      'July'
      'August'
      'September'
      'October'
      'November'
      'December')
  end
  object acceptButton: TButton
    Left = 336
    Top = 216
    Width = 153
    Height = 25
    Caption = 'Accept'
    TabOrder = 5
  end
end
