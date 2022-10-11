unit uDAOProdutos;

interface
uses uDAO, uDataModule, Data.DB, System.SysUtils, uProdutos;
type DAOProdutos = class   (DAO)
  private
  protected
  public
  constructor CrieObj;
    procedure SetDM(pDM: TObject);              virtual;
    function GetDS: TDataSource;                virtual;
    function Salvar(pObj: TObject): string;     virtual;
    function Carregar(pObj: TObject): string;   virtual;
    function Pesquisar(pChave: string): string; virtual;
    function Excluir(pObj: TObject): string;    virtual;
    //function ehNumero(valor: string): boolean;
    function AcheiReg() : boolean;
    destructor Destrua_se;
  end;
implementation

{ DAOProdutos }

function DAOProdutos.AcheiReg: boolean;
begin
  result := not (umDM.qProdutos.Eof);
end;

function DAOProdutos.Carregar(pObj: TObject): string;
var mProdutos : Produtos;
begin
  try
   try
      mProdutos := Produtos(pObj);
      with umDM.qProdutos DO
      begin
        mProdutos := Produtos(pObj);
        mProdutos.SetCodigo(umDM.qProdutos.FieldByName('CODPROD').value);

        result := '';
      end;
   except on e:exception do
      result:= 'Erro ao carregar: '+ e.Message;
   end;
 finally
 end;
end;

constructor DAOProdutos.CrieObj;
begin
  inherited;
end;

destructor DAOProdutos.Destrua_se;
begin

end;

function DAOProdutos.Excluir(pObj: TObject): string;
begin

end;

function DAOProdutos.GetDS: TDataSource;
begin
  result := umDm.DSProdutos;
end;

function DAOProdutos.Pesquisar(pChave: string): string;
var mSql: string;
begin
  if pChave <> '' then
    if ehNumero(pChave) then
      mSql := 'select * from produtos where codprod = '+quotedstr(pChave)
    else
      mSql := 'select * from produtos where produto = '+quotedstr(pChave)+' order by produto'
  else
    mSql := 'select * from produtos order by produto';
  umDM.qProdutos.Active := false;
  umDM.qProdutos.SQL.Text := mSql;
  umDM.qProdutos.Open();
end;

function DAOProdutos.Salvar(pObj: TObject): string;
begin

end;

procedure DAOProdutos.SetDM(pDM: TObject);
begin

end;

end.
