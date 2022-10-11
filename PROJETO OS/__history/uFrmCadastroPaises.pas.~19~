unit uFrmCadastroPaises;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmCadastroPai, Vcl.StdCtrls,
  uPaises, uCtrlPaises;

type
  TFrmCadastroPaises = class(TFrmCadastroPai)
    lblPais: TLabel;
    lblSigla: TLabel;
    lblDDI: TLabel;
    lblMoeda: TLabel;
    edtPais: TEdit;
    edtSigla: TEdit;
    edtDDI: TEdit;
    edtMoeda: TEdit;
    procedure edtPaisExit(Sender: TObject);
  private
    { Private declarations }
    oPais : Paises;
    aCtrlPais : CtrlPaises;
  public
    { Public declarations }
    procedure ConhecaObj(pObj: TObject;  pCtrl: TObject);  override;
    procedure LimpaEdit;                                   override;
    procedure CarregaEdit;                                 override;
    procedure BloqueiaEdit;                                override;
    procedure DesbloqueiEdit;                              override;
    procedure Salvar;                                      override;
    procedure Sair;                                        override;
  end;

var
  FrmCadastroPaises: TFrmCadastroPaises;

implementation

{$R *.dfm}
procedure TfrmCadastroPaises.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;
  oPais := Paises(pObj);
  aCtrlPais := CtrlPaises(pCtrl);
  self.LimpaEdit;
  self.CarregaEdit;

end;

procedure TfrmCadastroPaises.BloqueiaEdit;
begin
  edtPais.Enabled := false;
  edtSigla.Enabled := false;
  edtDDI.Enabled := false;
  edtMoeda.Enabled := false;
  edtDataCad.Enabled := false;
  edtUltAlt.Enabled := false;
end;

procedure TfrmCadastroPaises.DesbloqueiEdit;
begin
  edtPais.Enabled := true;
  edtSigla.Enabled := true;
  edtDDI.Enabled := true;
  edtMoeda.Enabled := true;
  edtDataCad.Enabled := true;
  edtUltAlt.Enabled := true;
end;

procedure TFrmCadastroPaises.edtPaisExit(Sender: TObject);
var mX : string;
begin
  inherited;
  mX := aCtrlPais.Pesquisar(edtPais.Text);
  if aCtrlPais.AcheiReg then
  begin
    showmessage(self.edtPais.Text + ', Ja cadastrado !!');
    self.edtPais.SetFocus;
  end;

end;

procedure TfrmCadastroPaises.LimpaEdit;
begin
  inherited;
  edtCodigo.Text := '0';
  edtPais.clear;
  edtSigla.Clear;
  edtDDI.Clear;
  edtMoeda.Clear;
  edtDataCad.Clear;
  edtUltAlt.Clear;
 end;

procedure TfrmCadastroPaises.CarregaEdit;
begin
  if oPais.GetCodigo <> 0 then
    self.edtCodigo.Text := inttostr(oPais.GetCodigo);
  edtPais.Text   := oPais.GetPais;
  edtSigla.Text  := oPais.GetSigla;
  edtDDI.Text    := oPais.GetDDI;
  edtMoeda.Text  := oPais.GetMoeda;
  edtDataCad.Text:= oPais.GetDataCad;
  edtUltAlt.Text := oPais.GetUltAlt;
end;

procedure TfrmCadastroPaises.Salvar;
begin
  if (btnSalvar.Caption = '&Salvar') or (btnSalvar.Caption = '&Alterar') then
  begin
  if length(self.edtPais.text) = 0 then
    self.edtPais.Color := clYellow;
  if length(self.edtSigla.text) = 0 then
    self.edtSigla.Color := clYellow;
  if length(self.edtDDI.text) = 0 then
    self.edtDDI.Color := clYellow;
  if length(self.edtMoeda.text) = 0 then
    self.edtMoeda.Color := clYellow;
  if self.edtPais.Text = '' then
  begin
    showmessage('Campo Pais obrigatorio!');
    self.edtPais.SetFocus;
  end
  else if self.edtSigla.Text = '' then
  begin
    showmessage('Campo Sigla obrigatorio!');
    self.edtSigla.SetFocus;
  end
  else
  begin
    oPais.SetCodigo(strtoint(self.edtCodigo.Text));
    oPais.SetPais(edtPais.Text);
    oPais.SetSigla(edtSigla.Text);
    oPais.SetDDI(edtDDI.Text);
    oPais.SetMoeda(edtMoeda.Text);
    oPais.SetDataCad(self.edtDataCad.Text);
    oPais.SetUltAlt(self.edtUltAlt.Text);

    self.aCtrlPais.Salvar(oPais.clone);
  end;
   showmessage('Pais cadastrado com sucesso!');
   close;
  end;
end;

procedure TfrmCadastroPaises.Sair;
begin
  inherited;

end;


end.
