unit SignUpScreen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TSignUpForm = class(TForm)
    BankSystemPanel: TPanel;
    NombreLabel: TLabel;
    NombreTF: TEdit;
    ApellidoPaternoLabel: TLabel;
    ApellidoPatertoTF: TEdit;
    ApellidoMaternoLabel: TLabel;
    ApellidoMaternoTF: TEdit;
    FechaNacimientoLabel: TLabel;
    FechaNacimientoTF: TEdit;
    TelefonoLabel: TLabel;
    TelefonoTF: TEdit;
    CorreoLabel: TLabel;
    CorreoTF: TEdit;
    DireccionLabel: TLabel;
    DireccionTF: TEdit;
    CodigoPostalLabel: TLabel;
    CodigoPostalTF: TEdit;
    NombreUsuarioLabel: TLabel;
    NombreUsuarioTF: TEdit;
    CrearCuentaBttn: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SignUpForm: TSignUpForm;

implementation

{$R *.dfm}

end.
