program FortMobile;

uses
  System.StartUpCopy,
  FMX.Forms,
  UPrincipal in '..\Principal\UPrincipal.pas' {frmPrincipal},
  UDataContext in '..\DataContext\UDataContext.pas' {dmDB: TDataModule},
  UDataFunctions in '..\DataContext\UDataFunctions.pas' {dmFunctions: TDataModule},
  UDataSync in '..\DataContext\UDataSync.pas' {dmSync: TDataModule},
  UDataUpdate in '..\DataContext\UDataUpdate.pas' {dmUpdate: TDataModule},
  UAbastecimento in '..\Abastecimento\UAbastecimento.pas' {frmAbastecimento},
  UAtividadeAbastecimento in '..\AtividadeAbastecimento\UAtividadeAbastecimento.pas' {frmAtividadeAbastecimento},
  UAtividades in '..\Atividades\UAtividades.pas' {frmAtividades},
  UItensRevisao in '..\AuxItemRevisao\UItensRevisao.pas' {frmItensRevisao},
  UCadReceituario in '..\CadReceituario\UCadReceituario.pas' {frmCadReceituario},
  UnitCamera in '..\Camera\UnitCamera.pas' {FrmCamera},
  UAuxCobertura in '..\Coberturas\UAuxCobertura.pas' {Form1},
  UContratos in '..\Contratos\UContratos.pas' {frmContratos},
  UDMRevisao in '..\dmRevisao\UDMRevisao.pas' {dmRevisao: TDataModule},
  UEmbarque in '..\Embarque\UEmbarque.pas' {frmEmbarque},
  ULocalEstoque in '..\LocalEstoque\ULocalEstoque.pas' {frmLocalEstoque},
  Maquinas in '..\Maquinas\Maquinas.pas' {frmMaquinas},
  UMonitoramentoPraga in '..\MonitoramentoPraga\UMonitoramentoPraga.pas' {frmMonitoramento},
  Umsg in '..\msg\Umsg.pas' {frmMsg},
  UOperacoes in '..\Operacoes\UOperacoes.pas' {frmOperacao},
  UOperadorMaquina in '..\OperadorMaquina\UOperadorMaquina.pas' {frmOperadorMaquina},
  UPlanoRevisao in '..\PlanoRevisao\UPlanoRevisao.pas' {frmPlanoRevisao},
  UPluviometria in '..\Pluviometria\UPluviometria.pas' {frmPluviometria},
  UPluviometro in '..\Pluviometros\UPluviometro.pas' {frmPluviometro},
  UPragas in '..\Pragas\UPragas.pas' {frmPragas},
  UReceituario in '..\Receituario\UReceituario.pas' {frmReceituario},
  UProdutos in '..\Produtos\UProdutos.pas' {frmProdutos},
  URevisaoMaquinas in '..\RevisaoMaquinas\URevisaoMaquinas.pas' {frmRevisaoMaquina},
  UServicosRevisao in '..\ServicoRev\UServicosRevisao.pas' {frmServicosRevisao},
  UStandPlantas in '..\StandPlantas\UStandPlantas.pas' {frmStandPlantas},
  UTalhoes in '..\Talhoes\UTalhoes.pas' {frmTalhoes},
  UTipoOcorrencia in '..\TipoOcorrencia\UTipoOcorrencia.pas' {frmTipoOcorrencia},
  u99Permissions in '..\Util\u99Permissions.pas',
  UCamAbastecimento in '..\Camera\UCamAbastecimento.pas' {frmCameraAbastecimento};

{$R *.res}

begin
  Application.Initialize;
  Application.FormFactor.Orientations := [TFormOrientation.Portrait];
  Application.CreateForm(TdmDB, dmDB);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmSync, dmSync);
  Application.CreateForm(TdmUpdate, dmUpdate);
  Application.CreateForm(TdmRevisao, dmRevisao);
  Application.CreateForm(TfrmMsg, frmMsg);
  Application.Run;
end.
