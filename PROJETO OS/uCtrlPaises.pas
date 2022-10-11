unit uCtrlPaises;

interface
uses uController, uDAOPaises, uDataModule, Data.DB, uPaises;
  type CtrlPaises = class (controller)
    private
    protected
      aDaoPaises : DaoPaises;
    public
    constructor CrieObj;
    procedure SetDM(pDM : TObject);             override;
    function GetDS: TDataSource;                override;
    function salvar(pObj: TObject): string;     override;
    function Pesquisar(pChave: string): string; override;
    function Carregar(pObj: TObject): string;   override;
    function Excluir(pObj: TObject): string;    override;
    function AcheiReg() : boolean;
    destructor Destrua_se;
  end;

implementation

{ CtrlPaises }



function CtrlPaises.AcheiReg: boolean;
begin
  result := aDaoPaises.AcheiReg;
end;

function CtrlPaises.Carregar(pObj: TObject): string;
begin
  aDaoPaises.Carregar(pObj);
end;

constructor CtrlPaises.CrieObj;
begin
  aDaoPaises := DAOPaises.CrieObj;
end;

function CtrlPaises.GetDS: TDataSource;
begin
  result := aDaoPaises.GetDS;
end;

function CtrlPaises.Pesquisar(pChave: string): string;
begin
  result := aDaoPaises.Pesquisar(pChave);
end;

function CtrlPaises.salvar(pObj: TObject): string;
begin
 result := aDaoPaises.Salvar(pObj);
end;

procedure CtrlPaises.SetDM(pDM: TObject);
begin
  inherited;
  aDaoPaises.SetDM(pDm);
end;

destructor CtrlPaises.Destrua_se;
begin
  aDaoPaises.Destrua_se;
end;

function CtrlPaises.Excluir(pObj: TObject): string;
begin
  aDaoPaises.Excluir(pObj);
end;

end.
