unit uDAOCondPag;

interface
uses uDAO, uCondicaoPagamento, Data.DB, System.SysUtils;
  type DAOCondPag = class   (DAO)
    private
    protected
    public
      constructor CrieObj;
      function GetDS: TDataSource;                override;
      function Salvar(pObj: TObject): string;     override;
      function Carregar(pObj: TObject): string;   override;
      function Pesquisar(pChave: string): string; override;
      function Excluir(pObj: TObject): string;    override;
      function AcheiReg() : boolean;
      destructor Destrua_se;
  end;
implementation

{ DAOCondPag }

function DAOCondPag.AcheiReg: boolean;
begin
 // result := not (umDM.qCondPag.Eof);
end;

function DAOCondPag.Carregar(pObj: TObject): string;
begin

end;

constructor DAOCondPag.CrieObj;
begin
  inherited;
end;

destructor DAOCondPag.Destrua_se;
begin

end;

function DAOCondPag.Excluir(pObj: TObject): string;
begin

end;

function DAOCondPag.GetDS: TDataSource;
begin

end;

function DAOCondPag.Pesquisar(pChave: string): string;
begin

end;

function DAOCondPag.Salvar(pObj: TObject): string;
begin

end;

end.
