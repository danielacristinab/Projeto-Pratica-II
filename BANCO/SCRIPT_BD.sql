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

CREATE TABLE Marcas(
  CodMarca INTEGER PRIMARY KEY,
  Marca VARCHAR(25) NOT NULL,
  DatCad  DATE,
  DatUltAlt DATE
 );

CREATE TABLE Modelos(
  CodModelo INTEGER PRIMARY KEY,
  Modelo VARCHAR(25) NOT NULL,
  CodMarca INTEGER NOT NULL,
  DatCad  DATE,
  DatUltAlt DATE
 );
 alter table modelos add constraint fk_codMarca foreign key (codMarca) references Marcas(codMarca);
 
 CREATE TABLE Grupos(
  CodGrupo INTEGER PRIMARY KEY,
  Grupo VARCHAR(25) NOT NULL,
  Descricao VARCHAR(100), 
  DatCad  DATE,
  DatUltAlt DATE
 );

 CREATE TABLE Produtos(
  CodProd INTEGER PRIMARY KEY,
  Produto VARCHAR(25) NOT NULL,
  Quantidade REAL,
  Und VARCHAR(5),
  Custo REAL,
  Venda REAL,
  Saldo INTEGER,
  CodModelo INTEGER NOT NULL,
  CodGrupo INTEGER NOT NULL,
  CodFornecedor INTEGER,
  DatCad  DATE,
  DatUltAlt DATE
 ); 

alter table produtos add constraint fk_codModelo foreign key (codModelo) references Modelos(codModelo);
alter table produtos add constraint fk_codGrupo foreign key (codGrupo) references Grupos(codGrupo);
alter table produtos add constraint fk_codFornecedor foreign key (codFornecedor) references Fornecedores(codFornecedor);

 CREATE TABLE FormasPagamento(
  CodFormaPag INTEGER PRIMARY KEY,
  FormaPag VARCHAR(50),
  DatCad  DATE,
  DatUltAlt DATE
 );
 
 CREATE TABLE CondicaoPagamento(
  CodCondPag	INTEGER PRIMARY KEY,
  CondPagamento VARCHAR(50) NOT NULL,
  Multa VARCHAR(50),
  Juros VARCHAR(50),
  Desconto VARCHAR(50),
  DatCad  DATE,
  DatUltAlt DATE
 );
 
CREATE TABLE  Parcelas(
  CodCondPag INTEGER NOT NULL,
  NumParcelas INTEGER NOT NULL,
  Parcela INTEGER,
  Prazo INTEGER,  
  Porcentagem INTEGER,
  CodFormaPag INTEGER
 );
 alter table parcelas add constraint fk_codFormaPag foreign key (codFormaPag) references FormasPagamento(codFormaPag);
 CONSTANT PK_ParcelaCond PRIMARY key (CodCondPag,NumParcelas);

 
