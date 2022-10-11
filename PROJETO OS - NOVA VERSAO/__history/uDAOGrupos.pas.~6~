unit uDAOGrupos;

interface
uses uDAO, uDataModule, Data.DB, System.SysUtils, uGrupos;
type DAOGrupos = class   (DAO)
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
    function AcheiReg() : boolean;
    destructor Destrua_se;
  end;
implementation

{ DAOGrupos }

function DAOGrupos.AcheiReg: boolean;
begin
  result := not (umDM.qGrupos.Eof);
end;

function DAOGrupos.Carregar(pObj: TObject): string;
var mGrupos : Grupos;
begin
  try
   try
      mGrupos := Grupos(pObj);
      with umDM.qProdutos DO
      begin
        mGrupos := Grupos(pObj);
        mGrupos.SetCodigo(umDM.qGrupos.FieldByName('CODGRUPO').value);
        mGrupos.SetGrupo(umDM.qGrupos.FieldByName('GRUPO').Value);
        mGrupos.SetDescricao(umDM.qGrupos.FieldByName('DESCRICAO').Value);
        result := '';
      end;
   except on e:exception do
      result:= 'Erro ao carregar: '+ e.Message;
   end;
 finally
 end;
end;

constructor DAOGrupos.CrieObj;
begin
  inherited;
end;

destructor DAOGrupos.Destrua_se;
begin

end;

function DAOGrupos.Excluir(pObj: TObject): string;
begin

end;

function DAOGrupos.GetDS: TDataSource;
begin
  result := umDm.DSGrupos;
end;

function DAOGrupos.Pesquisar(pChave: string): string;
var mSql: string;
begin
  if pChave <> '' then
    if ehNumero(pChave) then
      mSql := 'select * from grupos where codgrupo = '+quotedstr(pChave)
    else
      mSql := 'select * from grupos where grupo = '+quotedstr(pChave)+' order by grupo'
  else
    mSql := 'select * from grupos order by grupo';
  umDM.qProdutos.Active := false;
  umDM.qProdutos.SQL.Text := mSql;
  umDM.qProdutos.Open();
end;

function DAOGrupos.Salvar(pObj: TObject): string;
var mSql  : string;
    mgrupos : grupos;
begin
    try
      umDM.FDTrans.StartTransaction;
      mgrupos := grupos(pObj);
      with umDM.qGrupos do
      begin
        if mgrupos.getCodigo = 0 then
        mSql := 'insert into grupos (grupo, descricao) values ( :grupo, :descricao)'
        else
        begin
          mSql := 'update grupos set grupo = :grupo, descricao = :descricao';
          mSql := mSql + ' where codgrupo = :Codgrupo;';
        end;
        umDM.qGrupos.SQL.Clear;
        umDM.qGrupos.SQL.Add(mSql);
        ParamByName('GRUPO').Value := mgrupos.GetGrupo;
        ParamByName('DESCRICAO').Value := mgrupos.GetDescricao;
        if mgrupos.GetCodigo <> 0 then
          ParamByName('CODGRUPO').Value := mgrupos.GetCodigo;
        ExecSQL;
      end;
      umDM.FDTrans.Commit;
    except
      umDM.FDTrans.Rollback;
end;

end;

procedure DAOGrupos.SetDM(pDM: TObject);
begin

end;

end.
