inherited FrmCadastroFornecedores: TFrmCadastroFornecedores
  Caption = 'Cadastro de Fornecedor'
  PixelsPerInch = 96
  TextHeight = 13
  inherited lblComplemento: TLabel
    Width = 127
    Caption = 'Complemento / Referencia'
    ExplicitWidth = 127
  end
  inherited lblCodCidade: TLabel
    Left = 26
    Top = 179
    ExplicitLeft = 26
    ExplicitTop = 179
  end
  inherited lblCidade: TLabel
    Left = 110
    ExplicitLeft = 110
  end
  object lblRazaoSocial: TLabel [10]
    Left = 72
    Top = 8
    Width = 60
    Height = 13
    Caption = 'Raz'#227'o Social'
  end
  object lblNomeFantasia: TLabel [11]
    Left = 474
    Top = 8
    Width = 116
    Height = 13
    Caption = 'Nome Fantasia / Apelido'
  end
  object lblSite: TLabel [12]
    Left = 474
    Top = 250
    Width = 18
    Height = 13
    Caption = 'Site'
  end
  object lblRG_IE: TLabel [13]
    Left = 26
    Top = 304
    Width = 165
    Height = 13
    Caption = 'Registro Geral / Inscri'#231#227'o Estadual'
  end
  object lblCNPJ: TLabel [14]
    Left = 265
    Top = 304
    Width = 25
    Height = 13
    Caption = 'CNPJ'
  end
  object lblTelefone: TLabel [15]
    Left = 27
    Top = 251
    Width = 42
    Height = 13
    Caption = 'Telefone'
  end
  object lblEmail: TLabel [16]
    Left = 265
    Top = 251
    Width = 28
    Height = 13
    Caption = 'E-mail'
  end
  inherited btnSair: TButton
    TabOrder = 15
  end
  inherited btnSalvar: TButton
    TabOrder = 14
  end
  inherited edtDataCad: TEdit
    TabOrder = 16
  end
  inherited edtUltAlt: TEdit
    TabOrder = 17
  end
  inherited edtUser: TEdit
    TabOrder = 20
  end
  inherited edtEndereco: TEdit
    TabOrder = 3
  end
  inherited edtNumero: TEdit
    TabOrder = 4
  end
  inherited edtComplemento: TEdit
    TabOrder = 5
  end
  inherited edtCEP: TEdit
    TabOrder = 6
  end
  inherited edtBairro: TEdit
    Top = 137
    TabOrder = 7
    ExplicitTop = 137
  end
  inherited edtCodCidade: TEdit
    TabOrder = 18
  end
  inherited edtCidade: TEdit
    Left = 110
    TabOrder = 19
    ExplicitLeft = 110
  end
  inherited btnPesquisar: TButton
    TabOrder = 8
    OnClick = btnPesquisarClick
  end
  object edtRazaoSocial: TEdit
    Left = 75
    Top = 45
    Width = 373
    Height = 21
    TabOrder = 1
  end
  object edtNomeFantasia: TEdit
    Left = 474
    Top = 45
    Width = 225
    Height = 21
    TabOrder = 2
  end
  object edtSite: TEdit
    Left = 474
    Top = 269
    Width = 241
    Height = 21
    TabOrder = 11
  end
  object edtRG_IE: TEdit
    Left = 24
    Top = 323
    Width = 223
    Height = 21
    TabOrder = 12
  end
  object edtCNPJ: TEdit
    Left = 265
    Top = 323
    Width = 218
    Height = 21
    TabOrder = 13
  end
  object edtTelefone: TEdit
    Left = 24
    Top = 270
    Width = 223
    Height = 21
    TabOrder = 9
  end
  object edtEmail: TEdit
    Left = 265
    Top = 270
    Width = 192
    Height = 21
    TabOrder = 10
  end
end
