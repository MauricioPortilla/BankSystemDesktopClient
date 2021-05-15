unit Transaction;

interface

uses
  Enums, HttpRest, System.Classes, System.JSON, System.SysUtils;

type
  TTransaction = class
    private
      _cardId: integer;
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
        const cardId: integer;
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
  const cardId: integer;
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
  _cardId := cardId;
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
  resource: string;
  postResult: THttpResponse;
begin
  params := TJSONObject.Create;
  params.AddPair('originCardId', '');
  params.AddPair('amount', _amount.ToString);
  params.AddPair('reference', _reference);
  params.AddPair('concept', _concept);
  params.AddPair('status', integer(_status).ToString);
  if _type = TRANSACTION_TYPE.DEPOSIT then
    resource := 'deposit'
  else if _type = TRANSACTION_TYPE.WITHDRAWAL then
    resource := 'withdraw'
  else if _type = TRANSACTION_TYPE.MONTHLY_PAYMENT then
    resource := 'monthlyPayment';
  try
    postResult := THttpRest.SendPost('/card/' + _cardId.ToString + '/transaction/' + resource, params);
    Result := postResult.Success;
  except
    Result := false;
  end;
end;

end.
