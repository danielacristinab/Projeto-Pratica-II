unit uFornecedores;

interface
uses uPai, uPessoa;
type Fornecedores = class (Pessoa)
  private
  protected
    RazaoSocial : string[50];
	  ApelidoNomeFantasia : string[50];
	  cnpj : string[15];
	  RG_IE : string[15];
	  site : string[50];
    Telefone : string[20];
    Email : string[50];
 public
   constructor CrieObj;
   procedure SetRazaoSocial(pRazaoSocial : string);
	 procedure SetApelidoNomeFantasia(pApelidoNomeFantasia : string);
	 procedure SetCnpj(pcnpj : string);
	 procedure SetRG_IE(pRG_IE : string);
	 procedure SetSite(psite : string);
   procedure SetTelefone(pTelefone : string);
   procedure SetEmail(pEmail : string);
   function GetRazaoSocial : string;
	 function GetApelidoNomeFantasia : string;
	 function GetCnpj : string;
	 function GetRG_IE : string;
	 function GetSite : string;
   function GetTelefone : string;
   function GetEmail : string;
   function Clone : Fornecedores;
   destructor Destrua_se;
end;
implementation

{ Fornecedores }

function Fornecedores.Clone: Fornecedores;
begin
    result := fornecedores.CrieObj;
    result.setCodigo(codigo);
    result.SetRazaoSocial(RazaoSocial);
	  result.SetApelidoNomeFantasia(ApelidoNomeFantasia);
	  result.Setcnpj(Cnpj);
	  result.SetRG_IE(RG_IE);
	  result.Setsite(Site);
    result.SetTelefone(Telefone);
    result.SetEmail(Email);
    result.SetEndereco(Endereco);
    result.SetNumero(numero);
    result.SetBairro(bairro);
    result.SetCep(cep);
    result.SetComplemento(complemento);
    result.SetaCidade(aCidade.Clone);
    result.setDataCad(DataCad);
    result.setDataCad(DataUltAlt);
end;

constructor Fornecedores.CrieObj;
begin
    inherited;
    RazaoSocial := ' ';
	  ApelidoNomeFantasia := ' ';
	  cnpj := ' ';
	  RG_IE := ' ';
	  site := ' ';
    Telefone := ' ';
    Email := ' ';
end;

destructor Fornecedores.Destrua_se;
begin

end;

function Fornecedores.GetApelidoNomeFantasia: string;
begin
   result := ApelidoNomeFantasia;
end;

function Fornecedores.GetCnpj: string;
begin
  result := Cnpj;
end;

function Fornecedores.GetEmail: string;
begin
  result := email;
end;

function Fornecedores.GetRazaoSocial: string;
begin
  result := RazaoSocial;
end;

function Fornecedores.GetRG_IE: string;
begin
  result := RG_IE;
end;

function Fornecedores.GetSite: string;
begin
 result := Site;
end;

function Fornecedores.GetTelefone: string;
begin
  result := Telefone;
end;

procedure Fornecedores.SetApelidoNomeFantasia(pApelidoNomeFantasia: string);
begin
  ApelidoNomeFantasia := pApelidoNomeFantasia;
end;

procedure Fornecedores.SetCnpj(pcnpj: string);
begin
  Cnpj := pCnpj;
end;

procedure Fornecedores.SetEmail(pEmail: string);
begin
  email := pEmail;
end;

procedure Fornecedores.SetRazaoSocial(pRazaoSocial: string);
begin
  RazaoSocial := pRazaoSocial;
end;

procedure Fornecedores.SetRG_IE(pRG_IE: string);
begin
  RG_IE := pRG_IE;
end;

procedure Fornecedores.SetSite(psite: string);
begin
  Site := pSite;
end;

procedure Fornecedores.SetTelefone(pTelefone: string);
begin
  Telefone := pTelefone;
end;

end.

