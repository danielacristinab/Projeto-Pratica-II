unit uDAOFormaPag;

interface
uses uDAO, uFormasPagamento, Data.DB, System.SysUtils;
  type DAOFormaPag = class   (DAO)
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

{ DAOFormaPag }

function DAOFormaPag.AcheiReg: boolean;
begin
  result := not (umDM.qFormaPag.Eof);
end;

function DAOFormaPag.Carregar(pObj: TObject): string;
var mFormaPag : FormasPagamento;
begin
  mFormaPag := FormasPagamento(pObj);
  try
    if not umDM.trans.Active then
      umDM.trans.Active := true;
    if not umDM.qFormaPag.Active then
      umDM.qFormaPag.Open;
    if mFormaPag.getCodigo <> 0 then
      self.Pesquisar(inttostr(mFormaPag.getCodigo));
    with umDM.qFormaPag do
    begin
        mFormaPag.SetCodigo(umDM.qFormaPag.FieldByName('CODFORMAPAG').value);
        mFormaPag.SetFormaPagamento(umDM.qFormaPag.FieldByName('FORMAPAG').Value);
        result := '';
      end;
   except on e:exception do
      result:= 'Erro ao carregar: '+ e.Message;
   end;
 end;



constructor DAOFormaPag.CrieObj;
begin
  inherited;
end;

destructor DAOFormaPag.Destrua_se;
begin

end;

function DAOFormaPag.Excluir(pObj: TObject): string;
var mFormaPag : FormasPagamento;
    mSql: string;
begin
  try
    mFormaPag := FormasPagamento(pObj);
    mSql := 'delete from formaspagamento where codformapag = '+inttostr(mFormaPag.getCodigo);
    umDM.qFormaPag.Active := false;
    umDM.qFormaPag.SelectSQL.Text := mSQL;
    if not umDM.trans.Active then
      umDM.trans.Active := true;
    if not umDM.qFormaPag.Active then
      umDM.qFormaPag.Open;
      umDM.qFormaPag.Transaction.CommitRetaining;
      result := '';
    except on e: Exception do
    begin
      umDM.Trans.Rollback;
      result := 'Erro ao Excluir : '  + e.Message;
    end;
   end;
end;

function DAOFormaPag.GetDS: TDataSource;
begin
  result := umDm.DSFormaPag;
end;

function DAOFormaPag.Pesquisar(pChave: string): string;
var mSql: string;
begin
  if length(pChave) = 0 then
    mSQL := 'select * from formaspagamento order by formapag'
  else if ehNumero(pChave) then
    mSQL := 'select * from formaspagamento where codformapag=' +QuotedStr(pChave)
  else
    mSQL := 'select * from formaspagamento where formapag like ' + quotedstr('%' + pChave
              + '%') + 'or codformapag like ' + quotedstr('%' + pChave + '%') +
              ' order by formaspagamento, codformapag';

    umDm.qFormaPag.Active := false;
    umDm.qFormaPag.SelectSQL.Text := mSQL;
  if not umDm.trans.Active then
    umDm.trans.Active := true;
  if not umDM.qFormaPag.Active then
    umDm.qFormaPag.Open;
end;

function DAOFormaPag.Salvar(pObj: TObject): string;
var mSql  : string;
    mFormaPag : FormasPagamento;
begin
    mFormaPag := FormasPagamento(pObj);
    try
      if not umDM.Trans.InTransaction then
        umDM.Trans.StartTransaction;
      if not umDM.qFormaPag.Active then
        umDM.qFormaPag.Open;

      if mFormaPag.getCodigo = 0 then
      begin
        umDM.qFormaPag.Insert;
        umDM.qFormaPagDATCAD.Value := now;
      end
      else
      begin
        if mFormaPag.getCodigo <> 0 then
        begin
          umDM.qFormaPag.Edit;
          umDM.qFormaPagDATCAD.Value := now;
        end;
      end;
        umDM.qFormaPag.FieldByName('CODFORMAPAG').Value     := mFormaPag.getCodigo;
        umDM.qFormaPag.fieldByName('FORMAPAG').value        := mFormaPag.GetFormaPagamento;
        umDM.qFormaPag.fieldByName('DATCAD').AsDateTime     := mFormaPag.getDataCad;
        umDM.qFormaPag.fieldByName('DATULTALT').AsDateTime  := mFormaPag.getUltAlt;
        umDM.qFormaPag.Post;
        umDM.qFormaPag.Transaction.Commit;
   except
    umDM.qFormaPag.Transaction.Rollback;
    end;
end;
end.
