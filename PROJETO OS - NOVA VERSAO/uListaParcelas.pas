unit uListaParcelas;

interface
uses Classes, uParcelas;
Type ListaCParcelas = class
  private
    ListaParcelas : TList;
  protected
  public
    constructor CrieObj;
    procedure Adicionar(pParcela: Parcelas);
    procedure Remover(Index: Integer);
    function Count: Integer;
	destructor Destrua_se;
end;

implementation

{ TListaCParcelas }

procedure ListaCParcelas.Adicionar(pParcela: Parcelas);
begin
  ListaParcelas.Add(pParcela);
end;

function ListaCParcelas.Count: Integer;
begin
  Result := ListaParcelas.Count;
end;

constructor ListaCParcelas.CrieObj;
begin
  ListaParcelas := TList.Create;
end;

destructor ListaCParcelas.Destrua_se;
begin

end;

procedure ListaCParcelas.Remover(Index: Integer);
begin
{  if Index < Count then
     ListaParcelas.Delete(Index)
  else
    ShowMessage('Item não encontrado!');}
end;

end.
