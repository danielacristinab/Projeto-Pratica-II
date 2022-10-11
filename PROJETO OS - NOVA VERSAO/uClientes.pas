unit uClientes;

interface
uses uPai, uPessoa;
type Clientes = class (Pessoa)
  private
  protected
    nome : string[50];
	  DataNasc : string[8];
    RG : string[10];
    CPF_CNPJ : string[18];
    Email : string[50];
    Telefone : string[20];
    Celular : string [20];
  public
   constructor CrieObj;
   procedure SetNome(pNome: string);
   procedure SetDataNasc(pDataNasc: string);
   procedure SetRG(pRG: string);
   procedure SetCPF_CNPJ(pCPF_CNPJ: string);
   procedure SetEmail(pEmail: string);
   procedure SetTelefone(pTelefone: string);
   procedure SetCelular(pCelular: string);
   function Clone : Clientes;
   function GetNome : string;
   function GetDataNasc : string;
   function GetRG : string;
   function GetCPF_CNPJ : string;
   function GetEmail : string;
   function GetTelefone : string;
   function GetCelular : string;
   destructor Destrua_se;
end;
implementation

{ Clientes }

function Clientes.Clone: Clientes;
begin
  result := Clientes.crieObj;
  result.setCodigo(codigo);
  result.SetNome(Nome);
  result.SetDataNasc(DataNasc);
  result.SetRG(RG);
  result.SetCPF_CNPJ(cpf_cnpj);
  result.SetEmail(Email);
  result.SetTelefone(Telefone);
  result.SetCelular(Celular);
  result.SetEndereco(Endereco);
  result.SetNumero(numero);
  result.SetBairro(bairro);
  result.SetCep(cep);
  result.SetComplemento(complemento);
  result.SetaCidade(aCidade.Clone);
  result.setDataCad(DataCad);
  result.setDataCad(DataUltAlt);
end;

constructor Clientes.CrieObj;
begin
  inherited;
  Nome := ' ';
  DataNasc := ' ';
  RG := ' ';
  CPF_CNPJ := ' ';
  Email := ' ';
  Telefone := ' ';
  Celular := ' ';
end;

destructor Clientes.Destrua_se;
begin
  inherited;
end;

function Clientes.GetCelular: string;
begin
  result := Celular;
end;

function Clientes.GetCPF_CNPJ: string;
begin
  result := CPF_CNPJ;
end;

function Clientes.GetDataNasc: string;
begin
  result := DataNasc;
end;

function Clientes.GetEmail: string;
begin
  result := Email;
end;

function Clientes.GetNome: string;
begin
  result := Nome;
end;

function Clientes.GetRG: string;
begin
  result := RG;
end;

function Clientes.GetTelefone: string;
begin
  result := Telefone;
end;

procedure Clientes.SetCelular(pCelular: string);
begin
  Celular := pCelular;
end;

procedure Clientes.SetCPF_CNPJ(pCPF_CNPJ: string);
begin
  CPF_CNPJ := pCPF_CNPJ;
end;

procedure Clientes.SetDataNasc(pDataNasc: string);
begin
  Nome := pDataNasc;
end;

procedure Clientes.SetEmail(pEmail: string);
begin
  Email := pEmail;
end;

procedure Clientes.SetNome(pNome: string);
begin
  Nome := pNome;
end;

procedure Clientes.SetRG(pRG: string);
begin
  RG := pRG;
end;

procedure Clientes.SetTelefone(pTelefone: string);
begin
  Telefone := pTelefone;
end;

end.

