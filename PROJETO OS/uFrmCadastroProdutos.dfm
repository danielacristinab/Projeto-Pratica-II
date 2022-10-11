inherited FrmCadastroProdutos: TFrmCadastroProdutos
  Caption = 'Cadastro de Produtos'
  ClientWidth = 535
  ExplicitWidth = 551
  PixelsPerInch = 96
  TextHeight = 13
  object lblProduto: TLabel [4]
    Left = 80
    Top = 8
    Width = 38
    Height = 13
    Caption = 'Produto'
  end
  object lblQtd: TLabel [5]
    Left = 440
    Top = 8
    Width = 56
    Height = 13
    Caption = 'Quantidade'
  end
  object lblUnd: TLabel [6]
    Left = 26
    Top = 85
    Width = 39
    Height = 13
    Caption = 'Unidade'
  end
  object lblCusto: TLabel [7]
    Left = 136
    Top = 85
    Width = 28
    Height = 13
    Caption = 'Custo'
  end
  object lblVenda: TLabel [8]
    Left = 288
    Top = 85
    Width = 30
    Height = 13
    Caption = 'Venda'
  end
  object lblSaldo: TLabel [9]
    Left = 439
    Top = 85
    Width = 26
    Height = 13
    Caption = 'Saldo'
  end
  object lblCodModelo: TLabel [10]
    Left = 24
    Top = 157
    Width = 56
    Height = 13
    Caption = 'Cod Modelo'
  end
  object lblModelo: TLabel [11]
    Left = 112
    Top = 157
    Width = 34
    Height = 13
    Caption = 'Modelo'
  end
  object lblCodFornecedor: TLabel [12]
    Left = 26
    Top = 203
    Width = 77
    Height = 13
    Caption = 'Cod Fornecedor'
  end
  object lblFornecedor: TLabel [13]
    Left = 112
    Top = 203
    Width = 55
    Height = 13
    Caption = 'Fornecedor'
  end
  object lblCodGrupo: TLabel [14]
    Left = 26
    Top = 246
    Width = 51
    Height = 13
    Caption = 'Cod Grupo'
  end
  object lblGrupo: TLabel [15]
    Left = 112
    Top = 248
    Width = 29
    Height = 13
    Caption = 'Grupo'
  end
  inherited btnSair: TButton
    Left = 440
    ExplicitLeft = 440
  end
  inherited btnSalvar: TButton
    Left = 359
    ExplicitLeft = 359
  end
  object edtProduto: TEdit
    Left = 80
    Top = 40
    Width = 337
    Height = 21
    TabOrder = 6
  end
  object edtQtd: TEdit
    Left = 440
    Top = 40
    Width = 56
    Height = 21
    TabOrder = 7
  end
  object edtUnd: TEdit
    Left = 26
    Top = 104
    Width = 57
    Height = 21
    TabOrder = 8
  end
  object edtCusto: TEdit
    Left = 136
    Top = 104
    Width = 57
    Height = 21
    TabOrder = 9
  end
  object edtVenda: TEdit
    Left = 288
    Top = 104
    Width = 57
    Height = 21
    TabOrder = 10
  end
  object edtCodModelo: TEdit
    Left = 26
    Top = 176
    Width = 57
    Height = 21
    TabOrder = 11
  end
  object edtModelo: TEdit
    Left = 112
    Top = 176
    Width = 244
    Height = 21
    TabOrder = 12
  end
  object edtCodFonecedor: TEdit
    Left = 26
    Top = 219
    Width = 57
    Height = 21
    TabOrder = 13
  end
  object edtCodGrupo: TEdit
    Left = 26
    Top = 265
    Width = 57
    Height = 21
    TabOrder = 14
  end
  object edtSaldo: TEdit
    Left = 439
    Top = 104
    Width = 57
    Height = 21
    TabOrder = 15
  end
  object edtGrupo: TEdit
    Left = 112
    Top = 267
    Width = 244
    Height = 21
    TabOrder = 16
  end
  object edtFornecedor: TEdit
    Left = 109
    Top = 221
    Width = 247
    Height = 21
    TabOrder = 17
  end
  object btnPesquisarModelo: TButton
    Left = 377
    Top = 174
    Width = 108
    Height = 25
    Caption = 'Pesquisar Modelo'
    TabOrder = 18
  end
  object btnPesquisarFornecedor: TButton
    Left = 377
    Top = 217
    Width = 128
    Height = 25
    Caption = 'Pesquisar Fornecedor'
    TabOrder = 19
  end
  object btnPesquisarGrupo: TButton
    Left = 377
    Top = 263
    Width = 108
    Height = 25
    Caption = 'Pesquisar Grupo'
    TabOrder = 20
  end
end
