unit uDAOEstados;

interface
uses uDAO, uEstados, Data.DB, System.SysUtils;
  type DAOEstados = class   (DAO)
    private
    protected
      oEstado : Estados;
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

{ DAOEstados }

constructor DAOEstados.CrieObj;
begin
  inherited;
end;

function DAOEstados.AcheiReg: boolean;
begin
  result := not (umDM.qPaises.Eof);
end;

function DAOEstados.Carregar(pObj: TObject): string;
var mEstado : Estados;
begin
  try
   try
      mEstado := Estados(pObj);
      with umDM.qEstados DO
      begin
        mEstado := Estados(pObj);
        mEstado.SetCodigo(umDM.qEstados.FieldByName('CODESTADO').value);
        mEstado.SetEstado(umDM.qEstados.FieldByName('ESTADO').AsString);
        mEstado.SetUF(umDM.qEstados.FieldByName('UF').AsString);
        mEstado.getoPais.setCodigo(umDM.QEstados.FieldByName('oPAIS').Value);
        result := '';
      end;
   except on e:exception do
      result:= 'Erro ao carregar: '+ e.Message;
   end;
 finally
 end;

end;

function DAOEstados.GetDS: TDataSource;
begin
  result := umDm.DSEstados;
end;

function DAOEstados.Pesquisar(pChave: string): string;
var mSql: string;
begin
  if pChave <> '' then
    if ehNumero(pChave) then
      mSql := 'select * from Estados where codestado = '+quotedstr(pChave)
    else
      mSql := 'select * from Estados where estado = '+quotedstr(pChave)+' order by estado'
  else
    mSql := 'select * from Estados order by estado';
  umDM.qEstados.Active := false;
  umDM.qEstados.SQL.Text := mSql;
  umDM.qEstados.Open();
end;

function DAOEstados.Salvar(pObj: TObject): string;
var
   mSql  : string;
   mEstado: Estados;
begin
    try
      umDM.FDTrans.StartTransaction;
      mEstado := Estados(pObj);
      with umDM.qEstados do
      begin
        if mEstado.getCodigo = 0 then
        mSql := 'insert into Estados (estado, uf, codpais) values ( :estado, :uf, :codpais)'
        else
        begin
          mSql := 'update Estados set estado = :estado , uf = :uf, codpais = :codpais';
          mSql := mSql + ' where codEstado = :CodEstado';
        end;
        umDM.qEstados.SQL.Clear;
        umDM.qEstados.SQL.Add(mSql);
        ParamByName('Estado').Value := mEstado.GetEstado;
        ParamByName('UF').Value := mEstado.GetUF;
        ParamByName('CODPAIS').Value := mEstado.GetoPais.GetCodigo;
        if mEstado.GetCodigo <> 0 then
          ParamByName('CODESTADO').Value := mEstado.GetCodigo;
        ExecSQL;
      end;
      umDM.FDTrans.Commit;
    except
      umDM.FDTrans.Rollback;
end;
end;

function DAOEstados.Excluir(pObj: TObject): string;
var mSql  : string;
    mEstado : Estados;
begin
  try
      mEstado := Estados(pObj);
      mSql := 'delete * from estados where codEstado = '+quotedstr(inttostr(mEstado.getCodigo));
      umDm.FDTrans.StartTransaction;
      umDm.qEstados.Active:= false;
      umDm.qEstados.SQL.Clear;
      umDm.qEstados.SQL.Add(mSql);
      umDm.qEstados.Open;
      umDm.FDTrans.Commit;
      result := '';
   except on e: Exception do
   begin
      umDm.FDTrans.Rollback;
      result := 'Erro ao Excluir : '  + e.Message;
   end;
  end;
end;

destructor DAOEstados.Destrua_se;
begin

end;
end.
