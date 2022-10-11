unit uColCidades;

interface
uses uColecoes, uCidades;
  type ColCidades = class (Colecoes)
    private
    protected
    public
      function Pesquisar(pChave: string; pQuero: boolean): integer;
      //function Pesquisar(pChave: integer; pQuero: boolean): integer;
  end;
implementation

{ ColCidades }

function ColCidades.Pesquisar(pChave: string; pQuero: boolean): integer;
var k: integer;
begin
    k := 1;
    if self.colVazia then
       result := k
    else
    begin
        while(k <= Qtd) and (pChave > cidades(item[k]).GetCidade) do
                inc(k);
        if pQuero then
          begin
            if ( k > qtd ) then
              result := 0
            else
              if pChave = cidades(item[k]).GetCidade then
                 result := k
              else
                 result := 0;
          end
        else
          begin
             if ( k > qtd ) then
                result := k
             else
                 if pChave = cidades(item[k]).GetCidade  then
                    result := 0
                 else
                    result := k;
          end;
    end;
end;

end.
