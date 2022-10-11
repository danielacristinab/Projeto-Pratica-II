unit uFrmConsultaCargos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmConsultaPai, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, uCargos, uCtrlCargos, uFrmCadastroCargos;

type
  TFrmConsultaCargos = class(TFrmConsultaPai)
    procedure btnSairClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
    umCadastroCargos : TFrmCadastroCargos;
    oCargo : Cargos;
    aCtrlCargo : CtrlCargos;
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
  FrmConsultaCargos: TFrmConsultaCargos;

implementation

{$R *.dfm}

{ TFrmConsultaCargos }

procedure TFrmConsultaCargos.Alterar;
var  mMsg : string;
begin
  inherited;
  mMsg:= aCtrlCargo.Carregar(oCargo);
  umCadastroCargos.ConhecaObj(oCargo, aCtrlCargo);
  umCadastroCargos.LimpaEdit;
  umCadastroCargos.CarregaEdit;
  umCadastroCargos.ShowModal;
end;

procedure TFrmConsultaCargos.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  aCtrlCargo.Pesquisar(self.EdtPesquisar.Text);
end;

procedure TFrmConsultaCargos.btnSairClick(Sender: TObject);
begin
  inherited;
  if self.btnSair.Caption = 'Selecionar' then
     aCtrlCargo.Carregar(oCargo);
end;

procedure TFrmConsultaCargos.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;
  oCargo := Cargos(pObj);
  aCtrlCargo := CtrlCargos(pCtrl);
  self.DBGrid1.DataSource := TDataSource(aCtrlCargo.GetDS);
  aCtrlCargo.Pesquisar(EdtPesquisar.Text);
end;

procedure TFrmConsultaCargos.Excluir;
begin
  inherited;

end;

procedure TFrmConsultaCargos.Incluir;
begin
  inherited;
  umCadastroCargos.ConhecaObj(oCargo, aCtrlCargo);
  umCadastroCargos.LimpaEdit;
  umCadastroCargos.ShowModal;
end;

procedure TFrmConsultaCargos.Pesquisar;
begin
  inherited;
  aCtrlCargo.Pesquisar(self.EdtPesquisar.Text);
end;

procedure TFrmConsultaCargos.Sair;
begin
  inherited;

end;

procedure TFrmConsultaCargos.SetCadastro(pObj: TObject);
begin
  inherited;
  umCadastroCargos := TFrmCadastroCargos(pObj);
end;

end.
