unit uFrmCadastroCondicaoPagamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmCadastroPai, Vcl.ComCtrls, uCondicaoPagamento,
  Vcl.StdCtrls, uCtrlCondPag, uFormasPagamento, uFrmConsultaFormasPagamento;

type
  TFrmCadastroCondicaoPagamento = class(TFrmCadastroPai)
    edtCondPag: TEdit;
    edtMulta: TEdit;
    edtJuros: TEdit;
    edtDesconto: TEdit;
    edtPorcentagem: TEdit;
    edtParcela: TEdit;
    edtCodFormaPag: TEdit;
    edtFormaPag: TEdit;
    edtPrazo: TEdit;
    lblCondPag: TLabel;
    lblMulta: TLabel;
    lblJuros: TLabel;
    lblDesconto: TLabel;
    lblPorcentagem: TLabel;
    lblParcela: TLabel;
    lblCodFormaPag: TLabel;
    lblFormaPag: TLabel;
    lblPrazo: TLabel;
    btnPesquisarFormaPag: TButton;
    ListView1: TListView;
    btnAdicionar: TButton;
    btnRemover: TButton;
    lblTotalPercentual: TLabel;
    edtTotalPercent: TEdit;
    procedure btnPesquisarFormaPagClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure edtTotalPercentChange(Sender: TObject);
    procedure btnRemoverClick(Sender: TObject);
  private
    { Private declarations }
    umFrmConsultaFormaPag : TFrmConsultaFormasPagamento;
    aCondPag : CondicaoPagamento;
    aCtrlCondPag : CtrlCondPag;
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
  FrmCadastroCondicaoPagamento: TFrmCadastroCondicaoPagamento;

implementation

{$R *.dfm}

{ TFrmCadastroCondicaoPagamento }

procedure TFrmCadastroCondicaoPagamento.BloqueiaEdit;
begin
  inherited;
  edtCondPag.Enabled := False;
  edtMulta.Enabled := False;
  edtJuros.Enabled := False;
  edtPorcentagem.Enabled := False;
  edtDesconto.Enabled := False;
  edtParcela.Enabled := False;
  edtFormaPag.Enabled := False;
  edtPrazo.Enabled := False;
end;

procedure TFrmCadastroCondicaoPagamento.btnAdicionarClick(Sender: TObject);
var item : TListItem;
begin
  if edtParcela.Text = '' then
	  showMessage('Favor informar o numero da Parcela!')
  else
  if edtPrazo.Text = '' then
	  showMessage('Favor informar o Prazo da Parcela!')
  else
  if edtPorcentagem.Text = '' then
	  showMessage('Favor informar o Percentual da Parcela!')
  else
  if ListView1.Items.Count > 0 then
  begin
    if strtoint(edtPrazo.Text) <= strtoint(ListView1.Items[ListView1.Items.Count-1].SubItems[0]) then
	    ShowMessage('O prazo informado � menor ou igual a ultima parcela adicionada')
    else
    begin
      item := ListView1.Items.Add;
      item.Caption := edtParcela.Text;
      item.SubItems.Add(edtPrazo.Text);
      item.SubItems.Add(edtPorcentagem.Text);

      edtTotalPercent.Text := IntToStr(strtoint(edtTotalPercent.Text) +
                                     strtoint(edtTotalPercent.Text));

      edtParcela.Text := IntToStr(strtoint(edtParcela.Text) +1);
      edtPrazo.Clear;
      edtPorcentagem.Clear;
    end;
  end
  else
  begin
    item := ListView1.Items.Add;
    item.Caption := edtParcela.Text;
    item.SubItems.Add(edtPrazo.Text);
    item.SubItems.Add(edtPorcentagem.Text);

    edtTotalPercent.Text := IntToStr(strtoint(edtTotalPercent.Text) +
                                     strtoint(edtTotalPercent.Text));

    edtParcela.Text := IntToStr(strtoint(edtParcela.Text) +1);
    edtPrazo.Clear;
    edtPorcentagem.Clear;
  end;
end;

procedure TFrmCadastroCondicaoPagamento.btnPesquisarFormaPagClick(
  Sender: TObject);
var btn_nome : string;
    aFormaPag : FormasPagamento;
begin
  inherited;
  aFormaPag := FormasPagamento.CrieObj;
  btn_nome := umFrmConsultaFormaPag.btnSair.Caption;
  umFrmConsultaFormaPag.btnSair.Caption := 'Selecionar';
  umFrmConsultaFormaPag.ConhecaObj(aFormaPag,aCtrlCondPag.GetaCtrlFormaPag);
  umFrmConsultaFormaPag.ShowModal;
  umFrmConsultaFormaPag.btnSair.Caption := btn_nome;
  self.edtCodFormaPag.Text := inttostr(aFormaPag.GetCodigo);
  self.edtFormaPag.Text := aFormaPag.GetFormaPagamento;
 // aCondPag.SetaFormaPag(aFormaPag);
end;

procedure TFrmCadastroCondicaoPagamento.btnRemoverClick(Sender: TObject);
begin
  if ListView1.ItemFocused.Index = ListView1.Items.Count -1 then
  begin
    edtTotalPercent.Text := inttostr(strtoint(edtTotalPercent.Text) -
                            strtoint(ListView1.ItemFocused.SubItems[1]));
	  ListView1.DeleteSelected;
	  edtParcela.Text := IntToStr(strtoint(edtParcela.Text) - 1);
  end;

end;

procedure TFrmCadastroCondicaoPagamento.CarregaEdit;
begin
  inherited;

end;

procedure TFrmCadastroCondicaoPagamento.ConhecaObj(pObj, pCtrl: TObject);
begin
  aCondPag := CondicaoPagamento(pObj);
  aCtrlCondPag := CtrlCondPag(pCtrl);
  self.LimpaEdit;
  self.CarregaEdit;
end;

procedure TFrmCadastroCondicaoPagamento.DesbloqueiEdit;
begin
  inherited;
  edtCondPag.Enabled := True;
  edtMulta.Enabled := True;
  edtJuros.Enabled := True;
  edtPorcentagem.Enabled := True;
  edtDesconto.Enabled := True;
  edtParcela.Enabled := True;
  edtFormaPag.Enabled := True;
  edtPrazo.Enabled := True;
end;

procedure TFrmCadastroCondicaoPagamento.edtTotalPercentChange(Sender: TObject);
begin
  if edtTotalPercent.Text = '100' then
	  btnSalvar.Enabled := True
  else
	  btnSalvar.Enabled := False;
end;

procedure TFrmCadastroCondicaoPagamento.LimpaEdit;
begin
  inherited;
  edtCondPag.Clear;
  edtMulta.Clear;
  edtJuros.Clear;
  edtPorcentagem.Clear;
  edtDesconto.Clear;
  edtParcela.Clear;
  edtFormaPag.Clear;
  edtPrazo.Clear;
end;

procedure TFrmCadastroCondicaoPagamento.Sair;
begin
  inherited;
end;

procedure TFrmCadastroCondicaoPagamento.Salvar;
begin
  inherited;
end;

end.
