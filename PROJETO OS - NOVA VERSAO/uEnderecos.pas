unit uEnderecos;

interface
uses uPai;
type Enderecos = class (Pai)
  private
  protected
    logradouro : String[50];
    Numero : string[10];
    bairro : string[50];
    cep : string[10];
    cidade : string[50];
    estado : string[50];
    pais : string[50];
  public
    constructor CrieObj;
    destructor Destrua_se;
end;

implementation

{ Enderecos }

constructor Enderecos.CrieObj;
begin

end;

destructor Enderecos.Destrua_se;
begin

end;

end.
