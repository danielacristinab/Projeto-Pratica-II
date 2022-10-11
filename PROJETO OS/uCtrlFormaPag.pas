unit uCtrlFormaPag;

interface
uses uDataModule, Data.DB, uController, uDAOFormaPag;
type CtrlFormaPag = class    (controller)
  private
  protected
    aDAOFormaPag : DAOFormaPag;
  public
    constructor CrieObj;
    procedure SetDM(pDM : TObject);             override;
    function GetDS: TDataSource;                override;
    function salvar(pObj: TObject): string;     override;
    function Pesquisar(pChave: string): string; override;
    function Carregar(pObj: TObject): string;   override;
    function Excluir(pObj: TObject): string;    override;
    function AcheiReg: boolean;
    destructor Destrua_se;
end;

implementation

{ CtrlFormaPag }

function CtrlFormaPag.AcheiReg: boolean;
begin
  result := aDAOFormaPag.AcheiReg;
end;

function CtrlFormaPag.Carregar(pObj: TObject): string;
begin
  aDAOFormaPag.Carregar(pObj);
end;

constructor CtrlFormaPag.CrieObj;
begin
  aDAOFormaPag := DAOFormaPag.CrieObj;
end;

destructor CtrlFormaPag.Destrua_se;
begin
  aDAOFormaPag.Destrua_se;
end;

function CtrlFormaPag.Excluir(pObj: TObject): string;
begin
  aDAOFormaPag.Excluir(pObj);
end;

function CtrlFormaPag.GetDS: TDataSource;
begin
 result := aDAOFormaPag.GetDS;
end;

function CtrlFormaPag.Pesquisar(pChave: string): string;
begin
  result := aDAOFormaPag.Pesquisar(pChave);
end;

function CtrlFormaPag.salvar(pObj: TObject): string;
begin
  result := aDAOFormaPag.Salvar(pObj);
end;

procedure CtrlFormaPag.SetDM(pDM: TObject);
begin
  aDAOFormaPag.SetDM(pDM);
end;

end.
