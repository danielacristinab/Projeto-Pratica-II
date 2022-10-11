inherited FrmCadastroFuncionarios: TFrmCadastroFuncionarios
  Caption = 'Cadastro de Funcionarios'
  PixelsPerInch = 96
  TextHeight = 13
  inherited lblCodCidade: TLabel
    Left = 22
    Top = 179
    ExplicitLeft = 22
    ExplicitTop = 179
  end
  object lblNome: TLabel [10]
    Left = 78
    Top = 8
    Width = 75
    Height = 13
    Caption = 'Nome Completo'
  end
  object lblDataNasc: TLabel [11]
    Left = 520
    Top = 304
    Width = 81
    Height = 13
    Caption = 'Data Nascimento'
  end
  object lblRG: TLabel [12]
    Left = 24
    Top = 304
    Width = 14
    Height = 13
    Caption = 'RG'
  end
  object lblCPF: TLabel [13]
    Left = 265
    Top = 304
    Width = 19
    Height = 13
    Caption = 'CPF'
  end
  object lblTelefone: TLabel [14]
    Left = 27
    Top = 251
    Width = 42
    Height = 13
    Caption = 'Telefone'
  end
  object lblCelular: TLabel [15]
    Left = 176
    Top = 251
    Width = 33
    Height = 13
    Caption = 'Celular'
  end
  object lblEmail: TLabel [16]
    Left = 417
    Top = 251
    Width = 28
    Height = 13
    Caption = 'E-mail'
  end
  object lblCodCargo: TLabel [17]
    Left = 24
    Top = 357
    Width = 65
    Height = 13
    Caption = 'Codigo Cargo'
  end
  object lblCargo: TLabel [18]
    Left = 112
    Top = 357
    Width = 29
    Height = 13
    Caption = 'Cargo'
  end
  inherited btnSair: TButton
    TabOrder = 16
  end
  inherited btnSalvar: TButton
    TabOrder = 15
  end
  inherited edtDataCad: TEdit
    TabOrder = 17
  end
  inherited edtUltAlt: TEdit
    TabOrder = 18
  end
  inherited edtEndereco: TEdit
    TabOrder = 2
  end
  inherited edtNumero: TEdit
    TabOrder = 3
  end
  inherited edtComplemento: TEdit
    Left = 25
    TabOrder = 4
    ExplicitLeft = 25
  end
  inherited edtCEP: TEdit
    TabOrder = 5
  end
  inherited edtBairro: TEdit
    TabOrder = 6
  end
  inherited edtCodCidade: TEdit
    Left = 25
    TabOrder = 19
    ExplicitLeft = 25
  end
  inherited edtCidade: TEdit
    TabOrder = 20
  end
  inherited btnPesquisar: TButton
    Width = 97
    Caption = 'Pesquisar Cidade'
    TabOrder = 7
    OnClick = btnPesquisarClick
    ExplicitWidth = 97
  end
  object edtNome: TEdit
    Left = 75
    Top = 45
    Width = 624
    Height = 21
    TabOrder = 1
  end
  object edtDataNasc: TEdit
    Left = 515
    Top = 323
    Width = 103
    Height = 21
    TabOrder = 13
  end
  object edtRG: TEdit
    Left = 24
    Top = 323
    Width = 223
    Height = 21
    TabOrder = 11
  end
  object edtCPF: TEdit
    Left = 265
    Top = 323
    Width = 218
    Height = 21
    TabOrder = 12
  end
  object edtTelefone: TEdit
    Left = 24
    Top = 270
    Width = 129
    Height = 21
    TabOrder = 8
  end
  object edtCelular: TEdit
    Left = 176
    Top = 270
    Width = 223
    Height = 21
    TabOrder = 9
  end
  object edtEmail: TEdit
    Left = 417
    Top = 270
    Width = 282
    Height = 21
    TabOrder = 10
  end
  object edtCodCargo: TEdit
    Left = 25
    Top = 376
    Width = 69
    Height = 21
    Enabled = False
    TabOrder = 21
  end
  object edtCargo: TEdit
    Left = 114
    Top = 376
    Width = 333
    Height = 21
    TabOrder = 22
  end
  object btnPesquisarCargo: TButton
    Left = 474
    Top = 374
    Width = 95
    Height = 25
    Caption = 'Pesquisar Cargo'
    TabOrder = 14
    OnClick = btnPesquisarCargoClick
  end
end
