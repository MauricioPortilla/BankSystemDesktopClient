unit CheckAccountStatementSelectionProcess;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TcheckAccountStatementSelectionProcessForm = class(TForm)
    bankSystemPanel: TPanel;
    bankSystemLabel: TLabel;
    welcomeLabel: TLabel;
    nameLabel: TLabel;
    checkAccountStatementPanel: TPanel;
    accountComboBox: TComboBox;
    yearComboBox: TComboBox;
    monthComboBox: TComboBox;
    acceptButton: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  checkAccountStatementSelectionProcessForm: TcheckAccountStatementSelectionProcessForm;

implementation

{$R *.dfm}

end.
