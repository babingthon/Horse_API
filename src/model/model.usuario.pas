unit model.usuario;

interface

  uses
    System.SysUtils, System.Classes, model.con, FireDAC.Stan.Intf,
    FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
    FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
    FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.ConsoleUI.Wait, Data.DB,
    FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
    FireDAC.DApt, FireDAC.Comp.DataSet, System.JSON, DataSet.Serialize;

  type
    TdmUsuario = class(TdmCon)
      QryUsuario: TFDQuery;
      QryUsuarioidusuario: TStringField;
      QryUsuarionm_usuario: TStringField;
      QryUsuariopws: TStringField;
      QryUsuariosetor: TStringField;
      QryUsuarioemail: TStringField;
      QryUsuariocriptografado: TStringField;
      QryUsuarioativo: TStringField;
      QryUsuariotipo_usuario: TStringField;
      QryUsuariopws_web: TStringField;
      QryUsuarioperfil_web: TMemoField;
      QryUsuariousr_cadastro: TStringField;
      QryUsuariodt_cadastrado: TSQLTimeStampField;
      QryUsuarioestacao_cadastro: TStringField;
      QryUsuariousr_alteracao: TStringField;
      QryUsuariodt_alteracao: TSQLTimeStampField;
      QryUsuarioestacao_alteracao: TStringField;
      private
        { Private declarations }
      public
        function Post(ABody: TJSONObject): TJSONObject;
        function Get(AIdUsuario: string): TJSONObject;
        { Public declarations }
    end;

  var
    dmUsuario: TdmUsuario;

implementation

  {%CLASSGROUP 'System.Classes.TPersistent'}
  {$R *.dfm}
  { TdmUsuario }

  function TdmUsuario.Get(AIdUsuario: string): TJSONObject;
    begin

      QryUsuario.SQL.Add(' where idusuario = :usuario');
      QryUsuario.ParamByName('usuario').Value := AIdUsuario;
      QryUsuario.Open;

      Result := QryUsuario.ToJSONObject;

    end;

  function TdmUsuario.Post(ABody: TJSONObject): TJSONObject;
    begin

      QryUsuario.Open;
      QryUsuario.LoadFromJSON(ABody);

      Result := QryUsuario.ToJSONObject;

    end;

end.
