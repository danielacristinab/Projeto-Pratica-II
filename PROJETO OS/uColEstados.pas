unit uColEstados;

interface
uses uColecoes, uEstados;
  type ColEstados = class (Colecoes)
    private
    protected
    public
      function Pesquisar(pChave: string; pQuero: boolean): integer;
      //function Pesquisar(pChave: integer; pQuero: boolean): integer;
  end;
implementation

{ ColEstados }

function ColEstados.Pesquisar(pChave: string; pQuero: boolean): integer;
var k: integer;
begin
    k := 1;
    if self.colVazia then
       result := k
    else
    begin
        while(k <= Qtd) and (pChave > estados(item[k]).GetEstado) do
                inc(k);
        if pQuero then
          begin
            if ( k > qtd ) then
              result := 0
            else
              if pChave = estados(item[k]).GetEstado then
                 result := k
              else
                 result := 0;
          end
        else
          begin
             if ( k > qtd ) then
                result := k
             else
                 if pChave = estados(item[k]).GetEstado  then
                    result := 0
                 else
                    result := k;
          end;
    end;
end;

end.
