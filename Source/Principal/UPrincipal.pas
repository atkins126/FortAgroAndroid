unit UPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo, IPPeerClient,
  REST.Backend.PushTypes, System.JSON,Data.Bind.Components,
  Data.Bind.ObjectScope, REST.Backend.BindSource, REST.Backend.PushDevice,
  FMX.Platform,

  {$IFDEF ANDROID}
  Androidapi.Helpers,FMX.PushNotification.Android, System.PushNotification,
  REST.Backend.EMSPushDevice,Androidapi.JNIBridge,
  REST.Backend.EMSProvider,Androidapi.JNI.Os,Androidapi.JNI.GraphicsContentViewText,
  {$ENDIF}

  System.Threading,
  System.Net.HTTPClient, System.Notification, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FMX.ActnList,
  System.Actions, FMX.TabControl, FMX.Effects, FMX.TreeView, FMX.Layouts,
  FMX.Ani, FMX.StdCtrls, FMX.Edit, FMX.Objects,FMX.VirtualKeyboard

  ;
type
  TfrmPrincipal = class(TForm)
    tbPrincipal: TTabControl;
    tbiLogin: TTabItem;
    layLogin: TLayout;
    layLoginAnimaiton: TLayout;
    recLogin: TRectangle;
    Layout3: TLayout;
    Layout4: TLayout;
    Label1: TLabel;
    edtUsuario: TEdit;
    Label2: TLabel;
    edtSenha: TEdit;
    Animation: TFloatAnimation;
    ToolBar1: TToolBar;
    Rectangle4: TRectangle;
    lblVersao: TLabel;
    ToolBar3: TToolBar;
    Rectangle3: TRectangle;
    Label4: TLabel;
    Image16: TImage;
    tbiMenu: TTabItem;
    layMnuPrincipal: TLayout;
    ToolBar2: TToolBar;
    Rectangle2: TRectangle;
    lblVersao2: TLabel;
    ToolBar4: TToolBar;
    Rectangle1: TRectangle;
    btnFechar: TImage;
    Label5: TLabel;
    imgRetanguloLista: TImage;
    AnimationPrincipal: TFloatAnimation;
    Layout6: TLayout;
    Image1: TImage;
    Rectangle5: TRectangle;
    Rectangle6: TRectangle;
    tbiConfig: TTabItem;
    Layout1: TLayout;
    Rectangle9: TRectangle;
    Rectangle7: TRectangle;
    Layout2: TLayout;
    Rectangle10: TRectangle;
    ShadowEffect1: TShadowEffect;
    Layout7: TLayout;
    La: TLayout;
    Label6: TLabel;
    edtIPServidor: TEdit;
    ToolBar6: TToolBar;
    Rectangle11: TRectangle;
    Label7: TLabel;
    Layout9: TLayout;
    btnConfigSync1: TButton;
    Image2: TImage;
    Label9: TLabel;
    btnConfirmar: TButton;
    Image5: TImage;
    Label8: TLabel;
    btnEntrar: TButton;
    Image4: TImage;
    Label3: TLabel;
    layMnu: TLayout;
    AnimacaoMnu: TFloatAnimation;
    TreeView1: TTreeView;
    TreeConfig: TTreeViewItem;
    Image6: TImage;
    TreeExAuxiliares: TTreeViewItem;
    Image12: TImage;
    TreeExAgricultura: TTreeViewItem;
    TreeQuadroAtividades: TTreeViewItem;
    Image21: TImage;
    Image24: TImage;
    ShadowEffect3: TShadowEffect;
    Layout5: TLayout;
    mnu: TImage;
    Label10: TLabel;
    Rectangle8: TRectangle;
    ShadowEffect4: TShadowEffect;
    Layout8: TLayout;
    Layout10: TLayout;
    Label11: TLabel;
    edtPortaServidor: TEdit;
    actAcoes: TActionList;
    actMudarAba: TChangeTabAction;
    AcMudarAbaChart: TAction;
    AcMudarAbaDespesas: TAction;
    AcLeft: TAction;
    AcRigth: TAction;
    Layout43: TLayout;
    Label34: TLabel;
    chkSalvaSenha: TSwitch;
    tbiSync: TTabItem;
    Layout11: TLayout;
    Rectangle12: TRectangle;
    log: TMemo;
    Layout14: TLayout;
    Rectangle14: TRectangle;
    Label16: TLabel;
    btnVoltarSync: TImage;
    Rectangle13: TRectangle;
    Layout15: TLayout;
    btnVoltarSync1: TButton;
    Image25: TImage;
    Label12: TLabel;
    btnSync: TButton;
    Image26: TImage;
    Label13: TLabel;
    btnVoltarConfig: TImage;
    imgRetanguloVerde: TImage;
    imgReceituario: TImage;
    btnEnviaDados: TButton;
    Image3: TImage;
    Label14: TLabel;
    imgMaquina: TImage;
    imgFort: TImage;
    imgSeed: TImage;
    imgOcorrencia: TImage;
    TreeReceituario: TTreeViewItem;
    Image7: TImage;
    laySelectSync: TLayout;
    TreeViewItem1: TTreeViewItem;
    Image8: TImage;
    Rectangle15: TRectangle;
    Layout12: TLayout;
    lblAtiviadedesPendendes: TLabel;
    qryAux: TFDQuery;
    imgSync: TImage;
    Animacao: TFloatAnimation;
    imgOperador: TImage;
    imgTalhao: TImage;
    imgOcorrencia1: TImage;
    RecReceituarioPendente: TRectangle;
    Layout13: TLayout;
    lblRecPendente: TLabel;
    laySelectUpdate: TLayout;
    Rectangle16: TRectangle;
    Layout83: TLayout;
    Layout79: TLayout;
    Rectangle53: TRectangle;
    Label52: TLabel;
    chkBaixaMaquinas: TButton;
    laySyncReceituario: TLayout;
    Layout21: TLayout;
    Rectangle20: TRectangle;
    Label19: TLabel;
    laySyncTalhoes: TLayout;
    Layout17: TLayout;
    Rectangle17: TRectangle;
    Label15: TLabel;
    chkBaixaTalhoes: TButton;
    btnBaixaSelect: TButton;
    Image9: TImage;
    Label17: TLabel;
    NotificationCenter: TNotificationCenter;
    imgPluviometro: TImage;
    TreePluviometria: TTreeViewItem;
    Image10: TImage;
    Rectangle18: TRectangle;
    Layout18: TLayout;
    lblPluviometriaPendente: TLabel;
    imgLocalEstoque: TImage;
    TreeAbastecimento: TTreeViewItem;
    Image11: TImage;
    imgCombustivel: TImage;
    imgOutrosProdutos: TImage;
    Rectangle19: TRectangle;
    Layout19: TLayout;
    lblAbastecimentoPendente: TLabel;
    imgPragas: TImage;
    TreeMonitoramento: TTreeViewItem;
    Image13: TImage;
    imgPontosGPS: TImage;
    imgFinish: TImage;
    imgPragaVerde: TImage;
    imgFinalizaMonit: TImage;
    imgPragaLista: TImage;
    Rectangle21: TRectangle;
    Layout22: TLayout;
    lblMonitoramentoPendente: TLabel;
    imgTransf: TImage;
    Rectangle22: TRectangle;
    Layout23: TLayout;
    lblMovEstoqueSync: TLabel;
    Layout24: TLayout;
    Layout25: TLayout;
    Rectangle23: TRectangle;
    Label18: TLabel;
    chkBaixaProdutos: TButton;
    chkBaixaReceituario: TButton;
    imgContrato: TImage;
    imgEmbarque: TImage;
    Rectangle24: TRectangle;
    Layout26: TLayout;
    lblEmbarqueSync: TLabel;
    TreeEmbarque: TTreeViewItem;
    Image14: TImage;
    StyleBook1: TStyleBook;
    imgPeso: TImage;
    imgTaxa: TImage;
    TreeContratos: TTreeViewItem;
    Image15: TImage;
    imgMecanico: TImage;
    TreeArmazem: TTreeViewItem;
    Image17: TImage;
    TreeMaquinas: TTreeViewItem;
    Image18: TImage;
    TreeManutencao: TTreeViewItem;
    Image19: TImage;
    imgEdit: TImage;
    imgSeviceMec: TImage;
    imgListaConfirma: TImage;
    laySyncRevisao: TLayout;
    Layout28: TLayout;
    Rectangle25: TRectangle;
    Label20: TLabel;
    chkBaixaRevisoes: TButton;
    lblTipoDB: TLabel;
    Rectangle26: TRectangle;
    Layout16: TLayout;
    lblRevisoes: TLabel;
    imgFotos: TImage;
    procedure FormShow(Sender: TObject);
    procedure Image16Click(Sender: TObject);
    procedure btnEntrarClick(Sender: TObject);
    procedure mnuClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure TreeConfigClick(Sender: TObject);
    procedure btnSyncClick(Sender: TObject);
    procedure TreeExAuxiliaresClick(Sender: TObject);
    procedure btnVoltarSyncClick(Sender: TObject);
    procedure btnVoltarSync1Click(Sender: TObject);
    procedure btnVoltarConfigClick(Sender: TObject);
    procedure btnConfigSync1Click(Sender: TObject);
    procedure TreeExAgriculturaClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure btnEnviaDadosClick(Sender: TObject);
    procedure TreeReceituarioClick(Sender: TObject);
    procedure TreeViewItem1Click(Sender: TObject);
    procedure TreeQuadroAtividadesClick(Sender: TObject);
    procedure chkBaixaMaquinasClick(Sender: TObject);
    procedure chkBaixaTalhoesClick(Sender: TObject);
    procedure chkBaixaProdutosClick(Sender: TObject);
    procedure btnBaixaSelectClick(Sender: TObject);
    procedure TreePluviometriaClick(Sender: TObject);
    procedure TreeAbastecimentoClick(Sender: TObject);
    procedure TreeMonitoramentoClick(Sender: TObject);
    procedure Label10Click(Sender: TObject);
    procedure chkBaixaReceituarioClick(Sender: TObject);
    procedure TreeEmbarqueClick(Sender: TObject);
    procedure TreeContratosClick(Sender: TObject);
    procedure TreeArmazemClick(Sender: TObject);
    procedure TreeMaquinasClick(Sender: TObject);
    procedure TreeManutencaoClick(Sender: TObject);
    procedure chkBaixaRevisoesClick(Sender: TObject);
  private
    procedure MudarAba(ATabItem: TTabItem; sender: TObject);
  public
    T : ITask;
    etapa,device_token,vTipoDb : string;
    vPrimeiroAcesso:Boolean;
    vIdMaquinaSelecionada,vMarcaModeloMaquinaSelecionada,
    vIdProdutoSelecionado,vNomeProdutoSelecionado,
    vUniMedidaProdutoSelecionado,vIdServicoSelecionado,
    vTipoServicoSelecionado,vDescricaoServicoSelecionado,vAtvPendente,
    vMarcaSelect,vModeloSelect,vPlacaSelect,vUltimaRevisao,vHorimetro,
    vProximaRev:string;
    vNovoEmbarque:integer;
    {$IFDEF ANDROID}
     PushService: TPushService;
     ServiceConnection: TPushServiceConnection;
     procedure Vibrar(tempo: Integer);
    {$ENDIF}
    procedure myShowMenssagem(msg:string);
    function  GetVersaoArq: string;
    function  EnviaToken(msg:string):string;
    procedure ThreadEnd(Sender: TObject);


    procedure FormActivate(Sender: TObject);
    {$IFDEF ANDROID}
     procedure DoServiceConnectionChange(Sender: TObject; PushChanges: TPushService.TChanges);
    {$ENDIF}
    procedure FormCreate(Sender: TObject);
    function AppEventProc(AAppEvent: TApplicationEvent; AContext: TObject): Boolean;

  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

uses UDataContext, Umsg, UOperacoes, UReceituario, UDataSync, UCadReceituario,
  UStandPlantas, UPluviometria, UAbastecimento, UDataUpdate,
  UMonitoramentoPraga, UEmbarque, UContratos, URevisaoMaquinas;


procedure CancelarNotificacao(nome : string);
begin
    with frmPrincipal do
    begin
      if nome = '' then
        NotificationCenter.CancelAll
      else
        NotificationCenter.CancelNotification(nome);
    end;
end;


procedure TfrmPrincipal.myShowMenssagem(msg:string);
begin
  frmMsg := TfrmMsg.Create(Self);
  try
    frmMsg.lblmsg.Text :=msg;
    frmMsg.ShowModal(
    procedure(ModalResult: TModalResult)
    begin
    end);
  finally
    frmMsg.free;
  end;
end;

procedure TfrmPrincipal.ThreadEnd(Sender: TObject);
begin
 if Assigned(TThread(Sender).FatalException) then
    showmessage('Erro na etapa: ' + etapa + ' - ' + Exception(TThread(Sender).FatalException).Message);
end;

procedure TfrmPrincipal.TreeAbastecimentoClick(Sender: TObject);
begin
  frmAbastecimento := TfrmAbastecimento.Create(Self);
  try
    frmAbastecimento.ShowModal(
    procedure(ModalResult: TModalResult)
    begin
    end);
  finally
    frmAbastecimento.free;
  end;
end;

procedure TfrmPrincipal.TreeArmazemClick(Sender: TObject);
begin
 TreeExAgricultura.IsExpanded :=false;
 TreeMaquinas.IsExpanded      :=false;
 if TreeArmazem.IsExpanded then
   TreeArmazem.IsExpanded :=false
 else
   TreeArmazem.IsExpanded :=true;
end;

procedure TfrmPrincipal.TreeConfigClick(Sender: TObject);
begin
  dmDB.qryConfig.Close;
  dmDB.qryConfig.Open;
  edtIPServidor.Text    := dmDB.qryConfigIP_SERVIDOR.AsString;
  edtPortaServidor.Text := dmDB.qryConfigPOTA_SERVIDOR.AsString;
  MudarAba(tbiConfig,sender);
end;

procedure TfrmPrincipal.TreeContratosClick(Sender: TObject);
begin
  frmContratos := TfrmContratos.Create(Self);
  try
    frmContratos.ShowModal(
    procedure(ModalResult: TModalResult)
    begin
    end);
  finally
    frmContratos.free;
  end;
end;

procedure TfrmPrincipal.TreeEmbarqueClick(Sender: TObject);
begin
  vNovoEmbarque :=0;
  frmEmbarque := TfrmEmbarque.Create(Self);
  try
    frmEmbarque.ShowModal(
    procedure(ModalResult: TModalResult)
    begin
    end);
  finally
    frmEmbarque.free;
  end;
end;

procedure TfrmPrincipal.TreeExAgriculturaClick(Sender: TObject);
begin
 if TreeExAgricultura.IsExpanded then
   TreeExAgricultura.IsExpanded :=false
 else
   TreeExAgricultura.IsExpanded :=true;


end;

procedure TfrmPrincipal.TreeExAuxiliaresClick(Sender: TObject);
begin
  btnSync.Enabled := true;
  if dmSync=nil then
   dmSync := TdmSync.Create(Self);

  laySelectUpdate.Visible := false;
  chkBaixaMaquinas.Text   :='';
  chkBaixaProdutos.Text   :='';
  chkBaixaTalhoes.Text    :='';
  if dmDB.vAgronomo='1' then
  begin
   dmSync.TSyncReceituario.Close;
   dmSync.TSyncReceituario.Open;
   RecReceituarioPendente.Visible := dmDB.vAgronomo='1';
   lblRecPendente.Text := 'Receituarios Pendentes :'+
   intToStr(dmSync.TSyncReceituario.RecordCount);
  end;

  laySyncRevisao.Visible     := dmDB.vRevisaoMaquinas=1;
  laySyncReceituario.Visible := dmDB.vPulverizacao=1;

  dmSync.qryOpSafraSync.Close;
  dmSync.qryOpSafraSync.Open;
  lblAtiviadedesPendendes.Text := 'Atividade Pendendes: '+
   intToStr(dmSync.qryOpSafraSync.RecordCount);
  vAtvPendente := intToStr(dmSync.qryOpSafraSync.RecordCount);

  dmSync.TMonitoramentoPraga.Close;
  dmSync.TMonitoramentoPraga.Open;
  lblMonitoramentoPendente.Text := 'Monitoramento Pendente: '+
   intToStr(dmSync.TMonitoramentoPraga.RecordCount);


  dmSync.TSyncPluviometria.Close;
  dmSync.TSyncPluviometria.Open;
  lblPluviometriaPendente.Text := 'Pluviometria Pendente: '+
   intToStr(dmSync.TSyncPluviometria.RecordCount);

  dmSync.TSyncAbastecimento.Close;
  dmSync.TSyncAbastecimento.Open;
  lblAbastecimentoPendente.Text := 'Abastecimento Pendente: '+
   intToStr(dmSync.TSyncAbastecimento.RecordCount);

  dmSync.TMovLocalEstoque.Close;
  dmSync.TMovLocalEstoque.Open;
  lblMovEstoqueSync.Text := 'Movimentação Estoque: '+
   intToStr(dmSync.TMovLocalEstoque.RecordCount);

  dmSync.TPostRevisao.Close;
  dmSync.TPostRevisao.Open;
  lblRevisoes.Text := 'Revisoes: '+
   intToStr(dmSync.TPostRevisao.RecordCount);

  dmSync.Embarque.Close;
  dmSync.Embarque.Open;
  lblEmbarqueSync.Text := 'Embarques: '+
   intToStr(dmSync.Embarque.RecordCount);

  log.Lines.Clear;
  dmDB.qryConfig.Close;
  dmDB.qryConfig.Open;
  if dmDB.qryConfigIP_SERVIDOR.AsString.Length=0 then
  begin
    myShowMenssagem('Informe o ip do servidor nas configurações');
    Exit;
  end
  else
    dmSync.Host := dmDB.qryConfigIP_SERVIDOR.AsString;
  if dmDB.qryConfigPOTA_SERVIDOR.AsString.Length=0 then
  begin
    myShowMenssagem('Informe a porta do servidor nas configurações');
    Exit;
  end
  else
    dmSync.Porta := dmDB.qryConfigPOTA_SERVIDOR.AsString;
  MudarAba(tbiSync,sender);
end;

procedure TfrmPrincipal.TreeManutencaoClick(Sender: TObject);
begin
  frmRevisaoMaquina := TfrmRevisaoMaquina.Create(Self);
  try
    frmRevisaoMaquina.ShowModal(
    procedure(ModalResult: TModalResult)
    begin
    end);
  finally
    frmRevisaoMaquina.free;
  end;
end;

procedure TfrmPrincipal.TreeMaquinasClick(Sender: TObject);
begin
 TreeExAgricultura.IsExpanded :=false;
 TreeArmazem.IsExpanded      :=false;
 if TreeMaquinas.IsExpanded then
   TreeMaquinas.IsExpanded :=false
 else
   TreeMaquinas.IsExpanded :=true;
end;

procedure TfrmPrincipal.TreeMonitoramentoClick(Sender: TObject);
begin
  frmMonitoramento := TfrmMonitoramento.Create(Self);
  try
    frmMonitoramento.ShowModal(
    procedure(ModalResult: TModalResult)
    begin
    end);
  finally
    frmMonitoramento.free;
  end;
end;

procedure TfrmPrincipal.TreePluviometriaClick(Sender: TObject);
begin
  frmPluviometria := TfrmPluviometria.Create(Self);
  try
    frmPluviometria.ShowModal(
    procedure(ModalResult: TModalResult)
    begin
    end);
  finally
    frmPluviometria.free;
  end;
end;

procedure TfrmPrincipal.TreeQuadroAtividadesClick(Sender: TObject);
begin
  frmOperacao := TfrmOperacao.Create(Self);
  try
    frmOperacao.ShowModal(
    procedure(ModalResult: TModalResult)
    begin
    end);
  finally
    frmOperacao.free;
  end;
end;

procedure TfrmPrincipal.TreeReceituarioClick(Sender: TObject);
begin
 frmCadReceituario := TfrmCadReceituario.Create(Self);
  try
    frmCadReceituario.ShowModal(
    procedure(ModalResult: TModalResult)
    begin
    end);
  finally
    frmCadReceituario.free;
  end;
end;

procedure TfrmPrincipal.TreeViewItem1Click(Sender: TObject);
begin
  frmStandPlantas := TfrmStandPlantas.Create(Self);
  try
    frmStandPlantas.ShowModal(
    procedure(ModalResult: TModalResult)
    begin
    end);
  finally
    frmStandPlantas.free;
  end;
end;



function TfrmPrincipal.AppEventProc(AAppEvent: TApplicationEvent;
  AContext: TObject): Boolean;
begin
  if (AAppEvent = TApplicationEvent.BecameActive) then
        CancelarNotificacao('');
end;

procedure TfrmPrincipal.btnBaixaSelectClick(Sender: TObject);
begin
  if dmSync.TestaServidor<>'Erro' THEN
  begin
   Animacao.Start;
   T := TTask.Create(procedure
   begin
    if vTipoDb='PECUARIA' then
    begin
      TThread.Synchronize(TThread.CurrentThread, procedure
      begin
       laySelectUpdate.Visible := false;
       btnSync.Enabled         := true;
       btnEnviaDados.Enabled   := true;
       log.Lines.Add('Baixando Usuarios');
      end);
      etapa := 'Baixando Usuarios';
      try
       dmSync.GetUsuarios;
      except
        on E : Exception do
          log.Lines.Add('Erro ao Sincronizar '+etapa+': '+E.Message);
      end;
      TThread.Synchronize(TThread.CurrentThread, procedure
      begin
       laySelectUpdate.Visible := false;
       btnSync.Enabled         := true;
       btnEnviaDados.Enabled   := true;
       log.Lines.Add('Baixando Atividade Abastecimento');
      end);
      etapa := 'Baixando Atividade Abastecimento';
      try
       dmSync.GetAtividadeAbastecimento;
      except
        on E : Exception do
          log.Lines.Add('Erro ao Sincronizar '+etapa+': '+E.Message);
      end;
      TThread.Synchronize(TThread.CurrentThread, procedure
      begin
       log.Lines.Add('Baixando Operador');
      end);
      etapa :='Baixando Operador';
      try
       dmSync.GetOperadorMaquina;
      except
        on E : Exception do
          log.Lines.Add('Erro ao Sincronizar '+etapa+': '+E.Message);
      end;
      if chkBaixaRevisoes.Text='X' then
      begin
       TThread.Synchronize(TThread.CurrentThread, procedure
       begin
        log.Lines.Add('Baixando Aux Itens Revisao');
       end);
       etapa :='Baixando Aux Itens Revisao';
       try
        dmSync.GetPlanoAuxItemRevisao;
       except
        on E : Exception do
          log.Lines.Add('Erro ao Sincronizar '+etapa+': '+E.Message);
       end;
       TThread.Synchronize(TThread.CurrentThread, procedure
       begin
        log.Lines.Add('Baixando Plano Revisao');
       end);
       etapa :='Baixando Plano Revisao';
       try
        dmSync.GetPlanoRevisao;
       except
        on E : Exception do
          log.Lines.Add('Erro ao Sincronizar '+etapa+': '+E.Message);
       end;
       TThread.Synchronize(TThread.CurrentThread, procedure
       begin
        log.Lines.Add('Baixando Plano Revisao Maquinas');
       end);
       try
        dmSync.GetPlanoRevisaoMaquinas;
       except
        on E : Exception do
          log.Lines.Add('Erro ao Sincronizar '+etapa+': '+E.Message);
       end;
       etapa :='Baixando Plano Revisao Maquinas';
       TThread.Synchronize(TThread.CurrentThread, procedure
       begin
        log.Lines.Add('Baixando Plano Itens');
       end);
       etapa :='Baixando Plano Itens';
       try
         dmSync.GetPlanoRevisaoItens;
       except
        on E : Exception do
          log.Lines.Add('Erro ao Sincronizar '+etapa+': '+E.Message);
       end;
       TThread.Synchronize(TThread.CurrentThread, procedure
       begin
        log.Lines.Add('Baixando Revisao');
       end);
       etapa :='Baixando Revisao';
       try
         dmSync.GetRevisao;
       except
        on E : Exception do
          log.Lines.Add('Erro ao Sincronizar '+etapa+': '+E.Message);
       end;
      end;

      if chkBaixaMaquinas.Text='X' then
      begin
        TThread.Synchronize(TThread.CurrentThread, procedure
        begin
         log.Lines.Add('Baixando Maquinas');
        end);
        etapa :='Baixando Maquinas';
        try
         dmSync.GetMaquinas;
        except
        on E : Exception do
          log.Lines.Add('Erro ao Sincronizar '+etapa+': '+E.Message);
        end;
      end;
      sleep(500);

      TThread.Synchronize(TThread.CurrentThread, procedure
      begin
       log.Lines.Add('Baixando Local Estoque');
      end);
      etapa :='Baixando Local Estoque';
      try
        dmSync.GetLocalEstoque;
      except
        on E : Exception do
          log.Lines.Add('Erro ao Sincronizar '+etapa+': '+E.Message);
       end;
      sleep(500);
      if chkBaixaProdutos.Text='X' then
      begin
       TThread.Synchronize(TThread.CurrentThread, procedure
        begin
         log.Lines.Add('Baixando Produtos');
        end);
        etapa :='Baixando Produtos';
        try
         dmSync.GetProdutos;
        except
        on E : Exception do
          log.Lines.Add('Erro ao Sincronizar '+etapa+': '+E.Message);
        end;
      end;
      sleep(500);
    end //pecuaria
    else
    begin
      TThread.Synchronize(TThread.CurrentThread, procedure
      begin
       laySelectUpdate.Visible := false;
       btnSync.Enabled         := true;
       btnEnviaDados.Enabled   := true;
       log.Lines.Add('Baixando Usuarios');
      end);
      etapa :='Baixando Usuarios';
      try
       dmSync.GetUsuarios;
      except
        on E : Exception do
          log.Lines.Add('Erro ao Sincronizar '+etapa+': '+E.Message);
      end;
      sleep(500);
      TThread.Synchronize(TThread.CurrentThread, procedure
      begin
       log.Lines.Add('Baixando Pragas');
      end);
      etapa :='Baixando Pragas';
      try
       dmSync.GetAuxPragas;
      except
        on E : Exception do
          log.Lines.Add('Erro ao Sincronizar '+etapa+': '+E.Message);
      end;
      sleep(500);
      TThread.Synchronize(TThread.CurrentThread, procedure
      begin
       log.Lines.Add('Baixando Operador');
      end);
      etapa :='Baixando Operador';
      try
       dmSync.GetOperadorMaquina;
      except
        on E : Exception do
          log.Lines.Add('Erro ao Sincronizar '+etapa+': '+E.Message);
      end;
      sleep(500);
      TThread.Synchronize(TThread.CurrentThread, procedure
      begin
       log.Lines.Add('Baixando Coberturas');
      end);
      etapa :='Baixando Coberturas';
      try
       dmSync.GetCoberturas;
      except
        on E : Exception do
          log.Lines.Add('Erro ao Sincronizar '+etapa+': '+E.Message);
      end;
      sleep(500);
      if chkBaixaRevisoes.Text='X' then
      begin
       TThread.Synchronize(TThread.CurrentThread, procedure
       begin
        log.Lines.Add('Baixando Aux Itens Revisao');
       end);
       etapa :='Baixando Aux Itens Revisao';
       try
         dmSync.GetPlanoAuxItemRevisao;
       except
        on E : Exception do
          log.Lines.Add('Erro ao Sincronizar '+etapa+': '+E.Message);
       end;
       sleep(500);
       TThread.Synchronize(TThread.CurrentThread, procedure
       begin
        log.Lines.Add('Baixando Plano Revisao');
       end);
       etapa :='Baixando Plano Revisao';
       try
        dmSync.GetPlanoRevisao;
       except
        on E : Exception do
          log.Lines.Add('Erro ao Sincronizar '+etapa+': '+E.Message);
       end;
       sleep(500);
       TThread.Synchronize(TThread.CurrentThread, procedure
       begin
        log.Lines.Add('Baixando Plano Revisao Maquinas');
       end);
       etapa :='Baixando Plano Revisao Maquinas';
       try
         dmSync.GetPlanoRevisaoMaquinas;
       except
        on E : Exception do
          log.Lines.Add('Erro ao Sincronizar '+etapa+': '+E.Message);
       end;
       sleep(500);
       TThread.Synchronize(TThread.CurrentThread, procedure
       begin
        log.Lines.Add('Baixando Plano Itens');
       end);
       etapa :='Baixando Plano Itens';
       try
        dmSync.GetPlanoRevisaoItens;
       except
        on E : Exception do
          log.Lines.Add('Erro ao Sincronizar '+etapa+': '+E.Message);
       end;
       sleep(500);
       TThread.Synchronize(TThread.CurrentThread, procedure
       begin
        log.Lines.Add('Baixando Revisao');
       end);
       etapa :='Baixando Revisao';
       try
         dmSync.GetRevisao;
       except
        on E : Exception do
          log.Lines.Add('Erro ao Sincronizar '+etapa+': '+E.Message);
       end;
      end;
      sleep(500);
      if dmDB.vAbastecimento=1 then
      begin
       TThread.Synchronize(TThread.CurrentThread, procedure
       begin
        laySelectUpdate.Visible := false;
        btnSync.Enabled         := true;
        btnEnviaDados.Enabled   := true;
        log.Lines.Add('Baixando Atividade Abastecimento');
       end);
       etapa :='Baixando Atividade Abastecimento';
       try
        dmSync.GetAtividadeAbastecimento;
       except
        on E : Exception do
          log.Lines.Add('Erro ao Sincronizar '+etapa+': '+E.Message);
       end;
      end;
      sleep(500);
      if chkBaixaMaquinas.Text='X' then
      begin
        TThread.Synchronize(TThread.CurrentThread, procedure
        begin
         log.Lines.Add('Baixando Maquinas');
        end);
        etapa :='Baixando Maquinas';
        try
         dmSync.GetMaquinas;
        except
        on E : Exception do
          log.Lines.Add('Erro ao Sincronizar '+etapa+': '+E.Message);
        end;
      end;
      sleep(500);
      if chkBaixaProdutos.Text='X' then
      begin
        TThread.Synchronize(TThread.CurrentThread, procedure
        begin
         log.Lines.Add('Baixando Produtos');
        end);
        etapa :='Baixando Produtos';
        try
         dmSync.GetProdutos;
        except
        on E : Exception do
          log.Lines.Add('Erro ao Sincronizar '+etapa+': '+E.Message);
        end;
      end;
      sleep(500);
      TThread.Synchronize(TThread.CurrentThread, procedure
      begin
       log.Lines.Add('Baixando Operações');
      end);
      etapa :='Baixando Operações';
      try
       dmSync.GetOperacoes;
      except
        on E : Exception do
          log.Lines.Add('Erro ao Sincronizar '+etapa+': '+E.Message);
      end;
      sleep(500);
      if chkBaixaTalhoes.Text='X' then
      begin
        TThread.Synchronize(TThread.CurrentThread, procedure
        begin
         log.Lines.Add('Baixando Areas Fazenda');
        end);
        etapa :='Baixando Areas Fazenda';
        try
         dmSync.GetAreas;
        except
        on E : Exception do
          log.Lines.Add('Erro ao Sincronizar '+etapa+': '+E.Message);
        end;
        sleep(500);
        TThread.Synchronize(TThread.CurrentThread, procedure
        begin
         log.Lines.Add('Baixando Setores Fazenda');
        end);
        etapa :='Baixando Setores Fazenda';
        try
         dmSync.GetSetor;
        except
        on E : Exception do
          log.Lines.Add('Erro ao Sincronizar '+etapa+': '+E.Message);
        end;
        sleep(500);
        TThread.Synchronize(TThread.CurrentThread, procedure
        begin
         log.Lines.Add('Baixando Talhoes');
        end);
        etapa :='Baixando Talhoes';
        try
         dmSync.GetTalhoes;
        except
        on E : Exception do
          log.Lines.Add('Erro ao Sincronizar '+etapa+': '+E.Message);
        end;
        sleep(500);
      end;

      if dmDB.vPluviometria=1 then
      begin
        TThread.Synchronize(TThread.CurrentThread, procedure
        begin
         log.Lines.Add('Baixando Pluviometros');
        end);
        etapa :='Baixando Pluviometros';
        try
         log.Lines.Add(dmSync.GetPluviometros);
        except
        on E : Exception do
          log.Lines.Add('Erro ao Sincronizar '+etapa+': '+E.Message);
        end;
        sleep(500);
        TThread.Synchronize(TThread.CurrentThread, procedure
        begin
         log.Lines.Add('Baixando Pluviometros Talhoes');
        end);
        etapa :='Baixando Pluviometros Talhoes';
        try
         dmSync.GetPluviometroTalhoes;
        except
        on E : Exception do
          log.Lines.Add('Erro ao Sincronizar '+etapa+': '+E.Message);
        end;
        sleep(500);
      end;

      TThread.Synchronize(TThread.CurrentThread, procedure
      begin
       log.Lines.Add('Baixando Local Estoque');
      end);
      etapa :='Baixando Local Estoque';
      try
       dmSync.GetLocalEstoque;
      except
        on E : Exception do
          log.Lines.Add('Erro ao Sincronizar '+etapa+': '+E.Message);
      end;
      sleep(500);
      TThread.Synchronize(TThread.CurrentThread, procedure
      begin
       log.Lines.Add('Baixando Safra');
      end);
      etapa :='Baixando Safra';
      try
       dmSync.GetSafra;
      except
        on E : Exception do
          log.Lines.Add('Erro ao Sincronizar '+etapa+': '+E.Message);
      end;
      sleep(500);
      TThread.Synchronize(TThread.CurrentThread, procedure
      begin
       log.Lines.Add('Baixando Culturas');
      end);
      etapa :='Baixando Culturas';
      try
       dmSync.GetCulturas;
      except
        on E : Exception do
          log.Lines.Add('Erro ao Sincronizar '+etapa+': '+E.Message);
      end;
      sleep(500);
      TThread.Synchronize(TThread.CurrentThread, procedure
      begin
       log.Lines.Add('Baixando Variedades');
      end);
      etapa :='Baixando Variedades';
      try
       dmSync.GetCultivares;
      except
        on E : Exception do
          log.Lines.Add('Erro ao Sincronizar '+etapa+': '+E.Message);
      end;
      sleep(500);
      TThread.Synchronize(TThread.CurrentThread, procedure
      begin
       log.Lines.Add('Baixando Tipo Ocorrencia');
      end);
      etapa :='Baixando Tipo Ocorrencia';
      try
       dmSync.GetTipoOcorrencia;
      except
        on E : Exception do
          log.Lines.Add('Erro ao Sincronizar '+etapa+': '+E.Message);
      end;
      sleep(500);
      TThread.Synchronize(TThread.CurrentThread, procedure
      begin
       log.Lines.Add('Baixando Tipo Aplicacao Solido');
      end);
      etapa :='Baixando Tipo Aplicacao Solido';
      try
       dmSync.GetTipoAplicacaoSolido;
      except
        on E : Exception do
          log.Lines.Add('Erro ao Sincronizar '+etapa+': '+E.Message);
      end;
      sleep(500);
      if dmDB.vArmazem=1 then
      begin
       TThread.Synchronize(TThread.CurrentThread, procedure
       begin
        log.Lines.Add('Baixando Compradores');
       end);
       etapa :='Baixando Compradores';
       try
        dmSync.GetComprador;
       except
       on E : Exception do
          log.Lines.Add('Erro ao Sincronizar '+etapa+': '+E.Message);
       end;
       sleep(500);
       TThread.Synchronize(TThread.CurrentThread, procedure
       begin
        log.Lines.Add('Baixando Contratos');
       end);
       etapa :='Baixando Contratos';
       try
         dmSync.GetContratos;
       except
        on E : Exception do
          log.Lines.Add('Erro ao Sincronizar '+etapa+': '+E.Message);
       end;
       sleep(500);
      end;
      if chkBaixaReceituario.Text='X' then
      begin
         TThread.Synchronize(TThread.CurrentThread, procedure
         begin
          log.Lines.Add('Baixando Receituario');
         end);
         etapa :='Baixando Receituario';
         try
          dmSync.GetReceituario;
         except
          on E : Exception do
            log.Lines.Add('Erro ao Sincronizar '+etapa+': '+E.Message);
         end;
         sleep(500);
      end;
    end;
    TThread.Synchronize(TThread.CurrentThread, procedure
    begin
      MessageDlg('Dados Baixados com Sucesso, sistema deve ser reiniciado',
      System.UITypes.TMsgDlgType.mtInformation,
      [System.UITypes.TMsgDlgBtn.mbYes], 0,
      procedure(const AResult: System.UITypes.TModalResult)
      begin
       case AResult of
        mrYES:
        begin
         Application.Terminate;
        end;
       end;
      end);
    end);
   end);
   t.Start;
  end
  else
  begin
    myShowMenssagem('Erro ao se conectar com servidor!');
    Animacao.Stop;
  end;
end;

procedure TfrmPrincipal.btnConfigSync1Click(Sender: TObject);
begin
 MudarAba(tbiMenu,sender);
end;

procedure TfrmPrincipal.btnConfirmarClick(Sender: TObject);
var
 vResult:string;
begin
if edtIPServidor.Text.IsEmpty then
 begin
  myShowMenssagem('Informe o Host do Servidor');
  edtIPServidor.SetFocus;
  Exit;
 end;
 if edtPortaServidor.Text.IsEmpty then
 begin
  myShowMenssagem('Informe a Porta do Servidor');
  edtPortaServidor.SetFocus;
  Exit;
 end;
 dmDB.qryConfig.Edit;
 dmdb.qryConfigIP_SERVIDOR.AsString    := edtIPServidor.Text;
 dmdb.qryConfigPOTA_SERVIDOR.AsString  := edtPortaServidor.Text;
 dmSync.Host                           := edtIPServidor.Text;
 dmSync.Porta                          := edtPortaServidor.Text;
 try
   dmdb.qryConfig.ApplyUpdates(-1);
 except
 on E : Exception do
   myShowMenssagem('Erro ao inserir Configuração : '+E.Message);
 end;
   if vPrimeiroAcesso then
   begin
    try
     dmSync.GetTipoDB;
     vResult := dmSync.GetUsuarios;
     if vResult='Usuarios Baixados com Sucesso' then
     begin
       myShowMenssagem('Usuarios baixados com sucesso');
       frmPrincipal.vPrimeiroAcesso := false;
       MudarAba(tbiLogin,Sender);
     end
     else
     begin
       myShowMenssagem(vResult);
     end;
    except
    on E : Exception do
       myShowMenssagem('Erro ao baixar Usuario: '+E.Message);
    end;
   end
   else
    MudarAba(tbiMenu,Sender);
end;

procedure TfrmPrincipal.btnEntrarClick(Sender: TObject);
begin
 if edtUsuario.Text.IsEmpty  then
 begin
   myShowMenssagem('Informe o usuario!');
   edtUsuario.SetFocus;
   Exit;
 end;
 if edtSenha.Text.IsEmpty  then
 begin
   myShowMenssagem('Informe a Senha!');
   edtSenha.SetFocus;
   Exit;
 end;
 if dmdb.AutenticaUsuario(edtUsuario.Text,edtSenha.Text)then
 begin
  if chkSalvaSenha.IsChecked then
  begin
    dmdb.qryConfig.Close;
    dmdb.qryConfig.Open;
    dmdb.qryConfig.Edit;
    dmdb.qryConfigSalvarLogin.AsInteger :=1;
    dmdb.qryConfig.ApplyUpdates(-1);
  end;
  laymnu.Opacity :=0;
  MudarAba(tbiMenu,sender);
  AnimacaoMnu.Start;
 end
 else
  myShowMenssagem('Usuario ou senha invalidos!');
end;

procedure TfrmPrincipal.btnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TfrmPrincipal.btnVoltarSync1Click(Sender: TObject);
begin
 MudarAba(tbiMenu,sender);
end;

procedure TfrmPrincipal.btnSyncClick(Sender: TObject);
begin
  laySelectUpdate.Visible := true;
  btnSync.Enabled         := false;
  btnEnviaDados.Enabled   := false;
end;

procedure TfrmPrincipal.FormActivate(Sender: TObject);
//var
//  {$IFDEF ANDROID}
//   Notifications : TArray<TPushServiceNotification>;
//  {$ENDIF}
//  x : integer;
//  vNotification:string;
begin
//
//     {$IFDEF ANDROID}
//        Notifications := PushService.StartupNotifications; // notificaoes que abriram meu app...
//
//        if Length(Notifications) > 0 then
//        begin
//            // Android...
//            if Notifications[0].DataKey = 'fcm' then
//            begin
//                    for x := 0 to Notifications[0].DataObject.Count - 1 do
//                       vNotification:=(Notifications[0].DataObject.Pairs[x].JsonString.Value + ' = ' +
//                                        Notifications[0].DataObject.Pairs[x].JsonValue.Value);
//
//            end;
//
//            // iOS...
//            if Notifications[0].DataKey = 'aps' then
//            begin
//                    for x := 0 to Notifications[0].DataObject.Count - 1 do
//                        vNotification:=(Notifications[0].DataObject.Pairs[x].JsonString.Value + ' = ' +
//                                        Notifications[0].DataObject.Pairs[x].JsonValue.Value);
//
//            end;
//        end;
//     {$ENDIF}
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
end;

procedure TfrmPrincipal.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
var
  KeyboardService: IFMXVirtualKeyboardService;
begin
 if Key = vkHardwareBack then
 begin
   if TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService, IInterface(KeyboardService)) then
    KeyboardService.HideVirtualKeyboard;
   key := 0;
 end;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
var
    AppEvent : IFMXApplicationEventService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXApplicationEventService, IInterface(AppEvent)) then
      AppEvent.SetApplicationEventHandler(AppEventProc);

  if dmSync= nil then
   dmSync := TdmSync.Create(Self);

  if dmUpdate= nil then
   dmUpdate := TdmUpdate.Create(Self);

  layLoginAnimaiton.Opacity     := 0;
  tbPrincipal.TabPosition       := TTabPosition.None;
  tbPrincipal.ActiveTab         := tbiLogin;
  edtUsuario.SetFocus;
  Animation.Start;
  layMnuPrincipal.Opacity       :=0;
  lblVersao.Text                := GetVersaoArq;
  lblVersao2.Text               := GetVersaoArq;

  dmDB.qryConfig.Close;
  dmDB.qryConfig.Open;
  lblTipoDB.Text := dmDB.qryConfigTipoDB.Asstring;
  vTipoDb        := dmDB.qryConfigTipoDB.Asstring;

  TreeExAgricultura.Visible  := dmDB.qryConfigTIPODB.AsString='AGRICULTURA';
  TreeArmazem.Visible        := dmDB.qryConfigTIPODB.AsString='AGRICULTURA';
  laySyncTalhoes.Visible     := dmDB.qryConfigTIPODB.AsString='AGRICULTURA';
  laySyncReceituario.Visible := dmDB.qryConfigTIPODB.AsString='AGRICULTURA';

  if dmDB.qryConfigTIPODB.AsString='PECUARIA' then
  begin
   TreeMaquinas.IsExpanded := true;
  end;

  if dmDB.qryConfigSalvarLogin.AsInteger=1 then
    chkSalvaSenha.IsChecked := true
  else
    chkSalvaSenha.IsChecked := false;
  tbPrincipal.TabPosition   := TTabPosition.None;
  if dmDB.VerificaTabelaVazia('usuario') then
   begin
     vPrimeiroAcesso        := true;
     dmDB.qryConfig.Edit;
     edtIPServidor.Text     := dmDB.qryConfigIP_SERVIDOR.AsString;
     edtPortaServidor.Text  := dmDB.qryConfigPOTA_SERVIDOR.AsString;
     tbPrincipal.ActiveTab  := tbiConfig;
   end
   else
   begin
     vPrimeiroAcesso           := false;
     tbPrincipal.ActiveTab     := tbiLogin;
     edtUsuario.SetFocus;
     dmDB.ReadAccess;
   end;
end;


function TfrmPrincipal.GetVersaoArq: string;
begin
  Result := 'v2021-11-02';
end;

procedure TfrmPrincipal.Image16Click(Sender: TObject);
begin
 Close;
end;

procedure TfrmPrincipal.Label10Click(Sender: TObject);
begin
 mnuClick(Sender)
end;

procedure TfrmPrincipal.btnVoltarConfigClick(Sender: TObject);
begin
 MudarAba(tbiMenu,sender);
end;

procedure TfrmPrincipal.btnVoltarSyncClick(Sender: TObject);
begin
 MudarAba(tbiMenu,sender);
end;
{$IFDEF ANDROID}
procedure TfrmPrincipal.Vibrar(tempo: Integer);
//var
// vibrar : JVibrator;
begin
//    vibrar := TJVibrator.Wrap((SharedActivityContext.getSystemService(tjcontext.JavaClass.VIBRATOR_SERVICE) as ILocalObject).GetObjectID);
//    vibrar.vibrate(tempo);
end;
{$ENDIF}

procedure TfrmPrincipal.btnEnviaDadosClick(Sender: TObject);
begin
  if dmSync.TestaServidor<>'Erro' THEN
  begin
   dmSync.PostToken;
   Animacao.Start;
   TThread.CreateAnonymousThread(procedure
   begin
    if frmPrincipal.vTipoDb='PECUARIA' then
    begin
      TThread.Synchronize(TThread.CurrentThread, procedure
      begin
       log.Lines.Add('Enviando Abastecimentos');
      end);
      log.Lines.Add(dmSync.PostAbastecimento);

      TThread.Synchronize(TThread.CurrentThread, procedure
      begin
       log.Lines.Add('Enviando Abastecimentos Outros');
      end);
      log.Lines.Add(dmSync.PostAbastecimentoOutros);

      TThread.Synchronize(TThread.CurrentThread, procedure
      begin
       log.Lines.Add('Enviando Movimentação estoque');
      end);

      log.Lines.Add(dmSync.PostMovLocalEstoque);
      TThread.Synchronize(TThread.CurrentThread, procedure
      begin
       log.Lines.Add('Enviando Aux Item Revisao');
      end);

      log.Lines.Add(dmSync.PostItemRevisao);
      TThread.Synchronize(TThread.CurrentThread, procedure
      begin
       log.Lines.Add('Enviando Revisao');
      end);
      log.Lines.Add(dmSync.PostRevisao);
      TThread.Synchronize(TThread.CurrentThread, procedure
      begin
       log.Lines.Add('Enviando Revisao Item');
      end);
      log.Lines.Add(dmSync.PostRevisaoItens);
      TThread.Synchronize(TThread.CurrentThread, procedure
      begin
       log.Lines.Add('Enviando Revisao Servicos');
      end);
      log.Lines.Add(dmSync.PostRevisaoServico);
    end//pecuaria
    else
    begin
      TThread.Synchronize(TThread.CurrentThread, procedure
      begin
       log.Lines.Add('Enviando Receituario');
      end);
      log.Lines.Add(dmSync.PostReceituario);

      TThread.Synchronize(TThread.CurrentThread, procedure
      begin
       log.Lines.Add('Enviando Operaçoes');
      end);
      dmSync.PostOperacaoSafraAplSolidos;

      TThread.Synchronize(TThread.CurrentThread, procedure
      begin
       log.Lines.Add('Enviando Stand Plantas');
      end);
      log.Lines.Add(dmSync.PostStandPlantas);

      TThread.Synchronize(TThread.CurrentThread, procedure
      begin
       log.Lines.Add('Enviando Pluviometria');
      end);
      log.Lines.Add(dmSync.PostPluviometria);

      TThread.Synchronize(TThread.CurrentThread, procedure
      begin
       log.Lines.Add('Enviando Abastecimentos');
      end);
      log.Lines.Add(dmSync.PostAbastecimento);

      TThread.Synchronize(TThread.CurrentThread, procedure
      begin
       log.Lines.Add('Enviando Abastecimentos Outros');
      end);
      log.Lines.Add(dmSync.PostAbastecimentoOutros);

      log.Lines.Add(dmSync.PostMovLocalEstoque);
      TThread.Synchronize(TThread.CurrentThread, procedure
      begin
       log.Lines.Add('Enviando Aux Item Revisao');
      end);

      log.Lines.Add(dmSync.PostItemRevisao);
      TThread.Synchronize(TThread.CurrentThread, procedure
      begin
       log.Lines.Add('Enviando Revisao');
      end);
      log.Lines.Add(dmSync.PostRevisao);
      TThread.Synchronize(TThread.CurrentThread, procedure
      begin
       log.Lines.Add('Enviando Revisao Item');
      end);
      log.Lines.Add(dmSync.PostRevisaoItens);
      TThread.Synchronize(TThread.CurrentThread, procedure
      begin
       log.Lines.Add('Enviando Revisao Servicos');
      end);
      log.Lines.Add(dmSync.PostRevisaoServico);

      TThread.Synchronize(TThread.CurrentThread, procedure
      begin
       log.Lines.Add('Enviando Movimentação estoque');
      end);
      log.Lines.Add(dmSync.PostMovLocalEstoque);


      TThread.Synchronize(TThread.CurrentThread, procedure
      begin
       log.Lines.Add('Enviando Monitoramento');
      end);
      log.Lines.Add(dmSync.PostMonitoramento);

      TThread.Synchronize(TThread.CurrentThread, procedure
      begin
       log.Lines.Add('Enviando Embarques');
      end);
      log.Lines.Add(dmSync.PostEmbarques);
      log.Lines.Add(dmSync.GetContratos);

      TThread.Synchronize(TThread.CurrentThread, procedure
      begin
        if dmDB.vAgronomo='1' then
        begin
         RecReceituarioPendente.Visible := dmDB.vAgronomo='1';
         dmSync.TSyncReceituario.Close;
         dmSync.TSyncReceituario.Open();
         lblRecPendente.Text := 'Receituarios Pendentes :'+
         intToStr(dmSync.TSyncReceituario.RecordCount);
        end;
      end);
    end;//Agricultura
    TThread.Synchronize(TThread.CurrentThread, procedure
    begin
      MessageDlg('Dados Enviados com Sucesso, sistema deve ser reiniciado',
      System.UITypes.TMsgDlgType.mtInformation,
      [System.UITypes.TMsgDlgBtn.mbYes], 0,
      procedure(const AResult: System.UITypes.TModalResult)
      begin
       case AResult of
        mrYES:
        begin
         Application.Terminate;
        end;
       end;
      end);
    end);
   end).Start;
  end
  else
  begin
    myShowMenssagem('Erro ao se conectar com servidor!');
    Animacao.Stop;
  end;
end;

procedure TfrmPrincipal.chkBaixaMaquinasClick(Sender: TObject);
begin
  if chkBaixaMaquinas.Text='' then
   chkBaixaMaquinas.Text :='X'
  else
   chkBaixaMaquinas.Text :='';
end;

procedure TfrmPrincipal.chkBaixaProdutosClick(Sender: TObject);
begin
 if chkBaixaProdutos.Text='' then
   chkBaixaProdutos.Text :='X'
  else
   chkBaixaProdutos.Text :='';
end;

procedure TfrmPrincipal.chkBaixaReceituarioClick(Sender: TObject);
begin
  if chkBaixaReceituario.Text='' then
   chkBaixaReceituario.Text :='X'
  else
   chkBaixaReceituario.Text :='';
end;

procedure TfrmPrincipal.chkBaixaRevisoesClick(Sender: TObject);
begin
 if chkBaixaRevisoes.Text='' then
   chkBaixaRevisoes.Text :='X'
 else
   chkBaixaRevisoes.Text :='';
end;

procedure TfrmPrincipal.chkBaixaTalhoesClick(Sender: TObject);
begin
 if chkBaixaTalhoes.Text='' then
   chkBaixaTalhoes.Text :='X'
  else
   chkBaixaTalhoes.Text :='';
end;

{$IFDEF ANDROID}
procedure TfrmPrincipal.DoServiceConnectionChange(Sender: TObject;
  PushChanges: TPushService.TChanges);
begin
  if TPushService.TChange.DeviceToken in PushChanges then
    device_token := PushService.DeviceTokenValue[TPushService.TDeviceTokenNames.DeviceToken];

end;
{$ENDIF}
function TfrmPrincipal.EnviaToken(msg: string): string;
begin

end;

procedure TfrmPrincipal.mnuClick(Sender: TObject);
begin
 if layMnu.Opacity>0 then
  layMnu.Opacity:=0
 else
  AnimacaoMnu.Start;
end;

procedure TfrmPrincipal.MudarAba(ATabItem: TTabItem; sender: TObject);
begin
   actMudarAba.Tab := ATabItem;
   actMudarAba.ExecuteTarget(sender);
end;

end.
