object FrmCadastroPai: TFrmCadastroPai
  Left = 0
  Top = 0
  Caption = 'Cadastro Pai'
  ClientHeight = 453
  ClientWidth = 737
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblCodigo: TLabel
    Left = 24
    Top = 8
    Width = 33
    Height = 13
    Caption = 'Codigo'
  end
  object lblDataCad: TLabel
    Left = 26
    Top = 376
    Width = 70
    Height = 13
    Caption = 'Data Cadastro'
  end
  object lblUltAlt: TLabel
    Left = 136
    Top = 376
    Width = 78
    Height = 13
    Caption = 'Ultima Altera'#231#227'o'
  end
  object lblUser: TLabel
    Left = 256
    Top = 376
    Width = 36
    Height = 13
    Caption = 'Usuario'
  end
  object edtCodigo: TEdit
    Left = 24
    Top = 40
    Width = 33
    Height = 21
    Enabled = False
    TabOrder = 0
  end
  object btnSair: TButton
    Left = 624
    Top = 393
    Width = 75
    Height = 25
    Caption = '&Sair'
    TabOrder = 1
    OnClick = btnSairClick
  end
  object btnSalvar: TButton
    Left = 543
    Top = 393
    Width = 75
    Height = 25
    Caption = '&Salvar'
    TabOrder = 2
    OnClick = btnSalvarClick
  end
  object edtDataCad: TEdit
    Left = 26
    Top = 395
    Width = 81
    Height = 21
    Enabled = False
    TabOrder = 3
  end
  object edtUltAlt: TEdit
    Left = 136
    Top = 395
    Width = 89
    Height = 21
    Enabled = False
    TabOrder = 4
  end
  object edtUser: TEdit
    Left = 256
    Top = 395
    Width = 89
    Height = 21
    Enabled = False
    TabOrder = 5
  end
end
