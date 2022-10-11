unit uGrupos;

interface
uses uPai;
type Grupos = class (Pai)
   private
   protected
     Grupo : string;
     Descricao : string;
   public
    constructor CrieObj;
    procedure SetGrupo(pGrupo: string);
    procedure SetDescricao(pDescricao: string);
    function GetGrupo : string;
    function GetDescricao : string;
    function Clone : Grupos;
    destructor Destrua_se;
end;
implementation

{ Grupos }

function Grupos.Clone: Grupos;
begin
  result := grupos.CrieObj;
  result.setCodigo(codigo);
  result.SetGrupo(grupo);
  result.SetDescricao(Descricao);
  result.setDataCad(DataCad);
  result.setDataCad(DataUltAlt);
end;

constructor Grupos.CrieObj;
begin
  grupo := ' ';
  descricao := ' ';
end;

destructor Grupos.Destrua_se;
begin

end;

function Grupos.GetDescricao: string;
begin
  result := Descricao;
end;

function Grupos.GetGrupo: string;
begin
  result := grupo;
end;

procedure Grupos.SetDescricao(pDescricao: string);
begin
  Descricao := pDescricao;
end;

procedure Grupos.SetGrupo(pGrupo: string);
begin
  grupo := pGrupo;
end;

end.
