inherited FrmConsultaCidades: TFrmConsultaCidades
  Caption = 'Consulta Cidades'
  PixelsPerInch = 96
  TextHeight = 13
  inherited btnPesquisar: TButton
    Left = 474
    TabOrder = 1
    OnClick = btnPesquisarClick
    ExplicitLeft = 474
  end
  inherited btnSair: TButton
    TabOrder = 6
  end
  inherited btnIncluir: TButton
    TabOrder = 5
  end
  inherited btnExcluir: TButton
    TabOrder = 4
  end
  inherited btnAlterar: TButton
    TabOrder = 3
  end
  inherited edtPesquisar: TEdit
    TabOrder = 0
  end
  inherited DBGrid1: TDBGrid
    TabOrder = 2
    Columns = <
      item
        Expanded = False
        FieldName = 'CODCIDADE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CIDADE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DDD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODESTADO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATACAD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATAULTALT'
        Visible = True
      end>
  end
end
