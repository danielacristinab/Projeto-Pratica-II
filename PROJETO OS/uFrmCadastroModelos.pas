unit uFrmCadastroModelos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmCadastroPai, Vcl.StdCtrls, uModelos, uCtrlModelos,
  uFrmConsultaMarcas, uMarcas, uFrmCadastroMarcas;

type
  TFrmCadastroModelos = class(TFrmCadastroPai)
    edtModelo: TEdit;
    lblModelo: TLabel;
    edtMarca: TEdit;
    btnPesquisarMarca: TButton;
    edtCodMarca: TEdit;
    lblMarca: TLabel;
    lblCodMarca: TLabel;
    procedure btnPesquisarMarcaClick(Sender: TObject);
  private
    { Private declarations }
    umFrmConsultaMarcas : TFrmCadastroMarcas;
    oModelo : Modelos;
    aCtrlModelo : CtrlModelos;
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
  FrmCadastroModelos: TFrmCadastroModelos;

implementation

{$R *.dfm}

{ TFrmCadastroModelos }

procedure TFrmCadastroModelos.BloqueiaEdit;
begin
  inherited;
  edtModelo.Enabled := false;
  edtDataCad.Enabled := false;
  edtUltAlt.Enabled := false;
end;

procedure TFrmCadastroModelos.btnPesquisarMarcaClick(Sender: TObject);
var btn_nome : string;
    aMarca : Marcas;
begin
  inherited;
  aMarca := marcas.CrieObj;
  btn_nome := umFrmConsultaMarcas.btnSair.Caption;
  umFrmConsultaMarcas.btnSair.Caption := 'Selecionar';
  umFrmConsultaMarcas.ConhecaObj(aMarca,aCtrlModelo.GetaCtrlMarca);
  umFrmConsultaMarcas.ShowModal;
  umFrmConsultaMarcas.btnSair.Caption := btn_nome;
  self.edtCodMarca.Text := inttostr(aMarca.GetCodigo);
  self.edtMarca.Text := aMarca.GetMarca;
  oModelo.SetUmaMarca(aMarca);
end;

procedure TFrmCadastroModelos.CarregaEdit;
begin
  inherited;
  if oModelo.GetCodigo <> 0 then
    self.edtCodigo.Text := inttostr(oModelo.GetCodigo);
  edtCodigo.Text  := inttoStr(oModelo.getCodigo);
  edtModelo.Text   := oModelo.GetModelo;
  edtDataCad.Text := oModelo.GetDataCad;
  edtUltAlt.Text  := oModelo.GetUltAlt;
end;

procedure TFrmCadastroModelos.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;
  oModelo := Modelos(pObj);
  aCtrlModelo := CtrlModelos(pCtrl);
  self.LimpaEdit;
  self.CarregaEdit;
end;

procedure TFrmCadastroModelos.DesbloqueiEdit;
begin
  inherited;
  edtModelo.Enabled := true;
  edtDataCad.Enabled := true;
  edtUltAlt.Enabled := true;
end;

procedure TFrmCadastroModelos.LimpaEdit;
begin
  inherited;
  edtCodigo.Text := '0';
  edtModelo.Clear;
  edtDataCad.Clear;
  edtUltAlt.Clear;
end;

procedure TFrmCadastroModelos.Sair;
begin
  inherited;
  edtCodigo.Text := '0';
  edtModelo.Clear;
  edtDataCad.Clear;
  edtUltAlt.Clear;
end;

procedure TFrmCadastroModelos.Salvar;
begin
  if (btnSalvar.Caption = '&Salvar') or (btnSalvar.Caption = '&Alterar') then
  begin
    if length(self.edtModelo.text) = 0 then
      self.edtModelo.Color := clYellow;
    if self.edtModelo.Text = '' then
    begin
      showmessage('Campo Modelo obrigatorio!');
      self.edtModelo.SetFocus;
    end
    else
    begin
      oModelo.SetCodigo(strtoint(self.edtCodigo.Text));
      oModelo.SetModelo(edtModelo.Text);
      oModelo.SetDataCad(self.edtDataCad.Text);
      oModelo.SetUltAlt(self.edtUltAlt.Text);

      self.aCtrlModelo.Salvar(oModelo.Clone);
    end;
    showmessage('Modelo salvo com sucesso!');
  end
  else if (btnSalvar.Caption = '&Excluir') then
  begin
    aCtrlModelo.Excluir(oModelo);
    showmessage('Modelo excluido com sucesso!');
  end;
  close;

end;

end.
