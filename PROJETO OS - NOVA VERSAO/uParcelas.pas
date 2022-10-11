unit uParcelas;

interface
uses uPai, uFormasPagamento;
type Parcelas = class (Pai)
  private
  protected
    Parcela : integer;
	  Dias : integer;
    Porcentagem : integer;
    aFormaPag : FormasPagamento;
  public
    constructor CrieObj;
    procedure SetParcela(pParcela: integer);
    procedure SetDias(pDias: integer);
    procedure SetPorcentagem(pPorcent: integer);
    procedure SetaFormaPag(paFormaPag: FormasPagamento);
    function GetParcela: integer;
    function GetDias: integer;
    function GetPorcentagem: integer;
    function GetaFormaPag: FormasPagamento;
    destructor Destrua_se;
end;
implementation

{ Parcelas }

constructor Parcelas.CrieObj;
begin
  Parcela := 0;
  Dias := 0;
  Porcentagem := 0;
  aFormaPag := FormasPagamento.CrieObj;
end;

destructor Parcelas.Destrua_se;
begin

end;

function Parcelas.GetaFormaPag: FormasPagamento;
begin
  result := aFormaPag;
end;

function Parcelas.GetParcela: integer;
begin
  result := Parcela;
end;

function Parcelas.GetPorcentagem: integer;
begin
  result := Porcentagem;
end;

function Parcelas.GetDias: integer;
begin
  result := Dias;
end;

procedure Parcelas.SetaFormaPag(paFormaPag: FormasPagamento);
begin
  aFormaPag := paFormaPag;
end;

procedure Parcelas.SetParcela(pParcela: integer);
begin
  Parcela := pParcela;
end;

procedure Parcelas.SetPorcentagem(pPorcent: integer);
begin
  Porcentagem := pPorcent;
end;

procedure Parcelas.SetDias(pDias: integer);
begin
  Dias := pDias;
end;

end.
