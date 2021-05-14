object CheckAccountForm: TCheckAccountForm
  Left = 0
  Top = 0
  Caption = 'Consultar Cuenta'
  ClientHeight = 256
  ClientWidth = 505
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
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
  object cardNumberLabel: TLabel
    Left = 28
    Top = 112
    Width = 105
    Height = 13
    Caption = '0000 0000 0000 0000'
  end
  object cardType: TLabel
    Left = 28
    Top = 131
    Width = 50
    Height = 13
    Caption = 'Card Type'
  end
  object cardBalance: TLabel
    Left = 424
    Top = 120
    Width = 54
    Height = 13
    Caption = '000000000'
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
  object accountsPanel: TPanel
    Left = 16
    Top = 74
    Width = 473
    Height = 23
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Caption = 'Accounts'
    Color = 13750737
    ParentBackground = False
    TabOrder = 1
  end
  object checkAccountStatementButton: TButton
    Left = 336
    Top = 216
    Width = 153
    Height = 25
    Caption = 'Check account statement'
    TabOrder = 2
  end
end
