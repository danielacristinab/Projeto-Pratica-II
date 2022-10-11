unit uCargos;

interface
uses uPai, uPessoa;
type Cargos = class (Pessoa)
   private
   protected
      Cargo : string[25];
   public
     constructor CrieObj;
     procedure SetCargo(pCargo: string);
     function GetCargo : string;
     destructor Destrua_se;
end;
implementation

{ Cargos }

constructor Cargos.CrieObj;
begin
  cargo := ' ';
end;

destructor Cargos.Destrua_se;
begin

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
