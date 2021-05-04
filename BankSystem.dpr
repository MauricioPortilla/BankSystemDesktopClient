program BankSystem;

uses
  Vcl.Forms,
  LoginScreen in 'LoginScreen.pas' {LoginForm},
  CreateTransactionSetCardNumber in 'CreateTransactionSetCardNumber.pas' {CreateTransactionSetCardNumberForm},
  CreateTransactionSelectType in 'CreateTransactionSelectType.pas' {CreateTransactionSelectTypeForm},
  Models in 'Models.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TLoginForm, LoginForm);
  Application.CreateForm(TCreateTransactionSetCardNumberForm, CreateTransactionSetCardNumberForm);
  Application.CreateForm(TCreateTransactionSelectTypeForm, CreateTransactionSelectTypeForm);
  Application.Run;
end.
