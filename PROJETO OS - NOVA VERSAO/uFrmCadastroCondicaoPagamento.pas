unit uFrmCadastroCondicaoPagamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmCadastroPai, Vcl.ComCtrls, uCondicaoPagamento,
  Vcl.StdCtrls, uCtrlCondPag, uFormasPagamento, uFrmConsultaFormasPagamento, uParcelas,
  uListaParcelas;

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
    edtDias: TEdit;
    lblCondPag: TLabel;
    lblMulta: TLabel;
    lblJuros: TLabel;
    lblDesconto: TLabel;
    lblPorcentagem: TLabel;
    lblParcela: TLabel;
    lblCodFormaPag: TLabel;
    lblFormaPag: TLabel;
    lblDias: TLabel;
    btnPesquisarFormaPag: TButton;
    ListView1: TListView;
    btnAdicionar: TButton;
    btnRemover: TButton;
    procedure btnPesquisarFormaPagClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnRemoverClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    umFrmConsultaFormaPag : TFrmConsultaFormasPagamento;
    aCondPag : CondicaoPagamento;
    aCtrlCondPag : CtrlCondPag;
    ListaParcelas : ListaCParcelas;
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
    procedure CarregaLV;
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
  edtDias.Enabled := False;
end;

procedure TFrmCadastroCondicaoPagamento.btnAdicionarClick(Sender: TObject);
var item : TListItem;
begin
  if edtParcela.Text = ' ' then
	  showMessage('Favor informar o numero da Parcela!')
  else
  if edtDias.Text = ' ' then
	  showMessage('Favor informar o Prazo da Parcela!')
  else
  if edtPorcentagem.Text = ' ' then
	  showMessage('Favor informar o Percentual da Parcela!')
  else
  if ListView1.Items.Count > 0 then
  begin
    if strtoint(edtDias.Text) <= strtoint(ListView1.Items[ListView1.Items.Count-1].SubItems[0]) then
	    ShowMessage('O prazo informado é menor ou igual a ultima parcela adicionada')
    else
    begin
      item := ListView1.Items.Add;
      item.Caption := edtParcela.Text;
      item.SubItems.Add(edtDias.Text);
      item.SubItems.Add(edtPorcentagem.Text);
      item.SubItems.Add(edtFormaPag.Text);

      edtDias.Clear;
      edtPorcentagem.Clear;
    end;
  end
  else
  begin
    item := ListView1.Items.Add;
    item.Caption := edtParcela.Text;
    item.SubItems.Add(edtDias.Text);
    item.SubItems.Add(edtPorcentagem.Text);
    item.SubItems.Add(edtFormaPag.Text);

    edtParcela.clear;
    edtDias.Clear;
    edtPorcentagem.Clear;
  end;
end;

procedure TFrmCadastroCondicaoPagamento.btnPesquisarFormaPagClick(Sender: TObject);
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
  aCondPag.SetaFormaPag(aFormaPag);
end;

procedure TFrmCadastroCondicaoPagamento.btnRemoverClick(Sender: TObject);
begin
  if ListView1.ItemFocused.Index = ListView1.Items.Count -1 then
  begin

	  ListView1.DeleteSelected;
	  edtParcela.Text := IntToStr(strtoint(edtParcela.Text) - 1);
  end;

end;

procedure TFrmCadastroCondicaoPagamento.CarregaEdit;
begin
  inherited;

end;

procedure TFrmCadastroCondicaoPagamento.CarregaLV;
var
   item :TListItem;
   TpParcela : Parcelas;
   k, tam : integer;

begin
   self.ListView1.Clear;
 {  for k := 1  to aCondPag.getListaItemParcela.Count   do
   begin
      TpParcela := aCondPag.Carrega(k);
      item := self.ListView1.Items.add;
      Item.Caption:= IntToStr(k );
      Item.SubItems.Add(inttostr (TpParcela.getaFormaPag.getCodigo));
      Item.SubItems.Add(TpParcela.getaFormaPag.getFormaPag);
      Item.SubItems.Add(inttostr(TpParcela.getDias));
      Item.SubItems.Add(CurrToStr(TpParcela.getPorcentagem));

      edtParcela.clear;
      edtDias.Clear;
      edtPorcentagem.Clear;
      edtCodFormaPag.clear;
      edtFormaPag.clear;
   end;  }
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
  edtDias.Enabled := True;
end;

procedure TFrmCadastroCondicaoPagamento.FormCreate(Sender: TObject);
begin
  inherited;
  ListaParcelas := ListaCParcelas.Create;
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
  edtDias.Clear;
end;

procedure TFrmCadastroCondicaoPagamento.Sair;
begin
  inherited;
end;

procedure TFrmCadastroCondicaoPagamento.Salvar;
begin
  inherited;
end;

procedure TFrmCadastroCondicaoPagamento.SetConsulta(pObj: TObject);
begin
  inherited;
  umFrmConsultaFormaPag := TFrmConsultaFormasPagamento(pObj);
end;

end.
