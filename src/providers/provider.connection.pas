unit provider.connection;

interface

uses
  System.SysUtils,
  System.Classes,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat,
  FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Phys.FBDef,
  FireDAC.Phys.IBBase,
  FireDAC.Phys.FB,
  FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef;

type
  TProviderConnection = class(TDataModule)
    Conn: TFDConnection;
    WaitCursor: TFDGUIxWaitCursor;
    FBDriverLink: TFDPhysFBDriverLink;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure ConnBeforeConnect(Sender: TObject);
  private
    procedure CarregarConfiguracoes;
    procedure Conectar;
    procedure Desconectar;

  public
    constructor Create; reintroduce;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}


uses
  helper.ini;

{$R *.dfm}


procedure TProviderConnection.CarregarConfiguracoes;
begin
  var
  Params := TFDPhysFBConnectionDefParams(Conn.Params);
  Params.Server := TIniHelper.GetValue('conexão', 'host', '127.0.0.1');
  Params.Port := TIniHelper.GetValue('conexão', 'port', 3050);
  Params.UserName := TIniHelper.GetValue('conexão', 'username', 'sysdba');
  Params.Password := TIniHelper.GetValue('conexão', 'password', 'masterkey');
  Params.Database := TIniHelper.GetValue('conexão', 'banco de dados',
    GetCurrentDir + '\dados\TesteEco.fdb')
end;

procedure TProviderConnection.Conectar;
begin
  Conn.Connected := True
end;

procedure TProviderConnection.ConnBeforeConnect(Sender: TObject);
begin
  CarregarConfiguracoes
end;

constructor TProviderConnection.Create;
begin
  inherited Create(nil);
end;

procedure TProviderConnection.DataModuleCreate(Sender: TObject);
begin
  Conectar
end;

procedure TProviderConnection.DataModuleDestroy(Sender: TObject);
begin
  Desconectar
end;

procedure TProviderConnection.Desconectar;
begin
  Conn.Connected := False
end;

end.
