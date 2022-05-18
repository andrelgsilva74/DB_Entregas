unit uMercado;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.Edit, FMX.ListBox;

type
  TfrmMercado = class(TForm)
    LayoutTop: TLayout;
    lblTitulo: TLabel;
    imgVoltar: TImage;
    ImgCarrinho: TImage;
    LayoutPesquisa: TLayout;
    StyleBook: TStyleBook;
    rectPesquisa: TRectangle;
    edtBuscar: TEdit;
    imgPesquisar: TImage;
    btnBuscar: TButton;
    lytEndereco: TLayout;
    lblEndereco: TLabel;
    Image2: TImage;
    Image3: TImage;
    lblEntrega: TLabel;
    lblPedMin: TLabel;
    lbCategoria: TListBox;
    ListBoxItem1: TListBoxItem;
    Rectangle1: TRectangle;
    Label1: TLabel;
    ListBoxItem2: TListBoxItem;
    Rectangle2: TRectangle;
    Label2: TLabel;
    lbProdutos: TListBox;
    procedure FormShow(Sender: TObject);
    procedure lbCategoriaItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
    procedure lbProdutosItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
    procedure imgVoltarClick(Sender: TObject);
    procedure lbProdutosMouseLeave(Sender: TObject);
  private
    { Private declarations }

    procedure AddProduto(id_produto: Integer; descricao, unidade: String; valor: Double);
    procedure ListarProdutos;
    procedure ListarCategorias;
    procedure AddCategoria(id_categoria: Integer; descricao: String);
    procedure SelecionarCategoria(item: TListBoxItem);
  public
    { Public declarations }
  end;

var
  frmMercado: TfrmMercado;

implementation

{$R *.fmx}

uses uPrincipal, Frame.ProdutoCard, uProduto;

{ TfrmMercado }



procedure TfrmMercado.AddProduto(id_produto: Integer; descricao,
  unidade: String; valor: Double);
var
  item: TListBoxItem;
  frame: TFrameProdutoCard;
begin
  item := TListBoxItem.Create(lbProdutos);
  item.Selectable := False;
  item.Text := '';
  item.Height := 200;
  item.Tag := id_produto;

  // Frame
  frame := TFrameProdutoCard.Create(item);
  //frame.imfFoto.bitMap := descricao;
  frame.lblDescricao.Text := descricao;
  frame.lblValor.Text := FormatFloat('R$ #,##0.00', valor);
  frame.lblUnidade.Text := unidade;

  item.AddObject(frame);
  lbProdutos.AddObject(item);
end;

procedure TfrmMercado.FormShow(Sender: TObject);
begin
  ListarCategorias;
end;

procedure TfrmMercado.imgVoltarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMercado.SelecionarCategoria(item: TListBoxItem);
var
  x: integer;
  rect: TRectangle;
  lbl: TLabel;
begin
  //Zerar itens...
  for x := 0 to Pred(lbCategoria.Items.Count) do
  begin
    TRectangle(lbCategoria.ItemByIndex(x).Components[0]).Fill.Color := $FFE2E2E2;
    TLabel(TRectangle(lbCategoria.ItemByIndex(x).Components[0]).Components[0]).FontColor := $FF3A3A3A;
  end;

  // Ajusta o item selecionado
  TRectangle(item.Components[0]).Fill.Color := $FF64BA01;
  TLabel(TRectangle(item.Components[0]).Components[0]).FontColor := $FFFFFFFF;

  // Salvar a categoria selecionada...
  lbCategoria.Tag := item.Tag;
end;

procedure TfrmMercado.AddCategoria(id_categoria: Integer; descricao: String);
var
  item: TListBoxItem;
  rect: TRectangle;
  lbl: TLabel;
begin
  //Cria o item no ListBox
  item := TListBoxItem.Create(lbCategoria);
  item.Selectable := False;
  item.Text := '';
  item.Width := 130;
  item.Tag := id_categoria;

  //Cria um Retangulo dentro do item
  rect := TRectangle.Create(item);
  rect.Cursor := crHandPoint;
  rect.HitTest := False;
  rect.Fill.Color := $FFE2E2E2;
  rect.Align := TAlignLayout.Client;
  rect.Margins .Top := 8;
  rect.Margins .Left := 8;
  rect.Margins .Right := 8;
  rect.Margins .Bottom := 8;
  rect.XRadius := 6;
  rect.YRadius := 6;
  rect.Stroke.Kind := TBrushKind.None;

  //Cria uma Label dentro do Retangulo
  lbl := TLabel.Create(rect);
  lbl.Align := TAlignLayout.Client;
  lbl.Text := descricao;
  lbl.TextSettings.HorzAlign := TTextAlign.Center;
  lbl.TextSettings.VertAlign := TTextAlign.Center;
  lbl.StyledSettings := lbl.StyledSettings - [TStyledSetting.Size,
                                              TStyledSetting.Style,
                                              TStyledSetting.FontColor,
                                              TStyledSetting.Other];
  lbl.Font.Size := 13;
  lbl.FontColor := $FF3A3A3A;

  RECT.AddObject(lbl);
  item.AddObject(rect);
  lbCategoria.AddObject(item);
end;

procedure TfrmMercado.ListarCategorias;
begin
  lbCategoria.Items.Clear;

  AddCategoria(0, 'Alimentos');
  AddCategoria(1, 'Bebidas');
  AddCategoria(2, 'Limpeza');
  AddCategoria(3, 'Eletrônicos');
  AddCategoria(4, 'Informática');

  ListarProdutos;
end;

procedure TfrmMercado.ListarProdutos;
begin
  // Acessar dados do BackEnd

  AddProduto(0, 'Café Pilão Torrado e Moído', '500g', 15);
  AddProduto(0, 'Café Pilão Torrado e Moído', '500g', 15);
  AddProduto(0, 'Café Pilão Torrado e Moído', '500g', 15);
  AddProduto(0, 'Café Pilão Torrado e Moído', '500g', 15);
  AddProduto(0, 'Café Pilão Torrado e Moído', '500g', 15);
  AddProduto(0, 'Café Pilão Torrado e Moído', '500g', 15);
end;

procedure TfrmMercado.lbCategoriaItemClick(const Sender: TCustomListBox;
  const Item: TListBoxItem);
begin
  SelecionarCategoria(Item);
end;

procedure TfrmMercado.lbProdutosItemClick(const Sender: TCustomListBox;
  const Item: TListBoxItem);
begin
  if not Assigned(frmProduto) then
    Application.CreateForm(TfrmProduto, frmProduto);

  frmProduto.Show;
end;

procedure TfrmMercado.lbProdutosMouseLeave(Sender: TObject);
begin
  lbProdutos.Cursor := crHandPoint;
end;

end.
