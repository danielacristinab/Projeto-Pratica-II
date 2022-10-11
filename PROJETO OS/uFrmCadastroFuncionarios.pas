unit uFrmCadastroFuncionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmCadastroPessoa, Vcl.StdCtrls,
  uFrmConsultaCidades, uFuncionarios, uCtrlFuncionarios;

type
  TFrmCadastroFuncionarios = class(TFrmCadastroPessoa)
    lblNome: TLabel;
    lblDataNasc: TLabel;
    lblRG: TLabel;
    lblCPF: TLabel;
    lblTelefone: TLabel;
    lblCelular: TLabel;
    edtNome: TEdit;
    edtDataNasc: TEdit;
    edtRG: TEdit;
    edtCPF: TEdit;
    edtTelefone: TEdit;
    edtCelular: TEdit;
    edtEmail: TEdit;
    lblEmail: TLabel;
  private
    { Private declarations }
    umFrmConsultaCidades : TFrmConsultaCidades;
    oFuncionario : Funcionarios;
    aCtrlFuncionarios : CtrlFuncionarios;
  public
    { Public declarations }
    procedure ConhecaObj(pObj: TObject;  pCtrl: TObject);  override;
    procedure LimpaEdit;                                   override;
    procedure CarregaEdit;                                 override;
    procedure BloqueiaEdit;                                override;
    procedure DesbloqueiEdit;                              override;
    procedure Salvar;                                      override;
    procedure Sair;                                        override;
    procedure SetConsulta(pObj: TObject);                  override;
  end;

var
  FrmCadastroFuncionarios: TFrmCadastroFuncionarios;

implementation

{$R *.dfm}

{ TFrmCadastroFuncionarios }

procedure TFrmCadastroFuncionarios.BloqueiaEdit;
begin
  inherited;
  edtCodigo.Enabled := false;
  edtNome.Enabled := false;
  edtDataNasc.Enabled := false;
  edtRg.Enabled := false;
  edtCPF.Enabled := false;
  edtTelefone.Enabled := false;
  edtCelular.Enabled := false;
  edtEndereco.Enabled := false;
  edtNumero.Enabled := false;
  edtCep.Enabled := false;
  edtBairro.Enabled := false;
  edtComplemento.Enabled := false;
  edtCodCidade.Enabled := false;
  edtCidade.Enabled := false;
  edtDataCad.Enabled := false;
  edtUltAlt.Enabled := false;
end;

procedure TFrmCadastroFuncionarios.CarregaEdit;
begin
  inherited;
  if oFuncionario.GetCodigo <> 0 then
    self.edtCodigo.Text := inttostr(oFuncionario.GetCodigo);
  edtCodigo.Text := inttostr (oFuncionario.GetCodigo);
  edtNome.Text := oFuncionario.GetNome;
  edtDataNasc.Text := oFuncionario.GetDataNasc;
  edtRg.Text := oFuncionario.GetRG;
  edtCPF.Text := oFuncionario.GetCPF;
  edtTelefone.Text := oFuncionario.GetTelefone;
  edtCelular.Text := oFuncionario.GetCelular;
  edtCodCidade.Text := inttostr(oFuncionario.getaCidade.GetCodigo);
  edtCidade.Text := oFuncionario.getaCidade.GetCidade;
  edtDataCad.Text := oFuncionario.GetDataCad;
  edtUltAlt.Text := oFuncionario.GetUltAlt;
end;

procedure TFrmCadastroFuncionarios.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;
  oFuncionario := Funcionarios(pObj);
  aCtrlFuncionarios := CtrlFuncionarios(pCtrl);
  self.LimpaEdit;
  self.CarregaEdit;
end;

procedure TFrmCadastroFuncionarios.DesbloqueiEdit;
begin
  inherited;
  edtCodigo.Enabled := true;
  edtNome.Enabled := true;
  edtDataNasc.Enabled := true;
  edtRg.Enabled := true;
  edtCPF.Enabled := true;
  edtTelefone.Enabled := true;
  edtCelular.Enabled := true;
  edtEndereco.Enabled := true;
  edtNumero.Enabled := true;
  edtCep.Enabled := true;
  edtBairro.Enabled := true;
  edtComplemento.Enabled := true;
  edtCodCidade.Enabled := true;
  edtCidade.Enabled := true;
end;

procedure TFrmCadastroFuncionarios.LimpaEdit;
begin
  inherited;
  edtCodigo.Text := '0';
  edtNome.Clear;
  edtDataNasc.Clear;
  edtRg.Clear;
  edtCPF.Clear;
  edtTelefone.Clear;
  edtCelular.Clear;
  edtEndereco.Clear;
  edtNumero.Clear;
  edtCep.Clear;
  edtBairro.Clear;
  edtComplemento.Clear;
  edtCodCidade.Clear;
  edtCidade.Clear;
end;

procedure TFrmCadastroFuncionarios.Sair;
begin
  inherited;

end;

procedure TFrmCadastroFuncionarios.Salvar;
begin
  inherited;

end;

procedure TFrmCadastroFuncionarios.SetConsulta(pObj: TObject);
begin
  inherited;
  umFrmConsultaCidades := TFrmConsultaCidades(pObj);
end;

end.
