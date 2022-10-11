unit uCtrlProdutos;

interface
uses uDataModule, Data.DB, uDAOProdutos, uCtrlModelos, uCtrlGrupos, uCtrlFornecedores,
    uController;
type CtrlProdutos = class  (controller)
  private
  protected
    aDAOProdutos : DAOProdutos;
    aCtrlGrupos : CtrlGrupos;
    aCtrlModelos : CtrlModelos;
    aCtrlFornecedores : CtrlFornecedores;
  public
    constructor CrieObj;
    procedure SetaCtrlGrupos(pObj: TObject);
    procedure SetaCtrlModelos(pObj: TObject);
    procedure SetaCtrlFornecedores(pObj: TObject);
    function GetaCtrlGrupos: CtrlGrupos;
    function GetaCtrlModelos: CtrlModelos;
    function GetaCtrlFornecedores : CtrlFornecedores;
    procedure SetDM(pDM : TObject);             override;
    function GetDS: TDataSource;                override;
    function salvar(pObj: TObject): string;     override;
    function Pesquisar(pChave: string): string; override;
    function Carregar(pObj: TObject): string;   override;
    function Excluir(pObj: TObject): string;    override;
    destructor Destrua_se;
end;
implementation

{ CtrlProdutos }

function CtrlProdutos.Carregar(pObj: TObject): string;
begin
  aDAOProdutos.Carregar(pObj);
end;

constructor CtrlProdutos.CrieObj;
begin
  aDAOProdutos := DAOProdutos.CrieObj;
end;

destructor CtrlProdutos.Destrua_se;
begin
  aDAOProdutos.Destrua_se;
end;

function CtrlProdutos.Excluir(pObj: TObject): string;
begin
 aDAOProdutos.Excluir(pObj);
end;

function CtrlProdutos.GetaCtrlFornecedores: CtrlFornecedores;
begin
  result := aCtrlFornecedores;
end;

function CtrlProdutos.GetaCtrlGrupos: CtrlGrupos;
begin
  result := aCtrlGrupos;
end;

function CtrlProdutos.GetaCtrlModelos: CtrlModelos;
begin
 result := aCtrlModelos;
end;

function CtrlProdutos.GetDS: TDataSource;
begin
  result := aDAOProdutos.GetDS;
end;

function CtrlProdutos.Pesquisar(pChave: string): string;
begin
  result := aDAOProdutos.Pesquisar(pChave);
end;

function CtrlProdutos.salvar(pObj: TObject): string;
begin
  result := aDAOProdutos.Salvar(pObj);
end;

procedure CtrlProdutos.SetaCtrlFornecedores(pObj: TObject);
begin
  aCtrlFornecedores := CtrlFornecedores(pObj);
end;

procedure CtrlProdutos.SetaCtrlGrupos(pObj: TObject);
begin
  aCtrlGrupos := CtrlGrupos(pObj);
end;

procedure CtrlProdutos.SetaCtrlModelos(pObj: TObject);
begin
  aCtrlModelos := CtrlModelos(pObj);
end;

procedure CtrlProdutos.SetDM(pDM: TObject);
begin
  inherited;
  aDAOProdutos.SetDM(pDm);
end;

end.
