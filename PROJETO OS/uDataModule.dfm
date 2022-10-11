object DM: TDM
  OldCreateOrder = False
  Height = 572
  Width = 857
  object FDTrans: TFDTransaction
    Connection = FDBanco
    Left = 144
    Top = 64
  end
  object FDBanco: TFDConnection
    Params.Strings = (
      'Database=C:\BD-PRATICA\PROJETO_OS.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'CharacterSet=WIN1251'
      'DriverID=FB')
    Connected = True
    Transaction = FDTrans
    Left = 64
    Top = 64
  end
  object qFornecedores: TFDQuery
    Active = True
    Connection = FDBanco
    Transaction = FDTrans
    SQL.Strings = (
      'select * from fornecedores;')
    Left = 488
    Top = 120
  end
  object DSFornecedores: TDataSource
    DataSet = qFornecedores
    Left = 568
    Top = 120
  end
  object qPaises: TFDQuery
    Active = True
    Connection = FDBanco
    Transaction = FDTrans
    SQL.Strings = (
      'select * from paises')
    Left = 280
    Top = 64
  end
  object DSPaises: TDataSource
    DataSet = qPaises
    Left = 360
    Top = 64
  end
  object qEstados: TFDQuery
    Active = True
    Connection = FDBanco
    Transaction = FDTrans
    SQL.Strings = (
      'select * from estados')
    Left = 280
    Top = 120
  end
  object DSEstados: TDataSource
    DataSet = qEstados
    Left = 360
    Top = 120
  end
  object qCidades: TFDQuery
    Active = True
    Connection = FDBanco
    Transaction = FDTrans
    SQL.Strings = (
      'select * from cidades')
    Left = 280
    Top = 184
  end
  object DSCidades: TDataSource
    DataSet = qCidades
    Left = 360
    Top = 184
  end
  object qClientes: TFDQuery
    Active = True
    Connection = FDBanco
    Transaction = FDTrans
    SQL.Strings = (
      'select * from clientes;')
    Left = 488
    Top = 64
  end
  object DSClientes: TDataSource
    DataSet = qClientes
    Left = 568
    Top = 64
  end
  object qFuncionarios: TFDQuery
    Connection = FDBanco
    Transaction = FDTrans
    SQL.Strings = (
      'select * from funcionarios')
    Left = 488
    Top = 184
  end
  object DSFuncionarios: TDataSource
    DataSet = qFuncionarios
    Left = 568
    Top = 184
  end
  object qCargos: TFDQuery
    Connection = FDBanco
    Transaction = FDTrans
    SQL.Strings = (
      'select * from cargos;')
    Left = 488
    Top = 240
  end
  object DSCargos: TDataSource
    DataSet = qCargos
    Left = 568
    Top = 240
  end
  object qMarcas: TFDQuery
    Connection = FDBanco
    Transaction = FDTrans
    SQL.Strings = (
      'select * from marcas;')
    Left = 656
    Top = 72
  end
  object DSMarcas: TDataSource
    DataSet = qMarcas
    Left = 736
    Top = 72
  end
  object qModelos: TFDQuery
    Connection = FDBanco
    Transaction = FDTrans
    SQL.Strings = (
      'select * from modelos')
    Left = 656
    Top = 136
  end
  object DSModelos: TDataSource
    DataSet = qModelos
    Left = 736
    Top = 136
  end
  object qProdutos: TFDQuery
    Connection = FDBanco
    Transaction = FDTrans
    SQL.Strings = (
      'select * from produtos')
    Left = 664
    Top = 200
  end
  object DSProdutos: TDataSource
    DataSet = qProdutos
    Left = 744
    Top = 200
  end
  object qGrupos: TFDQuery
    Connection = FDBanco
    Transaction = FDTrans
    SQL.Strings = (
      'select * from grupos')
    Left = 664
    Top = 256
  end
  object DSGrupos: TDataSource
    DataSet = qGrupos
    Left = 744
    Top = 256
  end
  object qCondPag: TFDQuery
    Connection = FDBanco
    Transaction = FDTrans
    SQL.Strings = (
      'select * from CondPag')
    Left = 64
    Top = 264
  end
  object DSCondPag: TDataSource
    DataSet = qCondPag
    Left = 144
    Top = 264
  end
  object qFormaPag: TFDQuery
    Connection = FDBanco
    Transaction = FDTrans
    SQL.Strings = (
      'select * from FormasPagamento')
    Left = 64
    Top = 328
  end
  object DSFormaPag: TDataSource
    DataSet = qFormaPag
    Left = 144
    Top = 328
  end
end
