unit uCondicaoPagamento;

interface
uses uPai, uFormasPagamento, uParcelas;
type CondicaoPagamento = class (Pai)
  private
  protected
    CondPag : string[50];
	  Juros : string[50];
	  Multa : string[15];
	  Desconto : string[15];
    aFormaPag : FormasPagamento;
 public
   constructor CrieObj;
   procedure SetCondPag(pCondPag: string);
   procedure SetJuros(pJuros: string);
   procedure SetMulta(pMulta: string);
   procedure SetDesconto(pDesconto: string);
   procedure SetaFormaPag(pFormaPag: FormasPagamento);
   function GetCondPag : string;
   function GetJuros : string;
   function GetMulta : string;
   function GetDesconto : string;
   function GetaFormaPag : FormasPagamento;
   function Clone : CondicaoPagamento;
   destructor Destrua_se;
end;
implementation

{ CondicaoPagamento }

function CondicaoPagamento.Clone: CondicaoPagamento;
begin
    result := CondicaoPagamento.CrieObj;
    result.setCodigo(codigo);
    result.SetCondPag(CondPag);
    result.SetJuros(Juros);
    result.SetMulta(Multa);
    result.SetDesconto(Desconto);
    result.setDataCad(DataCad);
    result.setDataCad(DataUltAlt);
end;

constructor CondicaoPagamento.CrieObj;
begin
  CondPag := ' ';
  Juros := '';
	Multa := '';
	Desconto := '';
  aFormaPag := FormasPagamento.CrieObj;
end;

destructor CondicaoPagamento.Destrua_se;
begin

end;

function CondicaoPagamento.GetaFormaPag: FormasPagamento;
begin
  result := aFormaPag;
end;

function CondicaoPagamento.GetCondPag: string;
begin
  result := CondPag;
end;

function CondicaoPagamento.GetDesconto: string;
begin
  result := Desconto;
end;

function CondicaoPagamento.GetJuros: string;
begin
  result := Juros;
end;

function CondicaoPagamento.GetMulta: string;
begin
  result := Multa;
end;

procedure CondicaoPagamento.SetaFormaPag(pFormaPag: FormasPagamento);
begin
  aFormaPag := pFormaPag;
end;

procedure CondicaoPagamento.SetCondPag(pCondPag: string);
begin
  CondPag := pCondPag;
end;

procedure CondicaoPagamento.SetDesconto(pDesconto: string);
begin
  Desconto := pDesconto;
end;

procedure CondicaoPagamento.SetJuros(pJuros: string);
begin
  Juros := pJuros;
end;

procedure CondicaoPagamento.SetMulta(pMulta: string);
begin
  Multa := pMulta;
end;

end.


