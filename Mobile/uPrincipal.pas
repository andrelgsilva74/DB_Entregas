unit uPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts, FMX.Edit,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.Ani;

type
  TfrmPrincipal = class(TForm)
    LayoutTop: TLayout;
    imgMenu: TImage;
    imgCarrinho: TImage;
    lblTop: TLabel;
    LayoutPesquisa: TLayout;
    StyleBook: TStyleBook;
    rectPesquisa: TRectangle;
    edtPesquisar: TEdit;
    imgPesquisar: TImage;
    btnBuscar: TButton;
    LayoutSwitch: TLayout;
    RectSwitch: TRectangle;
    rectSelecao: TRectangle;
    lblRetira: TLabel;
    lblCasa: TLabel;
    lvMercado: TListView;
    imgShop: TImage;
    imgTaxa: TImage;
    imgPedidoMin: TImage;
    AnimationFiltro: TFloatAnimation;
    rectMenu: TRectangle;
    Image1: TImage;
    imgFecharMenu: TImage;
    Label1: TLabel;
    Label2: TLabel;
    rectMenuPedido: TRectangle;
    Label3: TLabel;
    Rectangle2: TRectangle;
    Label4: TLabel;
    Rectangle3: TRectangle;
    Label5: TLabel;
    procedure FormShow(Sender: TObject);
    procedure lvMercadoItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure lblCasaClick(Sender: TObject);
    procedure lvMercadoMouseLeave(Sender: TObject);
    procedure imgCarrinhoClick(Sender: TObject);
    procedure imgMenuClick(Sender: TObject);
    procedure imgFecharMenuClick(Sender: TObject);
    procedure rectMenuPedidoClick(Sender: TObject);
  private
    { Private declarations }
    procedure AddMercadoLV(id_mercado: integer; nome, endereco: String; tx_entrega, vl_min_ped: Double);
    procedure ListarMercados;
    procedure SelecionarEntrega(lbl: TLabel);
    procedure OpenMenu(ind: Boolean);
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

uses uMercado, uCarrinho, uPedido;

{ TfrmPrincipal }

procedure TfrmPrincipal.ListarMercados;
begin
  AddMercadoLV(1, 'Mercearia do Macedo', 'Av. Escorial, 60', 10, 50);
  AddMercadoLV(1, 'Bar da Gaga', 'Rua Narvik, 30', 10, 50);
  AddMercadoLV(1, 'Avenida Lanches', 'Av. Mossoró, 160', 5, 50);
  AddMercadoLV(1, 'Bar da Celeste', 'Estrada Municipal, 80', 10, 50);
end;

procedure TfrmPrincipal.lvMercadoItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  if not Assigned(frmMercado) then
    Application.CreateForm(TfrmMercado, frmMercado);

  frmMercado.Show;
end;

procedure TfrmPrincipal.lvMercadoMouseLeave(Sender: TObject);
begin
  lvMercado.Cursor := crHandPoint;
end;

procedure TfrmPrincipal.OpenMenu(ind: Boolean);
begin
  rectMenu.Visible := ind;
end;

procedure TfrmPrincipal.rectMenuPedidoClick(Sender: TObject);
begin
  if not Assigned(frmPedidos) then
    Application.CreateForm(TfrmPedidos, frmPedidos);

  OpenMenu(False);
  frmPedidos.Show;
end;

procedure TfrmPrincipal.AddMercadoLV(id_mercado: integer; nome, endereco: String; tx_entrega, vl_min_ped: Double);
var
  img: TListItemImage;
  txt: TListItemText;
begin
  with lvMercado.Items.Add do
  begin
    Height := 115;
    Tag := id_mercado;

    img := TListItemImage(Objects.FindDrawable('imgShop'));
    img.Bitmap := imgShop.Bitmap;

    img := TListItemImage(Objects.FindDrawable('imgTaxa'));
    img.Bitmap := imgTaxa.Bitmap;

    img := TListItemImage(Objects.FindDrawable('imgCompraMin'));
    img.Bitmap := imgPedidoMin.Bitmap;

    txt := TListItemText(Objects.FindDrawable('txtNome'));
    txt.Text := nome;

    txt := TListItemText(Objects.FindDrawable('txtEndereco'));
    txt.Text := endereco;

    txt := TListItemText(Objects.FindDrawable('txtTaxa'));
    txt.Text := 'Taxa de Entrega: ' + FormatFloat('R$ #,##0.00', tx_entrega);

    txt := TListItemText(Objects.FindDrawable('txtCompraMin'));
    txt.Text := 'Compra Mínima: ' + FormatFloat('R$ #,##0.00', vl_min_ped);
  end;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  ListarMercados;
end;

procedure TfrmPrincipal.imgCarrinhoClick(Sender: TObject);
begin
  if not Assigned(frmCarrinho) then
    Application.CreateForm(TfrmCarrinho, frmCarrinho);

  frmCarrinho.Show;
end;

procedure TfrmPrincipal.imgFecharMenuClick(Sender: TObject);
begin
  OpenMenu(False);
end;

procedure TfrmPrincipal.imgMenuClick(Sender: TObject);
begin
  OpenMenu(True);
end;

procedure TfrmPrincipal.SelecionarEntrega(lbl: TLabel);
begin
  lblCasa.FontColor := $FF8F8F8F;
  lblRetira.FontColor := $FF8F8F8F;

  lbl.FontColor := $FFFFFFFF;

  AnimationFiltro.StopValue := lbl.Position.X;
  AnimationFiltro.Start;
end;

procedure TfrmPrincipal.lblCasaClick(Sender: TObject);
begin
  SelecionarEntrega(TLabel(Sender));
end;

end.
