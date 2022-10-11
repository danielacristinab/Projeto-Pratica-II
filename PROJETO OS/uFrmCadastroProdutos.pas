unit uFrmCadastroProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmCadastroPai, Vcl.StdCtrls, uProdutos,
  uCtrlProdutos, uFrmConsultaGrupos, uFrmConsultaModelos, uFrmConsultaFornecedores;

type
  TFrmCadastroProdutos = class(TFrmCadastroPai)
    edtProduto: TEdit;
    edtQtd: TEdit;
    lblProduto: TLabel;
    lblQtd: TLabel;
    edtUnd: TEdit;
    edtCusto: TEdit;
    edtVenda: TEdit;
    edtCodModelo: TEdit;
    edtModelo: TEdit;
    edtCodFonecedor: TEdit;
    edtCodGrupo: TEdit;
    edtSaldo: TEdit;
    edtGrupo: TEdit;
    edtFornecedor: TEdit;
    lblUnd: TLabel;
    lblCusto: TLabel;
    lblVenda: TLabel;
    lblSaldo: TLabel;
    lblCodModelo: TLabel;
    lblModelo: TLabel;
    lblCodFornecedor: TLabel;
    lblFornecedor: TLabel;
    lblCodGrupo: TLabel;
    lblGrupo: TLabel;
    btnPesquisarModelo: TButton;
    btnPesquisarFornecedor: TButton;
    btnPesquisarGrupo: TButton;
  private
    { Private declarations }
    umFrmConsultaGrupos : TFrmConsultaGrupos;
    umFrmConsultaModelos : TFrmConsultaModelos;
    umFrmConsultaFornecedores : TFrmConsultaFornecedores;
    oProduto : Produtos;
    aCtrlProdutos : CtrlProdutos;
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
  FrmCadastroProdutos: TFrmCadastroProdutos;

implementation

{$R *.dfm}

{ TFrmCadastroProdutos }

procedure TFrmCadastroProdutos.BloqueiaEdit;
begin
  inherited;
  edtProduto.Enabled := false;
  edtQtd.Enabled := false;
  edtUnd.Enabled := false;
  edtCusto.Enabled := false;
  edtVenda.Enabled := false;
  edtSaldo.Enabled := false;
  edtCodModelo.Enabled := false;
  edtModelo.Enabled := false;
  edtCodFonecedor.Enabled := false;
  edtFornecedor.Enabled := false;
  edtCodGrupo.Enabled := false;
  edtGrupo.Enabled := false;
  edtDataCad.Enabled := false;
  edtUltAlt.Enabled := false;
end;

procedure TFrmCadastroProdutos.CarregaEdit;
begin
  inherited;
  if oProduto.GetCodigo <> 0 then
    self.edtCodigo.Text := inttostr(oProduto.GetCodigo);
  edtCodigo.Text  := inttoStr(oProduto.getCodigo);
  edtProduto.Text := oProduto.GetProduto;
  edtQtd.Text     := floattostr(oProduto.GetQtd);
  edtUnd.Text     := oProduto.GetUnd;
  edtCusto.Text   := floattostr(oProduto.GetCusto);
  edtVenda.Text   := floattostr(oProduto.GetVenda);
  edtSaldo.Text   := inttoStr(oProduto.GetSaldo);
  edtCodModelo.Text := inttostr(oProduto.GetUmModelo.GetCodigo);
  edtModelo.Text  := oProduto.GetUmModelo.Getmodelo;
  edtCodFonecedor.Text := inttostr(oProduto.GetUmFornecedor.GetCodigo);
  edtFornecedor.Text   := oProduto.GetUmFornecedor.GetApelidoNomeFantasia;
  edtCodGrupo.Text := inttostr(oProduto.GetUmGrupo.GetCodigo);
  edtGrupo.Text   := oProduto.GetUmGrupo.GetGrupo;
  edtDataCad.Text := oProduto.GetDataCad;
  edtUltAlt.Text  := oProduto.GetUltAlt;
end;

procedure TFrmCadastroProdutos.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;
  oProduto := Produtos(pObj);
  aCtrlProdutos := CtrlProdutos(pCtrl);
  self.LimpaEdit;
  self.CarregaEdit;
end;

procedure TFrmCadastroProdutos.DesbloqueiEdit;
begin
  inherited;
  edtProduto.Enabled := true;
  edtQtd.Enabled := true;
  edtUnd.Enabled := true;
  edtCusto.Enabled := true;
  edtVenda.Enabled := true;
  edtSaldo.Enabled := true;
  edtCodModelo.Enabled := true;
  edtModelo.Enabled := true;
  edtCodFonecedor.Enabled := true;
  edtFornecedor.Enabled := true;
  edtCodGrupo.Enabled := true;
  edtGrupo.Enabled := true;
  edtDataCad.Enabled := true;
  edtUltAlt.Enabled := true;
end;

procedure TFrmCadastroProdutos.LimpaEdit;
begin
  inherited;
  edtCodigo.Text := '0';
  edtProduto.Clear;
  edtQtd.Clear;
  edtUnd.Clear;
  edtCusto.Clear;
  edtVenda.Clear;
  edtSaldo.Clear;
  edtCodModelo.Clear;
  edtModelo.Clear;
  edtCodFonecedor.Clear;
  edtFornecedor.Clear;
  edtCodGrupo.Clear;
  edtGrupo.Clear;
  edtDataCad.Clear;
  edtUltAlt.Clear;
end;

procedure TFrmCadastroProdutos.Sair;
begin
  inherited;

end;

procedure TFrmCadastroProdutos.Salvar;
begin
    if (btnSalvar.Caption = '&Salvar') or (btnSalvar.Caption = '&Alterar') then
  begin
    if length(self.edtProduto.text) = 0 then
      self.edtProduto.Color := clYellow;
    if self.edtProduto.Text = '' then
    begin
      showmessage('Campo Produto obrigatorio!');
      self.edtProduto.SetFocus;
    end
    else
    begin
      oProduto.SetCodigo(strtoint(self.edtCodigo.Text));
      oProduto.SetProduto(self.edtProduto.Text);
      oProduto.SetQtd(strtofloat(self.edtQtd.Text));
      oProduto.SetUnd(self.edtUnd.Text);
      oProduto.SetCusto(strtofloat(self.edtCusto.Text));
      oProduto.SetVenda(strtofloat(self.edtVenda.Text));
      oProduto.SetSaldo(strtoint(self.edtSaldo.Text));
      oProduto.GetUmModelo.SetCodigo(strtoint(edtCodModelo.Text));
      oProduto.GetUmModelo.Setmodelo(edtModelo.Text);
      oProduto.GetUmFornecedor.SetCodigo(strtoint(edtCodFonecedor.Text));
      oProduto.GetUmFornecedor.SetApelidoNomeFantasia(edtFornecedor.Text);
      oProduto.GetUmGrupo.SetCodigo(strtoint(edtCodGrupo.Text));
      oProduto.GetUmGrupo.SetGrupo(edtGrupo.Text);
      oProduto.SetDataCad(self.edtDataCad.Text);
      oProduto.SetUltAlt(self.edtUltAlt.Text);

      self.aCtrlProdutos.Salvar(oProduto.Clone);
    end;
    showmessage('Produto salvo com sucesso!');
  end
  else if (btnSalvar.Caption = '&Excluir') then
  begin
    aCtrlProdutos.Excluir(oProduto);
    showmessage('Produto excluido com sucesso!');
  end;
  close;

end;

end.
