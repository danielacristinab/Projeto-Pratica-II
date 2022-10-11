unit uFormasPagamento;

interface
uses uPai;
type FormasPagamento = class (Pai)
  private
  protected
    FormaPag : string[50];
 public
   constructor CrieObj;
   procedure SetFormaPagamento(pFormaPag: string);
   function GetFormaPagamento : string;
   function Clone : FormasPagamento;
   destructor Destrua_se;
end;
implementation

{ FormaPagamento }

function FormasPagamento.Clone: FormasPagamento;
begin
  result := FormasPagamento.CrieObj;
  result.SetCodigo(codigo);
  result.SetFormaPagamento(FormaPag);
  result.setDataCad(dataCad);
  result.setDataCad(DataUltAlt);
end;

constructor FormasPagamento.CrieObj;
begin
  FormaPag := ' ';
end;

destructor FormasPagamento.Destrua_se;
begin

end;

function FormasPagamento.GetFormaPagamento: string;
begin
  result := FormaPag;
end;

procedure FormasPagamento.SetFormaPagamento(pFormaPag: string);
begin
  FormaPag := pFormaPag;
end;

end.
