CREATE DATABASE 'localhost:C:\BD-PRATICA\projeto_os.fdb' USER 'SYSDBA' PASSWORD 'masterkey';
CONNECT 'localhost:C:\BD-PRATICA\projeto_os.fdb' USER 'SYSDBA' PASSWORD 'masterkey';

CREATE TABLE Paises(
  CodPais INTEGER PRIMARY KEY,
  Pais VARCHAR(50) NOT NULL,
  Sigla VARCHAR(3) NOT NULL,
  ddi VARCHAR(4) NOT NULL,
  Moeda VARCHAR(3) NOT NULL,
  DatCad  DATE,
  DatUltAlt DATE
);

CREATE TABLE Estados(
  CodEstado INTEGER PRIMARY KEY,
  Estado VARCHAR(50) NOT NULL,
  UF VARCHAR(3) NOT NULL,
  CodPais INTEGER NOT NULL,
  DatCad  DATE,
  DatUltAlt DATE
);

alter table estados add constraint fk_codPais foreign key (codPais) references Paises(codPais);

CREATE TABLE Cidades(
  CodCidade INTEGER PRIMARY KEY,
  Cidade VARCHAR(50) NOT NULL,
  ddd VARCHAR(3) NOT NULL,
  CodEstado INTEGER NOT NULL, 
  DatCad  DATE,
  DatUltAlt DATE
);

alter table cidades add constraint fk_codEstados foreign key (codEstado) references Estados(codEstado);

------------------------------------------------------------------------------------------------------------


CREATE TABLE Clientes(
  CodCliente INTEGER PRIMARY KEY,
  Nome VARCHAR(50) NOT NULL,
  DataNasc VARCHAR(8) NOT NULL,
  RG VARCHAR(10),
  CPF_CNPJ VARCHAR(18) NOT NULL,
  Email VARCHAR(50),
  Telefone VARCHAR(20),
  Celular VARCHAR(20) NOT NULL,
  Endereco VARCHAR(50) NOT NULL,
  Numero INTEGER NOT NULL,
  Bairro VARCHAR(50) NOT NULL,
  CEP INTEGER NOT NULL,
  Complemento VARCHAR(25),
  CodCidade INTEGER NOT NULL,
  DatCad  DATE,
  DatUltAlt DATE
);

alter table clientes add constraint fk_codCidades foreign key (codCidade) references Cidades(codCidade);


CREATE TABLE Funcionarios(
  CodFunc INTEGER PRIMARY KEY,
  Nome VARCHAR(50) NOT NULL,
  DataNasc VARCHAR(8) NOT NULL,
  CPF VARCHAR(18) NOT NULL,
  RG VARCHAR(10) NOT NULL,
  Email VARCHAR(50),
  Telefone VARCHAR(20),
  Celular VARCHAR(20) NOT NULL, 
  Endereco VARCHAR(50) NOT NULL,
  Numero INTEGER NOT NULL,
  Bairro VARCHAR(50) NOT NULL,
  CEP INTEGER NOT NULL,
  Complemento VARCHAR(25),
  CodCargo INTEGER NOT NULL,
  CodCidade INTEGER NOT NULL,
  DatCad  DATE,
  DatUltAlt DATE
 );

 alter table funcionarios add constraint fk_codCargos foreign key (codCargo) references Cargos(codCargo);
 alter table funcionarios add constraint fk_codCidadesFunc foreign key (codCidade) references Cidades(codCidade);

CREATE TABLE Cargos(
  CodCargo INTEGER PRIMARY KEY,
  Cargo VARCHAR(25) NOT NULL,
  DatCad  DATE,
  DatUltAlt DATE
 );
 
CREATE TABLE Fornecedores(
  CodFornecedor INTEGER PRIMARY KEY,
  Cnpj VARCHAR(18) NOT NULL,
  RazaoSocial VARCHAR(50) NOT NULL,
  NomeFantasia VARCHAR(50) NOT NULL,
  Telefone VARCHAR(20) NOT NULL,
  Email VARCHAR(50) NOT NULL,
  Site VARCHAR(50),
  RG_IE VARCHAR(15) NOT NULL,
  Endereco VARCHAR(50) NOT NULL,
  Numero INTEGER NOT NULL,
  Bairro VARCHAR(50) NOT NULL,
  CEP INTEGER NOT NULL,
  Complemento VARCHAR(25),
  CodCidade INTEGER NOT NULL,
  DatCad  DATE,
  DatUltAlt DATE
 ); 

alter table fornecedores add constraint fk_codCidadesForn foreign key (codCidade) references Cidades(codCidade);

