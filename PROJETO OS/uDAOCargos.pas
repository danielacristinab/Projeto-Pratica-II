unit uDAOCargos;

interface
uses uDAO, uCargos, Data.DB, System.SysUtils;
  type DAOCargos = class   (DAO)
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

{ DAOCargos }

constructor DAOCargos.CrieObj;
begin
  inherited;
end;

function DAOCargos.GetDS: TDataSource;
begin
  result := umDm.DSCargos;
end;

function DAOCargos.AcheiReg: boolean;
begin
  result := not (umDM.qCargos.Eof);
end;

function DAOCargos.Carregar(pObj: TObject): string;
var mCargos : Cargos;
begin
  try
   try
      mCargos := Cargos(pObj);
      with umDM.qCargos DO
      begin
        mCargos := Cargos(pObj);
        mCargos.SetCodigo(umDM.qCargos.FieldByName('CODCARGO').value);
        mCargos.SetCargo(umDM.qCargos.FieldByName('CARGO').Value);
        result := '';
      end;
   except on e:exception do
      result:= 'Erro ao carregar: '+ e.Message;
   end;
 finally
 end;

end;

function DAOCargos.Pesquisar(pChave: string): string;
var mSql: string;
begin
  if pChave <> '' then
    if ehNumero(pChave) then
      mSql := 'select * from Cargos where codcargo = '+quotedstr(pChave)
    else
      mSql := 'select * from Cargos where cargo = '+quotedstr(pChave)+' order by cargo'
  else
    mSql := 'select * from Cargos order by cargo';
  umDM.qCargos.Active := false;
  umDM.qCargos.SQL.Text := mSql;
  umDM.qCargos.Open();
end;

function DAOCargos.Salvar(pObj: TObject): string;
var mSql  : string;
    mCargos : Cargos;
begin
    try
      umDM.FDTrans.StartTransaction;
      mCargos := Cargos(pObj);
      with umDM.qCargos do
      begin
        if mCargos.getCodigo = 0 then
        mSql := 'insert into Cargos (cargo) values ( :cargo)'
        else
        begin
          mSql := 'update Cargos set cargo = :cargo';
          mSql := mSql + ' where codCargo = :CodCargo;';
        end;
        umDM.qCargos.SQL.Clear;
        umDM.qCargos.SQL.Add(mSql);
        ParamByName('CARGO').Value := mCargos.getCargo;
        if mCargos.GetCodigo <> 0 then
          ParamByName('CODCARGO').Value := mCargos.GetCodigo;
        ExecSQL;
      end;
      umDM.FDTrans.Commit;
    except
      umDM.FDTrans.Rollback;
end;
end;

function DAOCargos.Excluir(pObj: TObject): string;
var mSql  : string;
    mCargos : Cargos;
begin
  try
      mCargos := Cargos(pObj);
      mSql := 'delete from cargos where codCargo = '+inttostr(mCargos.getCodigo);
      umDm.FDTrans.StartTransaction;
      umDm.qCargos.Active:= false;
      umDm.qCargos.SQL.Clear;
      umDM.qCargos.ExecSQL(mSql);
      umDm.FDTrans.Commit;
      result := '';
   except on e: Exception do
   begin
      umDm.FDTrans.Rollback;
      result := 'Erro ao Excluir : '  + e.Message;
   end;
  end;
end;

destructor DAOCargos.Destrua_se;
begin

end;
end.
