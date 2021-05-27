unit SignUpScreen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, RegisterCard,
  Vcl.ExtCtrls, Account, HttpRest, Enums, RegularExpressions;

type
  TSignUpForm = class(TForm)
    BankSystemPanel: TPanel;
    NombreLabel: TLabel;
    NombreTF: TEdit;
    ApellidoLabel: TLabel;
    ApellidoTF: TEdit;
    FechaNacimientoLabel: TLabel;
    FechaNacimientoTF: TEdit;
    TelefonoCelularLabel: TLabel;
    TelefonoCelularTF: TEdit;
    CorreoLabel: TLabel;
    CorreoTF: TEdit;
    ColoniaLabel: TLabel;
    ColoniaTF: TEdit;
    CodigoPostalLabel: TLabel;
    CodigoPostalTF: TEdit;
    NombreUsuarioLabel: TLabel;
    NombreUsuarioTF: TEdit;
    CrearCuentaBttn: TButton;
    ContraseñaLabel: TLabel;
    ContraseñaTF: TEdit;
    CalleLabel: TLabel;
    CalleTF: TEdit;
    NumeroIntLabel: TLabel;
    NumeroIntTF: TEdit;
    NumeroExtLabel: TLabel;
    NumeroExtTF: TEdit;
    TelefonoCasaLabel: TLabel;
    TelefonoCasaTF: TEdit;
    procedure CrearCuentaBttnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SignUpForm: TSignUpForm;

implementation

{$R *.dfm}

procedure TSignUpForm.CrearCuentaBttnClick(Sender: TObject);
var
  account: TAccount;
  RegisterCardForm: TRegisterCardForm;
begin
   if (NombreTF.Text = '') or (ApellidoTF.Text = '') or(FechaNacimientoTF.Text = '') or (CorreoTF.Text = '') or (ColoniaTF.Text = '') or (CodigoPostalTF.Text = '') or (NombreUsuarioTF.Text = '') or (ContraseñaTF.Text ='') or (CalleTF.Text = '') or (NumeroExtTF.Text = '') or (TelefonoCasaTF.Text = '')then
  begin
    ShowMessage('Faltan campos por completar.');
    exit;
  end;
  if not TRegEx.IsMatch(CorreoTF.Text,'[a-zA-Z0-9_]+@[a-zA-Z0-9]+.[a-zA-Z]+$')
  and not TRegEx.IsMatch(NombreTF.Text,'[a-zA-Z0-9_]+@[a-zA-Z0-9]+.[a-zA-Z]+$')
  and not TRegEx.IsMatch(ApellidoTF.Text,'[a-zA-Z0-9_]+@[a-zA-Z0-9]+.[a-zA-Z]+$')
  and not TRegEx.IsMatch(FechaNacimientoTF.Text,'[a-zA-Z0-9_]+@[a-zA-Z0-9]+.[a-zA-Z]+$')
  and not TRegEx.IsMatch(TelefonoCelularTF.Text,'[a-zA-Z0-9_]+@[a-zA-Z0-9]+.[a-zA-Z]+$')
  and not TRegEx.IsMatch(ColoniaTF.Text,'[a-zA-Z0-9_]+@[a-zA-Z0-9]+.[a-zA-Z]+$')
  and not TRegEx.IsMatch(CodigoPostalTF.Text,'[a-zA-Z0-9_]+@[a-zA-Z0-9]+.[a-zA-Z]+$')
  and not TRegEx.IsMatch(NombreUsuarioTF.Text,'[a-zA-Z0-9_]+@[a-zA-Z0-9]+.[a-zA-Z]+$')
  and not TRegEx.IsMatch(CalleTF.Text,'[a-zA-Z0-9_]+@[a-zA-Z0-9]+.[a-zA-Z]+$')
  and not TRegEx.IsMatch(NumeroExtTF.Text,'[a-zA-Z0-9_]+@[a-zA-Z0-9]+.[a-zA-Z]+$')
  and not TRegEx.IsMatch(NumeroIntTF.Text,'[a-zA-Z0-9_]+@[a-zA-Z0-9]+.[a-zA-Z]+$')
  and not TRegEx.IsMatch(TelefonoCasaTF.Text,'[a-zA-Z0-9_]+@[a-zA-Z0-9]+.[a-zA-Z]+$') then
begin
    ShowMessage('Debes introducir datos válidos.');
    exit;
  end;
  account := TAccount.Register(CorreoTF.Text,NombreTF.Text,ApellidoTF.Text,FechaNacimientoTF.Text,TelefonoCelularTF.Text,ColoniaTF.Text,CodigoPostalTF.Text, NombreUsuarioTF.Text, ContraseñaTF.Text, CalleTF.Text, NumeroExtTF.Text, NumeroIntTF.Text, TelefonoCasaTF.Text);
end;
end.
