unit uCtrlEstados;

interface
uses uController, uDAOEstados,  uDataModule, Data.DB, uEstados, uCtrlPaises;
  type CtrlEstados = class (controller)
    private
    protected
      aDaoEstados : DAOEstados;
      aCtrlPais : CtrlPaises;
    public
      constructor CrieObj;
      procedure SetaCtrlPais(pObj: TObject);
      function GetaCtrlPais: CtrlPaises;
      procedure SetDM(pDM : TObject);             override;
      function GetDS: TDataSource;                override;
      function salvar(pObj: TObject): string;     override;
      function Pesquisar(pChave: string): string; override;
      function Carregar(pObj: TObject): string;   override;
      function AcheiReg: boolean;
      destructor Destrua_se;
  end;
implementation

{ CtrlEstados }

constructor CtrlEstados.CrieObj;
begin
  aDaoEstados := DAOEstados.CrieObj;
end;

function CtrlEstados.AcheiReg: boolean;
begin
  result := aDaoEstados.AcheiReg;
end;

function CtrlEstados.Carregar(pObj: TObject): string;
begin
  aDaoEstados.Carregar(pObj);
end;

function CtrlEstados.GetaCtrlPais: CtrlPaises;
begin
  result := aCtrlPais;
end;

function CtrlEstados.GetDS: TDataSource;
begin
  result := aDaoEstados.GetDS;
end;

function CtrlEstados.Pesquisar(pChave: string): string;
begin
  result := aDaoEstados.Pesquisar(pChave);
end;

function CtrlEstados.salvar(pObj: TObject): string;
begin
  result := aDaoEstados.Salvar(pObj);
end;

procedure CtrlEstados.SetaCtrlPais(pObj: TObject);
begin
  aCtrlPais := CtrlPaises(pObj);
end;

procedure CtrlEstados.SetDM(pDM: TObject);
begin
  inherited;
  aDaoEstados.SetDM(pDM);
end;

destructor CtrlEstados.Destrua_se;
begin
  aDaoEstados.Destrua_se;
end;
end.
