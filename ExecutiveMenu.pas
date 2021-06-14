unit ExecutiveMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,SignUpScreen, Account, CheckAccount;

type
  TExecutiveMenuForm = class(TForm)
    bankSystemPanel: TPanel;
    AccountNameLabel: TLabel;
    SignUpButton: TButton;
    CheckAccountButton: TButton;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure SignUpButtonClick(Sender: TObject);
    procedure CheckAccountButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ExecutiveMenuForm: TExecutiveMenuForm;

implementation

{$R *.dfm}

procedure TExecutiveMenuForm.FormCreate(Sender: TObject);
begin
  if TAccount.Current <> nil then
    AccountNameLabel.Caption := AccountNameLabel.Caption + TAccount.Current.Name;
end;

procedure TExecutiveMenuForm.SignUpButtonClick(Sender: TObject);
var
  signUpForm: TSignUpForm;
begin
  signUpForm := TSignUpForm.Create(nil);
  signUpForm.ShowModal;
  signUpForm.Release;
end;

procedure TExecutiveMenuForm.CheckAccountButtonClick(Sender: TObject);
var
  checkAccountForm: TCheckAccountForm;
begin
  checkAccountForm := TCheckAccountForm.Create(nil);
  checkAccountForm.ShowModal;
  checkAccountForm.Release;
end;

end.
