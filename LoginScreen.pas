unit LoginScreen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, CreateTransactionSetCardNumber,
  Vcl.ExtCtrls;

type
  TLoginForm = class(TForm)
    LoginButton: TButton;
    correoElectronicoLabel: TLabel;
    CorreoTF: TEdit;
    ContraseñaLabel: TLabel;
    ContraseñaTF: TEdit;
    BankSystemPanel: TPanel;
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
  createTransactionForm: TCreateTransactionSetCardNumberForm;
begin
  createTransactionForm := TCreateTransactionSetCardNumberForm.Create(nil);
  createTransactionForm.ShowModal;
  createTransactionForm.Release;
end;

end.
