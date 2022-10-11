unit uColPaises;

interface
uses uColecoes, uPaises;
  type ColPaises = class (Colecoes)
    private
    protected
    public
      function Pesquisar(pChave: string; pQuero: boolean): integer;
      //function Pesquisar(pChave: integer; pQuero: boolean): integer;
      procedure SalvarArq;
      procedure LerArq;
  end;
implementation

{ ColPaises }

procedure ColPaises.LerArq;
begin

end;

function ColPaises.Pesquisar(pChave: string; pQuero: boolean): integer;
var k: integer;
begin
    k := 1;
    if self.colVazia then
       result := k
    else
    begin
        while(k <= Qtd) and (pChave > paises(item[k]).GetPais) do
                inc(k);
        if pQuero then
          begin
            if ( k > qtd ) then
              result := 0
            else
              if pChave = paises(item[k]).GetPais then
                 result := k
              else
                 result := 0;
          end
        else
          begin
             if ( k > qtd ) then
                result := k
             else
                 if pChave = paises(item[k]).GetPais  then
                    result := 0
                 else
                    result := k;
          end;
    end;
end;

procedure ColPaises.SalvarArq;
begin

end;

end.
