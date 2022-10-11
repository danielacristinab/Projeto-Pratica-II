unit uDAO;

interface
uses uDataModule, Data.DB, System.SysUtils;
type DAO = class
  private
  protected
    umDM : TDM;
  public
  constructor CrieObj;
    procedure SetDM(pDM: TObject);              virtual;
    function GetDS: TDataSource;                virtual;
    function Salvar(pObj: TObject): string;     virtual;
    function Carregar(pObj: TObject): string;   virtual;
    function Pesquisar(pChave: string): string; virtual;
    function Excluir(pObj: TObject): string;    virtual;
    function ehNumero(valor: string): boolean;
    function AcheiReg() : boolean;
    destructor Destrua_se;
  end;
implementation

{ DAO }

constructor DAO.CrieObj;
begin

end;

function DAO.AcheiReg: boolean;
begin
  result := not (umDM.qPaises.Eof);
end;

function DAO.Carregar(pObj: TObject): string;
begin

end;

function DAO.Excluir(pObj: TObject): string;
begin

end;

function DAO.GetDS: TDataSource;
begin

end;

function DAO.Pesquisar(pChave: string): string;
begin

end;

function DAO.Salvar(pObj: TObject): string;
begin

end;

procedure DAO.SetDM(pDM: TObject);
begin
  umDM := TDM(pDM)
end;

function DAO.ehNumero(valor: string): boolean;
var
  mValor : integer;
begin
  result := TryStrToInt(Valor, mValor);
end;

destructor DAO.Destrua_se;
begin

end;



end.

