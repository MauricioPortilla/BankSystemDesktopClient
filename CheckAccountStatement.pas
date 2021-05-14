unit CheckAccountStatement;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TcheckAccountStatementForm = class(TForm)
    bankSystemPanel: TPanel;
    bankSystemLabel: TLabel;
    welcomeLabel: TLabel;
    nameLabel: TLabel;
    cardType: TLabel;
    cardBalance: TLabel;
    cardNumberLabel: TLabel;
    checkAccountStatementPanel: TPanel;
    transactionMonthPanel: TPanel;
    transactionPanel: TPanel;
    transactionLabel: TLabel;
    transactionMonthLabel: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  checkAccountStatementForm: TcheckAccountStatementForm;

implementation

{$R *.dfm}

end.
