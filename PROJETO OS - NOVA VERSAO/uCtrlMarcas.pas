unit uCtrlMarcas;

interface
uses uDataModule, Data.DB, uController, uDAOmarcas;
type Ctrlmarcas = class  (controller)
  private
  protected
    aDAOmarcas : DAOmarcas;
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

{ Ctrlmarcas }

function Ctrlmarcas.AcheiReg: boolean;
begin
  result := aDaomarcas.AcheiReg;
end;

function Ctrlmarcas.Carregar(pObj: TObject): string;
begin
  aDaomarcas.Carregar(pObj);
end;

constructor Ctrlmarcas.CrieObj;
begin
  aDaomarcas := DAOmarcas.CrieObj;
end;

destructor Ctrlmarcas.Destrua_se;
begin
  aDaomarcas.Destrua_se;
end;

function Ctrlmarcas.Excluir(pObj: TObject): string;
begin
  aDaomarcas.Excluir(pObj);
end;

function Ctrlmarcas.GetDS: TDataSource;
begin
  result := aDaomarcas.GetDS;
end;

function Ctrlmarcas.Pesquisar(pChave: string): string;
begin
  result := aDaomarcas.Pesquisar(pChave);
end;

function Ctrlmarcas.salvar(pObj: TObject): string;
begin
  result := aDaomarcas.Salvar(pObj);
end;

procedure Ctrlmarcas.SetDM(pDM: TObject);
begin
  aDaomarcas.SetDM(pDM);
end;

end.

