inherited FrmConsultaPaises: TFrmConsultaPaises
  Caption = 'Consulta Paises'
  PixelsPerInch = 96
  TextHeight = 13
  inherited btnPesquisar: TButton
    Left = 474
    OnClick = btnPesquisarClick
    ExplicitLeft = 474
  end
  inherited btnSair: TButton
    Left = 638
    ExplicitLeft = 638
  end
  inherited btnIncluir: TButton
    Left = 395
    ExplicitLeft = 395
  end
  inherited btnExcluir: TButton
    Left = 557
    ExplicitLeft = 557
  end
  inherited btnAlterar: TButton
    Left = 476
    ExplicitLeft = 476
  end
  inherited DBGrid1: TDBGrid
    Left = 8
    Columns = <
      item
        Expanded = False
        FieldName = 'codpais'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pais'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sigla'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ddi'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'moeda'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'datacad'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dataultalt'
        Visible = True
      end>
  end
end
