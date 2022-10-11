unit uFrmCadastroPai;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFrmCadastroPai = class(TForm)
    lblCodigo: TLabel;
    lblDataCad: TLabel;
    lblUltAlt: TLabel;
    edtCodigo: TEdit;
    btnSair: TButton;
    btnSalvar: TButton;
    edtDataCad: TEdit;
    edtUltAlt: TEdit;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
  FrmCadastroPai: TFrmCadastroPai;

implementation

{$R *.dfm}
procedure TfrmCadastroPai.BloqueiaEdit;
begin

end;

procedure TfrmCadastroPai.btnSairClick(Sender: TObject);
begin
  Sair;
end;

procedure TfrmCadastroPai.btnSalvarClick(Sender: TObject);
begin
  Salvar;
end;

procedure TfrmCadastroPai.CarregaEdit;
begin

end;

procedure TfrmCadastroPai.ConhecaObj(pObj, pCtrl: TObject);
begin

end;

procedure TfrmCadastroPai.DesbloqueiEdit;
begin

end;

function TfrmCadastroPai.ehobrigatorio(pTexto: string; pLetra: char): boolean;
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

procedure TfrmCadastroPai.FormShow(Sender: TObject);
begin
  edtDataCad.Text := FormatDateTime('dd.mm.yyyy',Date());
  edtUltAlt.Text := FormatDateTime('dd.mm.yyyy',Date());
end;

procedure TfrmCadastroPai.LimpaEdit;
begin

end;

procedure TfrmCadastroPai.Sair;
begin
   close;
end;

procedure TfrmCadastroPai.Salvar;
begin

end;

procedure TfrmCadastroPai.SetConsulta(pObj: TObject);
begin

end;

end.
