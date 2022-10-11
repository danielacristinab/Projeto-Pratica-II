unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus,
  uInterfaces, uPai, uPaises, uEstados, uCidades,
  uController, uCtrlPaises, uCtrlEstados, uCtrlCidades,
  uColecoes, uColPaises, uColEstados, uColCidades,
  uDAO, uDAOPaises, uDAOEstados, uDAOCidades,
  uFornecedores, uClientes, uFuncionarios,
  uCtrlClientes, uCtrlFuncionarios, uCtrlFornecedores,
  uDAOClientes, uDAOFuncionarios, uDAOFornecedores,
  Data.DB, uDataModule, uCargos, uCtrlCargos,
  uDAOModelos, uCtrlModelos, uModelos,
  uDAOMarcas, uCtrlMarcas, uMarcas,
  uDAOProdutos, uCtrlProdutos, uProdutos,
  uDAOGrupos, uCtrlGrupos, uGrupos,
  uDAOCondPag, uCtrlCondPag, uCondicaoPagamento,
  uDAOFormaPag, uCtrlFormaPag, uFormasPagamento;

type
  TFrmPrincipal = class(TForm)
    Menu: TMainMenu;
    CADASTRO: TMenuItem;
    CLIENTE: TMenuItem;
    GRUPO: TMenuItem;
    OS: TMenuItem;
    RELATORIOS: TMenuItem;
    HOME: TMenuItem;
    FINANCEIRO: TMenuItem;
    ESTOQUE: TMenuItem;
    PAIS: TMenuItem;
    ESTADO: TMenuItem;
    CIDADE: TMenuItem;
    FUNCIONARIO: TMenuItem;
    FORNECEDOR: TMenuItem;
    SAIR: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    CARGO: TMenuItem;
    PRODUTO: TMenuItem;
    CONDICAO_PAG: TMenuItem;
    FORMASPAG: TMenuItem;
    procedure SAIRClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PAISClick(Sender: TObject);
    procedure ESTADOClick(Sender: TObject);
    procedure CIDADEClick(Sender: TObject);
    procedure CLIENTEClick(Sender: TObject);
    procedure FORNECEDORClick(Sender: TObject);
    procedure FUNCIONARIOClick(Sender: TObject);
    procedure CARGOClick(Sender: TObject);
    procedure MARCAClick(Sender: TObject);
    procedure MODELOClick(Sender: TObject);
    procedure GRUPOClick(Sender: TObject);
    procedure PRODUTOClick(Sender: TObject);
    procedure CONDICAO_PAGClick(Sender: TObject);
    procedure FORMASPAGClick(Sender: TObject);
  private
    { Private declarations }
    aInter : Interfaces;
    oPais  : Paises;
    oEstado : Estados;
    aCidade : Cidades;
    oCliente : Clientes;
    oFuncionario : Funcionarios;
    oFornecedor : Fornecedores;
    oCargo : Cargos;
    oModelo : Modelos;
    aMarca : Marcas;
    oGrupo : Grupos;
    oProduto : Produtos;
    aCondPag : CondicaoPagamento;
    aFormaPag : FormasPagamento;

    aCtrlPais : CtrlPaises;
    aCtrlEstados : CtrlEstados;
    aCtrlCidades : CtrlCidades;
    aCtrlClientes : CtrlClientes;
    aCtrlFuncionarios : CtrlFuncionarios;
    aCtrlFornecedores : CtrlFornecedores;
    aCtrlCargos : CtrlCargos;
    aCtrlModelos : CtrlModelos;
    aCtrlMarcas : CtrlMarcas;
    aCtrlGrupos : CtrlGrupos;
    aCtrlProdutos : CtrlProdutos;
    aCtrlCondPag : CtrlCondPag;
    aCtrlFormaPag : CtrlFormaPag;

    uDM : TDM;
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

procedure TFrmPrincipal.CARGOClick(Sender: TObject);
begin
 aInter.PDCargos(oCargo, aCtrlCargos);
end;

procedure TFrmPrincipal.CIDADEClick(Sender: TObject);
begin
  aInter.PDCidades(aCidade, aCtrlCidades);
end;

procedure TFrmPrincipal.CLIENTEClick(Sender: TObject);
begin
  aInter.PDClientes(oCliente, aCtrlClientes);
end;

procedure TFrmPrincipal.CONDICAO_PAGClick(Sender: TObject);
begin
  aInter.PDCondPag(aCondPag, aCtrlCondPag);
end;

procedure TFrmPrincipal.ESTADOClick(Sender: TObject);
begin
  aInter.PDEstados(oEstado, aCtrlEstados);
end;

procedure TFrmPrincipal.FORMASPAGClick(Sender: TObject);
begin
  aInter.PDFormasPag(aFormaPag, aCtrlFormaPag);
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
   aInter := Interfaces.CrieObj;
   oPais := Paises.CrieObj;
   oEstado := Estados.CrieObj;
   aCidade := Cidades.CrieObj;
   oCliente := Clientes.CrieObj;
   oFuncionario := Funcionarios.CrieObj;
   oFornecedor := Fornecedores.CrieObj;
   oCargo := Cargos.CrieObj;
   oModelo := Modelos.CrieObj;
   aMarca := Marcas.CrieObj;
   oGrupo := Grupos.CrieObj;
   oProduto := Produtos.CrieObj;
   aCondPag := CondicaoPagamento.CrieObj;
   aFormaPag := FormasPagamento.CrieObj;

   aCtrlPais := CtrlPaises.CrieObj;
   aCtrlEstados := CtrlEstados.CrieObj;
   aCtrlCidades := CtrlCidades.CrieObj;
   aCtrlClientes := CtrlClientes.CrieObj;
   aCtrlFuncionarios := CtrlFuncionarios.CrieObj;
   aCtrlFornecedores := CtrlFornecedores.CrieObj;
   aCtrlCargos := CtrlCargos.CrieObj;
   aCtrlModelos := CtrlModelos.CrieObj;
   aCtrlMarcas := CtrlMarcas.CrieObj;
   aCtrlGrupos := CtrlGrupos.CrieObj;
   aCtrlProdutos := CtrlProdutos.CrieObj;
   aCtrlCondPag := CtrlCondPag.CrieObj;
   aCtrlFormaPag := CtrlFormaPag.CrieObj;

   uDM := TDM.Create(nil);
   aCtrlPais.SetDM(uDM);
   aCtrlEstados.SetDM(uDM);
   aCtrlCidades.SetDM(uDM);
   aCtrlClientes.SetDM(uDM);
   aCtrlFuncionarios.SetDM(uDM);
   aCtrlFornecedores.SetDM(uDM);
   aCtrlCargos.SetDM(uDM);
   aCtrlModelos.SetDM(uDM);
   aCtrlMarcas.SetDM(uDM);
   aCtrlGrupos.SetDM(uDM);
   aCtrlProdutos.SetDM(uDM);
   aCtrlCondPag.SetDM(uDM);
   aCtrlFormaPag.SetDM(uDM);

   aCtrlEstados.setaCtrlPais(aCtrlPais);
   aCtrlCidades.SetaCtrlEstado(aCtrlEstados);
   aCtrlClientes.SetaCtrlCidade(aCtrlCidades);
   aCtrlFuncionarios.SetaCtrlCidade(aCtrlCidades);
   aCtrlFornecedores.SetaCtrlCidade(aCtrlCidades);
   aCtrlModelos.SetaCtrlMarca(aCtrlMarcas);
   aCtrlProdutos.SetaCtrlGrupos(aCtrlGrupos);
   aCtrlProdutos.SetaCtrlModelos(aCtrlModelos);
   aCtrlProdutos.SetaCtrlFornecedores(aCtrlFornecedores);
   aCtrlCondPag.SetaCtrlFormaPag(aCtrlFormaPag);
end;

procedure TFrmPrincipal.FORNECEDORClick(Sender: TObject);
begin
  aInter.PDFornecedores(oFornecedor, aCtrlFornecedores);
end;

procedure TFrmPrincipal.FUNCIONARIOClick(Sender: TObject);
begin
  aInter.PDFuncionarios(oFuncionario, aCtrlFuncionarios);
end;

procedure TFrmPrincipal.GRUPOClick(Sender: TObject);
begin
  aInter.PDGrupos(oGrupo, aCtrlGrupos);
end;

procedure TFrmPrincipal.MARCAClick(Sender: TObject);
begin
  aInter.PDMarcas(aMarca, aCtrlMarcas);
end;

procedure TFrmPrincipal.MODELOClick(Sender: TObject);
begin
  aInter.PDModelos(oModelo, aCtrlModelos);
end;

procedure TFrmPrincipal.PAISClick(Sender: TObject);
begin
  aInter.PDPaises(oPais, aCtrlPais);
end;

procedure TFrmPrincipal.PRODUTOClick(Sender: TObject);
begin
  aInter.PDProdutos(oProduto, aCtrlProdutos);
end;

procedure TFrmPrincipal.SAIRClick(Sender: TObject);
begin
  Close;
end;

end.
