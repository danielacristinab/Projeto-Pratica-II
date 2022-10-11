unit uDAOModelos;

interface
uses uDAO, umodelos, Data.DB, System.SysUtils;
  type DAOmodelos = class   (DAO)
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

{ DAOmodelos }

constructor DAOmodelos.CrieObj;
begin
  inherited;
end;

function DAOmodelos.GetDS: TDataSource;
begin
  result := umDm.DSmodelos;
end;

function DAOmodelos.AcheiReg: boolean;
begin
  result := not (umDM.qmodelos.Eof);
end;

function DAOmodelos.Carregar(pObj: TObject): string;
var mModelos : Modelos;
begin
  mModelos := Modelos(pObj);
   try
    if not umDM.trans.Active then
      umDM.trans.Active := true;
    if not umDM.qModelos.Active then
      umDM.qModelos.Open;
    if mModelos.getCodigo <> 0 then
      self.Pesquisar(inttostr(mModelos.getCodigo));
    with umDM.qModelos do
    begin
        mModelos.SetCodigo(umDM.qModelos.FieldByName('CODMODELO').value);
        mModelos.Setmodelo(umDM.qModelos.FieldByName('MODELO').Value);
        result := '';
      end;
   except on e:exception do
      result:= 'Erro ao carregar: '+ e.Message;
   end;
 end;

function DAOmodelos.Pesquisar(pChave: string): string;
var mSQL: string;
begin
  if length(pChave) = 0 then
    mSQL := 'select * from Modelos order by modelo'
  else if ehNumero(pChave) then
    mSQL := 'select * from Modelos where codmodelo=' +QuotedStr(pChave)
  else
    mSQL := 'select * from Modelos where modelo like ' + quotedstr('%' + pChave
              + '%') + 'or codmodelo like ' + quotedstr('%' + pChave + '%') +
              ' order by modelo, codmodelo';

    umDm.qModelos.Active := false;
    umDm.qModelos.SelectSQL.Text := mSQL;
  if not umDm.trans.Active then
    umDm.trans.Active := true;
  if not umDM.qModelos.Active then
    umDm.qModelos.Open;
end;

function DAOmodelos.Salvar(pObj: TObject): string;
var mSql  : string;
    mModelos : Modelos;
begin
   mModelos := Modelos(pObj);
   try
    if not umDM.Trans.InTransaction then
      umDM.Trans.StartTransaction;
    if not umDM.qModelos.Active then
      umDM.qModelos.Open;

    if mModelos.getCodigo = 0 then
      begin
        umDM.qModelos.Insert;
        //umDM.qMarcasDATCAD.Value := now;
      end
      else
      begin
        if mModelos.getCodigo <> 0 then
        begin
          umDM.qModelos.Edit;
          //umDM.qMarcasDATCAD.Value := now;
        end;
      end;
        umDM.qModelos.FieldByName('CODMODELO').Value       := mModelos.getCodigo;
        umDM.qModelos.fieldByName('MODELO').value          := mModelos.getModelo;
        umDm.qModelos.FieldByName('CODMARCA').Value        := mModelos.GetUmaMarca.GetCodigo;
        umDM.qModelos.fieldByName('DATCAD').AsDateTime     := mModelos.getDataCad;
        umDM.qModelos.fieldByName('DATULTALT').AsDateTime  := mModelos.getUltAlt;
        umDM.qModelos.Post;
        umDM.qModelos.Transaction.Commit;
   except
    umDM.qModelos.Transaction.Rollback;
  end;
end;

function DAOmodelos.Excluir(pObj: TObject): string;
var mSql  : string;
    mModelos : Modelos;
begin
  try
    mModelos := Modelos(pObj);
    mSql := 'delete from marcas where codMarca = '+inttostr(mModelos.getCodigo);
    umDM.qModelos.Active := false;
    umDM.qModelos.SelectSQL.Text := mSQL;
    if not umDM.trans.Active then
      umDM.trans.Active := true;
    if not umDM.qModelos.Active then
      umDM.qModelos.Open;
      umDM.qModelos.Transaction.CommitRetaining;
      result := '';
    except on e: Exception do
    begin
      umDM.Trans.Rollback;
      result := 'Erro ao Excluir : '  + e.Message;
    end;
   end;
end;

destructor DAOmodelos.Destrua_se;
begin

end;
end.
