unit Transaction;

interface

uses
  Enums, HttpRest, System.Classes, System.JSON, System.SysUtils;

type
  TTransaction = class
    private
      _type: TRANSACTION_TYPE;
      _createdAt: TDateTime;
      _amount: double;
      _reference: string;
      _concept: string;
      _interestRate: double;
      _surchargeRate: double;
      _status: TRANSACTION_STATUS;
    public
      constructor Create(
        const transactionType: TRANSACTION_TYPE;
        const createdAt: TDateTime;
        const amount: double;
        const reference: string;
        const concept: string;
        const interestRate: double;
        const surchargeRate: double;
        const status: TRANSACTION_STATUS
      );
      function Save(): boolean;
  end;

implementation

constructor TTransaction.Create(
  const transactionType: TRANSACTION_TYPE;
  const createdAt: TDateTime;
  const amount: double;
  const reference: string;
  const concept: string;
  const interestRate: double;
  const surchargeRate: double;
  const status: TRANSACTION_STATUS
);
begin
  _type := transactionType;
  _createdAt := createdAt;
  _amount := amount;
  _reference := reference;
  _concept := concept;
  _interestRate := interestRate;
  _surchargeRate := surchargeRate;
  _status := status;
end;

function TTransaction.Save(): boolean;
var
  params: TJSONObject;
  postResult: string;
begin
  params := TJSONObject.Create;
  params.AddPair('createdAt', FormatDateTime('yyyy-mm-dd hh:nn:ss', _createdAt));
  params.AddPair('amount', _amount.ToString);
  params.AddPair('reference', _reference);
  params.AddPair('concept', _concept);
  params.AddPair('interestRate', _interestRate.ToString);
  params.AddPair('surchargeRate', _surchargeRate.ToString);
  params.AddPair('status', integer(_status).ToString);
  postResult := THttpRest.SendPost('/transaction/create', params);
  writeln(postResult);
  Result := true;
end;

end.
