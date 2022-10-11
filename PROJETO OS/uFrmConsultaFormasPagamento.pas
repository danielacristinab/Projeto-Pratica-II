unit uFrmConsultaFormasPagamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmConsultaPai, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, uFrmCadastroFormasPagamento, uFormasPagamento,
  uCtrlFormaPag;

type
  TFrmConsultaFormasPagamento = class(TFrmConsultaPai)
    procedure btnSairClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
    umCadastroFormaPag : TFrmCadastroFormasPagamento;
    aFormaPag : FormasPagamento;
    aCtrlFormaPag : CtrlFormaPag;
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
  FrmConsultaFormasPagamento: TFrmConsultaFormasPagamento;

implementation

{$R *.dfm}

{ TFrmConsultaPai1 }

procedure TFrmConsultaFormasPagamento.Alterar;
var  mMsg : string;
begin
  inherited;
  mMsg:= aCtrlFormaPag.Carregar(aFormaPag);
  umCadastroFormaPag.ConhecaObj(aFormaPag, aCtrlFormaPag);
  umCadastroFormaPag.LimpaEdit;
  umCadastroFormaPag.CarregaEdit;
  umCadastroFormaPag.ShowModal;
  self.DBGrid1.DataSource := TDataSource(aCtrlFormaPag.GetDS);
  aCtrlFormaPag.Pesquisar(EdtPesquisar.Text);
end;

procedure TFrmConsultaFormasPagamento.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  aCtrlFormaPag.Pesquisar(self.EdtPesquisar.Text);
end;

procedure TFrmConsultaFormasPagamento.btnSairClick(Sender: TObject);
begin
  inherited;
  if self.btnSair.Caption = 'Selecionar' then
     aCtrlFormaPag.Carregar(aFormaPag);
end;

procedure TFrmConsultaFormasPagamento.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;
  aFormaPag := FormasPagamento(pObj);
  aCtrlFormaPag := CtrlFormaPag(pCtrl);
  self.DBGrid1.DataSource := TDataSource(aCtrlFormaPag.GetDS);
  aCtrlFormaPag.Pesquisar(EdtPesquisar.Text);
end;

procedure TFrmConsultaFormasPagamento.Excluir;
begin
  inherited;

end;

procedure TFrmConsultaFormasPagamento.Incluir;
begin
  inherited;
  umCadastroFormaPag.ConhecaObj(aFormaPag, aCtrlFormaPag);
  umCadastroFormaPag.LimpaEdit;
  umCadastroFormaPag.ShowModal;
  self.DBGrid1.DataSource := TDataSource(aCtrlFormaPag.GetDS);
  aCtrlFormaPag.Pesquisar(EdtPesquisar.Text);
end;

procedure TFrmConsultaFormasPagamento.Pesquisar;
begin
  inherited;
  aCtrlFormaPag.Pesquisar(self.EdtPesquisar.Text);
end;

procedure TFrmConsultaFormasPagamento.Sair;
begin
  inherited;

end;

procedure TFrmConsultaFormasPagamento.SetCadastro(pObj: TObject);
begin
  inherited;
  umCadastroFormaPag := TFrmCadastroFormasPagamento(pObj);
end;

end.
