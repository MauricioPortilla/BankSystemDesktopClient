unit HttpRest;

interface

uses
  System.JSON, IdHTTP;

type
  THttpRest = class abstract
    public
      class function SendPost(const resource: string; const jsonData: TJsonObject): string;
  end;

implementation

class function THttpRest.SendPost(const resource: string; const jsonData: TJSONObject): string;
var
  http: TIdHTTP;
  apiUrl: string;
begin
  apiUrl := 'http://localhost/api/v1';
  http := TIdHttp.Create;
  http.Request.ContentType := 'application/json';
  http.Request.CustomHeaders.AddValue('Authorization', 'JWT TOKEN HERE');
  try
    Result := http.Post(apiUrl + resource, jsonData.ToString);
  finally
    http.Free;
    jsonData.Free;
  end;
end;

end.
