unit model.login;

interface

  uses
    System.SysUtils, System.Classes, model.con, FireDAC.Stan.Intf,
    FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
    FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
    FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.ConsoleUI.Wait,
    FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
    FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.JSON, DataSet.Serialize;

  type
    TdmLogin = class(TdmCon)
      QryLogin: TFDQuery;
      QryLoginidusuario: TStringField;
      QryLoginnm_usuario: TStringField;
      QryLoginpws: TStringField;
      QryLoginativo: TStringField;
      private
        { Private declarations }
      public
        function login(ABody: TJSONObject): TJSONObject;
        { Public declarations }
    end;

  var
    dmLogin: TdmLogin;

implementation

  {%CLASSGROUP 'System.Classes.TPersistent'}
  {$R *.dfm}
  { TdmLogin }

  function TdmLogin.login(ABody: TJSONObject): TJSONObject;
    begin
      QryLogin.Close;
      QryLogin.ParamByName('USUARIO').Value := ABody.GetValue<string>('login');
      QryLogin.ParamByName('SENHA').Value := ABody.GetValue<string>('senha');
      QryLogin.Open;

      Result := QryLogin.ToJSONObject;
    end;

end.
