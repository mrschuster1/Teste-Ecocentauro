program TesteEco;

uses
  Vcl.Forms,
  view.main in 'src\view\view.main.pas' {FormMain},
  helper.forms in 'src\helpers\helper.forms.pas',
  view.cadastro.cliente in 'src\view\cadastros\view.cadastro.cliente.pas' {FormCadastroCliente},
  provider.connection in 'src\providers\provider.connection.pas' {ProviderConnection: TDataModule},
  helper.ini in 'src\helpers\helper.ini.pas',
  service.clientes in 'src\services\service.clientes.pas' {ServiceClientes: TDataModule},
  model.cliente in 'src\model\model.cliente.pas',
  view.pesquisa.cliente in 'src\view\pesquisas\view.pesquisa.cliente.pas' {FormPesquisaCliente},
  helper.validador in 'src\helpers\helper.validador.pas',
  helper.grid in 'src\helpers\helper.grid.pas';

{$R *.res}


begin
{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
{$ENDIF}
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;

end.
