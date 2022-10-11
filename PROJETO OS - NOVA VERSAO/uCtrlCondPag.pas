unit uCtrlCondPag;

interface
uses uDataModule, Data.DB, uController, uDAOCondPag, uCtrlFormaPag;
type CtrlCondPag = class (controller)
  private
  protected
    aDAOCondPag : DAOCondPag;
    aCtrlFormaPag : CtrlFormaPag;
  public
    constructor CrieObj;
    procedure SetaCtrlFormaPag(pObj: TObject);
    function GetaCtrlFormaPag: CtrlFormaPag;
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

{ CtrlCondPag }

function CtrlCondPag.AcheiReg: boolean;
begin
  result := aDaoCondPag.AcheiReg;
end;

function CtrlCondPag.Carregar(pObj: TObject): string;
begin
  aDaoCondPag.Carregar(pObj);
end;

constructor CtrlCondPag.CrieObj;
begin
  aDaoCondPag := DaoCondPag.CrieObj;
end;

destructor CtrlCondPag.Destrua_se;
begin
  aDaoCondPag.Destrua_se;
end;

function CtrlCondPag.Excluir(pObj: TObject): string;
begin
  aDaoCondPag.Excluir(pObj);
end;

function CtrlCondPag.GetaCtrlFormaPag: CtrlFormaPag;
begin
  result := aCtrlFormaPag;
end;

function CtrlCondPag.GetDS: TDataSource;
begin
  result := aDaoCondPag.GetDS;
end;

function CtrlCondPag.Pesquisar(pChave: string): string;
begin
  result := aDaoCondPag.Pesquisar(pChave)
end;

function CtrlCondPag.salvar(pObj: TObject): string;
begin
  result := aDaoCondPag.Salvar(pObj);
end;

procedure CtrlCondPag.SetaCtrlFormaPag(pObj: TObject);
begin
  aCtrlFormaPag := CtrlFormaPag(pObj);
end;

procedure CtrlCondPag.SetDM(pDM: TObject);
begin
  aDaoCondPag.SetDM(pDM);
end;

end.
