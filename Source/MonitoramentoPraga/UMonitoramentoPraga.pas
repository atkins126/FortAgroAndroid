unit UMonitoramentoPraga;

interface

uses
 System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Controls.Presentation, FMX.Objects, FMX.TabControl, FMX.Layouts,
  FMX.TreeView, FMX.MultiView, System.Actions, FMX.ActnList, FMX.Ani,
  FMX.Effects, FMX.Filter.Effects, System.Rtti, FMX.Grid.Style, FMX.ScrollBox,
  FMX.Grid, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.DBScope, FMX.ListBox, FMX.DateTimeCtrls,
  System.Bluetooth, System.Bluetooth.Components,System.Threading,FireDAC.Comp.Client,
  FMX.EditBox, FMX.SpinBox, FMX.Memo,IdHTTP,System.Json.writers,System.Json.Readers,System.JSON.Types,
  Rest.Json,System.JSON, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, Data.Bind.ObjectScope,
  REST.Client, IPPeerClient,REST.Types,FMX.VirtualKeyboard,FMX.Platform,
  IdHashMessageDigest,System.ImageList,
  FMX.ImgList, FMX.Media, System.Sensors, System.Sensors.Components,
  FMX.NumberBox, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, FMX.Gestures,u99Permissions
  {$IF DEFINED(iOS) or DEFINED(ANDROID)}
   ,Androidapi.JNI.Os, Androidapi.Helpers,
   Androidapi.JNI.GraphicsContentViewText,System.Permissions,FMX.DialogService
   {$ENDIF}
  ;

type
  TfrmMonitoramento = class(TForm)
    LocationSensor1: TLocationSensor;
    actAcoes: TActionList;
    actMudarAba: TChangeTabAction;
    AcMudarAbaChart: TAction;
    AcMudarAbaDespesas: TAction;
    AcLeft: TAction;
    AcRigth: TAction;
    tbPrincipal: TTabControl;
    tbiLista: TTabItem;
    tbiCad: TTabItem;
    Rectangle11: TRectangle;
    Rectangle12: TRectangle;
    Layout6: TLayout;
    Layout22: TLayout;
    btnAddPraga: TButton;
    Image4: TImage;
    Label16: TLabel;
    Button3: TButton;
    Image6: TImage;
    Label17: TLabel;
    Layout32: TLayout;
    Rectangle23: TRectangle;
    Label29: TLabel;
    Rectangle19: TRectangle;
    Layout17: TLayout;
    Rectangle15: TRectangle;
    Layout7: TLayout;
    Layout8: TLayout;
    Label19: TLabel;
    edtDataPonto: TDateEdit;
    Layout1: TLayout;
    edtLatitude: TEdit;
    edtLongitude: TEdit;
    Label18: TLabel;
    lblLongitude: TLabel;
    recPrincipal: TRectangle;
    Layout5: TLayout;
    btnNovo: TRectangle;
    Image9: TImage;
    Label7: TLabel;
    btnVoltar1: TRectangle;
    Image31: TImage;
    Label4: TLabel;
    GroupBox2: TGroupBox;
    Layout2: TLayout;
    Layout3: TLayout;
    Layout4: TLayout;
    edtDataF: TDateEdit;
    Label1: TLabel;
    Layout9: TLayout;
    Label9: TLabel;
    edtTalhaoF: TEdit;
    btnBuscar: TSpeedButton;
    Image12: TImage;
    ToolBar2: TToolBar;
    Layout10: TLayout;
    Lista: TListView;
    btnExcluiItem: TRectangle;
    Image1: TImage;
    lblExcluir: TLabel;
    layNovoMonitoramento: TLayout;
    Rectangle1: TRectangle;
    Layout11: TLayout;
    Rectangle2: TRectangle;
    Layout12: TLayout;
    Label2: TLabel;
    edtTalhao: TEdit;
    btnBuscarTalhao: TEditButton;
    btnLerQr: TEditButton;
    Image5: TImage;
    Layout14: TLayout;
    Rectangle7: TRectangle;
    Layout15: TLayout;
    Label10: TLabel;
    Label3: TLabel;
    edtDataNovoMonit: TDateEdit;
    edtHoraInicio: TTimeEdit;
    Layout13: TLayout;
    btnConfinaNovoMonitoramento: TRectangle;
    Image2: TImage;
    btnConfirmarNovoMoni: TLabel;
    bntVoltaNovoMonitoramento: TRectangle;
    Image3: TImage;
    Label6: TLabel;
    laymsg: TLayout;
    RecStatusAcao: TRectangle;
    layBaseMSG: TLayout;
    Layout23: TLayout;
    Layout24: TLayout;
    Layout25: TLayout;
    ShadowEffect14: TShadowEffect;
    layBtnControls: TLayout;
    SEffectBtnConfirm1: TShadowEffect;
    btnConfirmar: TRectangle;
    layBntConfirm: TLayout;
    imgBntConfirm: TImage;
    lblBtnConfirm: TLabel;
    SEffectBtnConfirm: TShadowEffect;
    btnCancel: TRectangle;
    layBtnCancel: TLayout;
    ImgBtnCancel: TImage;
    lblBtnCancel: TLabel;
    SEffectBtnCancel: TShadowEffect;
    lblmsg: TLabel;
    Image8: TImage;
    TimerMsg: TTimer;
    GestureManager1: TGestureManager;
    tbiListaPontos: TTabItem;
    Rectangle3: TRectangle;
    Layout16: TLayout;
    btnNovoForn: TRectangle;
    Image7: TImage;
    Label5: TLabel;
    Rectangle4: TRectangle;
    Image10: TImage;
    Label8: TLabel;
    ToolBar1: TToolBar;
    Layout29: TLayout;
    ListaPontos: TListView;
    recTop: TRectangle;
    Label14: TLabel;
    recTopListapontos: TRectangle;
    Label20: TLabel;
    Layout18: TLayout;
    lblCountPontos: TLabel;
    btnExcluiPontos: TRectangle;
    Image11: TImage;
    Label11: TLabel;
    tbiListaPraga: TTabItem;
    RecPrincipalPragas: TRectangle;
    Layout26: TLayout;
    btnNovaPraga: TRectangle;
    Image13: TImage;
    Label12: TLabel;
    btnVoltarPraga: TRectangle;
    Image14: TImage;
    Label13: TLabel;
    ToolBar3: TToolBar;
    Layout27: TLayout;
    listaPraga: TListView;
    btnExcluirPraga: TRectangle;
    Image15: TImage;
    Label21: TLabel;
    Layout28: TLayout;
    lblCountPontosValores: TLabel;
    Rectangle10: TRectangle;
    Label23: TLabel;
    Layout30: TLayout;
    lblPonto: TLabel;
    laynovapraga: TLayout;
    Rectangle6: TRectangle;
    Rectangle18: TRectangle;
    Layout21: TLayout;
    Label15: TLabel;
    edtPraga: TEdit;
    EditButton1: TEditButton;
    Rectangle17: TRectangle;
    Layout19: TLayout;
    Layout20: TLayout;
    lblContagem: TLabel;
    edtContagem: TNumberBox;
    Layout31: TLayout;
    Rectangle8: TRectangle;
    Image16: TImage;
    Label22: TLabel;
    Rectangle9: TRectangle;
    Image17: TImage;
    Label24: TLabel;
    Rectangle5: TRectangle;
    Layout33: TLayout;
    Layout34: TLayout;
    Label25: TLabel;
    cbxCaracteristica: TComboBox;
    edtTab: TEdit;
    procedure FormCreate(Sender: TObject);
    {$IFDEF ANDROID}
    procedure LocationSensor1LocationChanged(Sender: TObject; const OldLocation,
      NewLocation: TLocationCoord2D);
    {$ENDIF}
    procedure btnNovoClick(Sender: TObject);
    procedure btnBuscarTalhaoClick(Sender: TObject);
    {$IFDEF ANDROID}
    procedure btnLerQrClick(Sender: TObject);
     {$ENDIF}
    procedure FormShow(Sender: TObject);
    procedure bntVoltaNovoMonitoramentoClick(Sender: TObject);
    procedure btnConfinaNovoMonitoramentoClick(Sender: TObject);
    procedure TimerMsgTimer(Sender: TObject);
    procedure EditButton1Click(Sender: TObject);
    procedure ListaItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure ListaUpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
    procedure ListaPontosItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure btnNovoFornClick(Sender: TObject);
    procedure btnAddPragaClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Rectangle4Click(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnVoltar1Click(Sender: TObject);
    procedure ListaPontosUpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
    procedure ListaGesture(Sender: TObject; const EventInfo: TGestureEventInfo;
      var Handled: Boolean);
    procedure edtTalhaoFClick(Sender: TObject);
    procedure edtDataFChange(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnExcluiItemClick(Sender: TObject);
    procedure ListaPontosGesture(Sender: TObject;
      const EventInfo: TGestureEventInfo; var Handled: Boolean);
    procedure btnExcluiPontosClick(Sender: TObject);
    procedure ListaPontosItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure Rectangle9Click(Sender: TObject);
    procedure btnNovaPragaClick(Sender: TObject);
    procedure Rectangle8Click(Sender: TObject);
    procedure btnExcluirPragaClick(Sender: TObject);
    procedure listaPragaItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure listaPragaItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure listaPragaGesture(Sender: TObject;
      const EventInfo: TGestureEventInfo; var Handled: Boolean);
    procedure btnVoltarPragaClick(Sender: TObject);
  private
     vIdTalhao,vIdPraga,vIdMonitoramento,vStatus,vIdPonto,vNomePonto,
     vFlagSync,vIdPragaLista,vTagIni,vTagFim:string;
     Elapsed,vTipoAbertura,vNovoPonto,vFlagEnd: integer;

    permissao : T99Permissions;
    FImageStream: TStringStream;
    PermissaoCamera, PermissaoReadStorage, PermissaoWriteStorage : string;

    {$IFDEF ANDROID}
     ClipService: IFMXClipboardService;
     Location: TLocationCoord2D;
     FGeocoder: TGeocoder;
     Access_Fine_Location, Access_Coarse_Location : string;
     procedure DisplayRationale(Sender: TObject;
              const APermissions: TArray<string>; const APostRationaleProc: TProc);
     procedure LocationPermissionRequestResult
                (Sender: TObject; const APermissions: TArray<string>;
                const AGrantResults: TArray<TPermissionStatus>);

    {$ENDIF}
    procedure MudarAba(ATabItem: TTabItem; sender: TObject);
    procedure geraLista(Filtro:string);
    procedure geraListaPontos(vIdMonit:string);
    procedure geraListaPontosValores(vIdPonto: string);
    procedure LimpaCampos;
    procedure MyShowMessage(msg: string; btnCancel: Boolean;Alert:integer);
  public
    { Public declarations }
  end;

var
  frmMonitoramento: TfrmMonitoramento;

implementation

{$R *.fmx}

uses UPrincipal, UDataContext, UTalhoes, UDataFunctions, Umsg, UPragas,
  UDataSync, UnitCamera;

procedure TfrmMonitoramento.bntVoltaNovoMonitoramentoClick(Sender: TObject);
begin
 vFlagEnd                     :=0;
 recPrincipal.Enabled         := true;
 layNovoMonitoramento.Visible := false;
end;

procedure TfrmMonitoramento.btnAddPragaClick(Sender: TObject);
begin
  if edtLatitude.Text.Length=0 then
  begin
   MyShowMessage('Aguarde obtendo localização!!',false,1);
   Exit;
  end;
  LocationSensor1.Active := false;
  dmDB.TMonitoramentoPontosPonto.AsString := vNomePonto;
  dmDB.TMonitoramentoPontosidMonitoramento.AsString  := vIdMonitoramento;
  dmDB.TMonitoramentoPontosdataPonto.AsDateTime      := edtDataPonto.DateTime;
  if edtLatitude.Text.Length>0 then
   dmDB.TMonitoramentoPontoslatitude.AsString        := edtLatitude.Text;
  if edtLongitude.Text.Length>0 then
   dmDB.TMonitoramentoPontoslongitude.AsString       := edtLongitude.Text;
  try
    dmDB.TMonitoramentoPontos.ApplyUpdates(-1);
    MyShowMessage('Novo ponto adicionado com sucesso!!',false,1);
    geraListaPontos(vIdMonitoramento);
    vNomePonto :='';
    MudarAba(tbiListaPontos,sender);
  except
  on E : Exception do
   myShowMessage('Erro ao inserir Ponto Monitoramento : '+E.Message,false,1);
  end;
end;

procedure TfrmMonitoramento.btnBuscarClick(Sender: TObject);
begin
 btnExcluiItem.Visible :=false;
end;

procedure TfrmMonitoramento.btnBuscarTalhaoClick(Sender: TObject);
begin
 vTipoAbertura :=0;
 frmTalhoes := TfrmTalhoes.Create(Self);
  try
    frmTalhoes.ShowModal(
    procedure(ModalResult: TModalResult)
    begin
      edtTalhao.Text    := dmDB.vNomeTalhao;
      vIdTalhao         := dmDB.vIdTalhao;
    end);
  finally
    frmTalhoes.free;
  end;
end;

procedure TfrmMonitoramento.btnConfinaNovoMonitoramentoClick(Sender: TObject);
var
 vTagCompara,vTag2Compara:string;
begin
 if edtTalhao.Text.Length =0 then
 begin
   myShowMessage('Informe o Talhao',false,1);
   Exit;
 end;
 if vFlagEnd=1 then
 begin
   dmDB.TMonitoramento.Close;
   dmDB.TMonitoramento.Open;
   dmDB.TMonitoramento.Filtered := false;
   dmDB.TMonitoramento.Filter   := 'id='+vIdMonitoramento;
   dmDB.TMonitoramento.Filtered := true;
   dmDB.TMonitoramento.edit;
   dmDB.TMonitoramentohoraFim.AsDateTime           := now;
   dmDB.TMonitoramentostatus.AsInteger             :=2;
   if (vTagFim.Length>0) then
   begin
    vTagCompara :='';
    vTagCompara := stringReplace(dmDB.TMonitoramentoTagAbertura.AsString,'?','',[rfReplaceAll]);
    vTagCompara := copy(vTagCompara,pos('*',vTagCompara),vTagCompara.Length);
    vTag2Compara:= copy(vTagFim,pos('*',vTagFim),vTagFim.Length);
     if(vTagCompara=vTag2Compara) then
     begin
       myShowMessage('QrCode Final nao pode ser o mesmo Inicial',false,1);
       Exit;
     end;
     dmDB.TMonitoramentoTagFechamento.AsString      := vTagFim;
     if not dmDB.VerificaTalhaoFechamento(vIdMonitoramento,vIdTalhao)then
     begin
       myShowMessage('Talhao Diferente impossivel finalizar monitoramento!',false,1);
       Exit;
     end;
   end;
   try
    dmDB.TMonitoramento.ApplyUpdates(-1);
    geraLista('');
    layNovoMonitoramento.Visible := false;
    myShowMessage('Monitoramento Finalizado com sucesso',false,1);
   except
    on E : Exception do
     myShowMessage('Erro ao inserir Monitoramento : '+E.Message,false,1);
   end;
   recPrincipal.Enabled         := true;
 end
 else
 begin
   dmDB.TMonitoramento.Close;
   dmDB.TMonitoramento.Open;
   dmDB.TMonitoramento.Insert;
   dmDB.TMonitoramentoidusuario.AsString           := dmDB.vIdUser;
   dmDB.TMonitoramentoidTalhao.AsString            := vIdTalhao;
   dmDB.TMonitoramentotipoAbertura.AsInteger       := vTipoAbertura;
   dmDB.TMonitoramentodataMonitoramento.AsDateTime := edtDataNovoMonit.DateTime;
   dmDB.TMonitoramentohoraInicio.AsDateTime        := edtHoraInicio.DateTime;
   if (vFlagEnd=0) and (vTagIni.Length>0) then
    dmDB.TMonitoramentotagAbertura.AsString        := vTagIni;
   try
    dmDB.TMonitoramento.ApplyUpdates(-1);
    geraLista('');
    layNovoMonitoramento.Visible := false;
    myShowMessage('Monitoramento cadastrado com sucesso',false,1);
   except
    on E : Exception do
     myShowMessage('Erro ao inserir Monitoramento : '+E.Message,false,1);
   end;
   recPrincipal.Enabled         := true;
 end;
 vFlagEnd                       :=0;
end;

procedure TfrmMonitoramento.btnConfirmarClick(Sender: TObject);
begin
 laymsg.Visible   := false;
 TimerMsg.Enabled := false;
end;

procedure TfrmMonitoramento.btnExcluiPontosClick(Sender: TObject);
begin
 if vFlagSync='0' then
 begin
   MessageDlg('Deseja Realmente Deletar esse registro?', System.UITypes.TMsgDlgType.mtInformation,
  [System.UITypes.TMsgDlgBtn.mbYes,
  System.UITypes.TMsgDlgBtn.mbNo
  ], 0,
   procedure(const AResult: System.UITypes.TModalResult)
    begin
     case AResult of
     mrYES:
      begin
        dmSync.DeletaMonitoramentoPonto(vIDPonto,vNomePonto);
        geraListaPontos(vIdMonitoramento);
        btnExcluiPontos.Visible := false;
      end;
     end;
   end);
 end
 else
 begin
   ShowMessage('Monitoramento ja sincronizado!!');
   btnExcluiPontos.Visible := false;
 end;
end;

procedure TfrmMonitoramento.btnExcluirPragaClick(Sender: TObject);
begin
 if vFlagSync='0' then
 begin
   MessageDlg('Deseja Realmente Deletar esse registro?', System.UITypes.TMsgDlgType.mtInformation,
  [System.UITypes.TMsgDlgBtn.mbYes,
  System.UITypes.TMsgDlgBtn.mbNo
  ], 0,
   procedure(const AResult: System.UITypes.TModalResult)
    begin
     case AResult of
     mrYES:
      begin
        dmSync.DeletaTabelaPraga(vIdPragaLista);
        geraListaPontosValores(vIdMonitoramento);
        btnExcluirPraga.Visible := false;
      end;
     end;
   end);
 end
 else
 begin
   ShowMessage('Monitoramento ja sincronizado!!');
   btnExcluiPontos.Visible := false;
 end;
end;

procedure TfrmMonitoramento.btnExcluiItemClick(Sender: TObject);
begin
 if vFlagSync='0' then
 begin
   MessageDlg('Deseja Realmente Deletar esse registro?', System.UITypes.TMsgDlgType.mtInformation,
  [System.UITypes.TMsgDlgBtn.mbYes,
  System.UITypes.TMsgDlgBtn.mbNo
  ], 0,
   procedure(const AResult: System.UITypes.TModalResult)
    begin
     case AResult of
     mrYES:
      begin
        dmSync.DeletaMonitoramento(vIdMonitoramento);
        GeraLista('');
        btnExcluiItem.Visible := false;
      end;
     end;
   end);
 end
 else
 begin
   ShowMessage('Monitoramento ja sincronizado!!');
   btnExcluiItem.Visible := false;
 end;
end;
{$IFDEF ANDROID}
procedure TfrmMonitoramento.btnLerQrClick(Sender: TObject);
var
 vCodigo :string;
begin
  FrmCamera:= TFrmCamera.Create(nil);
  FrmCamera.ShowModal(procedure(ModalResult: TModalResult)
  begin
    if ModalResult = 0 then
    begin
     vCodigo        := FrmCamera.codigo;
     vIdTalhao      := dmFunctions.RetornaIdTalhao(vCodigo);
     edtTalhao.Text := vCodigo;
     if (vIdTalhao.Length=0) then
     begin
       ShowMessage('Talhão Não Encontrado');
       edtTalhao.Text :='';
       Exit;
     end;
    end
  end);
end;
{$ENDIF}
procedure TfrmMonitoramento.btnNovaPragaClick(Sender: TObject);
begin
 RecPrincipalPragas.Enabled  :=false;
 edtPraga.Text               :='';
 cbxCaracteristica.ItemIndex :=-1;
 edtContagem.Value           :=0;
 dmDB.TMonitPontosValoresInsert.Close;
 dmDB.TMonitPontosValoresInsert.Open;
 dmDB.TMonitPontosValoresInsert.Insert;
 laynovapraga.Visible := true;
end;

procedure TfrmMonitoramento.btnNovoClick(Sender: TObject);
begin
  recPrincipal.Enabled := false;
  LimpaCampos;
  dmDB.TMonitoramento.Close;
  dmDB.TMonitoramento.Open;
  layNovoMonitoramento.Visible := true;
end;

procedure TfrmMonitoramento.btnNovoFornClick(Sender: TObject);
begin
 MessageDlg('Deseja Realmente Adicionar um novo ponto?', System.UITypes.TMsgDlgType.mtInformation,
  [System.UITypes.TMsgDlgBtn.mbYes,
  System.UITypes.TMsgDlgBtn.mbNo
  ], 0,
 procedure(const AResult: System.UITypes.TModalResult)
  var
   vCount:integer;
  begin
   case AResult of
   mrYES:
    begin
      vNomePonto :=dmDB.RetornaNomePonto(vIdMonitoramento);
      LimpaCampos;
      {$IFDEF ANDROID}
      PermissionsService.RequestPermissions([Access_Coarse_Location,
       Access_Fine_Location],
       LocationPermissionRequestResult,
       DisplayRationale);
       {$ENDIF}
      dmDB.TMonitoramentoPontos.Insert;
      MudarAba(tbiCad,sender);
    end;
   end;
 end);
end;

procedure TfrmMonitoramento.btnVoltar1Click(Sender: TObject);
begin
 Close;
end;

procedure TfrmMonitoramento.btnVoltarPragaClick(Sender: TObject);
begin
  MudarAba(tbiListaPontos,sender);
end;

procedure TfrmMonitoramento.Button3Click(Sender: TObject);
begin
 MudarAba(tbiListaPontos,sender);
end;

{$IFDEF ANDROID}
procedure TfrmMonitoramento.DisplayRationale(Sender: TObject;
  const APermissions: TArray<string>; const APostRationaleProc: TProc);
var
  I: Integer;
  RationaleMsg: string;
begin
  for I := 0 to High(APermissions) do
  begin
    if (APermissions[I] = Access_Coarse_Location) or (APermissions[I] = Access_Fine_Location) then
      RationaleMsg := 'O app precisa de acesso ao GPS para obter sua localização'
  end;
  TDialogService.ShowMessage(RationaleMsg,
    procedure(const AResult: TModalResult)
    begin
      APostRationaleProc;
    end)
end;
 {$ENDIF}
procedure TfrmMonitoramento.EditButton1Click(Sender: TObject);
begin
  frmPragas := TfrmPragas.Create(Self);
  try
    frmPragas.ShowModal(
    procedure(ModalResult: TModalResult)
    begin
      edtPraga.Text    := dmDB.vNomePraga;
      vIdPraga         := dmDB.vIdPraga;
    end);
  finally
    frmPragas.free;
  end;
end;

procedure TfrmMonitoramento.edtDataFChange(Sender: TObject);
begin
 btnExcluiItem.Visible :=false;
end;

procedure TfrmMonitoramento.edtTalhaoFClick(Sender: TObject);
begin
 btnExcluiItem.Visible :=false;
end;

procedure TfrmMonitoramento.FormCreate(Sender: TObject);
begin
  {$IFDEF ANDROID}
   PermissaoCamera := JStringToString(TJManifest_permission.JavaClass.CAMERA);
   PermissaoReadStorage := JStringToString(TJManifest_permission.JavaClass.READ_EXTERNAL_STORAGE);
   PermissaoWriteStorage := JStringToString(TJManifest_permission.JavaClass.WRITE_EXTERNAL_STORAGE);
   if not TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, IInterface(ClipService)) then
    ClipService := nil;
  Elapsed := 0;
 {$ENDIF}
 tbPrincipal.ActiveTab   :=  tbiLista;
 tbPrincipal.TabPosition :=  TTabPosition.None;
 edtDataF.Date           :=  date ;
 btnExcluiItem.Visible := false;
end;

procedure TfrmMonitoramento.FormShow(Sender: TObject);
begin
 btnExcluiPontos.Visible := false;
 permissao               := T99Permissions.Create;
 {$IFDEF ANDROID}
  Access_Coarse_Location := JStringToString(TJManifest_permission.JavaClass.ACCESS_COARSE_LOCATION);
  Access_Fine_Location := JStringToString(TJManifest_permission.JavaClass.ACCESS_FINE_LOCATION);
 {$ENDIF}
 if NOT permissao.VerifyCameraAccess then
   permissao.Camera(nil, nil)
 else
 begin
  laynovapraga.Visible         := false;
  btnExcluirPraga.Visible      := false;
  laynovapraga.Width           := frmPrincipal.Width-20;
  layNovoMonitoramento.Width   := frmPrincipal.Width-20;
  btnExcluiPontos.Visible      := false;
  GeraLista('');
  layNovoMonitoramento.Visible := false;
 end;
end;

procedure TfrmMonitoramento.geraLista(Filtro: string);
var
 item   : TListViewItem;
 txt    : TListItemText;
 txtH   : TListItemPurpose;
 img    : TListItemImage;
 vStatus:string;
begin
 dmDB.AbrirMonitoramento(Filtro);
 dmDB.TMonitoramento.First;
 Lista.Items.Clear;
 while not dmDB.TMonitoramento.eof do
 begin
   item := Lista.Items.Add;
   with frmMonitoramento do
   begin
     with item  do
     begin
       txt      := TListItemText(Objects.FindDrawable('Text3'));
       txt.Text := dmDB.TMonitoramentoTalhao.AsString;
       txt.TagString := dmDB.TMonitoramentoid.AsString;

       txt      := TListItemText(Objects.FindDrawable('Text5'));
       txt.Text := 'Data: ';

       txt      := TListItemText(Objects.FindDrawable('Text4'));
       txt.Text := 'Hora: ';

       txt      := TListItemText(Objects.FindDrawable('Text8'));
       txt.Text := 'Status: ';

       txt      := TListItemText(Objects.FindDrawable('Text16'));
       txt.Text := 'Pontos';

       txt      := TListItemText(Objects.FindDrawable('Text6'));
       txt.Text := dmDB.TMonitoramentodataMonitoramento.AsString;
       txt.TagString := dmDB.TMonitoramentosyncfaz.AsString;

       txt      := TListItemText(Objects.FindDrawable('Text7'));
       txt.Text := FormatDateTime('hh:mm:ss',dmDB.TMonitoramentohoraInicio.AsDateTime);


       txt      := TListItemText(Objects.FindDrawable('Text9'));
       if dmDB.TMonitoramentostatus.AsInteger=1  then
        txt.Text := 'Aberta'
       else
       if (dmDB.TMonitoramentostatus.AsInteger=2) and (dmDB.TMonitoramentosyncfaz.AsInteger=0)  then
        txt.Text := 'Finalizada e Não Sincronizada';
       if (dmDB.TMonitoramentostatus.AsInteger=2) and (dmDB.TMonitoramentosyncfaz.AsInteger=1) then
        txt.Text := 'Finalizada e Sincronizada';
       txt.TagString := dmDB.TMonitoramentostatus.AsString;

       img := TListItemImage(Objects.FindDrawable('Image11'));
       img.Bitmap     := frmPrincipal.imgPontosGPS.Bitmap;

       img := TListItemImage(Objects.FindDrawable('Image10'));
       img.Bitmap     := frmPrincipal.imgPragas.Bitmap;

       if dmDB.TMonitoramentostatus.AsInteger=1 then
       begin
         txt      := TListItemText(Objects.FindDrawable('Text10'));
         txt.Text := 'Finzalizar';
         img := TListItemImage(Objects.FindDrawable('Image17'));
         img.Bitmap     := frmPrincipal.imgFinalizaMonit.Bitmap;
       end;

     end;
     dmDB.TMonitoramento.Next;
   end;
 end;
end;

procedure TfrmMonitoramento.geraListaPontos(vIdMonit: string);
var
 item   : TListViewItem;
 txt    : TListItemText;
 txtH   : TListItemPurpose;
 img    : TListItemImage;
 vStatus:string;
begin
 dmDB.AbrirMonitoramentoPontos(vIdMonit);
 dmDB.TMonitoramentoPontos.First;
 ListaPontos.Items.Clear;
 while not dmDB.TMonitoramentoPontos.eof do
 begin
   item := ListaPontos.Items.Add;
   with frmMonitoramento do
   begin
     with item  do
     begin
       txt      := TListItemText(Objects.FindDrawable('Text3'));
       txt.Text := dmDB.TMonitoramentoPontosPonto.AsString;
       txt.TagString := dmDB.TMonitoramentoPontosid.AsString;

       txt      := TListItemText(Objects.FindDrawable('Text4'));
       txt.Text := 'Hora:';
       txt      := TListItemText(Objects.FindDrawable('Text7'));
       txt.Text := dmDB.TMonitoramentoPontoshora.AsString;

       txt      := TListItemText(Objects.FindDrawable('Text8'));
       txt.Text := 'Latitude: ';
       txt      := TListItemText(Objects.FindDrawable('Text9'));
       txt.Text := dmDB.TMonitoramentoPontoslatitude.AsString;


       txt      := TListItemText(Objects.FindDrawable('Text5'));
       txt.Text := 'Longitude: ';
       txt      := TListItemText(Objects.FindDrawable('Text6'));
       txt.Text := dmDB.TMonitoramentoPontoslongitude.AsString;

       img := TListItemImage(Objects.FindDrawable('Image14'));
       img.Bitmap     := frmPrincipal.imgPontosGPS.Bitmap;

       txt      := TListItemText(Objects.FindDrawable('Text10'));
       txt.Text := 'Pragas';
       img := TListItemImage(Objects.FindDrawable('Image13'));
       img.Bitmap     := frmPrincipal.imgPragaLista.Bitmap;


     end;
     dmDB.TMonitoramentoPontos.Next;
   end;
 end;
 lblCountPontos.Text := intToStr(ListaPontos.Items.Count)
end;

procedure TfrmMonitoramento.geraListaPontosValores(vIdPonto: string);
var
 item   : TListViewItem;
 txt    : TListItemText;
 txtH   : TListItemPurpose;
 img    : TListItemImage;
 vStatus:string;
begin
 dmDB.AbrirPragasPonto(vIdPonto);
 dmDB.TMonitoramentoPontosValores.First;
 listaPraga.Items.Clear;
 while not dmDB.TMonitoramentoPontosValores.eof do
 begin
   item := listaPraga.Items.Add;
   with frmMonitoramento do
   begin
     with item  do
     begin
       txt           := TListItemText(Objects.FindDrawable('Text3'));
       txt.Text      := dmDB.TMonitoramentoPontosValoresPraga.AsString;
       txt.TagString := dmDB.TMonitoramentoPontosValoresid.AsString;

       txt      := TListItemText(Objects.FindDrawable('Text5'));
       txt.Text := 'Contagem:';
       txt      := TListItemText(Objects.FindDrawable('Text6'));
       txt.Text := dmDB.TMonitoramentoPontosValorescontagem.AsString;

       txt      := TListItemText(Objects.FindDrawable('Text7'));
       txt.Text := dmDB.TMonitoramentoPontosValoresCaracteristicaStr.AsString;

       img := TListItemImage(Objects.FindDrawable('Image14'));
       img.Bitmap     := frmPrincipal.imgPragas.Bitmap;
     end;
     dmDB.TMonitoramentoPontosValores.Next;
   end;
 end;
 lblCountPontosValores.Text := intToStr(listaPraga.Items.Count)
end;

procedure TfrmMonitoramento.LimpaCampos;
begin
 edtTalhao.Text    :='';
 edtLatitude.Text  :='';
 edtLongitude.Text :='';
 edtPraga.Text     :='';
 edtContagem.Value :=0;
end;

procedure TfrmMonitoramento.ListaGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
 btnExcluiItem.Visible :=true;
end;

procedure TfrmMonitoramento.ListaItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
  btnExcluiItem.Visible :=false;
  vStatus   := TAppearanceListViewItem(lista.Selected).Objects.FindObjectT<TListItemText>
   ('Text9').TagString;
  vIdMonitoramento :=TAppearanceListViewItem(lista.Selected).Objects.FindObjectT<TListItemText>
   ('Text3').TagString;
  vFlagSync :=TAppearanceListViewItem(lista.Selected).Objects.FindObjectT<TListItemText>
   ('Text6').TagString;
  if ItemObject is TListItemImage then
  begin
   if TListItemImage(ItemObject).Name='Image11' then
   begin
     btnNovoForn.Enabled   := vStatus='1';
     btnNovaPraga.Enabled  := vStatus='1';
     geraListaPontos(vIdMonitoramento);
     MudarAba(tbiListaPontos,sender);
     Exit;
   end;
   if (TListItemImage(ItemObject).Name='Image17') and (vStatus='1')  then
   begin
      MessageDlg('Deseja Realmente Finalizar esse monitoramento?', System.UITypes.TMsgDlgType.mtInformation,
      [System.UITypes.TMsgDlgBtn.mbYes,
      System.UITypes.TMsgDlgBtn.mbNo
      ], 0,
       procedure(const AResult: System.UITypes.TModalResult)
        begin
         case AResult of
         mrYES:
          begin
            geraListaPontos(vIdMonitoramento);
            if dmDB.TMonitoramentoPontos.IsEmpty then
            begin
              ShowMessage('Informe pelo meno um ponto!');
              Exit;
            end;
            vFlagEnd :=1;
            layNovoMonitoramento.Visible := true;
          end;
         end;
       end);
   end;
  end;
end;

procedure TfrmMonitoramento.ListaPontosGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
   btnExcluiPontos.Visible := true;
end;

procedure TfrmMonitoramento.ListaPontosItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
 btnExcluiPontos.Visible := false;
end;

procedure TfrmMonitoramento.ListaPontosItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
 btnExcluiPontos.Visible := false;
 LimpaCampos;
 vIdPonto  := TAppearanceListViewItem(ListaPontos.Selected).Objects.FindObjectT<TListItemText>
   ('Text3').TagString;
 vNomePonto:= TAppearanceListViewItem(ListaPontos.Selected).Objects.FindObjectT<TListItemText>
   ('Text3').Text;
 if ItemObject is TListItemImage then
  begin
   if TListItemImage(ItemObject).Name='Image13' then
   begin
     geraListaPontosValores(vIdPonto);
     lblPonto.Text :=vNomePonto;
     MudarAba(tbiListaPraga,sender);
     Exit;
   end;
  end;
end;

procedure TfrmMonitoramento.ListaPontosUpdateObjects(const Sender: TObject;
  const AItem: TListViewItem);
var
 img: TListItemImage;
 txt : TListItemText;
begin
 with AItem do
 begin
   img               := TListItemImage(Objects.FindDrawable('Image13'));
   img.PlaceOffset.X := trunc(frmPrincipal.Width-75);

   txt := TListItemText(Objects.FindDrawable('Text10'));
   txt.PlaceOffset.X := trunc(frmPrincipal.Width-75);
 end;
end;

procedure TfrmMonitoramento.listaPragaGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
 btnExcluirPraga.Visible := true;
end;

procedure TfrmMonitoramento.listaPragaItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  btnExcluirPraga.Visible := false;
end;

procedure TfrmMonitoramento.listaPragaItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
 btnExcluirPraga.Visible := false;
 vIdPragaLista  := TAppearanceListViewItem(ListaPontos.Selected).Objects.FindObjectT<TListItemText>
   ('Text3').TagString;
end;

procedure TfrmMonitoramento.ListaUpdateObjects(const Sender: TObject;
  const AItem: TListViewItem);
var
 img: TListItemImage;
 txt : TListItemText;
begin
 with AItem do
 begin
   img               := TListItemImage(Objects.FindDrawable('Image11'));
   img.PlaceOffset.X := trunc(frmPrincipal.Width-(img.Width+5));

   txt := TListItemText(Objects.FindDrawable('Text16'));
   txt.PlaceOffset.X := trunc(frmPrincipal.Width-(img.Width+5));
 end;
end;
{$IFDEF ANDROID}
procedure TfrmMonitoramento.LocationPermissionRequestResult(Sender: TObject;
  const APermissions: TArray<string>;
  const AGrantResults: TArray<TPermissionStatus>);
var
         x : integer;
begin
  if (Length(AGrantResults) = 2) and
    (AGrantResults[0] = TPermissionStatus.Granted) and
    (AGrantResults[1] = TPermissionStatus.Granted) then
  begin
    LocationSensor1.Active := true;
    MudarAba(tbiCad,sender)
  end
  else
  begin
    TDialogService.ShowMessage
      ('Não é possível acessar o GPS porque o app não possui acesso');
    MudarAba(tbiCad,sender);
    edtLatitude.Text  := 'Sem Permissão';
    edtLongitude.Text := 'Sem Permissão';
  end;

end;

procedure TfrmMonitoramento.LocationSensor1LocationChanged(Sender: TObject;
  const OldLocation, NewLocation: TLocationCoord2D);
begin
 TThread.Synchronize(nil,procedure
 begin
   edtLatitude.Text  := Format('%2.6f', [NewLocation.Latitude]);
   edtLongitude.Text := Format('%2.6f', [NewLocation.Longitude]);
 end);
end;

{$ENDIF}

procedure TfrmMonitoramento.MudarAba(ATabItem: TTabItem; sender: TObject);
begin
  actMudarAba.Tab := ATabItem;
  actMudarAba.ExecuteTarget(sender);
end;

procedure TfrmMonitoramento.MyShowMessage(msg: string; btnCancel: Boolean;
  Alert: integer);
var
  KeyboardService: IFMXVirtualKeyboardService;
begin
 if TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService, IInterface(KeyboardService)) then
  KeyboardService.HideVirtualKeyboard;
 lblmsg.Text := msg;
 laymsg.Visible := true;
{$IFDEF ANDROID}
 if Alert=0 then
  frmPrincipal.Vibrar(500)
 else
 begin
   frmPrincipal.Vibrar(500);
   Sleep(250);
   frmPrincipal.Vibrar(500)
 end;
 {$ENDIF}
 TimerMsg.Enabled := true;
end;

procedure TfrmMonitoramento.Rectangle4Click(Sender: TObject);
begin
 btnExcluiPontos.Visible := false;
 MudarAba(tbiLista,sender);
end;

procedure TfrmMonitoramento.Rectangle8Click(Sender: TObject);
begin
 edtTab.SetFocus;
 if edtPraga.Text.Length=0 then
  begin
   MyShowMessage('Informe a Praga!!',false,1);
   edtPraga.SetFocus;
   Exit;
  end;
  if(edtContagem.Value<=0)  then
  begin
   MyShowMessage('Contagem deve ser maior que zero!!',false,1);
   edtContagem.SetFocus;
   Exit;
  end;
  if cbxCaracteristica.ItemIndex=-1 then
  begin
   MyShowMessage('Informe a Caracteristica!!',false,1);
   Exit;
  end;
  dmDB.TMonitPontosValoresInsertidPonto.AsString         := vIdPonto;
  dmDB.TMonitPontosValoresInsertidPraga.AsString         := vIdPraga;
  dmDB.TMonitPontosValoresInserthora.AsDateTime          := now;
  dmDB.TMonitPontosValoresInsertcontagem.AsInteger       := trunc(edtContagem.Value);
  dmDB.TMonitPontosValoresInsertcaracteristica.AsInteger := cbxCaracteristica.ItemIndex;
  try
    dmDB.TMonitPontosValoresInsert.ApplyUpdates(-1);
    MyShowMessage('Nova praga adicionado com sucesso!!',false,1);
    geraListaPontosValores(vIdPonto);
    laynovapraga.Visible := false;
    RecPrincipalPragas.Enabled :=true;
  except
  on E : Exception do
   myShowMessage('Erro ao inserir Praga : '+E.Message,false,1);
  end;
end;

procedure TfrmMonitoramento.Rectangle9Click(Sender: TObject);
begin
 RecPrincipalPragas.Enabled :=true;
 laynovapraga.Visible       := false;
end;

procedure TfrmMonitoramento.TimerMsgTimer(Sender: TObject);
begin
  if RecStatusAcao.Stroke.Color=TAlphaColorRec.White then
  begin
   RecStatusAcao.Stroke.Kind  :=  TBrushKind.Solid;
   RecStatusAcao.Stroke.Color :=  TAlphaColorRec.Red;
  end
  else
  begin
   RecStatusAcao.Stroke.Kind  :=  TBrushKind.Solid;
   RecStatusAcao.Stroke.Color :=  TAlphaColorRec.White;
  end;
end;

end.
