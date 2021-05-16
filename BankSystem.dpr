program BankSystem;

uses
  Vcl.Forms,
  LoginScreen in 'LoginScreen.pas' {LoginForm},
  CreateTransactionSetCardNumber in 'CreateTransactionSetCardNumber.pas' {CreateTransactionSetCardNumberForm},
  CreateTransactionSelectType in 'CreateTransactionSelectType.pas' {CreateTransactionSelectTypeForm},
  Cards in 'Models\Cards.pas',
  Transaction in 'Models\Transaction.pas',
  HttpRest in 'Network\HttpRest.pas',
  CreateTransactionDeposit in 'CreateTransactionDeposit.pas' {CreateTransactionDepositForm},
  CreateTransactionWithdraw in 'CreateTransactionWithdraw.pas' {CreateTransactionWithdrawForm},
  CreateTransactionMonthlyPayment in 'CreateTransactionMonthlyPayment.pas' {CreateTransactionMonthlyPaymentForm},
  SignUpScreen in 'SignUpScreen.pas' {SignUpForm},
  RegisterCard in 'RegisterCard.pas' {RegisterCardForm},
  CheckAccount in 'CheckAccount.pas' {CheckAccountForm},
  CheckAccountStatement in 'CheckAccountStatement.pas' {checkAccountStatementForm},
  CheckAccountStatementSelectionProcess in 'CheckAccountStatementSelectionProcess.pas' {checkAccountStatementSelectionProcessForm},
  Account in 'Models\Account.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TLoginForm, LoginForm);
  Application.CreateForm(TCreateTransactionSetCardNumberForm, CreateTransactionSetCardNumberForm);
  Application.CreateForm(TCreateTransactionSelectTypeForm, CreateTransactionSelectTypeForm);
  Application.CreateForm(TCreateTransactionDepositForm, CreateTransactionDepositForm);
  Application.CreateForm(TCreateTransactionWithdrawForm, CreateTransactionWithdrawForm);
  Application.CreateForm(TCreateTransactionMonthlyPaymentForm, CreateTransactionMonthlyPaymentForm);
  Application.CreateForm(TSignUpForm, SignUpForm);
  Application.CreateForm(TRegisterCardForm, RegisterCardForm);
  Application.CreateForm(TCheckAccountForm, CheckAccountForm);
  Application.CreateForm(TcheckAccountStatementForm, checkAccountStatementForm);
  Application.CreateForm(TcheckAccountStatementSelectionProcessForm, checkAccountStatementSelectionProcessForm);
  Application.Run;
end.
