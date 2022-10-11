unit uCtrlModelos;

interface
uses uDataModule, Data.DB, uController, uDAOmodelos, uCtrlMarcas;
type Ctrlmodelos = class   (controller)
  private
  protected
    aDAOmodelos : DAOmodelos;
    aCtrlMarca : CtrlMarcas;
  public
    constructor CrieObj;
    procedure SetaCtrlMarca(pObj: TObject);
    function GetaCtrlMarca: CtrlMarcas;
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

{ Ctrlmodelos }

function Ctrlmodelos.AcheiReg: boolean;
begin
  result := aDaomodelos.AcheiReg;
end;

function Ctrlmodelos.Carregar(pObj: TObject): string;
begin
  aDaomodelos.Carregar(pObj);
end;

constructor Ctrlmodelos.CrieObj;
begin
  aDaomodelos := DAOmodelos.CrieObj;
end;

destructor Ctrlmodelos.Destrua_se;
begin
  aDaomodelos.Destrua_se;
end;

function Ctrlmodelos.Excluir(pObj: TObject): string;
begin
  aDaomodelos.Excluir(pObj);
end;

function Ctrlmodelos.GetaCtrlMarca: CtrlMarcas;
begin
  result := aCtrlMarca;
end;

function Ctrlmodelos.GetDS: TDataSource;
begin
  result := aDaomodelos.GetDS;
end;

function Ctrlmodelos.Pesquisar(pChave: string): string;
begin
  result := aDaomodelos.Pesquisar(pChave);
end;

function Ctrlmodelos.salvar(pObj: TObject): string;
begin
  result := aDaomodelos.Salvar(pObj);
end;

procedure Ctrlmodelos.SetaCtrlMarca(pObj: TObject);
begin
  aCtrlMarca := CtrlMarcas(pObj);
end;

procedure Ctrlmodelos.SetDM(pDM: TObject);
begin
  aDaomodelos.SetDM(pDM);
end;

end.

