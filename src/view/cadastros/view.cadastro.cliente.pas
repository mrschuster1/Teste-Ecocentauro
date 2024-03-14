unit view.cadastro.cliente;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  UITypes,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Buttons,
  System.ImageList,
  Vcl.ImgList,
  Vcl.VirtualImageList,
  Vcl.BaseImageCollection,
  Vcl.ImageCollection,
  Vcl.Mask,
  model.cliente;

type
  TFormCadastroCliente = class(TForm)
    pnlMain: TPanel;
    pnlBottom: TPanel;
    ImageCollectionIcons: TImageCollection;
    VirtualImageListIcons: TVirtualImageList;
    pnlOperacoesCadastro: TPanel;
    btnConsultar: TSpeedButton;
    btnEditar: TSpeedButton;
    btnNovo: TSpeedButton;
    FlowPanelCadastro: TFlowPanel;
    edtID: TLabeledEdit;
    edtCPF: TLabeledEdit;
    lblOperacaoCadastro: TLabel;
    pnlSair: TPanel;
    btnSair: TSpeedButton;
    pnlConfirmar: TPanel;
    btnConfirmar: TSpeedButton;
    pnlCancelar: TPanel;
    btnCancelar: TSpeedButton;
    edtNome: TLabeledEdit;
    cbAtivo: TCheckBox;
    FlowPanelObs: TFlowPanel;
    memoObs: TMemo;
    lblObs: TLabel;
    pnlCadastro: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure edtIDExit(Sender: TObject);
  private
    type
    TOperacaoCadastro = (ocIncluir, ocEditar, ocConsultar, ocNavegar);

  var
    procedure AtualizaOperacaoCadastro(Operacao: TOperacaoCadastro);
    procedure PesquisaCliente;
    procedure CarregarCliente(Id: integer);
    procedure Salvar;
    procedure LimparCampos;

  var
    FOperacaoCadastro: TOperacaoCadastro;

  public

  end;

var
  FormCadastroCliente: TFormCadastroCliente;

implementation

{$R *.dfm}


uses
  helper.validador,
  view.pesquisa.cliente,
  service.clientes;

procedure TFormCadastroCliente.AtualizaOperacaoCadastro(
  Operacao: TOperacaoCadastro);
begin
  FOperacaoCadastro := Operacao;

  pnlCancelar.Enabled := FOperacaoCadastro
    in [ocIncluir, ocEditar, ocConsultar];

  pnlConfirmar.Enabled := FOperacaoCadastro
    in [ocIncluir, ocEditar];

  edtID.Enabled := FOperacaoCadastro in [ocConsultar, ocEditar];

  pnlCadastro.Enabled := FOperacaoCadastro
    in [ocIncluir, ocEditar];

  case Operacao of
    ocIncluir:
      begin
        LimparCampos;
        lblOperacaoCadastro.Caption := ' Cadastro de clientes - inserindo';
        btnNovo.Enabled := True;
        btnEditar.Enabled := False;
        btnConsultar.Enabled := False;
        edtCPF.SetFocus;
      end;
    ocEditar:
      begin
        lblOperacaoCadastro.Caption := ' Cadastro de clientes - editando';
        btnNovo.Enabled := True;
        btnEditar.Enabled := True;
        btnConsultar.Enabled := True;
      end;
    ocConsultar:
      begin
        lblOperacaoCadastro.Caption := ' Cadastro de clientes - consultando';
        btnNovo.Enabled := False;
        btnEditar.Enabled := False;
        btnConsultar.Enabled := True;
      end;
    ocNavegar:
      begin
        lblOperacaoCadastro.Caption := ' Cadastro de clientes';
        btnNovo.Enabled := True;
        btnEditar.Enabled := True;
        btnConsultar.Enabled := True;
        LimparCampos
      end;
  end;
end;

procedure TFormCadastroCliente.btnCancelarClick(Sender: TObject);
begin
  AtualizaOperacaoCadastro(ocNavegar)
end;

procedure TFormCadastroCliente.btnConfirmarClick(Sender: TObject);
begin
  if TValidador.ValidarCPF(edtCPF.Text) then
    Salvar
  else
    ShowMessage('CPF inválido')
end;

procedure TFormCadastroCliente.btnConsultarClick(Sender: TObject);
begin
  AtualizaOperacaoCadastro(ocConsultar);
  PesquisaCliente
end;

procedure TFormCadastroCliente.btnEditarClick(Sender: TObject);
begin
  AtualizaOperacaoCadastro(ocEditar);
  PesquisaCliente
end;

procedure TFormCadastroCliente.btnNovoClick(Sender: TObject);
begin
  AtualizaOperacaoCadastro(ocIncluir)
end;

procedure TFormCadastroCliente.btnSairClick(Sender: TObject);
begin
  Close
end;

procedure TFormCadastroCliente.CarregarCliente(Id: integer);
begin
  if Id <> 0 then
  begin
    var
    LCliente := TServiceClientes.Get(Id);
    try
      if Assigned(LCliente) then
      begin
        edtID.Text := LCliente.Id.ToString;
        edtCPF.Text := LCliente.CPF;
        edtNome.Text := LCliente.NOME;
        memoObs.Lines.Text := LCliente.OBS;

        if LCliente.ATIVO = 'S' then
          cbAtivo.State := cbChecked
        else
          cbAtivo.State := cbUnchecked;
      end
      else
      begin
        AtualizaOperacaoCadastro(ocNavegar);
        ShowMessage('Cliente não encontrado')
      end;
    finally
      LCliente.Free
    end;
  end
  else
    AtualizaOperacaoCadastro(ocNavegar)
end;

procedure TFormCadastroCliente.edtIDExit(Sender: TObject);
begin
  if StrToInt(edtID.Text) <> 0 then
    if FOperacaoCadastro in [ocConsultar, ocEditar] then
      CarregarCliente(StrToInt(edtID.Text))
end;

procedure TFormCadastroCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree
end;

procedure TFormCadastroCliente.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if FOperacaoCadastro in [ocConsultar, ocNavegar] then
    CanClose := True
  else
    CanClose := MessageDlg('Deseja abandonar os dados digitados?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes
end;

procedure TFormCadastroCliente.FormCreate(Sender: TObject);
begin
  AtualizaOperacaoCadastro(ocNavegar)
end;

procedure TFormCadastroCliente.LimparCampos;
begin
  edtID.Clear;
  edtCPF.Clear;
  edtNome.Clear;
  memoObs.Clear;
  cbAtivo.State := cbChecked;
end;

procedure TFormCadastroCliente.PesquisaCliente;
begin
  CarregarCliente(TFormPesquisaCliente.RetornaCliente);

  if FOperacaoCadastro = ocEditar then
    edtID.SetFocus;
end;

procedure TFormCadastroCliente.Salvar;
begin
  if (edtCPF.Text = '') or (edtNome.Text = '') then
  begin
    raise Exception.Create('Há campos obrigatórios não preenchidos');
    Exit
  end;
  var
  LCliente := TCliente.Create;
  try
    LCliente.CPF := Trim(edtCPF.Text);
    LCliente.NOME := Trim(edtNome.Text);
    LCliente.OBS := Trim(memoObs.Lines.Text);

    if cbAtivo.State = cbChecked then
      LCliente.ATIVO := 'S'
    else
      LCliente.ATIVO := 'N';

    if FOperacaoCadastro = ocIncluir then
    begin
      if not TServiceClientes.Insert(LCliente) then
      begin
        raise Exception.Create('Erro ao cadastrar cliente');
        Exit
      end;
    end;

    if FOperacaoCadastro = ocEditar then
    begin
      LCliente.Id := StrToInt(edtID.Text);
      if not TServiceClientes.Update(LCliente) then
      begin
        raise Exception.Create('Erro ao atualizar cliente');
        Exit
      end;
    end;
  finally
    LCliente.Free
  end;

  AtualizaOperacaoCadastro(ocNavegar);
end;

end.
