object FrmConsultaPai: TFrmConsultaPai
  Left = 0
  Top = 0
  Caption = 'FrmConsultaPai'
  ClientHeight = 493
  ClientWidth = 744
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnPesquisar: TButton
    Left = 472
    Top = 22
    Width = 75
    Height = 25
    Caption = '&Pesquisar'
    TabOrder = 1
  end
  object btnSair: TButton
    Left = 646
    Top = 439
    Width = 75
    Height = 25
    Caption = '&Sair'
    TabOrder = 6
    OnClick = btnSairClick
  end
  object btnIncluir: TButton
    Left = 403
    Top = 439
    Width = 75
    Height = 25
    Caption = '&Incluir'
    TabOrder = 3
    OnClick = btnIncluirClick
  end
  object btnExcluir: TButton
    Left = 565
    Top = 439
    Width = 75
    Height = 25
    Caption = '&Excluir'
    TabOrder = 5
    OnClick = btnExcluirClick
  end
  object btnAlterar: TButton
    Left = 484
    Top = 439
    Width = 75
    Height = 25
    Caption = '&Alterar'
    TabOrder = 4
    OnClick = btnAlterarClick
  end
  object edtPesquisar: TEdit
    Left = 16
    Top = 24
    Width = 430
    Height = 21
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 80
    Width = 705
    Height = 353
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
end
