unit uPessoa;

interface
uses uPai, uCidades;
type Pessoa = class (Pai)
  private
  protected
    Endereco : String[50];
    Numero : integer;
    cep : integer;
    complemento : string[25];
    bairro : string[50];
    aCidade : Cidades;
  public
   constructor CrieObj;
   procedure SetEndereco(pEndereco: string);
   procedure SetNumero(pNumero: integer);
   procedure SetBairro(pBairro: string);
   procedure SetCep(pCep: integer);
   procedure SetComplemento(pComplemento: string);
   procedure SetaCidade(paCidade: Cidades);
   function GetEndereco : string;
   function GetNumero : integer;
   function GetBairro : string;
   function GetCep : integer;
   function GetComplemento : string;
   function GetaCidade : Cidades;
   destructor Destrua_se;
end;
implementation

{ Pessoa }

constructor Pessoa.CrieObj;
begin
    inherited;
    endereco := ' ';
    numero := 0;
    cep := 0;
    complemento := ' ';
    bairro := ' ';
    aCidade := cidades.CrieObj;
end;

function Pessoa.GetaCidade: Cidades;
begin
  result := aCidade;
end;

function Pessoa.GetBairro: string;
begin
  result := bairro;
end;

function Pessoa.GetCep: integer;
begin
  result := cep;
end;

function Pessoa.GetComplemento: string;
begin
  result := complemento
end;

function Pessoa.GetEndereco: string;
begin
  result := endereco;
end;

function Pessoa.GetNumero: integer;
begin
  result := numero;
end;

procedure Pessoa.SetaCidade(paCidade: Cidades);
begin
  aCidade := paCidade;
end;

procedure Pessoa.SetBairro(pBairro: string);
begin
  bairro := pBairro;
end;

procedure Pessoa.SetCep(pCep: integer);
begin
  cep := pCep;
end;

procedure Pessoa.SetComplemento(pComplemento: string);
begin
  complemento := pComplemento;
end;

procedure Pessoa.SetEndereco(pEndereco: string);
begin
  endereco := pEndereco;
end;

procedure Pessoa.SetNumero(pNumero: integer);
begin
  numero := pNumero;
end;

destructor Pessoa.Destrua_se;
begin
  inherited;
end;
end.

