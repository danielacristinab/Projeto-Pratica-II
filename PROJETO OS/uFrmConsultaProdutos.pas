unit uFrmConsultaProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmConsultaPai, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, uProdutos, uCtrlProdutos, uFrmCadastroProdutos;

type
  TFrmConsultaProdutos = class(TFrmConsultaPai)
  private
    { Private declarations }
    umCadastroProdutos : TFrmCadastroProdutos;
    oProduto : Produtos;
    aCtrlProduto : CtrlProdutos;
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
  FrmConsultaProdutos: TFrmConsultaProdutos;

implementation

{$R *.dfm}

{ TFrmConsultaProdutos }

procedure TFrmConsultaProdutos.Alterar;
var  mMsg : string;
begin
  inherited;
  mMsg:= aCtrlProduto.Carregar(oProduto);
  umCadastroProdutos.ConhecaObj(oProduto, aCtrlProduto);
  umCadastroProdutos.LimpaEdit;
  umCadastroProdutos.CarregaEdit;
  umCadastroProdutos.ShowModal;
  self.DBGrid1.DataSource := TDataSource(aCtrlProduto.GetDS);
  aCtrlProduto.Pesquisar(EdtPesquisar.Text);
end;

procedure TFrmConsultaProdutos.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;
  oProduto := Produtos(pObj);
  aCtrlProduto := CtrlProdutos(pCtrl);
  self.DBGrid1.DataSource := TDataSource(aCtrlProduto.GetDS);
  aCtrlProduto.Pesquisar(EdtPesquisar.Text);
end;

procedure TFrmConsultaProdutos.Excluir;
begin
  inherited;

end;

procedure TFrmConsultaProdutos.Incluir;
begin
  inherited;
  umCadastroProdutos.ConhecaObj(oProduto, aCtrlProduto);
  umCadastroProdutos.LimpaEdit;
  umCadastroProdutos.ShowModal;
  self.DBGrid1.DataSource := TDataSource(aCtrlProduto.GetDS);
  aCtrlProduto.Pesquisar(EdtPesquisar.Text);
end;

procedure TFrmConsultaProdutos.Pesquisar;
begin
  aCtrlProduto.Pesquisar(self.EdtPesquisar.Text);
end;

procedure TFrmConsultaProdutos.Sair;
begin
  inherited;

end;

procedure TFrmConsultaProdutos.SetCadastro(pObj: TObject);
begin
  inherited;
  umCadastroProdutos := TFrmCadastroProdutos(pObj);
end;

end.
