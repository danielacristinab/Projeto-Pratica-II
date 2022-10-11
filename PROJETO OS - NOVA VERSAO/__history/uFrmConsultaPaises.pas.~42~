unit uFrmConsultaPaises;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmConsultaPai, Vcl.StdCtrls,
  Vcl.ComCtrls, ufrmCadastroPaises, uPaises, uCtrlPaises,
  uColPaises, Data.DB, Vcl.Grids, Vcl.DBGrids, uDataModule;

type
  TFrmConsultaPaises = class(TFrmConsultaPai)
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
    umCadastroPaises : TFrmCadastroPaises;
    oPais : Paises;
    aCtrlPais : CtrlPaises;
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
  FrmConsultaPaises: TFrmConsultaPaises;

implementation

{$R *.dfm}

{ TFrmConsultaPaises }


procedure TFrmConsultaPaises.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;
  oPais := Paises(pObj);
  aCtrlPais := CtrlPaises(pCtrl);
  self.DBGrid1.DataSource := TDataSource(aCtrlPais.GetDS);
  aCtrlPais.Pesquisar(EdtPesquisar.Text);
end;

procedure TFrmConsultaPaises.Alterar;
var  mMsg : string;
begin
  inherited;
  mMsg:= aCtrlPais.Carregar(oPais);
  umCadastroPaises.ConhecaObj(oPais, aCtrlPais);
  umCadastroPaises.LimpaEdit;
  umCadastroPaises.CarregaEdit;
  umCadastroPaises.ShowModal;
  self.DBGrid1.DataSource := TDataSource(aCtrlPais.GetDS);
  aCtrlPais.Pesquisar(EdtPesquisar.Text);
end;

procedure TFrmConsultaPaises.btnPesquisarClick(Sender: TObject);
begin
  aCtrlPais.Pesquisar(self.EdtPesquisar.Text);
end;

procedure TFrmConsultaPaises.btnSairClick(Sender: TObject);
begin
  inherited;
  if self.btnSair.Caption = 'Selecionar' then
     actrlPais.Carregar(oPais);
end;

procedure TFrmConsultaPaises.Excluir;
var btn_nome : string;
begin
  inherited;
  aCtrlPais.carregar(oPais);
  umCadastroPaises.conhecaObj(oPais, aCtrlPais);
  umCadastroPaises.limpaEdit;
  umCadastroPaises.carregaEdit;
  btn_nome := umCadastroPaises.btnSalvar.Caption;
  umCadastroPaises.btnSalvar.Caption := '&Excluir';
  umCadastroPaises.bloqueiaEdit;
  umCadastroPaises.ShowModal;
  umCadastroPaises.DesbloqueiEdit;
  umCadastroPaises.btnSalvar.Caption := btn_nome;
  self.DBGrid1.DataSource := TDataSource(aCtrlPais.GetDS);
  aCtrlPais.Pesquisar(EdtPesquisar.Text);
end;

procedure TFrmConsultaPaises.Incluir;
begin
  inherited;
  umCadastroPaises.ConhecaObj(oPais, aCtrlPais);
  umCadastroPaises.LimpaEdit;
  umCadastroPaises.ShowModal;
  self.DBGrid1.DataSource := TDataSource(aCtrlPais.GetDS);
  aCtrlPais.Pesquisar(EdtPesquisar.Text);
end;

procedure TFrmConsultaPaises.Pesquisar;
begin
  aCtrlPais.Pesquisar(self.EdtPesquisar.Text);
end;

procedure TFrmConsultaPaises.Sair;
begin
  inherited;
end;

procedure TFrmConsultaPaises.SetCadastro(pObj: TObject);
begin
  inherited;
  umCadastroPaises := TFrmCadastroPaises(pObj);
end;

end.
