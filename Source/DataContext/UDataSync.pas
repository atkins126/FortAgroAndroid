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
    TMovLocalEstoque: TFDQuery;
    TMovLocalEstoqueid: TFDAutoIncField;
    TMovLocalEstoquestatus: TWideStringField;
    TMovLocalEstoquedatareg: TSQLTimeStampField;
    TMovLocalEstoqueidusuario: TWideStringField;
    TMovLocalEstoquedataalteracao: TWideStringField;
    TMovLocalEstoqueidusuarioalteracao: TWideStringField;
    TMovLocalEstoqueidlocalestoqueorigem: TWideStringField;
    TMovLocalEstoqueidlocalestoqueDetino: TWideStringField;
    TMovLocalEstoqueidproduto: TWideStringField;
    TMovLocalEstoqueqtde: TBCDField;
    TMovLocalEstoquedatamov: TDateField;
    TMovLocalEstoquehora: TTimeField;
    TMovLocalEstoquesyncaws: TWideStringField;
    TMovLocalEstoquesyncfaz: TWideStringField;
    TSyncReceituarioid: TFDAutoIncField;
    TSyncReceituariostatus: TWideStringField;
    TSyncReceituarionome: TStringField;
    TSyncReceituarioresponsavel: TStringField;
    TSyncReceituarioidResponsavel: TIntegerField;
    TSyncReceituarioDataRegistro: TDateTimeField;
    TSyncReceituariodatarecomendacao: TDateField;
    TSyncReceituariodataprevaplicacao: TDateField;
    TSyncReceituarioobservacao: TWideStringField;
    Tauxatividadeabastecimento: TFDQuery;
    Tauxatividadeabastecimentoid: TIntegerField;
    Tauxatividadeabastecimentostatus: TWideStringField;
    Tauxatividadeabastecimentodatareg: TWideStringField;
    Tauxatividadeabastecimentoidusuario: TWideStringField;
    Tauxatividadeabastecimentodataalteracao: TSQLTimeStampField;
    Tauxatividadeabastecimentoidusuarioalteracao: TWideStringField;
    Tauxatividadeabastecimentonome: TStringField;
    Tauxatividadeabastecimentosyncaws: TWideStringField;
    Tauxatividadeabastecimentosyncfaz: TWideStringField;
    TSyncAbastecimentoidatividade: TIntegerField;
    Comprador: TFDQuery;
    Contratos: TFDQuery;
    Embarque: TFDQuery;
    Compradorid: TIntegerField;
    Compradorstatus: TWideStringField;
    Compradordatareg: TWideStringField;
    Compradoridusuario: TWideStringField;
    Compradordataalteracao: TWideStringField;
    Compradoridusuarioalteracao: TWideStringField;
    Compradornome: TStringField;
    Compradorcidade: TStringField;
    Compradoruf: TWideStringField;
    Compradorcpf_cnpj: TStringField;
    Compradortelefone_fixo: TStringField;
    Compradorcelular: TStringField;
    Compradoremail: TStringField;
    Compradorcontatopessoa: TStringField;
    Compradorsenha: TStringField;
    Compradorsyncaws: TWideStringField;
    Compradorrazaosocial: TStringField;
    Compradorinscricaoestadual: TStringField;
    Compradorsyncfaz: TWideStringField;
    Contratosid: TIntegerField;
    Contratosstatus: TWideStringField;
    Contratosdatareg: TWideStringField;
    Contratosidusuario: TWideStringField;
    Contratosdataalteracao: TWideStringField;
    Contratosidusuarioalteracao: TWideStringField;
    Contratosidcomprador: TWideStringField;
    Contratosidcultura: TWideStringField;
    Contratosidsafra: TWideStringField;
    Contratosnumerocontrato: TStringField;
    Contratostotalcompravolume: TBCDField;
    Contratostotalcomprasacos: TBCDField;
    Contratostotalembarquevolume: TBCDField;
    Contratostotalembarquesacos: TBCDField;
    Contratossyncaws: TWideStringField;
    Contratossyncfaz: TWideStringField;
    Embarqueid: TFDAutoIncField;
    Embarquestatus: TWideStringField;
    Embarquedatareg: TWideStringField;
    Embarqueidusuario: TWideStringField;
    Embarquedataalteracao: TWideStringField;
    Embarqueidusuarioalteracao: TWideStringField;
    Embarqueidcontrato: TWideStringField;
    Embarquenumeronf: TWideStringField;
    Embarqueplaca: TStringField;
    Embarquedataembarque: TDateField;
    Embarquehorabarque: TTimeField;
    Embarquetara: TBCDField;
    Embarquebruto: TBCDField;
    Embarqueliquido: TBCDField;
    Embarqueimp: TBCDField;
    Embarquequeb: TBCDField;
    Embarqueverd: TBCDField;
    Embarqueavar: TBCDField;
    Embarqueumid: TBCDField;
    Embarquesyncaws: TWideStringField;
    Embarquesyncfaz: TWideStringField;
    TAuxRevisaoItem: TFDQuery;
    TRevisao: TFDQuery;
    TRevisaoid: TIntegerField;
    TRevisaostatus: TIntegerField;
    TRevisaodatareg: TSQLTimeStampField;
    TRevisaoidusuario: TIntegerField;
    TRevisaodataalteracao: TSQLTimeStampField;
    TRevisaoidusuarioalteracao: TIntegerField;
    TRevisaonome: TWideStringField;
    TRevisaointervalohoras: TBCDField;
    TRevisaosyncaws: TIntegerField;
    TRevisaosyncfaz: TIntegerField;
    TRevisaoItens: TFDQuery;
    TAuxRevisaoItemid: TWideStringField;
    TAuxRevisaoItemstatus: TWideStringField;
    TAuxRevisaoItemdatareg: TWideStringField;
    TAuxRevisaoItemidusuario: TWideStringField;
    TAuxRevisaoItemdataalteracao: TWideStringField;
    TAuxRevisaoItemidusuarioalteracao: TWideStringField;
    TAuxRevisaoItemnome: TStringField;
    TAuxRevisaoItemgrupo: TStringField;
    TAuxRevisaoItemsyncaws: TWideStringField;
    TAuxRevisaoItemsyncfaz: TWideStringField;
    TRevisaoItensid: TIntegerField;
    TRevisaoItensstatus: TWideStringField;
    TRevisaoItensdatareg: TWideStringField;
    TRevisaoItensidusuario: TWideStringField;
    TRevisaoItensdataalteracao: TWideStringField;
    TRevisaoItensidusuarioalteracao: TWideStringField;
    TRevisaoItensidrevisao: TWideStringField;
    TRevisaoItensiditem: TWideStringField;
    TRevisaoItenssyncaws: TWideStringField;
    TRevisaoItenssyncfaz: TWideStringField;
    TRevisaoItensidproduto: TWideStringField;
    TRevisaoItensqtde: TWideStringField;
    TManutencao: TFDQuery;
    TPlanoManutencao: TFDQuery;
    TManutencaoid: TIntegerField;
    TManutencaoidplanorevisao: TWideStringField;
    TManutencaoidmaquina: TWideStringField;
    TManutencaodatainicio: TDateField;
    TManutencaodatafim: TDateField;
    TManutencaohorimetro: TBCDField;
    TManutencaohorimetroproxima: TBCDField;
    TPlanoManutencaoid: TIntegerField;
    TPlanoManutencaonome: TStringField;
    TPlanoManutencaointervalohoras: TBCDField;
    qryAuxSync: TFDQuery;
    TPlanoRevisaoMaquinas: TFDQuery;
    TPlanoRevisaoMaquinasid: TIntegerField;
    TPlanoRevisaoMaquinasstatus: TWideStringField;
    TPlanoRevisaoMaquinasdatareg: TWideStringField;
    TPlanoRevisaoMaquinasidusuario: TWideStringField;
    TPlanoRevisaoMaquinasdataalteracao: TWideStringField;
    TPlanoRevisaoMaquinasidusuarioalteracao: TWideStringField;
    TPlanoRevisaoMaquinasidrevisao: TWideStringField;
    TPlanoRevisaoMaquinasidmaquina: TWideStringField;
    TPlanoRevisaoMaquinassyncaws: TWideStringField;
    TPlanoRevisaoMaquinassyncfaz: TWideStringField;
    TPlanoRevisaoItens: TFDQuery;
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
    TSyncAbastecimentoobs: TStringField;
    TPostAuxItemRevisao: TFDQuery;
    TPostRevisaoItem: TFDQuery;
    TPostRevisao: TFDQuery;
    TPostRevisaoServico: TFDQuery;
    TPostAuxItemRevisaoid: TIntegerField;
    TPostAuxItemRevisaostatus: TWideStringField;
    TPostAuxItemRevisaodatareg: TWideStringField;
    TPostAuxItemRevisaoidusuario: TWideStringField;
    TPostAuxItemRevisaodataalteracao: TWideStringField;
    TPostAuxItemRevisaoidusuarioalteracao: TWideStringField;
    TPostAuxItemRevisaonome: TStringField;
    TPostAuxItemRevisaogrupo: TStringField;
    TPostAuxItemRevisaosyncaws: TWideStringField;
    TPostAuxItemRevisaosyncfaz: TWideStringField;
    TPostRevisaoid: TIntegerField;
    TPostRevisaostatus: TWideStringField;
    TPostRevisaodatareg: TWideStringField;
    TPostRevisaoidusuario: TWideStringField;
    TPostRevisaodataalteracao: TWideStringField;
    TPostRevisaoidusuarioalteracao: TWideStringField;
    TPostRevisaoidplanorevisao: TWideStringField;
    TPostRevisaoidmaquina: TWideStringField;
    TPostRevisaoobservacao: TStringField;
    TPostRevisaodatainicio: TDateField;
    TPostRevisaodatafim: TDateField;
    TPostRevisaosyncaws: TWideStringField;
    TPostRevisaosyncfaz: TWideStringField;
    TPostRevisaoidresponsavel: TWideStringField;
    TPostRevisaohorimetro: TBCDField;
    TPostRevisaotipo: TWideStringField;
    TPostRevisaohorimetroproxima: TBCDField;
    TPostRevisaoItemid: TFDAutoIncField;
    TPostRevisaoItemstatus: TWideStringField;
    TPostRevisaoItemdatareg: TWideStringField;
    TPostRevisaoItemidusuario: TWideStringField;
    TPostRevisaoItemdataalteracao: TWideStringField;
    TPostRevisaoItemidusuarioalteracao: TWideStringField;
    TPostRevisaoItemidrevisao: TWideStringField;
    TPostRevisaoItemsyncaws: TWideStringField;
    TPostRevisaoItemsyncfaz: TWideStringField;
    TPostRevisaoItemidproduto: TWideStringField;
    TPostRevisaoItemqtde: TBCDField;
    TPostRevisaoItemitem: TStringField;
    TPostRevisaoItemtipo: TWideStringField;
    TPostRevisaoItemobservacao: TStringField;
    TPostRevisaoItemiditem: TWideStringField;
    TPostRevisaoServicoid: TIntegerField;
    TPostRevisaoServicostatus: TWideStringField;
    TPostRevisaoServicodatareg: TWideStringField;
    TPostRevisaoServicoidusuario: TWideStringField;
    TPostRevisaoServicodataalteracao: TWideStringField;
    TPostRevisaoServicoidusuarioalteracao: TWideStringField;
    TPostRevisaoServicotiposervico: TWideStringField;
    TPostRevisaoServicoidrevisao: TWideStringField;
    TPostRevisaoServicodescricao: TStringField;
    TPostRevisaoServicoresponsavel: TStringField;
    TPostRevisaoServicovalortotal: TBCDField;
    TPostRevisaoServicosyncaws: TWideStringField;
    TPostRevisaoServicosyncfaz: TWideStringField;
    TPostRevisaoServicodatarealizado: TDateField;
    TSyncDetReceituarioTalhao: TFDQuery;
    TSyncDetReceituarioTalhaoid: TIntegerField;
    TSyncDetReceituarioTalhaostatus: TWideStringField;
    TSyncDetReceituarioTalhaodatareg: TWideStringField;
    TSyncDetReceituarioTalhaoidusuario: TWideStringField;
    TSyncDetReceituarioTalhaodataalteracao: TWideStringField;
    TSyncDetReceituarioTalhaoidusuarioalteracao: TWideStringField;
    TSyncDetReceituarioTalhaoidtalhao: TWideStringField;
    TSyncDetReceituarioTalhaoareahe: TBCDField;
    TSyncDetReceituarioTalhaosyncaws: TWideStringField;
    TSyncDetReceituarioTalhaosyncfaz: TWideStringField;
    TSyncDetReceituarioTalhaoidreceiturario: TWideStringField;
    TSyncAbastecimentoimg: TWideMemoField;
    TSyncAbastecimentoimg2: TWideMemoField;
    TSyncAbastecimentoimg3: TWideMemoField;
    TSyncAbastecimentoimg4: TWideMemoField;
    TSyncAbastecimentoimg5: TWideMemoField;
    TSyncAbastecimentoexterno: TWideStringField;
    procedure TSyncPragasReconcileError(DataSet: TFDDataSet; E: EFDException;
      UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
    procedure TSyncReceituarioReconcileError(DataSet: TFDDataSet;
      E: EFDException; UpdateKind: TFDDatSRowState;
      var Action: TFDDAptReconcileAction);
    procedure EmbarqueReconcileError(DataSet: TFDDataSet; E: EFDException;
      UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
    procedure ContratosReconcileError(DataSet: TFDDataSet; E: EFDException;
      UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
    procedure CompradorReconcileError(DataSet: TFDDataSet; E: EFDException;
      UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
  private
    { Private declarations }
    procedure AbreDetReceituario(vIdReceituario:string);
    procedure AbreDetReceituarioTalhao(vIdReceituario: string);
    procedure AbreDetVazaoOperacao(vIdOP:string);
    procedure AlterarFlagSyncStand;
    procedure AlterarFlagSyncPluviometria;
    procedure AlterarFlagAbastecimento(id:string);
    procedure AlterarFlagAbastecimentoOutros;
    procedure AlterarFlagMovLocalEstoque;
    procedure AlterarFlagEmbarque(vId:String);
    procedure AlteraFlagMonitoramento(vIdMonitoramento:string);
    procedure AlteraFlagMonitoramentoPontos(vIdPonto: string);
    procedure AlteraFlagMonitoramentoPontosValores(vIdPonto: string);
    procedure AbreMonitoramentoSinc(id:string);
    procedure AbreMonitoramentoPontoSinc(id:string);
    procedure AbreMonitoramentoPontoValoresSinc(id:string);
    function VerificaReceituarioExiste(id:string):Boolean;
    procedure AtualizaObsReceituario(id,obs:string);
    procedure AlterarFlagAuxItemRev(vIdOld,vIdNew:string);
    procedure AlterarFlagRevisao(vIdOld,vIdNew:string);
    procedure AlterarFlagRevisaoItem(vId: string);
    procedure AlterarFlagRevisaoServico(vId: string);
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
    function  GetAtividadeAbastecimento: string;
    function  GetComprador:string;
    function  GetContratos:string;
    function  GetPlanoRevisao: string;
    function  GetRevisao: string;
    function  GetPlanoRevisaoMaquinas: string;
    function  GetPlanoRevisaoItens: string;

    function GetPlanoAuxItemRevisao: string;
    function GetPlanoItemRevisao: string;
    function GetTipoDB:string;

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
    function PostMovLocalEstoque:string;

    function PostEmbarques:string;
    function PostItemRevisao:string;
    function PostRevisao:string;
    function PostRevisaoItens:string;
    function PostRevisaoServico:string;

    function PostMonitoramento:string;
    function PostMonitoramentoPontos(vid:string): string;
    function PostMonitoramentoPontosValores(vid:string): string;


    //Compras
    function  PostEnviaEmailOrcamento(idOrcamento:string):string;
    procedure DeletaTabelaSync(Atabela:string);
    procedure DeletaReceituarioSync;
    procedure DeletaMonitoramento(ID:string);
    procedure DeletaMonitoramentoPonto(vIDPonto,vNomePonto:string);
    procedure DeletaTabelaId(Atabela,Id: string);
    procedure DeletaTabelaPraga(Id: string);
    procedure DeletaDetReceituario(IdRec: string);
    procedure AbreMaquinaSafraTalhao(idOperacao:string);
    procedure AbreAbastecimentoSync(idAbastecimento:string);
    procedure AbreAuxItemRevisaoSync(vId:string);
    procedure AbreRevisaoSync(vId:string);
    procedure AbreRevisaoItemSync(vId:string);
    procedure AbreRevisaoServicoSync(vId:string);
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
 vQryLoop :TFDQuery;
begin
 vQryLoop := TFDQuery.Create(nil);
 vQryLoop.Connection := dmDB.FDConn;
 with vQryLoop,vQryLoop.SQL do
 begin
   Clear;
   Add('select * from abastecimento where syncFaz=0');
   Open;
   while not eof do
   begin
     AbreAbastecimentoSync(vQryLoop.FieldByName('ID').AsString);
     if not TSyncAbastecimento.IsEmpty then
     begin
       JsonToSend := TStringStream.Create(nil);
       TSyncAbastecimento.SaveToStream(JsonToSend,sfJSON);
       Url := 'http://'+Host+':'+Porta+'/Abastecimento';
       IdHTTP1.Request.CustomHeaders.Clear;
       IdHTTP1.Request.CustomHeaders.Clear;
       IdHTTP1.Request.ContentType := 'application/json';
       IdHTTP1.Request.Accept      := 'application/json';
       vReultHTTP := IdHTTP1.Post(url,JsonToSend);
       if copy(vReultHTTP,0,4)='{"OK'then
       begin
         AlterarFlagAbastecimento(vQryLoop.FieldByName('ID').AsString);
         vReultHTTP := StringReplace(vReultHTTP,'{"OK":"','',[rfReplaceAll]);
         vReultHTTP := StringReplace(vReultHTTP,'"}','',[rfReplaceAll]);
       end;
     end;
     Result     := vReultHTTP;
     vQryLoop.Next;
   end
 end;
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
   Url := 'http://'+Host+':'+Porta+'/AbastecimentoOutros';
   IdHTTP1.Request.CustomHeaders.Clear;
   IdHTTP1.Request.ContentType := 'application/json';
   IdHTTP1.Request.Accept      := 'application/json';
   vReultHTTP := IdHTTP1.Post(url,JsonToSend);
   if copy(vReultHTTP,0,4)='{"OK'then
   begin
     AlterarFlagAbastecimentoOutros;
     vReultHTTP := StringReplace(vReultHTTP,'{"OK":"','',[rfReplaceAll]);
     vReultHTTP := StringReplace(vReultHTTP,'"}','',[rfReplaceAll]);
   end;
 end;
 Result     := vReultHTTP;
end;

function TdmSync.PostEmbarques: string;
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 TThread.Synchronize(nil,procedure
 begin
  Embarque.Close;
  Embarque.Open;
 end);
 if not Embarque.IsEmpty then
 begin
   JsonToSend := TStringStream.Create(nil);
   Embarque.SaveToStream(JsonToSend,sfJSON);
   Url := 'http://'+Host+':'+Porta+'/Embarques';
   IdHTTP1.Request.CustomHeaders.Clear;
   IdHTTP1.Request.ContentType := 'application/json';
   IdHTTP1.Request.Accept      := 'application/json';
   vReultHTTP := IdHTTP1.Post(url,JsonToSend);
   if copy(vReultHTTP,0,4)='{"OK'then
   begin
     vReultHTTP := StringReplace(vReultHTTP,'{"OK":"','',[rfReplaceAll]);
     vReultHTTP := StringReplace(vReultHTTP,'"}','',[rfReplaceAll]);
     AlterarFlagEmbarque(vReultHTTP);
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

function TdmSync.PostItemRevisao: string;
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
 vQryLoop :TFDQuery;
begin
 vQryLoop := TFDQuery.Create(nil);
 vQryLoop.Connection := dmDB.FDConn;
 with vQryLoop,vQryLoop.SQL do
 begin
   Clear;
   Add('select * from auxrevisaoitens where syncfaz=0');
   Open;
   while not eof do
   begin
    AbreAuxItemRevisaoSync(vQryLoop.FieldByName('ID').AsString);
    if not TPostAuxItemRevisao.IsEmpty then
    begin
       JsonToSend := TStringStream.Create(nil);
       TPostAuxItemRevisao.SaveToStream(JsonToSend,sfJSON);
       Url := 'http://'+Host+':'+Porta+'/AuxItemRevisao';
       IdHTTP1.Request.CustomHeaders.Clear;
       IdHTTP1.Request.CustomHeaders.Clear;
       IdHTTP1.Request.ContentType := 'application/json';
       IdHTTP1.Request.Accept      := 'application/json';
       vReultHTTP := IdHTTP1.Post(url,JsonToSend);
       if copy(vReultHTTP,0,4)='{"OK'then
       begin
         vReultHTTP := StringReplace(vReultHTTP,'{"OK":"','',[rfReplaceAll]);
         vReultHTTP := StringReplace(vReultHTTP,'"}','',[rfReplaceAll]);
         AlterarFlagAuxItemRev(vQryLoop.FieldByName('ID').AsString,vReultHTTP);
       end;
    end;
    vQryLoop.Next;
   end
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
     frmPrincipal.log.Lines.Add('Abrindo Tabela Monitoramento');
     AbreMonitoramentoSinc(qryAux.FieldByName('id').AsString);
     TMonitoramentoPraga.First;
     if not TMonitoramentoPraga.IsEmpty then
     begin
       JsonToSend := TStringStream.Create(nil);
       TMonitoramentoPraga.SaveToStream(JsonToSend,sfJSON);
       Url := 'http://'+Host+':'+Porta+'/Monitoramento';
       IdHTTP1.Request.CustomHeaders.Clear;
       IdHTTP1.Request.ContentType := 'application/json';
       IdHTTP1.Request.Accept      := 'application/json';
       frmPrincipal.log.Lines.Add('Post :'+JsonToSend.ToString);
       vReultHTTP := IdHTTP1.Post(url,JsonToSend);
       frmPrincipal.log.Lines.Add(vReultHTTP);
       if copy(vReultHTTP,0,4)='{"OK'then
       begin
         vReultHTTP := StringReplace(vReultHTTP,'{"OK":"','',[rfReplaceAll]);
         vReultHTTP := StringReplace(vReultHTTP,'"}','',[rfReplaceAll]);
         frmPrincipal.log.Lines.Add('Atauliza id Monitoramento de '+qryAux.FieldByName('id').AsString
         +' para '+vReultHTTP);
         dmDB.AtualizaIdMonitoramento(qryAux.FieldByName('id').AsString,vReultHTTP);
         frmPrincipal.log.Lines.Add('Enviando Pontos');
         PostMonitoramentoPontos(vReultHTTP);
         frmPrincipal.log.Lines.Add('Enviando Pragas');
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
       Url := 'http://'+Host+':'+Porta+'/MonitoramentoPontos';
       IdHTTP1.Request.CustomHeaders.Clear;
       IdHTTP1.Request.ContentType := 'application/json';
       IdHTTP1.Request.Accept      := 'application/json';
       vReultHTTP := IdHTTP1.Post(url,JsonToSend);
       if copy(vReultHTTP,0,4)='{"OK'then
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
   Url := 'http://'+Host+':'+Porta+'/MonitoramentoPontosValores';
   IdHTTP1.Request.CustomHeaders.Clear;
   IdHTTP1.Request.ContentType := 'application/json';
   IdHTTP1.Request.Accept      := 'application/json';
   vReultHTTP := IdHTTP1.Post(url,JsonToSend);
   if copy(vReultHTTP,0,4)='{"OK'then
   begin
     vReultHTTP := StringReplace(vReultHTTP,'{"OK":"','',[rfReplaceAll]);
     vReultHTTP := StringReplace(vReultHTTP,'"}','',[rfReplaceAll]);
   end;
 end;
 Result     := vReultHTTP;
end;

function TdmSync.PostMovLocalEstoque: string;
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 TThread.Synchronize(nil,procedure
 begin
  TMovLocalEstoque.Close;
  TMovLocalEstoque.Open;
 end);
 if not TMovLocalEstoque.IsEmpty then
 begin
   JsonToSend := TStringStream.Create(nil);
   TMovLocalEstoque.SaveToStream(JsonToSend,sfJSON);
   Url := 'http://'+Host+':'+Porta+'/MovLocalEstoque';
   IdHTTP1.Request.CustomHeaders.Clear;
   IdHTTP1.Request.ContentType := 'application/json';
   IdHTTP1.Request.Accept      := 'application/json';
   vReultHTTP := IdHTTP1.Post(url,JsonToSend);
   if copy(vReultHTTP,0,4)='{"OK'then
   begin
     AlterarFlagMovLocalEstoque;
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
   DeletaTabelaSync('auxculturas');
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
          dmDB.TCulturas.Insert;

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
 Url,vJsonString,vID,ResponseBody:string;
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
 vQryAux     : TFDQuery;
begin
   vQryAux             := TFDQuery.Create(nil);
   vQryAux.Connection  := dmDB.FDConn;

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
   IdHTTP1.Request.ContentType := 'application/json';
   IdHTTP1.Request.Accept      := 'application/json';
   try
    ResponseBody := IdHTTP1.Post(url,JsonToSend);
   if copy(ResponseBody,0,10)<>'{"Mensagem' then
   begin
      jSubObj  := TJSONObject.ParseJSONValue(ResponseBody) as TJSONObject;
       vJoGet := jSubObj.GetValue<TJSONArray>('DetReceituario') as TJSONArray;
       for i := 0 to vJoGet.Count-1 do
       begin
          vJoGetJ         := vJoGet.Items[i] as TJSONObject;
          vID             := vJoGetJ.GetValue('ID').value;

          with vQryAux,vQryAux.SQL do
          begin
            Clear;
            Add('INSERT INTO detreceiturario');
            Add('(id,status,idreceiturario, finalidade,qtdporhe,idproduto)values');
            Add('(:id,:status,:idreceiturario, :finalidade,:qtdporhe,:idproduto)');
            ParamByName('id').AsString             := vID;
            ParamByName('status').AsString         := vJoGetJ.GetValue('Status').value;
            ParamByName('idreceiturario').AsString := vJoGetJ.GetValue('IDReceituario').value;
            ParamByName('finalidade').AsString     := vJoGetJ.GetValue('Finalidade').value;
            ParamByName('qtdporhe').AsFloat        := strToFloat(vJoGetJ.GetValue('QtdeIndicada').value);
            ParamByName('idproduto').AsString      := vJoGetJ.GetValue('IdProduto').value;
            try
             vQryAux.ExecSQL;
            except
            on E: Exception do
              result:=('Erro: ' + E.Message );
            end;

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
   vQryAux.Free;
end;

function TdmSync.GetDetReceituarioTalhoes(idRec: string):string;
var
 Url,vJsonString,vID,vField,ResponseBody:string;
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
 vQryAux     : TFDQuery;
begin
   vQryAux             := TFDQuery.Create(nil);
   vQryAux.Connection  := dmDB.FDConn;
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
   Url :='http://'+Host+':'+Porta+'/GetDetReceituarioTalhao';
   IdHTTP1.Request.CustomHeaders.Clear;
   IdHTTP1.Request.ContentType := 'application/json';
   IdHTTP1.Request.Accept      := 'application/json';
   try
   ResponseBody := IdHTTP1.Post(url,JsonToSend);
   if copy(ResponseBody,0,10)<>'{"Mensagem' then
   begin
     jSubObj  := TJSONObject.ParseJSONValue(ResponseBody) as TJSONObject;
     vJoGet := jSubObj.GetValue<TJSONArray>('TDetReceituarioTalhao') as TJSONArray;
     for i := 0 to vJoGet.Count-1 do
     begin
        vJoGetJ         := vJoGet.Items[i] as TJSONObject;
        vID             := vJoGetJ.GetValue('id').value;
        with vQryAux,vQryAux.SQL do
        begin
         Clear;
         Add('INSERT INTO detreceiturariotalhao');
         Add('(id, status,idtalhao,areahe,idreceiturario)');
         Add('VALUES(');
         Add(vid+',');
         Add(vJoGetJ.GetValue('status').value+',');
         Add(vJoGetJ.GetValue('idtalhao').value+',');
         Add(StringReplace(vJoGetJ.GetValue('areahe').value,',','.',[rfReplaceAll])+',');
         Add(vJoGetJ.GetValue('idreceiturario').value);
         Add(')');
         try
           vQryAux.ExecSQL;
          except
            on E: Exception do
             result:=('Erro: ' + E.Message );
          end;
        end;
//        dmDB.TDetReceituarioTalhao.Close;
//        dmDB.TDetReceituarioTalhao.Open;
//        dmDB.TDetReceituarioTalhao.Insert;
//          for z := 0 to dmDB.TDetReceituarioTalhao.Fields.Count -1 do
//          begin
//           vField                                                    := StringReplace(dmDB.TDetReceituarioTalhao.Fields[z].Name,'TDetReceituarioTalhao','',[rfReplaceAll]);
//           dmDB.TDetReceituarioTalhao.FieldByName(vField).AsString   := vJoGetJ.GetValue(vField).value;
//          end;
//          try
//           dmDB.TDetReceituarioTalhao.ApplyUpdates(-1);
//          except
//            on E: Exception do
//             result:=('Erro: ' + E.Message );
//          end;
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
   vQryAux.Free;
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
   DeletaTabelaSync('localestoque');
   Url := 'http://'+Host+':'+Porta+'/GetLocalEstoque';
   IdHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := IdHTTP1.Get(URL);
    if(vJsonString<>'{"TLocalEstoque":[') then
    begin
      jSubObj  := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
       vJoGet := jSubObj.GetValue<TJSONArray>('TLocalEstoque') as TJSONArray;
       for i := 0 to vJoGet.Count-1 do
       begin
          vJoGetJ         := vJoGet.Items[i] as TJSONObject;
          vId             := vJoGetJ.GetValue('id').value;
          TSyncLocalEstoque.Close;
          TSyncLocalEstoque.Open;
          TSyncLocalEstoque.Insert;
          for z := 0 to TSyncLocalEstoque.Fields.Count -1 do
          begin
           vField:= StringReplace(TSyncLocalEstoque.Fields[z].Name,
            'TSyncLocalEstoque','',[rfReplaceAll]);
           TSyncLocalEstoque.FieldByName(vField).AsString := vJoGetJ.GetValue(vField).value;
          end;
          TSyncLocalEstoque.ApplyUpdates(-1);
       end;
       result:='Local de Estoque Baixados com Sucesso!'
    end
    else
     Result :='Local de Estoque Baixados com Sucesso!'
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

function TdmSync.GetPlanoRevisao: string;
var
 Url,vJsonString,vIsert,
 vField,vFieldJS,vId,vNome,vIntervaloHoras:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J,z:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url := 'http://'+Host+':'+Porta+'/GetPlanoRevisao';
   IdHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := IdHTTP1.Get(URL);
    if IdHTTP1.ResponseCode=200 then
    begin
       DeletaTabelaSync('planorevisao');
       jSubObj  := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
       vJoGet := jSubObj.GetValue<TJSONArray>('TPlanoManutencao') as TJSONArray;
       for i := 0 to vJoGet.Count-1 do
       begin
         vJoGetJ            := vJoGet.Items[i] as TJSONObject;
         vId                := vJoGetJ.GetValue('id').value;
         vNome              := vJoGetJ.GetValue('nome').value;
         vIntervaloHoras    := vJoGetJ.GetValue('intervalohoras').value;
         TPlanoManutencao.Close;
         TPlanoManutencao.Open;
         TPlanoManutencao.Insert;
         TPlanoManutencaoid.AsString             :=vId;
         TPlanoManutencaonome.AsString           :=vNome;
         TPlanoManutencaointervalohoras.AsString :=vIntervaloHoras;
         try
           TPlanoManutencao.ApplyUpdates(-1);
         except
         on E: Exception do
          begin
            result:='Erro ao Inserir Plano:'+E.Message;
          end;
         end;
       end;
       result:='Plano Revisao Baixados com Sucesso!'
    end
    else
     Result :='Plano Revisao Baixados com Sucesso!'
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

function TdmSync.GetPlanoRevisaoItens: string;
var
 Url,vJsonString,vID:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   DeletaTabelaSync('planorevisaoitens');
   Url :='http://'+Host+':'+Porta+'/GetPlanoRevisaoItens';
   IdHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := IdHTTP1.Get(URL);
    if(vJsonString<>'{"Mensagem":"Plano de Revisao Item encontrado!"}') then
    begin
      jSubObj  := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
       vJoGet := jSubObj.GetValue<TJSONArray>('TPlanoRevisaoItens') as TJSONArray;
       for i := 0 to vJoGet.Count-1 do
       begin
          vJoGetJ         := vJoGet.Items[i] as TJSONObject;
          vID             := vJoGetJ.GetValue('INSERT').value;
          if vID.Length>0 then
          begin
            with qryAux,qryAux.SQL do
            begin
              Clear;
              Add(vID);
              try
                  ExecSQL;
              except
                on E: Exception do
                 result:=('Erro: ' + E.Message );
              end;
            end;
          end;
       end;
       result:='Plano Revisao Itens Baixado com Sucesso!'
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

function TdmSync.GetPlanoRevisaoMaquinas: string;
var
 Url,vJsonString,vID:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   DeletaTabelaSync('planorevisaomaquinas');
   Url :='http://'+Host+':'+Porta+'/GetPlanoRevisaoMaquinas';
   IdHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := IdHTTP1.Get(URL);
    if(vJsonString<>'{"Mensagem":"Plano de Revisao Maquina encontrado!"}') then
    begin
      jSubObj  := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
       vJoGet := jSubObj.GetValue<TJSONArray>('TPlanoRevisaoMaquinas') as TJSONArray;
       for i := 0 to vJoGet.Count-1 do
       begin
          vJoGetJ         := vJoGet.Items[i] as TJSONObject;
          vID             := vJoGetJ.GetValue('INSERT').value;
          if vID.Length>0 then
          begin
            with qryAux,qryAux.SQL do
            begin
              Clear;
              Add(vID);
              try
                  ExecSQL;
              except
                on E: Exception do
                 result:=('Erro: ' + E.Message );
              end;
            end;
          end;
       end;
       result:='Plano Revisao Itens Baixado com Sucesso!'
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

function TdmSync.GetPlanoAuxItemRevisao: string;
var
 Url,vJsonString,vID:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   DeletaTabelaSync('auxrevisaoitens');
   Url :='http://'+Host+':'+Porta+'/GetAuxItemRevisao';
   IdHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := IdHTTP1.Get(URL);
    if(vJsonString<>'{"Mensagem":"Nenhum Aux Item Revisao encontrado!"}') then
    begin
      jSubObj  := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
       vJoGet := jSubObj.GetValue<TJSONArray>('TAuxRevisaoItem') as TJSONArray;
       for i := 0 to vJoGet.Count-1 do
       begin
          vJoGetJ         := vJoGet.Items[i] as TJSONObject;
          vID             := vJoGetJ.GetValue('INSERT').value;
          if vID.Length>0 then
          begin
            with qryAux,qryAux.SQL do
            begin
              Clear;
              Add(vID);
              try
                  ExecSQL;
              except
                on E: Exception do
                 result:=('Erro: ' + E.Message );
              end;
            end;
          end;
       end;
       result:='Aux Itens Baixado com Sucesso!'
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

function TdmSync.GetPlanoItemRevisao: string;
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
   Url := 'http://'+Host+':'+Porta+'/GetItemRevisao';
   IdHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := IdHTTP1.Get(URL);
    if IdHTTP1.ResponseCode=200 then
    begin
      TRevisaoItens.Close;
      TRevisaoItens.Open;
      jSubObj  := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
       vJoGet := jSubObj.GetValue<TJSONArray>('TRevisaoItens') as TJSONArray;
       for i := 0 to vJoGet.Count-1 do
       begin
          vJoGetJ         := vJoGet.Items[i] as TJSONObject;
          vId               := vJoGetJ.GetValue('id').value;
          TRevisaoItens.Filtered := false;
          TRevisaoItens.Filter   := 'id='+vId;
          TRevisaoItens.Filtered := true;
          if not TRevisaoItens.IsEmpty then
           TRevisaoItens.Edit
          else
           TRevisaoItens.Insert;
          for z := 0 to TRevisaoItens.Fields.Count -1 do
          begin
           vField:= StringReplace(TRevisaoItens.Fields[z].Name,
            'TRevisaoItens','',[rfReplaceAll]);
           TRevisaoItens.FieldByName(vField).AsString := vJoGetJ.GetValue(vField).value;
          end;
          TRevisaoItens.ApplyUpdates(-1);
       end;
       result:='Items Revisao Baixados com Sucesso!'
    end
    else
     Result :='Items Revisao Baixados com Sucesso!'
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;


function TdmSync.GetAtividadeAbastecimento: string;
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
   DeletaTabelaSync('auxatividadeabastecimento');
   Url := 'http://'+Host+':'+Porta+'/GetAtividadeAbastecimento';
   IdHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := IdHTTP1.Get(URL);
    if(vJsonString<>'{"Tauxatividadeabastecimento":[') then
    begin
      Tauxatividadeabastecimento.Close;
      Tauxatividadeabastecimento.Open;
      jSubObj  := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
       vJoGet := jSubObj.GetValue<TJSONArray>('Tauxatividadeabastecimento') as TJSONArray;
       for i := 0 to vJoGet.Count-1 do
       begin
          vJoGetJ         := vJoGet.Items[i] as TJSONObject;
          vId               := vJoGetJ.GetValue('id').value;
          Tauxatividadeabastecimento.Filtered := false;
          Tauxatividadeabastecimento.Filter   := 'id='+vId;
          Tauxatividadeabastecimento.Filtered := true;
          if not Tauxatividadeabastecimento.IsEmpty then
           Tauxatividadeabastecimento.Edit
          else
           Tauxatividadeabastecimento.Insert;
          for z := 0 to Tauxatividadeabastecimento.Fields.Count -1 do
          begin
           vField:= StringReplace(Tauxatividadeabastecimento.Fields[z].Name,
            'Tauxatividadeabastecimento','',[rfReplaceAll]);
           Tauxatividadeabastecimento.FieldByName(vField).AsString := vJoGetJ.GetValue(vField).value;
          end;
          Tauxatividadeabastecimento.ApplyUpdates(-1);
       end;
       result:='Atividade Abastecimento Baixados com Sucesso!'
    end
    else
     Result :='Atividade Abastecimento Baixados com Sucesso!'
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
   DeletaTabelaSync('auxcobertura');
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
          dmDB.TAuxCobertura.Insert;

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

function TdmSync.GetComprador: string;
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
   DeletaTabelaSync('comprador');
   Url := 'http://'+Host+':'+Porta+'/GetComprador';
   IdHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := IdHTTP1.Get(URL);
    if(vJsonString<>'{"Comprador":[') then
    begin
      comprador.Close;
      Comprador.Open;
      jSubObj  := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
       vJoGet := jSubObj.GetValue<TJSONArray>('Comprador') as TJSONArray;
       for i := 0 to vJoGet.Count-1 do
       begin
          vJoGetJ            := vJoGet.Items[i] as TJSONObject;
          vId                := vJoGetJ.GetValue('id').value;
          comprador.Close;
          Comprador.Open;

          Comprador.Insert;
          for z := 0 to Comprador.Fields.Count -1 do
          begin
           vField:= StringReplace(Comprador.Fields[z].Name,
            'Comprador','',[rfReplaceAll]);
           Comprador.FieldByName(vField).AsString := vJoGetJ.GetValue(vField).value;
          end;
          try
            Comprador.ApplyUpdates(-1);
          except
           on E: Exception do
             begin
               result:='Erro ao inserir Comprador:'+E.Message;
             end;
          end;
       end;
       result:='Comprador Baixados com Sucesso!'
    end
    else
     Result :='Comprador Baixados com Sucesso!'
   except
   on E: Exception do
     begin
       result:='Erro ao comunicar com Servidor:'+E.Message;
     end;
   end;
end;

function TdmSync.GetContratos: string;
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
   DeletaTabelaSync('contratos');
   Url := 'http://'+Host+':'+Porta+'/GetContratos';
   IdHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := IdHTTP1.Get(URL);
    if(vJsonString<>'{"Contratos":[') then
    begin
      jSubObj  := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
       vJoGet := jSubObj.GetValue<TJSONArray>('Contratos') as TJSONArray;
       for i := 0 to vJoGet.Count-1 do
       begin
          vJoGetJ            := vJoGet.Items[i] as TJSONObject;
          vId                := vJoGetJ.GetValue('id').value;
          Contratos.Close;
          Contratos.Open;
          Contratos.Insert;
          for z := 0 to Contratos.Fields.Count -1 do
          begin
           vField:= StringReplace(Contratos.Fields[z].Name,
            'Contratos','',[rfReplaceAll]);
           Contratos.FieldByName(vField).AsString := vJoGetJ.GetValue(vField).value;
          end;
          try
           Contratos.ApplyUpdates(-1);
          except
           on E: Exception do
             begin
               result:='Erro ao inserir Contrato:'+E.Message;
             end;
          end;
       end;
       result:='Contratos Baixados com Sucesso!'
    end
    else
     Result :='Contratos Baixados com Sucesso!'
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
   DeletaTabelaSync('auxcultivares');
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
          dmDB.TCultivares.Insert;
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
          vJoGetJ         := vJoGet.Items[i] as TJSONObject;
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
   DeletaTabelaSync('auxtipooperacaosolido');
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
          dmDB.TTipoAplicacaoSolido.Insert;

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
       result:='Tipo Aplicação Solido Baixado com Sucesso!'
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
   DeletaTabelaSync('auxtipoocorrencia');
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
          dmDB.TAuxOcorrencia.Insert;

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
   DeletaTabelaSync('safra');
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
          dmDB.TSafra.Insert;

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
   DeletaTabelaSync('setor');
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
          vJoGetJ         := vJoGet.Items[i] as TJSONObject;
          vID             := vJoGetJ.GetValue('ID').value;
          dmDB.TSetor.Close;
          dmDB.TSetor.Open;
          dmDB.TSetor.Insert;

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

procedure TdmSync.AbreAbastecimentoSync(idAbastecimento: string);
begin
 with TSyncAbastecimento,TSyncAbastecimento.SQL do
 begin
  Clear;
  Add('select  *  from abastecimento');
  Add('where id='+idAbastecimento);
  Open;
 end;
end;

procedure TdmSync.AbreAuxItemRevisaoSync(vid: string);
begin
 with TPostAuxItemRevisao,TPostAuxItemRevisao.SQL do
 begin
  Clear;
  Add('select  *  from auxrevisaoitens');
  Add('where id='+vid);
  Open;
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
    frmPrincipal.myShowMenssagem('Erro ao inserir Configuração : '+E.Message);
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

procedure TdmSync.AbreRevisaoItemSync(vId: string);
begin
 with TPostRevisaoItem,TPostRevisaoItem.SQL do
 begin
  Clear;
  Add('select * from revisaomaquinaitens');
  Add('where id='+vid);
  Open;
 end;
end;

procedure TdmSync.AbreRevisaoServicoSync(vId: string);
begin
 with TPostRevisaoServico,TPostRevisaoServico.SQL do
 begin
  Clear;
  Add('select * from servicomanutencao');
  Add('where id='+vid);
  Open;
 end;
end;

procedure TdmSync.AbreRevisaoSync(vId: string);
begin
 with TPostRevisao,TPostRevisao.SQL do
 begin
  Clear;
  Add('select * from revisaomaquina');
  Add('where id='+vid);
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
   dmDB.FDConn.Commit;
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


procedure TdmSync.AlterarFlagAbastecimento(id:string);
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('update abastecimento set syncfaz=1');
   Add('where id='+id);
   ExecSQL;
 end;
end;

procedure TdmSync.AlterarFlagAuxItemRev(vIdOld,vIdNew:string);
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('update auxrevisaoitens set id='+vIdNew);
   Add(',syncfaz=1');
   Add('where id='+vIdOld);
   ExecSQL;

   Clear;
   Add('update revisaomaquinaitens set iditem='+vIdNew);
   Add('where iditem='+vIdOld);
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

procedure TdmSync.AlterarFlagMovLocalEstoque;
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('update tranferenciaLocalestoque set syncfaz=1');
   ExecSQL;
 end;
end;

procedure TdmSync.AlterarFlagRevisao(vIdOld, vIdNew: string);
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('update revisaomaquina set id='+vIdNew);
   Add(',syncfaz=1');
   Add('where id='+vIdOld);
   ExecSQL;

   Clear;
   Add('update revisaomaquinaitens set idrevisao='+vIdNew);
   Add('where idrevisao='+vIdOld);
   ExecSQL;

   Clear;
   Add('update servicomanutencao set idrevisao='+vIdNew);
   Add('where idrevisao='+vIdOld);
   ExecSQL;
 end;
end;

procedure TdmSync.AlterarFlagRevisaoItem(vId: string);
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('update revisaomaquinaitens set syncfaz=1');
   Add('where id='+vId);
   ExecSQL;
 end;
end;

procedure TdmSync.AlterarFlagRevisaoServico(vId: string);
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('update servicomanutencao set syncfaz=1');
   Add('where id='+vId);
   ExecSQL;
 end;
end;

procedure TdmSync.AlterarFlagEmbarque(vId:String);
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('update embarque set syncfaz=1');
   Add('where id in('+vId+')');
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

procedure TdmSync.AtualizaObsReceituario(id,obs: string);
begin
  with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('update receiturario set observacao='+obs.QuotedString);
   Add('where id='+id);
   try
    ExecSQL;
   except
    on E: Exception do
      frmPrincipal.myShowMenssagem(e.Message);
   end
 end;
end;

procedure TdmSync.CompradorReconcileError(DataSet: TFDDataSet; E: EFDException;
  UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
begin
 frmPrincipal.myShowMenssagem(e.Message);
end;

procedure TdmSync.ContratosReconcileError(DataSet: TFDDataSet; E: EFDException;
  UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
begin
 frmPrincipal.myShowMenssagem(e.Message);
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

procedure TdmSync.DeletaReceituarioSync;
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('delete from receiturario');
   Add('where status=1');
   try
    ExecSQL;
   except
     on E: Exception do
      frmPrincipal.myShowMenssagem(e.Message);
   end
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
      frmPrincipal.myShowMenssagem(e.Message);
   end
 end;
end;

procedure TdmSync.EmbarqueReconcileError(DataSet: TFDDataSet; E: EFDException;
  UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
begin
 frmPrincipal.myShowMenssagem(e.Message);
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
   DeletaTabelaSync('areas');
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
          vJoGetJ         := vJoGet.Items[i] as TJSONObject;
          vID             := vJoGetJ.GetValue('ID').value;
          dmDB.TAreas.Close;
          dmDB.TAreas.Open;
          dmDB.TAreas.Insert;
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
   Url := 'http://'+Host+':'+Porta+'/OperacaoSafraVasao';
   IdHTTP1.Request.CustomHeaders.Clear;
   IdHTTP1.Request.ContentType := 'application/json';
   IdHTTP1.Request.Accept      := 'application/json';
     vReultHTTP  := IdHTTP1.Post(URL,JsonToSend);
     if copy(vReultHTTP,0,4)='{"OK'then
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

function TdmSync.GetTipoDB:string;
var
 Url,vJsonString,vIsert,
 vField,vFieldJS,vTipo:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J,z:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   Url := 'http://'+Host+':'+Porta+'/GetTipoDB';
   IdHTTP1.Request.CustomHeaders.Clear;
   vJsonString        := IdHTTP1.Get(URL);
   jSubObj  := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
   vJoGet := jSubObj.GetValue<TJSONArray>('TipoDB') as TJSONArray;
   vJoGetJ         := vJoGet.Items[0] as TJSONObject;
   vTipo   := vJoGetJ.GetValue('TIPO').value;
   with qryAux,qryAux.SQL do
   begin
     Clear;
     Add('UPDATE CONFIG SET TIPODB='+vTipo.QuotedString);
     ExecSQL;
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
   DeletaTabelaSync('Pluviometro');
   Url := 'http://'+Host+':'+Porta+'/GetPluviometro';
   IdHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := IdHTTP1.Get(URL);
    if(vJsonString<>'{"TPluviometro":[') then
    begin
       jSubObj  := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
       vJoGet := jSubObj.GetValue<TJSONArray>('TPluviometro') as TJSONArray;
       for i := 0 to vJoGet.Count-1 do
       begin
          vJoGetJ         := vJoGet.Items[i] as TJSONObject;
          vId               := vJoGetJ.GetValue('id').value;
          TSyncPluviometro.Close;
          TSyncPluviometro.Open;
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
 Url,vJsonString,vID:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
   DeletaTabelaSync('PluviometroTalhoes');
   Url :='http://'+Host+':'+Porta+'/GetPluviometroTalhoes';
   IdHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := IdHTTP1.Get(URL);
    if(vJsonString<>'{"Mensagem":"Nenhum Pluviometro Talhoes encontrado!"}') then
    begin
      jSubObj  := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
       vJoGet := jSubObj.GetValue<TJSONArray>('TPluviometroTalhoes') as TJSONArray;
       for i := 0 to vJoGet.Count-1 do
       begin
          vJoGetJ         := vJoGet.Items[i] as TJSONObject;
          vID             := vJoGetJ.GetValue('INSERT').value;
          if vID.Length>0 then
          begin
            with qryAux,qryAux.SQL do
            begin
              Clear;
              Add(vID);
              try
                  ExecSQL;
              except
                on E: Exception do
                 result:=('Erro: ' + E.Message );
              end;
            end;
          end;
       end;
       result:='Pluviometro Talhoes Baixado com Sucesso!'
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


function TdmSync.GetAtualizaStatusReceituario:string;
var
 URL,vReultHTTP,ResponseBody:STRING;
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
   IdHTTP1.Request.Accept      := 'application/json';
   ResponseBody := IdHTTP1.Post(url,JsonToSend);
   if copy(ResponseBody,0,18)='{"OK":"'then
   begin
     vReultHTTP := StringReplace(vReultHTTP,'{"OK":"','',[rfReplaceAll]);
     vReultHTTP := StringReplace(vReultHTTP,'"}]}','',[rfReplaceAll]);
   end;
   Result     := vReultHTTP;
 end;
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
       Url := 'http://'+Host+':'+Porta+'/OperacaoSafraTalhaoOcorrencia';
       IdHTTP1.Request.CustomHeaders.Clear;
       IdHTTP1.Request.ContentType := 'application/json';
       IdHTTP1.Request.Accept      := 'application/json';
       try
         vReultHTTP  := IdHTTP1.Post(URL,JsonToSend);
         vReultHTTPc := copy(vReultHTTP,0,4);
         if vReultHTTPc='{"Ok' then
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
  qryOpSafraProdutosSync.Open;
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
           txtJson.WriteValue(qryOpSafraProdutosSyncidusuario.AsString);
           txtJson.WritePropertyName('idOperacao');
           txtJson.WriteValue(qryOpSafraProdutosSyncidoperacaotalhao.AsString);
           txtJson.WritePropertyName('idProduto');
           txtJson.WriteValue(qryOpSafraProdutosSyncidproduto.AsString);
           txtJson.WritePropertyName('qtde');
           txtJson.WriteValue(qryOpSafraProdutosSyncqtdeutilidado.AsString);
           txtJson.WritePropertyName('observacao');
           txtJson.WriteValue(qryOpSafraProdutosSyncobservacao.AsString);
           txtJson.WritePropertyName('data');
           txtJson.WriteValue(qryOpSafraProdutosSyncdata.AsString);
           txtJson.WriteEndObject;
       TxtJSON.WriteEndArray; //Fecha Array dos Itens
       txtJson.WriteEndObject;
       LJsonObj := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
       JsonToSend := TStringStream.Create(LJsonObj.ToJSON);
       Url := 'http://'+Host+':'+Porta+'/OperacaoSafraTalhaoProduto';
       IdHTTP1.Request.CustomHeaders.Clear;
       IdHTTP1.Request.ContentType := 'application/json';
       IdHTTP1.Request.Accept      := 'application/json';
       vReultHTTP := IdHTTP1.Post(url,JsonToSend);
       if copy(vReultHTTP,0,4)='{"Ok'then
       begin

         vReultHTTPc := copy(vReultHTTP,0,4);
         vReultHTTPClean := StringReplace(vReultHTTP,vReultHTTPc,'',[rfReplaceAll]);
         vReultHTTPClean := StringReplace(vReultHTTPClean,'"}','',[rfReplaceAll]);
         Result          := vReultHTTPClean;
       end;
       qryOpSafraProdutosSync.Next;
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
           txtJson.WriteValue(qryOpSafraMaquinasSync.FieldByName('idusuario').AsString);
           txtJson.WritePropertyName('idOperacao');
           txtJson.WriteValue(qryOpSafraMaquinasSync.FieldByName('idoperacaotalhao').AsString);
           txtJson.WritePropertyName('idMaquina');
           txtJson.WriteValue(qryOpSafraMaquinasSync.FieldByName('idMaquina').AsString);
           txtJson.WritePropertyName('operador');
           txtJson.WriteValue(qryOpSafraMaquinasSync.FieldByName('operador').AsString);
           txtJson.WritePropertyName('horaInicio');
           txtJson.WriteValue(qryOpSafraMaquinasSync.FieldByName('horaInicio').AsString);
           txtJson.WritePropertyName('horaFim');
           txtJson.WriteValue(qryOpSafraMaquinasSync.FieldByName('horafim').AsString);
           txtJson.WritePropertyName('horaParado');
           txtJson.WriteValue(qryOpSafraMaquinasSync.FieldByName('horaparada').AsString);
           txtJson.WritePropertyName('horaTrabalhada');
           txtJson.WriteValue(qryOpSafraMaquinasSync.FieldByName('horaTrabalhada').AsString);
           txtJson.WritePropertyName('observacao');
           txtJson.WriteValue(qryOpSafraMaquinasSync.FieldByName('observacao').AsString);
           txtJson.WritePropertyName('data');
           txtJson.WriteValue(qryOpSafraMaquinasSync.FieldByName('data').AsString);
           txtJson.WritePropertyName('idOperador');
           txtJson.WriteValue(qryOpSafraMaquinasSync.FieldByName('idOperador').AsString);
           txtJson.WritePropertyName('romaneio');
           txtJson.WriteValue(qryOpSafraMaquinasSync.FieldByName('romaneio').AsString);
           txtJson.WriteEndObject;
       TxtJSON.WriteEndArray; //Fecha Array dos Itens
       txtJson.WriteEndObject;
       LJsonObj := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
       JsonToSend := TStringStream.Create(LJsonObj.ToJSON);
       Url := 'http://'+Host+':'+Porta+'/OperacaoSafraTalhaoMaquinas';
       IdHTTP1.Request.CustomHeaders.Clear;
       IdHTTP1.Request.ContentType := 'application/json';
       IdHTTP1.Request.Accept      := 'application/json';
       try
         vReultHTTP := IdHTTP1.Post(url,JsonToSend);
         if copy(vReultHTTP,0,4)='{"Ok'then
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
           txtJson.WritePropertyName('observacao');
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
 URL,vReultHTTP,ResponseBody:STRING;
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
   Url := 'http://'+Host+':'+Porta+'/OperacaoSafraReceituario';
   IdHTTP1.Request.CustomHeaders.Clear;
   IdHTTP1.Request.Accept      := 'application/json';
   IdHTTP1.Request.ContentType := 'application/json';
   ResponseBody := IdHTTP1.Post(url,JsonToSend);
   if copy(ResponseBody,0,4)='{"OK'then
   begin
     vReultHTTP := StringReplace(ResponseBody,'{"OK":"','',[rfReplaceAll]);
     vReultHTTP := StringReplace(vReultHTTP,'"}','',[rfReplaceAll]);
     dmSync.PostReceituarioDet(TSyncReceituario.FieldByName('id').AsString);
     dmSync.PostReceituarioDetTalhao(TSyncReceituario.FieldByName('id').AsString);
     vReultHTTP := StringReplace(ResponseBody,'{"OK":"','',[rfReplaceAll]);
     vReultHTTP := StringReplace(vReultHTTP,'"}','',[rfReplaceAll]);
     dmDB.AlteraStatusReceituario(vReultHTTP,'1');
   end;
  Result     := vReultHTTP;
 end;
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
   Url := 'http://'+Host+':'+Porta+'/OperacaoStandPlantas';
   IdHTTP1.Request.CustomHeaders.Clear;
   IdHTTP1.Request.ContentType := 'application/json';
   IdHTTP1.Request.Accept      := 'application/json';
   vReultHTTP := IdHTTP1.Post(url,JsonToSend);

   if copy(vReultHTTP,0,4)='{"OK'then
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
   Url := 'http://'+Host+':'+Porta+'/Pluviometria';
   IdHTTP1.Request.CustomHeaders.Clear;
   IdHTTP1.Request.ContentType := 'application/json';
   IdHTTP1.Request.Accept      := 'application/json';
   vReultHTTP := IdHTTP1.Post(url,JsonToSend);
   if copy(vReultHTTP,0,4)='{"OK'then
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
   vReultHTTPClean,ResponseBody: String;
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
       Url := 'http://'+Host+':'+Porta+'/TonkenApp';
       IdHTTP1.Request.Accept      := 'application/json';
       IdHTTP1.Request.ContentType := 'application/json';
       ResponseBody := IdHTTP1.Post(url,
          JsonToSend);
       if copy(ResponseBody,0,18)='{"OK":"'then
       begin
         vReultHTTP := StringReplace(vReultHTTP,'{"OK":"','',[rfReplaceAll]);
         vReultHTTP := StringReplace(vReultHTTP,'"}]}','',[rfReplaceAll]);
       end;
       Result     := vReultHTTP;
 end;
end;

function TdmSync.PostReceituarioDet(idReceituario: string): string;
var
 URL,vReultHTTP,ResponseBody:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 AbreDetReceituario(idReceituario);
 if not TSyncDetReceituario.IsEmpty then
 begin
   JsonToSend := TStringStream.Create(nil);
   TSyncDetReceituario.SaveToStream(JsonToSend,sfJSON);
   Url := 'http://'+Host+':'+Porta+'/OperacaoDetReceituario';
   IdHTTP1.Request.CustomHeaders.Clear;
    IdHTTP1.Request.CustomHeaders.Clear;
   IdHTTP1.Request.ContentType := 'application/json';
   IdHTTP1.Request.Accept      := 'application/json';
   ResponseBody := IdHTTP1.Post(url,JsonToSend);
   if copy(ResponseBody,0,4)='{"OK'then
   begin
     vReultHTTP := StringReplace(ResponseBody,'{"OK":"','',[rfReplaceAll]);
     vReultHTTP := StringReplace(vReultHTTP,'"}','',[rfReplaceAll]);
   end;
 end;
 Result     := vReultHTTP;
end;

function TdmSync.PostReceituarioDetTalhao(idReceituario: string): string;
var
 URL,vReultHTTP,ResponseBody:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 AbreDetReceituarioTalhao(idReceituario);
 if not TSyncDetReceituarioTalhao.IsEmpty then
 begin
   JsonToSend := TStringStream.Create(nil);
   TSyncDetReceituarioTalhao.SaveToStream(JsonToSend,sfJSON);
   Url := 'http://'+Host+':'+Porta+'/OperacaoDetReceituarioTalhao';
   IdHTTP1.Request.Accept      := 'application/json';
   IdHTTP1.Request.ContentType := 'application/json';
   ResponseBody := IdHTTP1.Post(url,JsonToSend);
   if copy(ResponseBody,0,18)='{"OK":"'then
   begin
     vReultHTTP := StringReplace(vReultHTTP,'{"OK":"','',[rfReplaceAll]);
     vReultHTTP := StringReplace(vReultHTTP,'"}]}','',[rfReplaceAll]);
   end;
   Result     := vReultHTTP;
 end;
end;

function TdmSync.PostRevisao: string;
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
 vQryLoop :TFDQuery;
begin
 vQryLoop := TFDQuery.Create(nil);
 vQryLoop.Connection := dmDB.FDConn;
 with vQryLoop,vQryLoop.SQL do
 begin
   Clear;
   Add('select * from revisaomaquina where syncfaz=0 and status=3');
   Open;
   while not vQryLoop.eof do
   begin
    AbreRevisaoSync(vQryLoop.FieldByName('ID').AsString);
    if not TPostRevisao.IsEmpty then
    begin
       JsonToSend := TStringStream.Create(nil);
       TPostRevisao.SaveToStream(JsonToSend,sfJSON);
       Url := 'http://'+Host+':'+Porta+'/Revisao';
       IdHTTP1.Request.CustomHeaders.Clear;
       IdHTTP1.Request.CustomHeaders.Clear;
       IdHTTP1.Request.ContentType := 'application/json';
       IdHTTP1.Request.Accept      := 'application/json';
       vReultHTTP := IdHTTP1.Post(url,JsonToSend);
       if copy(vReultHTTP,0,4)='{"OK'then
       begin
         vReultHTTP := StringReplace(vReultHTTP,'{"OK":"','',[rfReplaceAll]);
         vReultHTTP := StringReplace(vReultHTTP,'"}','',[rfReplaceAll]);
         AlterarFlagRevisao(vQryLoop.FieldByName('ID').AsString,vReultHTTP);
       end;
    end;
    vQryLoop.Next;
   end
 end;
end;

function TdmSync.PostRevisaoItens: string;
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
 vQryLoop :TFDQuery;
begin
 vQryLoop := TFDQuery.Create(nil);
 vQryLoop.Connection := dmDB.FDConn;
 with vQryLoop,vQryLoop.SQL do
 begin
   Clear;
   Add('select * from revisaomaquinaitens where syncfaz=0 and status=2');
   Open;
   while not vQryLoop.eof do
   begin
    AbreRevisaoItemSync(vQryLoop.FieldByName('ID').AsString);
    if not TPostRevisaoItem.IsEmpty then
    begin
       JsonToSend := TStringStream.Create(nil);
       TPostRevisaoItem.SaveToStream(JsonToSend,sfJSON);
       Url := 'http://'+Host+':'+Porta+'/RevisaoItens';
       IdHTTP1.Request.CustomHeaders.Clear;
       IdHTTP1.Request.CustomHeaders.Clear;
       IdHTTP1.Request.ContentType := 'application/json';
       IdHTTP1.Request.Accept      := 'application/json';
       vReultHTTP := IdHTTP1.Post(url,JsonToSend);
       if copy(vReultHTTP,0,4)='{"OK'then
       begin
         vReultHTTP := StringReplace(vReultHTTP,'{"OK":"','',[rfReplaceAll]);
         vReultHTTP := StringReplace(vReultHTTP,'"}','',[rfReplaceAll]);
         AlterarFlagRevisaoItem(vQryLoop.FieldByName('ID').AsString);
       end;
    end;
    vQryLoop.Next;
   end
 end;
end;

function TdmSync.PostRevisaoServico: string;
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
 vQryLoop :TFDQuery;
begin
 vQryLoop := TFDQuery.Create(nil);
 vQryLoop.Connection := dmDB.FDConn;
 with vQryLoop,vQryLoop.SQL do
 begin
   Clear;
   Add('select * from servicomanutencao where syncfaz=0');
   Open;
   while not vQryLoop.eof do
   begin
    AbreRevisaoServicoSync(vQryLoop.FieldByName('ID').AsString);
    if not TPostRevisaoServico.IsEmpty then
    begin
       JsonToSend := TStringStream.Create(nil);
       TPostRevisaoServico.SaveToStream(JsonToSend,sfJSON);
       Url := 'http://'+Host+':'+Porta+'/RevisaoServicos';
       IdHTTP1.Request.CustomHeaders.Clear;
       IdHTTP1.Request.CustomHeaders.Clear;
       IdHTTP1.Request.ContentType := 'application/json';
       IdHTTP1.Request.Accept      := 'application/json';
       vReultHTTP := IdHTTP1.Post(url,JsonToSend);
       if copy(vReultHTTP,0,4)='{"OK'then
       begin
         vReultHTTP := StringReplace(vReultHTTP,'{"OK":"','',[rfReplaceAll]);
         vReultHTTP := StringReplace(vReultHTTP,'"}','',[rfReplaceAll]);
         AlterarFlagRevisaoItem(vQryLoop.FieldByName('ID').AsString);
       end;
    end;
    vQryLoop.Next;
   end
 end;
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
  frmPrincipal.myShowMenssagem(e.Message);
 end);
end;

procedure TdmSync.TSyncReceituarioReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
  frmPrincipal.myShowMenssagem(e.Message);
end;

function TdmSync.VerificaReceituarioExiste(id: string): Boolean;
begin
 with TSyncReceituario,TSyncReceituario.SQL do
 begin
   Clear;
   Add('select * from receiturario');
   Add('where id='+Id);
   try
    Open;
   except
    on E: Exception do
    begin
      frmPrincipal.myShowMenssagem(E.Message);
    end;
   end;
   Result := TSyncReceituario.IsEmpty;
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
       Url := 'http://'+Host+':'+Porta+'/OperacaoSafraTalhao';

       IdHTTP1.Request.CustomHeaders.Clear;
       IdHTTP1.Request.ContentType := 'application/json';
       IdHTTP1.Request.Accept      := 'application/json';
       try
         vReultHTTP := IdHTTP1.Post(url,JsonToSend);

         if copy(vReultHTTP,0,4)='{"Ok'then
         begin
           vReultHTTPClean := StringReplace(vReultHTTP,'{"Ok":"','',[rfReplaceAll]);
           vReultHTTPClean := StringReplace(vReultHTTPClean,'"}','',[rfReplaceAll]);
           frmPrincipal.log.Lines.Add('Atualizando Operacao');
           dmDB.AtualizaIdOperacao(qryOpSafraSyncid.AsString,vReultHTTPClean);
           frmPrincipal.log.Lines.Add('Enviando Maquinas operação');
           PostOperacaoSafraMaquinasAplSolidos(vReultHTTPClean);
           frmPrincipal.log.Lines.Add('Enviando Produtos operação');
           PostOperacaoSafraProdutosAplSolidos(vReultHTTPClean);
           frmPrincipal.log.Lines.Add('Enviando Ocorrencia operação');
           PostOperacaoSafraOcorrenciaAplSolidos(vReultHTTPClean);
           frmPrincipal.log.Lines.Add('Enviando Vazao operação');
           PostOperacaoSafraVazaoPul(vReultHTTPClean);
           frmPrincipal.log.Lines.Add('Mudando Flag operação');
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
   DeletaTabelaSync('operacoes');
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
          dmDB.TOperacoes.Insert;
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
   DeletaTabelaSync('produtos');
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
          vJoGetJ         := vJoGet.Items[i] as TJSONObject;
          vID             := vJoGetJ.GetValue('INSERT').value;
          if vID.Length>0 then
          begin
            with qryAux,qryAux.SQL do
            begin
              Clear;
              Add(vID);
              try
                  ExecSQL;
              except
                on E: Exception do
                 result:=('Erro: ' + E.Message );
              end;
            end;
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
   dmSync.DeletaReceituarioSync;
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
          TSyncReceituario.Close;
          TSyncReceituario.Open;
          TSyncReceituario.Insert;
          TSyncReceituarioId.AsString                 := vId;
          TSyncReceituariostatus.AsString             := vJoGetJ.GetValue('Status').value;
          TSyncReceituarionome.AsString               := vJoGetJ.GetValue('Nome').value;
          TSyncReceituarioresponsavel.AsString        := vJoGetJ.GetValue('Responsavel').value;
          TSyncReceituarioDataRegistro.AsString       := vJoGetJ.GetValue('DataReg').value;
          TSyncReceituariodatarecomendacao.AsString   := vJoGetJ.GetValue('datarecomendacao').value;
          TSyncReceituariodataprevaplicacao.AsString  := vJoGetJ.GetValue('dataprevaplicacao').value;
          TSyncReceituarioobservacao.AsString         := vJoGetJ.GetValue('observacao').value;
          if vJoGetJ.GetValue('Status').value='0' then
           TSyncReceituariostatus.AsString            :='1';
          try
           TSyncReceituario.ApplyUpdates(-1);
          DeletaDetReceituario(vId);
          GetDetReceituario(vId);
          GetDetReceituarioTalhoes(vId);
          except
            on E: Exception do
             result:=('Erro: ' + E.Message );
          end;
       end
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

function TdmSync.GetRevisao: string;
var
 Url,vJsonString,vID:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
 DeletaTabelaSync('revisaomaquinahist');
 Url :='http://'+Host+':'+Porta+'/GetRevisao';
 IdHTTP1.Request.CustomHeaders.Clear;
 try
  vJsonString        := IdHTTP1.Get(URL);
  if(vJsonString<>'{"Mensagem":"Nenhum Revisao Historico encontrado!"}') then
  begin
    jSubObj  := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
     vJoGet := jSubObj.GetValue<TJSONArray>('TAuxRevisaoHist') as TJSONArray;
     for i := 0 to vJoGet.Count-1 do
     begin
        vJoGetJ         := vJoGet.Items[i] as TJSONObject;
        vID             := vJoGetJ.GetValue('INSERT').value;
        if vID.Length>0 then
        begin
          with qryAux,qryAux.SQL do
          begin
            Clear;
            Add(vID);
            try
                ExecSQL;
            except
              on E: Exception do
               result:=('Erro: ' + E.Message );
            end;
          end;
        end;
     end;
     result:='Revisao Historico Baixado com Sucesso!'
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
          vJoGetJ         := vJoGet.Items[i] as TJSONObject;
          vID             := vJoGetJ.GetValue('Id').value;
          try
            dmDB.TMaquina.Close;
            dmDB.TMaquina.Open;
            dmDB.TMaquina.Insert;
            dmDB.TMaquinaId.AsString                       := vId;
            dmDB.TMaquinastatus.AsString                   := vJoGetJ.GetValue('Status').value;
            dmDB.TMaquinatipo.AsString                     := vJoGetJ.GetValue('Tipo').value;
            dmDB.TMaquinamarca.AsString                    := vJoGetJ.GetValue('Marca').value;
            dmDB.TMaquinamodelo.AsString                   := vJoGetJ.GetValue('Modelo').value;
            dmDB.TMaquinaplaca.AsString                    := vJoGetJ.GetValue('Placa').value;
            dmDB.TMaquinaano.AsString                      := vJoGetJ.GetValue('Ano').value;
            dmDB.TMaquinachassi.AsString                   := vJoGetJ.GetValue('Chassi').value;
            dmDB.TMaquinacombustivel.AsString              := vJoGetJ.GetValue('Combustivel').value;
            dmDB.TMaquinanumeroserie.AsString              := vJoGetJ.GetValue('NumeroSerie').value;
            dmDB.TMaquinaPrefixo.AsString                  := vJoGetJ.GetValue('Prefixo').value;
            dmDB.TMaquinaultimarevisao.AsString            := vJoGetJ.GetValue('ultimarevisao').value;
            dmDB.TMaquinahorimetroultimarev.AsString       := vJoGetJ.GetValue('horimetroultimarev').value;
            dmDB.TMaquinahorimetroproximarevisao.AsString  := vJoGetJ.GetValue('horimetroproximarevisao').value;
            dmDB.TMaquinahorimetro.AsString                := vJoGetJ.GetValue('horimetro').value;
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
 vIdSupervisor,abastecimento,agronomo,SUPERVISOR,
 armazem,
 aplicacaosolido,
 pulverizacao,
 plantio,
 colheita,
 monitoramentopragas,
 pluviometria,
 manutencaomaquinas,
 abastecimentoexterno:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
 ArrayPed, ArrayItem: TJSONArray;
begin
   DeletaTabelaSync('usuario');
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
          vJoGetJ              := vJoGet.Items[i] as TJSONObject;
          vID                  := vJoGetJ.GetValue('ID').value;
          vSTATUS              := vJoGetJ.GetValue('Status').value;
          vNOME                := vJoGetJ.GetValue('nome').value;
          vLOGIN               := vJoGetJ.GetValue('usuario').value;
          vPASSWORD            := vJoGetJ.GetValue('senha').value;
          SUPERVISOR           := vJoGetJ.GetValue('supervisor').value;
          vTIPO                := vJoGetJ.GetValue('tipo').value;
          agronomo             := vJoGetJ.GetValue('agronomo').value;
          abastecimento        := vJoGetJ.GetValue('abastecimento').value;
          armazem              := vJoGetJ.GetValue('armazem').value;
          aplicacaosolido      := vJoGetJ.GetValue('aplicacaosolido').value;
          pulverizacao         := vJoGetJ.GetValue('pulverizacao').value;
          plantio              := vJoGetJ.GetValue('plantio').value;
          colheita             := vJoGetJ.GetValue('colheita').value;
          monitoramentopragas  := vJoGetJ.GetValue('monitoramentopragas').value;
          pluviometria         := vJoGetJ.GetValue('pluviometria').value;
          manutencaomaquinas   := vJoGetJ.GetValue('manutencaomaquinas').value;
          abastecimentoexterno := vJoGetJ.GetValue('abastecimentoexterno').value;

          dmDB.TUsuario.Close;
          dmDB.TUsuario.Open;
          dmDB.TUsuario.Insert;
          dmDB.TUsuarioId.AsString                   := vId;
          dmDB.TUsuarionome.AsString                 := vNome;
          dmDB.TUsuariousuario.AsString              := vLOGIN;
          dmDB.TUsuariosenha.AsString                := vPASSWORD;
          dmDB.TUsuariotipo.AsString                 := vTIPO;
          dmDB.TUsuariostatus.AsString               := vSTATUS;
          dmDB.TUsuariosupervisor.AsString           := SUPERVISOR;
          dmDB.TUsuarioagronomo.AsString             := agronomo;
          dmDB.TUsuarioabastecimento.AsString        := abastecimento;
          dmDB.TUsuariosupervisor.AsString           := SUPERVISOR;
          dmDB.TUsuarioarmazem.AsString              := armazem;
          dmDB.TUsuarioaplicacaosolido.AsString      := aplicacaosolido;
          dmDB.TUsuariopulverizacao.AsString         := pulverizacao;
          dmDB.TUsuarioplantio.AsString              := plantio;
          dmDB.TUsuariocolheita.AsString             := colheita;
          dmDB.TUsuariomonitoramentopragas.AsString  := monitoramentopragas;
          dmDB.TUsuariopluviometria.AsString         := pluviometria;
          dmDB.TUsuariomanutencaomaquinas.AsString   := manutencaomaquinas;
          dmDB.TUsuarioabastecimentoexterno.AsString := abastecimentoexterno;
          try
           dmDB.TUsuario.ApplyUpdates(-1);
          except
            on E: Exception do
             result:=('Erro: ' + E.Message );
          end;
       end;
       result:='Usuarios Baixados com Sucesso'
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
          vJoGetJ         := vJoGet.Items[i] as TJSONObject;
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
