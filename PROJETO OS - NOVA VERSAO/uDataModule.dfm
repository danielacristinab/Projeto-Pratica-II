object DM: TDM
  OldCreateOrder = False
  Height = 572
  Width = 857
  object DSFornecedores: TDataSource
    Left = 256
    Top = 88
  end
  object DSPaises: TDataSource
    DataSet = qPaises
    Left = 88
    Top = 80
  end
  object DSEstados: TDataSource
    DataSet = qEstados
    Left = 88
    Top = 136
  end
  object DSCidades: TDataSource
    DataSet = qCidades
    Left = 88
    Top = 192
  end
  object DSClientes: TDataSource
    Left = 256
    Top = 32
  end
  object DSFuncionarios: TDataSource
    Left = 256
    Top = 144
  end
  object DSCargos: TDataSource
    Left = 256
    Top = 200
  end
  object DSMarcas: TDataSource
    DataSet = qMarcas
    Left = 424
    Top = 40
  end
  object DSModelos: TDataSource
    DataSet = qModelos
    Left = 424
    Top = 96
  end
  object DSProdutos: TDataSource
    Left = 424
    Top = 152
  end
  object DSGrupos: TDataSource
    DataSet = qGrupos
    Left = 424
    Top = 208
  end
  object DSCondPag: TDataSource
    Left = 160
    Top = 256
  end
  object DSFormaPag: TDataSource
    DataSet = qFormaPag
    Left = 160
    Top = 312
  end
  object Conexao: TIBDatabase
    Connected = True
    DatabaseName = 'C:\BD-PRATICA\PROJETO_OS.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1252')
    LoginPrompt = False
    DefaultTransaction = Trans
    ServerType = 'IBServer'
    Left = 32
    Top = 16
  end
  object Trans: TIBTransaction
    Active = True
    Left = 80
    Top = 16
  end
  object qPaises: TIBDataSet
    Database = Conexao
    Transaction = Trans
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from PAISES'
      'where'
      '  CODPAIS = :OLD_CODPAIS')
    InsertSQL.Strings = (
      'insert into PAISES'
      '  (PAIS, SIGLA, DDI, MOEDA, DATCAD, DATULTALT)'
      'values'
      '  (:PAIS, :SIGLA, :DDI, :MOEDA, :DATCAD, :DATULTALT)')
    RefreshSQL.Strings = (
      'Select '
      '  CODPAIS,'
      '  PAIS,'
      '  SIGLA,'
      '  DDI,'
      '  MOEDA,'
      '  DATCAD,'
      '  DATULTALT'
      'from PAISES '
      'where'
      '  CODPAIS = :CODPAIS')
    SelectSQL.Strings = (
      'select * from PAISES')
    ModifySQL.Strings = (
      'update PAISES'
      'set'
      '  PAIS = :PAIS,'
      '  SIGLA = :SIGLA,'
      '  DDI = :DDI,'
      '  MOEDA = :MOEDA,'
      '  DATCAD = :DATCAD,'
      '  DATULTALT = :DATULTALT'
      'where'
      '  CODPAIS = :OLD_CODPAIS')
    ParamCheck = True
    UniDirectional = False
    Left = 32
    Top = 80
    object qPaisesCODPAIS: TIntegerField
      FieldName = 'CODPAIS'
      Origin = 'PAISES.CODPAIS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qPaisesPAIS: TIBStringField
      FieldName = 'PAIS'
      Origin = 'PAISES.PAIS'
      Required = True
      Size = 50
    end
    object qPaisesSIGLA: TIBStringField
      FieldName = 'SIGLA'
      Origin = 'PAISES.SIGLA'
      Required = True
      Size = 3
    end
    object qPaisesDDI: TIBStringField
      FieldName = 'DDI'
      Origin = 'PAISES.DDI'
      Required = True
      Size = 4
    end
    object qPaisesMOEDA: TIBStringField
      FieldName = 'MOEDA'
      Origin = 'PAISES.MOEDA'
      Required = True
      Size = 3
    end
    object qPaisesDATCAD: TDateField
      FieldName = 'DATCAD'
      Origin = 'PAISES.DATCAD'
    end
    object qPaisesDATULTALT: TDateField
      FieldName = 'DATULTALT'
      Origin = 'PAISES.DATULTALT'
    end
  end
  object qClientes: TIBDataSet
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    UniDirectional = False
    Left = 168
    Top = 32
  end
  object qFornecedores: TIBDataSet
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    UniDirectional = False
    Left = 168
    Top = 88
  end
  object qFuncionarios: TIBDataSet
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    UniDirectional = False
    Left = 168
    Top = 144
  end
  object qCargos: TIBDataSet
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    UniDirectional = False
    Left = 168
    Top = 200
  end
  object qProdutos: TIBDataSet
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    UniDirectional = False
    Left = 360
    Top = 152
  end
  object qCondPag: TIBDataSet
    Database = Conexao
    Transaction = Trans
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from PAISES'
      'where'
      '  CODPAIS = :OLD_CODPAIS')
    InsertSQL.Strings = (
      'insert into PAISES'
      '  (PAIS, SIGLA, DDI, MOEDA, DATCAD, DATULTALT)'
      'values'
      '  (:PAIS, :SIGLA, :DDI, :MOEDA, :DATCAD, :DATULTALT)')
    RefreshSQL.Strings = (
      'Select '
      '  CODPAIS,'
      '  PAIS,'
      '  SIGLA,'
      '  DDI,'
      '  MOEDA,'
      '  DATCAD,'
      '  DATULTALT'
      'from PAISES '
      'where'
      '  CODPAIS = :CODPAIS')
    SelectSQL.Strings = (
      'select * from PAISES')
    ModifySQL.Strings = (
      'update PAISES'
      'set'
      '  PAIS = :PAIS,'
      '  SIGLA = :SIGLA,'
      '  DDI = :DDI,'
      '  MOEDA = :MOEDA,'
      '  DATCAD = :DATCAD,'
      '  DATULTALT = :DATULTALT'
      'where'
      '  CODPAIS = :OLD_CODPAIS')
    ParamCheck = True
    UniDirectional = False
    Left = 88
    Top = 256
    object IntegerField1: TIntegerField
      FieldName = 'CODPAIS'
      Origin = 'PAISES.CODPAIS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBStringField1: TIBStringField
      FieldName = 'PAIS'
      Origin = 'PAISES.PAIS'
      Required = True
      Size = 50
    end
    object IBStringField2: TIBStringField
      FieldName = 'SIGLA'
      Origin = 'PAISES.SIGLA'
      Required = True
      Size = 3
    end
    object IBStringField3: TIBStringField
      FieldName = 'DDI'
      Origin = 'PAISES.DDI'
      Required = True
      Size = 4
    end
    object IBStringField4: TIBStringField
      FieldName = 'MOEDA'
      Origin = 'PAISES.MOEDA'
      Required = True
      Size = 3
    end
    object DateField1: TDateField
      FieldName = 'DATCAD'
      Origin = 'PAISES.DATCAD'
    end
    object DateField2: TDateField
      FieldName = 'DATULTALT'
      Origin = 'PAISES.DATULTALT'
    end
  end
  object qFormaPag: TIBDataSet
    Database = Conexao
    Transaction = Trans
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from FORMASPAGAMENTO'
      'where'
      '  CODFORMAPAG = :OLD_CODFORMAPAG')
    InsertSQL.Strings = (
      'insert into FORMASPAGAMENTO'
      '  (FORMAPAG, DATCAD, DATULTALT)'
      'values'
      '  (:FORMAPAG, :DATCAD, :DATULTALT)')
    RefreshSQL.Strings = (
      'Select '
      '  CODFORMAPAG,'
      '  FORMAPAG,'
      '  DATCAD,'
      '  DATULTALT'
      'from FORMASPAGAMENTO '
      'where'
      '  CODFORMAPAG = :CODFORMAPAG')
    SelectSQL.Strings = (
      'select * from FORMASPAGAMENTO;')
    ModifySQL.Strings = (
      'update FORMASPAGAMENTO'
      'set'
      '  FORMAPAG = :FORMAPAG,'
      '  DATCAD = :DATCAD,'
      '  DATULTALT = :DATULTALT'
      'where'
      '  CODFORMAPAG = :OLD_CODFORMAPAG')
    ParamCheck = True
    UniDirectional = False
    Active = True
    Left = 88
    Top = 312
    object qFormaPagCODFORMAPAG: TIntegerField
      FieldName = 'CODFORMAPAG'
      Origin = 'FORMASPAGAMENTO.CODFORMAPAG'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qFormaPagFORMAPAG: TIBStringField
      FieldName = 'FORMAPAG'
      Origin = 'FORMASPAGAMENTO.FORMAPAG'
      Size = 50
    end
    object qFormaPagDATCAD: TDateField
      FieldName = 'DATCAD'
      Origin = 'FORMASPAGAMENTO.DATCAD'
    end
    object qFormaPagDATULTALT: TDateField
      FieldName = 'DATULTALT'
      Origin = 'FORMASPAGAMENTO.DATULTALT'
    end
  end
  object qCidades: TIBDataSet
    Database = Conexao
    Transaction = Trans
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from CIDADES'
      'where'
      '  CODCIDADE = :OLD_CODCIDADE')
    InsertSQL.Strings = (
      'insert into CIDADES'
      '  (CIDADE, DDD, CODESTADO, DATCAD, DATULTALT)'
      'values'
      '  (:CIDADE, :DDD, :CODESTADO, :DATCAD, :DATULTALT)')
    RefreshSQL.Strings = (
      'Select '
      '  CODCIDADE,'
      '  CIDADE,'
      '  DDD,'
      '  CODESTADO,'
      '  DATCAD,'
      '  DATULTALT'
      'from CIDADES '
      'where'
      '  CODCIDADE = :CODCIDADE')
    SelectSQL.Strings = (
      'select * from CIDADES;')
    ModifySQL.Strings = (
      'update CIDADES'
      'set'
      '  CIDADE = :CIDADE,'
      '  DDD = :DDD,'
      '  CODESTADO = :CODESTADO,'
      '  DATCAD = :DATCAD,'
      '  DATULTALT = :DATULTALT'
      'where'
      '  CODCIDADE = :OLD_CODCIDADE')
    ParamCheck = True
    UniDirectional = False
    Active = True
    Left = 32
    Top = 192
    object qCidadesCODCIDADE: TIntegerField
      FieldName = 'CODCIDADE'
      Origin = 'CIDADES.CODCIDADE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qCidadesCIDADE: TIBStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADES.CIDADE'
      Required = True
      Size = 50
    end
    object qCidadesDDD: TIBStringField
      FieldName = 'DDD'
      Origin = 'CIDADES.DDD'
      Required = True
      Size = 3
    end
    object qCidadesCODESTADO: TIntegerField
      FieldName = 'CODESTADO'
      Origin = 'CIDADES.CODESTADO'
      Required = True
    end
    object qCidadesDATCAD: TDateField
      FieldName = 'DATCAD'
      Origin = 'CIDADES.DATCAD'
    end
    object qCidadesDATULTALT: TDateField
      FieldName = 'DATULTALT'
      Origin = 'CIDADES.DATULTALT'
    end
  end
  object qEstados: TIBDataSet
    Database = Conexao
    Transaction = Trans
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from ESTADOS'
      'where'
      '  CODESTADO = :OLD_CODESTADO')
    InsertSQL.Strings = (
      'insert into ESTADOS'
      '  (ESTADO, UF, CODPAIS, DATCAD, DATULTALT)'
      'values'
      '  (:ESTADO, :UF, :CODPAIS, :DATCAD, :DATULTALT)')
    RefreshSQL.Strings = (
      'Select '
      '  CODESTADO,'
      '  ESTADO,'
      '  UF,'
      '  CODPAIS,'
      '  DATCAD,'
      '  DATULTALT'
      'from ESTADOS '
      'where'
      '  CODESTADO = :CODESTADO')
    SelectSQL.Strings = (
      'select * from  ESTADOS')
    ModifySQL.Strings = (
      'update ESTADOS'
      'set'
      '  ESTADO = :ESTADO,'
      '  UF = :UF,'
      '  CODPAIS = :CODPAIS,'
      '  DATCAD = :DATCAD,'
      '  DATULTALT = :DATULTALT'
      'where'
      '  CODESTADO = :OLD_CODESTADO')
    ParamCheck = True
    UniDirectional = False
    Active = True
    Left = 32
    Top = 136
    object qEstadosCODESTADO: TIntegerField
      FieldName = 'CODESTADO'
      Origin = 'ESTADOS.CODESTADO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qEstadosESTADO: TIBStringField
      FieldName = 'ESTADO'
      Origin = 'ESTADOS.ESTADO'
      Required = True
      Size = 50
    end
    object qEstadosUF: TIBStringField
      FieldName = 'UF'
      Origin = 'ESTADOS.UF'
      Required = True
      Size = 3
    end
    object qEstadosCODPAIS: TIntegerField
      FieldName = 'CODPAIS'
      Origin = 'ESTADOS.CODPAIS'
      Required = True
    end
    object qEstadosDATCAD: TDateField
      FieldName = 'DATCAD'
      Origin = 'ESTADOS.DATCAD'
    end
    object qEstadosDATULTALT: TDateField
      FieldName = 'DATULTALT'
      Origin = 'ESTADOS.DATULTALT'
    end
  end
  object qMarcas: TIBDataSet
    Database = Conexao
    Transaction = Trans
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from MARCAS'
      'where'
      '  CODMARCA = :OLD_CODMARCA')
    InsertSQL.Strings = (
      'insert into MARCAS'
      '  (MARCA, DATCAD, DATULTALT)'
      'values'
      '  (:MARCA, :DATCAD, :DATULTALT)')
    RefreshSQL.Strings = (
      'Select '
      '  CODMARCA,'
      '  MARCA,'
      '  DATCAD,'
      '  DATULTALT'
      'from MARCAS '
      'where'
      '  CODMARCA = :CODMARCA')
    SelectSQL.Strings = (
      'select *  from MARCAS;')
    ModifySQL.Strings = (
      'update MARCAS'
      'set'
      '  MARCA = :MARCA,'
      '  DATCAD = :DATCAD,'
      '  DATULTALT = :DATULTALT'
      'where'
      '  CODMARCA = :OLD_CODMARCA')
    ParamCheck = True
    UniDirectional = False
    Active = True
    Left = 360
    Top = 40
    object qMarcasCODMARCA: TIntegerField
      FieldName = 'CODMARCA'
      Origin = 'MARCAS.CODMARCA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qMarcasMARCA: TIBStringField
      FieldName = 'MARCA'
      Origin = 'MARCAS.MARCA'
      Required = True
      Size = 25
    end
    object qMarcasDATCAD: TDateField
      FieldName = 'DATCAD'
      Origin = 'MARCAS.DATCAD'
    end
    object qMarcasDATULTALT: TDateField
      FieldName = 'DATULTALT'
      Origin = 'MARCAS.DATULTALT'
    end
  end
  object qModelos: TIBDataSet
    Database = Conexao
    Transaction = Trans
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from MODELOS'
      'where'
      '  CODMODELO = :OLD_CODMODELO')
    InsertSQL.Strings = (
      'insert into MODELOS'
      '  (MODELO, CODMARCA, DATCAD, DATULTALT)'
      'values'
      '  (:MODELO, :CODMARCA, :DATCAD, :DATULTALT)')
    RefreshSQL.Strings = (
      'Select '
      '  CODMODELO,'
      '  MODELO,'
      '  CODMARCA,'
      '  DATCAD,'
      '  DATULTALT'
      'from MODELOS '
      'where'
      '  CODMODELO = :CODMODELO')
    SelectSQL.Strings = (
      'select *  from MODELOS;')
    ModifySQL.Strings = (
      'update MODELOS'
      'set'
      '  MODELO = :MODELO,'
      '  CODMARCA = :CODMARCA,'
      '  DATCAD = :DATCAD,'
      '  DATULTALT = :DATULTALT'
      'where'
      '  CODMODELO = :OLD_CODMODELO')
    ParamCheck = True
    UniDirectional = False
    Active = True
    Left = 360
    Top = 104
    object qModelosCODMODELO: TIntegerField
      FieldName = 'CODMODELO'
      Origin = 'MODELOS.CODMODELO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qModelosMODELO: TIBStringField
      FieldName = 'MODELO'
      Origin = 'MODELOS.MODELO'
      Required = True
      Size = 25
    end
    object qModelosCODMARCA: TIntegerField
      FieldName = 'CODMARCA'
      Origin = 'MODELOS.CODMARCA'
      Required = True
    end
    object qModelosDATCAD: TDateField
      FieldName = 'DATCAD'
      Origin = 'MODELOS.DATCAD'
    end
    object qModelosDATULTALT: TDateField
      FieldName = 'DATULTALT'
      Origin = 'MODELOS.DATULTALT'
    end
  end
  object qGrupos: TIBDataSet
    Database = Conexao
    Transaction = Trans
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from GRUPOS'
      'where'
      '  CODGRUPO = :OLD_CODGRUPO')
    InsertSQL.Strings = (
      'insert into GRUPOS'
      '  (GRUPO, DESCRICAO, DATCAD, DATULTALT)'
      'values'
      '  (:GRUPO, :DESCRICAO, :DATCAD, :DATULTALT)')
    RefreshSQL.Strings = (
      'Select '
      '  CODGRUPO,'
      '  GRUPO,'
      '  DESCRICAO,'
      '  DATCAD,'
      '  DATULTALT'
      'from GRUPOS '
      'where'
      '  CODGRUPO = :CODGRUPO')
    SelectSQL.Strings = (
      'select *  from GRUPOS;')
    ModifySQL.Strings = (
      'update GRUPOS'
      'set'
      '  GRUPO = :GRUPO,'
      '  DESCRICAO = :DESCRICAO,'
      '  DATCAD = :DATCAD,'
      '  DATULTALT = :DATULTALT'
      'where'
      '  CODGRUPO = :OLD_CODGRUPO')
    ParamCheck = True
    UniDirectional = False
    Left = 360
    Top = 208
    object qGruposCODGRUPO: TIntegerField
      FieldName = 'CODGRUPO'
      Origin = 'GRUPOS.CODGRUPO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qGruposGRUPO: TIBStringField
      FieldName = 'GRUPO'
      Origin = 'GRUPOS.GRUPO'
      Required = True
      Size = 25
    end
    object qGruposDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'GRUPOS.DESCRICAO'
      Size = 100
    end
    object qGruposDATCAD: TDateField
      FieldName = 'DATCAD'
      Origin = 'GRUPOS.DATCAD'
    end
    object qGruposDATULTALT: TDateField
      FieldName = 'DATULTALT'
      Origin = 'GRUPOS.DATULTALT'
    end
  end
end
