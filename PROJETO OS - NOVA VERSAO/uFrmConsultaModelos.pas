unit uFrmConsultaModelos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmConsultaPai, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, uModelos, uCtrlModelos, uFrmCadastroModelos;

type
  TFrmConsultaModelos = class(TFrmConsultaPai)
  private
    { Private declarations }
    umCadastroModelos : TFrmCadastroModelos;
    oModelo : Modelos;
    aCtrlModelo : CtrlModelos;
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
  FrmConsultaModelos: TFrmConsultaModelos;

implementation

{$R *.dfm}

{ TFrmConsultaModelos }

procedure TFrmConsultaModelos.Alterar;
var  mMsg : string;
begin
  inherited;
  mMsg:= aCtrlModelo.Carregar(oModelo);
  umCadastroModelos.ConhecaObj(oModelo, aCtrlModelo);
  umCadastroModelos.LimpaEdit;
  umCadastroModelos.CarregaEdit;
  umCadastroModelos.ShowModal;
  self.DBGrid1.DataSource := TDataSource(aCtrlModelo.GetDS);
  aCtrlModelo.Pesquisar(EdtPesquisar.Text);
end;

procedure TFrmConsultaModelos.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;
  oModelo := Modelos(pObj);
  aCtrlModelo := CtrlModelos(pCtrl);
  self.DBGrid1.DataSource := TDataSource(aCtrlModelo.GetDS);
  aCtrlModelo.Pesquisar(EdtPesquisar.Text);
end;

procedure TFrmConsultaModelos.Excluir;
var btn_nome : string;
begin
  inherited;
  aCtrlModelo.carregar(oModelo);
  umCadastroModelos.conhecaObj(oModelo, aCtrlModelo);
  umCadastroModelos.limpaEdit;
  umCadastroModelos.carregaEdit;
  btn_nome := umCadastroModelos.btnSalvar.Caption;
  umCadastroModelos.btnSalvar.Caption := '&Excluir';
  umCadastroModelos.bloqueiaEdit;
  umCadastroModelos.ShowModal;
  umCadastroModelos.DesbloqueiEdit;
  umCadastroModelos.btnSalvar.Caption := btn_nome;
  self.DBGrid1.DataSource := TDataSource(aCtrlModelo.GetDS);
  aCtrlModelo.Pesquisar(EdtPesquisar.Text);
end;

procedure TFrmConsultaModelos.Incluir;
begin
  inherited;
  umCadastroModelos.ConhecaObj(oModelo, aCtrlModelo);
  umCadastroModelos.LimpaEdit;
  umCadastroModelos.ShowModal;
  self.DBGrid1.DataSource := TDataSource(aCtrlModelo.GetDS);
  aCtrlModelo.Pesquisar(EdtPesquisar.Text);
end;

procedure TFrmConsultaModelos.Pesquisar;
begin
  inherited;
  aCtrlModelo.Pesquisar(self.EdtPesquisar.Text);
end;

procedure TFrmConsultaModelos.Sair;
begin
  inherited;

end;

procedure TFrmConsultaModelos.SetCadastro(pObj: TObject);
begin
  inherited;
  umCadastroModelos := TFrmCadastroModelos(pObj);
end;

end.
