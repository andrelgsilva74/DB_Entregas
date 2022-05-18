unit uLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.TabControl, FMX.StdCtrls, FMX.Edit, FMX.Controls.Presentation, FMX.Layouts,
  uLoading;

type
  TfrmLogin = class(TForm)
    TabControl: TTabControl;
    tabLogin: TTabItem;
    tabConta1: TTabItem;
    tabConta2: TTabItem;
    imgTopoLogin: TImage;
    LayoutLogin: TLayout;
    lblAcesse: TLabel;
    edtEmail: TEdit;
    EdtSenha: TEdit;
    btnLogin: TButton;
    LayoutCriar1: TLayout;
    lblCriar1: TLabel;
    EdtNome: TEdit;
    EdtSenha1: TEdit;
    BtnProximo: TButton;
    LayoutCriar2: TLayout;
    lblCriar2: TLabel;
    edtEndereco: TEdit;
    EdtCep: TEdit;
    BtnCriar2: TButton;
    imgTopoCriar1: TImage;
    imgTopoCriar2: TImage;
    lblRodape: TLabel;
    lblRodape1: TLabel;
    lblRodape2: TLabel;
    lblPasso1: TLabel;
    edtEmailCriar: TEdit;
    lblPasso2: TLabel;
    edtBairro: TEdit;
    LayoutCidade: TLayout;
    EdtUF: TEdit;
    EdtCidade: TEdit;
    StyleBook: TStyleBook;
    rectEmail: TRectangle;
    rectSenha: TRectangle;
    RectNome: TRectangle;
    RectEndereco: TRectangle;
    RectSenha1: TRectangle;
    RectEmail1: TRectangle;
    RectCEP: TRectangle;
    RectBairro: TRectangle;
    Rectangle1: TRectangle;
    RectCidade: TRectangle;
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnCriar2Click(Sender: TObject);
    procedure lblRodapeClick(Sender: TObject);
    procedure lblRodape1Click(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
  private
    procedure TThreadLoginTerminate(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.fmx}

uses uDataModule.Usuarios, uPrincipal;

procedure TfrmLogin.BtnCriar2Click(Sender: TObject);
begin
  TabControl.ActiveTab := tabLogin;
end;

procedure TfrmLogin.TThreadLoginTerminate(Sender: TObject);
begin
  TLoading.Hide;

  if Sender is TThread then
  begin
    if Assigned(TThread(Sender).FatalException) then
    begin
      ShowMessage(Exception(TThread(Sender).FatalException).Message);
      Exit;
    end;
  end;

  //Abrir form principal...
  if not Assigned(frmPrincipal) then
    Application.CreateForm(TfrmPrincipal, frmPrincipal);

  frmPrincipal.Show;
end;

procedure TfrmLogin.btnLoginClick(Sender: TObject);
var
  t: TThread;
begin
  TLoading.Show(FrmLogin, '');

  t := TThread.CreateAnonymousThread(procedure
  begin
    sleep(1500);
    DMUsuario.Login(edtEmail.Text, EdtSenha.Text);

    //Salvar dados no banco do aparelho...
    if DMUsuario.TabUsuario.RecordCount > 0 then
    begin

    end;
  end);

  t.OnTerminate := TThreadLoginTerminate;
  t.Start;
end;

procedure TfrmLogin.BtnProximoClick(Sender: TObject);
begin
  TabControl.ActiveTab := tabConta2;
end;

procedure TfrmLogin.lblRodape1Click(Sender: TObject);
begin
  TabControl.ActiveTab := tabLogin;
end;

procedure TfrmLogin.lblRodapeClick(Sender: TObject);
begin
  TabControl.ActiveTab := tabConta1;
end;

end.
