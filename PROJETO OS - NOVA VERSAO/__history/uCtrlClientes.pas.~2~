unit uCtrlClientes;

interface
uses uController, Data.DB, uClientes, uCtrlCidades, uDAOClientes;
  type CtrlClientes = class (controller)
    private
    protected
      aDaoClientes : DAOClientes;
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

{ CtrlClientes }

function CtrlClientes.AcheiReg: boolean;
begin
  result := aDaoClientes.AcheiReg;
end;

function CtrlClientes.Carregar(pObj: TObject): string;
begin
  aDaoClientes.Carregar(pObj);
end;

constructor CtrlClientes.CrieObj;
begin
  aDaoClientes := DAOClientes.CrieObj;
end;

destructor CtrlClientes.Destrua_se;
begin
  aDaoClientes.Destrua_se;
end;

function CtrlClientes.GetaCtrlCidade: CtrlCidades;
begin
  result := aCtrlCidade;
end;

function CtrlClientes.GetDS: TDataSource;
begin
  result := aDaoClientes.GetDS;
end;

function CtrlClientes.Pesquisar(pChave: string): string;
begin
  result := aDaoClientes.Pesquisar(pChave);
end;

function CtrlClientes.salvar(pObj: TObject): string;
begin
    result := aDaoClientes.Salvar(pObj);
end;

procedure CtrlClientes.SetaCtrlCidade(pObj: TObject);
begin
   aCtrlCidade := CtrlCidades(pObj);
end;

procedure CtrlClientes.SetDM(pDM: TObject);
begin
  aDaoClientes.SetDM(pDM);
end;

end.
