unit service.clientes;

interface

uses
  System.SysUtils,
  System.Classes,
  provider.connection,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.FB,
  FireDAC.Phys.FBDef,
  FireDAC.VCLUI.Wait,
  FireDAC.Phys.IBBase,
  FireDAC.Comp.UI,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  model.cliente,
  Datasnap.DBClient;

type
  TServiceClientes = class(TProviderConnection)
  private

  public
    class function Get(Id: integer): TCliente; overload;
    function Get: TFDQuery; overload;
    class function Insert(cliente: TCliente): boolean;
    class function Update(cliente: TCliente): boolean;

  end;

var
  ServiceClientes: TServiceClientes;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TServiceClientes }

class function TServiceClientes.Get(Id: integer): TCliente;
begin
  Result := nil;

  var
  LServiceClientes := TServiceClientes.Create;
  try
    var
    QueryCliente := TFDQuery.Create(LServiceClientes);
    try
      QueryCliente.connection := LServiceClientes.Conn;
      QueryCliente.SQL.Text := 'select * from cliente where id = :id';
      QueryCliente.ParamByName('id').AsInteger := Id;
      QueryCliente.Open;

      if not QueryCliente.IsEmpty then
      begin
        Result := TCliente.Create;
        Result.Id := QueryCliente.FieldByName('ID').AsInteger;
        Result.ATIVO := QueryCliente.FieldByName('ATIVO').AsString;
        Result.CPF := QueryCliente.FieldByName('CPF').AsString;
        Result.NOME := QueryCliente.FieldByName('NOME').AsString;
        Result.OBS := QueryCliente.FieldByName('OBS').AsString;

      end;
    finally
      FreeAndNil(QueryCliente)
    end;
  finally
    FreeAndNil(LServiceClientes)
  end;
end;

function TServiceClientes.Get: TFDQuery;
begin
  var
  LQuery := TFDQuery.Create(self);
  LQuery.connection := Conn;
  LQuery.SQL.Text := 'select * from cliente';
  LQuery.Open;

  Result := LQuery
end;

class function TServiceClientes.Insert(cliente: TCliente): boolean;
begin
  Result := false;

  var
  LServiceClientes := TServiceClientes.Create;
  try
    var
    QueryCliente := TFDQuery.Create(LServiceClientes);
    try
      try
        QueryCliente.connection := LServiceClientes.Conn;
        QueryCliente.SQL.Add('INSERT INTO cliente (ativo, cpf, nome, obs)');
        QueryCliente.SQL.Add('VALUES ( :ativo, :cpf, :nome, :obs)');
        QueryCliente.ParamByName('ativo').AsString := cliente.ATIVO;
        QueryCliente.ParamByName('cpf').AsString := cliente.CPF;
        QueryCliente.ParamByName('nome').AsString := cliente.NOME;
        QueryCliente.ParamByName('obs').AsString := cliente.OBS;
        QueryCliente.ExecSQL;
        Result := True;
      except
        on E: Exception do
          Result := false
      end;
    finally
      FreeAndNil(QueryCliente)
    end;
  finally
    FreeAndNil(LServiceClientes)
  end;
end;

class function TServiceClientes.Update(cliente: TCliente): boolean;
begin
  Result := false;

  var
  LServiceClientes := TServiceClientes.Create;
  try
    var
    QueryCliente := TFDQuery.Create(LServiceClientes);
    try
      try
        QueryCliente.connection := LServiceClientes.Conn;
        QueryCliente.SQL.Add('UPDATE cliente SET ativo = :ativo, cpf = :cpf,');
        QueryCliente.SQL.Add('nome = :nome, obs = :obs WHERE (id = :id)');
        QueryCliente.ParamByName('id').AsInteger := cliente.Id;
        QueryCliente.ParamByName('ativo').AsString := cliente.ATIVO;
        QueryCliente.ParamByName('cpf').AsString := cliente.CPF;
        QueryCliente.ParamByName('nome').AsString := cliente.NOME;
        QueryCliente.ParamByName('obs').AsString := cliente.OBS;
        QueryCliente.ExecSQL;
        Result := True;
      except
        on E: Exception do
          Result := false
      end;
    finally
      FreeAndNil(QueryCliente)
    end;
  finally
    FreeAndNil(LServiceClientes)
  end;
end;

end.
