unit uFrmCadastroPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmCadastroPai, Vcl.StdCtrls;

type
  TFrmCadastroPessoa = class(TFrmCadastroPai)
    edtEndereco: TEdit;
    edtNumero: TEdit;
    edtComplemento: TEdit;
    edtCEP: TEdit;
    edtBairro: TEdit;
    edtCodCidade: TEdit;
    edtCidade: TEdit;
    lblEndereco: TLabel;
    lblNumero: TLabel;
    lblComplemento: TLabel;
    lblCEP: TLabel;
    lblBairro: TLabel;
    lblCodCidade: TLabel;
    lblCidade: TLabel;
    btnPesquisar: TButton;
    edtUF: TEdit;
    lblUF: TLabel;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ConhecaObj(pObj: TObject;  pCtrl: TObject);  virtual;
    procedure LimpaEdit;                                   virtual;
    procedure CarregaEdit;                                 virtual;
    procedure BloqueiaEdit;                                virtual;
    procedure DesbloqueiEdit;                              virtual;
    procedure Salvar;                                      virtual;
    procedure Sair;                                        virtual;
    procedure SetConsulta(pObj: TObject);                  virtual;
    function ehobrigatorio(pTexto: string; pLetra: char): boolean;virtual;
  end;

var
  FrmCadastroPessoa: TFrmCadastroPessoa;

implementation

{$R *.dfm}

{ TFrmCadastroPessoa }

procedure TFrmCadastroPessoa.BloqueiaEdit;
begin

end;

procedure TFrmCadastroPessoa.btnSairClick(Sender: TObject);
begin
  inherited;
  Sair;
end;

procedure TFrmCadastroPessoa.btnSalvarClick(Sender: TObject);
begin
  inherited;
  Salvar;
end;

procedure TFrmCadastroPessoa.CarregaEdit;
begin

end;

procedure TFrmCadastroPessoa.ConhecaObj(pObj, pCtrl: TObject);
begin

end;

procedure TFrmCadastroPessoa.DesbloqueiEdit;
begin

end;

function TFrmCadastroPessoa.ehobrigatorio(pTexto: string;
  pLetra: char): boolean;
var achei : boolean;
    k, tam: integer;
begin
  achei := false;
  k:= 1;
  tam := length(pTexto);
  while not achei and (k <= tam) do
  begin
    achei := pLetra = pTexto[k];
    k := k +1;
  end;
  result := achei;
end;

procedure TFrmCadastroPessoa.LimpaEdit;
begin

end;

procedure TFrmCadastroPessoa.Sair;
begin
  Close;
end;

procedure TFrmCadastroPessoa.Salvar;
begin

end;

procedure TFrmCadastroPessoa.SetConsulta(pObj: TObject);
begin

end;

end.
