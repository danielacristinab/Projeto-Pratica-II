unit uPai;

interface

type Pai = class
  private
  protected
    Codigo : integer;
    DataCad : string;
    DataUltAlt : string;
  public
    constructor CrieObj;
    procedure SetCodigo(pCodigo: integer);
    procedure SetDataCad(pDataCad: string);
    procedure SetUltAlt(pUltAlt: string);
    function GetCodigo : integer;
    function GetDataCad : string;
    function GetUltAlt : string;
    destructor Destrua_se;
end;

implementation

{ Pai }

constructor Pai.CrieObj;
begin
    Codigo := 0;
    DataCad := '';
    DataUltAlt := '';
end;

destructor Pai.Destrua_se;
begin

end;

function Pai.GetCodigo: integer;
begin
  result := Codigo;
end;

function Pai.GetDataCad: string;
begin
  result := DataCad;
end;

function Pai.GetUltAlt: string;
begin
  result := DataUltAlt;
end;

procedure Pai.SetCodigo(pCodigo: integer);
begin
  Codigo := pCodigo;
end;

procedure Pai.SetDataCad(pDataCad: string);
begin
  Datacad := pDataCad;
end;

procedure Pai.SetUltAlt(pUltAlt: string);
begin
  DataUltAlt := pUltAlt;
end;

end.

