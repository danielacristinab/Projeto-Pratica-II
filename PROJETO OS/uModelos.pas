unit uModelos;

interface
uses uPai, uMarcas;
type modelos = class (Pai)
   private
   protected
      modelo : string[25];
      umaMarca : marcas;
   public
     constructor CrieObj;
     procedure Setmodelo(pmodelo: string);
     procedure SetUmaMarca(pUmaMarca: marcas);
     function Getmodelo : string;
     function GetUmaMarca : Marcas;
     function Clone : modelos;
     destructor Destrua_se;
end;
implementation

{ modelos }

function modelos.Clone: modelos;
begin
  result := modelos.CrieObj;
  result.SetCodigo(codigo);
  result.Setmodelo(modelo);
  result.SetUmaMarca(UmaMarca.clone);
  result.setDataCad(dataCad);
  result.setDataCad(DataUltAlt);
end;

constructor modelos.CrieObj;
begin
  inherited;
  modelo := ' ';
  UmaMarca := Marcas.CrieObj;
end;

destructor modelos.Destrua_se;
begin
  inherited;
end;

function modelos.Getmodelo: string;
begin
  result := modelo;
end;

function modelos.GetUmaMarca: Marcas;
begin
  result := UmaMarca;
end;

procedure modelos.Setmodelo(pmodelo: string);
begin
  modelo := pmodelo;
end;

procedure modelos.SetUmaMarca(pUmaMarca: marcas);
begin
  UmaMarca := pUmaMarca;
end;

end.
