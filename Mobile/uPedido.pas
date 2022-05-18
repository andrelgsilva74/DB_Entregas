unit uPedido;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView;

type
  TfrmPedidos = class(TForm)
    LayoutTop: TLayout;
    lblTitulo: TLabel;
    imgVoltar: TImage;
    lvPedidos: TListView;
    imgShop: TImage;
    procedure FormShow(Sender: TObject);
    procedure imgVoltarClick(Sender: TObject);
    procedure lvPedidosItemClick(const Sender: TObject;
      const AItem: TListViewItem);
  private
    { Private declarations }

    procedure AddPedidoLV(id_pedido, qtd_itens: integer; nome, endereco, dt_pedido: String; vl_pedido: Double);
    procedure ListarPedidos;
  public
    { Public declarations }
  end;

var
  frmPedidos: TfrmPedidos;

implementation

{$R *.fmx}

uses uPrincipal, uPedidoDetalhe;

procedure TfrmPedidos.AddPedidoLV(id_pedido, qtd_itens: integer; nome, endereco, dt_pedido: String; vl_pedido: Double);
var
  img: TListItemImage;
  txt: TListItemText;
begin
  with lvPedidos.Items.Add do
  begin
    Height := 115;
    Tag := id_pedido;

    img := TListItemImage(Objects.FindDrawable('imgShop'));
    img.Bitmap := imgShop.Bitmap;

    txt := TListItemText(Objects.FindDrawable('txtNome'));
    txt.Text := nome;

    txt := TListItemText(Objects.FindDrawable('txtPedido'));
    txt.Text := 'Pedido: ' + id_pedido.ToString;

    txt := TListItemText(Objects.FindDrawable('txtEndereco'));
    txt.Text := endereco;

    txt := TListItemText(Objects.FindDrawable('txtValor'));
    txt.Text := FormatFloat('R$ #,##0.00', vl_pedido) + ' - ' + qtd_itens.ToString + ' itens';

    txt := TListItemText(Objects.FindDrawable('txtData'));
    txt.Text := dt_pedido;
  end;
end;

procedure TfrmPedidos.FormShow(Sender: TObject);
begin
  ListarPedidos;
end;

procedure TfrmPedidos.imgVoltarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPedidos.ListarPedidos;
begin
  AddPedidoLV(69951, 3, 'Pão de Açúcar', 'Av. Paulista, 1500', '02/03/2022', 142);
  AddPedidoLV(58751, 2, 'Pão de Açúcar', 'Av. Paulista, 1500', '02/03/2022', 142);
  AddPedidoLV(52141, 9, 'Pão de Açúcar', 'Av. Paulista, 1500', '02/03/2022', 142);
  AddPedidoLV(68451, 8, 'Pão de Açúcar', 'Av. Paulista, 1500', '02/03/2022', 142);
end;

procedure TfrmPedidos.lvPedidosItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  if not Assigned(frmPedidoDetalhe) then
    Application.CreateForm(TfrmPedidoDetalhe, frmPedidoDetalhe);

  frmPedidoDetalhe.Show;
end;

end.
