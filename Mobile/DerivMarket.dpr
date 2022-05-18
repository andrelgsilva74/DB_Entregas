program DerivMarket;

uses
  System.StartUpCopy,
  FMX.Forms,
  uLogin in 'uLogin.pas' {frmLogin},
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uMercado in 'uMercado.pas' {frmMercado},
  Frame.ProdutoCard in 'Frames\Frame.ProdutoCard.pas' {FrameProdutoCard: TFrame},
  uSplash in 'uSplash.pas' {frmSplash},
  uProduto in 'uProduto.pas' {frmProduto},
  uCarrinho in 'uCarrinho.pas' {frmCarrinho},
  Frame.ProdutoLista in 'Frames\Frame.ProdutoLista.pas' {FrameProdutoLista: TFrame},
  uPedido in 'uPedido.pas' {frmPedidos},
  uPedidoDetalhe in 'uPedidoDetalhe.pas' {frmPedidoDetalhe},
  uDataModule.Usuarios in '..\DataModule\uDataModule.Usuarios.pas' {DMUsuario: TDataModule},
  uLoading in 'Units\uLoading.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDMUsuario, DMUsuario);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.Run;
end.
