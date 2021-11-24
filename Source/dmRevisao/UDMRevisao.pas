unit UDMRevisao;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  System.Rtti, FMX.Grid.Style, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FMX.ActnList,
  System.Actions, FMX.TabControl, FMX.Ani, FMX.ScrollBox, FMX.Grid, FMX.Edit,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, Fmx.Bind.Grid,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope,
  FMX.Menus;
type
  TdmRevisao = class(TDataModule)
    TAuxRevisaoItem: TFDQuery;
    TPlanorevisao: TFDQuery;
    TPlanoRevisaoMaquinas: TFDQuery;
    dsRevisao: TDataSource;
    TPlanoRevisaoMaquinasid: TIntegerField;
    TPlanoRevisaoMaquinasstatus: TIntegerField;
    TPlanoRevisaoMaquinasdatareg: TSQLTimeStampField;
    TPlanoRevisaoMaquinasidusuario: TIntegerField;
    TPlanoRevisaoMaquinasdataalteracao: TSQLTimeStampField;
    TPlanoRevisaoMaquinasidusuarioalteracao: TIntegerField;
    TPlanoRevisaoMaquinasidrevisao: TIntegerField;
    TPlanoRevisaoMaquinasidmaquina: TIntegerField;
    TPlanoRevisaoMaquinassyncaws: TIntegerField;
    TPlanoRevisaoMaquinassyncfaz: TIntegerField;
    TPlanoRevisaoMaquinasmodelo: TWideStringField;
    TPlanoRevisaoMaquinasprefixo: TWideStringField;
    TPlanoRevisaoMaquinasplaca: TWideStringField;
    TPlanoRevisaoMaquinascombustivel: TIntegerField;
    TPlanoRevisaoMaquinasultimarevisao: TDateField;
    TPlanoRevisaoMaquinashorimetroultimarev: TBCDField;
    TRevisaoMaquinaAplLista: TFDQuery;
    TRevisaoMaquinaItens: TFDQuery;
    qryAux: TFDQuery;
    TRevisaoMaquinaApl: TFDQuery;
    TRevisaoServicos: TFDQuery;
    TRevisaoMaquinaAplid: TIntegerField;
    TRevisaoMaquinaAplstatus: TWideStringField;
    TRevisaoMaquinaApldatareg: TWideStringField;
    TRevisaoMaquinaAplidusuario: TWideStringField;
    TRevisaoMaquinaApldataalteracao: TWideStringField;
    TRevisaoMaquinaAplidusuarioalteracao: TWideStringField;
    TRevisaoMaquinaAplidplanorevisao: TWideStringField;
    TRevisaoMaquinaAplidmaquina: TWideStringField;
    TRevisaoMaquinaAplobservacao: TStringField;
    TRevisaoMaquinaApldatainicio: TDateField;
    TRevisaoMaquinaApldatafim: TDateField;
    TRevisaoMaquinaAplsyncaws: TWideStringField;
    TRevisaoMaquinaAplsyncfaz: TWideStringField;
    TRevisaoMaquinaAplidresponsavel: TWideStringField;
    TRevisaoMaquinaAplhorimetro: TBCDField;
    TRevisaoMaquinaApltipo: TWideStringField;
    TRevisaoMaquinaAplhorimetroproxima: TBCDField;
    TPlanoRevisaoItens: TFDQuery;
    TPlanoRevisaoItenstipoStr: TWideStringField;
    TPlanoRevisaoItensid: TIntegerField;
    TPlanoRevisaoItensstatus: TWideStringField;
    TPlanoRevisaoItensdatareg: TWideStringField;
    TPlanoRevisaoItensidusuario: TWideStringField;
    TPlanoRevisaoItensdataalteracao: TWideStringField;
    TPlanoRevisaoItensidusuarioalteracao: TWideStringField;
    TPlanoRevisaoItensidrevisao: TWideStringField;
    TPlanoRevisaoItenssyncaws: TWideStringField;
    TPlanoRevisaoItenssyncfaz: TWideStringField;
    TPlanoRevisaoItensidproduto: TWideStringField;
    TPlanoRevisaoItensqtde: TBCDField;
    TPlanoRevisaoItenstipo: TWideStringField;
    TPlanoRevisaoItensobservacao: TStringField;
    TPlanoRevisaoItensitem: TStringField;
    TPlanoRevisaoItensiditem: TWideStringField;
    TPlanoRevisaoItensitem_1: TStringField;
    TPlanoRevisaoItenscodigofabricante: TStringField;
    TPlanoRevisaoItensproduto: TStringField;
    TRevisaoMaquinaAplListaid: TIntegerField;
    TRevisaoMaquinaAplListastatus: TWideStringField;
    TRevisaoMaquinaAplListadatareg: TWideStringField;
    TRevisaoMaquinaAplListaidusuario: TWideStringField;
    TRevisaoMaquinaAplListadataalteracao: TWideStringField;
    TRevisaoMaquinaAplListaidusuarioalteracao: TWideStringField;
    TRevisaoMaquinaAplListaidplanorevisao: TWideStringField;
    TRevisaoMaquinaAplListaidmaquina: TWideStringField;
    TRevisaoMaquinaAplListaobservacao: TStringField;
    TRevisaoMaquinaAplListadatainicio: TDateField;
    TRevisaoMaquinaAplListadatafim: TDateField;
    TRevisaoMaquinaAplListasyncaws: TWideStringField;
    TRevisaoMaquinaAplListasyncfaz: TWideStringField;
    TRevisaoMaquinaAplListaidresponsavel: TWideStringField;
    TRevisaoMaquinaAplListahorimetro: TBCDField;
    TRevisaoMaquinaAplListatipo: TWideStringField;
    TRevisaoMaquinaAplListahorimetroproxima: TBCDField;
    TRevisaoMaquinaAplListaPlanoRevisao: TWideStringField;
    TRevisaoMaquinaAplListaprefixo: TStringField;
    TRevisaoMaquinaAplListaresponsavel: TStringField;
    TRevisaoMaquinaAplListaTipoRevisao: TWideStringField;
    TPlanorevisaoid: TIntegerField;
    TPlanorevisaonome: TStringField;
    TPlanorevisaointervalohoras: TBCDField;
    TRevisaoMaquinaItensid: TFDAutoIncField;
    TRevisaoMaquinaItensstatus: TWideStringField;
    TRevisaoMaquinaItensdatareg: TWideStringField;
    TRevisaoMaquinaItensidusuario: TWideStringField;
    TRevisaoMaquinaItensdataalteracao: TWideStringField;
    TRevisaoMaquinaItensidusuarioalteracao: TWideStringField;
    TRevisaoMaquinaItensidrevisao: TWideStringField;
    TRevisaoMaquinaItenssyncaws: TWideStringField;
    TRevisaoMaquinaItenssyncfaz: TWideStringField;
    TRevisaoMaquinaItensidproduto: TWideStringField;
    TRevisaoMaquinaItensqtde: TBCDField;
    TRevisaoMaquinaItensitem: TStringField;
    TRevisaoMaquinaItenstipo: TWideStringField;
    TRevisaoMaquinaItensobservacao: TStringField;
    TRevisaoMaquinaItensiditem: TWideStringField;
    TRevisaoMaquinaItensnome: TStringField;
    TRevisaoMaquinaItenscodigofabricante: TStringField;
    TRevisaoMaquinaItenstipoStr: TWideStringField;
    TAuxRevisaoItemid: TIntegerField;
    TAuxRevisaoItemstatus: TWideStringField;
    TAuxRevisaoItemdatareg: TWideStringField;
    TAuxRevisaoItemidusuario: TWideStringField;
    TAuxRevisaoItemdataalteracao: TWideStringField;
    TAuxRevisaoItemidusuarioalteracao: TWideStringField;
    TAuxRevisaoItemnome: TStringField;
    TAuxRevisaoItemgrupo: TStringField;
    TAuxRevisaoItemsyncaws: TWideStringField;
    TAuxRevisaoItemsyncfaz: TWideStringField;
    TRevisaoServicosid: TIntegerField;
    TRevisaoServicosstatus: TWideStringField;
    TRevisaoServicosdatareg: TWideStringField;
    TRevisaoServicosidusuario: TWideStringField;
    TRevisaoServicosdataalteracao: TWideStringField;
    TRevisaoServicosidusuarioalteracao: TWideStringField;
    TRevisaoServicostiposervico: TWideStringField;
    TRevisaoServicosidrevisao: TWideStringField;
    TRevisaoServicosdescricao: TStringField;
    TRevisaoServicosresponsavel: TStringField;
    TRevisaoServicosvalortotal: TBCDField;
    TRevisaoServicossyncaws: TWideStringField;
    TRevisaoServicossyncfaz: TWideStringField;
    TRevisaoServicosdatarealizado: TDateField;
    procedure TRevisaoItensReconcileError(DataSet: TFDDataSet; E: EFDException;
      UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
    procedure TAuxRevisaoItemReconcileError(DataSet: TFDDataSet;
      E: EFDException; UpdateKind: TFDDatSRowState;
      var Action: TFDDAptReconcileAction);
    procedure TPlanorevisaoReconcileError(DataSet: TFDDataSet; E: EFDException;
      UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
    procedure TPlanoRevisaoMaquinasReconcileError(DataSet: TFDDataSet;
      E: EFDException; UpdateKind: TFDDatSRowState;
      var Action: TFDDAptReconcileAction);
    procedure TRevisaoMaquinaItensReconcileError(DataSet: TFDDataSet;
      E: EFDException; UpdateKind: TFDDatSRowState;
      var Action: TFDDAptReconcileAction);
    procedure TRevisaoMaquinaAplListaReconcileError(DataSet: TFDDataSet;
      E: EFDException; UpdateKind: TFDDatSRowState;
      var Action: TFDDAptReconcileAction);
  private
    { Private declarations }
  public
    vIdPlanoSelect,vNomePlanoSelect:string;

    procedure GeraListaItensTMP(IdPlano:string);
    procedure InsereItensTMP(IdItem,idProduto,Qtde:string);
    procedure MudaStatusItemTMP(idItem,idStatus:string);
    procedure EditaItemListaTMP(IdItem,IdProduto,Qtde:string);
    function  VerificaItensConfirmados(IdPlano:string):string;
    function  RetornaIdMaxRevisao:string;
    procedure AbreRevisaoApl(Filtro:string);
    procedure AbreRevisaoAplInsertEdit(Filtro: string);
    procedure AbreItensRevisaoApl(vIdRevisao:string);
    procedure AbrirServicosRevisao(vIdRevisao:string);
    procedure AbrePlanoRevisaoMaquina(vFiltro:string);
    procedure AtualizaMaquinaProximaRevisao(vIdMaquina,DataUltima,HoraUltim,HoraProxima:string);
    procedure MudaStatusEditItemSync(Atabela,AiD:String);
    procedure MudaStatusDelete(Atabela,AiD:String);
    procedure MudaStatusConfirma(Atabela,AiD:String);
    procedure AbriPlanoRevisaoItens(vIdPlanoRev:string);
    function  RetornaPlanoRevisaoMaquinas(vidMaquina:string):string;
    procedure InsereNovoItemRevisao(idrevisao,idproduto,qtde,item,tipo,
    observacao,iditem:string);
    procedure UpdateItemRevisao(id,iditem,item,qtd,observacao,
    idProduto:string);
    procedure MudaStatusRevisaoEditSync(AiD:String);
    function RetornaMaxIdRevisao:string;
    procedure IsereItensRevisao(idPlano,idRevisao:string);
    function  VerificaCadastroExiste(campo,tabela,valor:string):Boolean;
    procedure DeletaRevisao(idRev:string);
    procedure DeletaRevisaoitem(id: string);
    function  RetornaItensRevisaoConfirmados(vIdRev:string):integer;

  end;

var
  dmRevisao: TdmRevisao;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses UDataContext;

{$R *.dfm}



procedure TdmRevisao.AbreItensRevisaoApl(vIdRevisao: string);
begin
 with TRevisaoMaquinaItens,TRevisaoMaquinaItens.SQL do
 begin
   Clear;
   Add('select a.*,b.nome,b.codigofabricante,');
   Add('case');
   Add(' when a.tipo=0 then ''Manutenção''');
   Add(' when a.tipo=1 then ''Lubrificação''');
   Add(' when a.tipo=2 then ''Verificação''');
   Add('end tipoStr');
   Add('from revisaomaquinaitens a');
   Add('join produtos b on a.idproduto=b.id');
   Add('where a.status>-1');
   Add('and a.idrevisao='+vIdRevisao);
   Open;
 end;
end;


procedure TdmRevisao.AbrePlanoRevisaoMaquina(vFiltro: string);
begin
  with TPlanorevisao,TPlanorevisao.SQL do
  begin
    Clear;
    Add('select * from planorevisao');
    Add(vFiltro);
    Open;
  end;
end;

procedure TdmRevisao.AbreRevisaoApl(Filtro: string);
begin
 with TRevisaoMaquinaAplLista,TRevisaoMaquinaAplLista.SQL do
 begin
   Clear;
   Add('select');
   Add(' c.*,');
   Add(' coalesce(r.nome,''CORRETIVA'') PlanoRevisao,');
   Add(' m.prefixo,');
   Add(' u.nome responsavel,');
   Add('case');
   Add(' when C.TIPO=0 then ''PREVENTIVA''');
   Add(' when C.TIPO=1 then ''CORRETIVA''');
   Add('end TipoRevisao');
   Add('from revisaomaquina c');
   Add('left join planorevisao r on r.id=c.idplanorevisao');
   Add('join maquinaveiculo m on m.id=c.idmaquina');
   Add('join usuario u on u.id=c.idresponsavel');
   Add('where c.status>-1');
   Add(Filtro);
   Open;
 end;
end;

procedure TdmRevisao.AbreRevisaoAplInsertEdit(Filtro: string);
begin
 with TRevisaoMaquinaApl,TRevisaoMaquinaApl.SQL do
 begin
   Clear;
   Add('select * from revisaomaquina a');
   Add('where a.status>-1');
   if Filtro.Length>0 then
    Add('and id='+Filtro);
   Open;
 end;
end;

procedure TdmRevisao.AbriPlanoRevisaoItens(vIdPlanoRev: string);
begin
 with TPlanoRevisaoItens,TPlanoRevisaoItens.SQL do
 begin
   Clear;
   Add('select');
   Add('cast(case');
   Add(' when a.tipo =0 then ''MANUTENÇÃO''');
   Add(' when a.tipo =1 then ''LUBRIFICAÇÃO''');
   Add(' when a.tipo =2 then ''VERIFICAÇÃO''');
   Add('end as varchar(13)) tipoStr,');
   Add('a.*,Item,p.codigofabricante,p.nome produto  from planorevisaoitens a');
   Add('left join produtos p on p.id=a.idproduto');
   Add('where a.status>-1 and a.idrevisao=1');
   Add('order by a.tipo,a.item');
   Open;
 end;
end;

procedure TdmRevisao.AbrirServicosRevisao(vIdRevisao: string);
begin
 with TRevisaoServicos,TRevisaoServicos.SQL do
 begin
   Clear;
   Add('select * from servicomanutencao');
   Add('where status=1 and idrevisao='+vIdRevisao);
   Open;
 end;
end;

procedure TdmRevisao.AtualizaMaquinaProximaRevisao(vIdMaquina,DataUltima,HoraUltim,HoraProxima: string);
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('update maquinaveiculo set horimetroultimarev='+HoraUltim);
   Add(',horimetroproximarevisao='+HoraProxima);
   Add(',ultimarevisao='+DataUltima);
   Add('where ID='+vIdMaquina);
   try
    ExecSQL;
   except
     on E : Exception do
      ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
    end;
 end;
end;

procedure TdmRevisao.DeletaRevisao(idRev: string);
begin
with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('DELETE FROM revisaomaquina');
   Add('where id='+idRev);
   try
    ExecSQL;
   except
     on E : Exception do
      ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
    end;
 end;
end;

procedure TdmRevisao.DeletaRevisaoitem(id: string);
begin
with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('DELETE FROM revisaomaquinaitens');
   Add('where id='+id);
   try
    ExecSQL;
   except
     on E : Exception do
      ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
    end;
 end;
end;

procedure TdmRevisao.EditaItemListaTMP(IdItem, IdProduto, Qtde: string);
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('update tmprevisaoitens set idproduto='+IdProduto);
   Add(',qtde='+Qtde);
   Add('where idItem='+IdItem);
   try
    ExecSQL;
   except
     on E : Exception do
      ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
    end;
 end;
end;

procedure TdmRevisao.GeraListaItensTMP(IdPlano: string);
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('delete from tmprevisaoitens');
   ExecSQL;

   Clear;
   Add('insert into tmprevisaoitens(idrevisao,iditem,idproduto,qtde)');
   Add('(select');
   Add('idrevisao,');
   Add('iditem,');
   Add('idproduto,');
   Add('qtde');
   Add('from planorevisaoitens');
   Add('where idrevisao='+idPlano+')');
   try
    ExecSQL;
   except
     on E : Exception do
      ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
    end;
 end;
end;

procedure TdmRevisao.InsereItensTMP(IdItem, idProduto, Qtde: string);
begin
  with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('insert into tmprevisaoitens(idrevisao,iditem,idproduto,qtde)');
   Add('values(');
   Add('0,');
   Add(IdItem+',');
   Add(idproduto+',');
   Add(StringReplace(qtde,',','.',[rfReplaceAll])+')');
   try
    ExecSQL;
   except
     on E : Exception do
      ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
    end;
 end;
end;

procedure TdmRevisao.InsereNovoItemRevisao(idrevisao,idproduto,qtde,item,tipo,
 observacao,iditem: string);
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('INSERT INTO revisaomaquinaitens');
   Add('(idusuario,idrevisao,idproduto,qtde,item,tipo,observacao,iditem)');
   Add('values(');
   Add(dmDB.vIdUser+',');
   Add(idrevisao+',');
   Add(idproduto+',');
   Add(qtde+',');
   Add(item.QuotedString+',');
   Add(tipo+',');
   Add(observacao.QuotedString+',');
   Add(iditem+')');
   ExecSQL;
 end;
end;

procedure TdmRevisao.IsereItensRevisao(idPlano,idRevisao: string);
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('INSERT INTO revisaomaquinaitens');
   Add('(idusuario,idrevisao,idproduto,qtde,item,tipo,iditem)');
   Add('select idusuario,'+idRevisao+',idproduto,qtde,item,tipo,iditem');
   Add('from planorevisaoitens');
   Add('where idrevisao='+idPlano);
   try
    ExecSQL;
   except
    on E : Exception do
     ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
   end;
 end;
end;

procedure TdmRevisao.MudaStatusConfirma(Atabela, AiD: String);
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('update '+Atabela+' set status=2');
   Add('where id='+AiD);
   ExecSQL;
 end;
end;

procedure TdmRevisao.MudaStatusDelete(Atabela, AiD: String);
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('update '+Atabela+' set status=-1');
   Add('where id='+AiD);
   ExecSQL;
 end;
end;

procedure TdmRevisao.MudaStatusEditItemSync(Atabela, AiD: String);
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('update '+Atabela+' set syncaws=0');
   Add('where id='+AiD);
   ExecSQL;
 end;
end;

procedure TdmRevisao.MudaStatusItemTMP(idItem, idStatus: string);
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('update tmprevisaoitens set status='+idStatus);
   Add('where iditem='+idItem);
   ExecSQL;
 end;
end;

procedure TdmRevisao.MudaStatusRevisaoEditSync(AiD: String);
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('update revisaomaquina set syncaws=0');
   Add('where id='+AiD);
   ExecSQL;
 end;
end;

function TdmRevisao.RetornaIdMaxRevisao: string;
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('select max(id) max_id from revisaomaquina');
   Open;
   Result := FieldByName('max_id').AsString;
 end;
end;

function TdmRevisao.RetornaItensRevisaoConfirmados(vIdRev: string): integer;
begin
 with qryAux,qryAux.SQL do
 begin
  Clear;
  Add('select count(*) qtd from revisaomaquinaitens');
  Add('where status=2 and idrevisao='+vIdRev);
  Open;
  Result := FieldByName('qtd').AsInteger;
 end;
end;

function TdmRevisao.RetornaMaxIdRevisao: string;
begin
 with qryAux,qryAux.SQL do
 begin
  Clear;
  Add('select id maxid from revisaomaquina');
  Open;
  Result := FieldByName('maxid').AsString;
 end;
end;

function TdmRevisao.RetornaPlanoRevisaoMaquinas(vidMaquina:string): string;
var
 vIds:string;
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('select idrevisao from planorevisaomaquinas p');
   Add('where status=1 and idmaquina ='+vidMaquina);
   Open;
   while not qryAux.eof do
   begin
     vIds := vIds+FieldByName('idrevisao').AsString+',';
     qryAux.next;
   end;
   Result := copy(vIds,0,vIds.length-1);
 end;
end;

procedure TdmRevisao.TAuxRevisaoItemReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
   ShowMessage(e.Message);
end;

procedure TdmRevisao.TRevisaoItensReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
   ShowMessage(e.Message);
end;

procedure TdmRevisao.TRevisaoMaquinaAplListaReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
 ShowMessage(e.Message);
end;

procedure TdmRevisao.TRevisaoMaquinaItensReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
 ShowMessage(e.Message);
end;

procedure TdmRevisao.TPlanoRevisaoMaquinasReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
    ShowMessage(e.Message);
end;

procedure TdmRevisao.TPlanorevisaoReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
    ShowMessage(e.Message);
end;

procedure TdmRevisao.UpdateItemRevisao(id, iditem, item, qtd, observacao,
  idProduto: string);
begin
 with qryAux,qryAux.SQL do
  begin
   Clear;
   Add('update revisaomaquinaitens set');
   Add('iditem='+iditem);
   if idProduto.length>0 then
    Add(',idproduto='+idProduto);
   Add(',item='+item.QuotedString);
   Add(',qtde='+qtd);
   Add(',observacao='+observacao.QuotedString);
   Add('where id='+id);
   ExecSQL;
  end;
end;

function TdmRevisao.VerificaCadastroExiste(campo, tabela,
  valor: string): Boolean;
begin
 with qryAux,qryAux.SQL do
  begin
     Clear;
     Add('select *  from '+tabela);
     Add('where '+campo+'='+valor);
     Open;
     Result := qryAux.IsEmpty;
  end;
end;

function TdmRevisao.VerificaItensConfirmados(IdPlano: string): string;
begin
  with qryAux,qryAux.SQL do
  begin
     Clear;
     Add('select count(*) qtd from tmprevisaoitens');
     Add('where status=2');
     Open;
     Result := FieldByName('qtd').AsString;
  end;
end;

end.
