unit uDAOClientes;

interface
uses uDAO, uClientes, Data.DB, System.SysUtils;
  type DAOClientes = class   (DAO)
    private
    protected
      oCliente : Clientes;
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

{ DAOClientes }

constructor DAOClientes.CrieObj;
begin
  inherited;
end;

function DAOClientes.GetDS: TDataSource;
begin
  result := umDm.DSClientes;
end;

function DAOClientes.AcheiReg: boolean;
begin
  result := not (umDM.qClientes.Eof);
end;

function DAOClientes.Carregar(pObj: TObject): string;
var mClientes : Clientes;
begin
  try
   try
      mClientes := Clientes(pObj);
      with umDM.qClientes DO
      begin
        mClientes := Clientes(pObj);
        mClientes.SetCodigo(umDM.qClientes.FieldByName('CODCLIENTE').value);
        mClientes.setNome(umDM.qClientes.FieldByName('NOME').AsString);
        mClientes.setDataNasc(umDM.qClientes.FieldByName('DATANASC').AsString);
        mClientes.setRG(umDM.qClientes.FieldByName('RG').AsString);
        mClientes.setCPF_CNPJ(umDM.qClientes.FieldByName('CPF_CNPJ').AsString);
        mClientes.setEmail(umDM.qClientes.FieldByName('EMAIL').AsString);
        mClientes.setTelefone(umDM.qClientes.FieldByName('TELEFONE').AsString);
        mClientes.setCelular(umDM.qClientes.FieldByName('CELULAR').AsString);
        mClientes.setEndereco(umDM.qClientes.FieldByName('ENDERECO').AsString);
        mClientes.setNumero(umDM.qClientes.FieldByName('NUMERO').Value);
        mClientes.setBairro(umDM.qClientes.FieldByName('BAIRRO').AsString);
        mClientes.setCEP(umDM.qClientes.FieldByName('CEP').Value);
        mClientes.setComplemento(umDM.qClientes.FieldByName('COMPLEMENTO').AsString);
        mClientes.getaCidade.setCodigo(umDM.qClientes.FieldByName('aCIDADE').Value);
        result := '';
      end;
   except on e:exception do
      result:= 'Erro ao carregar: '+ e.Message;
   end;
 finally
 end;

end;

function DAOClientes.Pesquisar(pChave: string): string;
var mSql: string;
begin
  if pChave <> '' then
    if ehNumero(pChave) then
      mSql := 'select * from Clientes where codcliente = '+quotedstr(pChave)
    else
      mSql := 'select * from Clientes where nome = '+quotedstr(pChave)+' order by nome'
  else
    mSql := 'select * from Clientes order by nome';
  umDM.qClientes.Active := false;
  umDM.qClientes.SQL.Text := mSql;
  umDM.qClientes.Open();
end;

function DAOClientes.Salvar(pObj: TObject): string;
var mSql  : string;
    mClientes : Clientes;
begin
    try
      umDM.FDTrans.StartTransaction;
      mClientes := Clientes(pObj);
      with umDM.qClientes do
      begin
        if mClientes.getCodigo = 0 then
        mSql := 'insert into Clientes (nome, datanasc, rg, cpf_cnpj, email, telefone, '+
        'celular, endereco, numero, bairro, cep, complemento, codcidade) '+
        'values ( :nome, :datanasc, :rg, :cpf_cnpj, :email, :telefone, :celular, '+
        ':endereco, :numero, :bairro, :cep, :complemento, :codcidde)'
        else
        begin
          mSql := 'update Clientes set nome = :nome , datanasc = :datanasc, rg = :rg, '+
          'cpf_cnpj = :cpf_cnpj, email = :email, telefone = :telefone, celular = :celular, '+
          'endereco = :endereco, numero = :numero, bairro = :bairro, cep = :cep, '+
          'complemento = :complemento,  codcidade = :codcidade';
          mSql := mSql + ' where codCliente = :CodCliente';
        end;
        umDM.qClientes.SQL.Clear;
        umDM.qClientes.SQL.Add(mSql);
        ParamByName('NOME').Value := mClientes.getNome;
        ParamByName('DATANASC').Value := mClientes.getDataNasc;
        ParamByName('RG').Value := mClientes.getRG;
        ParamByName('CPF_CNPJ').Value := mClientes.getCPF_CNPJ;
        ParamByName('EMAIL').Value := mClientes.getEmail;
        ParamByName('TELEFONE').Value := mClientes.getTelefone;
        ParamByName('CELULAR').Value := mClientes.getCelular;
        ParamByName('ENDERECO').Value := mClientes.getEndereco;
        ParamByName('NUMERO').Value := mClientes.getNumero;
        ParamByName('BAIRRO').Value := mClientes.getBairro;
        ParamByName('CEP').Value := mClientes.getCEP;
        ParamByName('COMPLEMENTO').Value := mClientes.getComplemento;
        ParamByName('CODCIDADE').Value := mClientes.GetaCidade.GetCodigo;
        if mClientes.GetCodigo <> 0 then
          ParamByName('CODCLIENTE').Value := mClientes.GetCodigo;
        ExecSQL();
        close;
      end;
      umDM.FDTrans.Commit;
    except
      umDM.FDTrans.Rollback;
end;
end;

function DAOClientes.Excluir(pObj: TObject): string;
var mSql  : string;
    mClientes : Clientes;
begin
  try
    mClientes := Clientes(pObj);
    mSql := 'delete from clientes where codCliente = '+inttostr(mClientes.getCodigo);
    umDm.FDTrans.StartTransaction;
    umDm.qClientes.Active:= false;
    umDm.qClientes.SQL.Clear;
    umDM.qClientes.ExecSQL(mSql);
    umDm.FDTrans.Commit;
    result := '';
  except on e: Exception do
    begin
      umDm.FDTrans.Rollback;
      result := 'Erro ao Excluir : '  + e.Message;
    end;
  end;
end;

destructor DAOClientes.Destrua_se;
begin

end;
end.
