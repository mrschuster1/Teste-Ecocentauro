unit view.pesquisa.cliente;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Data.DB,
  Vcl.StdCtrls,
  Vcl.WinXCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  System.ImageList,
  Vcl.ImgList,
  Vcl.VirtualImageList,
  Vcl.Buttons,
  Vcl.ExtCtrls,
  Vcl.BaseImageCollection,
  Vcl.ImageCollection,
  FireDAC.Comp.Client,
  service.clientes,
  Vcl.TitleBarCtrls,
  helper.grid;

type
  TFormPesquisaCliente = class(TForm)
    ImageCollectionIcons: TImageCollection;
    pnlMain: TPanel;
    VirtualImageListIcons: TVirtualImageList;
    GridPesquisa: TDBGrid;
    edtPesquisa: TSearchBox;
    dsPesquisa: TDataSource;
    TitleBarPanel1: TTitleBarPanel;
    pnlBottom: TPanel;
    pnlSair: TPanel;
    btnSair: TSpeedButton;
    pnlConfirmar: TPanel;
    btnConfirmar: TSpeedButton;
    procedure GridPesquisaDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConfirmarClick(Sender: TObject);
    procedure dsPesquisaDataChange(Sender: TObject; Field: TField);
    procedure btnSairClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure edtPesquisaChange(Sender: TObject);
    procedure dsPesquisaStateChange(Sender: TObject);
  private
    FServiceClientes: TServiceClientes;
    FIDCliente: integer;

  public
    class function RetornaCliente: integer;

  end;

var
  FormPesquisaCliente: TFormPesquisaCliente;

implementation

{$R *.dfm}

{ TFormPesquisaCliente }

procedure TFormPesquisaCliente.btnConfirmarClick(Sender: TObject);
begin
  ModalResult := mrOk
end;

procedure TFormPesquisaCliente.btnSairClick(Sender: TObject);
begin
  ModalResult := mrCancel
end;

procedure TFormPesquisaCliente.dsPesquisaDataChange(Sender: TObject;
  Field: TField);
begin
  FIDCliente := dsPesquisa.DataSet.FieldByName('id').AsInteger;
end;

procedure TFormPesquisaCliente.dsPesquisaStateChange(Sender: TObject);
begin
  dsPesquisa.DataSet.FieldByName('cpf').EditMask := '!999.999.999-99;0;'
end;

procedure TFormPesquisaCliente.edtPesquisaChange(Sender: TObject);
begin
  dsPesquisa.DataSet.Filtered := False;
  dsPesquisa.DataSet.Filter := 'upper(cpf) like ' +
    QuotedStr('%' + UpperCase(edtPesquisa.Text) + '%') + ' or upper(nome) like ' +
    QuotedStr('%' + UpperCase(edtPesquisa.Text) + '%');
  dsPesquisa.DataSet.Filtered := True;
end;

procedure TFormPesquisaCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FServiceClientes.Free
end;

procedure TFormPesquisaCliente.FormCreate(Sender: TObject);
begin
  FIDCliente := 0;
  FServiceClientes := TServiceClientes.Create;
  dsPesquisa.DataSet := FServiceClientes.Get
end;

procedure TFormPesquisaCliente.FormResize(Sender: TObject);
begin
  TGridHelper.AjustarLarguraGrid(GridPesquisa)
end;

procedure TFormPesquisaCliente.GridPesquisaDblClick(Sender: TObject);
begin
  ModalResult := mrOk
end;

class function TFormPesquisaCliente.RetornaCliente: integer;
begin
  var
  LFormPesquisaCliente := TFormPesquisaCliente.Create(nil);
  try
    if LFormPesquisaCliente.ShowModal = mrOk then
      Result := LFormPesquisaCliente.FIDCliente
    else
      Result := 0
  finally
    FreeAndNil(LFormPesquisaCliente)
  end;
end;

end.
