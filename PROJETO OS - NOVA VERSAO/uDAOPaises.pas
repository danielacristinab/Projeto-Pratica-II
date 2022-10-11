unit uDAOPaises;

interface
uses uDAO, uPaises, Data.DB, System.SysUtils, Datasnap.DBClient;
  type DAOPaises = class   (DAO)
    private
    protected
    public
      constructor CrieObj;
      function GetDS: TDataSource;
      function Salvar(pObj: TObject): string;     override;
      function Carregar(pObj: TObject): string;   override;
      function Pesquisar(pChave: string): string; override;
      function Excluir(pObj: TObject): string;    override;
      function AcheiReg(): boolean;
      destructor Destrua_se;
  end;

implementation

{ DAOPaises }

constructor DAOPaises.CrieObj;
begin
  inherited;
end;

function DAOPaises.AcheiReg: boolean;
begin
  result := not( umDM.qPaises.Eof);
end;

function DAOPaises.Carregar(pObj: TObject): string;
var mPais : Paises;
begin
  mPais := Paises(pObj);
   try
    if not umDM.trans.Active then
      umDM.trans.Active := true;
    if not umDM.qPaises.Active then
      umDM.qPaises.Open;
    if mPais.getCodigo <> 0 then
      self.Pesquisar(inttostr(mPais.getCodigo));
    with umDM.qPaises do
    begin
      mPais.SetCodigo(umDM.qPaises.FieldByName('CODPAIS').value);
      mPais.SetPais(umDM.qPaises.FieldByName('PAIS').AsString);
      mPais.SetDDI(umDM.qPaises.FieldByName('DDI').AsString);
      mPais.SetSigla(umDM.qPaises.FieldByName('SIGLA').AsString);
      mPais.SetMoeda(umDM.qPaises.FieldByName('MOEDA').AsString);

      result := '';
    end;
   except on e:exception do
    result:= 'Erro ao carregar: '+ e.Message;
   end;
end;

function DAOPaises.GetDS: TDataSource;
begin
    result := umDm.DSPaises;
end;

function DAOPaises.Pesquisar(pChave: string): string;
var mSql: string;
begin
  if length(pChave) = 0 then
    mSQL := 'select * from paises order by pais'
  else if ehNumero(pChave) then
    mSQL := 'select * from paises where codpais=' +QuotedStr(pChave)
  else
    mSQL := 'select * from paises where pais like ' + quotedstr('%' + pChave
              + '%') + 'or codpais like ' + quotedstr('%' + pChave + '%') +
              ' order by pais, codpais';

    umDm.qPaises.Active := false;
    umDm.qPaises.SelectSQL.Text := mSQL;
  if not umDm.trans.Active then
    umDm.trans.Active := true;
  if not umDM.qPaises.Active then
    umDm.qPaises.Open;
end;

function DAOPaises.Salvar(pObj: TObject): string;
var mSql  : string;
    mPais : Paises;
begin
    mPais := Paises(pObj);
    try
      if not umDM.Trans.InTransaction then
        umDM.Trans.StartTransaction;
      if not umDM.qPaises.Active then
        umDM.qPaises.Open;

      if mPais.getCodigo = 0 then
      begin
        umDM.qPaises.Insert;
        umDM.qPaisesDATCAD.Value := now;
      end
      else
      begin
        if mPais.getCodigo <> 0 then
        begin
          umDM.qPaises.Edit;
          umDM.qPaisesDATCAD.Value := now;
        end;
      end;
        umDM.qPaises.FieldByName('CODPAIS').Value          := mPais.getCodigo;
        umDM.qPaises.fieldByName('PAIS').value             := mPais.getPais;
        umDM.qPaises.fieldByName('DDI').value              := mPais.getDDI;
        umDM.qPaises.fieldByName('SIGLA').value            := mPais.getSigla;
        umDM.qPaises.fieldByName('MOEDA').value            := mPais.getMoeda;
        umDM.qPaises.fieldByName('DATCAD').AsDateTime     := mPais.getDataCad;
        umDM.qPaises.fieldByName('DATULTALT').AsDateTime  := mPais.getUltAlt;
        umDM.qPaises.Post;
        umDM.qPaises.Transaction.Commit;
   except
    umDM.qPaises.Transaction.Rollback;
  end;
end;

function DAOPaises.Excluir(pObj: TObject): string;
var mSql  : string;
    mPais : Paises;
begin
  try
    mPais := Paises(pObj);
    mSql := 'delete from paises where codPais = '+inttostr(mPais.getCodigo);
    umDM.qPaises.Active := false;
    umDM.qPaises.SelectSQL.Text := mSQL;
    if not umDM.trans.Active then
      umDM.trans.Active := true;
    if not umDM.qPaises.Active then
      umDM.qPaises.Open;
      umDM.qPaises.Transaction.CommitRetaining;
      result := '';
    except on e: Exception do
    begin
      umDM.Trans.Rollback;
      result := 'Erro ao Excluir : '  + e.Message;
    end;
   end;
end;

destructor DAOPaises.Destrua_se;
begin

end;
end.
