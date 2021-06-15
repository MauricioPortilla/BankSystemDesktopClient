object ExecutiveMenuForm: TExecutiveMenuForm
  Left = 0
  Top = 0
  Caption = 'Men'#250
  ClientHeight = 231
  ClientWidth = 505
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object bankSystemPanel: TPanel
    Left = 0
    Top = 0
    Width = 505
    Height = 41
    Align = alTop
    Color = 921596
    ParentBackground = False
    TabOrder = 0
    object AccountNameLabel: TLabel
      Left = 390
      Top = 10
      Width = 99
      Height = 18
      Alignment = taRightJustify
      Caption = 'Atendiendo: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Lucida Sans'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 6
      Width = 124
      Height = 23
      Caption = 'Bank System'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -20
      Font.Name = 'Lucida Sans'
      Font.Style = []
      ParentFont = False
    end
  end
  object SignUpButton: TButton
    Left = 32
    Top = 78
    Width = 201
    Height = 107
    Caption = 'Registrar cuenta'
    TabOrder = 1
    OnClick = SignUpButtonClick
  end
  object CheckAccountButton: TButton
    Left = 272
    Top = 78
    Width = 201
    Height = 107
    Caption = 'Consultar cuenta cliente'
    TabOrder = 2
    OnClick = CheckAccountButtonClick
  end
end
