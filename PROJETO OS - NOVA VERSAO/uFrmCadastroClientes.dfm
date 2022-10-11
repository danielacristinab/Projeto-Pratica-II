inherited FrmCadastroClientes: TFrmCadastroClientes
  Caption = 'Cadastro de Clientes'
  ClientWidth = 735
  ExplicitWidth = 751
  PixelsPerInch = 96
  TextHeight = 13
  inherited lblNumero: TLabel
    Left = 470
    ExplicitLeft = 470
  end
  inherited lblCodCidade: TLabel
    Left = 26
    Top = 179
    ExplicitLeft = 26
    ExplicitTop = 179
  end
  object lblNome: TLabel [10]
    Left = 80
    Top = 8
    Width = 75
    Height = 13
    Caption = 'Nome Completo'
  end
  object lblDataNasc: TLabel [11]
    Left = 527
    Top = 296
    Width = 81
    Height = 13
    Caption = 'Data Nascimento'
  end
  object lblRG: TLabel [12]
    Left = 24
    Top = 296
    Width = 14
    Height = 13
    Caption = 'RG'
  end
  object lblCPF_CNPJ: TLabel [13]
    Left = 262
    Top = 296
    Width = 62
    Height = 13
    Caption = 'CPF ou CNPJ'
  end
  object lblTelefone: TLabel [14]
    Left = 19
    Top = 242
    Width = 42
    Height = 13
    Caption = 'Telefone'
  end
  object lblCelular: TLabel [15]
    Left = 222
    Top = 242
    Width = 33
    Height = 13
    Caption = 'Celular'
  end
  object lblEmail: TLabel [16]
    Left = 417
    Top = 242
    Width = 28
    Height = 13
    Caption = 'E-mail'
  end
  inherited edtCodigo: TEdit
    Top = 45
    ExplicitTop = 45
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
    Left = 19
    Width = 423
    TabOrder = 2
    ExplicitLeft = 19
    ExplicitWidth = 423
  end
  inherited edtNumero: TEdit
    Left = 470
    Width = 148
    TabOrder = 3
    ExplicitLeft = 470
    ExplicitWidth = 148
  end
  inherited edtComplemento: TEdit
    Top = 137
    TabOrder = 4
    ExplicitTop = 137
  end
  inherited edtCEP: TEdit
    Left = 324
    Top = 137
    TabOrder = 5
    ExplicitLeft = 324
    ExplicitTop = 137
  end
  inherited edtBairro: TEdit
    Left = 470
    Top = 137
    TabOrder = 6
    ExplicitLeft = 470
    ExplicitTop = 137
  end
  inherited edtCodCidade: TEdit
    Top = 215
    TabOrder = 18
    ExplicitTop = 215
  end
  inherited edtCidade: TEdit
    Top = 215
    TabOrder = 19
    ExplicitTop = 215
  end
  inherited btnPesquisar: TButton
    Left = 474
    TabOrder = 7
    OnClick = btnPesquisarClick
    ExplicitLeft = 474
  end
  object edtNome: TEdit
    Left = 75
    Top = 45
    Width = 619
    Height = 21
    TabOrder = 1
    OnExit = edtNomeExit
  end
  object edtDataNasc: TEdit
    Left = 511
    Top = 315
    Width = 188
    Height = 21
    TabOrder = 13
  end
  object edtRG: TEdit
    Left = 19
    Top = 315
    Width = 225
    Height = 21
    TabOrder = 11
  end
  object edtCPF_CNPJ: TEdit
    Left = 262
    Top = 315
    Width = 229
    Height = 21
    TabOrder = 12
  end
  object edtTelefone: TEdit
    Left = 19
    Top = 261
    Width = 174
    Height = 21
    TabOrder = 8
  end
  object edtCelular: TEdit
    Left = 222
    Top = 261
    Width = 189
    Height = 21
    TabOrder = 9
  end
  object edtEmail: TEdit
    Left = 417
    Top = 261
    Width = 282
    Height = 21
    TabOrder = 10
  end
end
