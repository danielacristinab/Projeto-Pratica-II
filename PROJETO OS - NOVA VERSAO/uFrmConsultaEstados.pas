unit uFrmConsultaEstados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmConsultaPai, Vcl.StdCtrls,
  Vcl.ComCtrls, ufrmCadastroEstados, uEstados, uCtrlEstados,
  Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TFrmConsultaEstados = class(TFrmConsultaPai)
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
    umCadastroEstados : TFrmCadastroEstados;
    oEstado : estados;
    aCtrlEstado : CtrlEstados;
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
  FrmConsultaEstados: TFrmConsultaEstados;

implementation

{$R *.dfm}

{ TFrmConsultaEstados }

procedure TFrmConsultaEstados.btnPesquisarClick(Sender: TObject);
begin
  aCtrlEstado.Pesquisar(self.EdtPesquisar.Text);
end;

procedure TFrmConsultaEstados.btnSairClick(Sender: TObject);
begin
  inherited;
  if self.btnSair.Caption = 'Selecionar' then
     actrlEstado.Carregar(oEstado);
end;

procedure TfrmConsultaEstados.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;
  oEstado := Estados(pObj);
  aCtrlEstado := CtrlEstados(pCtrl);
  self.DBGrid1.DataSource := TDataSource(aCtrlEstado.GetDS);
  aCtrlEstado.Pesquisar(EdtPesquisar.Text);
end;

procedure TfrmConsultaEstados.Excluir;
var btn_nome : string;
begin
  inherited;
  aCtrlEstado.carregar(oEstado);
  umCadastroEstados.conhecaObj(oEstado, aCtrlEstado);
  umCadastroEstados.limpaEdit;
  umCadastroEstados.carregaEdit;
  btn_nome := umCadastroEstados.btnSalvar.Caption;
  umCadastroEstados.btnSalvar.Caption := '&Excluir';
  umCadastroEstados.bloqueiaEdit;
  umCadastroEstados.ShowModal;
  umCadastroEstados.DesbloqueiEdit;
  umCadastroEstados.btnSalvar.Caption := btn_nome;
  self.DBGrid1.DataSource := TDataSource(aCtrlEstado.GetDS);
  aCtrlEstado.Pesquisar(EdtPesquisar.Text);
end;

procedure TfrmConsultaEstados.Incluir;
begin
  inherited;
  umCadastroEstados.ConhecaObj(oEstado, aCtrlEstado);
  umCadastroEstados.ShowModal;
  self.DBGrid1.DataSource := TDataSource(aCtrlEstado.GetDS);
  aCtrlEstado.Pesquisar(EdtPesquisar.Text);
end;

procedure TfrmConsultaEstados.Alterar;
var  mMsg : string;
begin
  inherited;
  mMsg:= aCtrlEstado.Carregar(oEstado);
  umCadastroEstados.ConhecaObj(oEstado, aCtrlEstado);
  umCadastroEstados.LimpaEdit;
  umCadastroEstados.CarregaEdit;
  umCadastroEstados.ShowModal;
  self.DBGrid1.DataSource := TDataSource(aCtrlEstado.GetDS);
  aCtrlEstado.Pesquisar(EdtPesquisar.Text);
end;

procedure TfrmConsultaEstados.Pesquisar;
begin
  inherited;
  umCadastroEstados.ShowModal;
end;

procedure TfrmConsultaEstados.Sair;
begin
  inherited;

end;

procedure TfrmConsultaEstados.SetCadastro(pObj: TObject);
begin
  inherited;
  umCadastroEstados := TFrmCadastroEstados(pObj);
end;

end.
