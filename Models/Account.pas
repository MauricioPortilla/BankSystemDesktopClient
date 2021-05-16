unit Account;

interface

uses
  System.JSON, HttpRest, Enums, System.SysUtils;

type
  TAccount = class
    private
      _id: integer;
      _name: string;
      _lastName: string;
      _email: string;
      _password: string;
      _role: ROLE_TYPE;
    public
      class var Current: TAccount;
      property Name: string read _name;
      property Role: ROLE_TYPE read _role;
      constructor Create(
        const email: string;
        const password: string
      );
      procedure Load;
  end;

implementation

constructor TAccount.Create(const email: string; const password: string);
begin
  _email := email;
  _password := password;
end;

procedure TAccount.Load();
var
  params: TJSONObject;
  postResult: THttpResponse;
  accountData: TJSONValue;
begin
  params := TJSONObject.Create;
  params.AddPair('email', _email);
  params.AddPair('password', _password);
  postResult := THttpRest.SendPost('/account/login', params);
  accountData := postResult.Data.FindValue('account');
  _id := integer(accountData.FindValue('accountId').Value);
  _name := accountData.FindValue('name').Value;
  _lastName := accountData.FindValue('lastName').Value;
  _role := ROLE_TYPE(StrToInt(accountData.FindValue('role').Value));
  THttpRest.Token := 'Bearer ' + postResult.Data.FindValue('token').FindValue('access_token').Value;
end;

end.
