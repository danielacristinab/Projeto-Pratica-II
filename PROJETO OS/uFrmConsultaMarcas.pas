unit uFrmConsultaMarcas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmConsultaPai, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, uMarcas, uCtrlMarcas, uFrmCadastroMarcas;

type
  TFrmConsultaMarcas = class(TFrmConsultaPai)
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
    umCadastroMarcas : TFrmCadastroMarcas;
    aMarca : Marcas;
    aCtrlMarca : CtrlMarcas;
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
  FrmConsultaMarcas: TFrmConsultaMarcas;

implementation

{$R *.dfm}

{ TFrmConsultaMarcas }

procedure TFrmConsultaMarcas.Alterar;
var  mMsg : string;
begin
  inherited;
  mMsg:= aCtrlMarca.Carregar(aMarca);
  umCadastroMarcas.ConhecaObj(aMarca, aCtrlMarca);
  umCadastroMarcas.LimpaEdit;
  umCadastroMarcas.CarregaEdit;
  umCadastroMarcas.ShowModal;
  self.DBGrid1.DataSource := TDataSource(aCtrlMarca.GetDS);
  aCtrlMarca.Pesquisar(EdtPesquisar.Text);
end;

procedure TFrmConsultaMarcas.btnPesquisarClick(Sender: TObject);
begin
  aCtrlMarca.Pesquisar(self.EdtPesquisar.Text);
end;

procedure TFrmConsultaMarcas.btnSairClick(Sender: TObject);
begin
  inherited;
  if self.btnSair.Caption = 'Selecionar' then
     aCtrlMarca.Carregar(aMarca);
end;

procedure TFrmConsultaMarcas.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;
  aMarca := Marcas(pObj);
  aCtrlMarca := CtrlMarcas(pCtrl);
  self.DBGrid1.DataSource := TDataSource(aCtrlMarca.GetDS);
  aCtrlMarca.Pesquisar(EdtPesquisar.Text);
end;

procedure TFrmConsultaMarcas.Excluir;
var btn_nome : string;
begin
  inherited;
  aCtrlMarca.carregar(aMarca);
  umCadastroMarcas.conhecaObj(aMarca, aCtrlMarca);
  umCadastroMarcas.limpaEdit;
  umCadastroMarcas.carregaEdit;
  btn_nome := umCadastroMarcas.btnSalvar.Caption;
  umCadastroMarcas.btnSalvar.Caption := '&Excluir';
  umCadastroMarcas.bloqueiaEdit;
  umCadastroMarcas.ShowModal;
  umCadastroMarcas.DesbloqueiEdit;
  umCadastroMarcas.btnSalvar.Caption := btn_nome;
  self.DBGrid1.DataSource := TDataSource(aCtrlMarca.GetDS);
  aCtrlMarca.Pesquisar(EdtPesquisar.Text);
end;

procedure TFrmConsultaMarcas.Incluir;
begin
  inherited;
  umCadastroMarcas.ConhecaObj(aMarca, aCtrlMarca);
  umCadastroMarcas.LimpaEdit;
  umCadastroMarcas.ShowModal;
  self.DBGrid1.DataSource := TDataSource(aCtrlMarca.GetDS);
  aCtrlMarca.Pesquisar(EdtPesquisar.Text);
end;

procedure TFrmConsultaMarcas.Pesquisar;
begin
  inherited;
  aCtrlMarca.Pesquisar(self.EdtPesquisar.Text);
end;

procedure TFrmConsultaMarcas.Sair;
begin
  inherited;

end;

procedure TFrmConsultaMarcas.SetCadastro(pObj: TObject);
begin
  inherited;
  umCadastroMarcas := TFrmCadastroMarcas(pObj);
end;

end.
