unit LoginScreen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, CreateTransactionSetCardNumber,
  Vcl.ExtCtrls, Account, HttpRest, Enums, RegularExpressions, SignUpScreen;

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
  signUpForm: TSignUpForm;
begin
  if (EmailTF.Text = '') or (PasswordTF.Text = '') then
  begin
    ShowMessage('Faltan campos por completar.');
    exit;
  end;
  if not TRegEx.IsMatch(EmailTF.Text, '^[a-zA-Z0-9_]+@[a-zA-Z0-9]+.[a-zA-Z]+$') then
  begin
    ShowMessage('Debes introducir datos válidos.');
    exit;
  end;
  account := TAccount.Create(EmailTF.Text, PasswordTF.Text);
  try
    account.Load;
    TAccount.Current := account;
    if account.Role = ROLE_TYPE.CASHIER then
    begin
      createTransactionForm := TCreateTransactionSetCardNumberForm.Create(nil);
      createTransactionForm.ShowModal;
      createTransactionForm.Release;
    end
    else if account.Role = ROLE_TYPE.EXECUTIVE then
    begin
      signUpForm := TSignUpForm.Create(nil);
      signUpForm.ShowModal;
      signUpForm.Release;
    end;
  except
    on ex: Exception do begin
      ShowMessage(ex.Message);
    end;
  end;
end;

end.
