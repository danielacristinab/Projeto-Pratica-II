program ProjetoOS;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {FrmPrincipal},
  uFrmCadastroPai in 'uFrmCadastroPai.pas' {FrmCadastroPai},
  uFrmCadastroPaises in 'uFrmCadastroPaises.pas' {FrmCadastroPaises},
  uFrmCadastroCidades in 'uFrmCadastroCidades.pas' {FrmCadastroCidades},
  uFrmCadastroEstados in 'uFrmCadastroEstados.pas' {FrmCadastroEstados},
  uFrmCadastroPessoa in 'uFrmCadastroPessoa.pas' {FrmCadastroPessoa},
  uFrmCadastroClientes in 'uFrmCadastroClientes.pas' {FrmCadastroClientes},
  uFrmCadastroFuncionarios in 'uFrmCadastroFuncionarios.pas' {FrmCadastroFuncionarios},
  uFrmCadastroFornecedor in 'uFrmCadastroFornecedor.pas' {FrmCadastroFornecedores},
  uFrmCadastroCargos in 'uFrmCadastroCargos.pas' {FrmCadastroCargos},
  uFrmCadastroModelos in 'uFrmCadastroModelos.pas' {FrmCadastroModelos},
  uFrmCadastroMarcas in 'uFrmCadastroMarcas.pas' {FrmCadastroMarcas},
  uFrmCadastroGrupos in 'uFrmCadastroGrupos.pas' {FrmCadastroGrupos},
  uFrmCadastroProdutos in 'uFrmCadastroProdutos.pas' {FrmCadastroProdutos},
  uFrmConsultaPai in 'uFrmConsultaPai.pas' {FrmConsultaPai},
  uFrmConsultaPaises in 'uFrmConsultaPaises.pas' {FrmConsultaPaises},
  uFrmConsultaEstados in 'uFrmConsultaEstados.pas' {FrmConsultaEstados},
  uFrmConsultaCidades in 'uFrmConsultaCidades.pas' {FrmConsultaCidades},
  uFrmConsultaClientes in 'uFrmConsultaClientes.pas' {FrmConsultaClientes},
  uFrmConsultaFornecedores in 'uFrmConsultaFornecedores.pas' {FrmConsultaFornecedores},
  uFrmConsultaFuncionarios in 'uFrmConsultaFuncionarios.pas' {FrmConsultaFuncionarios},
  uFrmConsultaCargos in 'uFrmConsultaCargos.pas' {FrmConsultaCargos},
  uFrmConsultaModelos in 'uFrmConsultaModelos.pas' {FrmConsultaModelos},
  uFrmConsultaMarcas in 'uFrmConsultaMarcas.pas' {FrmConsultaMarcas},
  uFrmConsultaProdutos in 'uFrmConsultaProdutos.pas' {FrmConsultaProdutos},
  uFrmConsultaGrupos in 'uFrmConsultaGrupos.pas' {FrmConsultaGrupos},
  uFrmConsultaCondicaoPagamento in 'uFrmConsultaCondicaoPagamento.pas' {FrmConsultaCondicaoPagamento},
  uPai in 'uPai.pas',
  uPessoa in 'uPessoa.pas',
  uInterfaces in 'uInterfaces.pas',
  uOS in 'uOS.pas',
  uEstados in 'uEstados.pas',
  uPaises in 'uPaises.pas',
  uCidades in 'uCidades.pas',
  uFornecedores in 'uFornecedores.pas',
  uFuncionarios in 'uFuncionarios.pas',
  uClientes in 'uClientes.pas',
  uCargos in 'uCargos.pas',
  uMarcas in 'uMarcas.pas',
  uModelos in 'uModelos.pas',
  uProdutos in 'uProdutos.pas',
  uGrupos in 'uGrupos.pas',
  uDAO in 'uDAO.pas',
  uDAOCidades in 'uDAOCidades.pas',
  uDAOEstados in 'uDAOEstados.pas',
  uDAOPaises in 'uDAOPaises.pas',
  uDAOClientes in 'uDAOClientes.pas',
  uDAOFuncionarios in 'uDAOFuncionarios.pas',
  uDAOFornecedores in 'uDAOFornecedores.pas',
  uDAOCargos in 'uDAOCargos.pas',
  uDAOMarcas in 'uDAOMarcas.pas',
  uDAOModelos in 'uDAOModelos.pas',
  uDAOProdutos in 'uDAOProdutos.pas',
  uDAOGrupos in 'uDAOGrupos.pas',
  uController in 'uController.pas',
  uCtrlEstados in 'uCtrlEstados.pas',
  uCtrlPaises in 'uCtrlPaises.pas',
  uCtrlCidades in 'uCtrlCidades.pas',
  uCtrlClientes in 'uCtrlClientes.pas',
  uCtrlFuncionarios in 'uCtrlFuncionarios.pas',
  uCtrlFornecedores in 'uCtrlFornecedores.pas',
  uCtrlCargos in 'uCtrlCargos.pas',
  uCtrlModelos in 'uCtrlModelos.pas',
  uCtrlMarcas in 'uCtrlMarcas.pas',
  uCtrlGrupos in 'uCtrlGrupos.pas',
  uCtrlProdutos in 'uCtrlProdutos.pas',
  uDataModule in 'uDataModule.pas' {DM: TDataModule},
  uCondicaoPagamento in 'uCondicaoPagamento.pas',
  uDAOCondPag in 'uDAOCondPag.pas',
  uCtrlCondPag in 'uCtrlCondPag.pas',
  uFormasPagamento in 'uFormasPagamento.pas',
  uDAOFormaPag in 'uDAOFormaPag.pas',
  uCtrlFormaPag in 'uCtrlFormaPag.pas',
  uFrmCadastroFormasPagamento in 'uFrmCadastroFormasPagamento.pas' {FrmCadastroFormasPagamento},
  uFrmConsultaFormasPagamento in 'uFrmConsultaFormasPagamento.pas' {FrmConsultaFormasPagamento},
  uFrmCadastroCondicaoPagamento in 'uFrmCadastroCondicaoPagamento.pas' {FrmCadastroCondicaoPagamento},
  uParcelas in 'uParcelas.pas';

{$R *.res}
var
  FrmPrincipal: TFrmPrincipal;
begin
   FrmPrincipal := TFrmPrincipal.Create(nil);
   FrmPrincipal.ShowModal;
   FrmPrincipal.FreeInstance;
end.
