unit uFrmConsultaFuncionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmConsultaPai, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, uFuncionarios, uCtrlFuncionarios, uFrmCadastroFuncionarios;

type
  TFrmConsultaFuncionarios = class(TFrmConsultaPai)
  private
    { Private declarations }
    umCadastroFuncionarios : TFrmCadastroFuncionarios;
    oFuncionario : Funcionarios;
    aCtrlFuncionarios : CtrlFuncionarios;
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
  FrmConsultaFuncionarios: TFrmConsultaFuncionarios;

implementation

{$R *.dfm}

{ TFrmConsultaFuncionarios }

procedure TFrmConsultaFuncionarios.Alterar;
var  mMsg : string;
begin
  inherited;
  mMsg:= aCtrlFuncionarios.Carregar(oFuncionario);
  umCadastroFuncionarios.ConhecaObj(oFuncionario, aCtrlFuncionarios);
  umCadastroFuncionarios.LimpaEdit;
  umCadastroFuncionarios.CarregaEdit;
  umCadastroFuncionarios.ShowModal;
end;

procedure TFrmConsultaFuncionarios.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;
  oFuncionario := Funcionarios(pObj);
  aCtrlFuncionarios := CtrlFuncionarios(pCtrl);
  self.DBGrid1.DataSource := TDataSource(aCtrlFuncionarios.GetDS);
  aCtrlFuncionarios.Pesquisar(EdtPesquisar.Text);
end;

procedure TFrmConsultaFuncionarios.Excluir;
begin
  inherited;
  umCadastroFuncionarios.ConhecaObj(oFuncionario, aCtrlFuncionarios);
  umCadastroFuncionarios.ShowModal;
end;

procedure TFrmConsultaFuncionarios.Incluir;
begin
  inherited;
  umCadastroFuncionarios.ConhecaObj(oFuncionario, aCtrlFuncionarios);
  umCadastroFuncionarios.ShowModal;
end;

procedure TFrmConsultaFuncionarios.Pesquisar;
begin
  inherited;
  umCadastroFuncionarios.ShowModal;
end;

procedure TFrmConsultaFuncionarios.Sair;
begin
  inherited;

end;

procedure TFrmConsultaFuncionarios.SetCadastro(pObj: TObject);
begin
  inherited;
  umCadastroFuncionarios := TFrmCadastroFuncionarios(pObj);
end;

end.
