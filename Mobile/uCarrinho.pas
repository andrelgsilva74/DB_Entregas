unit uCarrinho;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.ListBox;

type
  TfrmCarrinho = class(TForm)
    LayoutTop: TLayout;
    lblTitulo: TLabel;
    imgVoltar: TImage;
    lytEndereco: TLayout;
    lblEndereco: TLabel;
    Label1: TLabel;
    btnBuscar: TButton;
    Rectangle1: TRectangle;
    Layout1: TLayout;
    Label2: TLabel;
    Label3: TLabel;
    Layout2: TLayout;
    Label4: TLabel;
    Label5: TLabel;
    Layout3: TLayout;
    Label6: TLabel;
    Label7: TLabel;
    Layout4: TLayout;
    Label8: TLabel;
    Label9: TLabel;
    lbProdutos: TListBox;
    procedure FormShow(Sender: TObject);
    procedure imgVoltarClick(Sender: TObject);
  private
    procedure AddProduto(id_produto: Integer; descricao: String; qtd, valor_unit: Double; foto: TStream);
    procedure CarregarCarrinho;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCarrinho: TfrmCarrinho;

implementation

{$R *.fmx}

uses uPrincipal, Frame.ProdutoLista, uProduto;

procedure TfrmCarrinho.CarregarCarrinho;
begin
  AddProduto(0, 'Café Pilão Torrado e Moído', 2, 8, nil);
  AddProduto(1, 'Café Pilão Torrado e Moído', 1, 9, nil);
  AddProduto(2, 'Café Pilão Torrado e Moído', 1, 15.5, nil);
  AddProduto(3, 'Café Pilão Torrado e Moído', 4, 3, nil);
end;

procedure TfrmCarrinho.AddProduto(id_produto: Integer; descricao: String;
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

procedure TfrmCarrinho.FormShow(Sender: TObject);
begin
  CarregarCarrinho;
end;

procedure TfrmCarrinho.imgVoltarClick(Sender: TObject);
begin
  Close;
end;

end.
