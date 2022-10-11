unit uDataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, IBX.IBDatabase, IBX.IBCustomDataSet;

type
  TDM = class(TDataModule)
    DSFornecedores: TDataSource;
    DSPaises: TDataSource;
    DSEstados: TDataSource;
    DSCidades: TDataSource;
    DSClientes: TDataSource;
    DSFuncionarios: TDataSource;
    DSCargos: TDataSource;
    DSMarcas: TDataSource;
    DSModelos: TDataSource;
    DSProdutos: TDataSource;
    DSGrupos: TDataSource;
    DSCondPag: TDataSource;
    DSFormaPag: TDataSource;
    Conexao: TIBDatabase;
    Trans: TIBTransaction;
    qPaises: TIBDataSet;
    qPaisesCODPAIS: TIntegerField;
    qPaisesPAIS: TIBStringField;
    qPaisesSIGLA: TIBStringField;
    qPaisesDDI: TIBStringField;
    qPaisesMOEDA: TIBStringField;
    qPaisesDATCAD: TDateField;
    qPaisesDATULTALT: TDateField;
    qClientes: TIBDataSet;
    qFornecedores: TIBDataSet;
    qFuncionarios: TIBDataSet;
    qCargos: TIBDataSet;
    qProdutos: TIBDataSet;
    qCondPag: TIBDataSet;
    IntegerField1: TIntegerField;
    IBStringField1: TIBStringField;
    IBStringField2: TIBStringField;
    IBStringField3: TIBStringField;
    IBStringField4: TIBStringField;
    DateField1: TDateField;
    DateField2: TDateField;
    qFormaPag: TIBDataSet;
    qFormaPagCODFORMAPAG: TIntegerField;
    qFormaPagFORMAPAG: TIBStringField;
    qFormaPagDATCAD: TDateField;
    qFormaPagDATULTALT: TDateField;
    qCidades: TIBDataSet;
    qCidadesCODCIDADE: TIntegerField;
    qCidadesCIDADE: TIBStringField;
    qCidadesDDD: TIBStringField;
    qCidadesCODESTADO: TIntegerField;
    qCidadesDATCAD: TDateField;
    qCidadesDATULTALT: TDateField;
    qEstados: TIBDataSet;
    qEstadosCODESTADO: TIntegerField;
    qEstadosESTADO: TIBStringField;
    qEstadosUF: TIBStringField;
    qEstadosCODPAIS: TIntegerField;
    qEstadosDATCAD: TDateField;
    qEstadosDATULTALT: TDateField;
    qMarcas: TIBDataSet;
    qMarcasCODMARCA: TIntegerField;
    qMarcasMARCA: TIBStringField;
    qMarcasDATCAD: TDateField;
    qMarcasDATULTALT: TDateField;
    qModelos: TIBDataSet;
    qModelosCODMODELO: TIntegerField;
    qModelosMODELO: TIBStringField;
    qModelosCODMARCA: TIntegerField;
    qModelosDATCAD: TDateField;
    qModelosDATULTALT: TDateField;
    qGrupos: TIBDataSet;
    qGruposCODGRUPO: TIntegerField;
    qGruposGRUPO: TIBStringField;
    qGruposDESCRICAO: TIBStringField;
    qGruposDATCAD: TDateField;
    qGruposDATULTALT: TDateField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}


end.
