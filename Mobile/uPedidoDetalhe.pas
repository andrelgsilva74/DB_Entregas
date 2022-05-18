unit uPedidoDetalhe;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.ListBox;

type
  TfrmPedidoDetalhe = class(TForm)
    LayoutTop: TLayout;
    lblTitulo: TLabel;
    imgVoltar: TImage;
    rectBottom: TRectangle;
    lytSubTota: TLayout;
    lblSubTotal: TLabel;
    lblValorSubTotal: TLabel;
    lytTotal: TLayout;
    lblTotal: TLabel;
    lblValorTotal: TLabel;
    lytTxEntrega: TLayout;
    lblTxEntrega: TLabel;
    lblValorTxEntrega: TLabel;
    lytEnderecoEntrega: TLayout;
    lblEndEntrega: TLabel;
    lblEnderecoEntrega: TLabel;
    lbProdutos: TListBox;
    procedure imgVoltarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure AddProduto(id_produto: Integer; descricao: String; qtd,
      valor_unit: Double; foto: TStream);
    procedure CarregarPedido;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPedidoDetalhe: TfrmPedidoDetalhe;

implementation

{$R *.fmx}

uses uPrincipal, Frame.ProdutoLista;

procedure TfrmPedidoDetalhe.CarregarPedido;
begin
  AddProduto(0, 'Café Pilão Torrado e Moído', 2, 8, nil);
  AddProduto(1, 'Café Pilão Torrado e Moído', 1, 9, nil);
  AddProduto(2, 'Café Pilão Torrado e Moído', 1, 15.5, nil);
  AddProduto(3, 'Café Pilão Torrado e Moído', 4, 3, nil);
end;

procedure TfrmPedidoDetalhe.FormShow(Sender: TObject);
begin
  CarregarPedido;
end;

procedure TfrmPedidoDetalhe.imgVoltarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPedidoDetalhe.AddProduto(id_produto: Integer; descricao: String;
  qtd, valor_unit: Double; foto: TStream);
var
  item: TListBoxItem;
  frame: TFrameProdutoLista;
begin
  item := TListBoxItem.Create(lbProdutos);
  item.Selectable := False;
  item.Text := '';
  item.Height := 80;
  item.Tag := id_produto;

  // Frame
  frame := TFrameProdutoLista.Create(item);
  //frame.imfFoto.TFrameProdutoLista := descricao;
  frame.lblDescricao.Text := descricao;
  frame.lblValor.Text := FormatFloat('R$ #,##0.00', qtd * valor_unit);
  frame.lblqtd.Text := qtd.ToString + ' x ' + FormatFloat('R$ #,##0.00', valor_unit);

  item.AddObject(frame);
  lbProdutos.AddObject(item);
end;

end.
