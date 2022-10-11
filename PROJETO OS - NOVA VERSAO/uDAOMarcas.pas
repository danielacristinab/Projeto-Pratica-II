unit uDAOMarcas;

interface
uses uDAO, umarcas, Data.DB, System.SysUtils;
  type DAOmarcas = class   (DAO)
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

{ DAOmarcas }

constructor DAOmarcas.CrieObj;
begin
  inherited;
end;

function DAOmarcas.GetDS: TDataSource;
begin
  result := umDm.DSMarcas;
end;

function DAOmarcas.AcheiReg: boolean;
begin
  result := not (umDM.qmarcas.Eof);
end;

function DAOmarcas.Carregar(pObj: TObject): string;
var mMarcas : marcas;
begin
  mMarcas := marcas(pObj);
   try
    if not umDM.trans.Active then
      umDM.trans.Active := true;
    if not umDM.qMarcas.Active then
      umDM.qMarcas.Open;
    if mMarcas.getCodigo <> 0 then
      self.Pesquisar(inttostr(mMarcas.getCodigo));
    with umDM.qMarcas do
    begin
      mMarcas.SetCodigo(umDM.qMarcas.FieldByName('CODMARCA').value);
      mMarcas.Setmarca(umDM.qMarcas.FieldByName('MARCA').Value);

      result := '';
    end;
   except on e:exception do
    result:= 'Erro ao carregar: '+ e.Message;
   end;
end;

function DAOmarcas.Pesquisar(pChave: string): string;
var mSQL: string;
begin
  if length(pChave) = 0 then
    mSQL := 'select * from marcas order by marca'
  else if ehNumero(pChave) then
    mSQL := 'select * from marcas where codmarca=' +QuotedStr(pChave)
  else
    mSQL := 'select * from marcas where marca like ' + quotedstr('%' + pChave
              + '%') + 'or codmarca like ' + quotedstr('%' + pChave + '%') +
              ' order by marca, codmarca';

    umDm.qMarcas.Active := false;
    umDm.qMarcas.SelectSQL.Text := mSQL;
  if not umDm.trans.Active then
    umDm.trans.Active := true;
  if not umDM.qMarcas.Active then
    umDm.qMarcas.Open;
end;

function DAOmarcas.Salvar(pObj: TObject): string;
var mSql  : string;
    mMarca : Marcas;
begin
   mMarca := Marcas(pObj);
   try
    if not umDM.Trans.InTransaction then
      umDM.Trans.StartTransaction;
    if not umDM.qMarcas.Active then
      umDM.qMarcas.Open;

    if mMarca.getCodigo = 0 then
      begin
        umDM.qMarcas.Insert;
        //umDM.qMarcasDATCAD.Value := now;
      end
      else
      begin
        if mMarca.getCodigo <> 0 then
        begin
          umDM.qMarcas.Edit;
          //umDM.qMarcasDATCAD.Value := now;
        end;
      end;
        umDM.qMarcas.FieldByName('CODMARCA').Value        := mMarca.getCodigo;
        umDM.qMarcas.fieldByName('MARCA').value           := mMarca.getMarca;
        umDM.qMarcas.fieldByName('DATCAD').AsDateTime     := mMarca.getDataCad;
        umDM.qMarcas.fieldByName('DATULTALT').AsDateTime  := mMarca.getUltAlt;
        umDM.qMarcas.Post;
        umDM.qMarcas.Transaction.Commit;
   except
    umDM.qMarcas.Transaction.Rollback;
  end;
end;

function DAOmarcas.Excluir(pObj: TObject): string;
var mSql  : string;
    mMarcas : Marcas;
begin
  try
    mMarcas := Marcas(pObj);
    mSql := 'delete from marcas where codMarca = '+inttostr(mMarcas.getCodigo);
    umDM.qMarcas.Active := false;
    umDM.qMarcas.SelectSQL.Text := mSQL;
    if not umDM.trans.Active then
      umDM.trans.Active := true;
    if not umDM.qMarcas.Active then
      umDM.qMarcas.Open;
      umDM.qMarcas.Transaction.CommitRetaining;
      result := '';
    except on e: Exception do
    begin
      umDM.Trans.Rollback;
      result := 'Erro ao Excluir : '  + e.Message;
    end;
   end;
end;

destructor DAOmarcas.Destrua_se;
begin

end;
end.
