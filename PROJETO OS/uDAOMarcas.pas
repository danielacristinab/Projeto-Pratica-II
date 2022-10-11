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
var mmarcas : marcas;
begin
  try
   try
      mmarcas := marcas(pObj);
      with umDM.qmarcas DO
      begin
        mmarcas := marcas(pObj);
        mmarcas.SetCodigo(umDM.qmarcas.FieldByName('CODmarca').value);
        mmarcas.Setmarca(umDM.qmarcas.FieldByName('marca').Value);
        result := '';
      end;
   except on e:exception do
      result:= 'Erro ao carregar: '+ e.Message;
   end;
 finally
 end;

end;

function DAOmarcas.Pesquisar(pChave: string): string;
var mSql: string;
begin
  if pChave <> '' then
    if ehNumero(pChave) then
      mSql := 'select * from marcas where codmarca = '+quotedstr(pChave)
    else
      mSql := 'select * from marcas where marca = '+quotedstr(pChave)+' order by marca'
  else
    mSql := 'select * from marcas order by marca';
  umDM.qmarcas.Active := false;
  umDM.qmarcas.SQL.Text := mSql;
  umDM.qmarcas.Open();
end;

function DAOmarcas.Salvar(pObj: TObject): string;
var mSql  : string;
    mmarcas : marcas;
begin
    try
      umDM.FDTrans.StartTransaction;
      mmarcas := marcas(pObj);
      with umDM.qmarcas do
      begin
        if mmarcas.getCodigo = 0 then
        mSql := 'insert into marcas (marca) values ( :marca)'
        else
        begin
          mSql := 'update marcas set marca = :marca';
          mSql := mSql + ' where codmarca = :Codmarca;';
        end;
        umDM.qmarcas.SQL.Clear;
        umDM.qmarcas.SQL.Add(mSql);
        ParamByName('marca').Value := mmarcas.getmarca;
        if mmarcas.GetCodigo <> 0 then
          ParamByName('CODmarca').Value := mmarcas.GetCodigo;
        ExecSQL;
      end;
      umDM.FDTrans.Commit;
    except
      umDM.FDTrans.Rollback;
end;
end;

function DAOmarcas.Excluir(pObj: TObject): string;
var mSql  : string;
    mmarcas : marcas;
begin
  try
      mmarcas := marcas(pObj);
      mSql := 'delete from marcas where codmarca = '+inttostr(mmarcas.getCodigo);
      umDm.FDTrans.StartTransaction;
      umDm.qmarcas.Active:= false;
      umDm.qmarcas.SQL.Clear;
      umDM.qmarcas.ExecSQL(mSql);
      umDm.FDTrans.Commit;
      result := '';
   except on e: Exception do
   begin
      umDm.FDTrans.Rollback;
      result := 'Erro ao Excluir : '  + e.Message;
   end;
  end;
end;

destructor DAOmarcas.Destrua_se;
begin

end;
end.
