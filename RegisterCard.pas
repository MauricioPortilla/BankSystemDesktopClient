unit RegisterCard;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TRegisterCardForm = class(TForm)
    SystemBankPanel: TPanel;
    ChooseCardLabel: TLabel;
    TarjetaDebitoBttn: TButton;
    TarjetaCreditoBttn: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RegisterCardForm: TRegisterCardForm;

implementation

{$R *.dfm}

end.
