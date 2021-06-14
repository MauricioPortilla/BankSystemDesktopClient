unit RegisterCard;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Account, RegisterCardFinish,
  Cards;

type
  TRegisterCardForm = class(TForm)
    ChooseCardLabel: TLabel;
    TarjetaDebitoBttn: TButton;
    TarjetaCreditoBttn: TButton;
    BankSystemPanel: TPanel;
    Label4: TLabel;
    AccountNameLabel: TLabel;
    procedure TarjetaDebitoBttnClick(Sender: TObject);
    procedure TarjetaCreditoBttnClick(Sender: TObject);
  private
    _account: TAccount;
  public
    constructor Create(AOwner: TComponent; account: TAccount); reintroduce; overload;
  end;

var
  RegisterCardForm: TRegisterCardForm;

implementation

{$R *.dfm}

constructor TRegisterCardForm.Create(AOwner: TComponent; account: TAccount);
begin
  inherited Create(AOwner);
  _account := account;
  if TAccount.Current <> nil then
    AccountNameLabel.Caption := AccountNameLabel.Caption + TAccount.Current.Name;
end;

procedure TRegisterCardForm.TarjetaCreditoBttnClick(Sender: TObject);
var
  form: TRegisterCardFinishForm;
  card: TCreditCard;
begin
  try
  begin
    card := _account.RegisterCreditCard;
    form := TRegisterCardFinishForm.Create(Application, card);
    form.ShowModal;
    form.Release;
    Close;
  end;
  except
    on ex: Exception do begin
      ShowMessage(ex.Message);
    end;
  end;
end;

procedure TRegisterCardForm.TarjetaDebitoBttnClick(Sender: TObject);
var
  form: TRegisterCardFinishForm;
  card: TDebitCard;
begin
  try
  begin
    card := _account.RegisterDebitCard;
    form := TRegisterCardFinishForm.Create(Application, card);
    form.ShowModal;
    form.Release;
    Close;
  end;
  except
    on ex: Exception do begin
      ShowMessage(ex.Message);
    end;
  end;
end;
end.
