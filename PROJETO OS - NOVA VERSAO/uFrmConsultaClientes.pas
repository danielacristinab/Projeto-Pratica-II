unit uFrmConsultaClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmConsultaPai, Vcl.StdCtrls,
  Vcl.ComCtrls, uFrmCadastroClientes, uClientes, uCtrlClientes,
  Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TFrmConsultaClientes = class(TFrmConsultaPai)
    procedure btnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
    umCadastroClientes : TFrmCadastroClientes;
    oCliente : Clientes;
    aCtrlClientes : CtrlClientes;
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
  FrmConsultaClientes: TFrmConsultaClientes;

implementation

{$R *.dfm}

{ TFrmConsultaClientes }

procedure TFrmConsultaClientes.Alterar;
var  mMsg : string;
begin
  inherited;
  mMsg:= aCtrlClientes.Carregar(oCliente);
  umCadastroClientes.ConhecaObj(oCliente, aCtrlClientes);
  umCadastroClientes.LimpaEdit;
  umCadastroClientes.CarregaEdit;
  umCadastroClientes.ShowModal;
  self.DBGrid1.DataSource := TDataSource(aCtrlClientes.GetDS);
  aCtrlClientes.Pesquisar(EdtPesquisar.Text);
end;

procedure TFrmConsultaClientes.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  aCtrlClientes.Pesquisar(self.EdtPesquisar.Text);
end;

procedure TFrmConsultaClientes.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;
  oCliente := Clientes(pObj);
  aCtrlClientes := Ctrlclientes(pCtrl);
  self.DBGrid1.DataSource := TDataSource(aCtrlClientes.GetDS);
  aCtrlClientes.Pesquisar(EdtPesquisar.Text);
end;

procedure TFrmConsultaClientes.Excluir;
var btn_nome : string;
begin
  inherited;
  aCtrlClientes.carregar(oCliente);
  umCadastroClientes.conhecaObj(oCliente, aCtrlClientes);
  umCadastroClientes.limpaEdit;
  umCadastroClientes.carregaEdit;
  btn_nome := umCadastroClientes.btnSalvar.Caption;
  umCadastroClientes.btnSalvar.Caption := '&Excluir';
  umCadastroClientes.bloqueiaEdit;
  umCadastroClientes.ShowModal;
  umCadastroClientes.DesbloqueiEdit;
  umCadastroClientes.btnSalvar.Caption := btn_nome;
  self.DBGrid1.DataSource := TDataSource(aCtrlClientes.GetDS);
  aCtrlClientes.Pesquisar(EdtPesquisar.Text);
end;

procedure TFrmConsultaClientes.Incluir;
begin
  inherited;
  umCadastroClientes.ConhecaObj(oCliente, aCtrlClientes);
  umCadastroClientes.LimpaEdit;
  umCadastroClientes.ShowModal;
  self.DBGrid1.DataSource := TDataSource(aCtrlClientes.GetDS);
  aCtrlClientes.Pesquisar(EdtPesquisar.Text);
end;

procedure TFrmConsultaClientes.Pesquisar;
begin
  inherited;
  aCtrlclientes.Pesquisar(self.EdtPesquisar.Text);
end;

procedure TFrmConsultaClientes.Sair;
begin
  inherited;

end;

procedure TFrmConsultaClientes.SetCadastro(pObj: TObject);
begin
  inherited;
  umCadastroClientes := TFrmCadastroClientes(pObj);
end;

end.

