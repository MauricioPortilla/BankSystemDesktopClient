unit RegisterCard;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Account;

type
  TRegisterCardForm = class(TForm)
    SystemBankPanel: TPanel;
    ChooseCardLabel: TLabel;
    TarjetaDebitoBttn: TButton;
    TarjetaCreditoBttn: TButton;
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
end;

procedure TRegisterCardForm.TarjetaCreditoBttnClick(Sender: TObject);
begin
  // TODO: Create credit card and send api request.
end;

procedure TRegisterCardForm.TarjetaDebitoBttnClick(Sender: TObject);
begin
  try
  begin
    _account.RegisterDebitCard;
    ShowMessage('Tarjeta registrada.');
    Close;
  end;
  except
    on ex: Exception do begin
      ShowMessage(ex.Message);
    end;
  end;
end;

end.
