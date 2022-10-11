unit uFrmCadastroMarcas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmCadastroPai, Vcl.StdCtrls, uMarcas, uCtrlMarcas;

type
  TFrmCadastroMarcas = class(TFrmCadastroPai)
    edtMarca: TEdit;
    lblMarca: TLabel;
  private
    { Private declarations }
    aMarca : Marcas;
    aCtrlMarca : CtrlMarcas;
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
  FrmCadastroMarcas: TFrmCadastroMarcas;

implementation

{$R *.dfm}

{ TFrmCadastroPai1 }

procedure TFrmCadastroMarcas.BloqueiaEdit;
begin
  inherited;
  edtMarca.Enabled := false;
  edtDataCad.Enabled := false;
  edtUltAlt.Enabled := false;
end;

procedure TFrmCadastroMarcas.CarregaEdit;
begin
  inherited;
  if aMarca.GetCodigo <> 0 then
    self.edtCodigo.Text := inttostr(aMarca.GetCodigo);
  edtCodigo.Text  := inttoStr(aMarca.getCodigo);
  edtMarca.Text   := aMarca.GetMarca;
  edtDataCad.Text := DateToStr(aMarca.GetDataCad);
  edtUltAlt.Text  := DateToStr(aMarca.GetUltAlt);
end;

procedure TFrmCadastroMarcas.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;
  aMarca := Marcas(pObj);
  aCtrlMarca := CtrlMarcas(pCtrl);
  self.LimpaEdit;
  self.CarregaEdit;
end;

procedure TFrmCadastroMarcas.DesbloqueiEdit;
begin
  inherited;
  edtMarca.Enabled := true;
  edtDataCad.Enabled := true;
  edtUltAlt.Enabled := true;
end;

procedure TFrmCadastroMarcas.LimpaEdit;
begin
  inherited;
  edtCodigo.Text := '0';
  edtMarca.Clear;
  edtDataCad.Clear;
  edtUltAlt.Clear;
end;

procedure TFrmCadastroMarcas.Sair;
begin
  inherited;

end;

procedure TFrmCadastroMarcas.Salvar;
begin
if (btnSalvar.Caption = '&Salvar') or (btnSalvar.Caption = '&Alterar') then
  begin
    if length(self.edtMarca.text) = 0 then
      self.edtMarca.Color := clYellow;
    if self.edtMarca.Text = '' then
    begin
      showmessage('Campo Marca obrigatorio!');
      self.edtMarca.SetFocus;
    end
    else
    begin
      aMarca.SetCodigo(strtoint(self.edtCodigo.Text));
      aMarca.SetMarca(edtMarca.Text);
      aMarca.SetDataCad(StrToDate(self.edtDataCad.Text));
      aMarca.SetUltAlt(StrToDate(self.edtUltAlt.Text));

      self.aCtrlMarca.Salvar(aMarca.Clone);
    end;
    showmessage('Marca salvo com sucesso!');
  end
  else if (btnSalvar.Caption = '&Excluir') then
  begin
    aCtrlMarca.Excluir(aMarca);
    showmessage('Marca excluido com sucesso!');
  end;
  close;

end;

end.
