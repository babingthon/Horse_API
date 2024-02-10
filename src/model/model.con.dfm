object dmCon: TdmCon
  Height = 275
  Width = 359
  object DB: TFDConnection
    Params.Strings = (
      'Database=banco_teste'
      'Password=B@bingthon'
      'MetaDefCatalog='
      'MetaDefSchema='
      'User_Name=usr'
      'ConnectionDef=MSSQL_Demo')
    LoginPrompt = False
    Left = 152
    Top = 120
  end
end
