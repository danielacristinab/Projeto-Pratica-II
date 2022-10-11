unit uCtrlFornecedores;

interface
uses uController, Data.DB, uFornecedores, uCtrlCidades, uDAOFornecedores;
  type CtrlFornecedores = class (controller)
    private
    protected
      aDaoFornecedores : DAOFornecedores;
      aCtrlCidade : CtrlCidades;
    public
      constructor CrieObj;
      procedure SetaCtrlCidade(pObj: TObject);
      function GetaCtrlCidade: CtrlCidades;
      procedure SetDM(pDM : TObject);           override;
      function GetDS: TDataSource;              override;
      function salvar(pObj: TObject): string;   override;
      function Pesquisar(pChave: string): string; override;
      function Carregar(pObj: TObject): string;   override;
      function AcheiReg: boolean;
      destructor Destrua_se;
  end;
implementation

{ CtrlFornecedores }

function CtrlFornecedores.AcheiReg: boolean;
begin
  result := aDaoFornecedores.AcheiReg;
end;

function CtrlFornecedores.Carregar(pObj: TObject): string;
begin
  aDaoFornecedores.Carregar(pObj);
end;

constructor CtrlFornecedores.CrieObj;
begin
  aDaoFornecedores := DAOFornecedores.CrieObj;
end;

destructor CtrlFornecedores.Destrua_se;
begin
  aDaoFornecedores.Destrua_se;
end;

function CtrlFornecedores.GetaCtrlCidade: CtrlCidades;
begin
  result := aCtrlCidade;
end;

function CtrlFornecedores.GetDS: TDataSource;
begin
  result := aDaoFornecedores.GetDS;
end;

function CtrlFornecedores.Pesquisar(pChave: string): string;
begin
  result := aDaoFornecedores.Pesquisar(pChave);
end;

function CtrlFornecedores.salvar(pObj: TObject): string;
begin
    result := aDaoFornecedores.Salvar(pObj);
end;

procedure CtrlFornecedores.SetaCtrlCidade(pObj: TObject);
begin
   aCtrlCidade := CtrlCidades(pObj);
end;

procedure CtrlFornecedores.SetDM(pDM: TObject);
begin
  aDaoFornecedores.SetDM(pDM);
end;

end.
