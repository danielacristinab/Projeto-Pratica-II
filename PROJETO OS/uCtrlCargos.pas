unit uCtrlCargos;

interface
uses uDataModule, Data.DB, uController, uDAOCargos;
type CtrlCargos = class
  private
  protected
    aDAOCargos : DAOCargos;
  public
    constructor CrieObj;
    procedure SetDM(pDM : TObject);             virtual;
    function GetDS: TDataSource;                virtual;
    function salvar(pObj: TObject): string;     virtual;
    function Pesquisar(pChave: string): string; virtual;
    function Carregar(pObj: TObject): string;   virtual;
    function Excluir(pObj: TObject): string;    virtual;
    function AcheiReg: boolean;
    destructor Destrua_se;
end;

implementation

{ CtrlCargos }

function CtrlCargos.AcheiReg: boolean;
begin
  result := aDaoCargos.AcheiReg;
end;

function CtrlCargos.Carregar(pObj: TObject): string;
begin
  aDaoCargos.Carregar(pObj);
end;

constructor CtrlCargos.CrieObj;
begin
  aDaoCargos := DAOCargos.CrieObj;
end;

destructor CtrlCargos.Destrua_se;
begin
  aDaoCargos.Destrua_se;
end;

function CtrlCargos.Excluir(pObj: TObject): string;
begin
  aDaoCargos.Excluir(pObj);
end;

function CtrlCargos.GetDS: TDataSource;
begin
  result := aDaoCargos.GetDS;
end;

function CtrlCargos.Pesquisar(pChave: string): string;
begin
  result := aDaoCargos.Pesquisar(pChave);
end;

function CtrlCargos.salvar(pObj: TObject): string;
begin
  result := aDaoCargos.Salvar(pObj);
end;

procedure CtrlCargos.SetDM(pDM: TObject);
begin
  aDaoCargos.SetDM(pDM);
end;

end.

