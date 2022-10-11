unit uCidades;

interface
uses uPai, uEstados;
type Cidades = class (Pai)
  private
  protected
    cidade : string[55];
    DDD : string[3];
    oEstado : estados;
  public
    constructor CrieObj;
    function GetCidade: string;
    function GetDDD: string;
    function getoEstado: estados;
    procedure setCidade(pCidade: string);
    procedure setDDD(pDDD: string);
    procedure setoEstado(poEstado: estados);
    function Clone : Cidades;
    destructor Destrua_se;
end;
implementation

{ Cidades }

constructor Cidades.CrieObj;
begin
  cidade := '';
  DDD := '';
  oEstado := estados.CrieObj;
end;

function Cidades.Clone: Cidades;
begin
  result := Cidades.crieObj;
  result.setCodigo(codigo);
  result.setCidade(cidade);
  result.setDDD(ddd);
  result.setoEstado(oEstado.clone);
  result.setDataCad(dataCad);
  result.setDataCad(DataUltAlt);
 end;

function Cidades.GetCidade: string;
begin
  result := cidade;
end;

function Cidades.GetDDD: string;
begin
  result := DDD;
end;

function Cidades.getoEstado: estados;
begin
   result := oEstado;
end;

procedure Cidades.setCidade(pCidade: string);
begin
  cidade := pCidade;
end;

procedure Cidades.setDDD(pDDD: string);
begin
  DDD := pDDD;
end;

procedure Cidades.setoEstado(poEstado: estados);
begin
  oEstado := poEstado;
end;

destructor Cidades.Destrua_se;
begin

end;
end.

