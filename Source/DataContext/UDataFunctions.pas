unit UDataFunctions;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmFunctions = class(TDataModule)
    FDQuery1: TFDQuery;
  private
    { Private declarations }
  public
    function RetornaIdCultura(Anome:string):string;
    function RetornaIdCobertura(Anome:string):string;
    function RetornaIdVariedade(Anome: string): string;
    function RetornaNomeMaquina(Anome: string): string;
    function RetornaIdTalhao(Anome: string): string;
  end;

var
  dmFunctions: TdmFunctions;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses UDataContext, UPrincipal;

{$R *.dfm}

function TdmFunctions.RetornaIdCobertura(Anome: string): string;
var
 vQry:TFDQuery;
begin
 vQry := TFDQuery.Create(nil);
 vQry.Connection := dmDB.FDConn;
 with vQry,vQry.sql do
 begin
   Clear;
   Add('select * from auxcobertura');
   Add('WHERE STATUS=1 AND NOME='+Anome.QuotedString);
   Open;
   Result := FieldByName('id').AsString;
 end;
 vQry.Free;
end;

function TdmFunctions.RetornaIdCultura(Anome: string): string;
var
 vQry:TFDQuery;
begin
 vQry := TFDQuery.Create(nil);
 vQry.Connection := dmDB.FDConn;
 with vQry,vQry.sql do
 begin
   Clear;
   Add('SELECT * FROM auxculturas');
   Add('WHERE STATUS=1 AND NOME='+Anome.QuotedString);
   Open;
   Result := FieldByName('id').AsString;
 end;
 vQry.Free;
end;

function TdmFunctions.RetornaIdVariedade(Anome: string): string;
var
 vQry:TFDQuery;
begin
 vQry := TFDQuery.Create(nil);
 vQry.Connection := dmDB.FDConn;
 with vQry,vQry.sql do
 begin
   Clear;
   Add('select * from auxcultivares');
   Add('WHERE STATUS=1 AND NOME='+Anome.QuotedString);
   Open;
   Result := FieldByName('id').AsString;
 end;
 vQry.Free;
end;
function TdmFunctions.RetornaNomeMaquina(Anome: string): string;
var
 vQry:TFDQuery;
begin
 vQry := TFDQuery.Create(nil);
 vQry.Connection := dmDB.FDConn;
 with vQry,vQry.sql do
 begin
   Clear;
   Add('select * from maquinaveiculo');
   Add('where status=1 and prefixo='+Anome.QuotedString);
   Open;
   frmPrincipal.vMarcaSelect    :=FieldByName('marca').AsString;
   frmPrincipal.vModeloSelect   :=FieldByName('modelo').AsString;
   frmPrincipal.vPlacaSelect    :=FieldByName('placa').AsString;
   frmPrincipal.vUltimaRevisao  :=FieldByName('ultimarevisao').AsString;
   frmPrincipal.vHorimetro      :=FieldByName('horimetroultimarev').AsString;
   frmPrincipal.vProximaRev     :=FieldByName('horimetroproximarevisao').AsString;
   Result := FieldByName('id').AsString;
 end;
 vQry.Free;
end;

function TdmFunctions.RetornaIdTalhao(Anome: string): string;
var
 vQry:TFDQuery;
begin
 vQry := TFDQuery.Create(nil);
 vQry.Connection := dmDB.FDConn;
 with vQry,vQry.sql do
 begin
   Clear;
   Add('select * from talhoes');
   Add('where status=1 and qrcode=:TAG');
   Add('or qrcodesaida=:TAG');
   ParamByName('TAG').AsString := Anome;
   Open;
   Result := FieldByName('id').AsString;
 end;
 vQry.Free;
end;

end.
