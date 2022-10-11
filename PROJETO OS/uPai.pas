unit uPai;

interface

type Pai = class
  private
  protected
    Codigo : integer;
    DataCad : String;
    DataUltAlt : String;
  public
    constructor CrieObj;
    procedure SetCodigo(pCodigo: integer);
    procedure SetDataCad(pDataCad: String);
    procedure SetUltAlt(pUltAlt: String);
    function GetCodigo : integer;
    function GetDataCad : String;
    function GetUltAlt : String;
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

function Pai.GetDataCad: String;
begin
  result := DataCad;
end;

function Pai.GetUltAlt: String;
begin
  result := DataUltAlt;
end;

procedure Pai.SetCodigo(pCodigo: integer);
begin
  Codigo := pCodigo;
end;

procedure Pai.SetDataCad(pDataCad: String);
begin
  Datacad := pDataCad;
end;

procedure Pai.SetUltAlt(pUltAlt: String);
begin
  DataUltAlt := pUltAlt;
end;

end.

