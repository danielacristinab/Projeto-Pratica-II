unit uCargos;

interface
uses uPai, uPessoa;
type Cargos = class (Pai)
   private
   protected
      Cargo : string[25];
   public
     constructor CrieObj;
     procedure SetCargo(pCargo: string);
     function GetCargo : string;
     function Clone : cargos;
     destructor Destrua_se;
end;
implementation

{ Cargos }

function Cargos.Clone: cargos;
begin
  result := cargos.CrieObj;
  result.SetCodigo(codigo);
  result.SetCargo(cargo);
  result.setDataCad(dataCad);
  result.setDataCad(DataUltAlt);
end;

constructor Cargos.CrieObj;
begin
  inherited;
  cargo := ' ';
end;

destructor Cargos.Destrua_se;
begin
  inherited;
end;

function Cargos.GetCargo: string;
begin
  result := Cargo;
end;

procedure Cargos.SetCargo(pCargo: string);
begin
  Cargo := pCargo;
end;

end.
