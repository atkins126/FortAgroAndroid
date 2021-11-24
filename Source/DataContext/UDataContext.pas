unit UDataContext;

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
  System.JSON,IdHashMessageDigest,System.JSON.Writers,System.JSON.Types,Data.DBXPlatform;

type
  TdmDB = class(TDataModule)
    FDConn: TFDConnection;
    qryConfig: TFDQuery;
    TUsuario: TFDQuery;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    qryConfigIP_SERVIDOR: TWideStringField;
    qryConfigPOTA_SERVIDOR: TIntegerField;
    qryConfigSERIAL: TWideStringField;
    qryConfigSalvarLogin: TIntegerField;
    qryControAcces: TFDQuery;
    qryControAccesusuario: TWideStringField;
    qryControAccesdata_access: TDateTimeField;
    qryControAccesid: TFDAutoIncField;
    qryControAccessenha: TStringField;
    TUsuarioid: TIntegerField;
    TUsuariostatus: TWideStringField;
    TUsuarionome: TStringField;
    TUsuariousuario: TStringField;
    TUsuariosenha: TStringField;
    TUsuariotipo: TWideStringField;
    TUsuariosupervisor: TStringField;
    TUsuariotipoSTR: TWideStringField;
    TMaquina: TFDQuery;
    TMaquinaid: TWideStringField;
    TMaquinastatus: TWideStringField;
    TMaquinatipo: TStringField;
    TMaquinamarca: TStringField;
    TMaquinamodelo: TStringField;
    TMaquinaplaca: TStringField;
    TMaquinaano: TWideStringField;
    TMaquinachassi: TStringField;
    TMaquinacombustivel: TWideStringField;
    TMaquinavalor: TBCDField;
    TMaquinanumeroserie: TStringField;
    TMaquinaimg: TBlobField;
    TMaquinaprefixo: TStringField;
    TProdutos: TFDQuery;
    TProdutosid: TIntegerField;
    TProdutosstatus: TWideStringField;
    TProdutosnome: TStringField;
    TProdutostipo: TStringField;
    TProdutosunidademedida: TStringField;
    TProdutosestoqueminimo: TBCDField;
    TProdutosobservacao: TStringField;
    TProdutoscodigobarras: TStringField;
    TOperacoes: TFDQuery;
    TOperacoesid: TIntegerField;
    TOperacoesstatus: TWideStringField;
    TOperacoesnome: TStringField;
    TOperacaoSafra: TFDQuery;
    TOperacaoSafraMaquinas: TFDQuery;
    TOperacaoSafraProdutos: TFDQuery;
    TOperacaoSafraOcorrencia: TFDQuery;
    TOperacaoSafraProdutosid: TIntegerField;
    TOperacaoSafraProdutosstatus: TWideStringField;
    TOperacaoSafraProdutosdatareg: TWideStringField;
    TOperacaoSafraProdutosidusuario: TWideStringField;
    TOperacaoSafraProdutosdataalteracao: TWideStringField;
    TOperacaoSafraProdutosidusuarioalteracao: TWideStringField;
    TOperacaoSafraProdutosidoperacaotalhao: TWideStringField;
    TOperacaoSafraProdutosidproduto: TWideStringField;
    TOperacaoSafraProdutosqtdeutilidado: TWideStringField;
    TOperacaoSafraProdutosobservacao: TStringField;
    TOperacaoSafraProdutosdata: TDateField;
    TOperacaoSafraOcorrenciastatus: TWideStringField;
    TOperacaoSafraOcorrenciadatareg: TWideStringField;
    TOperacaoSafraOcorrenciadataalteracao: TWideStringField;
    TOperacaoSafraOcorrenciaidusuarioalteracao: TWideStringField;
    TOperacaoSafraOcorrenciaidoperacaotalhao: TWideStringField;
    TOperacaoSafraOcorrenciadataocorrencia: TDateField;
    TOperacaoSafraOcorrenciaidtipoocorrencia: TWideStringField;
    TOperacaoSafraOcorrenciahora: TTimeField;
    TOperacaoSafraOcorrenciadescricao: TStringField;
    TOperacaoSafraOcorrenciadata: TDateField;
    TAuxOcorrencia: TFDQuery;
    TAuxOcorrenciaid: TIntegerField;
    TAuxOcorrenciastatus: TWideStringField;
    TAuxOcorrencianome: TStringField;
    TOperacaoSafraProdutosProduto: TStringField;
    TOperacaoSafraOcorrenciaTipoOcorrencia: TStringField;
    qryOpSafra: TFDQuery;
    qryOpSafraid: TIntegerField;
    qryOpSafrastatus: TWideStringField;
    qryOpSafradatareg: TWideStringField;
    qryOpSafraidusuario: TWideStringField;
    qryOpSafradataalteracao: TWideStringField;
    qryOpSafraidusuarioalteracao: TWideStringField;
    qryOpSafraidsafra: TWideStringField;
    qryOpSafraidoperacao: TWideStringField;
    qryOpSafradatainicio: TDateField;
    qryOpSafradatafim: TDateField;
    qryOpSafraobservacao: TStringField;
    qryOpSafraidtalhao: TWideStringField;
    qryOpSafraidresponsavel: TWideStringField;
    qryOpSafraareaprevista: TBCDField;
    qryOpSafraarearealizada: TBCDField;
    qryOpSafraTalhao: TStringField;
    qryOpSafraOperacao: TStringField;
    TOperacaoSafraid: TIntegerField;
    TOperacaoSafrastatus: TWideStringField;
    TOperacaoSafradatareg: TWideStringField;
    TOperacaoSafraidusuario: TWideStringField;
    TOperacaoSafradataalteracao: TWideStringField;
    TOperacaoSafraidusuarioalteracao: TWideStringField;
    TOperacaoSafraidsafra: TWideStringField;
    TOperacaoSafraidoperacao: TWideStringField;
    TOperacaoSafradatainicio: TDateField;
    TOperacaoSafradatafim: TDateField;
    TOperacaoSafraobservacao: TStringField;
    TOperacaoSafraidtalhao: TWideStringField;
    TOperacaoSafraidresponsavel: TWideStringField;
    TOperacaoSafraareaprevista: TBCDField;
    TOperacaoSafraarearealizada: TBCDField;
    TOperacaoSafraTalhao: TStringField;
    TOperacaoSafraOperacao: TStringField;
    TOperacaoSafraOcorrenciaid: TFDAutoIncField;
    TOperacaoSafraOcorrenciaidusuario: TIntegerField;
    TOperacaoSafrasetor: TStringField;
    TOperacaoSafraFlagSync: TIntegerField;
    TOperacaoSafradataSync: TDateTimeField;
    TOperacaoSafrafinalidade: TStringField;
    TOperacaoSafraidtipoaplicacaosolido: TStringField;
    TOperacaoSafraidcultura: TIntegerField;
    TOperacaoSafraidvariedade: TIntegerField;
    TOperacaoSafraidreceituario: TIntegerField;
    qryOpSafraFlagSync: TIntegerField;
    qryOpSafradataSync: TDateTimeField;
    qryOpSafrafinalidade: TStringField;
    qryOpSafraidtipoaplicacaosolido: TStringField;
    qryOpSafraidcultura: TIntegerField;
    qryOpSafraidvariedade: TIntegerField;
    qryOpSafraidreceituario: TIntegerField;
    qryOpSafratipoterraaereo: TStringField;
    TReceituario: TFDQuery;
    TReceituarioid: TIntegerField;
    TReceituariostatus: TWideStringField;
    TReceituarionome: TStringField;
    TReceituarioresponsavel: TStringField;
    TDetReceituario: TFDQuery;
    TDetReceituarioid: TIntegerField;
    TDetReceituariostatus: TWideStringField;
    TDetReceituarioidreceiturario: TWideStringField;
    TDetReceituarioidproduto: TWideStringField;
    TDetReceituarioproduto: TStringField;
    TTipoAplicacaoSolido: TFDQuery;
    TTipoAplicacaoSolidoid: TIntegerField;
    TTipoAplicacaoSolidostatus: TWideStringField;
    TTipoAplicacaoSolidonome: TStringField;
    TDetTalhoesPul: TFDQuery;
    qryAux: TFDQuery;
    TOperacaoSafratipoaplicacaosolido: TStringField;
    TOperacaoSafraCultura: TStringField;
    TOperacaoSafraReceituario: TStringField;
    qryGridReceituario: TFDQuery;
    qryGridReceituarioproduto: TStringField;
    qryGridReceituarioqtdporhe: TBCDField;
    qryGridReceituarioqtdTotal: TWideStringField;
    TAreas: TFDQuery;
    TAreasid: TIntegerField;
    TAreasstatus: TWideStringField;
    TAreasnome: TStringField;
    TAreasareahe: TBCDField;
    TAreaslatitude: TFMTBCDField;
    TAreaslongitude: TFMTBCDField;
    TAreasresponsavel: TStringField;
    TSetor: TFDQuery;
    TSetorid: TIntegerField;
    TSetorstatus: TWideStringField;
    TSetornome: TStringField;
    TSetorareahe: TBCDField;
    TSetorlatitude: TFMTBCDField;
    TSetorlongitude: TFMTBCDField;
    TSetoridarea: TWideStringField;
    TTalhoes: TFDQuery;
    TTalhoesid: TIntegerField;
    TTalhoesstatus: TWideStringField;
    TTalhoesnome: TStringField;
    TTalhoesareahe: TBCDField;
    TTalhoeslatitude: TFMTBCDField;
    TTalhoeslongitude: TFMTBCDField;
    TTalhoesidsetor: TWideStringField;
    TTalhoesqrcode: TStringField;
    TTalhoesobservacao: TStringField;
    TTalhoessetor: TStringField;
    TTalhoestipo: TStringField;
    TCulturas: TFDQuery;
    TCulturasid: TIntegerField;
    TCulturasstatus: TWideStringField;
    TCulturasnome: TStringField;
    TCultivares: TFDQuery;
    TCultivaresid: TIntegerField;
    TCultivaresstatus: TWideStringField;
    TCultivaresnome: TStringField;
    TSafra: TFDQuery;
    TSafraid: TIntegerField;
    TSafranome: TStringField;
    TSafrastatus: TIntegerField;
    qryTalhoesPul: TFDQuery;
    TOperacaoSafraidOpMaster: TIntegerField;
    qryQuebraMaquinasPul: TFDQuery;
    qryOperacaoQuebrada: TFDQuery;
    qryOperacaoQuebradaid: TIntegerField;
    qryOperacaoQuebradastatus: TWideStringField;
    qryOperacaoQuebradadatareg: TWideStringField;
    qryOperacaoQuebradaidusuario: TWideStringField;
    qryOperacaoQuebradadataalteracao: TWideStringField;
    qryOperacaoQuebradaidusuarioalteracao: TWideStringField;
    qryOperacaoQuebradaidsafra: TWideStringField;
    qryOperacaoQuebradaidoperacao: TWideStringField;
    qryOperacaoQuebradadatainicio: TDateField;
    qryOperacaoQuebradadatafim: TDateField;
    qryOperacaoQuebradaobservacao: TStringField;
    qryOperacaoQuebradaidtalhao: TWideStringField;
    qryOperacaoQuebradaidresponsavel: TWideStringField;
    qryOperacaoQuebradaareaprevista: TBCDField;
    qryOperacaoQuebradaarearealizada: TBCDField;
    qryOperacaoQuebradaFlagSync: TIntegerField;
    qryOperacaoQuebradadataSync: TDateTimeField;
    qryOperacaoQuebradafinalidade: TStringField;
    qryOperacaoQuebradaidtipoaplicacaosolido: TStringField;
    qryOperacaoQuebradaidcultura: TIntegerField;
    qryOperacaoQuebradaidvariedade: TIntegerField;
    qryOperacaoQuebradaidreceituario: TIntegerField;
    qryOperacaoQuebradatipoterraaereo: TStringField;
    qryOperacaoQuebradaidOpMaster: TIntegerField;
    qryQuebraProdutosPul: TFDQuery;
    qryQuebraOcorrenciaPul: TFDQuery;
    qryQuebraOcorrenciaPulid: TFDAutoIncField;
    qryQuebraOcorrenciaPulstatus: TWideStringField;
    qryQuebraOcorrenciaPuldatareg: TWideStringField;
    qryQuebraOcorrenciaPulidusuario: TIntegerField;
    qryQuebraOcorrenciaPuldataalteracao: TWideStringField;
    qryQuebraOcorrenciaPulidusuarioalteracao: TWideStringField;
    qryQuebraOcorrenciaPulidoperacaotalhao: TWideStringField;
    qryQuebraOcorrenciaPuldataocorrencia: TDateField;
    qryQuebraOcorrenciaPulidtipoocorrencia: TWideStringField;
    qryQuebraOcorrenciaPulhora: TTimeField;
    qryQuebraOcorrenciaPuldescricao: TStringField;
    qryQuebraOcorrenciaPuldata: TDateField;
    qryQuebraOcorrenciaPulidTalhao: TIntegerField;
    qryGridReceituariofinalidade: TStringField;
    qryGridReceituariotalhao: TStringField;
    TOperacaoSafraMaquinasid: TIntegerField;
    TOperacaoSafraMaquinasstatus: TWideStringField;
    TOperacaoSafraMaquinasidoperacaotalhao: TWideStringField;
    TOperacaoSafraMaquinasidmaquina: TWideStringField;
    TOperacaoSafraMaquinasoperador: TStringField;
    TOperacaoSafraMaquinashorainicio: TBCDField;
    TOperacaoSafraMaquinashorafim: TBCDField;
    TOperacaoSafraMaquinasobservacao: TStringField;
    TOperacaoSafraMaquinashoraparada: TBCDField;
    TOperacaoSafraMaquinasdata: TDateField;
    TOperacaoSafraMaquinasidUsuario: TIntegerField;
    TOperacaoSafraMaquinashoraTrabalhada: TBCDField;
    TOperacaoSafraMaquinasmaquina: TWideStringField;
    qryQuebraMaquinasPulid: TFDAutoIncField;
    qryQuebraMaquinasPulstatus: TWideStringField;
    qryQuebraMaquinasPulidOperacaotalhao: TWideStringField;
    qryQuebraMaquinasPulidmaquina: TWideStringField;
    qryQuebraMaquinasPuloperador: TStringField;
    qryQuebraMaquinasPulhorainicio: TBCDField;
    qryQuebraMaquinasPulhorafim: TBCDField;
    qryQuebraMaquinasPulobservacao: TStringField;
    qryQuebraMaquinasPulhoraparada: TBCDField;
    qryQuebraMaquinasPuldata: TDateField;
    qryQuebraMaquinasPulHorasTalhaoPercent: TWideStringField;
    qryQuebraProdutosPulid: TIntegerField;
    qryQuebraProdutosPulidproduto: TWideStringField;
    qryQuebraProdutosPulobservacao: TStringField;
    qryQuebraProdutosPuldata: TDateField;
    qryQuebraProdutosPulQtdeUtilizadaTalhao: TWideStringField;
    TAuxCobertura: TFDQuery;
    TAuxCoberturaid: TIntegerField;
    TAuxCoberturastatus: TWideStringField;
    TAuxCoberturanome: TStringField;
    TOperacaoSafraCobertura: TStringField;
    TOperacaoSafratipoterraaereo: TStringField;
    TOperadorMaquina: TFDQuery;
    TOperadorMaquinaid: TIntegerField;
    TOperadorMaquinastatus: TWideStringField;
    TOperadorMaquinanome: TStringField;
    TOperadorMaquinarg: TStringField;
    TOperadorMaquinacpf: TStringField;
    TOperadorMaquinacnh: TStringField;
    TOperadorMaquinacelular: TStringField;
    TOperacaoSafraMaquinasidOperador: TIntegerField;
    qryQuebraMaquinasPulidusuario: TIntegerField;
    qryQuebraMaquinasPulIdOperador: TIntegerField;
    qryQuebraMaquinasPulidTalhao: TIntegerField;
    qryQuebraMaquinasPulHorasTalhao: TWideStringField;
    qryQuebraMaquinasPulAreaRealizada: TBCDField;
    qryQuebraMaquinasPulPercetHoras: TFloatField;
    qryGridReceituarioareahe: TBCDField;
    TOperacaoSafraProdutosqtdPrevista: TBCDField;
    qryGridReceituarionome: TStringField;
    TReceituarioidResponsavel: TIntegerField;
    TReceituarioDataRegistro: TDateTimeField;
    TDetReceituarioidUsuario: TIntegerField;
    TStandPlantas: TFDQuery;
    TUsuarioagronomo: TIntegerField;
    TUsuarioabastecimento: TIntegerField;
    qryQuebraMaquinasPulareaTotal: TFloatField;
    TGridReceituarioTalhao: TFDQuery;
    TGridReceituarioTalhaoid: TIntegerField;
    TGridReceituarioTalhaostatus: TWideStringField;
    TGridReceituarioTalhaodatareg: TWideStringField;
    TGridReceituarioTalhaoidusuario: TWideStringField;
    TGridReceituarioTalhaodataalteracao: TWideStringField;
    TGridReceituarioTalhaoidusuarioalteracao: TWideStringField;
    TGridReceituarioTalhaoidtalhao: TWideStringField;
    TGridReceituarioTalhaoareahe: TBCDField;
    TGridReceituarioTalhaosyncaws: TWideStringField;
    TGridReceituarioTalhaosyncfaz: TWideStringField;
    TGridReceituarioTalhaoidreceiturario: TWideStringField;
    TGridReceituarioTalhaoTalhao: TStringField;
    TDetReceituarioTalhao: TFDQuery;
    TDetReceituarioTalhaoid: TIntegerField;
    TDetReceituarioTalhaostatus: TWideStringField;
    TDetReceituarioTalhaodatareg: TWideStringField;
    TDetReceituarioTalhaoidusuario: TWideStringField;
    TDetReceituarioTalhaodataalteracao: TWideStringField;
    TDetReceituarioTalhaoidusuarioalteracao: TWideStringField;
    TDetReceituarioTalhaoidtalhao: TWideStringField;
    TDetReceituarioTalhaoareahe: TBCDField;
    TDetReceituarioTalhaosyncaws: TWideStringField;
    TDetReceituarioTalhaosyncfaz: TWideStringField;
    TDetReceituarioTalhaoidreceiturario: TWideStringField;
    TVazaoOperacao: TFDQuery;
    TVazaoOperacaoid: TIntegerField;
    TVazaoOperacaostatus: TWideStringField;
    TVazaoOperacaodatareg: TWideStringField;
    TVazaoOperacaoidusuario: TWideStringField;
    TVazaoOperacaodataalteracao: TWideStringField;
    TVazaoOperacaoidusuarioalteracao: TWideStringField;
    TVazaoOperacaoidoperacaotalhao: TWideStringField;
    TVazaoOperacaoCincoLTHA: TIntegerField;
    TVazaoOperacaoDezLTHA: TIntegerField;
    TVazaoOperacaoQuinzeLTHA: TIntegerField;
    TVazaoOperacaoVinteLTHA: TIntegerField;
    TVazaoOperacaoTrintaLTHA: TIntegerField;
    TVazaoOperacaoQuarentaLTHA: TIntegerField;
    TVazaoOperacaoCinquentaLTHA: TIntegerField;
    TVazaoOperacaoSetentaeCincoLTHA: TIntegerField;
    TVazaoOperacaoCemLTHA: TIntegerField;
    TVazaoOperacaosyncaws: TWideStringField;
    TVazaoOperacaosyncfaz: TWideStringField;
    qryQuebraVazaoOperacao: TFDQuery;
    qryQuebraVazaoOperacaoid: TIntegerField;
    qryQuebraVazaoOperacaostatus: TWideStringField;
    qryQuebraVazaoOperacaodatareg: TWideStringField;
    qryQuebraVazaoOperacaoidusuario: TWideStringField;
    qryQuebraVazaoOperacaodataalteracao: TWideStringField;
    qryQuebraVazaoOperacaoidusuarioalteracao: TWideStringField;
    qryQuebraVazaoOperacaoidoperacaotalhao: TWideStringField;
    qryQuebraVazaoOperacaoCincoLTHA: TIntegerField;
    qryQuebraVazaoOperacaoDezLTHA: TIntegerField;
    qryQuebraVazaoOperacaoQuinzeLTHA: TIntegerField;
    qryQuebraVazaoOperacaoVinteLTHA: TIntegerField;
    qryQuebraVazaoOperacaoTrintaLTHA: TIntegerField;
    qryQuebraVazaoOperacaoQuarentaLTHA: TIntegerField;
    qryQuebraVazaoOperacaoCinquentaLTHA: TIntegerField;
    qryQuebraVazaoOperacaoSetentaeCincoLTHA: TIntegerField;
    qryQuebraVazaoOperacaoCemLTHA: TIntegerField;
    qryQuebraVazaoOperacaosyncaws: TWideStringField;
    qryQuebraVazaoOperacaosyncfaz: TWideStringField;
    TStandPlantasid: TIntegerField;
    TStandPlantasidUsuario: TIntegerField;
    TStandPlantasDataSementes: TDateField;
    TStandPlantasidCultura: TIntegerField;
    TStandPlantasIdVariedade: TIntegerField;
    TStandPlantasQtdeSementes: TBCDField;
    TStandPlantasDataPlantas: TDateField;
    TStandPlantasQtdePlantas: TBCDField;
    TStandPlantassyncaws: TIntegerField;
    TStandPlantasStatus: TIntegerField;
    TStandPlantasidTalhao: TIntegerField;
    TStandPlantassyncfaz: TIntegerField;
    TStandPlantasCultura: TStringField;
    TStandPlantasVariedade: TStringField;
    TStandPlantasTalhao: TStringField;
    TOperacaoSafraQualidadeCobertura: TStringField;
    qryOperacaoQuebradaQualidadeCobertura: TStringField;
    TOperacaoSafraidcobertura: TIntegerField;
    qryOperacaoQuebradaidcobertura: TIntegerField;
    TOperacaoSafraVariedade: TStringField;
    TPluviometro: TFDQuery;
    TPluviometroTalhoes: TFDQuery;
    TPluviometria: TFDQuery;
    TPluviometroTalhoesid: TIntegerField;
    TPluviometroTalhoesstatus: TWideStringField;
    TPluviometroTalhoesdatareg: TWideStringField;
    TPluviometroTalhoesidusuario: TWideStringField;
    TPluviometroTalhoesdataalteracao: TWideStringField;
    TPluviometroTalhoesidusuarioalteracao: TWideStringField;
    TPluviometroTalhoessyncaws: TWideStringField;
    TPluviometroTalhoessyncfaz: TWideStringField;
    TPluviometriaid: TIntegerField;
    TPluviometriastatus: TWideStringField;
    TPluviometriadatareg: TWideStringField;
    TPluviometriaidusuario: TWideStringField;
    TPluviometriadataalteracao: TWideStringField;
    TPluviometriaidusuarioalteracao: TWideStringField;
    TPluviometriaidpluviometro: TWideStringField;
    TPluviometriaidtalhao: TWideStringField;
    TPluviometriavolumemm: TBCDField;
    TPluviometriadatacoleta: TDateField;
    TPluviometriahora: TTimeField;
    TPluviometriasyncaws: TWideStringField;
    TPluviometriasyncfaz: TWideStringField;
    TPluviometroid: TIntegerField;
    TPluviometrostatus: TWideStringField;
    TPluviometrodatareg: TWideStringField;
    TPluviometroidusuario: TWideStringField;
    TPluviometrodataalteracao: TWideStringField;
    TPluviometroidusuarioalteracao: TWideStringField;
    TPluviometronome: TStringField;
    TPluviometrolatitude: TStringField;
    TPluviometrolongitude: TStringField;
    TPluviometrosyncaws: TWideStringField;
    TPluviometrosyncfaz: TWideStringField;
    TPluviometrosetor: TStringField;
    TPluviometroTalhoestalhao: TStringField;
    TPluviometroidsetor: TIntegerField;
    TPluviometroTalhoesidpluviometro: TIntegerField;
    TPluviometroTalhoesidtalhao: TIntegerField;
    TPluviometriaSetor: TStringField;
    TPluviometriaPluviometro: TStringField;
    TLocalEstoque: TFDQuery;
    TLocalEstoqueid: TIntegerField;
    TLocalEstoquestatus: TWideStringField;
    TLocalEstoquedatareg: TWideStringField;
    TLocalEstoqueidusuario: TWideStringField;
    TLocalEstoquedataalteracao: TWideStringField;
    TLocalEstoqueidusuarioalteracao: TWideStringField;
    TLocalEstoquenome: TStringField;
    TLocalEstoqueidsegmento: TWideStringField;
    TLocalEstoquesyncaws: TWideStringField;
    TLocalEstoquesyncfaz: TWideStringField;
    TAbastecimento: TFDQuery;
    TAbastecimentoid: TIntegerField;
    TAbastecimentostatus: TWideStringField;
    TAbastecimentodatareg: TWideStringField;
    TAbastecimentoidusuario: TWideStringField;
    TAbastecimentodataalteracao: TWideStringField;
    TAbastecimentoidusuarioalteracao: TWideStringField;
    TAbastecimentoidlocalestoque: TWideStringField;
    TAbastecimentoidmaquina: TWideStringField;
    TAbastecimentoidoperador: TWideStringField;
    TAbastecimentovolumelt: TBCDField;
    TAbastecimentocombustivel: TIntegerField;
    TAbastecimentodataabastecimento: TDateField;
    TAbastecimentohora: TTimeField;
    TAbastecimentosyncaws: TWideStringField;
    TAbastecimentosyncfaz: TWideStringField;
    TAbastecimentoLocalEstoque: TStringField;
    TAbastecimentoMaquina: TStringField;
    TAbastecimentoOperador: TStringField;
    TAbastecimentohorimetro: TBCDField;
    TAbastecimentoCombustivelStr: TWideStringField;
    TAbastecimentoOutros: TFDQuery;
    TAbastecimentoOutrosid: TIntegerField;
    TAbastecimentoOutrosstatus: TWideStringField;
    TAbastecimentoOutrosdatareg: TWideStringField;
    TAbastecimentoOutrosidusuario: TWideStringField;
    TAbastecimentoOutrosdataalteracao: TWideStringField;
    TAbastecimentoOutrosidusuarioalteracao: TWideStringField;
    TAbastecimentoOutrosidabastecimento: TWideStringField;
    TAbastecimentoOutrosidproduto: TWideStringField;
    TAbastecimentoOutrosquantidade: TBCDField;
    TAbastecimentoOutrossyncaws: TWideStringField;
    TAbastecimentoOutrossyncfaz: TWideStringField;
    TAbastecimentoOutrosProduto: TStringField;
    TDetReceituariofinalidade: TStringField;
    TPragas: TFDQuery;
    TPragasstatus: TWideStringField;
    TPragasdatareg: TWideStringField;
    TPragasidusuario: TWideStringField;
    TPragasdataalteracao: TWideStringField;
    TPragasidusuarioalteracao: TWideStringField;
    TPragasnome: TStringField;
    TPragassyncaws: TWideStringField;
    TPragassyncfaz: TWideStringField;
    TPragasid: TIntegerField;
    TMonitoramento: TFDQuery;
    TMonitoramentoPontos: TFDQuery;
    TMonitoramentoid: TIntegerField;
    TMonitoramentostatus: TWideStringField;
    TMonitoramentodatareg: TWideStringField;
    TMonitoramentoidusuario: TWideStringField;
    TMonitoramentodataalteracao: TWideStringField;
    TMonitoramentoidusuarioalteracao: TWideStringField;
    TMonitoramentodataMonitoramento: TDateField;
    TMonitoramentoidTalhao: TWideStringField;
    TMonitoramentohoraInicio: TSQLTimeStampField;
    TMonitoramentotipoAbertura: TIntegerField;
    TMonitoramentohoraFim: TSQLTimeStampField;
    TMonitoramentosyncaws: TWideStringField;
    TMonitoramentosyncfaz: TWideStringField;
    TMonitoramentoTalhao: TStringField;
    TMonitoramentotipoAberturaStr: TWideStringField;
    TMonitoramentoPontosid: TIntegerField;
    TMonitoramentoPontosstatus: TWideStringField;
    TMonitoramentoPontosdatareg: TWideStringField;
    TMonitoramentoPontosidMonitoramento: TWideStringField;
    TMonitoramentoPontosPonto: TStringField;
    TMonitoramentoPontosdataPonto: TDateField;
    TMonitoramentoPontoshora: TSQLTimeStampField;
    TMonitoramentoPontoslatitude: TStringField;
    TMonitoramentoPontoslongitude: TStringField;
    TMonitoramentoPontossyncaws: TWideStringField;
    TMonitoramentoPontossyncfaz: TWideStringField;
    TGetTalhoes: TFDQuery;
    TGetTalhoesid: TIntegerField;
    TGetTalhoesstatus: TWideStringField;
    TGetTalhoesnome: TStringField;
    TGetTalhoesareahe: TBCDField;
    TGetTalhoeslatitude: TFMTBCDField;
    TGetTalhoeslongitude: TFMTBCDField;
    TGetTalhoesidsetor: TWideStringField;
    TGetTalhoesqrcode: TStringField;
    TGetTalhoestipo: TStringField;
    TGetTalhoesobservacao: TStringField;
    TMonitoramentoPontosValores: TFDQuery;
    TMonitoramentoPontosValoresid: TIntegerField;
    TMonitoramentoPontosValoresstatus: TWideStringField;
    TMonitoramentoPontosValoresdatareg: TWideStringField;
    TMonitoramentoPontosValoresidPonto: TWideStringField;
    TMonitoramentoPontosValoresidPraga: TWideStringField;
    TMonitoramentoPontosValoreshora: TSQLTimeStampField;
    TMonitoramentoPontosValoressyncaws: TWideStringField;
    TMonitoramentoPontosValoressyncfaz: TWideStringField;
    TMonitoramentoPontosValorescontagem: TIntegerField;
    TMonitoramentoPontosValoresPraga: TStringField;
    TMonitPontosValoresInsert: TFDQuery;
    TMonitPontosValoresInsertid: TIntegerField;
    TMonitPontosValoresInsertstatus: TWideStringField;
    TMonitPontosValoresInsertdatareg: TWideStringField;
    TMonitPontosValoresInsertidPonto: TWideStringField;
    TMonitPontosValoresInsertidPraga: TWideStringField;
    TMonitPontosValoresInserthora: TSQLTimeStampField;
    TMonitPontosValoresInsertsyncaws: TWideStringField;
    TMonitPontosValoresInsertsyncfaz: TWideStringField;
    TMonitPontosValoresInsertcontagem: TIntegerField;
    TTalhoesqrcodesaida: TStringField;
    TGetTalhoesqrcodesaida: TStringField;
    TMonitoramentoTagAbertura: TStringField;
    TMonitoramentoTagFechamento: TStringField;
    TMonitPontosValoresInsertcaracteristica: TIntegerField;
    TMonitoramentoPontosValorescaracteristica: TIntegerField;
    TMonitoramentoPontosValoresCaracteristicaStr: TWideStringField;
    TDetReceituarioFlagSync: TIntegerField;
    TDetReceituarioqtdporhe: TBCDField;
    TDetReceituarioProduto_1: TStringField;
    TReceituariodatarecomendacao: TDateField;
    TReceituariodataprevaplicacao: TDateField;
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
    TMovLocalEstoqueLocalOrigem: TStringField;
    TMovLocalEstoqueLocalDestino: TStringField;
    TMovLocalEstoqueProduto: TWideStringField;
    TOperacaoSafraMaquinasromaneio: TWideStringField;
    TReceituarioobservacao: TWideStringField;
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
    TAbastecimentoidatividade: TIntegerField;
    TAbastecimentoAtividade: TStringField;
    TAbastecimentoobs: TStringField;
    Contratos: TFDQuery;
    Embarques: TFDQuery;
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
    Embarquesid: TFDAutoIncField;
    Embarquesstatus: TWideStringField;
    Embarquesdatareg: TWideStringField;
    Embarquesidusuario: TWideStringField;
    Embarquesdataalteracao: TWideStringField;
    Embarquesidusuarioalteracao: TWideStringField;
    Embarquesidcontrato: TWideStringField;
    Embarquesnumeronf: TWideStringField;
    Embarquesplaca: TStringField;
    Embarquesdataembarque: TDateField;
    Embarqueshorabarque: TTimeField;
    Embarquestara: TBCDField;
    Embarquesbruto: TBCDField;
    Embarquesliquido: TBCDField;
    Embarquesimp: TBCDField;
    Embarquesqueb: TBCDField;
    Embarquesverd: TBCDField;
    Embarquesavar: TBCDField;
    Embarquesumid: TBCDField;
    Embarquessyncaws: TWideStringField;
    Embarquessyncfaz: TWideStringField;
    ContratosGrid: TFDQuery;
    EmbarquesGrid: TFDQuery;
    EmbarquesGridid: TFDAutoIncField;
    EmbarquesGridstatus: TWideStringField;
    EmbarquesGriddatareg: TWideStringField;
    EmbarquesGrididusuario: TWideStringField;
    EmbarquesGriddataalteracao: TWideStringField;
    EmbarquesGrididusuarioalteracao: TWideStringField;
    EmbarquesGrididcontrato: TWideStringField;
    EmbarquesGridnumeronf: TWideStringField;
    EmbarquesGridplaca: TStringField;
    EmbarquesGriddataembarque: TDateField;
    EmbarquesGridhorabarque: TTimeField;
    EmbarquesGridtara: TBCDField;
    EmbarquesGridbruto: TBCDField;
    EmbarquesGridliquido: TBCDField;
    EmbarquesGridimp: TBCDField;
    EmbarquesGridqueb: TBCDField;
    EmbarquesGridverd: TBCDField;
    EmbarquesGridavar: TBCDField;
    EmbarquesGridumid: TBCDField;
    EmbarquesGridsyncaws: TWideStringField;
    EmbarquesGridsyncfaz: TWideStringField;
    EmbarquesGridnumerocontrato: TStringField;
    EmbarquesGridComprador: TStringField;
    ContratosGridid: TIntegerField;
    ContratosGridstatus: TWideStringField;
    ContratosGriddatareg: TWideStringField;
    ContratosGrididusuario: TWideStringField;
    ContratosGriddataalteracao: TWideStringField;
    ContratosGrididusuarioalteracao: TWideStringField;
    ContratosGrididcomprador: TWideStringField;
    ContratosGrididcultura: TWideStringField;
    ContratosGrididsafra: TWideStringField;
    ContratosGridnumerocontrato: TStringField;
    ContratosGridtotalcompravolume: TBCDField;
    ContratosGridtotalcomprasacos: TBCDField;
    ContratosGridtotalembarquevolume: TBCDField;
    ContratosGridtotalembarquesacos: TBCDField;
    ContratosGridsyncaws: TWideStringField;
    ContratosGridsyncfaz: TWideStringField;
    ContratosGridComprador: TStringField;
    TMaquinaultimarevisao: TDateField;
    TMaquinahorimetroultimarev: TBCDField;
    TMaquinahorimetroproximarevisao: TBCDField;
    TListaRevisao: TFDQuery;
    TMaquinahorimetro: TBCDField;
    TProdutoscodigofabricante: TStringField;
    TProdutosdefencivo: TIntegerField;
    TOperacaoExtra: TFDQuery;
    TOperacaoExtraid: TIntegerField;
    TOperacaoExtrastatus: TWideStringField;
    TOperacaoExtradatareg: TWideStringField;
    TOperacaoExtraidusuario: TWideStringField;
    TOperacaoExtradataalteracao: TWideStringField;
    TOperacaoExtraidusuarioalteracao: TWideStringField;
    TOperacaoExtraidsafra: TWideStringField;
    TOperacaoExtraidoperacao: TWideStringField;
    TOperacaoExtradatainicio: TDateField;
    TOperacaoExtradatafim: TDateField;
    TOperacaoExtraobservacao: TStringField;
    TOperacaoExtraidtalhao: TWideStringField;
    TOperacaoExtraidresponsavel: TWideStringField;
    TOperacaoExtraareaprevista: TBCDField;
    TOperacaoExtraarearealizada: TBCDField;
    TOperacaoExtraFlagSync: TIntegerField;
    TOperacaoExtradataSync: TDateTimeField;
    TOperacaoExtrafinalidade: TStringField;
    TOperacaoExtraidtipoaplicacaosolido: TStringField;
    TOperacaoExtraidcultura: TIntegerField;
    TOperacaoExtraidvariedade: TIntegerField;
    TOperacaoExtraidreceituario: TIntegerField;
    TOperacaoExtratipoterraaereo: TStringField;
    TOperacaoExtraidOpMaster: TIntegerField;
    TOperacaoExtraidcobertura: TIntegerField;
    TOperacaoExtraQualidadeCobertura: TStringField;
    TUsuariomanutencaomaquinas: TWideStringField;
    TUsuarioarmazem: TWideStringField;
    TUsuarioaplicacaosolido: TWideStringField;
    TUsuariopulverizacao: TWideStringField;
    TUsuarioplantio: TWideStringField;
    TUsuariocolheita: TWideStringField;
    TUsuariomonitoramentopragas: TWideStringField;
    TUsuariopluviometria: TWideStringField;
    TUsuarioabastecimentoexterno: TIntegerField;
    TListaRevisaoid: TIntegerField;
    TListaRevisaoidmaquina: TWideStringField;
    TListaRevisaoobservacao: TStringField;
    TListaRevisaodatainicio: TDateField;
    TListaRevisaodatafim: TDateField;
    TListaRevisaohorimetro: TBCDField;
    TListaRevisaohorimetroproxima: TBCDField;
    TListaRevisaoidplanorevisao: TIntegerField;
    TListaRevisaonome: TStringField;
    qryConfigTIPODB: TStringField;
    TAbastecimentoimg: TWideMemoField;
    TAbastecimentoimg2: TWideMemoField;
    TAbastecimentoimg3: TWideMemoField;
    TAbastecimentoimg4: TWideMemoField;
    TAbastecimentoimg5: TWideMemoField;
    TAbastecimentoexterno: TWideStringField;
    QryFotos: TFDQuery;
    QryFotosid: TIntegerField;
    QryFotosstatus: TWideStringField;
    QryFotosdatareg: TWideStringField;
    QryFotosidusuario: TWideStringField;
    QryFotosdataalteracao: TWideStringField;
    QryFotosidusuarioalteracao: TWideStringField;
    QryFotosidlocalestoque: TWideStringField;
    QryFotosidmaquina: TWideStringField;
    QryFotosidoperador: TWideStringField;
    QryFotosvolumelt: TBCDField;
    QryFotoscombustivel: TIntegerField;
    QryFotosdataabastecimento: TDateField;
    QryFotoshora: TTimeField;
    QryFotossyncaws: TWideStringField;
    QryFotossyncfaz: TWideStringField;
    QryFotoshorimetro: TBCDField;
    QryFotosidatividade: TIntegerField;
    QryFotosobs: TStringField;
    QryFotosimg: TWideMemoField;
    QryFotosimg2: TWideMemoField;
    QryFotosimg3: TWideMemoField;
    QryFotosimg4: TWideMemoField;
    QryFotosimg5: TWideMemoField;
    QryFotosexterno: TWideStringField;
    TDetTalhoesPulid: TFDAutoIncField;
    TDetTalhoesPulidTalhao: TIntegerField;
    TDetTalhoesPulidOperacao: TIntegerField;
    TDetTalhoesPulAreaPrevista: TBCDField;
    TDetTalhoesPulAreaRealizada: TBCDField;
    TDetTalhoesPulTalhao: TStringField;
    procedure FDConnBeforeConnect(Sender: TObject);
    procedure TUsuarioReconcileError(DataSet: TFDDataSet; E: EFDException;
      UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
    procedure TProdutosReconcileError(DataSet: TFDDataSet; E: EFDException;
      UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
    procedure TOperacaoSafraMaquinasReconcileError(DataSet: TFDDataSet;
      E: EFDException; UpdateKind: TFDDatSRowState;
      var Action: TFDDAptReconcileAction);
    procedure TOperacaoSafraProdutosReconcileError(DataSet: TFDDataSet;
      E: EFDException; UpdateKind: TFDDatSRowState;
      var Action: TFDDAptReconcileAction);
    procedure TOperacaoSafraOcorrenciaReconcileError(DataSet: TFDDataSet;
      E: EFDException; UpdateKind: TFDDatSRowState;
      var Action: TFDDAptReconcileAction);
    procedure TOperacaoSafraReconcileError(DataSet: TFDDataSet; E: EFDException;
      UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
    procedure TDetReceituarioReconcileError(DataSet: TFDDataSet;
      E: EFDException; UpdateKind: TFDDatSRowState;
      var Action: TFDDAptReconcileAction);
    procedure TPluviometriaReconcileError(DataSet: TFDDataSet; E: EFDException;
      UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
    procedure TAbastecimentoOutrosReconcileError(DataSet: TFDDataSet;
      E: EFDException; UpdateKind: TFDDatSRowState;
      var Action: TFDDAptReconcileAction);
    procedure TAbastecimentoReconcileError(DataSet: TFDDataSet; E: EFDException;
      UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
    procedure TMonitoramentoReconcileError(DataSet: TFDDataSet; E: EFDException;
      UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
    procedure TMonitoramentoPontosReconcileError(DataSet: TFDDataSet;
      E: EFDException; UpdateKind: TFDDatSRowState;
      var Action: TFDDAptReconcileAction);
    procedure TTalhoesReconcileError(DataSet: TFDDataSet; E: EFDException;
      UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
    procedure TGetTalhoesReconcileError(DataSet: TFDDataSet; E: EFDException;
      UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
    procedure TReceituarioReconcileError(DataSet: TFDDataSet; E: EFDException;
      UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
  private
    { Private declarations }
  public
    //SELECAO EM FORMULARIO
    vImg64Horimetro,vImg64Bomba,
    vIdTalhao,vNomeTalhao,vAreaTalhao,vIdProduto,vNomeProduto,
    vIdOperador,vNomeOperador,vIdMaquinaSel,vMarcaModelo,vIdTipoOcorrencia,
    vNomeTipoOocrrencia,vIdReceituario,vNomeReceituario,vStatusRec,
    vIdPluviometroSel,vNomePluvSel,vIdLocalEstoqueSel,vNomeLocalEstoque,
    vIdPraga,vNomePraga,vIdAtividade,vNomeAtividade,
    vIdContrato,vNumeroContrato,vComprador,vUltimoHorimetro,
    vIdRevSelect,vNomeItemRevSelect,vIdItem,vIdRevisaoIdItem,vIdItemRevSelect,
    vCodFabricanteProduto:string;
    //
    vIdUser,vIdSegmento,vAgronomo:string;

    vArmazem,vAbastecimento,vPluviometria,vPulverizacao,vRevisaoMaquinas:integer;
    function  LimpaResut(vResult: string): String;
    function  VerificaTabelaVazia(AnomeTable: string): Boolean;
    function  VerificaTalhaoExiste(idTalhao,idReceituario:string): Boolean;
    procedure ReadAccess;
    function  AutenticaUsuario(Usuario:string;Senha:string):Boolean;
    function  MD55(const texto: string): string;

    procedure SalvarAcesso(vUsuario,Senha:string);
    procedure AbrePluviometro(VFiltro:string);
    procedure AbreQryOperacao(vIdOperacao: string);
    procedure AbreOperacaoExta(vIdOperacao: string);
    procedure AbreMaquinaOperacao(vIdOperacao: string);
    procedure AbreProdutoOperacao(vIdOperacao: string);
    procedure AbreVazaoOperacao(vIdOperacao: string);
    procedure AbreOcorrenciaOperacao(vIdOperacao: string);
    procedure AtualizaIdOperacao(IdOperacao,NewId:string);
    procedure AtualizaIdMonitoramento(IdOperacao,NewId: string);
    procedure AtualizaIdMonitoramentoPonto(IdOperacao,NewId: string);
    procedure AbreDetTalhoesPulverizacao(vIdOp:string);
    procedure AbreTalhoesPluviometros(vIdPLu: string);
    function  VerificaIdOperacaoExiste(vId:string):Boolean;
    function  VerificaIdTalhaoReceituarioExiste(vId: string): Boolean;
    function  VerificaIdVazaoExiste(vId: string): Boolean;
    function  VerificaIdStandExiste(vId: string): Boolean;
    function  RetornaMaxIdAtividade: string;
    function  RetornaTalhoesPul(vIdPull:string): string;
    function  RetornaTalhoesPluviometro(vIdPlu: string): string;
    function  RetornaTalhoesReceiturario(vIdRec: string): string;
    function  RetornaReceiturarioAreaTotal(vIdRec: string): string;
    function  RetornaPrevisaoProduto(vIdProduto, vIdRec: string): string;
    procedure AtualizaAreaPrevPul(vIdPull:string);
    procedure AtualizaAreaRealizadaPul(vId,vAreaReal:string);
    procedure AbreGridReceituario(vId:string);
    procedure AbreDetTalhoesPul(vIdOpe:string);
    procedure AlteraFlagSyncOperaca(vId:string);
    procedure AbreOperacaoSafra(Filtro:string);
    function VerificaTalhaoJaAdicionado(idOp,idTalhao:string):Boolean;
    function VerificaMaquinaHorasEmAberto(idOp:string):Boolean;
    function VerificaMaquinasOperacao(vIdOpe:string):Boolean;
    function VerificaProdutosOperacao(vIdOpe:string):Boolean;
    function VerificaProdutosOperacaoZero(vIdOpe: string): Boolean;
    function RetornaHorasTotais(vIdOpe:string):string;
    procedure AbreDetReceituario(idReceituario:string);
    function  VerificaExiste(vCampo,vTabela,vValue:string):Boolean;
    procedure DeleteDetReceituario(id:string);
    procedure DeleteDetTalhaoReceituario(id: string);
    procedure DeleteReceituario(id: string);
    procedure DeleteReceituarios;
    function  RetornaAreaTotalDetReceituario(id: string):string;
    procedure DeleteOperacao(id,vIdRec: string);
    procedure HabilitaSync(id: string);
    procedure HabilitaSyncContrato(id: string);

    procedure CriaDetPuverisacaoReceituario(idReceituario,idOperacao:string);
    function  VerificaIdReceituarioExiste(vId: string): Boolean;
    function  RetornaIdReceituario: integer;
    function  RetornaIdReceituarioTalhao: integer;
    procedure AlteraStatusReceituario(vid,vStatus:string);
    function  RetornaIdTabela(Atabela,Acampo,Nome:string):string;

    function VerificaTalhaoJaAdicionadoReceituario(idReceituario,idTalhao:string):Boolean;
    function VerificaProdutoJaAdicionadoReceituario(idReceituario,idProduto:string):Boolean;
    procedure AbreStandPlatas(vFiltro:string);
    procedure DeletaTabelaGenerica(aTabela:string);
    procedure AbrirDetTalhaoReceiturario(vIdReceituario: string);
    procedure AbrirDetProdutosReceiturario(vIdReceituario: string);

    procedure AbrirPluviometriua(vFiltro: string);
    procedure DeletaPluviometria(vIdPluviometria:string);
    procedure DeletaAbastecimento(vId:string);
    procedure DeletaEmbarque(vId:string);
    procedure DeletaAbastecimentoOutros(vId:string);
    procedure DeletaTransferencia(vId:string);

    procedure AbrirAbastecimento(vFiltro:string);
    procedure AbrirAbastecimentoOutros(vIdAbasteciemnto,vFiltro:string);
    procedure AbrirTrasnferencia(vFiltro:string);
    procedure AbrirMonitoramento(vFiltro:string);
    procedure AbrirMonitoramentoPontos(vIdMonit:string);
    procedure AbrirPragasPonto(vIdPonto:string);
    function  RetornaNomePonto(vIdMonit:string):string;
    function  VerificaTagDiferente(idPonto,vTagFim:string):Boolean;
    function  VerificaTalhaoFechamento(idPonto,vIdTalhao:string):Boolean;
    function  VerificaRomaneioUsado(idMaquina,Romaneio:string):Boolean;
    function  RetornaAreaRealizada(idOperacao:string):string;
    function  RetornaObsReceituario(idRec:string):string;

    procedure AbreEmbarque(vFiltro:string);
    procedure AtualizaTotalEmbarqueContrato(idContrato:String);
    procedure AbreContratos(vFiltro:string);
    procedure GeraListaMaquina(vIdMaquina:string);
    function  RetornaHorimetroProximaRev(idMaquina:string):string;
    function  RetornaHorimetroAtual(idMaquina:string):string;
    procedure AlteraStatusOperacao(vid:string);
    function  VerificaIdServicoRevisaoExiste(vId:string):Boolean;
    function  VerificaRevisaoExiste(vId:string):Boolean;
    function  VerificaIdItemRevisaoExiste(vId:string):Boolean;
    function  RevisaoQtdeItensConfirmados(vIdRev:string):integer;
    procedure AbreProdutos(vFiltro:string);
    procedure AbreFotos(vID:string);
    procedure AbreMaquinas(vFiltro:string);
  end;

var
  dmDB: TdmDB;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses UPrincipal;

{$R *.dfm}


procedure TdmDB.AbrirAbastecimento(vFiltro: string);
begin
 with TAbastecimento,TAbastecimento.SQL do
 begin
   Clear;
   Add('select');
   Add('a.*,');
   Add('b.nome LocalEstoque,');
   Add('c.prefixo  Maquina,');
   Add('d.nome Operador,');
   Add('case');
   Add(' when a.combustivel =178 then ''DIESEL S-10''');
   Add(' when a.combustivel =179 then ''DIESEL S-500''');
   Add(' when a.combustivel =180 then ''GASOLINA''');
   Add(' when a.combustivel =3396 then ''QUEROSENE''');
   Add('end CombustivelStr,');
   Add('h.nome Atividade');
   Add('from abastecimento a');
   Add('join localestoque b on a.idlocalestoque=b.id');
   Add('join maquinaveiculo c on c.id=a.idmaquina');
   Add('join operadormaquinas d on d.id=a.idOperador');
   Add('join auxatividadeabastecimento h on h.id=a.idAtividade');
   Add(vFiltro);
   Open;
 end;
end;

procedure TdmDB.AbrirAbastecimentoOutros(vIdAbasteciemnto, vFiltro: string);
begin
 with TAbastecimentoOutros,TAbastecimentoOutros.SQL do
 begin
   Clear;
   Add('select a.*,b.nome Produto from abastecimentoOutros a');
   Add('join produtos b on b.id=a.idproduto');
   Add('where a.status=1 and a.idabastecimento='+vIdAbasteciemnto);
   Add(vFiltro);
   Open;
 end;
end;

procedure TdmDB.AbrirDetProdutosReceiturario(vIdReceituario: string);
begin
 with TDetReceituario,TDetReceituario.SQL do
 begin
   Clear;
   Add('select');
   Add('dr.*,');
   Add('pr.NOme Produto');
   Add('from detreceiturario dr');
   Add('join produtos pr on dr.idProduto=pr.id');
   Add('where dr.status=1 and idReceiturario='+vIdReceituario);
   Open;
 end;
end;

procedure TdmDB.AbrirDetTalhaoReceiturario(vIdReceituario: string);
begin
 with TGridReceituarioTalhao,TGridReceituarioTalhao.SQL do
 begin
   Clear;
   Add('select ');
   Add('d.*,');
   Add('p.nome Talhao');
   Add('from detreceiturarioTalhao d');
   Add('join Talhoes p on d.idTalhao=p.id');
   Add('where d.status=1 and d.idreceiturario='+vIdReceituario);
   Open;
 end;
end;


procedure TdmDB.AbrirMonitoramento(vFiltro: string);
begin
 FDConn.Commit;
 TMonitoramento.Filtered := false;
 with TMonitoramento,TMonitoramento.SQL do
 begin
   Clear;
   Add('select');
   Add('a.*,');
   Add('b.nome Talhao,');
   Add('case');
   Add('when tipoAbertura=0 then ''Manual''');
   Add('when tipoAbertura=1 then ''Codigo Barras''');
   Add('end tipoAberturaStr');
   Add('from monitoramentopragas a');
   Add('join talhoes b on a.idTalhao=b.id');
   Add('where 1=1');
   Add(vFiltro);
   Add('ORDER BY ID DESC');
   Open;
 end;
end;

procedure TdmDB.AbrirMonitoramentoPontos(vIdMonit: string);
begin
 with TMonitoramentoPontos,TMonitoramentoPontos.SQL do
 begin
   Clear;
   Add('select');
   Add(' a.*');
   Add('from monitoramentopragasPontos a');
   Add('where a.status=1 and a.idMonitoramento='+vIdMonit);
   Add('order by ponto');
   Open;
 end;
end;

procedure TdmDB.AbrirPluviometriua(vFiltro: string);
begin
 with TPluviometria,TPluviometria.SQL do
 begin
   Clear;
   Add('select a.*,b.nome Setor,c.nome Pluviometro from pluviometria a');
   Add('join Pluviometro c on c.id=a.idpluviometro');
   Add('join setor b on b.id=c.idsetor');
   Add('where a.status=1');
   Add(vFiltro);
   Open;
 end;
end;

procedure TdmDB.AbrirPragasPonto(vIdPonto: string);
begin
  with TMonitoramentoPontosValores,TMonitoramentoPontosValores.SQL do
  begin
    Clear;
    Add('select a.*,b.nome Praga,');
    Add('case');
    Add('  when caracteristica=0 then ''Postura''');
    Add('  when caracteristica=1 then ''Pequena''');
    Add('  when caracteristica=2 then ''Média''');
    Add('  when caracteristica=3 then ''Grande''');
    Add('  when caracteristica=4 then ''Ninfas''');
    Add('  when caracteristica=5 then ''Rajado''');
    Add('  when caracteristica=6 then ''Adultos''');
    Add('  when caracteristica=7 then ''Branco''');
    Add('end CaracteristicaStr');
    Add('from monitoramentopragasPontosValores a');
    Add('join auxPragas b on a.idPraga=b.id');
    Add('where a.idPonto='+vIdPonto);
    Open;
  end;
end;

procedure TdmDB.AbrirTrasnferencia(vFiltro: string);
begin
 with TMovLocalEstoque,TMovLocalEstoque.SQL do
 begin
   Clear;
   Add('select a.*,o.nome LocalOrigem,d.nome LocalDestino,');
   Add('case');
   Add(' when a.idproduto =178 then ''DIESEL S-10''');
   Add(' when a.idproduto =179 then ''DIESEL S-500''');
   Add(' when a.idproduto =180 then ''GASOLINA''');
   Add('end Produto');
   Add('from tranferenciaLocalestoque A');
   Add('join localestoque o on o.id=a.idlocalestoqueorigem');
   Add('join localestoque d on d.id=a.idlocalestoquedetino');
   Add('where a.status=1');
   Add(vFiltro);
   Add('order by a.datamov desc');
   Open;
 end;
end;

function TdmDB.RetornaIdReceituario: integer;
var
 vId:integer;
begin
 repeat
  vId:=Random(2020)*100;
 until (VerificaIdOperacaoExiste(intToStr(vId)));
 Result := vId;
end;

function TdmDB.RetornaIdReceituarioTalhao: integer;
var
 vId:integer;
begin
 repeat
  vId:=Random(2020)*100;
 until (VerificaIdOperacaoExiste(intToStr(vId)));
 Result := vId;
end;

function TdmDB.RetornaIdTabela(Atabela, Acampo, Nome: string): string;
begin
 with qryAux,qryAux.SQL do
  begin
    Clear;
    Add('select * from '+Atabela);
    Add('where '+Acampo+'='+Nome.QuotedString);
    Open;
    Result := FieldByName('id').AsString;
  end;
end;

procedure TdmDB.ReadAccess;
begin
  qryConfig.Close;
  qryConfig.Open;
  qryControAcces.Close;
  qryControAcces.Open;
  if not qryControAcces.IsEmpty then
  begin
   frmPrincipal.edtUsuario.Text := qryControAccesUsuario.AsString;
   if qryConfigSalvarLogin.AsInteger=1 then
    frmPrincipal.edtSenha.Text   := qryControAccesSenha.AsString;
  end;
end;

function TdmDB.RetornaAreaRealizada(idOperacao: string): string;
begin
 with qryAux,qryAux.SQL do
  begin
    Clear;
    Add('select sum(AreaRealizada)AreaRealizada from DetTalhoesPulverizacao');
    Add('where idOperacao='+idOperacao);
    Open;
    Result := FieldByName('AreaRealizada').AsString;
  end;
end;

function TdmDB.RetornaAreaTotalDetReceituario(id: string): string;
begin
  with qryAux,qryAux.SQL do
  begin
    Clear;
    Add('select sum(areahe) AreaTotal from detreceiturariotalhao');
    Add('where idreceiturario='+id);
    Add('and status=1');
    Open;
    Result := FieldByName('AreaTotal').AsString;
  end;
end;

function TdmDB.RetornaHorasTotais(vIdOpe: string): string;
begin
  with qryAux,qryAux.SQL do
  begin
    Clear;
    Add('select sum(horaTrabalhada) horaTrabalhada');
    Add('from detoperacaosafratalhaomaquinasoperadores a');
    Add('where a.idoperacaotalhao='+vIdOpe);
    Open;
    Result := FieldByName('horaTrabalhada').AsString;
  end;
end;

function TdmDB.RetornaHorimetroAtual(idMaquina: string): string;
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('select horimetro from maquinaveiculo');
   Add('where id='+idMaquina);
   Open;
   Result := FieldByName('horimetro').AsString;
 end;
end;

function TdmDB.RetornaHorimetroProximaRev(idMaquina: string): string;
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('select a.horimetroproxima from revisaomaquinahist a');
   Add('join maquinaveiculo b on a.idmaquina=b.id');
   Add('where idMaquina='+idMaquina+' and a.horimetroproxima>b.horimetro');
   Add('order by a.horimetroproxima');
   Add('limit 1');
   Open;
   Result := FieldByName('horimetroproxima').AsString;
 end;
end;

function TdmDB.RetornaMaxIdAtividade: string;
begin
  with qryAux,qryAux.SQL do
  begin
    Clear;
    Add('select id maxid from operacaosafratalhao');
    Add('ORDER BY DATAREG DESC limit 1');
    Open;
    Result := FieldByName('maxid').AsString;
  end;
end;

function TdmDB.RetornaNomePonto(vIdMonit: string): string;
begin
 FDConn.Commit;
 with qryAux,qryAux.SQL do
 begin
  Clear;
  Add('select count(distinct ponto)+1 qtd from monitoramentopragasPontos');
  Add('where status=1 and idMonitoramento='+vIdMonit);
  Open;
  Result :='Ponto '+FieldByName('qtd').AsString;
 end;
end;

function TdmDB.RetornaObsReceituario(idRec: string): string;
begin
 FDConn.Commit;
 with qryAux,qryAux.SQL do
 begin
  Clear;
  Add('select observacao from receiturario');
  Add('where id='+idRec);
  Open;
  Result :=FieldByName('observacao').AsString;
 end;
end;

function TdmDB.RetornaPrevisaoProduto(vIdProduto, vIdRec: string): string;
var
 vArea,vIndicacao,vResult:double;
 vQtdStr:string;
begin
  with qryAux,qryAux.SQL do
  begin
    Clear;
    Add('SELECT SUM(areahe)areahe  FROM detreceiturariotalhao');
    Add('WHERE status=1  AND idreceiturario='+vIdRec);
    Open;
    if not IsEmpty then
     vArea := FieldByName('areahe').AsFloat
    else
     vArea := 0;

    Clear;
    Add('SELECT cast(replace(qtdporhe,'','',''.'') as decimal(15,3)) qtdporhe FROM detreceiturario');
    Add('WHERE STATUS=1 AND idreceiturario='+vIdRec+' AND idproduto='+vIdProduto);
    Open;
    vQtdStr     := FieldByName('qtdporhe').AsString;
    if not IsEmpty then
     vIndicacao := strToFloat(FieldByName('qtdporhe').AsString)
    else
     vIndicacao := 0;
  end;
  vResult := vIndicacao*vArea;


  Result  := FormatFloat('####,##0.00',vResult)
end;

function TdmDB.RetornaTalhoesPul(vIdPull: string): string;
var
 Talhoes:string;
begin
  Talhoes :='';
  AbreDetTalhoesPulverizacao(vIdPull);
  TDetTalhoesPul.First;
  while not TDetTalhoesPul.Eof do
  begin
    Talhoes := Talhoes+TDetTalhoesPulTalhao.AsString+'|';
    TDetTalhoesPul.Next;
  end;
  Result := Talhoes;
end;

function TdmDB.RetornaTalhoesPluviometro(vIdPlu: string): string;
var
 Talhoes:string;
begin
  Talhoes :='';
  dmDB.AbreTalhoesPluviometros(vIdPlu);
  TPluviometroTalhoes.First;
  while not TPluviometroTalhoes.Eof do
  begin
    Talhoes := Talhoes+TPluviometroTalhoesTalhao.AsString+'|';
    TPluviometroTalhoes.Next;
  end;
  Result := Talhoes;
end;

function TdmDB.RetornaTalhoesReceiturario(vIdRec: string): string;
var
 Talhoes:string;
begin
  Talhoes :='';
  AbrirDetTalhaoReceiturario(vIdRec);
  while not TGridReceituarioTalhao.Eof do
  begin
    Talhoes := Talhoes+TGridReceituarioTalhaoTalhao.AsString+'|';
    TGridReceituarioTalhao.Next;
  end;
  Result := Talhoes;
end;

function TdmDB.RevisaoQtdeItensConfirmados(vIdRev: string): integer;
var
 qryAux : TFDQuery;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FDConn;
 with qryAux,qryAux.sql do
 begin
   Clear;
   Add('select count(*)qtd from revisaomaquinaitens a');
   Add('where a.idrevisao='+vIdRev);
   Add('and a.status=2');
   Open;
   Result := FieldByName('qtd').AsInteger;
 end;
 qryAux.free;
end;

function TdmDB.RetornaReceiturarioAreaTotal(vIdRec: string): string;
var
 AreaTotal:Double;
begin
  AreaTotal :=0;
  AbrirDetTalhaoReceiturario(vIdRec);
  TGridReceituarioTalhao.First;
  while not TGridReceituarioTalhao.Eof do
  begin
    AreaTotal := AreaTotal+TGridReceituarioTalhaoareahe.AsFloat;
    TGridReceituarioTalhao.Next;
  end;
  Result := FormatFloat('####,##0.00',AreaTotal);
end;

procedure TdmDB.SalvarAcesso(vUsuario, Senha: string);
begin
  qryControAcces.Close;
  qryControAcces.Open;
  if not qryControAcces.IsEmpty then
  begin
   qryControAcces.Delete;
   qryControAcces.ApplyUpdates(-1);
  end;
  try
   qryControAcces.Close;
   qryControAcces.Open;
   qryControAcces.Insert;
   qryControAccesUsuario.AsString := vUsuario;
   qryControAccesSenha.AsString   := Senha;
   qryControAcces.ApplyUpdates(-1);
  except
   on E : Exception do
      ShowMessage('Erro ao inserir Controle de Acesso : '+E.Message);
  end;
end;

procedure TdmDB.TAbastecimentoOutrosReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
 TThread.Synchronize(nil, procedure
 begin
  ShowMessage(e.Message);
 end);
end;

procedure TdmDB.TAbastecimentoReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
  TThread.Synchronize(nil, procedure
 begin
  ShowMessage(e.Message);
 end);
end;

procedure TdmDB.TDetReceituarioReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
 TThread.Synchronize(nil, procedure
 begin
  ShowMessage(e.Message);
 end);
end;

procedure TdmDB.TGetTalhoesReconcileError(DataSet: TFDDataSet; E: EFDException;
  UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
begin
   TThread.Synchronize(nil, procedure
 begin
  ShowMessage(e.Message);
 end);
end;

procedure TdmDB.TMonitoramentoPontosReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
 TThread.Synchronize(nil, procedure
 begin
  ShowMessage(e.Message);
 end);
end;

procedure TdmDB.TMonitoramentoReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
 TThread.Synchronize(nil, procedure
 begin
  ShowMessage(e.Message);
 end);
end;

procedure TdmDB.TOperacaoSafraMaquinasReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
 TThread.Synchronize(nil, procedure
 begin
  ShowMessage(e.Message);
 end);
end;

procedure TdmDB.TOperacaoSafraOcorrenciaReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
 TThread.Synchronize(nil, procedure
 begin
  ShowMessage(e.Message);
 end);ShowMessage(e.Message);
end;

procedure TdmDB.TOperacaoSafraProdutosReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
 TThread.Synchronize(nil, procedure
 begin
  ShowMessage(e.Message);
 end);
end;

procedure TdmDB.TOperacaoSafraReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
 TThread.Synchronize(nil, procedure
 begin
  ShowMessage(e.Message);
 end);
end;

procedure TdmDB.TPluviometriaReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
 ShowMessage(e.Message);
end;

procedure TdmDB.TProdutosReconcileError(DataSet: TFDDataSet; E: EFDException;
  UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
begin
 TThread.Synchronize(nil, procedure
 begin
  ShowMessage(e.Message);
 end);
end;

procedure TdmDB.TReceituarioReconcileError(DataSet: TFDDataSet; E: EFDException;
  UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
begin
 ShowMessage(e.Message);
end;

procedure TdmDB.TTalhoesReconcileError(DataSet: TFDDataSet; E: EFDException;
  UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
begin
  TThread.Synchronize(nil, procedure
 begin
  ShowMessage(e.Message);
 end);
end;

procedure TdmDB.TUsuarioReconcileError(DataSet: TFDDataSet; E: EFDException;
  UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
begin
  TThread.Synchronize(nil, procedure
 begin
  ShowMessage(e.Message);
 end);
end;

function TdmDB.MD55(const texto: string): string;
var
  idmd5 : TIdHashMessageDigest5;
begin
  idmd5 := TIdHashMessageDigest5.Create;
  try
    result := idmd5.HashStringAsHex(texto);
  finally
    idmd5.Free;
  end;
end;



procedure TdmDB.AbreContratos(vFiltro: string);
begin
 with ContratosGrid,ContratosGrid.SQL do
 begin
   Clear;
   Add('select');
   Add('a.*,');
   Add('b.nome Comprador');
   Add('from contratos a');
   Add('join comprador b on idcomprador=b.id');
   Add('where status=2');
   Add(vFiltro);
   Open;
 end;
end;

procedure TdmDB.AbreDetReceituario(idReceituario: string);
var
 i:integer;
begin
 TDetReceituario.Filtered := false;
 with TDetReceituario,TDetReceituario.SQL do
 begin
   Clear;
   Add('select');
   Add('DISTINCT ');
   Add('dr.*,');
   Add('pr.nome Produto');
   Add('from detreceiturario dr');
   Add('join produtos pr on pr.id=dr.idproduto');
   Add('where dr.status>-1 and idReceiturario='+idReceituario);
   Add('order by id desc');
   Open;
   i := TDetReceituario.RecordCount;
 end;
end;

procedure TdmDB.AbreDetTalhoesPul(vIdOpe: string);
begin
  with qryTalhoesPul,qryTalhoesPul.SQL do
 begin
   Clear;
   Add('select * from DetTalhoesPulverizacao');
   Add('where idOperacao='+vIdOpe);
   Open;
 end;
end;

procedure TdmDB.AbreDetTalhoesPulverizacao(vIdOp: string);
begin
 with TDetTalhoesPul,TDetTalhoesPul.SQL do
 begin
   Clear;
   Add('SELECT D.*,T.nome Talhao FROM DetTalhoesPulverizacao D');
   Add('JOIN talhoes T ON T.ID=D.idTalhao');
   Add('where idOperacao='+vIdOp);
   Open;
 end;
end;

procedure TdmDB.AbreEmbarque(vFiltro: string);
begin
 with EmbarquesGrid,EmbarquesGrid.SQL do
 begin
   Clear;
   Add('select a.*,b.numerocontrato,c.nome Comprador from embarque a');
   Add('left join contratos b on a.idContrato=b.id');
   Add('left join comprador c on c.id=b.idcomprador');
   Add('where a.status=1');
   if vFiltro.Length>0 then
    Add(vFiltro);
   Open;
 end;
end;

procedure TdmDB.AbreFotos(vID: string);
begin
 with QryFotos,QryFotos.SQL do
 begin
   Clear;
   Add('select * from abastecimento a');
   Add('where id='+vID);
   Open;
   vImg64Horimetro := QryFotosimg.AsString;
   vImg64Bomba     := QryFotosimg2.AsString;
 end;
end;

procedure TdmDB.AbreTalhoesPluviometros(vIdPLu: string);
begin
 with TPluviometroTalhoes,TPluviometroTalhoes.SQL do
 begin
   Clear;
   Add('select a.*,b.nome Talhao from PluviometroTalhoes a');
   Add('join talhoes b on a.idTalhao=b.id');
   Add('where a.status=1 and a.idPLuviometro='+vIdPLu);
   Open;
 end;
end;

procedure TdmDB.AbreGridReceituario(vId: string);
begin
 with qryGridReceituario,qryGridReceituario.SQL do
 begin
   Clear;
   Add('select');
   Add('th.nome talhao,');
   Add('dr.produto,');
   Add('TH.areahe,');
   Add('dr.qtdporhe,');
   Add('cast((dr.qtdporhe*dr.qtdporhe)as varchar(1000)) qtdTotal,');
   Add('dr.finalidade,');
   Add('rc.Nome');
   Add('from operacaosafratalhao op');
   Add('join receiturario rc on rc.id=op.idreceituario');
   Add('join detreceiturario dr on dr.idreceiturario=rc.id');
   Add('join talhoes th on th.id=dr.idTalhao');
   Add('and op.finalidade=dr.finalidade');
   Add('where op.id='+vId);
   Open;
 end;
end;

procedure TdmDB.AbreMaquinaOperacao(vIdOperacao: string);
begin
 TOperacaoSafraMaquinas.Filtered := false;
 with TOperacaoSafraMaquinas,TOperacaoSafraMaquinas.SQL do
 begin
   Clear;
   Add('select a.*,b.modelo||''-''||b.prefixo maquina,');
   Add('(horafim-horainicio)-horaparada horaTotal');
   Add('from detoperacaosafratalhaomaquinasoperadores a');
   Add('join maquinaveiculo b on a.idmaquina=b.id');
   Add('where a.status=1 and idoperacaotalhao='+vIdOperacao);
   Add('Order by a.id desc');
   Open;
 end;
end;

procedure TdmDB.AbreMaquinas(vFiltro: string);
begin
 with TMaquina,TMaquina.SQL do
 begin
   Clear;
   Add('select * from maquinaveiculo');
   Add('where 1=1');
   Add(vFiltro);
   Open;
 end;
end;

procedure TdmDB.AbreOcorrenciaOperacao(vIdOperacao: string);
begin
 with TOperacaoSafraOcorrencia,TOperacaoSafraOcorrencia.SQL do
 begin
   Clear;
   Add('select a.*,b.nome TipoOcorrencia from DetOperacaoSafraTalhaoOcorrencia a');
   Add('join auxtipoocorrencia b on a.idtipoocorrencia=b.id');
   Add('where a.status=1 and idoperacaotalhao='+vIdOperacao);
   Add('Order by a.id desc');
   Open;
 end;
end;

procedure TdmDB.AbreOperacaoExta(vIdOperacao: string);
begin
 with TOperacaoExtra,TOperacaoExtra.SQL do
 begin
   Clear;
   Add('select * from operacaosafratalhao');
   Add('where id='+vIdOperacao);
   Open;
 end;
end;

procedure TdmDB.AbreOperacaoSafra(Filtro:string);
begin
  TOperacaoSafra.Filtered := false;
  with TOperacaoSafra,TOperacaoSafra.SQL do
  begin
    Clear;
    Add('select o.*,t.nome Talhao,op.nome Operacao,s.nome setor,');
    Add('x.nome tipoaplicacaosolido,ac.nome Cultura,rc.nome Receituario,co.Nome Cobertura,');
    Add('acl.nome Variedade');
    Add('from operacaosafratalhao o');
    Add('left join talhoes t on t.id=o.idtalhao');
    Add('left join setor s on s.id=t.idsetor');
    Add('left join auxtipooperacaosolido x on x.id=o.idtipoaplicacaosolido');
    Add('left join auxculturas ac on ac.id=o.idcultura');
    Add('left join auxcultivares acl on acl.id=o.idvariedade');
    Add('left join receiturario rc on rc.id=o.idreceituario');
    Add('left join Auxcobertura co on co.id=o.idCobertura');
    Add('join operacoes op on op.id=o.idoperacao');
    Add('where o.Status in(1,2)');
    Add(Filtro);
    Add('order by o.datareg desc');
    Open;
  end;
  TOperacaoSafra.First;
end;

procedure TdmDB.AbrePluviometro(VFiltro: string);
begin
 TPluviometro.Filtered := false;
 with TPluviometro,TPluviometro.SQL do
 begin
   Clear;
   Add('select a.*,b.nome setor from Pluviometro a');
   Add('join setor b on a.idSetor=b.id');
   Add('WHERE A.STATUS=1');
   Add(VFiltro);
   Open;
   TPluviometro.First;
 end;
end;

procedure TdmDB.AbreProdutoOperacao(vIdOperacao: string);
begin
 TOperacaoSafraProdutos.Filtered := false;
 with TOperacaoSafraProdutos,TOperacaoSafraProdutos.SQL do
 begin
   Clear;
   Add('select a.*,b.nome Produto from DetOperacaoSafraTalhaoProdutos a');
   Add('left join produtos b on b.id=a.idproduto');
   Add('where a.status=1');
   Add('and idoperacaotalhao='+vIdOperacao);
   Add('Order by a.id desc');
   Open;
   TOperacaoSafraProdutos.First;
 end;
end;

procedure TdmDB.AbreProdutos(vFiltro: string);
begin
 with TProdutos,TProdutos.SQL do
 begin
   Clear;
   Add('select * from produtos');
   Add('where status=1');
   Add(vFiltro);
   Add('order by nome');
   Open;
 end;
end;

procedure TdmDB.AbreVazaoOperacao(vIdOperacao: string);
begin
 TVazaoOperacao.Filtered := false;
 with TVazaoOperacao,TVazaoOperacao.SQL do
 begin
   Clear;
   Add('select * from DetVazaoOperacao');
   Add('where status=1');
   Add('and idoperacaotalhao='+vIdOperacao);
   Open;
   TVazaoOperacao.First;
 end;
end;

procedure TdmDB.AbreQryOperacao(vIdOperacao: string);
begin
 with qryOpSafra,qryOpSafra.SQL do
 begin
   Clear;
   Add('select o.*,t.nome Talhao,op.nome Operacao,s.nome setor from operacaosafratalhao o');
   Add('left join talhoes t on t.id=o.idtalhao');
   Add('left join setor s on s.id=t.idsetor');
   Add('join operacoes op on op.id=o.idoperacao');
   Add('where o.id='+vIdOperacao);
   Add('Order by o.id desc');
   Open;
 end;
end;

procedure TdmDB.AbreStandPlatas(vFiltro:string);
begin
 TStandPlantas.Filtered:= false;
 with TStandPlantas,TStandPlantas.SQL do
 begin
   Clear;
   Add('select a.*,b.nome Cultura,c.nome Variedade,t.nome Talhao from StandSementes a');
   Add('join auxculturas b on b.id=a.idCultura');
   Add('join auxcultivares c on c.id=a.IdVariedade');
   Add('join talhoes t on t.id=a.idtalhao');
   Add('where a.status=1');
   Add(vFiltro);
   Open;
 end;
end;

procedure TdmDB.AlteraFlagSyncOperaca(vId: string);
var
 qryAux : TFDQuery;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FDConn;
 with qryAux,qryAux.sql do
 begin
  Clear;
  Add('UPDATE operacaosafratalhao SET FlagSync=1, dataSync=current_timestamp');
  Add('where Id='+vId);
  ExecSQL;

  Clear;
  Add('UPDATE operacaosafratalhao SET FlagSync=1, dataSync=current_timestamp');
  Add('where id=(select idOpMaster from operacaosafratalhao where id='+vId+')');
  ExecSQL;

 end;
 qryAux.Free;
end;

procedure TdmDB.AlteraStatusOperacao(vid: string);
var
 qryAux : TFDQuery;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FDConn;
 with qryAux,qryAux.sql do
 begin
  Clear;
  Add('UPDATE operacaosafratalhao SET status=2');
  Add('where Id ='+vid);
  ExecSQL;
 end;
 qryAux.Free;
end;

procedure TdmDB.AlteraStatusReceituario(vid, vStatus: string);
var
 qryAux : TFDQuery;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FDConn;
 with qryAux,qryAux.sql do
 begin
  Clear;
  Add('UPDATE receiturario SET status='+vStatus);
  Add('where Id in('+vid+')');
  ExecSQL;
 end;
 qryAux.Free;
end;

procedure TdmDB.AtualizaAreaPrevPul(vIdPull:string);
var
 qryAux : TFDQuery;
 vAreaPrev,vAreaReal:string;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FDConn;
 with qryAux,qryAux.sql do
 begin

  Clear;
  Add('select sum(AreaRealizada)AreaRealizada,');
  Add('sum(AreaPrevista)AreaPrevista');
  Add('from DetTalhoesPulverizacao');
  Add('where idOperacao='+vIdPull);
  Open;
  vAreaPrev := FieldByName('AreaPrevista').AsString;
  vAreaReal := FieldByName('AreaRealizada').AsString;

  Clear;
  Add('UPDATE operacaosafratalhao SET');
  Add('areaprevista='+StringReplace(vAreaPrev,',','.',[rfReplaceAll])+',');
  Add('arearealizada='+StringReplace(vAreaReal,',','.',[rfReplaceAll]));
  Add('where Id='+vIdPull);
  ExecSQL;
 end;
 qryAux.Free;
end;

procedure TdmDB.AtualizaAreaRealizadaPul(vId, vAreaReal: string);
var
 qryAux : TFDQuery;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FDConn;
 with qryAux,qryAux.sql do
 begin
  Clear;
  Add('UPDATE DetTalhoesPulverizacao SET arearealizada='+vAreaReal);
  Add('where Id='+vId);
  ExecSQL;
 end;
 qryAux.Free;
end;

procedure TdmDB.AtualizaIdOperacao(IdOperacao,NewId: string);
var
 qryAux : TFDQuery;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FDConn;
 with qryAux,qryAux.sql do
 begin
  Clear;
  Add('UPDATE operacaosafratalhao SET ID='+NewId);
  Add('where Id='+IdOperacao);
  ExecSQL;

  Clear;
  Add('UPDATE detoperacaosafratalhaoprodutos SET idoperacaotalhao='+NewId);
  Add('where idoperacaotalhao='+IdOperacao);
  ExecSQL;

  Clear;
  Add('UPDATE detoperacaosafratalhaoocorrencia SET idoperacaotalhao='+NewId);
  Add('where idoperacaotalhao='+IdOperacao);
  ExecSQL;

  Clear;
  Add('UPDATE detoperacaosafratalhaomaquinasoperadores SET idoperacaotalhao='+NewId);
  Add('where idoperacaotalhao='+IdOperacao);
  ExecSQL;

  Clear;
  Add('UPDATE DetVazaoOperacao SET idoperacaotalhao='+NewId);
  Add('where idoperacaotalhao='+IdOperacao);
  ExecSQL;

  Clear;
  Add('UPDATE DetTalhoesPulverizacao SET IDoperacao='+NewId);
  Add('where IDoperacao='+IdOperacao);
  ExecSQL;

 end;
 qryAux.Free;
end;


procedure TdmDB.AtualizaTotalEmbarqueContrato(idContrato: String);
var
 qryAux : TFDQuery;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FDConn;
 with qryAux,qryAux.sql do
 begin
  Clear;
  Add('UPDATE contratos  SET totalembarquevolume=totalembarquevolume+(SELECT coalesce(sum(a.liquido),0)');
  Add('FROM embarque a');
  Add('where status=1 and  idcontrato='+idContrato+' and syncFaz=0)');
  Add('WHERE ID='+idContrato);
  ExecSQL;
  FDConn.Commit;
 end;
 qryAux.Free;
end;

procedure TdmDB.AtualizaIdMonitoramento(IdOperacao,NewId: string);
var
 qryAux : TFDQuery;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FDConn;
 with qryAux,qryAux.sql do
 begin
  Clear;
  Add('UPDATE monitoramentopragas SET ID='+NewId);
  Add('where Id='+IdOperacao);
  ExecSQL;
  try
   except
    on E: Exception do
     frmPrincipal.log.Lines.Add('Erro:' + E.Message );
  end;


  Clear;
  Add('UPDATE monitoramentopragasPontos SET idmonitoramento='+NewId);
  Add('where idmonitoramento='+IdOperacao);
  ExecSQL;
  try
   except
    on E: Exception do
     frmPrincipal.log.Lines.Add('Erro:' + E.Message );
  end;

 end;
 qryAux.Free;
end;

procedure TdmDB.AtualizaIdMonitoramentoPonto(IdOperacao, NewId: string);
var
 qryAux : TFDQuery;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FDConn;
 with qryAux,qryAux.sql do
 begin
  Clear;
  Add('UPDATE monitoramentopragaspontos SET ID='+NewId);
  Add('where Id='+IdOperacao);
  try
   ExecSQL;
  except
   on E: Exception do
     ShowMessage('Erro:' + E.Message );
  end;

  Clear;
  Add('UPDATE monitoramentopragaspontosvalores SET idponto='+NewId);
  Add('where idponto='+IdOperacao);
  ExecSQL;
  try
   ExecSQL;
  except
   on E: Exception do
     ShowMessage('Erro:' + E.Message );
  end;
 end;
 qryAux.Free;
end;

function TdmDB.AutenticaUsuario(Usuario, Senha: string): Boolean;
var
 qryAux : TFDQuery;
begin
 if Senha.Length<20 then
  Senha  := MD55(Senha);
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FDConn;
 with qryAux,qryAux.sql do
 begin
  Clear;
  Add('SELECT * FROM usuario');
  Add('WHERE usuario='+Usuario.QuotedString);
  Add('AND senha='+Senha.QuotedString);
  Open;
  if not qryAux.IsEmpty then
   begin
    vIdUser          := qryAux.FieldByName('id').AsString;
    vAgronomo        := qryAux.FieldByName('agronomo').AsString;
    vAbastecimento   := qryAux.FieldByName('abastecimento').AsInteger;
    vRevisaoMaquinas := qryAux.FieldByName('manutencaomaquinas').AsInteger;
    vPulverizacao     := qryAux.FieldByName('pulverizacao').AsInteger;
    if frmPrincipal.vTipoDb='AGRICULTURA' then
    begin
      //MAQUINAS E ABASTECIMENTO
      frmPrincipal.TreeMaquinas.Visible :=
       (qryAux.FieldByName('manutencaomaquinas').AsInteger=1) or
        (qryAux.FieldByName('abastecimento').AsInteger=1);
      //so manutencao
      frmPrincipal.TreeManutencao.Visible :=
       (qryAux.FieldByName('manutencaomaquinas').AsInteger=1);
      //So abastecimento
      frmPrincipal.TreeAbastecimento.Visible :=
       (qryAux.FieldByName('abastecimento').AsInteger=1);
      //monitoramento
      frmPrincipal.TreeMonitoramento.Visible :=
       (qryAux.FieldByName('monitoramentopragas').AsInteger=1);
      //pluviometria
      frmPrincipal.Treepluviometria.Visible :=
       (qryAux.FieldByName('pluviometria').AsInteger=1);
      //pulverizacao
      frmPrincipal.TreeReceituario.Visible :=
       (qryAux.FieldByName('pulverizacao').AsInteger=1);
      //Armazem
      frmPrincipal.TreeArmazem.Visible    :=
       (qryAux.FieldByName('Armazem').AsInteger=1);

      vArmazem       := qryAux.FieldByName('Armazem').AsInteger;
      vAbastecimento := qryAux.FieldByName('abastecimento').AsInteger;
      vPluviometria  := qryAux.FieldByName('pluviometria').AsInteger;
    end;
    SalvarAcesso(Usuario,Senha);
    Result := true
   end
   else
    Result := false;
   end;
   qryAux.Free;
end;

procedure TdmDB.CriaDetPuverisacaoReceituario(idReceituario,
  idOperacao: string);
var
 qryAux,qryAuxInsert : TFDQuery;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FDConn;

 qryAuxInsert := TFDQuery.Create(nil);
 qryAuxInsert.Connection := FDConn;
 with qryAux,qryAux.sql do
 begin
   Clear;
   Add('select idtalhao,areahe from  detreceiturariotalhao d');
   Add('where status=1 and d.idreceiturario='+idReceituario);
   Open;
   while not qryAux.eof do
   begin
     with qryAuxInsert,qryAuxInsert.SQL do
     begin
      Clear;
      Add('insert into DetTalhoesPulverizacao');
      Add('(idTalhao,idOperacao,AreaPrevista,AreaRealizada)values(');
      Add(qryAux.FieldByName('idtalhao').AsString+',');
      Add(idOperacao+',');
      Add(StringReplace(qryAux.FieldByName('areahe').AsString,',','.',[rfReplaceAll])+',');
      Add(StringReplace(qryAux.FieldByName('areahe').AsString,',','.',[rfReplaceAll])+')');
      qryAuxInsert.ExecSQL;
      qryAux.Next;
   end;
 end;
 with qryAux,qryAux.sql do
 begin
   Clear;
   Add('select idproduto  from detreceiturario dr');
   Add('where DR.status=1 and  idreceiturario='+idReceituario);
   Add('group by idproduto');
   Open;
   while not qryAux.eof do
   begin
    TOperacaoSafraProdutos.Close;
    TOperacaoSafraProdutos.Open;
    TOperacaoSafraProdutos.Insert;
    TOperacaoSafraProdutosidproduto.AsString        := qryAux.FieldByName('idproduto').AsString;
    TOperacaoSafraProdutosqtdeutilidado.AsString    := '0';
    TOperacaoSafraProdutosidoperacaotalhao.AsString := idOperacao;
    TOperacaoSafraProdutosobservacao.AsString       := '';
    TOperacaoSafraProdutosdata.AsDateTime           := Date;
    TOperacaoSafraProdutosidusuario.AsString        := vIdUser;
    TOperacaoSafraProdutos.ApplyUpdates(-1);
    qryAux.Next;
   end;
 end;
 qryAux.Free;
 end;
end;

procedure TdmDB.DeletaPluviometria(vIdPluviometria:string);
var
 qryAux : TFDQuery;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FDConn;
 with qryAux,qryAux.sql do
 begin
   Clear;
   Add('delete from pluviometria');
   Add('WHERE ID='+vIdPluviometria);
   ExecSQL;
 end;
 qryAux.free;
end;

procedure TdmDB.DeletaTransferencia(vId:string);
var
 qryAux : TFDQuery;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FDConn;
 with qryAux,qryAux.sql do
 begin
   Clear;
   Add('delete from tranferenciaLocalestoque');
   Add('WHERE ID='+vId);
   ExecSQL;
 end;
 qryAux.free;
end;

procedure TdmDB.DeletaAbastecimento(vId:string);
var
 qryAux : TFDQuery;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FDConn;
 with qryAux,qryAux.sql do
 begin
   Clear;
   Add('delete from abastecimento');
   Add('WHERE ID='+vId);
   ExecSQL;
 end;
 qryAux.free;
end;

procedure TdmDB.DeletaEmbarque(vId:string);
var
 qryAux : TFDQuery;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FDConn;
 with qryAux,qryAux.sql do
 begin
   Clear;
   Add('delete from embarque');
   Add('WHERE ID='+vId);
   ExecSQL;
 end;
 qryAux.free;
end;

procedure TdmDB.DeletaAbastecimentoOutros(vId:string);
var
 qryAux : TFDQuery;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FDConn;
 with qryAux,qryAux.sql do
 begin
   Clear;
   Add('delete from abastecimentooutros');
   Add('WHERE ID='+vId);
   ExecSQL;
 end;
 qryAux.free;
end;

procedure TdmDB.DeletaTabelaGenerica(aTabela: string);
var
 qryAux : TFDQuery;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FDConn;
 with qryAux,qryAux.sql do
 begin
   Clear;
   Add('delete from '+aTabela);
   try
    ExecSQL;
   except
    on E: Exception do
     ShowMessage('Erro:' + E.Message );
   end;
 end;
 qryAux.free;
end;

procedure TdmDB.DeleteDetReceituario(id: string);
var
 qryAux : TFDQuery;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FDConn;
 with qryAux,qryAux.sql do
 begin
   Clear;
   Add('delete from detreceiturario');
   Add('where id='+id);
   ExecSQL;
 end;
 qryAux.free;
end;

procedure TdmDB.DeleteDetTalhaoReceituario(id: string);
var
 qryAux : TFDQuery;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FDConn;
 with qryAux,qryAux.sql do
 begin
   Clear;
   Add('delete from detreceiturariotalhao');
   Add('where id='+id);
   ExecSQL;
 end;
 qryAux.free;
end;

procedure TdmDB.DeleteOperacao(id,vIdRec: string);
var
 qryAux : TFDQuery;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FDConn;
 with qryAux,qryAux.sql do
 begin
   Clear;
   Add('delete from  operacaosafratalhao');
   Add('where id='+id);
   ExecSQL;

   Clear;
   Add('delete from detoperacaosafratalhaomaquinasoperadores');
   Add('where idoperacaotalhao='+id);
   ExecSQL;

   Clear;
   Add('delete from detoperacaosafratalhaoocorrencia');
   Add('where idoperacaotalhao='+id);
   ExecSQL;

   Clear;
   Add('delete from detoperacaosafratalhaoprodutos');
   Add('where idoperacaotalhao='+id);
   ExecSQL;
   if vIdRec.Length>0 then
   begin
    Clear;
    Add('update receiturario set status=1');
    Add('where id='+vIdRec);
    ExecSQL;
   end;

 end;
 qryAux.free;
end;

procedure TdmDB.HabilitaSync(id: string);
var
 qryAux : TFDQuery;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FDConn;
 with qryAux,qryAux.sql do
 begin
   Clear;
   Add('select * from operacaosafratalhao');
   Add('where idOpMaster='+id);
   Open;

   Clear;
   Add('update operacaosafratalhao set FlagSync=0');
   Add('where idOpMaster='+id);
   ExecSQL;
 end;
 qryAux.free;
end;

procedure TdmDB.HabilitaSyncContrato(id: string);
var
 qryAux : TFDQuery;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FDConn;
 with qryAux,qryAux.sql do
 begin
   Clear;
   Add('update embarque set syncFaz=0');
   Add('where idcontrato='+id);
   ExecSQL;
 end;
 qryAux.free;
end;

procedure TdmDB.DeleteReceituarios;
var
 qryAux : TFDQuery;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FDConn;
 with qryAux,qryAux.sql do
 begin

   Clear;
   Add('delete from operacaosafratalhao');
   Add('where idreceituario=124400');
   ExecSQL;

//   Clear;
//   Add('delete from receiturario');
//   ExecSQL;
//
//   Clear;
//   Add('delete from detreceiturariotalhao');
//   ExecSQL;
//
//   Clear;
//   Add('delete from detreceiturario');
//   ExecSQL;
 end;
 qryAux.free;
end;

procedure TdmDB.DeleteReceituario(id: string);
var
 qryAux : TFDQuery;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FDConn;
 with qryAux,qryAux.sql do
 begin
   Clear;
   Add('delete from receiturario');
   Add('where id='+id);
   ExecSQL;

   Clear;
   Add('delete from detreceiturariotalhao');
   Add('where idreceiturario='+id);
   ExecSQL;

   Clear;
   Add('delete from detreceiturario');
   Add('where idreceiturario='+id);
   ExecSQL;
 end;
 qryAux.free;
end;

procedure TdmDB.FDConnBeforeConnect(Sender: TObject);
begin
{$IF DEFINED(iOS) or DEFINED(ANDROID)}
  FDConn.Params.DriverID :='SQLite';
  FDConn.Params.Values['Database'] :=
  TPath.Combine(TPath.GetDocumentsPath,'Fort.db');
{$ENDIF}
{$IF DEFINED(WIN32)}
  FDConn.Params.DriverID :='SQLite';
  FDConn.Params.Values['Database'] :=
  'D:\Projetos2021\FortAgroMobile\FortAgroAndroid\db\AppFortAgrW.db';
{$ENDIF}
end;

procedure TdmDB.GeraListaMaquina(vIdMaquina: string);
begin
 with TListaRevisao,TListaRevisao.sql do
 begin
   Clear;
   Add('select a.*,b.nome  from revisaomaquinahist a');
   Add('left join planorevisao b on a.idplanorevisao=b.id');
   Add('where a.idmaquina='+vIdMaquina);
   Add('and a.horimetroproxima');
   Open;
 end;
end;

function TdmDB.VerificaExiste(vCampo, vTabela, vValue: string): Boolean;
var
 qryAux : TFDQuery;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FDConn;
 with qryAux,qryAux.sql do
 begin
   Clear;
   Add('select * from '+vTabela);
   Add('where status<>-1 and '+vCampo+' = '+vValue.QuotedString);
   Open;
   result:=qryAux.isempty;
 end;
 qryAux.free;
end;

function TdmDB.VerificaIdItemRevisaoExiste(vId: string): Boolean;
var
 qryAux : TFDQuery;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FDConn;
 with qryAux,qryAux.sql do
 begin
   Clear;
   Add('select * from revisaomaquinaitens');
   Add('where id='+vId);
   Open;
   result:=qryAux.isempty;
 end;
 qryAux.free;
end;

function TdmDB.VerificaIdOperacaoExiste(vId: string): Boolean;
var
 qryAux : TFDQuery;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FDConn;
 with qryAux,qryAux.sql do
 begin
   Clear;
   Add('select * from operacaosafratalhao');
   Add('where id='+vId);
   Open;
   result:=qryAux.isempty;
 end;
 qryAux.free;
end;

function TdmDB.VerificaIdServicoRevisaoExiste(vId: string): Boolean;
var
 qryAux : TFDQuery;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FDConn;
 with qryAux,qryAux.sql do
 begin
   Clear;
   Add('select * from servicomanutencao');
   Add('where id='+vId);
   Open;
   result:=qryAux.isempty;
 end;
 qryAux.free;
end;

function TdmDB.VerificaIdStandExiste(vId: string): Boolean;
var
 qryAux : TFDQuery;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FDConn;
 with qryAux,qryAux.sql do
 begin
   Clear;
   Add('select * from StandSementes');
   Add('where id='+vId);
   Open;
   result:=qryAux.isempty;
 end;
 qryAux.free;
end;

function TdmDB.VerificaIdVazaoExiste(vId: string): Boolean;
var
 qryAux : TFDQuery;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FDConn;
 with qryAux,qryAux.sql do
 begin
   Clear;
   Add('select * from DetVazaoOperacao');
   Add('where id='+vId);
   Open;
   result:=qryAux.isempty;
 end;
 qryAux.free;
end;


function TdmDB.VerificaIdTalhaoReceituarioExiste(vId: string): Boolean;
var
 qryAux : TFDQuery;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FDConn;
 with qryAux,qryAux.sql do
 begin
   Clear;
   Add('select * from detreceiturarioTalhao');
   Add('where id='+vId);
   Open;
   result:=qryAux.isempty;
 end;
 qryAux.free;
end;

function TdmDB.VerificaIdReceituarioExiste(vId: string): Boolean;
var
 qryAux : TFDQuery;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FDConn;
 with qryAux,qryAux.sql do
 begin
   Clear;
   Add('select * from receiturario');
   Add('where id='+vId);
   Open;
   result:=qryAux.isempty;
 end;
 qryAux.free;
end;

function TdmDB.VerificaMaquinaHorasEmAberto(idOp: string): Boolean;
var
 qryAux : TFDQuery;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FDConn;
 with qryAux,qryAux.sql do
 begin
   Clear;
   Add('select * from detoperacaosafratalhaomaquinasoperadores');
   Add('where status=1 and idoperacaotalhao='+idOp);
   Add('and horaTrabalhada=0');
   try
    Open;
   except
    on E: Exception do
     ShowMessage('Erro:' + E.Message );
   end;
   Result := qryAux.IsEmpty;
 end;
 qryAux.free;
end;

function TdmDB.VerificaMaquinasOperacao(vIdOpe: string): Boolean;
var
 qryAux : TFDQuery;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FDConn;
 with qryAux,qryAux.sql do
 begin
   Clear;
   Add('select * from detoperacaosafratalhaomaquinasoperadores');
   Add('where idoperacaotalhao='+vIdOpe);
   try
    Open;
   except
    on E: Exception do
     ShowMessage('Erro:' + E.Message );
   end;
   Result := qryAux.IsEmpty;
 end;
 qryAux.free;
end;

function TdmDB.VerificaProdutosOperacao(vIdOpe: string): Boolean;
var
 qryAux : TFDQuery;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FDConn;
 with qryAux,qryAux.sql do
 begin
   Clear;
   Add('select * from detoperacaosafratalhaoprodutos');
   Add('where idoperacaotalhao='+vIdOpe);
   try
    Open;
   except
    on E: Exception do
     ShowMessage('Erro:' + E.Message );
   end;
   Result := qryAux.IsEmpty;
 end;
 qryAux.free;
end;

function TdmDB.VerificaProdutosOperacaoZero(vIdOpe: string): Boolean;
var
 qryAux : TFDQuery;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FDConn;
 with qryAux,qryAux.sql do
 begin
   Clear;
   Add('select * from detoperacaosafratalhaoprodutos');
   Add('where qtdeutilidado=0 and idoperacaotalhao='+vIdOpe);
   try
    Open;
   except
    on E: Exception do
     ShowMessage('Erro:' + E.Message );
   end;
   Result := qryAux.IsEmpty;
 end;
 qryAux.free;
end;


function TdmDB.VerificaRevisaoExiste(vId: string): Boolean;
var
 qryAux : TFDQuery;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FDConn;
 with qryAux,qryAux.sql do
 begin
   Clear;
   Add('select * from revisaomaquina');
   Add('where id='+vId);
   Open;
   result:=qryAux.isempty;
 end;
 qryAux.free;
end;

function TdmDB.VerificaRomaneioUsado(idMaquina, Romaneio: string): Boolean;
var
 qryAux : TFDQuery;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FDConn;
 with qryAux,qryAux.sql do
 begin
   Clear;
   Add('select * from detoperacaosafratalhaomaquinasoperadores');
   Add('where  romaneio='+QuotedStr(Romaneio));
   Add('and idMaquina<>'+idMaquina);
   Open;
   Result := qryAux.IsEmpty;
 end;
 qryAux.free;
end;

function TdmDB.VerificaTabelaVazia(AnomeTable: string): Boolean;
var
 qryAux : TFDQuery;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FDConn;
 with qryAux,qryAux.sql do
 begin
   Clear;
   Add('select * from '+AnomeTable);
   try
    Open;
   except
    on E: Exception do
     ShowMessage('Erro:' + E.Message );
   end;
   frmPrincipal.vPrimeiroAcesso := qryAux.IsEmpty;
   Result := qryAux.IsEmpty;
 end;
 qryAux.free;
end;


function TdmDB.VerificaTagDiferente(idPonto, vTagFim: string): Boolean;
var
 qryAux : TFDQuery;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FDConn;
 with qryAux,qryAux.sql do
 begin
   Clear;
   Add('select * from monitoramentopragas');
   Add('where id='+idPonto);
   Add('and TagAbertura<>'+QuotedStr(vTagFim));
   Open;
   Result := qryAux.IsEmpty;
 end;
 qryAux.free;
end;

function TdmDB.VerificaTalhaoExiste(idTalhao, idReceituario:string): Boolean;
var
 qryAux : TFDQuery;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FDConn;
 with qryAux,qryAux.sql do
 begin
   Clear;
   Add('select * from detreceiturariotalhao');
   Add('where idreceiturario='+idReceituario);
   Add('and idtalhao='+idTalhao);
   try
    Open;
   except
    on E: Exception do
     ShowMessage('Erro:' + E.Message );
   end;
   Result := qryAux.IsEmpty;
 end;
 qryAux.free;
end;

function TdmDB.VerificaTalhaoFechamento(idPonto, vIdTalhao: string): Boolean;
var
 qryAux : TFDQuery;
 vIdT:string;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FDConn;
 with qryAux,qryAux.sql do
 begin
   Clear;
   Add('select * from monitoramentopragas');
   Add('where id='+idPonto);
   Open;
   vIdT := qryAux.FieldByName('idTalhao').AsString;
   Result := vIdT=vIdTalhao;
 end;
 qryAux.free;
end;

function TdmDB.VerificaTalhaoJaAdicionado(idOp,idTalhao:string):Boolean;
var
 qryAux : TFDQuery;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FDConn;
 with qryAux,qryAux.sql do
 begin
   Clear;
   Add('select * from DetTalhoesPulverizacao');
   Add('where idOperacao='+idOp);
   Add('and idTalhao='+idTalhao);
   try
    Open;
   except
    on E: Exception do
     ShowMessage('Erro:' + E.Message );
   end;
   Result := qryAux.IsEmpty;
 end;
 qryAux.free;
end;

function TdmDB.VerificaTalhaoJaAdicionadoReceituario(idReceituario,idTalhao:string):Boolean;
var
 qryAux : TFDQuery;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FDConn;
 with qryAux,qryAux.sql do
 begin
   Clear;
   Add('select * from detreceiturarioTalhao');
   Add('where status=1 and idTalhao='+idTalhao);
   Add('and idreceiturario='+idReceituario);
   try
    Open;
   except
    on E: Exception do
     ShowMessage('Erro:' + E.Message );
   end;
   Result := qryAux.IsEmpty;
 end;
 qryAux.free;
end;

function TdmDB.VerificaProdutoJaAdicionadoReceituario(idReceituario,idProduto:string):Boolean;
var
 qryAux : TFDQuery;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FDConn;
 with qryAux,qryAux.sql do
 begin
   Clear;
   Add('select * from detreceiturario');
   Add('where status=1');
   Add('and idProduto='+idProduto);
   Add('and idreceiturario='+idReceituario);
   try
    Open;
   except
    on E: Exception do
     ShowMessage('Erro:' + E.Message );
   end;
   Result := qryAux.IsEmpty;
 end;
 qryAux.free;
end;

function TdmDB.LimpaResut(vResult: string): String;
begin
  vResult := StringReplace(vResult,'{"result":[{"Mensagem":"','',[rfReplaceAll]);
  vResult := StringReplace(vResult,'{"result":[{"Erro":"','',[rfReplaceAll]);
  vResult := StringReplace(vResult,'{"result":[{"ok":"','',[rfReplaceAll]);
  vResult := StringReplace(vResult,'"}]}','',[rfReplaceAll]);
  Result  := vResult;
end;

end.
