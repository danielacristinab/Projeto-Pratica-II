unit uParcelas;

interface
uses uPai, uFormasPagamento;
type Parcelas = class (Pai)
  private
  protected
    Parcela : integer;
	  Prazo : string[50];
    Porcentagem : string[20];
    aFormaPag : FormasPagamento;
  public

end;
implementation

end.
