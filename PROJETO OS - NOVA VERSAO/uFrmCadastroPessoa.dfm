inherited FrmCadastroPessoa: TFrmCadastroPessoa
  Caption = 'Cadastro Pessoa'
  ClientHeight = 470
  ClientWidth = 725
  ExplicitWidth = 741
  ExplicitHeight = 509
  PixelsPerInch = 96
  TextHeight = 13
  inherited lblDataCad: TLabel
    Left = 28
    Top = 420
    ExplicitLeft = 28
    ExplicitTop = 420
  end
  inherited lblUltAlt: TLabel
    Left = 138
    Top = 420
    ExplicitLeft = 138
    ExplicitTop = 420
  end
  object lblEndereco: TLabel [3]
    Left = 24
    Top = 72
    Width = 45
    Height = 13
    Caption = 'Endereco'
  end
  object lblNumero: TLabel [4]
    Left = 474
    Top = 72
    Width = 37
    Height = 13
    Caption = 'Numero'
  end
  object lblComplemento: TLabel [5]
    Left = 26
    Top = 118
    Width = 65
    Height = 13
    Caption = 'Complemento'
  end
  object lblCEP: TLabel [6]
    Left = 330
    Top = 118
    Width = 19
    Height = 13
    Caption = 'CEP'
  end
  object lblBairro: TLabel [7]
    Left = 474
    Top = 118
    Width = 28
    Height = 13
    Caption = 'Bairro'
  end
  object lblCodCidade: TLabel [8]
    Left = 24
    Top = 180
    Width = 69
    Height = 13
    Caption = 'Codigo Cidade'
  end
  object lblCidade: TLabel [9]
    Left = 112
    Top = 179
    Width = 33
    Height = 13
    Caption = 'Cidade'
  end
  inherited btnSair: TButton
    Left = 626
    Top = 437
    ExplicitLeft = 626
    ExplicitTop = 437
  end
  inherited btnSalvar: TButton
    Left = 545
    Top = 437
    ExplicitLeft = 545
    ExplicitTop = 437
  end
  inherited edtDataCad: TEdit
    Left = 26
    Top = 439
    ExplicitLeft = 26
    ExplicitTop = 439
  end
  inherited edtUltAlt: TEdit
    Left = 138
    Top = 439
    ExplicitLeft = 138
    ExplicitTop = 439
  end
  object edtEndereco: TEdit
    Left = 24
    Top = 91
    Width = 421
    Height = 21
    TabOrder = 5
  end
  object edtNumero: TEdit
    Left = 474
    Top = 91
    Width = 146
    Height = 21
    TabOrder = 6
  end
  object edtComplemento: TEdit
    Left = 24
    Top = 144
    Width = 279
    Height = 21
    TabOrder = 7
  end
  object edtCEP: TEdit
    Left = 326
    Top = 144
    Width = 121
    Height = 21
    TabOrder = 8
  end
  object edtBairro: TEdit
    Left = 472
    Top = 144
    Width = 227
    Height = 21
    TabOrder = 9
  end
  object edtCodCidade: TEdit
    Left = 24
    Top = 208
    Width = 70
    Height = 21
    Enabled = False
    TabOrder = 10
  end
  object edtCidade: TEdit
    Left = 112
    Top = 208
    Width = 333
    Height = 21
    TabOrder = 11
  end
  object btnPesquisar: TButton
    Left = 472
    Top = 206
    Width = 75
    Height = 25
    Caption = 'Pesquisar'
    TabOrder = 12
  end
end
