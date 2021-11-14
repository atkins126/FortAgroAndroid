program FortAgroMob;

uses
  System.StartUpCopy,
  FMX.Forms,
  UPrincipal in 'UPrincipal.pas' {frmPrincipal},
  UDataContext in '..\DataContext\UDataContext.pas' {dmDB: TDataModule},
  UDataFunctions in '..\DataContext\UDataFunctions.pas' {dmFunctions: TDataModule},
  UDataSync in '..\DataContext\UDataSync.pas' {dmSync: TDataModule},
  UDataUpdate in '..\DataContext\UDataUpdate.pas' {dmUpdate: TDataModule},
  UAbastecimento in '..\Abastecimento\UAbastecimento.pas' {frmAbastecimento},
  UAtividades in '..\Atividades\UAtividades.pas' {frmAtividades},
  UCadReceituario in '..\CadReceituario\UCadReceituario.pas' {frmCadReceituario},
  UAuxCobertura in '..\Coberturas\UAuxCobertura.pas' {Form1},
  ULocalEstoque in '..\LocalEstoque\ULocalEstoque.pas' {frmLocalEstoque},
  Maquinas in '..\Maquinas\Maquinas.pas' {frmMaquinas},
  UMonitoramentoPraga in '..\MonitoramentoPraga\UMonitoramentoPraga.pas' {frmMonitoramento},
  Umsg in '..\msg\Umsg.pas' {frmMsg},
  UOperacoes in '..\Operacoes\UOperacoes.pas' {frmOperacao},
  UOperadorMaquina in '..\OperadorMaquina\UOperadorMaquina.pas' {frmOperadorMaquina},
  UPluviometria in '..\Pluviometria\UPluviometria.pas' {frmPluviometria},
  UPragas in '..\Pragas\UPragas.pas' {frmPragas},
  UPluviometro in '..\Pluviometros\UPluviometro.pas' {frmPluviometro},
  UProdutos in '..\Produtos\UProdutos.pas' {frmProdutos},
  UReceituario in '..\Receituario\UReceituario.pas' {frmReceituario},
  UStandPlantas in '..\StandPlantas\UStandPlantas.pas' {frmStandPlantas},
  UTipoOcorrencia in '..\TipoOcorrencia\UTipoOcorrencia.pas' {frmTipoOcorrencia},
  UTalhoes in '..\Talhoes\UTalhoes.pas' {frmTalhoes},
  UAtividadeAbastecimento in '..\AtividadeAbastecimento\UAtividadeAbastecimento.pas' {frmAtividadeAbastecimento},
  UContratos in '..\Contratos\UContratos.pas' {frmContratos},
  UEmbarque in '..\Embarque\UEmbarque.pas' {frmEmbarque},
  UDMRevisao in '..\dmRevisao\UDMRevisao.pas' {dmRevisao: TDataModule},
  UPlanoRevisao in '..\PlanoRevisao\UPlanoRevisao.pas' {frmPlanoRevisao},
  URevisaoMaquinas in '..\RevisaoMaquinas\URevisaoMaquinas.pas' {frmRevisaoMaquina},
  UItensRevisao in '..\AuxItemRevisao\UItensRevisao.pas' {frmItensRevisao},
  UServicosRevisao in '..\ServicoRev\UServicosRevisao.pas' {frmServicosRevisao};

{$R *.res}

begin
  Application.Initialize;
  Application.FormFactor.Orientations := [TFormOrientation.Portrait];
  Application.CreateForm(TdmDB, dmDB);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmAtividadeAbastecimento, frmAtividadeAbastecimento);
  Application.CreateForm(TfrmContratos, frmContratos);
  Application.CreateForm(TfrmEmbarque, frmEmbarque);
  Application.CreateForm(TdmRevisao, dmRevisao);
  Application.CreateForm(TfrmPlanoRevisao, frmPlanoRevisao);
  Application.CreateForm(TfrmRevisaoMaquina, frmRevisaoMaquina);
  Application.CreateForm(TfrmItensRevisao, frmItensRevisao);
  Application.CreateForm(TfrmServicosRevisao, frmServicosRevisao);
  Application.Run;
end.
