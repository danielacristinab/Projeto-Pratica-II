unit uPaises;

interface
uses uPai;
type Paises = class (Pai)
  private
  protected
    pais   : string[55];
    sigla  : string[3];
    ddi    : string[4];
    moeda : string[3];
  public
    constructor CrieObj;
    constructor CrieInit(pCodigo: integer; pPais, pSigla, pDDI, pMoeda, pDataCad, pUltAlt: string);
    procedure SetPais(pPais: string);
    procedure SetSigla(pSigla: string);
    procedure SetDDI(pDDI: string);
    procedure SetMoeda(pMoeda: string);
    function GetPais : string;
    function GetSigla : string;
    function GetDDI : string;
    function GetMoeda : string;
    function Clone : Paises;
    destructor Destrua_se;
end;
implementation

{ Paises }

constructor Paises.CrieObj;
begin
   codigo := 0;
   datacad := '';
   DataUltAlt := '';
   pais := '';
   sigla := '';
   ddi := '';
   moeda := '';
end;

function Paises.Clone: Paises;
begin
  result := Paises.CrieInit(Codigo, Pais, Sigla, DDi, Moeda, DataCad, DataUltAlt);
end;

constructor Paises.CrieInit(pCodigo: integer; pPais, pSigla, pDDI,
  pMoeda, pDataCad, pUltAlt: string);
begin
  codigo := pCodigo;
  pais := pPais;
  sigla := pSigla;
  ddi := pDDI;
  moeda := pMoeda;
  datacad := pDataCad;
  DataUltAlt := pUltAlt;

end;

function Paises.GetDDI: string;
begin
  result := ddi;
end;

function Paises.GetMoeda: string;
begin
  result := moeda;
end;

function Paises.GetPais: string;
begin
  result := pais
end;

function Paises.GetSigla: string;
begin
  result := sigla;
end;

procedure Paises.SetDDI(pDDI: string);
begin
  ddi := pDDI;
end;

procedure Paises.SetMoeda(pMoeda: string);
begin
  moeda := pMoeda;
end;

procedure Paises.SetPais(pPais: string);
begin
  pais := pPais;
end;

procedure Paises.SetSigla(pSigla: string);
begin
  sigla := pSigla;
end;

destructor Paises.Destrua_se;
begin

end;

end.

