unit controller.usuario;

interface

  uses Horse, System.JSON, model.usuario, System.SysUtils, controller.jwt,
    Horse.jwt;

  procedure usuario;
  procedure Post(Req: THorseRequest; Res: THorseResponse);
  procedure Get(Req: THorseRequest; Res: THorseResponse);

implementation

  procedure usuario;
    begin
      THorse
      .AddCallback(HorseJWT(controller.jwt.JwtPassword))
      .Get('/usuario/:idusuario', Get);

      THorse
      .AddCallback(HorseJWT(controller.jwt.JwtPassword))
      .Post('/usuario', Post);
    end;

  procedure Post(Req: THorseRequest; Res: THorseResponse);
    var
      LDmUsuario: TdmUsuario;
    begin
      try
        LDmUsuario := TdmUsuario.Create(nil);

        try

          Res.Send<TJSONObject>
          (LDmUsuario.Post(TJSONObject.ParseJSONValue(Req.Body)
              as TJSONObject));

        finally
          Res.Status(201);
          FreeAndNil(LDmUsuario);
        end;

      except
        on e: exception do
          begin
            Res.Send(e.Message).Status(400);
            FreeAndNil(LDmUsuario);
          end;

      end;

    end;

  procedure Get(Req: THorseRequest; Res: THorseResponse);
    var
      LDmUsuario: TdmUsuario;
    begin
      try
        LDmUsuario := TdmUsuario.Create(nil);

        try

          Res.Send<TJSONObject>(LDmUsuario.Get(Req.Params.Items['idusuario']));

        finally
          Res.Status(200);
          FreeAndNil(LDmUsuario);
        end;

      except
        on e: exception do
          begin
            Res.Send(e.Message).Status(400);
            FreeAndNil(LDmUsuario);
          end;

      end;

    end;

end.
