program BankSystem;

uses
  Vcl.Forms,
  LoginScreen in 'LoginScreen.pas' {LoginForm},
  CreateTransactionSetCardNumber in 'CreateTransactionSetCardNumber.pas' {CreateTransactionSetCardNumberForm},
  CreateTransactionSelectType in 'CreateTransactionSelectType.pas' {CreateTransactionSelectTypeForm},
  Cards in 'Models\Cards.pas',
  Transaction in 'Models\Transaction.pas',
  HttpRest in 'Network\HttpRest.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TLoginForm, LoginForm);
  Application.CreateForm(TCreateTransactionSetCardNumberForm, CreateTransactionSetCardNumberForm);
  Application.CreateForm(TCreateTransactionSelectTypeForm, CreateTransactionSelectTypeForm);
  Application.Run;
end.
