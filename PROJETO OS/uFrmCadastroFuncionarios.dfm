inherited FrmCadastroFuncionarios: TFrmCadastroFuncionarios
  Caption = 'Cadastro de Funcionarios'
  PixelsPerInch = 96
  TextHeight = 13
  inherited lblCodCidade: TLabel
    Left = 27
    ExplicitLeft = 27
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
  inherited edtComplemento: TEdit
    Left = 25
    ExplicitLeft = 25
  end
  inherited edtCodCidade: TEdit
    Left = 25
    ExplicitLeft = 25
  end
  object edtNome: TEdit
    Left = 75
    Top = 45
    Width = 624
    Height = 21
    TabOrder = 13
  end
  object edtDataNasc: TEdit
    Left = 515
    Top = 323
    Width = 103
    Height = 21
    TabOrder = 14
  end
  object edtRG: TEdit
    Left = 24
    Top = 323
    Width = 223
    Height = 21
    TabOrder = 15
  end
  object edtCPF: TEdit
    Left = 265
    Top = 323
    Width = 218
    Height = 21
    TabOrder = 16
  end
  object edtTelefone: TEdit
    Left = 24
    Top = 270
    Width = 129
    Height = 21
    TabOrder = 17
  end
  object edtCelular: TEdit
    Left = 176
    Top = 270
    Width = 223
    Height = 21
    TabOrder = 18
  end
  object edtEmail: TEdit
    Left = 417
    Top = 270
    Width = 282
    Height = 21
    TabOrder = 19
  end
end
