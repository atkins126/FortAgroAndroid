unit UDataUpdate;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,FMX.Dialogs;

type
  TdmUpdate = class(TDataModule)
  private
    { Private declarations }
  public
    function  VerificaTabelasExiste(NomeTabela:string):Boolean;
    procedure CreateTablesVersao(NumeroVersao:string);
    function  VerificaTabelaExiste(Atabela: string):Boolean;
    function  VerificaCampoExiste(Acampo, Atabela: string):Boolean;
  end;

var
  dmUpdate: TdmUpdate;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses UDataContext;

{$R *.dfm}

{ TDataModule3 }

procedure TdmUpdate.CreateTablesVersao(NumeroVersao: string);
var
 vQryAux:TFDQuery;
begin
 vQryAux:=TFDQuery.Create(nil);
 vQryAux.Connection := dmDB.FDConn;
 if NumeroVersao='v2021-02-06' then
 begin
   if not VerificaCampoExiste('ultimarevisao', 'maquinaveiculo') then
   begin
    with vQryAux,vQryAux.SQL do
    begin
     Clear;
     Add('ALTER TABLE maquinaveiculo ADD ultimarevisao date NULL');
     ExecSQL;
    end;
   end;
   if not VerificaCampoExiste('horimetroultimarev', 'maquinaveiculo') then
   begin
    with vQryAux,vQryAux.SQL do
    begin
     Clear;
     Add('ALTER TABLE maquinaveiculo ADD horimetroultimarev numeric(15,3) NULL');
     ExecSQL;
    end;
   end;
   if not VerificaCampoExiste('horimetroproximarevisao', 'maquinaveiculo') then
   begin
    with vQryAux,vQryAux.SQL do
    begin
     Clear;
     Add('ALTER TABLE maquinaveiculo ADD horimetroproximarevisao numeric(15,3) NULL');
     ExecSQL;
    end;
   end;
   if not VerificaCampoExiste('horimetro', 'maquinaveiculo') then
   begin
    with vQryAux,vQryAux.SQL do
    begin
     Clear;
     Add('ALTER TABLE maquinaveiculo ADD horimetro numeric(15,3) NULL');
     ExecSQL;
    end;
   end;
   if VerificaTabelaExiste('contratos') then
   begin
    with vQryAux,vQryAux.SQL do
    begin
     Clear;
     Add('CREATE TABLE contratos (');
     Add('id integer NOT NULL,');
     Add('status int4 NOT NULL DEFAULT 1,');
     Add('datareg timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,');
     Add('idusuario int4 NOT NULL,');
     Add('dataalteracao timestamptz,');
     Add('idusuarioalteracao int4,');
     Add('idcomprador int4 NOT NULL,');
     Add('idcultura int4 NOT NULL,');
     Add('idsafra int4 NOT NULL,');
     Add('numerocontrato varchar (20) NOT NULL,');
     Add('totalcompravolume numeric (15, 3) NOT NULL,');
     Add('totalcomprasacos numeric (15, 3) NOT NULL,');
     Add('totalembarquevolume numeric (15, 3) NOT NULL DEFAULT 0,');
     Add('totalembarquesacos numeric (15, 3) NOT NULL DEFAULT 0,');
     Add('syncaws int4 NOT NULL DEFAULT 0,');
     Add('syncfaz int4 NOT NULL DEFAULT 0)');
     ExecSQL;
    end;
   end;
   if VerificaTabelaExiste('embarque') then
   begin
    with vQryAux,vQryAux.SQL do
    begin
     Clear;
     Add('CREATE TABLE embarque (');
     Add('id integer NOT NULL PRIMARY KEY AUTOINCREMENT,');
     Add('status int4 NOT NULL DEFAULT 1,');
     Add('datareg timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,');
     Add('idusuario int4 NOT NULL,');
     Add('dataalteracao timestamptz,');
     Add('idusuarioalteracao int4,');
     Add('idcontrato int4 NOT NULL,');
     Add('numeronf int4 NULL,');
     Add('placa varchar (15) NOT NULL,');
     Add('dataembarque date NOT NULL,');
     Add('horabarque time NOT NULL DEFAULT CURRENT_TIME,');
     Add('tara numeric (15, 3) NOT NULL DEFAULT 0,');
     Add('bruto numeric (15, 3) NOT NULL DEFAULT 0,');
     Add('liquido numeric (15, 3) NOT NULL DEFAULT 0,');
     Add('imp numeric (15, 3) NOT NULL DEFAULT 0,');
     Add('queb numeric (15, 3) NOT NULL DEFAULT 0,');
     Add('verd numeric (15, 3) NOT NULL DEFAULT 0,');
     Add('avar numeric (15, 3) NOT NULL DEFAULT 0,');
     Add('umid numeric (15, 3) NOT NULL DEFAULT 0,');
     Add('syncaws int4 NOT NULL DEFAULT 0,');
     Add('syncfaz int4 NOT NULL DEFAULT 0)');
     ExecSQL;
    end;
   end;
   if VerificaTabelaExiste('comprador') then
   begin
    with vQryAux,vQryAux.SQL do
    begin
     Clear;
     Add('CREATE TABLE comprador (');
     Add('	id integer NOT NULL,');
     Add('	status int4 NOT NULL DEFAULT 1,');
     Add('	datareg timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,');
     Add('	idusuario int4 NOT NULL,');
     Add('	dataalteracao timestamptz NULL,');
     Add('	idusuarioalteracao int4 NULL,');
     Add('	nome varchar(100) NOT NULL,');
     Add('	cidade varchar(100) NOT NULL,');
     Add('	uf bpchar(2) NOT NULL,');
     Add('	cpf_cnpj varchar(30) NULL,');
     Add('	telefone_fixo varchar(20) NULL,');
     Add('	celular varchar(20) NULL,');
     Add('	email varchar(100) NULL,');
     Add('	contatopessoa varchar(100) NULL,');
     Add('senha varchar(20) NULL,');
     Add('	syncaws int4 NOT NULL DEFAULT 0,');
     Add('	razaosocial varchar(100) NULL,');
     Add('	inscricaoestadual varchar(20) NULL,');
     Add('	syncfaz int4 NOT NULL DEFAULT 0)');
     ExecSQL;
    end;
   end;
 end;
 vQryAux.Free;
end;

function TdmUpdate.VerificaCampoExiste(Acampo, Atabela: string):Boolean;
var
 vQryAux:TFDQuery;
 vExiste:integer;
begin
 vExiste :=0;
 vQryAux:=TFDQuery.Create(nil);
 vQryAux.Connection := dmDB.FDConn;
 vExiste:=0;
 with vQryAux,vQryAux.SQL do
 begin
   Clear;
   Add('PRAGMA table_info('+Atabela+')');
   Open;
   while not vQryAux.eof do
   begin
     if Acampo=vQryAux.FieldByName('name').AsString then
       vExiste:=1;
     vQryAux.Next;
   end;
 end;
 Result:=vExiste=1;
 vQryAux.Free;
end;

function TdmUpdate.VerificaTabelaExiste(Atabela: string): Boolean;
var
 vQryAux:TFDQuery;
 vExiste:integer;
begin
 vExiste :=0;
 vQryAux:=TFDQuery.Create(nil);
 vQryAux.Connection := dmDB.FDConn;
 vExiste:=0;
 with vQryAux,vQryAux.SQL do
 begin
   Clear;
   Add('PRAGMA table_info('+Atabela+')');
   Open;
   Result:=vQryAux.IsEmpty;
 end;
 vQryAux.Free;
end;

function TdmUpdate.VerificaTabelasExiste(NomeTabela: string): Boolean;
var
 vQryAux:TFDQuery;
begin
 vQryAux:=TFDQuery.Create(nil);
 vQryAux.Connection := dmDB.FDConn;
 with vQryAux,vQryAux.SQL do
 begin
   Clear;
   Add('SELECT count(*) Qtd FROM sqlite_master');
   Add('WHERE type='+QuotedStr('table')+' AND name='+NomeTabela.QuotedString);
   Open;
   if FieldByName('Qtd').AsInteger=0 then
    Result:=false
   else
    Result:=true;
 end;
 vQryAux.Free;
end;

end.
