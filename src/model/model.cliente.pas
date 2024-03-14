unit model.cliente;

interface

type
  TCliente = class
  private
    FID: integer;
    FATIVO: string;
    FCPF: string;
    FNOME: string;
    FOBS: string;
  public
   property ID: integer read FID write FID;
   property ATIVO: string read FATIVO write FATIVO;
   property CPF: string read FCPF write FCPF;
   property NOME: string read FNOME write FNOME;
   property OBS: string read FOBS write FOBS;

  end;

implementation

end.
