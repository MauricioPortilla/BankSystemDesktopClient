unit LoginScreen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, CreateTransactionSetCardNumber,
  Vcl.ExtCtrls, Account, HttpRest;

type
  TLoginForm = class(TForm)
    LoginButton: TButton;
    EmailLabel: TLabel;
    EmailTF: TEdit;
    PasswordLabel: TLabel;
    PasswordTF: TEdit;
    BankSystemPanel: TPanel;
    Label2: TLabel;
    procedure LoginButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LoginForm: TLoginForm;

implementation

{$R *.dfm}

procedure TLoginForm.LoginButtonClick(Sender: TObject);
var
  account: TAccount;
  createTransactionForm: TCreateTransactionSetCardNumberForm;
begin
  // TODO: VALIDATE FIELDS DATA.
  account := TAccount.Create(EmailTF.Text, PasswordTF.Text);
  if account.Load then
  begin
    TAccount.Current := account;
    createTransactionForm := TCreateTransactionSetCardNumberForm.Create(nil);
    createTransactionForm.ShowModal;
    createTransactionForm.Release;
  end
  else
    // TODO: Improve Load method to check if the error occurred because of bad password or server error.
    ShowMessage('Ocurrió un error al realizar esta acción.');
end;

end.
