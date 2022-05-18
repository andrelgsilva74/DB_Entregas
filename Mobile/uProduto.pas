unit uProduto;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts;

type
  TfrmProduto = class(TForm)
    lytToolBar: TLayout;
    lblTitulo: TLabel;
    imgVoltar: TImage;
    lytFoto: TLayout;
    Image1: TImage;
    lblNome: TLabel;
    lytUnidadeValor: TLayout;
    lytCentral: TLayout;
    lblUnidade: TLabel;
    lblValor: TLabel;
    Label1: TLabel;
    rectRodape: TRectangle;
    Layout1: TLayout;
    imgMenos: TImage;
    ImgMais: TImage;
    lblQtde: TLabel;
    btnAdicionar: TButton;
    lytFundo: TLayout;
    procedure FormResize(Sender: TObject);
    procedure imgVoltarClick(Sender: TObject);
    procedure imgMenosMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure imgMenosMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure ImgMaisMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure ImgMaisMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProduto: TfrmProduto;

implementation

{$R *.fmx}

uses uPrincipal;

procedure TfrmProduto.FormResize(Sender: TObject);
begin
  if (frmProduto.Width > 600) and (frmProduto.Height > 600) then
  begin
    lytFundo.Align := TAlignLayout.Center;
    lytFundo.Height := 530;
  end
  else
    lytFundo.Align := TAlignLayout.Client;
end;

procedure TfrmProduto.ImgMaisMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  imgMais.Opacity := 0.6;
end;

procedure TfrmProduto.ImgMaisMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  imgMais.Opacity := 1;
end;

procedure TfrmProduto.imgMenosMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  imgMenos.Opacity := 0.6;
end;

procedure TfrmProduto.imgMenosMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  imgMenos.Opacity := 1;
end;

procedure TfrmProduto.imgVoltarClick(Sender: TObject);
begin
  Close;
end;

end.
