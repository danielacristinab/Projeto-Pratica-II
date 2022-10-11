unit uFrmConsultaGrupos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmConsultaPai, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, uGrupos, uCtrlGrupos, uFrmCadastroGrupos;

type
  TFrmConsultaGrupos = class(TFrmConsultaPai)
  private
    { Private declarations }
    umCadastroGrupos : TFrmCadastroGrupos;
    oGrupo : Grupos;
    aCtrlGrupos : CtrlGrupos;
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
  FrmConsultaGrupos: TFrmConsultaGrupos;

implementation

{$R *.dfm}

{ TFrmConsultaGrupos }

procedure TFrmConsultaGrupos.Alterar;
var  mMsg : string;
begin
  inherited;
  mMsg:= aCtrlGrupos.Carregar(oGrupo);
  umCadastroGrupos.ConhecaObj(oGrupo, aCtrlGrupos);
  umCadastroGrupos.LimpaEdit;
  umCadastroGrupos.CarregaEdit;
  umCadastroGrupos.ShowModal;
  self.DBGrid1.DataSource := TDataSource(aCtrlGrupos.GetDS);
  aCtrlGrupos.Pesquisar(EdtPesquisar.Text);
end;

procedure TFrmConsultaGrupos.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;
  oGrupo := Grupos(pObj);
  aCtrlGrupos := CtrlGrupos(pCtrl);
  self.DBGrid1.DataSource := TDataSource(aCtrlGrupos.GetDS);
  aCtrlGrupos.Pesquisar(EdtPesquisar.Text);
end;

procedure TFrmConsultaGrupos.Excluir;
begin
  inherited;

end;

procedure TFrmConsultaGrupos.Incluir;
begin
  inherited;
  umCadastroGrupos.ConhecaObj(oGrupo, aCtrlGrupos);
  umCadastroGrupos.LimpaEdit;
  umCadastroGrupos.ShowModal;
  self.DBGrid1.DataSource := TDataSource(aCtrlGrupos.GetDS);
  aCtrlGrupos.Pesquisar(EdtPesquisar.Text);
end;

procedure TFrmConsultaGrupos.Pesquisar;
begin
  inherited;
  aCtrlGrupos.Pesquisar(self.EdtPesquisar.Text);
end;

procedure TFrmConsultaGrupos.Sair;
begin
  inherited;

end;

procedure TFrmConsultaGrupos.SetCadastro(pObj: TObject);
begin
  inherited;
  umCadastroGrupos := TFrmCadastroGrupos(pObj);
end;

end.
