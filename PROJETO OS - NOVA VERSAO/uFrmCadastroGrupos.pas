unit uFrmCadastroGrupos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmCadastroPai, Vcl.StdCtrls,
  uGrupos, uCtrlGrupos;

type
  TFrmCadastroGrupos = class(TFrmCadastroPai)
    edtGrupo: TEdit;
    lblGrupo: TLabel;
    edtDescricao: TEdit;
    lblDescricao: TLabel;
  private
    { Private declarations }
    oGrupo : Grupos;
    aCtrlGrupos : CtrlGrupos;
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
  FrmCadastroGrupos: TFrmCadastroGrupos;

implementation

{$R *.dfm}

{ TFrmCadastroGrupos }

procedure TFrmCadastroGrupos.BloqueiaEdit;
begin
  inherited;
  edtGrupo.Enabled := False;
  edtDescricao.Enabled := False;
end;

procedure TFrmCadastroGrupos.CarregaEdit;
begin
  inherited;
  if oGrupo.GetCodigo <> 0 then
    self.edtCodigo.Text := inttostr(oGrupo.GetCodigo);
  edtCodigo.Text  := inttoStr(oGrupo.getCodigo);
  edtGrupo.Text := oGrupo.GetGrupo;
  edtDescricao.Text := oGrupo.GetDescricao;
  edtDataCad.Text := DateToStr(oGrupo.GetDataCad);
  edtUltAlt.Text  := DateToStr(oGrupo.GetUltAlt);
end;

procedure TFrmCadastroGrupos.ConhecaObj(pObj, pCtrl: TObject);
begin
  oGrupo := Grupos(pObj);
  aCtrlGrupos := CtrlGrupos(pCtrl);
  self.LimpaEdit;
  self.CarregaEdit;
end;

procedure TFrmCadastroGrupos.DesbloqueiEdit;
begin
  inherited;
  edtGrupo.Enabled := True;
  edtDescricao.Enabled := True;
end;

procedure TFrmCadastroGrupos.LimpaEdit;
begin
  inherited;
  edtGrupo.Clear;
  edtDescricao.Clear;
end;

procedure TFrmCadastroGrupos.Sair;
begin
  inherited;

end;

procedure TFrmCadastroGrupos.Salvar;
begin
  if (btnSalvar.Caption = '&Salvar') or (btnSalvar.Caption = '&Alterar') then
  begin
    if length(self.edtGrupo.text) = 0 then
      self.edtGrupo.Color := clYellow;
    if length(self.edtDescricao.text) = 0 then
      self.edtDescricao.Color := clYellow;
    if self.edtGrupo.Text = '' then
    begin
      showmessage('Campo Grupo obrigatorio!');
      self.edtGrupo.SetFocus;
    end
    else if self.edtDescricao.Text = '' then
    begin
      showmessage('Campo Descricao obrigatorio!');
      self.edtDescricao.SetFocus;
    end
    else
    begin
      oGrupo.SetCodigo(strtoint(self.edtCodigo.Text));
      oGrupo.SetGrupo(edtGrupo.Text);
      oGrupo.SetDescricao(edtDescricao.Text);
      oGrupo.SetDataCad(strtodate(self.edtDataCad.Text));
      oGrupo.SetUltAlt(strtodate(self.edtUltAlt.Text));

      self.aCtrlGrupos.Salvar(oGrupo.Clone);
    end;
    showmessage('Grupo salvo com sucesso!');
  end
  else if (btnSalvar.Caption = '&Excluir') then
  begin
    aCtrlGrupos.Excluir(oGrupo);
    showmessage('Grupo excluido com sucesso!');
  end;
  close;
end;

end.
