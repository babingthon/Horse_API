inherited dmUsuario: TdmUsuario
  object QryUsuario: TFDQuery
    Connection = DB
    SQL.Strings = (
      'select * from usuario')
    Left = 216
    Top = 112
    object QryUsuarioidusuario: TStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QryUsuarionm_usuario: TStringField
      FieldName = 'nm_usuario'
      Origin = 'nm_usuario'
      Required = True
      Size = 80
    end
    object QryUsuariopws: TStringField
      FieldName = 'pws'
      Origin = 'pws'
      Size = 255
    end
    object QryUsuariosetor: TStringField
      FieldName = 'setor'
      Origin = 'setor'
      Size = 50
    end
    object QryUsuarioemail: TStringField
      FieldName = 'email'
      Origin = 'email'
      Size = 50
    end
    object QryUsuariocriptografado: TStringField
      FieldName = 'criptografado'
      Origin = 'criptografado'
      FixedChar = True
      Size = 1
    end
    object QryUsuarioativo: TStringField
      FieldName = 'ativo'
      Origin = 'ativo'
      FixedChar = True
      Size = 1
    end
    object QryUsuariotipo_usuario: TStringField
      FieldName = 'tipo_usuario'
      Origin = 'tipo_usuario'
      FixedChar = True
      Size = 1
    end
    object QryUsuariopws_web: TStringField
      FieldName = 'pws_web'
      Origin = 'pws_web'
      Size = 50
    end
    object QryUsuarioperfil_web: TMemoField
      FieldName = 'perfil_web'
      Origin = 'perfil_web'
      BlobType = ftMemo
    end
    object QryUsuariousr_cadastro: TStringField
      FieldName = 'usr_cadastro'
      Origin = 'usr_cadastro'
      Size = 50
    end
    object QryUsuariodt_cadastrado: TSQLTimeStampField
      FieldName = 'dt_cadastrado'
      Origin = 'dt_cadastrado'
    end
    object QryUsuarioestacao_cadastro: TStringField
      FieldName = 'estacao_cadastro'
      Origin = 'estacao_cadastro'
      Size = 50
    end
    object QryUsuariousr_alteracao: TStringField
      FieldName = 'usr_alteracao'
      Origin = 'usr_alteracao'
      Size = 50
    end
    object QryUsuariodt_alteracao: TSQLTimeStampField
      FieldName = 'dt_alteracao'
      Origin = 'dt_alteracao'
    end
    object QryUsuarioestacao_alteracao: TStringField
      FieldName = 'estacao_alteracao'
      Origin = 'estacao_alteracao'
      Size = 50
    end
  end
end
