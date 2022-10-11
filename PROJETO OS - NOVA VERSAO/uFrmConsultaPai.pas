unit uFrmConsultaPai;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids;

type
  TFrmConsultaPai = class(TForm)
    btnPesquisar: TButton;
    btnSair: TButton;
    btnIncluir: TButton;
    btnExcluir: TButton;
    btnAlterar: TButton;
    edtPesquisar: TEdit;
    DBGrid1: TDBGrid;
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ConhecaObj(pObj: TObject;  pCtrl: TObject);  virtual;
    procedure Incluir;                    virtual;
    procedure Alterar;                    virtual;
    procedure Excluir;                    virtual;
    procedure Pesquisar;                  virtual;
    procedure Sair;                       virtual;
    procedure SetCadastro(pObj: TObject); virtual;
    procedure CarregaLV;                  virtual;
  end;

var
  FrmConsultaPai: TFrmConsultaPai;

implementation
uses udatamodule;
{$R *.dfm}

{ TForm3 }

procedure TFrmConsultaPai.Alterar;
begin

end;

procedure TFrmConsultaPai.btnAlterarClick(Sender: TObject);
begin
  Alterar;
end;

procedure TFrmConsultaPai.btnExcluirClick(Sender: TObject);
begin
  Excluir;
end;

procedure TFrmConsultaPai.btnIncluirClick(Sender: TObject);
begin
  Incluir;
end;

procedure TFrmConsultaPai.btnSairClick(Sender: TObject);
begin
  Sair;
end;

procedure TFrmConsultaPai.CarregaLV;
begin

end;

procedure TFrmConsultaPai.ConhecaObj(pObj, pCtrl: TObject);
begin

end;

procedure TFrmConsultaPai.Excluir;
begin

end;

procedure TFrmConsultaPai.Incluir;
begin

end;

procedure TFrmConsultaPai.Pesquisar;
begin

end;

procedure TFrmConsultaPai.Sair;
begin
 Close;
end;

procedure TFrmConsultaPai.SetCadastro(pObj: TObject);
begin

end;

end.
