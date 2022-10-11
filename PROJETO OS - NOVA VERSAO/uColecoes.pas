unit uColecoes;

interface
uses
  Classes, SysUtils;
const tf = 100;
type

  { colecoes }

  colecoes = class
    private
    protected
      item : array[1..tf] of TObject;
      qtd  : integer;
    public
      constructor CrieObj;
      function colCheia : boolean;
      function colVazia : boolean;
      function GetTam : integer;
      procedure SetQTD(pQTD: integer);
      procedure insereFim(pObj: TObject);
      procedure insere(pObj: TObject; pPos: integer);
      procedure remove(var pObj: TObject; pPos: integer);
      function  carrega(pPos: integer): TObject;
      destructor Destrua_se;
  end;
implementation

{ colecoes }

constructor colecoes.CrieObj;
begin
   qtd := 0;
end;

function colecoes.colCheia: boolean;
begin
   result := (qtd = tf);
end;

function colecoes.colVazia: boolean;
begin
   result := (qtd = 0);
end;

function colecoes.GetTam: integer;
begin
   result := qtd;
end;

procedure colecoes.SetQTD(pQTD: integer);
begin
  qtd := pQTD;
end;

procedure colecoes.insereFim(pObj: TObject);
begin
    qtd:= QTD + 1;
    item[qtd]:=pObj;
end;

procedure colecoes.insere(pObj: TObject; pPos: integer);
var i : integer;
begin
    if ( pPos = qtd + 1 ) then
       self.insereFim(pObj)
    else
      begin
        inc(qtd);
        for i:=QTD downto pPos do
            item[i]:= item[i - 1];
        item[pPos]:=pObj;
      end;
end;

procedure colecoes.remove(var pObj: TObject; pPos: integer);
var i : integer;
begin
    pObj := item[pPos];
    for i := pPos to qtd - 1 do
        item[i]:= item[i +1];
    dec(qtd);
end;

function colecoes.carrega(pPos: integer): TObject;
begin
  result:= item[pPos];
end;

destructor colecoes.Destrua_se;
var i : integer;
begin
   for i:=1 to qtd do
     item[qtd].Destroy;
end;

end.
