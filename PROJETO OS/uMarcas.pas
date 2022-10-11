unit uMarcas;

interface
uses uPai;
type marcas = class (Pai)
   private
   protected
      marca : string[25];
   public
     constructor CrieObj;
     procedure Setmarca(pmarca: string);
     function Getmarca : string;
     function Clone : marcas;
     destructor Destrua_se;
end;
implementation

{ marcas }

function marcas.Clone: marcas;
begin
  result := marcas.CrieObj;
  result.SetCodigo(codigo);
  result.Setmarca(marca);
  result.setDataCad(dataCad);
  result.setDataCad(DataUltAlt);
end;

constructor marcas.CrieObj;
begin
  inherited;
  marca := ' ';
end;

destructor marcas.Destrua_se;
begin
  inherited;
end;

function marcas.Getmarca: string;
begin
  result := marca;
end;

procedure marcas.Setmarca(pmarca: string);
begin
  marca := pmarca;
end;

end.
