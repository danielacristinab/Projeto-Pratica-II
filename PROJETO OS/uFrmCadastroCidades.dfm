inherited FrmCadastroCidades: TFrmCadastroCidades
  Caption = 'Cadastro Cidades'
  PixelsPerInch = 96
  TextHeight = 13
  object lblCidade: TLabel [3]
    Left = 176
    Top = 8
    Width = 33
    Height = 13
    Caption = 'Cidade'
  end
  object lblDDD: TLabel [4]
    Left = 296
    Top = 8
    Width = 21
    Height = 13
    Caption = 'DDD'
  end
  object lblEstado: TLabel [5]
    Left = 159
    Top = 112
    Width = 33
    Height = 13
    Caption = 'Estado'
  end
  object lblCodEstado: TLabel [6]
    Left = 27
    Top = 114
    Width = 69
    Height = 13
    Caption = 'Codigo Estado'
  end
  object edtCidade: TEdit
    Left = 159
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 5
  end
  object edtDDD: TEdit
    Left = 286
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 6
  end
  object edtEstado: TEdit
    Left = 159
    Top = 131
    Width = 121
    Height = 21
    TabOrder = 7
  end
  object btnPesquisarEstado: TButton
    Left = 432
    Top = 130
    Width = 107
    Height = 25
    Caption = 'Pesquisa Estado'
    TabOrder = 8
    OnClick = btnPesquisarEstadoClick
  end
  object edtCodEstado: TEdit
    Left = 32
    Top = 133
    Width = 121
    Height = 21
    TabOrder = 9
  end
end
