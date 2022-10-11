unit uDAOCidades;

interface
uses uDAO, uCidades, Data.DB, System.SysUtils;
  type DAOCidades = class   (DAO)
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

{ DAOCidades }

constructor DAOCidades.CrieObj;
begin
  inherited;
end;

function DAOCidades.GetDS: TDataSource;
begin
  result := umDm.DSCidades;
end;

function DAOCidades.AcheiReg: boolean;
begin
  result := not (umDM.qEstados.Eof);
end;

function DAOCidades.Carregar(pObj: TObject): string;
var mCidade : Cidades;
begin
  mCidade := Cidades(pObj);
   try
    if not umDM.trans.Active then
      umDM.trans.Active := true;
    if not umDM.qCidades.Active then
      umDM.qCidades.Open;
    if mCidade.getCodigo <> 0 then
      self.Pesquisar(inttostr(mCidade.getCodigo));
    with umDM.qCidades do
    begin
      mCidade.SetCodigo(umDM.qCidades.FieldByName('CODCIDADE').value);
      mCidade.SetCidade(umDM.qCidades.FieldByName('CIDADE').AsString);
      mCidade.SetDDD(umDM.qCidades.FieldByName('DDD').AsString);
      mCidade.getoEstado.setCodigo(umDM.qCidades.FieldByName('CODESTADO').value);

      result := '';
    end;
   except on e:exception do
    result:= 'Erro ao carregar: '+ e.Message;
   end;
 end;


function DAOCidades.Pesquisar(pChave: string): string;
var mSql: string;
begin
  if length(pChave) = 0 then
    mSQL := 'select * from cidades order by cidade'
  else if ehNumero(pChave) then
    mSQL := 'select * from cidades where codcidade=' +QuotedStr(pChave)
  else
    mSQL := 'select * from cidades where cidade like ' + quotedstr('%' + pChave
              + '%') + 'or codcidade like ' + quotedstr('%' + pChave + '%') +
              ' order by cidade, codcidade';

    umDm.qCidades.Active := false;
    umDm.qCidades.SelectSQL.Text := mSQL;
  if not umDm.trans.Active then
    umDm.trans.Active := true;
  if not umDM.qCidades.Active then
    umDm.qCidades.Open;
end;

function DAOCidades.Salvar(pObj: TObject): string;
var mSql  : string;
    mCidades : Cidades;
begin
    mCidades := Cidades(pObj);
    try
      if not umDM.Trans.InTransaction then
        umDM.Trans.StartTransaction;
      if not umDM.qCidades.Active then
        umDM.qCidades.Open;

      if mCidades.getCodigo = 0 then
      begin
        umDM.qCidades.Insert;
        //umDM.qCidadesDATCAD.Value := now;
      end
      else
      begin
        if mCidades.getCodigo <> 0 then
        begin
          umDM.qCidades.Edit;
          //umDM.qCidadesDATCAD.Value := now;
        end;
      end;
        umDM.qCidades.FieldByName('CODCIDADE').Value      := mCidades.getCodigo;
        umDM.qCidades.fieldByName('CIDADE').value         := mCidades.getCidade;
        umDM.qCidades.fieldByName('DDD').value            := mCidades.getDDD;
        umDM.qCidades.fieldByName('CODESTADO').value      := mCidades.getoEstado.GetCodigo;
        umDM.qCidades.fieldByName('DATCAD').AsDateTime    := mCidades.getDataCad;
        umDM.qCidades.fieldByName('DATULTALT').AsDateTime := mCidades.getUltAlt;
        umDM.qCidades.Post;
        umDM.qCidades.Transaction.Commit;
   except
    umDM.qCidades.Transaction.Rollback;
  end;
end;

function DAOCidades.Excluir(pObj: TObject): string;
var mSql  : string;
    mCidade : Cidades;
begin
  try
    mCidade := Cidades(pObj);
    mSql := 'delete from cidades where codCidade = '+inttostr(mCidade.getCodigo);
    umDM.qCidades.Active := false;
    umDM.qCidades.SelectSQL.Text := mSQL;
    if not umDM.trans.Active then
      umDM.trans.Active := true;
    if not umDM.qCidades.Active then
      umDM.qCidades.Open;
      umDM.qCidades.Transaction.CommitRetaining;
      result := '';
    except on e: Exception do
    begin
      umDM.Trans.Rollback;
      result := 'Erro ao Excluir : '  + e.Message;
    end;
   end;
end;

destructor DAOCidades.Destrua_se;
begin

end;
end.
