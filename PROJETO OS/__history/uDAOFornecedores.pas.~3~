unit uDAOFornecedores;

interface
uses uDAO, uFornecedores, Data.DB, System.SysUtils;
  type DAOFornecedores = class   (DAO)
    private
    protected
    public
      constructor CrieObj;
      function GetDS: TDataSource;                override;
      function Salvar(pObj: TObject): string;     override;
      function Carregar(pObj: TObject): string;   override;
      function Pesquisar(pChave: string): string; override;
      function Excluir(pObj: TObject): string;    override;
      function AcheiReg() : boolean;
      destructor Destrua_se;
  end;

implementation

{ DAOFornecedores }

constructor DAOFornecedores.CrieObj;
begin
  inherited;
end;

function DAOFornecedores.GetDS: TDataSource;
begin
  result := umDm.DSFornecedores;
end;

function DAOFornecedores.AcheiReg: boolean;
begin
  result := not (umDM.qFornecedores.Eof);
end;

function DAOFornecedores.Carregar(pObj: TObject): string;
var mFornecedores : Fornecedores;
begin
  try
   try
      mFornecedores := Fornecedores(pObj);
      with umDM.qFornecedores DO
      begin
        mFornecedores := Fornecedores(pObj);
        mFornecedores.SetCodigo(umDM.qFornecedores.FieldByName('CODCIDADE').value);
        //mFornecedores.SetCidade(umDM.qCidades.FieldByName('CIDADE').AsString);
        //mFornecedores.SetDDD(umDM.qCidades.FieldByName('DDD').AsString);
        mFornecedores.getaCidade.setCodigo(umDM.qFornecedores.FieldByName('oESTADO').Value);
        result := '';
      end;
   except on e:exception do
      result:= 'Erro ao carregar: '+ e.Message;
   end;
 finally
 end;

end;

function DAOFornecedores.Pesquisar(pChave: string): string;
var mSql: string;
begin
  if pChave <> '' then
    if ehNumero(pChave) then
      mSql := 'select * from Fornecedores where codcliente = '+quotedstr(pChave)
    else
      mSql := 'select * from Fornecedores where nome = '+quotedstr(pChave)+' order by nome'
  else
    mSql := 'select * from Fornecedores order by nome';
  umDM.qFornecedores.Active := false;
  umDM.qFornecedores.SQL.Text := mSql;
  umDM.qFornecedores.Open();
end;

function DAOFornecedores.Salvar(pObj: TObject): string;
var mSql  : string;
    mFornecedores : Fornecedores;
begin
    try
      umDM.FDTrans.StartTransaction;
      mFornecedores := Fornecedores(pObj);
      with umDM.qFornecedores do
      begin
        if mFornecedores.getCodigo = 0 then
        mSql := 'insert into Fornecedores (cidade, ddd, codestado) values ( :cidade, :ddd, :codestado)'
        else
        begin
          mSql := 'update Fornecedores set fornecedor = :cidade , ddd = :ddd, codestado = :codestado';
          mSql := mSql + 'where codFornecedor = :CodCidade;';
        end;
        umDM.qFornecedores.SQL.Clear;
        umDM.qFornecedores.SQL.Add(mSql);
        //ParamByName('CIDADE').Value := mFornecedores.getCidade;
        //ParamByName('DDD').Value := mFornecedores.getDDD;
        ParamByName('CODCIDADE').Value := mFornecedores.getaCidade.GetCidade;
        if mFornecedores.GetCodigo <> 0 then
          ParamByName('CODCIDADE').Value := mFornecedores.GetCodigo;
        ExecSQL;
      end;
      umDM.FDTrans.Commit;
    except
      umDM.FDTrans.Rollback;
end;
end;

function DAOFornecedores.Excluir(pObj: TObject): string;
var mSql  : string;
    mFornecedores : Fornecedores;
begin
  try
      mFornecedores := Fornecedores(pObj);
      mSql := 'delete * from Fornecedores where codFornecedor = '+quotedstr(inttostr(mFornecedores.getCodigo));
      umDm.FDTrans.StartTransaction;
      umDm.qFornecedores.Active:= false;
      umDm.qFornecedores.SQL.Clear;
      umDm.qFornecedores.SQL.Add(mSql);
      umDm.qFornecedores.Open;
      umDm.FDTrans.Commit;
      result := '';
   except on e: Exception do
   begin
      umDm.FDTrans.Rollback;
      result := 'Erro ao Excluir : '  + e.Message;
   end;
  end;
end;

destructor DAOFornecedores.Destrua_se;
begin

end;
end.
