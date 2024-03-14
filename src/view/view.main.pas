unit view.main;

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
  Vcl.ExtCtrls,
  Vcl.Buttons,
  Vcl.BaseImageCollection,
  Vcl.ImageCollection,
  System.ImageList,
  Vcl.ImgList,
  Vcl.VirtualImageList,
  Vcl.CategoryButtons,
  Vcl.WinXCtrls,
  UITypes,
  Vcl.TitleBarCtrls,
  Vcl.Menus;

type
  TFormMain = class(TForm)
    pnlMenu: TPanel;
    VirtualImageListIcons: TVirtualImageList;
    ImageCollectionIcons: TImageCollection;
    svMenu: TSplitView;
    CategoryButtons1: TCategoryButtons;
    Splitter1: TSplitter;
    btnMenu: TSpeedButton;
    TitleBarPanel1: TTitleBarPanel;
    procedure btnMenuClick(Sender: TObject);
    procedure Splitter1Moved(Sender: TObject);
    procedure Splitter1CanResize(Sender: TObject; var NewSize: Integer;
      var Accept: Boolean);
    procedure CategoryButtons1Categories0Items0Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    procedure AbrirFecharMenu;
    procedure AbrirFormMDI(Form: TFormClass; PermiteVarios: Boolean);

  public

  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}


uses
  helper.Forms,
  view.cadastro.cliente;

procedure TFormMain.AbrirFormMDI(Form: TFormClass; PermiteVarios: Boolean);
begin
  TFormHelper.CreateMDIForm(Form, Self, PermiteVarios);
  svMenu.Close
end;

procedure TFormMain.btnMenuClick(Sender: TObject);
begin
  AbrirFecharMenu
end;

procedure TFormMain.CategoryButtons1Categories0Items0Click(Sender: TObject);
begin
  AbrirFormMDI(TFormCadastroCliente, False)
end;

procedure TFormMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if MDIChildCount > 0 then
    CanClose := MessageDlg('Todas janelas serão fechadas! Deseja fechá-las?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes
  else
    CanClose := True
end;

procedure TFormMain.Splitter1CanResize(Sender: TObject; var NewSize: Integer;
  var Accept: Boolean);
begin
  Accept := svMenu.Opened
end;

procedure TFormMain.Splitter1Moved(Sender: TObject);
begin
  if not svMenu.Opened then
    svMenu.Open
end;

procedure TFormMain.AbrirFecharMenu;
begin
  svMenu.Opened := not svMenu.Opened;
end;

end.
