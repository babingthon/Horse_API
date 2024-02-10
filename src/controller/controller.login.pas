unit controller.login;

interface

  uses Horse, model.login, System.JSON, System.SysUtils, Horse.JWT,
    JOSE.Core.JWT, JOSE.Core.Builder,
    System.DateUtils, controller.JWT;

  procedure login;
  procedure Get(Req: THorseRequest; Res: THorseResponse; Next: TProc);

  function CriarToken(AIdUsuario: string): string;

implementation

  procedure login;
    begin
      Thorse.Get('/login', Get);
    end;

  procedure Get(Req: THorseRequest; Res: THorseResponse; Next: TProc);
    var
      LDmLogin: TDmLogin;
      LJson: TJSONObject;
    begin
      try
        LDmLogin := TDmLogin.Create(nil);

        try

          LJson := LDmLogin.login(TJSONObject.ParseJSONValue(Req.Body)
            as TJSONObject);

          LJson.AddPair('jwt', CriarToken(LJson.GetValue<string>('idusuario')));

          Res.Send<TJSONObject>(LJson);

        finally
          Res.Status(200);
          FreeAndNil(LDmLogin);
        end;

      except
        on e: exception do
          begin
            Res.Send(e.Message).Status(400);
            FreeAndNil(LDmLogin);
          end;

      end;

    end;

  function CriarToken(AIdUsuario: string): string;
    var
      LJWT: TJWT;
      LToken: String;
      LClaims: TMyClaims;
    begin
      LJWT := TJWT.Create();
      try

        LClaims := TMyClaims(LJWT.Claims);
        LJWT.Claims.Expiration := IncHour(Now, 1);
        LClaims.Id := AIdUsuario;

        LToken := TJOSE.SHA256CompactToken(controller.JWT.JwtPassword, LJWT);
      finally
        FreeAndNil(LJWT);
      end;

      Result := LToken;
    end;

end.
