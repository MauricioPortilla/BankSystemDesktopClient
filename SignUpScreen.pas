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
    CrearCuentaBtn: TButton;
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
    procedure CrearCuentaBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SignUpForm: TSignUpForm;

implementation

{$R *.dfm}

procedure TSignUpForm.CrearCuentaBtnClick(Sender: TObject);
var
  account: TAccount;
  registerCardForm: TRegisterCardForm;
begin
  if (NombreTF.Text = '') or (ApellidoTF.Text = '') or(FechaNacimientoTF.Text = '') or (CorreoTF.Text = '') or (ColoniaTF.Text = '') or (CodigoPostalTF.Text = '') or (NombreUsuarioTF.Text = '') or (ContraseñaTF.Text ='') or (CalleTF.Text = '') or (NumeroExtTF.Text = '') or (TelefonoCasaTF.Text = '')then
  begin
    ShowMessage('Faltan campos por completar.');
    exit;
  end;
  if not TRegEx.IsMatch(CorreoTF.Text,'[a-zA-Z0-9_]+@[a-zA-Z0-9]+.[a-zA-Z]+$')
    and not TRegEx.IsMatch(NombreTF.Text,'[a-zA-Záéíóú ]+$')
    and not TRegEx.IsMatch(ApellidoTF.Text,'[a-zA-Záéíóú ]+$')
    and not TRegEx.IsMatch(FechaNacimientoTF.Text,'[0-9]{2}\/[0-9]{2}\/[0-9]{4}$')
    and ((TelefonoCelularTF.Text <> '') and (not TRegEx.IsMatch(TelefonoCelularTF.Text,'[0-9]{10}$')))
    and not TRegEx.IsMatch(ColoniaTF.Text,'[a-zA-Z0-9áéíóú ]+$')
    and not TRegEx.IsMatch(CodigoPostalTF.Text,'[0-9]{5,6}$')
    and not TRegEx.IsMatch(NombreUsuarioTF.Text,'[a-zA-Z0-9_]+$')
    and not TRegEx.IsMatch(CalleTF.Text,'[a-zA-Z0-9áéíóú ]+$')
    and not TRegEx.IsMatch(NumeroExtTF.Text,'[0-9]+$')
    and ((NumeroIntTF.Text <> '') and not (TRegEx.IsMatch(NumeroIntTF.Text,'[0-9]+$')))
    and not TRegEx.IsMatch(TelefonoCasaTF.Text,'[0-9]{10}$') then
  begin
    ShowMessage('Debes introducir datos válidos.');
    exit;
  end;
  try
    account := TAccount.Create(
      CorreoTF.Text,
      NombreTF.Text,
      ApellidoTF.Text,
      FechaNacimientoTF.Text,
      TelefonoCelularTF.Text,
      ColoniaTF.Text,
      CalleTF.Text,
      NumeroIntTF.Text,
      NumeroExtTF.Text,
      TelefonoCasaTF.Text,
      CodigoPostalTF.Text,
      NombreUsuarioTF.Text,
      ContraseñaTF.Text
    );
    account.Register;
    registerCardForm := TRegisterCardForm.Create(Application, account);
    registerCardForm.ShowModal;
    registerCardForm.Release;
  except
    on ex: Exception do begin
      ShowMessage(ex.Message);
    end;
  end;
end;
end.
