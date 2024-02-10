inherited dmLogin: TdmLogin
  inherited DB: TFDConnection
    Params.Strings = (
      'Database=DbInfoliga'
      'User_Name=sa'
      'Password=B@bingthon'
      'DriverID=MSSQL'
      'Server=127.0.0.1')
  end
  object QryLogin: TFDQuery
    Connection = DB
    SQL.Strings = (
      'SELECT idusuario, nm_usuario, pws, ativo FROM USUARIO'
      'WHERE IDUSUARIO = :USUARIO'
      'AND PWS = :SENHA'
      ''
      ''
      ''
      ''
      '')
    Left = 216
    Top = 120
    ParamData = <
      item
        Name = 'USUARIO'
        ParamType = ptInput
      end
      item
        Name = 'SENHA'
        ParamType = ptInput
      end>
    object QryLoginidusuario: TStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QryLoginnm_usuario: TStringField
      FieldName = 'nm_usuario'
      Origin = 'nm_usuario'
      Required = True
      Size = 80
    end
    object QryLoginpws: TStringField
      FieldName = 'pws'
      Origin = 'pws'
      Size = 255
    end
    object QryLoginativo: TStringField
      FieldName = 'ativo'
      Origin = 'ativo'
      FixedChar = True
      Size = 1
    end
  end
end
