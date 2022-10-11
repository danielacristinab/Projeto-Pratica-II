unit uFuncionarios;

interface
uses uPai, uPessoa, uCargos;
type Funcionarios = class (Pessoa)
  private
  protected
    nome : string[50];
	  DataNasc : string[8];
    RG : string[10];
    CPF : string[11];
    email : string[50];
    Telefone : string[13];
    Celular : string [20];
	  oCargo : Cargos;
  public
   constructor CrieObj;
   procedure SetNome(pNome: string);
   procedure SetDataNasc(pDataNasc: string);
   procedure SetRG(pRG: string);
   procedure SetCPF(pCPF: string);
   procedure SetEmail(pEmail: string);
   procedure SetTelefone(pTelefone: string);
   procedure SetCelular(pCelular: string);
   procedure SetoCargo(poCargo: Cargos);
   function Clone : Funcionarios;
   function GetNome : string;
   function GetDataNasc : string;
   function GetRG : string;
   function GetCPF : string;
   function GetEmail : string;
   function GetTelefone : string;
   function GetCelular : string;
   function GetoCargo : Cargos;
   destructor Destrua_se;
end;
implementation

{ Funcionarios }

function Funcionarios.Clone: Funcionarios;
begin
  result := Funcionarios.crieObj;
  result.setCodigo(codigo);
  result.SetNome(nome);
  result.SetDataNasc(DataNasc);
  result.SetRG(RG);
  result.SetCPF(cpf);
  result.SetTelefone(Telefone);
  result.SetCelular(Celular);
  result.setDataCad(DataCad);
  result.setDataCad(DataUltAlt);
end;

constructor Funcionarios.CrieObj;
begin
  inherited;
  nome := ' ';
	DataNasc := ' ';
  RG := ' ';
  CPF := ' ';
  Email := ' ';
  Telefone := ' ';
  Celular := ' ';
  oCargo := Cargos.CrieObj;
end;

destructor Funcionarios.Destrua_se;
begin
  inherited;
end;

function Funcionarios.GetCelular: string;
begin
  result := Celular;
end;

function Funcionarios.GetCPF: string;
begin
  result := CPF;
end;

function Funcionarios.GetDataNasc: string;
begin
  result := DataNasc;
end;

function Funcionarios.GetEmail: string;
begin
  result := Email;
end;

function Funcionarios.GetNome: string;
begin
  result := Nome;
end;

function Funcionarios.GetoCargo: Cargos;
begin
  result := oCargo;
end;

function Funcionarios.GetRG: string;
begin
  result := RG;
end;

function Funcionarios.GetTelefone: string;
begin
  result := Telefone;
end;

procedure Funcionarios.SetCelular(pCelular: string);
begin
  Celular := pCelular;
end;

procedure Funcionarios.SetCPF(pCPF: string);
begin
  CPF := pCPF;
end;

procedure Funcionarios.SetDataNasc(pDataNasc: string);
begin
  Nome := pDataNasc;
end;

procedure Funcionarios.SetEmail(pEmail: string);
begin
  Email := pEmail;
end;

procedure Funcionarios.SetNome(pNome: string);
begin
  Nome := pNome;
end;

procedure Funcionarios.SetoCargo(poCargo: Cargos);
begin
  oCargo := poCargo;
end;

procedure Funcionarios.SetRG(pRG: string);
begin
  RG := pRG;
end;

procedure Funcionarios.SetTelefone(pTelefone: string);
begin
  Telefone := pTelefone;
end;

end.
