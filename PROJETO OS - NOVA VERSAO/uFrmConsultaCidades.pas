unit uFrmConsultaCidades;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmConsultaPai, Vcl.StdCtrls,
  Vcl.ComCtrls, ufrmCadastroCidades, uCidades, uColCidades, uCtrlCidades,
   Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TFrmConsultaCidades = class(TFrmConsultaPai)
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
    umCadastroCidades : TFrmCadastroCidades;
    aCidade : Cidades;
    aCtrlCidade : CtrlCidades;
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
  FrmConsultaCidades: TFrmConsultaCidades;

implementation

{$R *.dfm}

{ TFrmConsultaCidades }

procedure TfrmConsultaCidades.Alterar;
var  mMsg : string;
begin
  inherited;
  mMsg:= aCtrlCidade.Carregar(aCidade);
  umCadastroCidades.ConhecaObj(aCidade, aCtrlCidade);
  umCadastroCidades.LimpaEdit;
  umCadastroCidades.CarregaEdit;
  umCadastroCidades.ShowModal;
  self.DBGrid1.DataSource := TDataSource(aCtrlCidade.GetDS);
  aCtrlCidade.Pesquisar(EdtPesquisar.Text);
end;

procedure TFrmConsultaCidades.btnPesquisarClick(Sender: TObject);
begin
  aCtrlCidade.Pesquisar(self.EdtPesquisar.Text);
end;

procedure TFrmConsultaCidades.btnSairClick(Sender: TObject);
begin
  inherited;
  if self.btnSair.Caption = 'Selecionar' then
     aCtrlCidade.Carregar(aCidade);
end;

procedure TfrmConsultaCidades.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;
  aCidade := Cidades(pObj);
  aCtrlCidade := CtrlCidades(pCtrl);
  self.DBGrid1.DataSource := aCtrlCidade.GetDS;
  aCtrlCidade.Pesquisar(EdtPesquisar.Text);
end;

procedure TfrmConsultaCidades.Excluir;
var btn_nome : string;
begin
  inherited;
  aCtrlCidade.carregar(aCidade);
  umCadastroCidades.conhecaObj(aCidade, aCtrlCidade);
  umCadastroCidades.limpaEdit;
  umCadastroCidades.carregaEdit;
  btn_nome := umCadastroCidades.btnSalvar.Caption;
  umCadastroCidades.btnSalvar.Caption := '&Excluir';
  umCadastroCidades.bloqueiaEdit;
  umCadastroCidades.ShowModal;
  umCadastroCidades.DesbloqueiEdit;
  umCadastroCidades.btnSalvar.Caption := btn_nome;
  self.DBGrid1.DataSource := TDataSource(aCtrlCidade.GetDS);
  aCtrlCidade.Pesquisar(EdtPesquisar.Text);
end;

procedure TfrmConsultaCidades.Incluir;
begin
  inherited;
  umCadastroCidades.ConhecaObj(aCidade,aCtrlCidade);
  umCadastroCidades.ShowModal;
  self.DBGrid1.DataSource := TDataSource(aCtrlCidade.GetDS);
  aCtrlCidade.Pesquisar(EdtPesquisar.Text);
end;

procedure TfrmConsultaCidades.Pesquisar;
begin
  //aCtrlCidade.Pesquisar(self.EdtPesquisar.Text);
  umCadastroCidades.ShowModal;
end;

procedure TfrmConsultaCidades.Sair;
begin
  inherited;

end;

procedure TfrmConsultaCidades.SetCadastro(pObj: TObject);
begin
  inherited;
  umCadastroCidades := TFrmCadastroCidades(pObj);
end;
end.
