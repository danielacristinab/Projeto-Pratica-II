unit uFrmConsultaFornecedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmConsultaPai, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, uFornecedores, uCtrlFornecedores, uFrmCadastroFornecedor;

type
  TFrmConsultaFornecedores = class(TFrmConsultaPai)
    procedure btnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
    umCadastroFornecedores : TFrmCadastroFornecedores;
    oFornecedor : Fornecedores;
    aCtrlFornecedores : CtrlFornecedores;
  public
    { Public declarations }
    procedure ConhecaObj(pObj: TObject;  pCtrl: TObject); override;
    procedure Incluir;                                    override;
    procedure Alterar;                                    override;
    procedure Excluir;                                    override;
    procedure Pesquisar;                                  override;
    procedure Sair;                                       override;
    procedure SetCadastro(pObj: TObject);                 override;
  end;

var
  FrmConsultaFornecedores: TFrmConsultaFornecedores;

implementation

{$R *.dfm}

{ TFrmConsultaFornecedores }

procedure TFrmConsultaFornecedores.Alterar;
var  mMsg : string;
begin
  inherited;
  mMsg:= aCtrlFornecedores.Carregar(oFornecedor);
  umCadastroFornecedores.ConhecaObj(oFornecedor, aCtrlFornecedores);
  umCadastroFornecedores.LimpaEdit;
  umCadastroFornecedores.CarregaEdit;
  umCadastroFornecedores.ShowModal;
  self.DBGrid1.DataSource := TDataSource(aCtrlFornecedores.GetDS);
  aCtrlFornecedores.Pesquisar(EdtPesquisar.Text);
end;

procedure TFrmConsultaFornecedores.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  aCtrlFornecedores.Pesquisar(self.EdtPesquisar.Text);
end;

procedure TFrmConsultaFornecedores.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;
  oFornecedor := Fornecedores(pObj);
  aCtrlFornecedores := CtrlFornecedores(pCtrl);
  self.DBGrid1.DataSource := TDataSource(aCtrlFornecedores.GetDS);
  aCtrlFornecedores.Pesquisar(EdtPesquisar.Text);
end;

procedure TFrmConsultaFornecedores.Excluir;
var btn_nome : string;
begin
  inherited;
  aCtrlFornecedores.carregar(oFornecedor);
  umCadastroFornecedores.conhecaObj(oFornecedor, aCtrlFornecedores);
  umCadastroFornecedores.limpaEdit;
  umCadastroFornecedores.carregaEdit;
  btn_nome := umCadastroFornecedores.btnSalvar.Caption;
  umCadastroFornecedores.btnSalvar.Caption := '&Excluir';
  umCadastroFornecedores.bloqueiaEdit;
  umCadastroFornecedores.ShowModal;
  umCadastroFornecedores.DesbloqueiEdit;
  umCadastroFornecedores.btnSalvar.Caption := btn_nome;
  self.DBGrid1.DataSource := TDataSource(aCtrlFornecedores.GetDS);
  aCtrlFornecedores.Pesquisar(EdtPesquisar.Text);
end;

procedure TFrmConsultaFornecedores.Incluir;
begin
  inherited;
  umCadastroFornecedores.ConhecaObj(oFornecedor, aCtrlFornecedores);
  umCadastroFornecedores.ShowModal;
  self.DBGrid1.DataSource := TDataSource(aCtrlFornecedores.GetDS);
  aCtrlFornecedores.Pesquisar(EdtPesquisar.Text);
end;

procedure TFrmConsultaFornecedores.Pesquisar;
begin
  inherited;
  aCtrlFornecedores.Pesquisar(self.EdtPesquisar.Text);
end;

procedure TFrmConsultaFornecedores.Sair;
begin
  inherited;

end;

procedure TFrmConsultaFornecedores.SetCadastro(pObj: TObject);
begin
  inherited;
  umCadastroFornecedores := TFrmCadastroFornecedores(pObj);
end;

end.
