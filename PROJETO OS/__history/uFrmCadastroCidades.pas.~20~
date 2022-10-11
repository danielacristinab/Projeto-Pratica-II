unit uFrmCadastroCidades;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmCadastroPai, Vcl.StdCtrls, ufrmConsultaEstados,
  uCidades, uEstados, uCtrlCidades;

type
  TFrmCadastroCidades = class(TFrmCadastroPai)
    lblCidade: TLabel;
    lblDDD: TLabel;
    edtCidade: TEdit;
    edtDDD: TEdit;
    lblEstado: TLabel;
    lblCodEstado: TLabel;
    edtEstado: TEdit;
    btnPesquisarEstado: TButton;
    edtCodEstado: TEdit;
    procedure btnPesquisarEstadoClick(Sender: TObject);
  private
    { Private declarations }
    umFrmConsultaEstados : TFrmConsultaEstados;
    aCidade : Cidades;
    aCtrlCidades : CtrlCidades;
  public
    { Public declarations }
    procedure ConhecaObj(pObj: TObject;  pCtrl: TObject);  override;
    procedure LimpaEdit;                                   override;
    procedure CarregaEdit;                                 override;
    procedure BloqueiaEdit;                                override;
    procedure DesbloqueiEdit;                              override;
    procedure Salvar;                                      override;
    procedure Sair;                                        override;
    procedure SetConsulta(pObj: TObject);                  override;
  end;

var
  FrmCadastroCidades: TFrmCadastroCidades;

implementation

{$R *.dfm}


procedure TfrmCadastroCidades.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;
  aCidade := Cidades(pObj);
  aCtrlCidades := CtrlCidades(pCtrl);
  self.LimpaEdit;
  self.CarregaEdit;
end;

procedure TfrmCadastroCidades.BloqueiaEdit;
begin
  edtCidade.Enabled := false;
  edtDDD.Enabled := false;
  edtCodEstado.Enabled := false;
  edtEstado.Enabled := false;
  edtDataCad.Enabled := false;
  edtUltAlt.Enabled := false;
end;

procedure TfrmCadastroCidades.btnPesquisarEstadoClick(Sender: TObject);
var btn_nome : string;
    oEstado : Estados;
begin
  inherited;
  oEstado := estados.CrieObj;
  btn_nome := umFrmConsultaEstados.btnSair.Caption;
  umFrmConsultaEstados.btnSair.Caption := 'Selecionar';
  umFrmConsultaEstados.ConhecaObj(oEstado,aCtrlCidades.GetaCtrlEstado);
  umFrmConsultaEstados.ShowModal;
  umFrmConsultaEstados.btnSair.Caption := btn_nome;
  self.edtCodEstado.Text := inttostr(oEstado.GetCodigo);
  self.edtEstado.Text := oEstado.GetEstado;
  aCidade.setoEstado(oEstado);
end;

procedure TfrmCadastroCidades.CarregaEdit;
begin
  inherited;
  if aCidade.GetCodigo <> 0 then
    self.edtCodigo.Text := inttostr(aCidade.GetCodigo);
  edtCodigo.Text := inttostr(aCidade.GetCodigo);
  edtCidade.Text := aCidade.GetCidade;
  edtDDD.Text    := aCidade.GetDDD;
  edtCodEstado.Text := inttostr(aCidade.getoEstado.GetCodigo);
  edtEstado.Text  := aCidade.getoEstado.GetEstado;
end;

procedure TfrmCadastroCidades.DesbloqueiEdit;
begin
  inherited;
  edtCidade.Enabled := true;
  edtDDD.Enabled := true;
  edtCodEstado.Enabled := true;
  edtEstado.Enabled := true;
end;

procedure TfrmCadastroCidades.LimpaEdit;
begin
  edtCidade.Clear;
  edtDDD.Clear;
  edtCodEstado.Clear;
  edtEstado.Clear;
end;

procedure TfrmCadastroCidades.Salvar;
begin
  if btnSalvar.Caption = '&Salvar' then
  begin
    if length(self.edtCidade.text) = 0 then
      self.edtCidade.Color := clYellow;
    if length(self.edtDDD.text) = 0 then
      self.edtDDD.Color := clYellow;
    if length(self.edtEstado.text) = 0 then
      self.edtEstado.Color := clYellow;
    if self.edtCidade.Text = '' then
    begin
      showmessage('Campo Cidade obrigatorio!');
      self.edtCidade.SetFocus;
    end
    else if self.edtDDD.Text = '' then
    begin
      showmessage('Campo DDD obrigatorio!');
      self.edtDDD.SetFocus;
    end
    else if self.edtEstado.Text = '' then
    begin
      showmessage('Campo Estado obrigatorio!');
      self.edtEstado.SetFocus;
    end
  else
    aCidade.SetCodigo(strtoint(edtCodigo.Text));
    aCidade.setCidade(edtCidade.Text);
    aCidade.SetDDD(edtDDD.Text);
    aCidade.GetoEstado.SetCodigo(strtoint(edtCodEstado.Text));
    aCidade.GetoEstado.SetEstado(edtEstado.Text);
    aCidade.SetDataCad(edtDataCad.Text);
    aCidade.SetUltAlt(edtUltAlt.Text);

    aCtrlCidades.salvar(aCidade.Clone);
  end;
    showmessage('Cidade cadastrado com sucesso!');
    close;
end;

procedure TfrmCadastroCidades.SetConsulta(pObj: TObject);
begin
  inherited;
  umFrmConsultaEstados := TFrmConsultaEstados(pObj);
end;

procedure TfrmCadastroCidades.Sair;
begin
  inherited;

end;

end.
