unit uDataModule.Usuarios;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  DataSet.Serialize.Config, RestRequest4D, System.JSON;

type
  TDMUsuario = class(TDataModule)
    TabUsuario: TFDMemTable;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Login(email, senha: String); 
    procedure Cadastro(nome, email, senha, endereco, bairro, cidade, uf, cep: String);
  end;

var
  DMUsuario: TDMUsuario;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

Const
  USER_NAME = 'Andre';
  PASSWORD = '161079';
  BASE_URL = 'http://localhost:3000';

procedure TDMUsuario.DataModuleCreate(Sender: TObject);
begin
  TDataSetSerializeConfig.GetInstance.CaseNameDefinition := cndLower;
end;

procedure TDMUsuario.Login(email, senha: String);
var
  resp: IResponse;
  json: TJSONObject;
begin
  try
    json := TJSONObject.Create;
    json.AddPair('email', email);
    json.AddPair('senha', senha);

    resp := TRequest.New.BaseURL(BASE_URL)
            .Resource('usuarios/login')
            .DataSetAdapter(TabUsuario)
            .AddBody(json.ToJSON)
            .Accept('application/json')
            .BasicAuthentication(USER_NAME, PASSWORD)
            .Post;

    if resp.StatusCode = 401 then
      raise Exception.Create('Email ou senha inválida!')
    else
      if resp.StatusCode <> 200 then
        raise Exception.Create(resp.Content);
  finally
    json.DisposeOf;
  end;
end;

procedure TDMUsuario.Cadastro(nome, email, senha, endereco, bairro, cidade, uf, cep: String);
var
  resp: IResponse;
  json: TJSONObject;
begin
  try
    json := TJSONObject.Create;  
    json.AddPair('nome', nome);
    json.AddPair('email', email);
    json.AddPair('senha', senha); 
    json.AddPair('endereco', endereco);
    json.AddPair('bairro', bairro);
    json.AddPair('cidade', cidade);
    json.AddPair('uf', uf);
    json.AddPair('cep', cep);

    resp := TRequest.New.BaseURL(BASE_URL)
            .Resource('usuarios/cadastro')
            .DataSetAdapter(TabUsuario)
            .AddBody(json.ToJSON)
            .Accept('application/json')
            .BasicAuthentication(USER_NAME, PASSWORD)
            .Post;

    if resp.StatusCode = 401 then
      raise Exception.Create('Usuário não autorizado!')
    else
      if resp.StatusCode <> 201 then
        raise Exception.Create(resp.Content);
  finally
    json.DisposeOf;
  end;
end;

end.
