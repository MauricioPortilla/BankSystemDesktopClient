unit Account;

interface

uses
  System.JSON, HttpRest;

type
  TRole = class
    private
      _id: integer;
      _name: string;
    public
      constructor Create(const id: integer; const name: string);
  end;

  TAccount = class
    private
      _id: integer;
      _name: string;
      _lastName: string;
      _email: string;
      _password: string;
      _role: TRole;
    public
      class var Current: TAccount;
      property Name: string read _name;
      constructor Create(
        const email: string;
        const password: string
      );
      function Load(): boolean;
  end;

implementation

constructor TRole.Create(const id: Integer; const name: string);
begin
  _id := id;
  _name := name;
end;

constructor TAccount.Create(const email: string; const password: string);
begin
  _email := email;
  _password := password;
end;

function TAccount.Load(): boolean;
var
  params: TJSONObject;
  postResult: THttpResponse;
  accountData: TJSONValue;
  accountRoleData: TJSONValue;
begin
  params := TJSONObject.Create;
  params.AddPair('email', _email);
  params.AddPair('password', _password);
  try
    postResult := THttpRest.SendPost('/account/login', params);
    accountData := postResult.Data.FindValue('account');
    accountRoleData := accountData.FindValue('role');
    _id := integer(accountData.FindValue('accountId').Value);
    _name := accountData.FindValue('name').Value;
    _lastName := accountData.FindValue('lastName').Value;
    _role := TRole.Create(
      integer(accountRoleData.FindValue('roleId').Value),
      accountRoleData.FindValue('name').Value
    );
    THttpRest.Token := 'Bearer ' + postResult.Data.FindValue('token').FindValue('access_token').Value;
    Result := true;
  except
    Result := false;
  end;

end;

end.
