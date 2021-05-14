unit CheckAccount;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TCheckAccountForm = class(TForm)
    bankSystemPanel: TPanel;
    bankSystemLabel: TLabel;
    welcomeLabel: TLabel;
    nameLabel: TLabel;
    accountsPanel: TPanel;
    cardNumberLabel: TLabel;
    cardType: TLabel;
    cardBalance: TLabel;
    checkAccountStatementButton: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CheckAccountForm: TCheckAccountForm;

implementation

{$R *.dfm}

end.
