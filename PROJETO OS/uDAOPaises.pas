unit uDAOPaises;

interface
uses uDAO, uPaises, Data.DB, System.SysUtils, Datasnap.DBClient;
  type DAOPaises = class   (DAO)
    private
    protected
    public
      constructor CrieObj;
      function GetDS: TDataSource;                override;
      function Salvar(pObj: TObject): string;     override;
      function Carregar(pObj: TObject): string;   override;
      function Pesquisar(pChave: string): string; override;
      function Excluir(pObj: TObject): string;    override;
      destructor Destrua_se;
  end;

implementation

{ DAOPaises }

constructor DAOPaises.CrieObj;
begin
  inherited;
end;

function DAOPaises.Carregar(pObj: TObject): string;
var mPais : Paises;
begin
  try
   try
      mPais := Paises(pObj);
      with umDM.QPaises DO
      begin
        mPais := Paises(pObj);
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
 finally
 end;
end;

function DAOPaises.GetDS: TDataSource;
begin
    result := umDm.DSPaises;
end;

function DAOPaises.Pesquisar(pChave: string): string;
var mSql: string;
begin
  if pChave <> '' then
    if ehNumero(pChave) then
      mSql := 'select * from paises where codpais = '+quotedstr(pChave)
    else
      mSql := 'select * from Paises where pais = '+quotedstr(pChave)+' order by pais'
  else
    mSql := 'select * from Paises order by pais';
  umDM.qPaises.Active := false;
  umDM.qPaises.SQL.Text := mSql;
  umDM.qPaises.Open();
end;

function DAOPaises.Salvar(pObj: TObject): string;
var mSql  : string;
    mPais : Paises;
begin
    try
      umDM.FDTrans.StartTransaction;
      mPais := Paises(pObj);
      with umDM.QPaises do
      begin
        if mPais.getCodigo = 0 then
        mSql := 'insert into paises (pais, ddi, sigla, moeda) values ( :Pais, :ddi, :sigla, :moeda)'
        else
        begin
          mSql := 'update paises set pais = :Pais , ddi = :ddi, sigla = :sigla, moeda = :moeda';
          mSql := mSql + ' where codPais = :CodPais';
        end;
        umDM.QPaises.SQL.Clear;
        umDM.QPaises.SQL.Add(mSql);
        ParamByName('Pais').Value := mPais.getPais;
        ParamByName('DDI').Value := mPais.getDDI;
        ParamByName('SIGLA').Value := mPais.getSigla;
        ParamByName('MOEDA').Value := mPais.GetMoeda;
        if mPais.GetCodigo <> 0 then
        ParamByName('CODPAIS').Value := mPais.GetCodigo;
        ExecSQL;
      end;
      umDM.FDTrans.Commit;
    except
      umDM.FDTrans.Rollback;
end;
end;

function DAOPaises.Excluir(pObj: TObject): string;
var mSql  : string;
    mPais : Paises;
begin
  try
      mPais := Paises(pObj);
      mSql := 'delete from paises where codPais = '+inttostr(mPais.getCodigo);
      umDm.FDTrans.StartTransaction;
      umDm.QPaises.Active:= false;
      umDm.QPaises.SQL.Clear;
      umDM.qPaises.ExecSQL(mSql);
      umDm.FDTrans.Commit;
      result := '';
   except on e: Exception do
   begin
      umDm.FDTrans.Rollback;
      result := 'Erro ao Excluir : '  + e.Message;
   end;
  end;
end;

destructor DAOPaises.Destrua_se;
begin

end;
end.
