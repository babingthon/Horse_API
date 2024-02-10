program ServidorHorse;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  Horse,
  Horse.Jhonson,
  Horse.JWT,
  controller.login in 'src\controller\controller.login.pas',
  model.con in 'src\model\model.con.pas' {dmCon: TDataModule},
  model.login in 'src\model\model.login.pas',
  System.SysUtils {dmLogin: TDataModule},
  controller.jwt in 'src\controller\controller.jwt.pas',
  controller.usuario in 'src\controller\controller.usuario.pas',
  model.usuario in 'src\model\model.usuario.pas' {dmUsuario: TDataModule};

CONST PortaServidor = 9000;
begin

  Writeln('SERVIDOR RODANDO NA PORTA: ' + IntToStr(PortaServidor));

  THorse.Use(Jhonson());

  controller.login.login;
  controller.usuario.usuario;

  THorse.Listen(PortaServidor);

end.
