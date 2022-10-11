unit uCtrlFuncionarios;

interface
uses uController, Data.DB, uFuncionarios, uCtrlCidades, uDAOFuncionarios;
  type CtrlFuncionarios = class (controller)
    private
    protected
      aDaoFuncionarios : DAOFuncionarios;
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

{ CtrlFuncionarios }

function CtrlFuncionarios.AcheiReg: boolean;
begin
  result := aDaoFuncionarios.AcheiReg;
end;

function CtrlFuncionarios.Carregar(pObj: TObject): string;
begin
  aDaoFuncionarios.Carregar(pObj);
end;

constructor CtrlFuncionarios.CrieObj;
begin
  aDaoFuncionarios := DAOFuncionarios.CrieObj;
end;

destructor CtrlFuncionarios.Destrua_se;
begin
  aDaoFuncionarios.Destrua_se;
end;

function CtrlFuncionarios.GetaCtrlCidade: CtrlCidades;
begin
  result := aCtrlCidade;
end;

function CtrlFuncionarios.GetDS: TDataSource;
begin
  result := aDaoFuncionarios.GetDS;
end;

function CtrlFuncionarios.Pesquisar(pChave: string): string;
begin
  result := aDaoFuncionarios.Pesquisar(pChave);
end;

function CtrlFuncionarios.salvar(pObj: TObject): string;
begin
    result := aDaoFuncionarios.Salvar(pObj);
end;

procedure CtrlFuncionarios.SetaCtrlCidade(pObj: TObject);
begin
   aCtrlCidade := CtrlCidades(pObj);
end;

procedure CtrlFuncionarios.SetDM(pDM: TObject);
begin
  aDaoFuncionarios.SetDM(pDM);
end;

end.
