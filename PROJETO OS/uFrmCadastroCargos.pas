unit uFrmCadastroCargos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmCadastroPai, Vcl.StdCtrls, uCargos,
  uCtrlCargos;

type
  TFrmCadastroCargos = class(TFrmCadastroPai)
    edtCargo: TEdit;
    lblCargo: TLabel;
  private
    { Private declarations }
    oCargo : Cargos;
    aCtrlCargo : CtrlCargos;
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
  FrmCadastroCargos: TFrmCadastroCargos;

implementation

{$R *.dfm}

{ TFrmCadastroCargos }

procedure TFrmCadastroCargos.BloqueiaEdit;
begin
  inherited;
  edtCargo.Enabled := false;
  edtDataCad.Enabled := false;
  edtUltAlt.Enabled := false;
end;

procedure TFrmCadastroCargos.CarregaEdit;
begin
  inherited;
  if oCargo.GetCodigo <> 0 then
    self.edtCodigo.Text := inttostr(oCargo.GetCodigo);
  edtCodigo.Text  := inttoStr(oCargo.getCodigo);
  edtCargo.Text   := oCargo.GetCargo;
  edtDataCad.Text := oCargo.GetDataCad;
  edtUltAlt.Text  := oCargo.GetUltAlt;
end;

procedure TFrmCadastroCargos.ConhecaObj(pObj, pCtrl: TObject);
begin
  inherited;
  oCargo := Cargos(pObj);
  aCtrlCargo := CtrlCargos(pCtrl);
  self.LimpaEdit;
  self.CarregaEdit;
end;

procedure TFrmCadastroCargos.DesbloqueiEdit;
begin
  inherited;
  edtCargo.Enabled := true;
  edtDataCad.Enabled := true;
  edtUltAlt.Enabled := true;
end;

procedure TFrmCadastroCargos.LimpaEdit;
begin
  inherited;
  edtCodigo.Text := '0';
  edtCargo.Clear;
  edtDataCad.Clear;
  edtUltAlt.Clear;
end;

procedure TFrmCadastroCargos.Sair;
begin
  inherited;

end;

procedure TFrmCadastroCargos.Salvar;
begin
 if (btnSalvar.Caption = '&Salvar') then
  begin
  if length(self.edtCargo.text) = 0 then
    self.edtCargo.Color := clYellow;
  if self.edtCargo.Text = '' then
  begin
    showmessage('Campo Cargo obrigatorio!');
    self.edtCargo.SetFocus;
  end
  else
  begin
    oCargo.SetCodigo(strtoint(self.edtCodigo.Text));
    oCargo.SetCargo(edtCargo.Text);
    oCargo.SetDataCad(self.edtDataCad.Text);
    oCargo.SetUltAlt(self.edtUltAlt.Text);

    self.aCtrlCargo.Salvar(oCargo.Clone);
  end;
   showmessage('Cargo cadastrado com sucesso!');
   close;
  end;
end;

end.
