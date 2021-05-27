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
      _nombre: string;
      _correo: string;
      _apellido: string;
      _fechaNacimiento: string;
      _telefonoCelular: string;
      _colonia: string;
      _calle: string;
      _numeroInt: string;
      _numeroExt: string;
      _codigoPostal: string;
      _nombreUsuario: string;
      _telefonoCasa: string;
      _contraseña: string;
      _role: ROLE_TYPE;
    public
      class var Current: TAccount;
      property Name: string read _name;
      property Role: ROLE_TYPE read _role;
      constructor Create(
        const email: string;
        const password: string
      );

      constructor Register(
        const correo: string;
        const nombre: string;
        const apellido: string;
        const fechaNacimiento: string;
        const telefonoCelular: string;
        const colonia: string;
        const calle: string;
        const numeroInt: string;
        const numeroExt: string;
        const telefonoCasa: string;
        const codigoPostal: string;
        const nombreUsuario: string;
        const contraseña: string
      );
   procedure Load;
  end;

implementation

constructor TAccount.Create(const email: string; const password: string);
begin
  _email := email;
  _password := password;
end;

constructor TAccount.Register(const correo:string; const nombre: string; const apellido: string; const fechaNacimiento: string; const telefonoCelular: string; const colonia: string; const calle: string; const numeroInt: string; const numeroExt: string; const telefonoCasa: string; const codigoPostal: string; const nombreUsuario: string; const contraseña: string);
begin
  _nombre := nombre;
  _correo:= correo;
  _apellido:= apellido;
  _fechaNacimiento:= fechaNacimiento;
  _telefonoCelular:= telefonoCelular;
  _colonia:= colonia;
  _calle:= calle;
  _numeroInt:= numeroInt;
  _numeroExt:= numeroExt;
  _codigoPostal:= codigoPostal;
  _nombreUsuario:= nombreUsuario;
  _telefonoCasa := telefonoCasa;
  _contraseña:= contraseña;
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



