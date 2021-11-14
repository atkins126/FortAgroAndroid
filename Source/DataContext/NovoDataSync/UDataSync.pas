unit UDataSync;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet,System.IOUtils, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, FireDAC.Stan.StorageBin,
  System.JSON,IdHashMessageDigest,System.JSON.Writers,System.JSON.Types,Data.DBXPlatform,
  FireDAC.Stan.StorageJSON;

type
  TdmSync = class(TDataModule)
    qryOpSafraSync: TFDQuery;
    qryOpSafraSyncid: TIntegerField;
    qryOpSafraSyncstatus: TWideStringField;
    qryOpSafraSyncdatareg: TWideStringField;
    qryOpSafraSyncidusuario: TWideStringField;
    qryOpSafraSyncdataalteracao: TWideStringField;
    qryOpSafraSyncidusuarioalteracao: TWideStringField;
    qryOpSafraSyncidsafra: TWideStringField;
    qryOpSafraSyncidoperacao: TWideStringField;
    qryOpSafraSyncdatainicio: TDateField;
    qryOpSafraSyncdatafim: TDateField;
    qryOpSafraSyncobservacao: TStringField;
    qryOpSafraSyncidtalhao: TWideStringField;
    qryOpSafraSyncidresponsavel: TWideStringField;
    qryOpSafraSyncareaprevista: TBCDField;
    qryOpSafraSyncarearealizada: TBCDField;
    qryOpSafraSyncFlagSync: TIntegerField;
    qryOpSafraSyncdataSync: TDateTimeField;
    qryOpSafraSyncfinalidade: TStringField;
    qryOpSafraSyncidtipoaplicacaosolido: TStringField;
    qryOpSafraSyncidcultura: TIntegerField;
    qryOpSafraSyncidvariedade: TIntegerField;
    qryOpSafraSyncidreceituario: TIntegerField;
    qryOpSafraSynctipoterraaereo: TStringField;
    qryOpSafraMaquinasSync: TFDQuery;
    qryOpSafraProdutosSync: TFDQuery;
    qryOpSafraProdutosSyncid: TIntegerField;
    qryOpSafraProdutosSyncstatus: TWideStringField;
    qryOpSafraProdutosSyncdatareg: TWideStringField;
    qryOpSafraProdutosSyncidusuario: TWideStringField;
    qryOpSafraProdutosSyncdataalteracao: TWideStringField;
    qryOpSafraProdutosSyncidusuarioalteracao: TWideStringField;
    qryOpSafraProdutosSyncidoperacaotalhao: TWideStringField;
    qryOpSafraProdutosSyncidproduto: TWideStringField;
    qryOpSafraProdutosSyncqtdeutilidado: TWideStringField;
    qryOpSafraProdutosSyncobservacao: TStringField;
    qryOpSafraProdutosSyncdata: TDateField;
    qryOpSafraOocorrencisSync: TFDQuery;
    qryOpSafraOocorrencisSyncid: TFDAutoIncField;
    qryOpSafraOocorrencisSyncstatus: TWideStringField;
    qryOpSafraOocorrencisSyncdatareg: TWideStringField;
    qryOpSafraOocorrencisSyncidusuario: TIntegerField;
    qryOpSafraOocorrencisSyncdataalteracao: TWideStringField;
    qryOpSafraOocorrencisSyncidusuarioalteracao: TWideStringField;
    qryOpSafraOocorrencisSyncidoperacaotalhao: TWideStringField;
    qryOpSafraOocorrencisSyncdataocorrencia: TDateField;
    qryOpSafraOocorrencisSyncidtipoocorrencia: TWideStringField;
    qryOpSafraOocorrencisSynchora: TTimeField;
    qryOpSafraOocorrencisSyncdescricao: TStringField;
    qryOpSafraOocorrencisSyncdata: TDateField;
    IdHTTP1: TIdHTTP;
    qryOpSafraPulverizacao: TFDQuery;
    qryOpSafraPulverizacaoid: TIntegerField;
    qryOpSafraPulverizacaostatus: TWideStringField;
    qryOpSafraPulverizacaodatareg: TWideStringField;
    qryOpSafraPulverizacaoidusuario: TWideStringField;
    qryOpSafraPulverizacaodataalteracao: TWideStringField;
    qryOpSafraPulverizacaoidusuarioalteracao: TWideStringField;
    qryOpSafraPulverizacaoidsafra: TWideStringField;
    qryOpSafraPulverizacaoidoperacao: TWideStringField;
    qryOpSafraPulverizacaodatainicio: TDateField;
    qryOpSafraPulverizacaodatafim: TDateField;
    qryOpSafraPulverizacaoobservacao: TStringField;
    qryOpSafraPulverizacaoidtalhao: TWideStringField;
    qryOpSafraPulverizacaoidresponsavel: TWideStringField;
    qryOpSafraPulverizacaoareaprevista: TBCDField;
    qryOpSafraPulverizacaoarearealizada: TBCDField;
    qryOpSafraPulverizacaoFlagSync: TIntegerField;
    qryOpSafraPulverizacaodataSync: TDateTimeField;
    qryOpSafraPulverizacaofinalidade: TStringField;
    qryOpSafraPulverizacaoidtipoaplicacaosolido: TStringField;
    qryOpSafraPulverizacaoidcultura: TIntegerField;
    qryOpSafraPulverizacaoidvariedade: TIntegerField;
    qryOpSafraPulverizacaoidreceituario: TIntegerField;
    qryOpSafraPulverizacaotipoterraaereo: TStringField;
    qryOpSafraPulverizacaoMaquina: TFDQuery;
    qryOpSafraPulverizacaoMaquinaid: TIntegerField;
    qryOpSafraPulverizacaoMaquinastatus: TWideStringField;
    qryOpSafraPulverizacaoMaquinaidoperacaotalhao: TWideStringField;
    qryOpSafraPulverizacaoMaquinaidmaquina: TWideStringField;
    qryOpSafraPulverizacaoMaquinaoperador: TStringField;
    qryOpSafraPulverizacaoMaquinaobservacao: TStringField;
    qryOpSafraPulverizacaoMaquinadata: TDateField;
    qryOpSafraPulverizacaoMaquinaidUsuario: TIntegerField;
    qryOpSafraPulverizacaoMaquinaidTalhao: TIntegerField;
    qryOpSafraPulverizacaoProdutos: TFDQuery;
    qryOpSafraPulverizacaoProdutosid: TIntegerField;
    qryOpSafraPulverizacaoProdutosstatus: TWideStringField;
    qryOpSafraPulverizacaoProdutosdatareg: TWideStringField;
    qryOpSafraPulverizacaoProdutosidusuario: TWideStringField;
    qryOpSafraPulverizacaoProdutosdataalteracao: TWideStringField;
    qryOpSafraPulverizacaoProdutosidusuarioalteracao: TWideStringField;
    qryOpSafraPulverizacaoProdutosidoperacaotalhao: TWideStringField;
    qryOpSafraPulverizacaoProdutosidproduto: TWideStringField;
    qryOpSafraPulverizacaoProdutosqtdeutilidado: TWideStringField;
    qryOpSafraPulverizacaoProdutosobservacao: TStringField;
    qryOpSafraPulverizacaoProdutosdata: TDateField;
    qryOpSafraPulverizacaoProdutosidTalhao: TIntegerField;
    qryOpSafraPulverizacaoOcorrencia: TFDQuery;
    qryOpSafraPulverizacaoOcorrenciaid: TFDAutoIncField;
    qryOpSafraPulverizacaoOcorrenciastatus: TWideStringField;
    qryOpSafraPulverizacaoOcorrenciadatareg: TWideStringField;
    qryOpSafraPulverizacaoOcorrenciaidusuario: TIntegerField;
    qryOpSafraPulverizacaoOcorrenciadataalteracao: TWideStringField;
    qryOpSafraPulverizacaoOcorrenciaidusuarioalteracao: TWideStringField;
    qryOpSafraPulverizacaoOcorrenciaidoperacaotalhao: TWideStringField;
    qryOpSafraPulverizacaoOcorrenciadataocorrencia: TDateField;
    qryOpSafraPulverizacaoOcorrenciaidtipoocorrencia: TWideStringField;
    qryOpSafraPulverizacaoOcorrenciahora: TTimeField;
    qryOpSafraPulverizacaoOcorrenciadescricao: TStringField;
    qryOpSafraPulverizacaoOcorrenciadata: TDateField;
    qryOpSafraPulverizacaoidOpMaster: TIntegerField;
    qryOpSafraPulverizacaoMaquinahorainicio: TBCDField;
    qryOpSafraPulverizacaoMaquinahorafim: TBCDField;
    qryOpSafraPulverizacaoMaquinahoraparada: TBCDField;
    qryOpSafraPulverizacaoMaquinaHorasTalhao: TWideStringField;
    qryOpSafraPulverizacaoProdutosqtdTalhao: TLargeintField;
    TSyncReceituario: TFDQuery;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    TSyncDetReceituario: TFDQuery;
    qryAux: TFDQuery;
    TSyncDetReceituarioTalhao: TFDQuery;
    TSyncVazaoOperacao: TFDQuery;
    TSyncVazaoOperacaoid: TIntegerField;
    TSyncVazaoOperacaostatus: TWideStringField;
    TSyncVazaoOperacaodatareg: TWideStringField;
    TSyncVazaoOperacaoidusuario: TWideStringField;
    TSyncVazaoOperacaodataalteracao: TWideStringField;
    TSyncVazaoOperacaoidusuarioalteracao: TWideStringField;
    TSyncVazaoOperacaoidoperacaotalhao: TWideStringField;
    TSyncVazaoOperacaoCincoLTHA: TIntegerField;
    TSyncVazaoOperacaoDezLTHA: TIntegerField;
    TSyncVazaoOperacaoQuinzeLTHA: TIntegerField;
    TSyncVazaoOperacaoVinteLTHA: TIntegerField;
    TSyncVazaoOperacaoTrintaLTHA: TIntegerField;
    TSyncVazaoOperacaoQuarentaLTHA: TIntegerField;
    TSyncVazaoOperacaoCinquentaLTHA: TIntegerField;
    TSyncVazaoOperacaoSetentaeCincoLTHA: TIntegerField;
    TSyncVazaoOperacaoCemLTHA: TIntegerField;
    TSyncVazaoOperacaosyncaws: TWideStringField;
    TSyncVazaoOperacaosyncfaz: TWideStringField;
    TSyncStandPlantas: TFDQuery;
    TSyncStandPlantasid: TIntegerField;
    TSyncStandPlantasidUsuario: TIntegerField;
    TSyncStandPlantasDataSementes: TDateField;
    TSyncStandPlantasidCultura: TIntegerField;
    TSyncStandPlantasIdVariedade: TIntegerField;
    TSyncStandPlantasQtdeSementes: TBCDField;
    TSyncStandPlantasDataPlantas: TDateField;
    TSyncStandPlantasQtdePlantas: TBCDField;
    TSyncStandPlantassyncaws: TIntegerField;
    TSyncStandPlantasStatus: TIntegerField;
    TSyncStandPlantasidTalhao: TIntegerField;
    TSyncStandPlantassyncfaz: TIntegerField;
    qryOpSafraPulverizacaoQualidadeCobertura: TStringField;
    qryOpSafraSyncidOpMaster: TIntegerField;
    qryOpSafraSyncQualidadeCobertura: TStringField;
    TSyncAtualizaReceituario: TFDQuery;
    TSyncAtualizaReceituarioid: TFDAutoIncField;
    TSyncAtualizaReceituariostatus: TWideStringField;
    qryOpSafraSyncidcobertura: TIntegerField;
    qryOpSafraPulverizacaoidcobertura: TIntegerField;
    TSyncPluviometro: TFDQuery;
    TSyncPluviometroid: TIntegerField;
    TSyncPluviometrostatus: TWideStringField;
    TSyncPluviometrodatareg: TWideStringField;
    TSyncPluviometroidusuario: TWideStringField;
    TSyncPluviometrodataalteracao: TWideStringField;
    TSyncPluviometroidusuarioalteracao: TWideStringField;
    TSyncPluviometronome: TStringField;
    TSyncPluviometrolatitude: TStringField;
    TSyncPluviometrolongitude: TStringField;
    TSyncPluviometrosyncaws: TWideStringField;
    TSyncPluviometrosyncfaz: TWideStringField;
    TSyncPluviometroidsetor: TIntegerField;
    TSyncPluviometroTalhoes: TFDQuery;
    TSyncPluviometroTalhoesid: TIntegerField;
    TSyncPluviometroTalhoesstatus: TWideStringField;
    TSyncPluviometroTalhoesdatareg: TWideStringField;
    TSyncPluviometroTalhoesidusuario: TWideStringField;
    TSyncPluviometroTalhoesdataalteracao: TWideStringField;
    TSyncPluviometroTalhoesidusuarioalteracao: TWideStringField;
    TSyncPluviometroTalhoessyncaws: TWideStringField;
    TSyncPluviometroTalhoessyncfaz: TWideStringField;
    TSyncPluviometroTalhoesidpluviometro: TIntegerField;
    TSyncPluviometroTalhoesidtalhao: TIntegerField;
    TSyncPluviometria: TFDQuery;
    TSyncPluviometriaid: TIntegerField;
    TSyncPluviometriastatus: TWideStringField;
    TSyncPluviometriadatareg: TWideStringField;
    TSyncPluviometriaidusuario: TWideStringField;
    TSyncPluviometriadataalteracao: TWideStringField;
    TSyncPluviometriaidusuarioalteracao: TWideStringField;
    TSyncPluviometriaidpluviometro: TWideStringField;
    TSyncPluviometriaidTalhao: TIntegerField;
    TSyncPluviometriavolumemm: TBCDField;
    TSyncPluviometriadatacoleta: TDateField;
    TSyncPluviometriahora: TTimeField;
    TSyncPluviometriasyncaws: TWideStringField;
    TSyncPluviometriasyncfaz: TWideStringField;
    TSyncLocalEstoque: TFDQuery;
    TSyncLocalEstoqueid: TIntegerField;
    TSyncLocalEstoquestatus: TWideStringField;
    TSyncLocalEstoquedatareg: TWideStringField;
    TSyncLocalEstoqueidusuario: TWideStringField;
    TSyncLocalEstoquedataalteracao: TWideStringField;
    TSyncLocalEstoqueidusuarioalteracao: TWideStringField;
    TSyncLocalEstoquenome: TStringField;
    TSyncLocalEstoqueidsegmento: TWideStringField;
    TSyncLocalEstoquesyncaws: TWideStringField;
    TSyncLocalEstoquesyncfaz: TWideStringField;
    TSyncAbastecimento: TFDQuery;
    TSyncAbastecimentoOutros: TFDQuery;
    TSyncAbastecimentoOutrosid: TIntegerField;
    TSyncAbastecimentoOutrosstatus: TWideStringField;
    TSyncAbastecimentoOutrosdatareg: TWideStringField;
    TSyncAbastecimentoOutrosidusuario: TWideStringField;
    TSyncAbastecimentoOutrosdataalteracao: TWideStringField;
    TSyncAbastecimentoOutrosidusuarioalteracao: TWideStringField;
    TSyncAbastecimentoOutrosidabastecimento: TWideStringField;
    TSyncAbastecimentoOutrosidproduto: TWideStringField;
    TSyncAbastecimentoOutrosquantidade: TBCDField;
    TSyncAbastecimentoOutrossyncaws: TWideStringField;
    TSyncAbastecimentoOutrossyncfaz: TWideStringField;
    TSyncAbastecimentoid: TIntegerField;
    TSyncAbastecimentostatus: TWideStringField;
    TSyncAbastecimentodatareg: TWideStringField;
    TSyncAbastecimentoidusuario: TWideStringField;
    TSyncAbastecimentodataalteracao: TWideStringField;
    TSyncAbastecimentoidusuarioalteracao: TWideStringField;
    TSyncAbastecimentoidlocalestoque: TWideStringField;
    TSyncAbastecimentoidmaquina: TWideStringField;
    TSyncAbastecimentoidoperador: TWideStringField;
    TSyncAbastecimentovolumelt: TBCDField;
    TSyncAbastecimentocombustivel: TIntegerField;
    TSyncAbastecimentodataabastecimento: TDateField;
    TSyncAbastecimentohora: TTimeField;
    TSyncAbastecimentosyncaws: TWideStringField;
    TSyncAbastecimentosyncfaz: TWideStringField;
    TSyncAbastecimentohorimetro: TBCDField;
    TSyncPragas: TFDQuery;
    TSyncPragasid: TIntegerField;
    TSyncPragasstatus: TWideStringField;
    TSyncPragasdatareg: TWideStringField;
    TSyncPragasidusuario: TWideStringField;
    TSyncPragasdataalteracao: TWideStringField;
    TSyncPragasidusuarioalteracao: TWideStringField;
    TSyncPragasnome: TStringField;
    TSyncPragassyncaws: TWideStringField;
    TSyncPragassyncfaz: TWideStringField;
    TmonitoramentopragasPontosValores: TFDQuery;
    TmonitoramentopragasPontos: TFDQuery;
    TMonitoramentoPraga: TFDQuery;
    TMonitoramentoPragaid: TIntegerField;
    TMonitoramentoPragastatus: TWideStringField;
    TMonitoramentoPragadatareg: TWideStringField;
    TMonitoramentoPragaidusuario: TWideStringField;
    TMonitoramentoPragadataalteracao: TWideStringField;
    TMonitoramentoPragaidusuarioalteracao: TWideStringField;
    TMonitoramentoPragadataMonitoramento: TDateField;
    TMonitoramentoPragaidTalhao: TWideStringField;
    TMonitoramentoPragahoraInicio: TSQLTimeStampField;
    TMonitoramentoPragatipoAbertura: TIntegerField;
    TMonitoramentoPragahoraFim: TSQLTimeStampField;
    TMonitoramentoPragasyncaws: TWideStringField;
    TMonitoramentoPragasyncfaz: TWideStringField;
    TMonitoramentoPragaTagAbertura: TStringField;
    TMonitoramentoPragaTagFechamento: TStringField;
    TmonitoramentopragasPontosid: TIntegerField;
    TmonitoramentopragasPontosstatus: TWideStringField;
    TmonitoramentopragasPontosdatareg: TWideStringField;
    TmonitoramentopragasPontosidMonitoramento: TWideStringField;
    TmonitoramentopragasPontosdataPonto: TDateField;
    TmonitoramentopragasPontosPonto: TStringField;
    TmonitoramentopragasPontoshora: TSQLTimeStampField;
    TmonitoramentopragasPontoslatitude: TStringField;
    TmonitoramentopragasPontoslongitude: TStringField;
    TmonitoramentopragasPontossyncaws: TWideStringField;
    TmonitoramentopragasPontossyncfaz: TWideStringField;
    TmonitoramentopragasPontosValoresid: TIntegerField;
    TmonitoramentopragasPontosValoresstatus: TWideStringField;
    TmonitoramentopragasPontosValoresdatareg: TWideStringField;
    TmonitoramentopragasPontosValoresidPonto: TWideStringField;
    TmonitoramentopragasPontosValoresidPraga: TWideStringField;
    TmonitoramentopragasPontosValoreshora: TSQLTimeStampField;
    TmonitoramentopragasPontosValoressyncaws: TWideStringField;
    TmonitoramentopragasPontosValoressyncfaz: TWideStringField;
    TmonitoramentopragasPontosValorescontagem: TIntegerField;
    TmonitoramentopragasPontosValorescaracteristica: TIntegerField;
    procedure TSyncPragasReconcileError(DataSet: TFDDataSet; E: EFDException;
      UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
  private
    { Private declarations }
    procedure AbreDetReceituario(vIdReceituario:string);
    procedure AbreDetReceituarioTalhao(vIdReceituario: string);
    procedure AbreDetVazaoOperacao(vIdOP:string);
    procedure AlterarFlagSyncStand;
    procedure AlterarFlagSyncPluviometria;
    procedure AlterarFlagAbastecimento;
    procedure AlterarFlagAbastecimentoOutros;
    procedure AlteraFlagMonitoramento(vIdMonitoramento:string);
    procedure AlteraFlagMonitoramentoPontos(vIdPonto: string);
    procedure AlteraFlagMonitoramentoPontosValores(vIdPonto: string);
    procedure AbreMonitoramentoSinc(id:string);
    procedure AbreMonitoramentoPontoSinc(id:string);
    procedure AbreMonitoramentoPontoValoresSinc(id:string);
    function VerificaReceituarioExiste(id:string):Boolean;
  public
    Host,Porta:string;
    function  GetUsuarios: string;
    function  GetMaquinas: string;
    function  GetProdutos: string;
    function  GetOperacoes: string;
    function  GetAreas: string;
    function  GetSetor: string;
    function  GetCoberturas: string;
    function  GetTalhoes: string;
    function  GetSafra: string;
    function  GetCultivares: string;
    function  GetCulturas: string;
    function  GetTipoOcorrencia: string;
    function  GetTipoAplicacaoSolido: string;
    function  GetReceituario: string;

    function  GetDetReceituario(idRec: string):string;
    function  GetDetReceituarioTalhoes(idRec: string):string;

    function  GetOperadorMaquina: string;
    function  GetAtualizaStatusReceituario:string;
    function  TestaServidor:string;

    function  GetPluviometros:string;
    function  GetPluviometroTalhoes:string;
    function  GetLocalEstoque:string;
    function  GetAuxPragas:string;

    function PostOperacaoSafraAplSolidos:string;
    function PostOperacaoSafraMaquinasAplSolidos(idOp:string):string;
    function PostOperacaoSafraProdutosAplSolidos(idOp:string):string;
    function PostOperacaoSafraOcorrenciaAplSolidos(idOp:string):string;
    function PostOperacaoSafraVazaoPul(idOp:string):string;

    function PostOperacaoSafraPulverizacao:string;
    function PostReceituario:string;
    function PostReceituarioDet(idReceituario:string):string;
    function PostReceituarioDetTalhao(idReceituario: string): string;
    function PostOperacaoSafraMaquinasPulverizacao(idOp,idTalhao:string):string;
    function PostStandPlantas: string;
    function PostToken:string;

    function PostPluviometria: string;
    function PostAbastecimento: string;
    function PostAbastecimentoOutros:string;

    function PostMonitoramento:string;
    function PostMonitoramentoPontos(vid:string): string;
    function PostMonitoramentoPontosValores(vid:string): string;


    //Compras
    function  PostEnviaEmailOrcamento(idOrcamento:string):string;
    procedure DeletaTabelaSync(Atabela:string);
    procedure DeletaMonitoramento(ID:string);
    procedure DeletaMonitoramentoPonto(vIDPonto,vNomePonto:string);
    procedure DeletaTabelaId(Atabela,Id: string);
    procedure DeletaTabelaPraga(Id: string);
    procedure DeletaDetReceituario(IdRec: string);
    procedure AbreMaquinaSafraTalhao(idOperacao:string);
  end;

var
  dmSync: TdmSync;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses UDataContext, UPrincipal;

{$R *.dfm}
procedure TdmSync.DeletaTabelaId(Atabela,Id: string);
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('delete from '+Atabela);
   Add('where id='+id);
   ExecSQL;
 end;
end;

procedure TdmSync.DeletaTabelaPraga(Id: string);
begin
  with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('delete from monitoramentopragasPontosValores');
   Add('where id='+ID);
   ExecSQL;
 end;
end;

function TdmSync.PostAbastecimento: string;
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 TThread.Synchronize(nil,procedure
 begin
  TSyncAbastecimento.Close;
  TSyncAbastecimento.Open;
 end);
 if not TSyncAbastecimento.IsEmpty then
 begin
   JsonToSend := TStringStream.Create(nil);
   TSyncAbastecimento.SaveToStream(JsonToSend,sfJSON);
   Url := 'http://'+Host+':'+Porta+'/datasnap/rest/TServerMethods1/Abastecimento';
   IdHTTP1.Request.CustomHeaders.Clear;
   IdHTTP1.Request.ContentType := 'application/json';
   IdHTTP1.Request.Charset := 'UTF-8';
   IdHTTP1.Request.Clear;
   IdHTTP1.Request.BasicAuthentication := false;
   vReultHTTP  := IdHTTP1.Put(URL,JsonToSend);
   if copy(vReultHTTP,0,18)='{"OK":"'then
   begin
     AlterarFlagAbastecimento;
     vReultHTTP := StringReplace(vReultHTTP,'{"OK":"','',[rfReplaceAll]);
     vReultHTTP := StringReplace(vReultHTTP,'"}','',[rfReplaceAll]);
   end;
 end;
 Result     := vReultHTTP;
end;

function TdmSync.PostAbastecimentoOutros: string;
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 TThread.Synchronize(nil,procedure
 begin
  TSyncAbastecimentoOutros.Close;
  TSyncAbastecimentoOutros.Open;
 end);
 if not TSyncAbastecimentoOutros.IsEmpty then
 begin
   JsonToSend := TStringStream.Create(nil);
   TSyncAbastecimentoOutros.SaveToStream(JsonToSend,sfJSON);
   Url := 'http://'+Host+':'+Porta+'/datasnap/rest/TServerMethods1/AbastecimentoOutros';
   IdHTTP1.Request.CustomHeaders.Clear;
   IdHTTP1.Request.ContentType := 'application/json';
   IdHTTP1.Request.Charset := 'UTF-8';
   IdHTTP1.Request.Clear;
   IdHTTP1.Request.BasicAuthentication := false;
   vReultHTTP  := IdHTTP1.Put(URL,JsonToSend);
   if copy(vReultHTTP,0,18)='{"OK":"'then
   begin
     AlterarFlagAbastecimentoOutros;
     vReultHTTP := StringReplace(vReultHTTP,'{"OK":"','',[rfReplaceAll]);
     vReultHTTP := StringReplace(vReultHTTP,'"}','',[rfReplaceAll]);
   end;
 end;
 Result     := vReultHTTP;
end;

function TdmSync.PostEnviaEmailOrcamento(idOrcamento:string):string;
var
 url,vJsonString,vReultHTTP,vReultHTTPc :string;
 JsonToSend : TStringStream;
 LJsonObj   : TJSONObject;
 StrAux     : TStringWriter;
 txtJson    : TJsonTextWriter;
 I,J:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
begin
   Url :='http://'+Host+':'+Porta+'/datasnap/rest/TSMServicos/EnviaEmailFornecedor';
   IdHTTP1.Request.CustomHeaders.Clear;
   StrAux  := TStringWriter.Create;
   txtJson := TJsonTextWriter.Create(StrAux);
   txtJson.Formatting := TJsonFormatting.Indented;
   TxtJSON.WriteStartObject; //Objeto maior
    TxtJSON.WritePropertyName('emailFornecedor');
    TxtJSON.WriteStartArray; //Objeto pedido
         txtJson.WriteStartObject;
         txtJson.WritePropertyName('Id');
         txtJson.WriteValue(idOrcamento);
    TxtJSON.WriteEndArray; //Fecha Array dos Itens
   TxtJSON.WriteEndObject;  //Fecha Cabeçalho do pedido
   LJsonObj := TJsonObject.ParseJSONValue(TEncoding.ASCII.GetBytes(StrAux.ToString),0)as TJSONObject;
   JsonToSend := TStringStream.Create(LJsonObj.ToJSON);
   IdHTTP1.Request.ContentType := 'application/json';
   IdHTTP1.Request.Charset := 'UTF-8';
   IdHTTP1.Request.Clear;
   IdHTTP1.Request.BasicAuthentication := false;
   try
     IdHTTP1.Request.CustomHeaders.Clear;
     vJsonString  := IdHTTP1.Put(URL,JsonToSend);
     IdHTTP1.Request.CustomHeaders.Clear;
     vJsonString        := IdHTTP1.Get(URL);
     vReultHTTPc        := copy(vJsonString,0,18);
      if vReultHTTPc='{"Ok":"' then
      begin
       Result :=dmDB.LimpaResut(vJsonString);
      end
     except
     on E: Exception do
      begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
      end;
   end;
end;

function TdmSync.PostMonitoramento: string;
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
 qryAux:TFDQuery;
begin
 qryAux:= TFDQuery.Create(nil);
 qryAux.Connection:= dmDB.FDConn;
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('select * from monitoramentopragas');
   Add('where status=2 and syncfaz=0');
   Open;
   while not qryAux.Eof do
   begin
     AbreMonitoramentoSinc(qryAux.FieldByName('id').AsString);
     TMonitoramentoPraga.First;
     if not TMonitoramentoPraga.IsEmpty then
     begin
       JsonToSend := TStringStream.Create(nil);
       TMonitoramentoPraga.SaveToStream(JsonToSend,sfJSON);
       Url := 'http://'+Host+':'+Porta+'/datasnap/rest/TServerMethods1/Monitoramento';
       IdHTTP1.Request.CustomHeaders.Clear;
       IdHTTP1.Request.ContentType := 'application/json';
       IdHTTP1.Request.Charset := 'UTF-8';
       IdHTTP1.Request.Clear;
       IdHTTP1.Request.BasicAuthentication := false;
       vReultHTTP  := IdHTTP1.Put(URL,JsonToSend);
       if copy(vReultHTTP,0,18)='{"OK":"'then
       begin
         vReultHTTP := StringReplace(vReultHTTP,'{"OK":"','',[rfReplaceAll]);
         vReultHTTP := StringReplace(vReultHTTP,'"}','',[rfReplaceAll]);
         dmDB.AtualizaIdMonitoramento(qryAux.FieldByName('id').AsString,vReultHTTP);
         PostMonitoramentoPontos(vReultHTTP);
         dmSync.AlteraFlagMonitoramento(vReultHTTP);
       end;
     end;
     qryAux.Next;
   end;
 end;
 qryAux.Free;
 Result     := vReultHTTP;
end;

function TdmSync.PostMonitoramentoPontos(vid:string): string;
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 qryAux:TFDQuery;
begin
 qryAux:= TFDQuery.Create(nil);
 qryAux.Connection:= dmDB.FDConn;
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('select * from monitoramentopragasPontos');
   Add('where idmonitoramento='+vid);
   Open;
   while not qryAux.Eof do
   begin
     AbreMonitoramentoPontoSinc(qryAux.FieldByName('id').AsString);
     TmonitoramentopragasPontos.First;
     if not TmonitoramentopragasPontos.IsEmpty then
     begin
       JsonToSend := TStringStream.Create(nil);
       TmonitoramentopragasPontos.SaveToStream(JsonToSend,sfJSON);
       Url := 'http://'+Host+':'+Porta+'/datasnap/rest/TServerMethods1/MonitoramentoPontos';
       IdHTTP1.Request.CustomHeaders.Clear;
       IdHTTP1.Request.ContentType := 'application/json';
       IdHTTP1.Request.Charset := 'UTF-8';
       IdHTTP1.Request.Clear;
       IdHTTP1.Request.BasicAuthentication := false;
       vReultHTTP  := IdHTTP1.Put(URL,JsonToSend);
       if copy(vReultHTTP,0,18)='{"OK":"'then
       begin
         vReultHTTP := StringReplace(vReultHTTP,'{"OK":"','',[rfReplaceAll]);
         vReultHTTP := StringReplace(vReultHTTP,'"}','',[rfReplaceAll]);
         dmDB.AtualizaIdMonitoramentoPonto(qryAux.FieldByName('id').AsString,vReultHTTP);
         PostMonitoramentoPontosValores(vReultHTTP);
       end;
     end;
     qryAux.Next;
   end;
   qryAux.Free;
   Result     := vReultHTTP;
 end;
end;

function TdmSync.PostMonitoramentoPontosValores(vid:string): string;
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 dmSync.AbreMonitoramentoPontoValoresSinc(vid);
 TmonitoramentopragasPontosValores.First;
 if not TmonitoramentopragasPontosValores.IsEmpty then
 begin
   JsonToSend := TStringStream.Create(nil);
   TmonitoramentopragasPontosValores.SaveToStream(JsonToSend,sfJSON);
   Url := 'http://'+Host+':'+Porta+'/datasnap/rest/TServerMethods1/MonitoramentoPontosValores';
   IdHTTP1.Request.CustomHeaders.Clear;
   IdHTTP1.Request.ContentType := 'application/json';
   IdHTTP1.Request.Charset := 'UTF-8';
   IdHTTP1.Request.Clear;
   IdHTTP1.Request.BasicAuthentication := false;
   vReultHTTP  := IdHTTP1.Put(URL,JsonToSend);
   if copy(vReultHTTP,0,18)='{"OK":"'then
   begin
     vReultHTTP := StringReplace(vReultHTTP,'{"OK":"','',[rfReplaceAll]);
     vReultHTTP := StringReplace(vReultHTTP,'"}','',[rfReplaceAll]);
   end;
 end;
 Result     := vReultHTTP;
end;

function TdmSync.GetCulturas: string;
var
 Url,vJsonString,vID:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url :='http://'+Host+':'+Porta+'/GetCulturas';
   IdHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := IdHTTP1.Get(URL);
    if(vJsonString<>'{"Mensagem":"Nenhuma Cultura encontrada!"}') then
    begin
      jSubObj  := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
       vJoGet := jSubObj.GetValue<TJSONArray>('Cultura') as TJSONArray;
       for i := 0 to vJoGet.Count-1 do
       begin
          vJoGetJ         := vJoGet.Items[i] as TJSONObject;
          vID             := vJoGetJ.GetValue('ID').value;
          dmDB.TCulturas.Close;
          dmDB.TCulturas.Open;
          dmDB.TCulturas.Filtered := false;
          dmDB.TCulturas.Filter   := 'ID='+vId.QuotedString;
          dmDB.TCulturas.Filtered := true;
          if dmDB.TCulturas.RecordCount>0 then
            dmDB.TCulturas.Edit
          else
          begin
            dmDB.TCulturas.Close;
            dmDB.TCulturas.Open;
            dmDB.TCulturas.Insert;
          end;
          dmDB.TCulturasId.AsString                 := vId;
          dmDB.TCulturasstatus.AsString             := vJoGetJ.GetValue('Status').value;
          dmDB.TCulturasnome.AsString               := vJoGetJ.GetValue('Nome').value;
          try
           dmDB.TCulturas.ApplyUpdates(-1);
          except
            on E: Exception do
             result:=('Erro: ' + E.Message );
          end;
       end;
       result:='Culturas Baixadas com Sucesso!'
    end
    else
     Result :=dmDB.LimpaResut(vJsonString);
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;


function TdmSync.GetDetReceituario(idRec: string):string;
var
 Url,vJsonString,vID:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
 StrAux      : TStringWriter;
 txtJson     : TJsonTextWriter;
 LJsonObj    : TJSONObject;
 JsonToSend  : TStringStream;
begin
   StrAux  := TStringWriter.Create;
   txtJson := TJsonTextWriter.Create(StrAux);
   txtJson.Formatting := TJsonFormatting.Indented;
   TxtJSON.WriteStartObject;
   TxtJSON.WritePropertyName('idRec');
   TxtJSON.WriteStartArray;
     txtJson.WriteStartObject;
     txtJson.WritePropertyName('id');
     txtJson.WriteValue(idRec);
   TxtJSON.WriteEndArray;
   TxtJSON.WriteEndObject;
   LJsonObj := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   JsonToSend := TStringStream.Create(LJsonObj.ToJSON);

   Url :='http://'+Host+':'+Porta+'/GetDetReceituario';
   IdHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString    := IdHTTP1.Put(URL,JsonToSend);

    if(vJsonString<>'{"Mensagem":"Nenhum Detalhe do Receituario encontrado!"}') then
    begin
      jSubObj  := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
       vJoGet := jSubObj.GetValue<TJSONArray>('DetReceituario') as TJSONArray;
       for i := 0 to vJoGet.Count-1 do
       begin
          vJoGetJ         := vJoGet.Items[j] as TJSONObject;
          vID             := vJoGetJ.GetValue('ID').value;
          dmDB.TDetReceituario.Close;
          dmDB.TDetReceituario.Open;
          dmDB.TDetReceituario.Insert;
          dmDB.TDetReceituarioId.AsString                 := vId;
          dmDB.TDetReceituariostatus.AsString             := vJoGetJ.GetValue('Status').value;
          dmDB.TDetReceituarioidreceiturario.AsString     := vJoGetJ.GetValue('IDReceituario').value;
          dmDB.TDetReceituarioFinalidade.AsString         := vJoGetJ.GetValue('Finalidade').value;
          dmDB.TDetReceituarioidproduto.AsString          := vJoGetJ.GetValue('IdProduto').value;
          dmDB.TDetReceituarioProduto.AsString            := vJoGetJ.GetValue('Produto').value;
          dmDB.TDetReceituarioqtdporhe.AsString           := vJoGetJ.GetValue('QtdeIndicada').value;
          try
           dmDB.TDetReceituario.ApplyUpdates(-1);
          except
            on E: Exception do
             result:=('Erro: ' + E.Message );
          end;
       end;
       result:='Detalhe Receituario Baixadas com Sucesso!'
    end
    else
     Result :=dmDB.LimpaResut(vJsonString);
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

function TdmSync.GetDetReceituarioTalhoes(idRec: string):string;
var
 Url,vJsonString,vID,vField:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J,z:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
  StrAux      : TStringWriter;
 txtJson     : TJsonTextWriter;
 LJsonObj    : TJSONObject;
 JsonToSend  : TStringStream;
begin
   StrAux  := TStringWriter.Create;
   txtJson := TJsonTextWriter.Create(StrAux);
   txtJson.Formatting := TJsonFormatting.Indented;
   TxtJSON.WriteStartObject;
   TxtJSON.WritePropertyName('idRec');
   TxtJSON.WriteStartArray;
     txtJson.WriteStartObject;
     txtJson.WritePropertyName('id');
     txtJson.WriteValue(idRec);
   TxtJSON.WriteEndArray;
   TxtJSON.WriteEndObject;
   LJsonObj := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   JsonToSend := TStringStream.Create(LJsonObj.ToJSON);
   Url :='http://'+Host+':'+Porta+'/datasnap/rest/TServerMethods1/GetDetReceituarioTalhao';
   IdHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString := IdHTTP1.Put(URL,JsonToSend);
    
    if(vJsonString<>'{"Mensagem":"Nenhum Detalhe do Receituario Talhao encontrado!"}') then
    begin
     jSubObj  := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
       vJoGet := jSubObj.GetValue<TJSONArray>('TDetReceituarioTalhao') as TJSONArray;
       for i := 0 to vJoGet.Count-1 do
       begin
          vJoGetJ         := vJoGet.Items[j] as TJSONObject;
          vID             := vJoGetJ.GetValue('id').value;
          dmDB.TDetReceituarioTalhao.Close;
          dmDB.TDetReceituarioTalhao.Open;
          dmDB.TDetReceituarioTalhao.Insert;
            for z := 0 to dmDB.TDetReceituarioTalhao.Fields.Count -1 do
            begin
             vField                                                    := StringReplace(dmDB.TDetReceituarioTalhao.Fields[z].Name,'TDetReceituarioTalhao','',[rfReplaceAll]);
             dmDB.TDetReceituarioTalhao.FieldByName(vField).AsString   := vJoGetJ.GetValue(vField).value;
            end;
            try
             dmDB.TDetReceituarioTalhao.ApplyUpdates(-1);
            except
              on E: Exception do
               result:=('Erro: ' + E.Message );
            end;
       end;
       result:='Talhoes Receituario Baixadas com Sucesso!'
    end
    else
     Result :=dmDB.LimpaResut(vJsonString);
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

function TdmSync.GetLocalEstoque: string;
var
 Url,vJsonString,vIsert,
 vField,vFieldJS,vId:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J,z:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url := 'http://'+Host+':'+Porta+'/GetLocalEstoque';
   IdHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := IdHTTP1.Get(URL);
    if(vJsonString<>'{"TLocalEstoque":[') then
    begin
      TSyncLocalEstoque.Close;
      TSyncLocalEstoque.Open;
      jSubObj  := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
       vJoGet := jSubObj.GetValue<TJSONArray>('TLocalEstoque') as TJSONArray;
       for i := 0 to vJoGet.Count-1 do
       begin
          vJoGetJ         := vJoGet.Items[j] as TJSONObject;
          vId               := vJoGetJ.GetValue('id').value;
          TSyncLocalEstoque.Filtered := false;
          TSyncLocalEstoque.Filter   := 'id='+vId;
          TSyncLocalEstoque.Filtered := true;
          if not TSyncLocalEstoque.IsEmpty then
           TSyncLocalEstoque.Edit
          else
           TSyncLocalEstoque.Insert;
          for z := 0 to TSyncLocalEstoque.Fields.Count -1 do
          begin
           vField:= StringReplace(TSyncLocalEstoque.Fields[z].Name,
            'TSyncLocalEstoque','',[rfReplaceAll]);
           TSyncLocalEstoque.FieldByName(vField).AsString := vJoGetJ.GetValue(vField).value;
          end;
          TSyncLocalEstoque.ApplyUpdates(-1);
       end;
       result:='Pluviometro Local de Estoque Baixados com Sucesso!'
    end
    else
     Result :='Pluviometro Local de Estoque Baixados com Sucesso!'
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

function TdmSync.GetCoberturas: string;
var
 Url,vJsonString,vID:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url :='http://'+Host+':'+Porta+'/GetCobertura';
   IdHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := IdHTTP1.Get(URL);
    if(vJsonString<>'{"Mensagem":"Nenhuma Cobertura encontrada!"}') then
    begin
      jSubObj  := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
       vJoGet := jSubObj.GetValue<TJSONArray>('Cobertura') as TJSONArray;
       for i := 0 to vJoGet.Count-1 do
       begin
          vJoGetJ         := vJoGet.Items[i] as TJSONObject;
          vID             := vJoGetJ.GetValue('ID').value;
          dmDB.TAuxCobertura.Close;
          dmDB.TAuxCobertura.Open;
          dmDB.TAuxCobertura.Filtered := false;
          dmDB.TAuxCobertura.Filter   := 'ID='+vId.QuotedString;
          dmDB.TAuxCobertura.Filtered := true;
          if dmDB.TAuxCobertura.RecordCount>0 then
            dmDB.TAuxCobertura.Edit
          else
          begin
            dmDB.TAuxCobertura.Close;
            dmDB.TAuxCobertura.Open;
            dmDB.TAuxCobertura.Insert;
          end;
          dmDB.TAuxCoberturaId.AsString                 := vId;
          dmDB.TAuxCoberturastatus.AsString             := vJoGetJ.GetValue('Status').value;
          dmDB.TAuxCoberturanome.AsString               := vJoGetJ.GetValue('Nome').value;
          try
           dmDB.TAuxCobertura.ApplyUpdates(-1);
          except
            on E: Exception do
             result:=('Erro: ' + E.Message );
          end;
       end;
       result:='Coberturas Baixadas com Sucesso!'
    end
    else
     Result :=dmDB.LimpaResut(vJsonString);
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

function TdmSync.GetCultivares: string;
var
 Url,vJsonString,vID:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url :='http://'+Host+':'+Porta+'/GetCultivares';
   IdHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := IdHTTP1.Get(URL);
    if(vJsonString<>'{"Mensagem":"Nenhuma Variedade encontrada!"}') then
    begin
      jSubObj  := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
       vJoGet := jSubObj.GetValue<TJSONArray>('Cultivares') as TJSONArray;
       for i := 0 to vJoGet.Count-1 do
       begin
          vJoGetJ         := vJoGet.Items[i] as TJSONObject;
          vID             := vJoGetJ.GetValue('ID').value;
          dmDB.TCultivares.Close;
          dmDB.TCultivares.Open;
          dmDB.TCultivares.Filtered := false;
          dmDB.TCultivares.Filter   := 'ID='+vId.QuotedString;
          dmDB.TCultivares.Filtered := true;
          if dmDB.TCultivares.RecordCount>0 then
            dmDB.TCultivares.Edit
          else
          begin
            dmDB.TCultivares.Close;
            dmDB.TCultivares.Open;
            dmDB.TCultivares.Insert;
          end;
          dmDB.TCultivaresId.AsString                 := vId;
          dmDB.TCultivaresstatus.AsString             := vJoGetJ.GetValue('Status').value;
          dmDB.TCultivaresnome.AsString               := vJoGetJ.GetValue('Nome').value;
          try
           dmDB.TCultivares.ApplyUpdates(-1);
          except
            on E: Exception do
             result:=('Erro: ' + E.Message );
          end;
       end;
       result:='Variedades Baixadas com Sucesso!'
    end
    else
     Result :=dmDB.LimpaResut(vJsonString);
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

function TdmSync.GetTalhoes: string;
var
 Url,vJsonString,vID:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url :='http://'+Host+':'+Porta+'/GetTalhoes';
   IdHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := IdHTTP1.Get(URL);
    if(vJsonString<>'{"Mensagem":"Nenhum Talhão encontrado!"}') then
    begin
      dmDB.DeletaTabelaGenerica('talhoes');
      dmDB.TGetTalhoes.Close;
      dmDB.TGetTalhoes.Open;
      jSubObj  := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
       vJoGet := jSubObj.GetValue<TJSONArray>('Talhoes') as TJSONArray;
       for i := 0 to vJoGet.Count-1 do
       begin
          vJoGetJ         := vJoGet.Items[j] as TJSONObject;
          vID             := vJoGetJ.GetValue('ID').value;
          dmDB.TGetTalhoes.Close;
          dmDB.TGetTalhoes.Open;
          dmDB.TGetTalhoes.Insert;
          dmDB.TGetTalhoesId.AsString                 := vId;
          dmDB.TGetTalhoesstatus.AsString             := vJoGetJ.GetValue('Status').value;
          dmDB.TGetTalhoesnome.AsString               := vJoGetJ.GetValue('Nome').value;
          dmDB.TGetTalhoesareahe.AsString             := vJoGetJ.GetValue('AreaHe').value;
          dmDB.TGetTalhoesLatitude.AsString           := vJoGetJ.GetValue('Latitude').value;
          dmDB.TGetTalhoesLongitude.AsString          := vJoGetJ.GetValue('Longitude').value;
          dmDB.TGetTalhoesidsetor.AsString            := vJoGetJ.GetValue('IdSetor').value;
          dmDB.TGetTalhoesQrCode.AsString             := vJoGetJ.GetValue('QrCode').value;
          dmDB.TGetTalhoesQrCodeSaida.AsString        := vJoGetJ.GetValue('QrCodeSaida').value;
          dmDB.TGetTalhoesTipo.AsString               := vJoGetJ.GetValue('Tipo').value;
          dmDB.TGetTalhoesObservacao.AsString         := vJoGetJ.GetValue('Observacao').value;
          try
           dmDB.TGetTalhoes.ApplyUpdates(-1);
          except
            on E: Exception do
             result:=('Erro: ' + E.Message );
          end;
       end;
       result:='Talhões Baixado com Sucesso!'
    end
    else
     Result :=dmDB.LimpaResut(vJsonString);
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

function TdmSync.GetTipoAplicacaoSolido: string;
var
 Url,vJsonString,vID:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url :='http://'+Host+':'+Porta+'/GetAuxTipoAplicacaoSolido';
   IdHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := IdHTTP1.Get(URL);
    if(vJsonString<>'{"Mensagem":"Nenhuma Tipo Aplicacao Solidos encontrado!"}') then
    begin
      jSubObj  := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
       vJoGet := jSubObj.GetValue<TJSONArray>('TipoAplicacaoSolido') as TJSONArray;
       for i := 0 to vJoGet.Count-1 do
       begin
          vJoGetJ         := vJoGet.Items[i] as TJSONObject;
          vID             := vJoGetJ.GetValue('ID').value;
          dmDB.TTipoAplicacaoSolido.Close;
          dmDB.TTipoAplicacaoSolido.Open;
          dmDB.TTipoAplicacaoSolido.Filtered := false;
          dmDB.TTipoAplicacaoSolido.Filter   := 'ID='+vId.QuotedString;
          dmDB.TTipoAplicacaoSolido.Filtered := true;
          if dmDB.TTipoAplicacaoSolido.RecordCount>0 then
            dmDB.TTipoAplicacaoSolido.Edit
          else
          begin
            dmDB.TTipoAplicacaoSolido.Close;
            dmDB.TTipoAplicacaoSolido.Open;
            dmDB.TTipoAplicacaoSolido.Insert;
          end;
          dmDB.TTipoAplicacaoSolidoId.AsString                 := vId;
          dmDB.TTipoAplicacaoSolidostatus.AsString             := vJoGetJ.GetValue('Status').value;
          dmDB.TTipoAplicacaoSolidonome.AsString               := vJoGetJ.GetValue('Nome').value;
          try
           dmDB.TTipoAplicacaoSolido.ApplyUpdates(-1);
          except
            on E: Exception do
             result:=('Erro: ' + E.Message );
          end;
       end;
       result:='Tipo Aplicação Sólido Baixado com Sucesso!'
    end
    else
     Result :=dmDB.LimpaResut(vJsonString);
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

function TdmSync.GetTipoOcorrencia: string;
var
 Url,vJsonString,vID:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url :='http://'+Host+':'+Porta+'/GetTipoOcorrencia';
   IdHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := IdHTTP1.Get(URL);
    if(vJsonString<>'{"Mensagem":"Nenhum Tipo de Ocorrencia encontrado!"}') then
    begin
      jSubObj  := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
       vJoGet := jSubObj.GetValue<TJSONArray>('TipoOcorrencia') as TJSONArray;
       for i := 0 to vJoGet.Count-1 do
       begin
          vJoGetJ         := vJoGet.Items[i] as TJSONObject;
          vID             := vJoGetJ.GetValue('ID').value;
          dmDB.TAuxOcorrencia.Close;
          dmDB.TAuxOcorrencia.Open;
          dmDB.TAuxOcorrencia.Filtered := false;
          dmDB.TAuxOcorrencia.Filter   := 'ID='+vId.QuotedString;
          dmDB.TAuxOcorrencia.Filtered := true;
          if dmDB.TAuxOcorrencia.RecordCount>0 then
            dmDB.TAuxOcorrencia.Edit
          else
          begin
            dmDB.TAuxOcorrencia.Close;
            dmDB.TAuxOcorrencia.Open;
            dmDB.TAuxOcorrencia.Insert;
          end;
          dmDB.TAuxOcorrenciaId.AsString                 := vId;
          dmDB.TAuxOcorrenciastatus.AsString             := vJoGetJ.GetValue('Status').value;
          dmDB.TAuxOcorrencianome.AsString               := vJoGetJ.GetValue('Nome').value;
          try
           dmDB.TAuxOcorrencia.ApplyUpdates(-1);
          except
            on E: Exception do
             result:=('Erro: ' + E.Message );
          end;
       end;
       result:='Tipo de Ocorrencia Baixado com Sucesso!'
    end
    else
     Result :=dmDB.LimpaResut(vJsonString);
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

function TdmSync.GetSafra: string;
var
 Url,vJsonString,vID:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url :='http://'+Host+':'+Porta+'/GetSafra';
   IdHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := IdHTTP1.Get(URL);
    if(vJsonString<>'{"Mensagem":"Nenhuma Safra encontrada!"}') then
    begin
      jSubObj  := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
       vJoGet := jSubObj.GetValue<TJSONArray>('Safra') as TJSONArray;
       for i := 0 to vJoGet.Count-1 do
       begin
          vJoGetJ         := vJoGet.Items[i] as TJSONObject;
          vID             := vJoGetJ.GetValue('ID').value;
          dmDB.TSafra.Close;
          dmDB.TSafra.Open;
          dmDB.TSafra.Filtered := false;
          dmDB.TSafra.Filter   := 'ID='+vId.QuotedString;
          dmDB.TSafra.Filtered := true;
          if dmDB.TSafra.RecordCount>0 then
            dmDB.TSafra.Edit
          else
          begin
            dmDB.TSafra.Close;
            dmDB.TSafra.Open;
            dmDB.TSafra.Insert;
          end;
          dmDB.TSafraId.AsString                 := vId;
          dmDB.TSafrastatus.AsString             := vJoGetJ.GetValue('Status').value;
          dmDB.TSafranome.AsString               := vJoGetJ.GetValue('Nome').value;
          try
           dmDB.TSafra.ApplyUpdates(-1);
          except
            on E: Exception do
             result:=('Erro: ' + E.Message );
          end;
       end;
       result:='Safra Baixado com Sucesso!'
    end
    else
     Result :=dmDB.LimpaResut(vJsonString);
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

function TdmSync.GetSetor: string;
var
 Url,vJsonString,vID:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url :='http://'+Host+':'+Porta+'/GetSetores';
   IdHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := IdHTTP1.Get(URL);
    if(vJsonString<>'{"Mensagem":"Nenhum Setor encontrado!"}') then
    begin
      jSubObj  := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
       vJoGet := jSubObj.GetValue<TJSONArray>('Setores') as TJSONArray;
       for i := 0 to vJoGet.Count-1 do
       begin
          vJoGetJ         := vJoGet.Items[j] as TJSONObject;
          vID             := vJoGetJ.GetValue('ID').value;
          dmDB.TSetor.Close;
          dmDB.TSetor.Open;
          dmDB.TSetor.Filtered := false;
          dmDB.TSetor.Filter   := 'ID='+vId.QuotedString;
          dmDB.TSetor.Filtered := true;
          if dmDB.TSetor.RecordCount>0 then
            dmDB.TSetor.Edit
          else
          begin
            dmDB.TSetor.Close;
            dmDB.TSetor.Open;
            dmDB.TSetor.Insert;
          end;
          dmDB.TSetorId.AsString                 := vId;
          dmDB.TSetorstatus.AsString             := vJoGetJ.GetValue('Status').value;
          dmDB.TSetornome.AsString               := vJoGetJ.GetValue('Nome').value;
          dmDB.TSetorareahe.AsString             := vJoGetJ.GetValue('AreaHe').value;
          dmDB.TSetorLatitude.AsString           := vJoGetJ.GetValue('Latitude').value;
          dmDB.TSetorLongitude.AsString          := vJoGetJ.GetValue('Longitude').value;
          dmDB.TSetorIdArea.AsString             := vJoGetJ.GetValue('IdArea').value;
          try
           dmDB.TSetor.ApplyUpdates(-1);
          except
            on E: Exception do
             result:=('Erro: ' + E.Message );
          end;
       end;
       result:='Setor Baixado com Sucesso!'
    end
    else
     Result :=dmDB.LimpaResut(vJsonString);
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

procedure TdmSync.AbreDetReceituario(vIdReceituario: string);
begin
 with TSyncDetReceituario,TSyncDetReceituario.SQL do
 begin
   Clear;
   Add('select');
   Add('id,');
   Add('status,');
   Add('current_timestamp datareg,');
   Add('idusuario,');
   Add('current_timestamp dataalteracao,');
   Add('idusuario idusuarioalteracao,');
   Add('idreceiturario,');
   Add('finalidade,');
   Add('qtdporhe,');
   Add('idproduto');
   Add('from detreceiturario');
   Add('where status=1 and idreceiturario='+vIdReceituario);
   Open;
 end;
end;

procedure TdmSync.AbreDetReceituarioTalhao(vIdReceituario: string);
begin
 with TSyncDetReceituarioTalhao,TSyncDetReceituarioTalhao.SQL do
 begin
   Clear;
   Add('select * from  detreceiturarioTalhao');
   Add('where status=1 and syncaws=0 and idreceiturario='+vIdReceituario);
   Open;
 end;
end;

procedure TdmSync.AbreDetVazaoOperacao(vIdOP: string);
begin
 with TSyncVazaoOperacao,TSyncVazaoOperacao.SQL do
 begin
   Clear;
   AdD('select * from DetVazaoOperacao');
   AdD('where idOperacaoTalhao='+vIdOP);
   Open;
 end;
end;

procedure TdmSync.AbreMaquinaSafraTalhao(idOperacao: string);
begin
 with qryOpSafraMaquinasSync,qryOpSafraMaquinasSync.SQL do
 begin
  Clear;
  Add('select * from detoperacaosafratalhaomaquinasoperadores a');
  Add('where a.status=1');
  Add('and idoperacaotalhao='+idOperacao);
  try
    Open;
  except
   on E : Exception do
    ShowMessage('Erro ao inserir Configuração : '+E.Message);
  end;
 end;
end;

procedure TdmSync.AbreMonitoramentoPontoSinc(id: string);
begin
 with TmonitoramentopragasPontos,TmonitoramentopragasPontos.SQL do
 begin
  Clear;
  Add('SELECT * FROM monitoramentopragasPontos');
  Add('where id='+id);
  Open;
 end;
end;

procedure TdmSync.AbreMonitoramentoPontoValoresSinc(id: string);
begin
 with TmonitoramentopragasPontosValores,TmonitoramentopragasPontosValores.SQL do
 begin
  Clear;
  Add('SELECT * FROM monitoramentopragaspontosvalores');
  Add('where idponto='+id);
  Open;
 end;
end;

procedure TdmSync.AbreMonitoramentoSinc(id: string);
begin
 with TMonitoramentoPraga,TMonitoramentoPraga.SQL do
 begin
  Clear;
  Add('select * from monitoramentopragas');
  Add('where id='+id);
  Open;
 end;
end;

procedure TdmSync.AlteraFlagMonitoramento(vIdMonitoramento: string);
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('update monitoramentopragas set syncfaz=1');
   Add('WHERE ID IN('+vIdMonitoramento+')');
   ExecSQL;
 end;
end;

procedure TdmSync.AlteraFlagMonitoramentoPontos(vIdPonto: string);
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('update monitoramentopragasPontos set syncfaz=1');
   Add('WHERE ID IN('+vIdPonto+')');
   ExecSQL;
 end;
end;

procedure TdmSync.AlteraFlagMonitoramentoPontosValores(vIdPonto: string);
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('update monitoramentopragasPontosValores set syncfaz=1');
   Add('WHERE ID IN('+vIdPonto+')');
   ExecSQL;
 end;
end;


procedure TdmSync.AlterarFlagAbastecimento;
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('update abastecimento set syncfaz=1');
   ExecSQL;
 end;
end;

procedure TdmSync.AlterarFlagAbastecimentoOutros;
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('update abastecimentoOutros set syncfaz=1');
   ExecSQL;
 end;
end;

procedure TdmSync.AlterarFlagSyncPluviometria;
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('update pluviometria set syncfaz=1');
   ExecSQL;
 end;
end;

procedure TdmSync.AlterarFlagSyncStand;
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('update StandSementes set syncaws=1');
   ExecSQL;
 end;
end;

procedure TdmSync.DeletaDetReceituario(IdRec: string);
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('delete from detreceiturario');
   Add('where idreceiturario='+IdRec);
   ExecSQL;

   Clear;
   Add('delete from detreceiturariotalhao');
   Add('where idreceiturario='+IdRec);
   ExecSQL;
 end;
end;

procedure TdmSync.DeletaMonitoramento(ID: string);
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('delete from monitoramentopragas');
   Add('where id='+ID);
   ExecSQL;

   Clear;
   Add('delete from monitoramentopragasPontos');
   Add('where idMonitoramento='+ID);
   ExecSQL;
 end;
end;

procedure TdmSync.DeletaMonitoramentoPonto(vIDPonto, vNomePonto: string);
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('delete from monitoramentopragasPontos');
   Add('where id='+vIDPonto);
   Add('and Ponto='+QuotedStr(vNomePonto));
   ExecSQL;
 end;
end;

procedure TdmSync.DeletaTabelaSync(Atabela: string);
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('delete from '+Atabela);
   try
    ExecSQL;
   except
     on E: Exception do
      ShowMessage(e.Message);
   end
 end;
end;

function TdmSync.GetAreas: string;
var
 Url,vJsonString,vID:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url :='http://'+Host+':'+Porta+'/GetAreas';
   IdHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := IdHTTP1.Get(URL);
    if(vJsonString<>'{"Mensagem":"Nenhuma Area encontrada!"}') then
    begin
      jSubObj  := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
       vJoGet := jSubObj.GetValue<TJSONArray>('Areas') as TJSONArray;
       for i := 0 to vJoGet.Count-1 do
       begin
          vJoGetJ         := vJoGet.Items[j] as TJSONObject;
          vID             := vJoGetJ.GetValue('ID').value;
          dmDB.TAreas.Close;
          dmDB.TAreas.Open;
          dmDB.TAreas.Filtered := false;
          dmDB.TAreas.Filter   := 'ID='+vId.QuotedString;
          dmDB.TAreas.Filtered := true;
          if dmDB.TAreas.RecordCount>0 then
            dmDB.TAreas.Edit
          else
          begin
            dmDB.TAreas.Close;
            dmDB.TAreas.Open;
            dmDB.TAreas.Insert;
          end;
          dmDB.TAreasId.AsString                 := vId;
          dmDB.TAreasstatus.AsString             := vJoGetJ.GetValue('Status').value;
          dmDB.TAreasnome.AsString               := vJoGetJ.GetValue('Nome').value;
          dmDB.TAreasareahe.AsString             := vJoGetJ.GetValue('AreaHe').value;
          dmDB.TAreasLatitude.AsString           := vJoGetJ.GetValue('Latitude').value;
          dmDB.TAreasLongitude.AsString          := vJoGetJ.GetValue('Longitude').value;
          dmDB.TAreasResponsavel.AsString        := vJoGetJ.GetValue('Responsavel').value;
          try
           dmDB.TAreas.ApplyUpdates(-1);
          except
            on E: Exception do
             result:=('Erro: ' + E.Message );
          end;
       end;
       result:='Areas Baixados com Sucesso!'
    end
    else
     Result :=dmDB.LimpaResut(vJsonString);
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

function TdmSync.PostOperacaoSafraVazaoPul(idOp:string):string;
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 AbreDetVazaoOperacao(idOP);
 if not TSyncVazaoOperacao.IsEmpty then
 begin
   JsonToSend := TStringStream.Create(nil);
   TSyncVazaoOperacao.SaveToStream(JsonToSend,sfJSON);
   Url := 'http://'+Host+':'+Porta+'/datasnap/rest/TServerMethods1/OperacaoSafraVasao';
   IdHTTP1.Request.CustomHeaders.Clear;
   IdHTTP1.Request.ContentType := 'application/json';
   IdHTTP1.Request.Charset := 'UTF-8';
   IdHTTP1.Request.Clear;
   IdHTTP1.Request.BasicAuthentication := false;
   vReultHTTP  := IdHTTP1.Put(URL,JsonToSend);
   if copy(vReultHTTP,0,18)='{"OK":"'then
   begin
     vReultHTTP := StringReplace(vReultHTTP,'{"OK":"','',[rfReplaceAll]);
     vReultHTTP := StringReplace(vReultHTTP,'"}','',[rfReplaceAll]);
   end;
 end;
 Result     := vReultHTTP;
end;

function TdmSync.GetAuxPragas:string;
var
 Url,vJsonString,vIsert,
 vField,vFieldJS,vId:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J,z:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url := 'http://'+Host+':'+Porta+'/GetPragas';
   IdHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := IdHTTP1.Get(URL);
    if(vJsonString<>'{"TAuxPraga":[') then
    begin
      DeletaTabelaSync('auxPragas');
      jSubObj  := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
       vJoGet := jSubObj.GetValue<TJSONArray>('TAuxPraga') as TJSONArray;
       for i := 0 to vJoGet.Count-1 do
       begin
          vJoGetJ         := vJoGet.Items[i] as TJSONObject;
          TSyncPragas.Close;
          TSyncPragas.Open;
          TSyncPragas.Insert;
          for z := 0 to TSyncPragas.Fields.Count -1 do
          begin
           vField:= StringReplace(TSyncPragas.Fields[z].Name,'TSyncPragas','',[rfReplaceAll]);
           TSyncPragas.FieldByName(vField).AsString := vJoGetJ.GetValue(vField).value;
          end;
          TSyncPragas.ApplyUpdates(-1);
       end;
       result:='Pragas Baixados com Sucesso!'
    end
    else
     Result :=vJsonString;
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

function TdmSync.GetPluviometros:string;
var
 Url,vJsonString,vIsert,
 vField,vFieldJS,vId:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J,z:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url := 'http://'+Host+':'+Porta+'/GetPluviometro';
   IdHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := IdHTTP1.Get(URL);
    if(vJsonString<>'{"TPluviometro":[') then
    begin
      TSyncPluviometro.Close;
      TSyncPluviometro.Open;
       jSubObj  := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
       vJoGet := jSubObj.GetValue<TJSONArray>('TPluviometro') as TJSONArray;
       for i := 0 to vJoGet.Count-1 do
       begin
          vJoGetJ         := vJoGet.Items[i] as TJSONObject;
          vId               := vJoGetJ.GetValue('id').value;
          TSyncPluviometro.Filtered := false;
          TSyncPluviometro.Filter   := 'id='+vId;
          TSyncPluviometro.Filtered := true;
          if not TSyncPluviometro.IsEmpty then
           TSyncPluviometro.Edit
          else
           TSyncPluviometro.Insert;
          for z := 0 to TSyncPluviometro.Fields.Count -1 do
          begin
           vField                                        := StringReplace(TSyncPluviometro.Fields[z].Name,'TSyncPluviometro','',[rfReplaceAll]);
           TSyncPluviometro.FieldByName(vField).AsString := vJoGetJ.GetValue(vField).value;
          end;
          TSyncPluviometro.ApplyUpdates(-1);
       end;
       result:='Pluviometro Baixados com Sucesso!'
    end
    else
     Result :=vJsonString;
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

function TdmSync.GetPluviometroTalhoes:string;
var
 Url,vJsonString,vIsert,
 vField,vFieldJS,vId:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J,z:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url := 'http://'+Host+':'+Porta+'/GetPluviometroTalhoes';
   IdHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := IdHTTP1.Get(URL);
    if(vJsonString<>'{"TPluviometroTalhoes":[') then
    begin
      TSyncPluviometroTalhoes.Close;
      TSyncPluviometroTalhoes.Open;
      jSubObj  := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
       vJoGet := jSubObj.GetValue<TJSONArray>('TPluviometroTalhoes') as TJSONArray;
       for i := 0 to vJoGet.Count-1 do
       begin
          vJoGetJ         := vJoGet.Items[i] as TJSONObject;
          vId               := vJoGetJ.GetValue('id').value;
          TSyncPluviometroTalhoes.Filtered := false;
          TSyncPluviometroTalhoes.Filter   := 'id='+vId;
          TSyncPluviometroTalhoes.Filtered := true;
          if not TSyncPluviometroTalhoes.IsEmpty then
           TSyncPluviometroTalhoes.Edit
          else
           TSyncPluviometroTalhoes.Insert;
          for z := 0 to TSyncPluviometroTalhoes.Fields.Count -1 do
          begin
           vField                                        := StringReplace(TSyncPluviometroTalhoes.Fields[z].Name,'TSyncPluviometroTalhoes','',[rfReplaceAll]);
           TSyncPluviometroTalhoes.FieldByName(vField).AsString := vJoGetJ.GetValue(vField).value;
          end;
          TSyncPluviometroTalhoes.ApplyUpdates(-1);
       end;
       result:='Pluviometro Talhoes Baixados com Sucesso!'
    end
    else
     Result :=vJsonString;
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;


function TdmSync.GetAtualizaStatusReceituario:string;
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I,J:integer;
 joName,objJson,joItem ,vJoGetJ: TJSONObject;
 joItems,vJoGet: TJSONArray;
 StrAux      : TStringWriter;
 txtJson     : TJsonTextWriter;
 LJsonObj    : TJSONObject;
begin
 TSyncAtualizaReceituario.Close;
 TSyncAtualizaReceituario.Open;
 if not TSyncAtualizaReceituario.IsEmpty then
 begin
   JsonToSend := TStringStream.Create(nil);
   TSyncAtualizaReceituario.SaveToStream(JsonToSend,sfJSON);
   Url := 'http://'+Host+':'+Porta+'/GetMudaStatusReceituario';
   IdHTTP1.Request.CustomHeaders.Clear;
   IdHTTP1.Request.ContentType := 'application/json';
   IdHTTP1.Request.Charset := 'UTF-8';
   IdHTTP1.Request.Clear;
   IdHTTP1.Request.BasicAuthentication := false;
   vReultHTTP  := IdHTTP1.Put(URL,JsonToSend);
   if(vReultHTTP<>'{"StatusRec":[{"Atencao":"Nenhum"}') then
    begin
      joName := TJSONObject.ParseJSONValue(vReultHTTP) as TJSONObject;
      joItems := joName.GetValue('result') as TJSONArray;
      for i  := 0 to joItems.Count-1 do
      begin
        joItem := joItems.Items[I] as TJSONObject;
        vJoGet := joItem.GetValue('StatusRec') as TJSONArray;
        for j := 0 to vJoGet.Count-1 do
        begin
          vJoGetJ         := vJoGet.Items[j] as TJSONObject;
          dmDB.AlteraStatusReceituario(vJoGetJ.GetValue('ID').value,vJoGetJ.GetValue('Status').value);
        end;
        result:='Detalhe Receituario Baixadas com Sucesso!'
      end;
    end
 end;
 Result     := vReultHTTP;
end;

function TdmSync.PostOperacaoSafraOcorrenciaAplSolidos(idOp:string):string;
var
 Txt         : TextFile;
 Quebra      : TStringList;
 LJSon       : TJSONArray;
 Url,URLDec,vReultHTTP,vReultHTTPc,
 vReultHTTPClean: String;
 JsonToSend  : TStringStream;
 i           : integer;
 StrAux      : TStringWriter;
 txtJson     : TJsonTextWriter;
 LJsonObj    : TJSONObject;
begin
  qryOpSafraOocorrencisSync.Close;
  qryOpSafraOocorrencisSync.Open;
  qryOpSafraOocorrencisSync.Filtered := false;
  qryOpSafraOocorrencisSync.Filter   := 'idoperacaotalhao='+idOp;
  qryOpSafraOocorrencisSync.Filtered := true;
  if not qryOpSafraOocorrencisSync.IsEmpty then
    begin
     qryOpSafraOocorrencisSync.First;
     while not qryOpSafraOocorrencisSync.Eof do
     begin
       StrAux  := TStringWriter.Create;
       txtJson := TJsonTextWriter.Create(StrAux);
       txtJson.Formatting := TJsonFormatting.Indented;
       txtJson.WriteStartObject;
       TxtJSON.WritePropertyName('OperacaoSafraOcorrencia');
        TxtJSON.WriteStartArray;
         txtJson.WriteStartObject;
           txtJson.WritePropertyName('idUsuario');
           txtJson.WriteValue(qryOpSafraOocorrencisSyncidusuario.AsString);
           txtJson.WritePropertyName('data');
           txtJson.WriteValue(qryOpSafraOocorrencisSyncdata.AsString);
           txtJson.WritePropertyName('idOperacao');
           txtJson.WriteValue(qryOpSafraOocorrencisSyncidoperacaotalhao.AsString);
           txtJson.WritePropertyName('idTipoOcorrencia');
           txtJson.WriteValue(qryOpSafraOocorrencisSyncidtipoocorrencia.AsString);
           txtJson.WritePropertyName('hora');
           txtJson.WriteValue(qryOpSafraOocorrencisSynchora.AsString);
           txtJson.WritePropertyName('descricao');
           txtJson.WriteValue(qryOpSafraOocorrencisSyncdescricao.AsString);
           txtJson.WriteEndObject;
       TxtJSON.WriteEndArray; //Fecha Array dos Itens
       txtJson.WriteEndObject;
       LJsonObj := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
       JsonToSend := TStringStream.Create(LJsonObj.ToJSON);
       Url := 'http://'+Host+':'+Porta+'/datasnap/rest/TServerMethods1/OperacaoSafraTalhaoOcorrencia';
       IdHTTP1.Request.CustomHeaders.Clear;
       IdHTTP1.Request.ContentType := 'application/json';
       IdHTTP1.Request.Charset := 'UTF-8';
       IdHTTP1.Request.Clear;
       IdHTTP1.Request.BasicAuthentication := false;
       try
         vReultHTTP  := IdHTTP1.Put(URL,JsonToSend);
         vReultHTTPc := copy(vReultHTTP,0,18);
         if vReultHTTPc='{"Ok":"' then
         begin
           vReultHTTPClean := StringReplace(vReultHTTP,vReultHTTPc,'',[rfReplaceAll]);
           vReultHTTPClean := StringReplace(vReultHTTPClean,'"}','',[rfReplaceAll]);
           Result          := vReultHTTPClean;
         end;
         qryOpSafraOocorrencisSync.Next;
         except
          on E: EIdHTTPProtocolException do
          begin
            Result   := ('Erro ao Sincronizar Ocorrencia:'+e.Message);
            Break;
          end;
         end;
       end;
    end;
end;

function TdmSync.PostOperacaoSafraProdutosAplSolidos(idOp:string):string;
var
 Txt         : TextFile;
 Quebra      : TStringList;
 LJSon       : TJSONArray;
 Url,URLDec,vReultHTTP,vReultHTTPc,
 vReultHTTPClean: String;
 JsonToSend  : TStringStream;
 i           : integer;
 StrAux      : TStringWriter;
 txtJson     : TJsonTextWriter;
 LJsonObj    : TJSONObject;
begin
  frmPrincipal.log.Lines.Add('Enviando Produtos:'+idOp);
  qryOpSafraProdutosSync.Close;
  frmPrincipal.log.Lines.Add('qryOpSafraProdutosSync.Close');
  qryOpSafraProdutosSync.Open;
  frmPrincipal.log.Lines.Add('qryOpSafraProdutosSync.Open');
  qryOpSafraProdutosSync.Filtered := false;
  qryOpSafraProdutosSync.Filter   := 'idoperacaotalhao='+idOp;
  qryOpSafraProdutosSync.Filtered := true;
  if not qryOpSafraProdutosSync.IsEmpty then
    begin
     qryOpSafraProdutosSync.First;
     while not qryOpSafraProdutosSync.Eof do
     begin
       StrAux  := TStringWriter.Create;
       txtJson := TJsonTextWriter.Create(StrAux);
       txtJson.Formatting := TJsonFormatting.Indented;
       txtJson.WriteStartObject;
       TxtJSON.WritePropertyName('OperacaoSafraProduto');
        TxtJSON.WriteStartArray;
         txtJson.WriteStartObject;
           txtJson.WritePropertyName('idUsuario');
           frmPrincipal.log.Lines.Add(qryOpSafraProdutosSyncidusuario.AsString);
           txtJson.WriteValue(qryOpSafraProdutosSyncidusuario.AsString);
           txtJson.WritePropertyName('idOperacao');
           frmPrincipal.log.Lines.Add(qryOpSafraProdutosSyncidoperacaotalhao.AsString);
           txtJson.WriteValue(qryOpSafraProdutosSyncidoperacaotalhao.AsString);
           txtJson.WritePropertyName('idProduto');
           frmPrincipal.log.Lines.Add(qryOpSafraProdutosSyncidproduto.AsString);
           txtJson.WriteValue(qryOpSafraProdutosSyncidproduto.AsString);
           txtJson.WritePropertyName('qtde');
           frmPrincipal.log.Lines.Add(qryOpSafraProdutosSyncqtdeutilidado.AsString);
           txtJson.WriteValue(qryOpSafraProdutosSyncqtdeutilidado.AsString);
           txtJson.WritePropertyName('observacao');
           frmPrincipal.log.Lines.Add(qryOpSafraProdutosSyncobservacao.AsString);
           txtJson.WriteValue(qryOpSafraProdutosSyncobservacao.AsString);
           txtJson.WritePropertyName('data');
           frmPrincipal.log.Lines.Add(qryOpSafraProdutosSyncdata.AsString);
           txtJson.WriteValue(qryOpSafraProdutosSyncdata.AsString);
           txtJson.WriteEndObject;
       TxtJSON.WriteEndArray; //Fecha Array dos Itens
       txtJson.WriteEndObject;
       LJsonObj := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
       JsonToSend := TStringStream.Create(LJsonObj.ToJSON);
       Url := 'http://'+Host+':'+Porta+'/datasnap/rest/TServerMethods1/OperacaoSafraTalhaoProduto';
       IdHTTP1.Request.CustomHeaders.Clear;
       IdHTTP1.Request.ContentType := 'application/json';
       IdHTTP1.Request.Charset := 'UTF-8';
       IdHTTP1.Request.Clear;
       IdHTTP1.Request.BasicAuthentication := false;
       try
         vReultHTTP  := IdHTTP1.Put(URL,JsonToSend);
         frmPrincipal.log.Lines.Add(vReultHTTP);
         vReultHTTPc := copy(vReultHTTP,0,18);
         if vReultHTTPc='{"Ok":"' then
         begin
           vReultHTTPClean := StringReplace(vReultHTTP,vReultHTTPc,'',[rfReplaceAll]);
           vReultHTTPClean := StringReplace(vReultHTTPClean,'"}','',[rfReplaceAll]);
           Result          := vReultHTTPClean;
         end;
         qryOpSafraProdutosSync.Next;
         except
          on E: EIdHTTPProtocolException do
          begin
            Result          := ('Erro ao Sincronizar Produto:'+e.Message);
            Break;
          end;
         end;
       end;
    end;
end;

function TdmSync.PostOperacaoSafraMaquinasAplSolidos(idOp:string):string;
var
 Txt         : TextFile;
 Quebra      : TStringList;
 LJSon       : TJSONArray;
 Url,URLDec,vReultHTTP,vReultHTTPc,
 vReultHTTPClean: String;
 JsonToSend  : TStringStream;
 i,C           : integer;
 StrAux      : TStringWriter;
 txtJson     : TJsonTextWriter;
 LJsonObj    : TJSONObject;
begin
  frmPrincipal.log.Lines.Add('Enviando Maquina Operacao:'+idOp);
  try
    AbreMaquinaSafraTalhao(idOp);
  except
   on E : Exception do
    frmPrincipal.myShowMenssagem('Erro ao Sincronizar Operacao:'+e.Message);
  end;
  frmPrincipal.log.Lines.Add('Qtd Registro:'+intToStr(qryOpSafraMaquinasSync.RecordCount));
  C := qryOpSafraMaquinasSync.RecordCount;
  if not qryOpSafraMaquinasSync.IsEmpty then
    begin
     qryOpSafraMaquinasSync.First;
     while not qryOpSafraMaquinasSync.Eof do
     begin
       StrAux  := TStringWriter.Create;
       txtJson := TJsonTextWriter.Create(StrAux);
       txtJson.Formatting := TJsonFormatting.Indented;
       txtJson.WriteStartObject;
       TxtJSON.WritePropertyName('OperacaoSafraMaquina');
        TxtJSON.WriteStartArray;
         txtJson.WriteStartObject;
           txtJson.WritePropertyName('idUsuario');
           frmPrincipal.log.Lines.Add(qryOpSafraMaquinasSync.FieldByName('idusuario').AsString);
           txtJson.WriteValue(qryOpSafraMaquinasSync.FieldByName('idusuario').AsString);
           txtJson.WritePropertyName('idOperacao');
           frmPrincipal.log.Lines.Add(qryOpSafraMaquinasSync.FieldByName('idoperacaotalhao').AsString);
           txtJson.WriteValue(qryOpSafraMaquinasSync.FieldByName('idoperacaotalhao').AsString);
           txtJson.WritePropertyName('idMaquina');
           frmPrincipal.log.Lines.Add(qryOpSafraMaquinasSync.FieldByName('idMaquina').AsString);
           txtJson.WriteValue(qryOpSafraMaquinasSync.FieldByName('idMaquina').AsString);
           txtJson.WritePropertyName('operador');
           frmPrincipal.log.Lines.Add(qryOpSafraMaquinasSync.FieldByName('operador').AsString);
           txtJson.WriteValue(qryOpSafraMaquinasSync.FieldByName('operador').AsString);
           txtJson.WritePropertyName('horaInicio');
           frmPrincipal.log.Lines.Add(qryOpSafraMaquinasSync.FieldByName('horaInicio').AsString);
           txtJson.WriteValue(qryOpSafraMaquinasSync.FieldByName('horaInicio').AsString);
           txtJson.WritePropertyName('horaFim');
           frmPrincipal.log.Lines.Add(qryOpSafraMaquinasSync.FieldByName('horafim').AsString);
           txtJson.WriteValue(qryOpSafraMaquinasSync.FieldByName('horafim').AsString);
           txtJson.WritePropertyName('horaParado');
           frmPrincipal.log.Lines.Add(qryOpSafraMaquinasSync.FieldByName('horaparada').AsString);
           txtJson.WriteValue(qryOpSafraMaquinasSync.FieldByName('horaparada').AsString);
           txtJson.WritePropertyName('horaTrabalhada');
           frmPrincipal.log.Lines.Add(qryOpSafraMaquinasSync.FieldByName('horaTrabalhada').AsString);
           txtJson.WriteValue(qryOpSafraMaquinasSync.FieldByName('horaTrabalhada').AsString);
           txtJson.WritePropertyName('observasao');
           frmPrincipal.log.Lines.Add(qryOpSafraMaquinasSync.FieldByName('observacao').AsString);
           txtJson.WriteValue(qryOpSafraMaquinasSync.FieldByName('observacao').AsString);
           txtJson.WritePropertyName('data');
           frmPrincipal.log.Lines.Add(qryOpSafraMaquinasSync.FieldByName('data').AsString);
           txtJson.WriteValue(qryOpSafraMaquinasSync.FieldByName('data').AsString);
           txtJson.WritePropertyName('idOperador');
           frmPrincipal.log.Lines.Add(qryOpSafraMaquinasSync.FieldByName('idOperador').AsString);
           txtJson.WriteValue(qryOpSafraMaquinasSync.FieldByName('idOperador').AsString);
           txtJson.WriteEndObject;
       TxtJSON.WriteEndArray; //Fecha Array dos Itens
       txtJson.WriteEndObject;
       LJsonObj := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
       JsonToSend := TStringStream.Create(LJsonObj.ToJSON);
       Url := 'http://'+Host+':'+Porta+'/datasnap/rest/TServerMethods1/OperacaoSafraTalhaoMaquinas';
       IdHTTP1.Request.CustomHeaders.Clear;
       IdHTTP1.Request.ContentType := 'application/json';
       IdHTTP1.Request.Charset := 'UTF-8';
       IdHTTP1.Request.Clear;
       IdHTTP1.Request.BasicAuthentication := false;
       try
         vReultHTTP  := IdHTTP1.Put(URL,JsonToSend);
         frmPrincipal.log.Lines.Add(vReultHTTP);
         vReultHTTPc := copy(vReultHTTP,0,18);
         if vReultHTTPc='{"Ok":"' then
         begin
           vReultHTTPClean := StringReplace(vReultHTTP,vReultHTTPc,'',[rfReplaceAll]);
           vReultHTTPClean := StringReplace(vReultHTTPClean,'"}','',[rfReplaceAll]);
           Result          := vReultHTTPClean;
         end;
         qryOpSafraMaquinasSync.Next;
         except
          on E: EIdHTTPProtocolException do
          begin
            Result          := ('Erro ao Sincronizar Operacao:'+e.Message);
            Break;
          end;
         end;
       end;
    end;
end;

function TdmSync.PostOperacaoSafraMaquinasPulverizacao(idOp,
  idTalhao: string): string;
var
 Txt         : TextFile;
 Quebra      : TStringList;
 LJSon       : TJSONArray;
 Url,URLDec,vReultHTTP,vReultHTTPc,
 vReultHTTPClean: String;
 JsonToSend  : TStringStream;
 i           : integer;
 StrAux      : TStringWriter;
 txtJson     : TJsonTextWriter;
 LJsonObj    : TJSONObject;
begin
  qryOpSafraPulverizacaoMaquina.Close;
  qryOpSafraPulverizacaoMaquina.Open;
  qryOpSafraPulverizacaoMaquina.Filtered := false;
  qryOpSafraPulverizacaoMaquina.Filter   := 'idoperacaotalhao='+idOp+' and idTalhao='+idTalhao;
  qryOpSafraPulverizacaoMaquina.Filtered := true;
  if not qryOpSafraPulverizacaoMaquina.IsEmpty then
    begin
     qryOpSafraPulverizacaoMaquina.First;
     while not qryOpSafraPulverizacaoMaquina.Eof do
     begin
       StrAux  := TStringWriter.Create;
       txtJson := TJsonTextWriter.Create(StrAux);
       txtJson.Formatting := TJsonFormatting.Indented;
       txtJson.WriteStartObject;
       TxtJSON.WritePropertyName('OperacaoSafraMaquina');
        TxtJSON.WriteStartArray;
         txtJson.WriteStartObject;
           txtJson.WritePropertyName('idUsuario');
           txtJson.WriteValue(qryOpSafraPulverizacaoMaquinaidusuario.AsString);
           txtJson.WritePropertyName('idOperacao');
           txtJson.WriteValue(qryOpSafraPulverizacaoMaquinaidoperacaotalhao.AsString);
           txtJson.WritePropertyName('idMaquina');
           txtJson.WriteValue(qryOpSafraPulverizacaoMaquinaidMaquina.AsString);
           txtJson.WritePropertyName('operador');
           txtJson.WriteValue(qryOpSafraPulverizacaoMaquinaoperador.AsString);
           txtJson.WritePropertyName('horaInicio');
           txtJson.WriteValue(qryOpSafraPulverizacaoMaquinahoraInicio.AsString);
           txtJson.WritePropertyName('horaFim');
           txtJson.WriteValue(qryOpSafraPulverizacaoMaquinahorafim.AsString);
           txtJson.WritePropertyName('horaParado');
           txtJson.WriteValue(qryOpSafraPulverizacaoMaquinahoraparada.AsString);
           txtJson.WritePropertyName('observasao');
           txtJson.WriteValue(qryOpSafraPulverizacaoMaquinaobservacao.AsString);
           txtJson.WritePropertyName('data');
           txtJson.WriteValue(qryOpSafraPulverizacaoMaquinadata.AsString);
           txtJson.WriteEndObject;
       TxtJSON.WriteEndArray; //Fecha Array dos Itens
       txtJson.WriteEndObject;
       LJsonObj := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
       JsonToSend := TStringStream.Create(LJsonObj.ToJSON);
       Url := 'http://'+Host+':'+Porta+'/datasnap/rest/TServerMethods1/OperacaoSafraTalhaoMaquinas';
       IdHTTP1.Request.CustomHeaders.Clear;
       IdHTTP1.Request.ContentType := 'application/json';
       IdHTTP1.Request.Charset := 'UTF-8';
       IdHTTP1.Request.Clear;
       IdHTTP1.Request.BasicAuthentication := false;
       try
         vReultHTTP  := IdHTTP1.Put(URL,JsonToSend);
         vReultHTTPc := copy(vReultHTTP,0,18);
         if vReultHTTPc='{"Ok":"' then
         begin
           vReultHTTPClean := StringReplace(vReultHTTP,vReultHTTPc,'',[rfReplaceAll]);
           vReultHTTPClean := StringReplace(vReultHTTPClean,'"}','',[rfReplaceAll]);
           Result          := vReultHTTPClean;
         end;
         qryOpSafraPulverizacaoMaquina.Next;
         except
          on E: EIdHTTPProtocolException do
          begin
            Result          := ('Erro ao Sincronizar Operacao:'+e.Message);
            Break;
          end;
         end;
       end;
    end;

end;

function TdmSync.PostOperacaoSafraPulverizacao:string;
var
 Txt         : TextFile;
 Quebra      : TStringList;
 LJSon       : TJSONArray;
 Url,URLDec,vReultHTTP,vReultHTTPc,
 vReultHTTPClean: String;
 JsonToSend  : TStringStream;
 i           : integer;
 StrAux      : TStringWriter;
 txtJson     : TJsonTextWriter;
 LJsonObj    : TJSONObject;
begin
  //Sincroniza Aplicaçao de Solidos
  qryOpSafraPulverizacao.Close;
  qryOpSafraPulverizacao.Open;
    if not qryOpSafraPulverizacao.IsEmpty then
    begin
     qryOpSafraPulverizacao.First;
     while not qryOpSafraPulverizacao.Eof do
     begin
       StrAux  := TStringWriter.Create;
       txtJson := TJsonTextWriter.Create(StrAux);
       txtJson.Formatting := TJsonFormatting.Indented;
       txtJson.WriteStartObject;
       TxtJSON.WritePropertyName('OperacaoSafra');
        TxtJSON.WriteStartArray;
         txtJson.WriteStartObject;
           txtJson.WritePropertyName('idUsuario');
           txtJson.WriteValue(qryOpSafraPulverizacaoidusuario.AsString);
           txtJson.WritePropertyName('idSafra');
           txtJson.WriteValue(qryOpSafraPulverizacaoidsafra.AsString);
           txtJson.WritePropertyName('idOperacao');
           txtJson.WriteValue(qryOpSafraPulverizacaoidoperacao.AsString);
           txtJson.WritePropertyName('dataInicio');
           txtJson.WriteValue(qryOpSafraPulverizacaodatainicio.AsString);
           txtJson.WritePropertyName('dataFim');
           txtJson.WriteValue(qryOpSafraPulverizacaodataFim.AsString);
           txtJson.WritePropertyName('observacao');
           txtJson.WriteValue(qryOpSafraPulverizacaoobservacao.AsString);
           txtJson.WritePropertyName('idTalhao');
//           txtJson.WriteValue(qryOpSafraPulverizacaoidTalhao_1.AsString);
           txtJson.WritePropertyName('areaPrev');
           txtJson.WriteValue(qryOpSafraPulverizacaoareaprevista.AsString);
           txtJson.WritePropertyName('areaReal');
           txtJson.WriteValue(qryOpSafraPulverizacaoarearealizada.AsString);
           txtJson.WritePropertyName('finalidade');
           txtJson.WriteValue(qryOpSafraPulverizacaofinalidade.AsString);
           txtJson.WritePropertyName('IdTipoaplicacaosolido');
           txtJson.WriteValue(qryOpSafraPulverizacaoidtipoaplicacaosolido.AsString);
           txtJson.WritePropertyName('idcultura');
           txtJson.WriteValue(qryOpSafraPulverizacaoidcultura.AsString);
           txtJson.WritePropertyName('idreceituario');
           txtJson.WriteValue(qryOpSafraPulverizacaoidreceituario.AsString);
           txtJson.WritePropertyName('tipoterraaereo');
           txtJson.WriteValue(qryOpSafraPulverizacaotipoterraaereo.AsString);
           txtJson.WriteEndObject;
       TxtJSON.WriteEndArray; //Fecha Array dos Itens
       txtJson.WriteEndObject;
       LJsonObj := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
       JsonToSend := TStringStream.Create(LJsonObj.ToJSON);
       Url := 'http://'+Host+':'+Porta+'/datasnap/rest/TServerMethods1/OperacaoSafraTalhao';
       IdHTTP1.Request.CustomHeaders.Clear;
       IdHTTP1.Request.ContentType := 'application/json';
       IdHTTP1.Request.Charset := 'UTF-8';
       IdHTTP1.Request.Clear;
       IdHTTP1.Request.BasicAuthentication := false;
       try
         vReultHTTP  := IdHTTP1.Put(URL,JsonToSend);
         vReultHTTPc := copy(vReultHTTP,0,18);
         if vReultHTTPc='{"Ok":"' then
         begin
           vReultHTTPClean := StringReplace(vReultHTTP,vReultHTTPc,'',[rfReplaceAll]);
           vReultHTTPClean := StringReplace(vReultHTTPClean,'"}','',[rfReplaceAll]);
           dmDB.AtualizaIdOperacao(qryOpSafraPulverizacaoid.AsString,vReultHTTPClean);
           PostOperacaoSafraMaquinasAplSolidos(vReultHTTPClean);
           PostOperacaoSafraProdutosAplSolidos(vReultHTTPClean);
           PostOperacaoSafraOcorrenciaAplSolidos(vReultHTTPClean);
         end;
         qryOpSafraPulverizacao.Next;
         except
          on E: EIdHTTPProtocolException do
          begin
            frmPrincipal.myShowMenssagem('Erro ao Sincronizar Operacao:'+e.Message);
            Break;
          end;
       end;
     end;
    end;//Fim Aplicacao Solidos
end;

function TdmSync.PostReceituario: string;
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 TThread.Synchronize(nil,procedure
 begin
  TSyncReceituario.Close;
  TSyncReceituario.Open;
 end);
 if not TSyncReceituario.IsEmpty then
 begin
   JsonToSend := TStringStream.Create(nil);
   TSyncReceituario.SaveToStream(JsonToSend,sfJSON);
   Url := 'http://'+Host+':'+Porta+'/datasnap/rest/TServerMethods1/OperacaoSafraReceituario';
   IdHTTP1.Request.CustomHeaders.Clear;
   IdHTTP1.Request.ContentType := 'application/json';
   IdHTTP1.Request.Charset := 'UTF-8';
   IdHTTP1.Request.Clear;
   IdHTTP1.Request.BasicAuthentication := false;
   vReultHTTP  := IdHTTP1.Put(URL,JsonToSend);
   if copy(vReultHTTP,0,18)='{"OK":"'then
   begin
     dmSync.PostReceituarioDet(TSyncReceituario.FieldByName('id').AsString);
     dmSync.PostReceituarioDetTalhao(TSyncReceituario.FieldByName('id').AsString);

     vReultHTTP := StringReplace(vReultHTTP,'{"OK":"','',[rfReplaceAll]);
     vReultHTTP := StringReplace(vReultHTTP,'"}','',[rfReplaceAll]);
     dmDB.AlteraStatusReceituario(vReultHTTP,'1');
   end;
 end;
 Result     := vReultHTTP;
end;

function TdmSync.PostStandPlantas: string;
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 TThread.Synchronize(nil,procedure
 begin
  TSyncStandPlantas.Close;
  TSyncStandPlantas.Open;
 end);
 if not TSyncStandPlantas.IsEmpty then
 begin
   JsonToSend := TStringStream.Create(nil);
   TSyncStandPlantas.SaveToStream(JsonToSend,sfJSON);
   Url := 'http://'+Host+':'+Porta+'/datasnap/rest/TServerMethods1/OperacaoStandPlantas';
   IdHTTP1.Request.CustomHeaders.Clear;
   IdHTTP1.Request.ContentType := 'application/json';
   IdHTTP1.Request.Charset := 'UTF-8';
   IdHTTP1.Request.Clear;
   IdHTTP1.Request.BasicAuthentication := false;
   vReultHTTP  := IdHTTP1.Put(URL,JsonToSend);
   if copy(vReultHTTP,0,18)='{"OK":"'then
   begin
     AlterarFlagSyncStand;
     vReultHTTP := StringReplace(vReultHTTP,'{"OK":"','',[rfReplaceAll]);
     vReultHTTP := StringReplace(vReultHTTP,'"}','',[rfReplaceAll]);
   end;
 end;
 Result     := vReultHTTP;
end;

function TdmSync.PostPluviometria: string;
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 TThread.Synchronize(nil,procedure
 begin
  TSyncPluviometria.Close;
  TSyncPluviometria.Open;
 end);
 if not TSyncPluviometria.IsEmpty then
 begin
   JsonToSend := TStringStream.Create(nil);
   TSyncPluviometria.SaveToStream(JsonToSend,sfJSON);
   Url := 'http://'+Host+':'+Porta+'/datasnap/rest/TServerMethods1/Pluviometria';
   IdHTTP1.Request.CustomHeaders.Clear;
   IdHTTP1.Request.ContentType := 'application/json';
   IdHTTP1.Request.Charset := 'UTF-8';
   IdHTTP1.Request.Clear;
   IdHTTP1.Request.BasicAuthentication := false;
   vReultHTTP  := IdHTTP1.Put(URL,JsonToSend);
   if copy(vReultHTTP,0,18)='{"OK":"'then
   begin
     AlterarFlagSyncPluviometria;
     vReultHTTP := StringReplace(vReultHTTP,'{"OK":"','',[rfReplaceAll]);
     vReultHTTP := StringReplace(vReultHTTP,'"}','',[rfReplaceAll]);
   end;
 end;
 Result     := vReultHTTP;
end;

function TdmSync.PostToken: string;
var
   URL,vReultHTTP:STRING;
   JsonToSend  : TStringStream;
   I:integer;
   Txt         : TextFile;
   Quebra      : TStringList;
   LJSon       : TJSONArray;
   vReultHTTPc,
   vReultHTTPClean: String;
   StrAux      : TStringWriter;
   txtJson     : TJsonTextWriter;
   LJsonObj    : TJSONObject;
begin
 if frmPrincipal.device_token.Length>0 then
 begin
     JsonToSend := TStringStream.Create(nil);
     StrAux  := TStringWriter.Create;
       txtJson := TJsonTextWriter.Create(StrAux);
       txtJson.Formatting := TJsonFormatting.Indented;
       txtJson.WriteStartObject;
       TxtJSON.WritePropertyName('TokenApp');
        TxtJSON.WriteStartArray;
         txtJson.WriteStartObject;
           txtJson.WritePropertyName('Token');
           txtJson.WriteValue(frmPrincipal.device_token);
           txtJson.WritePropertyName('idUsuario');
           txtJson.WriteValue(dmDB.vIdUser);
         txtJson.WriteEndObject;
        TxtJSON.WriteEndArray; //Fecha Array dos Itens
       txtJson.WriteEndObject;
       LJsonObj := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
       JsonToSend := TStringStream.Create(LJsonObj.ToJSON);
       Url := 'http://'+Host+':'+Porta+'/datasnap/rest/TServerMethods1/TonkenApp';
       IdHTTP1.Request.CustomHeaders.Clear;
       IdHTTP1.Request.ContentType := 'application/json';
       IdHTTP1.Request.Charset := 'UTF-8';
       IdHTTP1.Request.Clear;
       IdHTTP1.Request.BasicAuthentication := false;
       vReultHTTP  := IdHTTP1.Put(URL,JsonToSend);
       if copy(vReultHTTP,0,18)='{"OK":"'then
       begin
         vReultHTTP := StringReplace(vReultHTTP,'{"OK":"','',[rfReplaceAll]);
         vReultHTTP := StringReplace(vReultHTTP,'"}','',[rfReplaceAll]);
       end;
     Result     := vReultHTTP;
 end;
end;

function TdmSync.PostReceituarioDet(idReceituario: string): string;
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 AbreDetReceituario(idReceituario);
 if not TSyncDetReceituario.IsEmpty then
 begin
   JsonToSend := TStringStream.Create(nil);
   TSyncDetReceituario.SaveToStream(JsonToSend,sfJSON);
   Url := 'http://'+Host+':'+Porta+'/datasnap/rest/TServerMethods1/OperacaoDetReceituario';
   IdHTTP1.Request.CustomHeaders.Clear;
   IdHTTP1.Request.ContentType := 'application/json';
   IdHTTP1.Request.Charset := 'UTF-8';
   IdHTTP1.Request.Clear;
   IdHTTP1.Request.BasicAuthentication := false;
   vReultHTTP  := IdHTTP1.Put(URL,JsonToSend);
   if copy(vReultHTTP,0,18)='{"OK":"'then
   begin
     vReultHTTP := StringReplace(vReultHTTP,'{"OK":"','',[rfReplaceAll]);
     vReultHTTP := StringReplace(vReultHTTP,'"}','',[rfReplaceAll]);
   end;
 end;
 Result     := vReultHTTP;
end;

function TdmSync.PostReceituarioDetTalhao(idReceituario: string): string;
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 AbreDetReceituarioTalhao(idReceituario);
 if not TSyncDetReceituarioTalhao.IsEmpty then
 begin
   JsonToSend := TStringStream.Create(nil);
   TSyncDetReceituarioTalhao.SaveToStream(JsonToSend,sfJSON);
   Url := 'http://'+Host+':'+Porta+'/datasnap/rest/TServerMethods1/OperacaoDetReceituarioTalhao';
   IdHTTP1.Request.CustomHeaders.Clear;
   IdHTTP1.Request.ContentType := 'application/json';
   IdHTTP1.Request.Charset := 'UTF-8';
   IdHTTP1.Request.Clear;
   IdHTTP1.Request.BasicAuthentication := false;
   vReultHTTP  := IdHTTP1.Put(URL,JsonToSend);
   if copy(vReultHTTP,0,18)='{"OK":"'then
   begin
     vReultHTTP := StringReplace(vReultHTTP,'{"OK":"','',[rfReplaceAll]);
     vReultHTTP := StringReplace(vReultHTTP,'"}','',[rfReplaceAll]);
   end;
 end;
 Result     := vReultHTTP;
end;

function TdmSync.TestaServidor: string;
var
 Url,vJsonString,vID:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url :='http://'+Host+':'+Porta+'/GetTestaServidor';
   IdHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := IdHTTP1.Get(URL);
    Result:= vJsonString;
   except
     Result  := 'Erro';
   end;

end;

procedure TdmSync.TSyncPragasReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
 TThread.Synchronize(nil, procedure
 begin
  ShowMessage(e.Message);
 end);
end;

function TdmSync.VerificaReceituarioExiste(id: string): Boolean;
begin
 with dmDB.TReceituario,dmDB.TReceituario.SQL do
 begin
   Clear;
   Add('select * from receiturario');
   Add('where id='+Id);
   Open;
   Result := dmDB.TReceituario.IsEmpty;
 end;
end;

function TdmSync.PostOperacaoSafraAplSolidos:string;
var
 Txt         : TextFile;
 Quebra      : TStringList;
 LJSon       : TJSONArray;
 Url,URLDec,vReultHTTP,vReultHTTPc,
 vReultHTTPClean: String;
 JsonToSend  : TStringStream;
 i,x         : integer;
 StrAux      : TStringWriter;
 txtJson     : TJsonTextWriter;
 LJsonObj    : TJSONObject;
begin
  //Sincroniza Aplicaçao de Solidos
    I:=0;
    x:=1;
    qryOpSafraSync.Close;
    qryOpSafraSync.Open;
    qryOpSafraSync.First;
    if not qryOpSafraSync.IsEmpty then
    begin
     while not qryOpSafraSync.Eof do
     begin
       frmPrincipal.log.Lines.Add('Enviando Atividade :'+intToStr(x)+ ' De '+ frmPrincipal.vAtvPendente);
       StrAux  := TStringWriter.Create;
       txtJson := TJsonTextWriter.Create(StrAux);
       txtJson.Formatting := TJsonFormatting.Indented;
       txtJson.WriteStartObject;
       TxtJSON.WritePropertyName('OperacaoSafra');
        TxtJSON.WriteStartArray;
         txtJson.WriteStartObject;
           txtJson.WritePropertyName('idUsuario');
           txtJson.WriteValue(qryOpSafraSyncidusuario.AsString);
           txtJson.WritePropertyName('idSafra');
           txtJson.WriteValue(qryOpSafraSyncidsafra.AsString);
           txtJson.WritePropertyName('idOperacao');
           txtJson.WriteValue(qryOpSafraSyncidoperacao.AsString);
           txtJson.WritePropertyName('dataInicio');
           txtJson.WriteValue(qryOpSafraSyncdatainicio.AsString);
           txtJson.WritePropertyName('dataFim');
           txtJson.WriteValue(qryOpSafraSyncdataFim.AsString);
           txtJson.WritePropertyName('observacao');
           txtJson.WriteValue(qryOpSafraSyncobservacao.AsString);
           txtJson.WritePropertyName('idTalhao');
           txtJson.WriteValue(qryOpSafraSyncidTalhao.AsString);
           txtJson.WritePropertyName('areaPrev');
           txtJson.WriteValue(qryOpSafraSyncareaprevista.AsString);
           txtJson.WritePropertyName('areaReal');
           txtJson.WriteValue(qryOpSafraSyncarearealizada.AsString);
           txtJson.WritePropertyName('finalidade');
           txtJson.WriteValue(qryOpSafraSyncfinalidade.AsString);
           txtJson.WritePropertyName('IdTipoaplicacaosolido');
           txtJson.WriteValue(qryOpSafraSyncidtipoaplicacaosolido.AsString);
           txtJson.WritePropertyName('idcultura');
           txtJson.WriteValue(qryOpSafraSyncidcultura.AsString);
           txtJson.WritePropertyName('idreceituario');
           txtJson.WriteValue(qryOpSafraSyncidreceituario.AsString);
           txtJson.WritePropertyName('tipoterraaereo');
           txtJson.WriteValue(qryOpSafraSynctipoterraaereo.AsString);
           txtJson.WritePropertyName('idcobertura');
           txtJson.WriteValue(qryOpSafraSyncidcobertura.AsString);
           txtJson.WritePropertyName('qualidadeCobertura');
           txtJson.WriteValue(qryOpSafraSyncQualidadeCobertura.AsString);
           txtJson.WritePropertyName('idvariedade');
           txtJson.WriteValue(qryOpSafraSyncidvariedade.AsString);
           txtJson.WriteEndObject;
       TxtJSON.WriteEndArray; //Fecha Array dos Itens
       txtJson.WriteEndObject;
       LJsonObj := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
       JsonToSend := TStringStream.Create(LJsonObj.ToJSON);
       Url := 'http://'+Host+':'+Porta+'/datasnap/rest/TServerMethods1/OperacaoSafraTalhao';
       IdHTTP1.Request.CustomHeaders.Clear;
       IdHTTP1.Request.ContentType := 'application/json';
       IdHTTP1.Request.Charset := 'UTF-8';
       IdHTTP1.Request.Clear;
       IdHTTP1.Request.BasicAuthentication := false;
       try
         vReultHTTP  := IdHTTP1.Put(URL,JsonToSend);
         vReultHTTPc := copy(vReultHTTP,0,18);
         frmPrincipal.log.Lines.Add(vReultHTTPc);
         if vReultHTTPc='{"Ok":"' then
         begin
           vReultHTTPClean := StringReplace(vReultHTTP,vReultHTTPc,'',[rfReplaceAll]);
           vReultHTTPClean := StringReplace(vReultHTTPClean,'"}','',[rfReplaceAll]);
           frmPrincipal.log.Lines.Add('Atualizando Operacao:'+vReultHTTPClean);
           dmDB.AtualizaIdOperacao(qryOpSafraSyncid.AsString,vReultHTTPClean);
           frmPrincipal.log.Lines.Add('Enviando Maquinas operação:'+vReultHTTPClean);
           PostOperacaoSafraMaquinasAplSolidos(vReultHTTPClean);
           frmPrincipal.log.Lines.Add('Enviando Produtos operação:'+vReultHTTPClean);
           PostOperacaoSafraProdutosAplSolidos(vReultHTTPClean);
           frmPrincipal.log.Lines.Add('Enviando Ocorrencia operação:'+vReultHTTPClean);
           PostOperacaoSafraOcorrenciaAplSolidos(vReultHTTPClean);
           frmPrincipal.log.Lines.Add('Enviando Vazao operação:'+vReultHTTPClean);
           PostOperacaoSafraVazaoPul(vReultHTTPClean);
           frmPrincipal.log.Lines.Add('Mudando Flag operação:'+vReultHTTPClean);
           dmDB.AlteraFlagSyncOperaca(vReultHTTPClean);
         end;
         except
          on E: EIdHTTPProtocolException do
          begin
            frmPrincipal.log.Lines.Add('Erro ao Sincronizar Operacao:'+e.Message);
            frmPrincipal.myShowMenssagem('Erro ao Sincronizar Operacao:'+e.Message);
            Break;
          end;
       end;
       inc(i);
       inc(x);
       if I=qryOpSafraSync.RecordCount then
        Break;
       qryOpSafraSync.Next;
     end;
    end;//Fim Aplicacao Solidos
end;

function TdmSync.GetOperacoes: string;
var
 Url,vJsonString,vID:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url :='http://'+Host+':'+Porta+'/GetOperacoes';
   IdHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := IdHTTP1.Get(URL);
    if(vJsonString<>'{"Mensagem":"Nenhuma Operacao encontrada!"}') then
    begin
      jSubObj  := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
       vJoGet := jSubObj.GetValue<TJSONArray>('Operacoes') as TJSONArray;
       for i := 0 to vJoGet.Count-1 do
       begin
          vJoGetJ         := vJoGet.Items[i] as TJSONObject;
          vID             := vJoGetJ.GetValue('ID').value;
          dmDB.TOperacoes.Close;
          dmDB.TOperacoes.Open;
          dmDB.TOperacoes.Filtered := false;
          dmDB.TOperacoes.Filter   := 'ID='+vId.QuotedString;
          dmDB.TOperacoes.Filtered := true;
          if dmDB.TOperacoes.RecordCount>0 then
            dmDB.TOperacoes.Edit
          else
          begin
            dmDB.TOperacoes.Close;
            dmDB.TOperacoes.Open;
            dmDB.TOperacoes.Insert;
          end;
          dmDB.TOperacoesId.AsString                 := vId;
          dmDB.TOperacoesstatus.AsString             := vJoGetJ.GetValue('Status').value;
          dmDB.TOperacoesnome.AsString               := vJoGetJ.GetValue('Nome').value;
          try
           dmDB.TOperacoes.ApplyUpdates(-1);
          except
            on E: Exception do
             result:=('Erro: ' + E.Message );
          end;
       end;
       result:='Operacoes Baixados com Sucesso!'
    end
    else
     Result :=dmDB.LimpaResut(vJsonString);
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

function TdmSync.GetProdutos: string;
var
 Url,vJsonString,vID:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url :='http://'+Host+':'+Porta+'/GetProdutos';
   IdHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := IdHTTP1.Get(URL);
    if(vJsonString<>'{"Mensagem":"Nenhum Produto encontrado!"}') then
    begin
      jSubObj  := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
       vJoGet := jSubObj.GetValue<TJSONArray>('Produtos') as TJSONArray;
       for i := 0 to vJoGet.Count-1 do
       begin
          vJoGetJ         := vJoGet.Items[j] as TJSONObject;
          vID             := vJoGetJ.GetValue('ID').value;
          dmDB.TProdutos.Close;
          dmDB.TProdutos.Open;
          dmDB.TProdutos.Filtered := false;
          dmDB.TProdutos.Filter   := 'ID='+vId.QuotedString;
          dmDB.TProdutos.Filtered := true;
          if dmDB.TProdutos.RecordCount>0 then
            dmDB.TProdutos.Edit
          else
          begin
            dmDB.TProdutos.Close;
            dmDB.TProdutos.Open;
            dmDB.TProdutos.Insert;
          end;
          dmDB.TProdutosId.AsString                 := vId;
          dmDB.TProdutosstatus.AsString             := vJoGetJ.GetValue('Status').value;
          dmDB.TProdutostipo.AsString               := vJoGetJ.GetValue('Tipo').value;
          dmDB.TProdutosnome.AsString               := vJoGetJ.GetValue('Nome').value;
          dmDB.TProdutosunidademedida.AsString      := vJoGetJ.GetValue('UnidadeMedida').value;
          dmDB.TProdutosobservacao.AsString         := vJoGetJ.GetValue('Observacao').value;
          dmDB.TProdutoscodigobarras.AsString       := vJoGetJ.GetValue('CodigoBarras').value;
          dmDB.TProdutosdefencivo.AsString          := vJoGetJ.GetValue('Defencivo').Value;
          try
           dmDB.TProdutos.ApplyUpdates(-1);
          except
            on E: Exception do
             result:=('Erro: ' + E.Message );
          end;
       end;
       result:='Produtos Baixados com Sucesso!'
    end
    else
     Result :=dmDB.LimpaResut(vJsonString);
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

function TdmSync.GetReceituario: string;
var
 Url,vJsonString,vID:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url :='http://'+Host+':'+Porta+'/GetReceituario';
   IdHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := IdHTTP1.Get(URL);
    if(vJsonString<>'{"Mensagem":"Nenhum Receituario encontrado!"}') then
    begin
      jSubObj  := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
       vJoGet := jSubObj.GetValue<TJSONArray>('Receituario') as TJSONArray;
       for i := 0 to vJoGet.Count-1 do
       begin
          vJoGetJ         := vJoGet.Items[i] as TJSONObject;
          vID             := vJoGetJ.GetValue('ID').value;
          if dmSync.VerificaReceituarioExiste(vID) then
          begin
            dmDB.TReceituario.Insert;
            dmDB.TReceituarioId.AsString                 := vId;
            dmDB.TReceituariostatus.AsString             := vJoGetJ.GetValue('Status').value;
            dmDB.TReceituarionome.AsString               := vJoGetJ.GetValue('Nome').value;
            dmDB.TReceituarioresponsavel.AsString        := vJoGetJ.GetValue('Responsavel').value;
            dmDB.TReceituarioDataRegistro.AsString       := vJoGetJ.GetValue('DataReg').value;
            try
             dmDB.TReceituario.ApplyUpdates(-1);
            DeletaDetReceituario(vId);
            dmSync.GetDetReceituario(vId);
            dmSync.GetDetReceituarioTalhoes(vId);
            except
              on E: Exception do
               result:=('Erro: ' + E.Message );
            end;
          end
          else
          begin
            dmDB.TReceituario.Edit;
            dmDB.TReceituariostatus.AsString             := vJoGetJ.GetValue('Status').value;
            try
             dmDB.TReceituario.ApplyUpdates(-1);
            except
              on E: Exception do
               result:=('Erro: ' + E.Message );
            end;
          end;
        end;
       result:='Receituario Baixadas com Sucesso!'
    end
    else
     Result :=dmDB.LimpaResut(vJsonString);
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

function TdmSync.GetMaquinas: string;
var
 Url,vJsonString,vID:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url :='http://'+Host+':'+Porta+'/GetMaquinas';
   IdHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := IdHTTP1.Get(URL);
    if(vJsonString<>'{"Mensagem":"Nenhuma Maquina encontrado!"}') then
    begin
      DeletaTabelaSync('maquinaveiculo');
      dmDB.TMaquina.Open;
      dmDB.TMaquina.ResourceOptions.SilentMode := false;
       jSubObj  := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
       vJoGet := jSubObj.GetValue<TJSONArray>('Maquinas') as TJSONArray;
       for i := 0 to vJoGet.Count-1 do
       begin
          vJoGetJ         := vJoGet.Items[j] as TJSONObject;
          vID             := vJoGetJ.GetValue('Id').value;
          dmDB.TMaquina.Insert;
          dmDB.TMaquinaId.AsString                 := vId;
          dmDB.TMaquinastatus.AsString             := vJoGetJ.GetValue('Status').value;
          dmDB.TMaquinatipo.AsString               := vJoGetJ.GetValue('Tipo').value;
          dmDB.TMaquinamarca.AsString              := vJoGetJ.GetValue('Marca').value;
          dmDB.TMaquinamodelo.AsString             := vJoGetJ.GetValue('Modelo').value;
          dmDB.TMaquinaplaca.AsString              := vJoGetJ.GetValue('Placa').value;
          dmDB.TMaquinaano.AsString                := vJoGetJ.GetValue('Ano').value;
          dmDB.TMaquinachassi.AsString             := vJoGetJ.GetValue('Chassi').value;
          dmDB.TMaquinacombustivel.AsString        := vJoGetJ.GetValue('Combustivel').value;
          dmDB.TMaquinanumeroserie.AsString        := vJoGetJ.GetValue('NumeroSerie').value;
          dmDB.TMaquinaPrefixo.AsString            := vJoGetJ.GetValue('Prefixo').value;
          try
           dmDB.TMaquina.ApplyUpdates(-1);
          except
            on E: Exception do
             result:=('Erro: ' + E.Message );
          end;
       end;
       result:='Maquinas Baixados com Sucesso!'
    end
    else
     Result :=dmDB.LimpaResut(vJsonString);
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

function TdmSync.GetUsuarios: string;
var
 Url,vJsonString,vIsert,
 vID,vNOME,vLOGIN,vDT_REGISTER,vPASSWORD,vTIPO,vID_SEGMENTO,vSTATUS,
 vIdSupervisor,abastecimento,agronomo,SUPERVISOR:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
 ArrayPed, ArrayItem: TJSONArray;
begin
   Url :='http://'+Host+':'+Porta+'/GetUsuariosAGRI';
   IdHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := IdHTTP1.Get(URL);
    if(vJsonString<>'{"Mensagem":"Nenhum Usuario encontrado!"}') then
    begin
       jSubObj  := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
       vJoGet := jSubObj.GetValue<TJSONArray>('Usuarios') as TJSONArray;
       for i := 0 to vJoGet.Count-1 do
       begin
           vJoGetJ         := vJoGet.Items[i] as TJSONObject;
           vID             := vJoGetJ.GetValue('ID').value;
           vSTATUS         := vJoGetJ.GetValue('Status').value;
           vNOME           := vJoGetJ.GetValue('nome').value;
           vLOGIN          := vJoGetJ.GetValue('usuario').value;
           vPASSWORD       := vJoGetJ.GetValue('senha').value;
           SUPERVISOR      := vJoGetJ.GetValue('supervisor').value;
           vTIPO           := vJoGetJ.GetValue('tipo').value;
           agronomo        := vJoGetJ.GetValue('agronomo').value;
           abastecimento   := vJoGetJ.GetValue('abastecimento').value;

          dmDB.TUsuario.Close;
          dmDB.TUsuario.Open;
          dmDB.TUsuario.Filtered := false;
          dmDB.TUsuario.Filter   := 'ID='+vId.QuotedString;
          dmDB.TUsuario.Filtered := true;
          if dmDB.TUsuario.RecordCount>0 then
            dmDB.TUsuario.Edit
          else
          begin
            dmDB.TUsuario.Close;
            dmDB.TUsuario.Open;
            dmDB.TUsuario.Insert;
          end;
          dmDB.TUsuarioId.AsString              := vId;
          dmDB.TUsuarionome.AsString            := vNome;
          dmDB.TUsuariousuario.AsString         := vLOGIN;
          dmDB.TUsuariosenha.AsString           := vPASSWORD;
          dmDB.TUsuariotipo.AsString            := vTIPO;
          dmDB.TUsuariostatus.AsString          := vSTATUS;
          dmDB.TUsuariosupervisor.AsString      := SUPERVISOR;
          dmDB.TUsuarioagronomo.AsString        := agronomo;
          dmDB.TUsuarioabastecimento.AsString   := abastecimento;
          dmDB.TUsuariosupervisor.AsString      := SUPERVISOR;
          try
           dmDB.TUsuario.ApplyUpdates(-1);
          except
            on E: Exception do
             result:=('Erro: ' + E.Message );
          end;
       end;
       result:='Usuarios Baixados com Sucesso!'
    end;
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

function TdmSync.GetOperadorMaquina: string;
var
 Url,vJsonString,vIsert,
 vID,vNOME,vLOGIN,vDT_REGISTER,vPASSWORD,vTIPO,SUPERVISOR,vSTATUS:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url :='http://'+Host+':'+Porta+'/GetOperadorMaquinas';
   IdHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := IdHTTP1.Get(URL);
    if(vJsonString<>'{"Mensagem":"Nenhum Usuario encontrado!"}') then
    begin
      jSubObj  := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
       vJoGet := jSubObj.GetValue<TJSONArray>('OperadorMaquina') as TJSONArray;
       for i := 0 to vJoGet.Count-1 do
       begin
          vJoGetJ         := vJoGet.Items[j] as TJSONObject;
          vID             := vJoGetJ.GetValue('ID').value;

          dmDB.TOperadorMaquina.Close;
          dmDB.TOperadorMaquina.Open;
          dmDB.TOperadorMaquina.Filtered := false;
          dmDB.TOperadorMaquina.Filter   := 'ID='+vId.QuotedString;
          dmDB.TOperadorMaquina.Filtered := true;
          if dmDB.TOperadorMaquina.RecordCount>0 then
            dmDB.TOperadorMaquina.Edit
          else
          begin
            dmDB.TOperadorMaquina.Close;
            dmDB.TOperadorMaquina.Open;
            dmDB.TOperadorMaquina.Insert;
          end;
          dmDB.TOperadorMaquinaId.AsString          := vId;
          dmDB.TOperadorMaquinanome.AsString        := vJoGetJ.GetValue('NOME').value;
          dmDB.TOperadorMaquinarg.AsString          := vJoGetJ.GetValue('RG').value;
          dmDB.TOperadorMaquinacpf.AsString         := vJoGetJ.GetValue('CPF').value;
          dmDB.TOperadorMaquinaSTATUS.AsString      := vJoGetJ.GetValue('STATUS').value;
          try
           dmDB.TOperadorMaquina.ApplyUpdates(-1);
          except
            on E: Exception do
             result:=('Erro: ' + E.Message );
          end;
        end;
        result:='Operador Baixados com Sucesso!'
    end
    else
     Result :=dmDB.LimpaResut(vJsonString);
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;


end.
