program ProjetoOS;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {FrmPrincipal},
  uFrmCadastroPai in 'uFrmCadastroPai.pas' {FrmCadastroPai},
  uFrmCadastroPaises in 'uFrmCadastroPaises.pas' {FrmCadastroPaises},
  uFrmCadastroCidades in 'uFrmCadastroCidades.pas' {FrmCadastroCidades},
  uFrmCadastroEstados in 'uFrmCadastroEstados.pas' {FrmCadastroEstados},
  uFrmConsultaPai in 'uFrmConsultaPai.pas' {FrmConsultaPai},
  uFrmConsultaPaises in 'uFrmConsultaPaises.pas' {FrmConsultaPaises},
  uFrmConsultaEstados in 'uFrmConsultaEstados.pas' {FrmConsultaEstados},
  uFrmConsultaCidades in 'uFrmConsultaCidades.pas' {FrmConsultaCidades},
  uFrmCondicaoPagamento in 'uFrmCondicaoPagamento.pas' {FrmCondicaoPagamento},
  uPai in 'uPai.pas',
  uPessoa in 'uPessoa.pas',
  uFornecedores in 'uFornecedores.pas',
  uDAO in 'uDAO.pas',
  uDAOCidades in 'uDAOCidades.pas',
  uDAOEstados in 'uDAOEstados.pas',
  uDAOPaises in 'uDAOPaises.pas',
  uDAOClientes in 'uDAOClientes.pas',
  uDAOFuncionarios in 'uDAOFuncionarios.pas',
  uDAOFornecedores in 'uDAOFornecedores.pas',
  uDAOCargos in 'uDAOCargos.pas',
  uController in 'uController.pas',
  uCtrlEstados in 'uCtrlEstados.pas',
  uCtrlPaises in 'uCtrlPaises.pas',
  uCtrlCidades in 'uCtrlCidades.pas',
  uCtrlClientes in 'uCtrlClientes.pas',
  uCtrlFuncionarios in 'uCtrlFuncionarios.pas',
  uCtrlFornecedores in 'uCtrlFornecedores.pas',
  uCtrlCargos in 'uCtrlCargos.pas',
  uDataModule in 'uDataModule.pas' {DM: TDataModule},
  uOS in 'uOS.pas',
  uEstados in 'uEstados.pas',
  uPaises in 'uPaises.pas',
  uCidades in 'uCidades.pas',
  uInterfaces in 'uInterfaces.pas',
  uFuncionarios in 'uFuncionarios.pas',
  uClientes in 'uClientes.pas',
  uCargos in 'uCargos.pas',
  uFrmCadastroPessoa in 'uFrmCadastroPessoa.pas' {FrmCadastroPessoa},
  uFrmCadastroClientes in 'uFrmCadastroClientes.pas' {FrmCadastroClientes},
  uFrmCadastroFuncionarios in 'uFrmCadastroFuncionarios.pas' {FrmCadastroFuncionarios},
  uFrmCadastroFornecedor in 'uFrmCadastroFornecedor.pas' {FrmCadastroFornecedores},
  uFrmCadastroCargos in 'uFrmCadastroCargos.pas' {FrmCadastroCargos},
  uFrmConsultaClientes in 'uFrmConsultaClientes.pas' {FrmConsultaClientes},
  uFrmConsultaFornecedores in 'uFrmConsultaFornecedores.pas' {FrmConsultaFornecedores},
  uFrmConsultaFuncionarios in 'uFrmConsultaFuncionarios.pas' {FrmConsultaFuncionarios},
  uFrmConsultaCargos in 'uFrmConsultaCargos.pas' {FrmConsultaCargos};

{$R *.res}
var
  FrmPrincipal: TFrmPrincipal;
begin
   FrmPrincipal := TFrmPrincipal.Create(nil);
   FrmPrincipal.ShowModal;
   FrmPrincipal.FreeInstance;
end.
