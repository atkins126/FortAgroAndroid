unit UAbastecimento;

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
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.Gestures, FMX.NumberBox, FMX.ListView,u99Permissions,
  FMX.MediaLibrary.Actions, FMX.StdActns
  {$IF DEFINED(iOS) or DEFINED(ANDROID)}
   ,Androidapi.JNI.Os, Androidapi.Helpers,
   Androidapi.JNI.GraphicsContentViewText,System.Permissions,FMX.DialogService
   {$ENDIF}
  ,Soap.EncdDecd;

type
  TfrmAbastecimento = class(TForm)
    layBase: TLayout;
    recPrincipal: TRectangle;
    tbPrincipal: TTabControl;
    tbiLista: TTabItem;
    Rectangle3: TRectangle;
    GroupBox2: TGroupBox;
    Layout1: TLayout;
    Layout2: TLayout;
    Layout4: TLayout;
    edtDataF: TDateEdit;
    Label1: TLabel;
    Layout22: TLayout;
    Label9: TLabel;
    edtMaquinaF: TEdit;
    btnBuscar: TSpeedButton;
    Image12: TImage;
    Layout3: TLayout;
    tbiCad: TTabItem;
    TimerMsg: TTimer;
    layTBICad: TLayout;
    Rectangle1: TRectangle;
    Layout6: TLayout;
    Layout7: TLayout;
    Layout67: TLayout;
    btnVoltar2: TButton;
    Image24: TImage;
    Label61: TLabel;
    btnSalvarGrupo: TButton;
    Image25: TImage;
    Label62: TLabel;
    layBuscaMaquina: TLayout;
    Rectangle2: TRectangle;
    Layout9: TLayout;
    Label2: TLabel;
    edtMaquina: TEdit;
    btnBuscarMaquina: TEditButton;
    Layout12: TLayout;
    Rectangle6: TRectangle;
    Layout13: TLayout;
    Label8: TLabel;
    edtLitros: TNumberBox;
    Layout14: TLayout;
    Rectangle7: TRectangle;
    Layout15: TLayout;
    Label10: TLabel;
    Label3: TLabel;
    edtData: TDateEdit;
    edtHora: TTimeEdit;
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
    Layout31: TLayout;
    Rectangle16: TRectangle;
    btnVoltar: TSpeedButton;
    lblPage: TLabel;
    cbxCombustivel: TComboBox;
    Label5: TLabel;
    Layout10: TLayout;
    Rectangle4: TRectangle;
    Layout11: TLayout;
    Label6: TLabel;
    edtLocalEstoque: TEdit;
    EditButton1: TEditButton;
    Layout16: TLayout;
    Rectangle5: TRectangle;
    Layout17: TLayout;
    Label11: TLabel;
    edtOperador: TEdit;
    EditButton2: TEditButton;
    layHorimetro: TLayout;
    Rectangle8: TRectangle;
    Layout19: TLayout;
    Label12: TLabel;
    edtHorimetro: TNumberBox;
    actAcoes: TActionList;
    actMudarAba: TChangeTabAction;
    AcMudarAbaChart: TAction;
    AcMudarAbaDespesas: TAction;
    AcLeft: TAction;
    AcRigth: TAction;
    GestureManager1: TGestureManager;
    tbiProdutos: TTabItem;
    layListaP: TLayout;
    imgLogoCad: TImage;
    layLista: TLayout;
    layFiltros: TLayout;
    RecGro: TRectangle;
    Label13: TLabel;
    edtNomeFiltro: TEdit;
    ListaProdutos: TListView;
    AnimacaoMnu: TFloatAnimation;
    Layout20: TLayout;
    btnNovoProduto: TRectangle;
    Image2: TImage;
    Label15: TLabel;
    btnVoltarProduto: TRectangle;
    Image3: TImage;
    Label16: TLabel;
    Rectangle11: TRectangle;
    layNewOutros: TLayout;
    Rectangle9: TRectangle;
    ToolBar8: TToolBar;
    Rectangle10: TRectangle;
    Label17: TLabel;
    Layout21: TLayout;
    Layout26: TLayout;
    Rectangle12: TRectangle;
    Layout27: TLayout;
    Layout28: TLayout;
    Label18: TLabel;
    edtOutroProduto: TEdit;
    Layout29: TLayout;
    Rectangle14: TRectangle;
    Layout30: TLayout;
    Layout32: TLayout;
    Label26: TLabel;
    Layout33: TLayout;
    btnConfirmaPluvi: TRectangle;
    Label28: TLabel;
    Image21: TImage;
    Rectangle13: TRectangle;
    Image4: TImage;
    Label19: TLabel;
    EditButton3: TEditButton;
    btnLerQr: TEditButton;
    Image5: TImage;
    Layout34: TLayout;
    edtQtdOutroProduto: TEdit;
    btnExcluiProduto: TRectangle;
    Image6: TImage;
    Label22: TLabel;
    GestureManager2: TGestureManager;
    Layout5: TLayout;
    Layout37: TLayout;
    btnVoltar1: TRectangle;
    Image31: TImage;
    Label4: TLabel;
    Layout38: TLayout;
    btnNovo: TRectangle;
    Image9: TImage;
    Label7: TLabel;
    tbiCadTransferencia: TTabItem;
    recCad: TRectangle;
    AnimacaoCad: TFloatAnimation;
    layCad: TLayout;
    RectCad: TRectangle;
    LaySubCad: TLayout;
    laySubSubCad: TLayout;
    Rsub: TRectangle;
    laySubSubSubCad: TLayout;
    Layout39: TLayout;
    Layout40: TLayout;
    Label24: TLabel;
    Layout41: TLayout;
    Label25: TLabel;
    Layout42: TLayout;
    ComboBox2: TComboBox;
    Layout43: TLayout;
    edtLocalOrigem: TEdit;
    EditButton4: TEditButton;
    laybutons: TLayout;
    Layout45: TLayout;
    Rectangle15: TRectangle;
    Layout46: TLayout;
    Layout47: TLayout;
    Layout48: TLayout;
    Label30: TLabel;
    Layout49: TLayout;
    Label31: TLabel;
    Layout50: TLayout;
    ComboBox1: TComboBox;
    Layout51: TLayout;
    edtLocalDestino: TEdit;
    EditButton5: TEditButton;
    Layout46000000: TLayout;
    Rectangle16000000: TRectangle;
    Layout490000000000000: TLayout;
    Layout47000000000: TLayout;
    Label31000000000: TLabel;
    layCapDadosPasto: TLayout;
    lbll: TLabel;
    Layout48000000000: TLayout;
    cbxCurralPastoGrupo: TComboBox;
    LayValueDadosPasto: TLayout;
    Layout52: TLayout;
    Rectangle17: TRectangle;
    Layout53: TLayout;
    Rectangle18: TRectangle;
    Layout54: TLayout;
    Layout55: TLayout;
    Label33: TLabel;
    Layout56: TLayout;
    Label34: TLabel;
    Label35: TLabel;
    Layout57: TLayout;
    ComboBox3: TComboBox;
    Layout58: TLayout;
    edtDataMov: TDateEdit;
    edtHoraMov: TTimeEdit;
    Layout59: TLayout;
    Rectangle19: TRectangle;
    Layout60: TLayout;
    Rectangle20: TRectangle;
    Layout61: TLayout;
    Layout62: TLayout;
    Label36: TLabel;
    Layout63: TLayout;
    Layout64: TLayout;
    ComboBox4: TComboBox;
    Layout65: TLayout;
    Label32: TLabel;
    edtqtd: TEdit;
    Layout44: TLayout;
    btnVoltaTransferencia: TButton;
    Image10: TImage;
    Label27: TLabel;
    btnConfirmaTransferencia: TButton;
    Image11: TImage;
    Label29: TLabel;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    tbiTransferencia: TTabItem;
    Lista: TListView;
    btnExcluiItem: TRectangle;
    Image1: TImage;
    lblExcluir: TLabel;
    listaTranferencia: TListView;
    btnExcluirTranferencia: TRectangle;
    Image13: TImage;
    Label37: TLabel;
    cbxCombustivelMov: TComboBox;
    Layout66: TLayout;
    Layout68: TLayout;
    Rectangle21: TRectangle;
    Image14: TImage;
    Label38: TLabel;
    btnNovaTransferencia: TRectangle;
    Image7: TImage;
    Label23: TLabel;
    Rectangle22: TRectangle;
    Rectangle23: TRectangle;
    Layout69: TLayout;
    Rectangle24: TRectangle;
    Layout70: TLayout;
    Label39: TLabel;
    edtAtividade: TEdit;
    EditButton6: TEditButton;
    Layout71: TLayout;
    Rectangle25: TRectangle;
    Layout72: TLayout;
    Label41: TLabel;
    edtObs: TEdit;
    tbiRevisoes: TTabItem;
    ListaRevisao: TListView;
    Layout75: TLayout;
    Rectangle27: TRectangle;
    Rectangle28: TRectangle;
    Image16: TImage;
    Label45: TLabel;
    Label14: TLabel;
    EdtUltimoHorimetro: TNumberBox;
    Label20: TLabel;
    edtProximaRev: TNumberBox;
    layListaRevisao: TLayout;
    btnListaRevisao: TButton;
    Image15: TImage;
    btnImg: TRectangle;
    Image19: TImage;
    Label43: TLabel;
    ActionList1: TActionList;
    ActPhotoLibrary: TTakePhotoFromLibraryAction;
    ActPhotoCamera: TTakePhotoFromCameraAction;
    procedure btnBuscarMaquinaClick(Sender: TObject);
    procedure EditButton1Click(Sender: TObject);
    procedure EditButton2Click(Sender: TObject);
    procedure btnSalvarGrupoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure ListaGesture(Sender: TObject; const EventInfo: TGestureEventInfo;
      var Handled: Boolean);
    procedure btnExcluiItemClick(Sender: TObject);
    procedure ListaItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnVoltar2Click(Sender: TObject);
    procedure btnNovoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnNovoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnVoltar1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnVoltar1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnExcluiItemMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnExcluiItemMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnVoltar1Click(Sender: TObject);
    procedure btnVoltarProdutoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnVoltarProdutoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnNovoProdutoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnNovoProdutoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure edtNomeFiltroChangeTracking(Sender: TObject);
    procedure EditButton3Click(Sender: TObject);
    procedure btnConfirmaPluviClick(Sender: TObject);
    procedure Rectangle13Click(Sender: TObject);
    procedure btnNovoProdutoClick(Sender: TObject);
    procedure btnVoltarProdutoClick(Sender: TObject);
    procedure tbPrincipalChange(Sender: TObject);
   {$IFDEF ANDROID}
    procedure btnLerQrClick(Sender: TObject);
   {$ENDIF}
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure ListaProdutosGesture(Sender: TObject;
      const EventInfo: TGestureEventInfo; var Handled: Boolean);
    procedure edtNomeFiltroClick(Sender: TObject);
    procedure btnExcluiProdutoClick(Sender: TObject);
    procedure ListaProdutosItemClickEx(const Sender: TObject;
      ItemIndex: Integer; const LocalClickPos: TPointF;
      const ItemObject: TListItemDrawable);
    procedure EditButton4Click(Sender: TObject);
    procedure edtLocalOrigemEnter(Sender: TObject);
    procedure EditButton5Click(Sender: TObject);
    procedure btnConfirmaTransferenciaClick(Sender: TObject);
    procedure btnExcluirTranferenciaClick(Sender: TObject);
    procedure btnNovaTransferenciaClick(Sender: TObject);
    procedure btnNovaTransferenciaMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure btnNovaTransferenciaMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure listaTranferenciaItemClickEx(const Sender: TObject;
      ItemIndex: Integer; const LocalClickPos: TPointF;
      const ItemObject: TListItemDrawable);
    procedure listaTranferenciaGesture(Sender: TObject;
      const EventInfo: TGestureEventInfo; var Handled: Boolean);
    procedure EditButton6Click(Sender: TObject);
    procedure Rectangle28Click(Sender: TObject);
    procedure btnListaRevisaoClick(Sender: TObject);
    procedure btnImgClick(Sender: TObject);
    procedure Rectangle31Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnFotoHorimetroClick(Sender: TObject);
  private
    permissao : T99Permissions;
    FImageStream: TStringStream;
     {$IFDEF ANDROID}
    PermissaoCamera, PermissaoReadStorage, PermissaoWriteStorage : string;
    procedure TakePicturePermissionRequestResult(
        Sender: TObject; const APermissions: TArray<string>;
        const AGrantResults: TArray<TPermissionStatus>);
    procedure DisplayMessageCamera(Sender: TObject;
                const APermissions: TArray<string>;
                const APostProc: TProc);
    procedure LibraryPermissionRequestResult(
        Sender: TObject; const APermissions: TArray<string>;
        const AGrantResults: TArray<TPermissionStatus>);
    procedure DisplayMessageLibrary(Sender: TObject;
                const APermissions: TArray<string>;
                const APostProc: TProc);
    {$ENDIF}
    procedure MudarAba(ATabItem: TTabItem; sender: TObject);
    procedure GeraLista(vFiltro:string);
    procedure GeraListaTransferencia(vFiltro:string);
    procedure GeraListaProdutos(vIdAbastecimento,vFiltro:string);
    function  GeraFiltro:string;
    procedure GeraListaManutencao;
    procedure LimpaCampos;
  public
    vImgCapture: integer;
    vIdMaquina,vIdoperador,vIdLocalEstoque,vFiltro,vFlagSync,
    vIdAbastecimento,vIdProduto,vIdItemOutros,vILocalOrigem,vIdLocalDestino,
    vIdTransferencia,vIdAtividade:string;
    function BitmapFromBase64(const base64: string): TBitmap;
    function Base64FromBitmap(Bitmap: TBitmap): string;
  end;

var
  frmAbastecimento: TfrmAbastecimento;

implementation

{$R *.fmx}

uses UPrincipal, Maquinas, UOperadorMaquina, UDataContext, ULocalEstoque,
  UProdutos, UDataFunctions, UAtividadeAbastecimento, UnitCamera,
  UCamAbastecimento;

function TfrmAbastecimento.Base64FromBitmap(Bitmap: TBitmap): string;
var
  Input: TBytesStream;
  Output: TStringStream;
begin
  Input := TBytesStream.Create;
  try
    Bitmap.SaveToStream(Input);
    Input.Position := 0;
    Output := TStringStream.Create('', TEncoding.ASCII);
    try
      Soap.EncdDecd.EncodeStream(Input, Output);
      Result := Output.DataString;
    finally
      Output.Free;
    end;
  finally
    Input.Free;
  end;
end;

function TfrmAbastecimento.BitmapFromBase64(const base64: string): TBitmap;
var
  Input: TStringStream;
  Output: TBytesStream;
begin
  Input := TStringStream.Create(base64, TEncoding.ASCII);
  try
    Output := TBytesStream.Create;
    try
      Soap.EncdDecd.DecodeStream(Input, Output);
      Output.Position := 0;
      Result := TBitmap.Create;
      try
        Result.LoadFromStream(Output);
      except
        Result.Free;
        raise;
      end;
    finally
      Output.Free;
    end;
  finally
    Input.Free;
  end;
end;

procedure TfrmAbastecimento.btnBuscarClick(Sender: TObject);
begin
 GeraLista(GeraFiltro);
 GeraListaTransferencia('');
end;

procedure TfrmAbastecimento.btnConfirmaPluviClick(Sender: TObject);
begin
 if edtOutroProduto.Text.Length=0 then
 begin
   ShowMessage('Informe o Produto');
   Exit;
 end;
 if(edtQtdOutroProduto.Text.Length=0)or(edtQtdOutroProduto.Text='0') then
 begin
   ShowMessage('Informe a Quantidade');
   Exit;
 end;
 dmDB.TAbastecimentoOutrosidusuario.AsString       := dmDB.vIdUser;
 dmDB.TAbastecimentoOutrosidabastecimento.AsString := vIdAbastecimento;
 dmDB.TAbastecimentoOutrosidproduto.AsString       := vIdProduto;
 dmDB.TAbastecimentoOutrosquantidade.AsString      := StringReplace(edtQtdOutroProduto.Text,',','.',[rfReplaceAll]);
 try
   dmDB.TAbastecimentoOutros.ApplyUpdates(-1);
   ShowMessage('Produto Adicionado com Sucesso!');
   GeraListaProdutos(vIdAbastecimento,'');
   layNewOutros.Visible := false;
 except
   on E: Exception do
    ShowMessage('Erro ao salvar Produto:'+E.Message);
 end;
end;

procedure TfrmAbastecimento.btnConfirmaTransferenciaClick(Sender: TObject);
begin
if edtLocalOrigem.Text.Length=0 then
 begin
   ShowMessage('Informe o Local de Origem!');
   edtLocalOrigem.SetFocus;
   Exit;
 end;
 if edtLocalDestino.Text.Length=0 then
 begin
   ShowMessage('Informe o Local de Destino!');
   edtLocalDestino.SetFocus;
   Exit;
 end;
 if cbxCombustivelMov.ItemIndex=-1 then
 begin
   ShowMessage('Informe o Prtoduto!');
   cbxCombustivelMov.SetFocus;
   Exit;
 end;
 if(edtqtd.Text.Length=0)or(edtqtd.Text='0') then
 begin
   ShowMessage('Informe a Quantidade!');
   edtqtd.SetFocus;
   Exit;
 end;
 if dmDB.TMovLocalEstoque.State=dsInsert then
 begin
   dmDB.TMovLocalEstoqueidusuario.AsString := dmDB.vIdUser;
 end;
 if dmDB.TMovLocalEstoque.State=dsEdit then
 begin
   dmDB.TMovLocalEstoqueidusuarioalteracao.AsString := dmDB.vIdUser;
   dmDB.TMovLocalEstoquedataalteracao.AsDateTime    := now;
 end;
 case cbxCombustivelMov.ItemIndex of
  0: vIdProduto:='178';
  1: vIdProduto:='179';
  2: vIdProduto:='180';
  3: vIdProduto:='3396';
 end;
 dmDB.TMovLocalEstoqueidproduto.AsString             := vIdProduto;
 dmDB.TMovLocalEstoqueidlocalestoqueorigem.AsString  := vILocalOrigem;
 dmDB.TMovLocalEstoqueidlocalestoquedetino.AsString  := vIdLocalDestino;
 dmDB.TMovLocalEstoqueqtde.AsString                  := edtqtd.Text;
 dmDB.TMovLocalEstoquedatamov.AsDateTime             := edtDataMov.DateTime;
 dmDB.TMovLocalEstoquehora.AsDateTime                := edtHoraMov.DateTime;
 try
  dmDB.TMovLocalEstoque.ApplyUpdates(-1);
  ShowMessage('Movimentação realizada com sucesso!');
  GeraListaTransferencia('');
  MudarAba(tbiLista,sender);
 except
 on E: Exception do
    ShowMessage('Erro ao salvar Registro:'+E.Message);
 end;
end;

procedure TfrmAbastecimento.btnExcluiItemClick(Sender: TObject);
begin
 btnExcluiItem.Visible := false;
 if vFlagSync='0' then
 begin
   MessageDlg('Deseja Realmente Deletar esse Registro?', System.UITypes.TMsgDlgType.mtInformation,
   [System.UITypes.TMsgDlgBtn.mbYes,
   System.UITypes.TMsgDlgBtn.mbNo
   ], 0,
   procedure(const AResult: System.UITypes.TModalResult)
   begin
    case AResult of
     mrYES:
     begin
       dmDB.DeletaAbastecimento(vIdAbastecimento);
       GeraLista('');
     end;
     mrNo:
    end;
   end);
 end
 else
 begin
   ShowMessage('Registro ja Sincronizado!!');
 end;
end;

procedure TfrmAbastecimento.btnExcluiItemMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
 btnExcluiItem.Opacity :=0.5;
end;

procedure TfrmAbastecimento.btnExcluiItemMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  btnExcluiItem.Opacity :=1;
end;
procedure TfrmAbastecimento.btnExcluiProdutoClick(Sender: TObject);
begin
 btnExcluiProduto.Visible := false;
 if vFlagSync='0' then
 begin
   MessageDlg('Deseja Realmente Deletar esse Registro?', System.UITypes.TMsgDlgType.mtInformation,
   [System.UITypes.TMsgDlgBtn.mbYes,
   System.UITypes.TMsgDlgBtn.mbNo
   ], 0,
   procedure(const AResult: System.UITypes.TModalResult)
   begin
    case AResult of
     mrYES:
     begin
       dmDB.DeletaAbastecimentoOutros(vIdItemOutros);
       GeraListaProdutos(vIdAbastecimento,'');
     end;
     mrNo:
    end;
   end);
 end
 else
 begin
   ShowMessage('Registro ja Sincronizado!!');
 end;
end;

procedure TfrmAbastecimento.btnExcluirTranferenciaClick(Sender: TObject);
begin
 btnExcluirTranferencia.Visible := false;
 if vFlagSync='0' then
 begin
   MessageDlg('Deseja Realmente Deletar esse Registro?', System.UITypes.TMsgDlgType.mtInformation,
   [System.UITypes.TMsgDlgBtn.mbYes,
   System.UITypes.TMsgDlgBtn.mbNo
   ], 0,
   procedure(const AResult: System.UITypes.TModalResult)
   begin
    case AResult of
     mrYES:
     begin
       dmDB.DeletaTransferencia(vIdTransferencia);
       GeraListaTransferencia('');
     end;
     mrNo:
    end;
   end);
 end
 else
 begin
   ShowMessage('Registro ja Sincronizado!!');
 end;
end;



procedure TfrmAbastecimento.btnFotoHorimetroClick(Sender: TObject);
begin
{$IFDEF ANDROID}
PermissionsService.RequestPermissions([PermissaoCamera,
                                       PermissaoReadStorage,
                                       PermissaoWriteStorage],
                                       TakePicturePermissionRequestResult,
                                       DisplayMessageCamera
                                       );
{$ENDIF}

{$IFDEF IOS}
  ActPhotoCamera.Execute;
{$ENDIF}
end;

procedure TfrmAbastecimento.btnImgClick(Sender: TObject);
begin
 frmCameraAbastecimento := TfrmCameraAbastecimento.Create(Self);
  try
    frmCameraAbastecimento.ShowModal(
    procedure(ModalResult: TModalResult)
    begin
    end);
  finally
    frmCameraAbastecimento.free;
  end;
// frmCameraAbastecimento.Show;
// MudarAba(tbiImg,sender);
end;

{$IFDEF ANDROID}
procedure TfrmAbastecimento.btnLerQrClick(Sender: TObject);
var
 vCodigo :string;
begin
  FrmCamera:= TFrmCamera.Create(nil);
  FrmCamera.ShowModal(procedure(ModalResult: TModalResult)
  begin
    if ModalResult = 0 then
    begin
     vCodigo         := FrmCamera.codigo;
     vIdMaquina      := dmFunctions.RetornaNomeMaquina(vCodigo);
     if (vIdMaquina.Length=0) then
     begin
       ShowMessage('Maquina Não Encontrado');
       edtMaquina.Text        :='';
       btnListaRevisao.Visible := false;
       layHorimetro.Height     := 65;
       Exit;
     end
     else
     begin
      edtMaquina.Text          := vCodigo;
      EdtUltimoHorimetro.Text  := dmDB.RetornaHorimetroAtual(vidMaquina);
      edtProximaRev.Text       := dmDB.RetornaHorimetroProximaRev(vIdMaquina);
      if edtProximaRev.Text.Length >0 then
      begin
        btnListaRevisao.Visible := true;
        layHorimetro.Height     := 95;
      end
      else
      begin
        btnListaRevisao.Visible := false;
        layHorimetro.Height     := 65;
      end
     end;
    end
  end);
end;
{$ENDIF}

procedure TfrmAbastecimento.btnNovaTransferenciaClick(Sender: TObject);
begin
 lblPage.Text            := 'Nova Transferencia';
 dmDB.TMovLocalEstoque.close;
 dmDB.TMovLocalEstoque.Open;
 dmDB.TMovLocalEstoque.Insert;
 MudarAba(tbiCadTransferencia,sender);
end;

procedure TfrmAbastecimento.btnNovaTransferenciaMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
 btnNovaTransferencia.Opacity :=0.5;
end;

procedure TfrmAbastecimento.btnNovaTransferenciaMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  btnNovaTransferencia.Opacity :=1;
end;

procedure TfrmAbastecimento.btnNovoClick(Sender: TObject);
begin
 dmDB.vImg64Horimetro    :='';
 dmDB.vImg64Bomba        :='';
 btnListaRevisao.Visible := false;
 layHorimetro.Height     := 60;
 lblPage.Text            := 'Novo Abastecimentos';
 LimpaCampos;
 dmDB.TAbastecimento.Insert;
 MudarAba(tbiCad,sender);
end;

procedure TfrmAbastecimento.btnNovoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
 btnNovo.Opacity :=0.5;
end;

procedure TfrmAbastecimento.btnNovoMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  btnNovo.Opacity :=1;
end;

procedure TfrmAbastecimento.btnNovoProdutoClick(Sender: TObject);
begin
  btnExcluiProduto.Visible    := false;
  edtOutroProduto.Text        :='';
  edtQtdOutroProduto.Text     :='0';
  layNewOutros.Visible        :=true;
  dmDB.AbrirAbastecimentoOutros(vIdAbastecimento,'');
  dmDB.TAbastecimentoOutros.Insert;
end;

procedure TfrmAbastecimento.btnNovoProdutoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
   btnNovoProduto.Opacity :=0.5;
end;

procedure TfrmAbastecimento.btnNovoProdutoMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  btnNovoProduto.Opacity :=1;
end;

procedure TfrmAbastecimento.btnSalvarGrupoClick(Sender: TObject);
var
 IdCombustivel:string;
begin
 if edtMaquina.Text.Length=0 then
 begin
   ShowMessage('Informe a Maquina!!');
   edtMaquina.SetFocus;
   Exit;
 end;
 if edtOperador.Text.Length=0 then
 begin
   ShowMessage('Informe o Operador!!');
   edtOperador.SetFocus;
   Exit;
 end;
 if (edtHorimetro.Value<=0) then
 begin
   ShowMessage('Informe o Horimetro!!');
   edtHorimetro.SetFocus;
   Exit;
 end;
 if edtLocalEstoque.Text.Length=0 then
 begin
   ShowMessage('Informe a Bomba!!');
   edtLocalEstoque.SetFocus;
   Exit;
 end;
 if edtAtividade.Text.Length=0 then
 begin
   ShowMessage('Informe a Atividade!!');
   edtAtividade.SetFocus;
   Exit;
 end;
 if cbxCombustivel.ItemIndex=-1 then
 begin
   ShowMessage('Informe o Combustivel!!');
   cbxCombustivel.SetFocus;
   Exit;
 end;
 if (edtLitros.Text.Length=0)OR(edtLitros.Text='0,00') then
 begin
   ShowMessage('Informe os Litros!!');
   edtHorimetro.SetFocus;
   Exit;
 end;
 case cbxCombustivel.ItemIndex of
  0: IdCombustivel:='178';
  1: IdCombustivel:='179';
  2: IdCombustivel:='180';
  3: IdCombustivel:= '3396';
 end;

  if(dmDB.vImg64Bomba.Length=0)then
  begin
   ShowMessage('Foto da Bomba é Obrigatoria!!');
   Exit;
  end;
 if(dmDB.vImg64Horimetro.Length=0)then
  begin
   ShowMessage('Foto do Horímetro é Obrigatoria!!');
   Exit;
  end;

 if EdtUltimoHorimetro.Value>edtHorimetro.Value then
 begin
   MessageDlg('Horímetro está menor que último registrado, deseja confirmar assim mesmo?', System.UITypes.TMsgDlgType.mtInformation,
   [System.UITypes.TMsgDlgBtn.mbYes,
   System.UITypes.TMsgDlgBtn.mbNo
   ], 0,
   procedure(const AResult: System.UITypes.TModalResult)
   begin
    case AResult of
     mrYES:
     begin
      dmdb.TAbastecimentoidmaquina.AsString                 := vIdMaquina;
      dmdb.TAbastecimentoidoperador.AsString                := vIdoperador;
      dmdb.TAbastecimentoidusuario.AsString                 := dmDB.vIdUser;
      dmdb.TAbastecimentoidlocalestoque.AsString            := vIdLocalEstoque;
      dmdb.TAbastecimentocombustivel.AsString               := IdCombustivel;
      dmdb.TAbastecimentodataabastecimento.AsDateTime       := edtData.DateTime;
      dmdb.TAbastecimentohora.AsDateTime                    := edtHora.DateTime;
      dmdb.TAbastecimentovolumelt.AsFloat                   := edtLitros.Value;
      dmdb.TAbastecimentohorimetro.AsFloat                  := edtHorimetro.Value;
      dmdb.TAbastecimentoidAtividade.AsString               := vIdAtividade;
      if edtObs.Text.Length>0 then
       dmdb.TAbastecimentoobs.AsString                      := edtObs.Text;
      dmdb.TAbastecimentoimg.AsString                       := dmdb.vImg64Horimetro;
      dmdb.TAbastecimentoimg2.AsString                      := dmdb.vImg64Bomba;
      try
       dmdb.TAbastecimento.ApplyUpdates(-1);
       ShowMessage('Abastecimento Adicionada com sucesso!!');
       GeraLista('');
       MudarAba(tbiLista,sender);
      except
       on E: Exception do
        ShowMessage('Erro ao salvar Abastecimento:'+E.Message);
      end;
     end;
     mrNo:
      exit;
    end;
   end);
 end
 else
 begin
   if(edtHorimetro.Value-EdtUltimoHorimetro.Value)>=50 then
   begin
     MessageDlg('Último abastecimento foi a mais de 50 horas, deseja confirmar assim mesmo?', System.UITypes.TMsgDlgType.mtInformation,
     [System.UITypes.TMsgDlgBtn.mbYes,
     System.UITypes.TMsgDlgBtn.mbNo
     ], 0,
     procedure(const AResult: System.UITypes.TModalResult)
     begin
      case AResult of
       mrYES:
       begin
        dmdb.TAbastecimentoidmaquina.AsString                 := vIdMaquina;
        dmdb.TAbastecimentoidoperador.AsString                := vIdoperador;
        dmdb.TAbastecimentoidusuario.AsString                 := dmDB.vIdUser;
        dmdb.TAbastecimentoidlocalestoque.AsString            := vIdLocalEstoque;
        dmdb.TAbastecimentocombustivel.AsString               := IdCombustivel;
        dmdb.TAbastecimentodataabastecimento.AsDateTime       := edtData.DateTime;
        dmdb.TAbastecimentohora.AsDateTime                    := edtHora.DateTime;
        dmdb.TAbastecimentovolumelt.AsFloat                   := edtLitros.Value;
        dmdb.TAbastecimentohorimetro.AsFloat                  := edtHorimetro.Value;
        dmdb.TAbastecimentoidAtividade.AsString               := vIdAtividade;
        if edtObs.Text.Length>0 then
         dmdb.TAbastecimentoobs.AsString                      := edtObs.Text;
        dmdb.TAbastecimentoimg.AsString                       := dmdb.vImg64Horimetro;
        dmdb.TAbastecimentoimg2.AsString                      := dmdb.vImg64Bomba;
        try
         dmdb.TAbastecimento.ApplyUpdates(-1);
         ShowMessage('Abastecimento Adicionada com sucesso!!');
         GeraLista('');
         MudarAba(tbiLista,sender);
        except
         on E: Exception do
          ShowMessage('Erro ao salvar Abastecimento:'+E.Message);
        end;
       end;
       mrNo:
        exit;
      end;
     end);
   end
   else
   begin
    dmdb.TAbastecimentoidmaquina.AsString                 := vIdMaquina;
    dmdb.TAbastecimentoidoperador.AsString                := vIdoperador;
    dmdb.TAbastecimentoidusuario.AsString                 := dmDB.vIdUser;
    dmdb.TAbastecimentoidlocalestoque.AsString            := vIdLocalEstoque;
    dmdb.TAbastecimentocombustivel.AsString               := IdCombustivel;
    dmdb.TAbastecimentodataabastecimento.AsDateTime       := edtData.DateTime;
    dmdb.TAbastecimentohora.AsDateTime                    := edtHora.DateTime;
    dmdb.TAbastecimentovolumelt.AsFloat                   := edtLitros.Value;
    dmdb.TAbastecimentohorimetro.AsFloat                  := edtHorimetro.Value;
    dmdb.TAbastecimentoidAtividade.AsString               := vIdAtividade;
    if edtObs.Text.Length>0 then
     dmdb.TAbastecimentoobs.AsString                      := edtObs.Text;
    dmdb.TAbastecimentoimg.AsString                       := dmdb.vImg64Horimetro;
    dmdb.TAbastecimentoimg2.AsString                      := dmdb.vImg64Bomba;
    try
     dmdb.TAbastecimento.ApplyUpdates(-1);
     ShowMessage('Abastecimento Adicionada com sucesso!!');
     GeraLista('');
     MudarAba(tbiLista,sender);
    except
     on E: Exception do
      ShowMessage('Erro ao salvar Abastecimento:'+E.Message);
    end;
   end;
 end;
end;

procedure TfrmAbastecimento.btnVoltar1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmAbastecimento.btnVoltar1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  btnVoltar1.Opacity :=0.5;
end;

procedure TfrmAbastecimento.btnVoltar1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  btnVoltar1.Opacity :=1;
end;

procedure TfrmAbastecimento.btnVoltar2Click(Sender: TObject);
begin
   MessageDlg('Deseja Realmente Sair da Tela?', System.UITypes.TMsgDlgType.mtInformation,
   [System.UITypes.TMsgDlgBtn.mbYes,
   System.UITypes.TMsgDlgBtn.mbNo
   ], 0,
   procedure(const AResult: System.UITypes.TModalResult)
   begin
    case AResult of
     mrYES:
     begin
       MudarAba(tbiLista,sender);
     end;
     mrNo:
    end;
   end);
end;

procedure TfrmAbastecimento.btnVoltarClick(Sender: TObject);
begin
 if tbPrincipal.TabIndex in[1,2,3]  then
 begin
  tbPrincipal.ActiveTab := tbiLista;
  Exit;
 end;
 if tbPrincipal.TabIndex=4 then
 begin
  tbPrincipal.ActiveTab := tbiCad;
  exit;
 end;
 if tbPrincipal.TabIndex=0 then
 begin
  Close;
 end;

end;

procedure TfrmAbastecimento.btnVoltarProdutoClick(Sender: TObject);
begin
  btnExcluiProduto.Visible   := false;
  tbPrincipal.ActiveTab   := tbiLista;
end;

procedure TfrmAbastecimento.btnVoltarProdutoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
    btnVoltarProduto.Opacity :=0.5;
end;

procedure TfrmAbastecimento.btnVoltarProdutoMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
   btnVoltarProduto.Opacity :=1;
end;

procedure TfrmAbastecimento.DisplayMessageCamera(Sender: TObject;
  const APermissions: TArray<string>; const APostProc: TProc);
begin
  TDialogService.ShowMessage('O app precisa acessar as fotos do seu dispositivo',
  procedure(const AResult: TModalResult)
  begin
     APostProc;
  end);
end;

procedure TfrmAbastecimento.DisplayMessageLibrary(Sender: TObject;
  const APermissions: TArray<string>; const APostProc: TProc);
begin
 TDialogService.ShowMessage('O app precisa acessar a câmera e as fotos do seu dispositivo',
  procedure(const AResult: TModalResult)
  begin
    APostProc;
  end);
end;

procedure TfrmAbastecimento.btnListaRevisaoClick(Sender: TObject);
begin
 dmDB.GeraListaMaquina(vIdMaquina);
 if not dmDB.TListaRevisao.IsEmpty then
 begin
  GeraListaManutencao();
  MudarAba(tbiRevisoes,sender);
 end
 else
  ShowMessage('Nenhuma Revisão encontrada!');
end;

procedure TfrmAbastecimento.MudarAba(ATabItem: TTabItem; sender: TObject);
begin
  actMudarAba.Tab := ATabItem;
  actMudarAba.ExecuteTarget(sender);
end;

procedure TfrmAbastecimento.Rectangle13Click(Sender: TObject);
begin
 layNewOutros.Visible := false;
end;

procedure TfrmAbastecimento.Rectangle28Click(Sender: TObject);
begin
  MudarAba(tbiCad,sender);
end;

procedure TfrmAbastecimento.Rectangle31Click(Sender: TObject);
begin
 MudarAba(tbiCad,sender);
end;

procedure TfrmAbastecimento.TakePicturePermissionRequestResult(Sender: TObject;
  const APermissions: TArray<string>;
  const AGrantResults: TArray<TPermissionStatus>);
begin
  if (Length(AGrantResults) = 3) and
     (AGrantResults[0] = TPermissionStatus.Granted) and
     (AGrantResults[1] = TPermissionStatus.Granted) and
     (AGrantResults[2] = TPermissionStatus.Granted) then
          ActPhotoCamera.Execute
  else
    TDialogService.ShowMessage('Você não tem permissão para tirar fotos');
end;

procedure TfrmAbastecimento.tbPrincipalChange(Sender: TObject);
begin
 case tbPrincipal.TabIndex of
  0:lblPage.Text            := 'Abastecimentos';
  1:lblPage.Text            := 'Novo Abastecimentos';
  2:lblPage.Text            := 'Outros Produtos';
 end;
end;

procedure TfrmAbastecimento.EditButton1Click(Sender: TObject);
begin
  frmLocalEstoque := TfrmLocalEstoque.Create(Self);
  try
    frmLocalEstoque.ShowModal(
    procedure(ModalResult: TModalResult)
    begin
      edtLocalEstoque.Text   := dmDB.vNomeLocalEstoque;
      vIdLocalEstoque        := dmDB.vIdLocalEstoqueSel;
    end);
  finally
    frmOperadorMaquina.free;
  end;
end;

procedure TfrmAbastecimento.EditButton2Click(Sender: TObject);
begin
  frmOperadorMaquina := TfrmOperadorMaquina.Create(Self);
  try
    frmOperadorMaquina.ShowModal(
    procedure(ModalResult: TModalResult)
    begin
      edtOperador.Text   := dmDB.vNomeOperador;
      vIdoperador        := dmDB.vIdOperador;
    end);
  finally
    frmOperadorMaquina.free;
  end;
end;

procedure TfrmAbastecimento.EditButton3Click(Sender: TObject);
begin
  frmprodutos := Tfrmprodutos.Create(Self);
  try
    frmProdutos.vTipo :='3';
    frmprodutos.ShowModal(
    procedure(ModalResult: TModalResult)
    begin
      edtOutroProduto.Text   := dmdb.vNomeProduto;
      vIdProduto             := dmdb.vIdProduto;
    end);
  finally
    frmprodutos.free;
  end;
end;

procedure TfrmAbastecimento.EditButton4Click(Sender: TObject);
begin
 frmLocalEstoque := TfrmLocalEstoque.Create(Self);
  try
    frmLocalEstoque.ShowModal(
    procedure(ModalResult: TModalResult)
    begin
      edtLocalOrigem.Text   := dmDB.vNomeLocalEstoque;
      vILocalOrigem         := dmDB.vIdLocalEstoqueSel;
    end);
  finally
    frmLocalEstoque.free;
  end;
end;

procedure TfrmAbastecimento.EditButton5Click(Sender: TObject);
begin
 frmLocalEstoque := TfrmLocalEstoque.Create(Self);
  try
    frmLocalEstoque.ShowModal(
    procedure(ModalResult: TModalResult)
    begin
      edtLocalDestino.Text   := dmDB.vNomeLocalEstoque;
      vIdLocalDestino        := dmDB.vIdLocalEstoqueSel;
    end);
  finally
    frmLocalEstoque.free;
  end;
end;

procedure TfrmAbastecimento.EditButton6Click(Sender: TObject);
begin
  frmAtividadeAbastecimento := TfrmAtividadeAbastecimento.Create(Self);
  try
    frmAtividadeAbastecimento.ShowModal(
    procedure(ModalResult: TModalResult)
    begin
      edtAtividade.Text   := dmDB.vNomeAtividade;
      vIdAtividade        := dmDB.vIdAtividade;
    end);
  finally
    frmAtividadeAbastecimento.free;
  end;
end;

procedure TfrmAbastecimento.btnBuscarMaquinaClick(Sender: TObject);
begin
  frmMaquinas := TfrmMaquinas.Create(Self);
  try
    dmDB.vPulverizacao:=0;
    frmMaquinas.ShowModal(
    procedure(ModalResult: TModalResult)
    begin
      if dmDB.vMarcaModelo.Length>0 then
      begin
       edtMaquina.Text          := dmDB.vMarcaModelo;
       vIdMaquina               := dmDB.vIdMaquinaSel;
       EdtUltimoHorimetro.Text  := dmDB.vUltimoHorimetro;
       edtProximaRev.Text       := dmDB.RetornaHorimetroProximaRev(dmDB.vIdMaquinaSel);
      if edtProximaRev.Text.Length >0 then
      begin
        btnListaRevisao.Visible := true;
        layHorimetro.Height     := 95;
      end;
     end;
    end);
  finally
    frmMaquinas.free;
  end;
end;

procedure TfrmAbastecimento.edtLocalOrigemEnter(Sender: TObject);
begin
 EditButton4Click(Sender);
end;

procedure TfrmAbastecimento.edtNomeFiltroChangeTracking(Sender: TObject);
begin
 if edtNomeFiltro.Text.Length>0 then
  GeraListaProdutos(vIdAbastecimento,
   'and produto like '+QuotedStr('%'+edtNomeFiltro.Text+'%'))
 else
   GeraListaProdutos(vIdAbastecimento,'');
end;

procedure TfrmAbastecimento.edtNomeFiltroClick(Sender: TObject);
begin
 btnExcluiProduto.Visible   := false;
end;


procedure TfrmAbastecimento.FormActivate(Sender: TObject);
begin
{$IFDEF ANDROID}
     PermissaoCamera := JStringToString(TJManifest_permission.JavaClass.CAMERA);
     PermissaoReadStorage := JStringToString(TJManifest_permission.JavaClass.READ_EXTERNAL_STORAGE);
     PermissaoWriteStorage := JStringToString(TJManifest_permission.JavaClass.WRITE_EXTERNAL_STORAGE);
{$ENDIF}
end;

procedure TfrmAbastecimento.FormKeyUp(Sender: TObject; var Key: Word;
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

procedure TfrmAbastecimento.FormShow(Sender: TObject);
begin
 dmDB.vImg64Bomba     :='';
 dmDB.vImg64Horimetro :='';

 btnImg.Visible          := true;
 permissao               := T99Permissions.Create;
 btnExcluirTranferencia.Visible := false;
 if NOT permissao.VerifyCameraAccess then
   permissao.Camera(nil, nil);
 layBuscaMaquina.Height  := 70;
 lblPage.Text            := 'Abastecimentos';
 layNewOutros.Visible    := false;
 btnExcluiItem.Visible   := false;
 tbPrincipal.TabPosition := TTabPosition.None;
 tbPrincipal.ActiveTab   := tbiLista;
 GeraLista('');
end;

function TfrmAbastecimento.GeraFiltro:string;
begin
 vFiltro :='';
 if edtMaquinaF.Text.Length>0 then
 begin
   vFiltro := vFiltro+' and dataabastecimento='+FormatDateTime('yyyy-mm-dd',edtDataF.Date).QuotedString;
   vFiltro := vFiltro+' and Maquina like '+QuotedStr('%'+edtMaquinaF.Text+'%')
 end
 else
 begin
   vFiltro := vFiltro+' and dataabastecimento='+FormatDateTime('yyyy-mm-dd',edtDataF.Date).QuotedString;
 end;
 Result :=vFiltro;
end;

procedure TfrmAbastecimento.GeraLista(vFiltro: string);
var
 item   : TListViewItem;
 txt    : TListItemText;
 txtH   : TListItemPurpose;
 img    : TListItemImage;
begin
 dmDB.AbrirAbastecimento(vFiltro);
 dmDB.TAbastecimento.First;
 Lista.Items.Clear;
 while not dmDB.TAbastecimento.eof do
 begin
   item := Lista.Items.Add;
   with frmAbastecimento do
   begin
     with item  do
     begin
       txt      := TListItemText(Objects.FindDrawable('Text3'));
       txt.Text := dmDB.TAbastecimentoMaquina.AsString;
       txt.TagString := dmDB.TAbastecimentoid.AsString;

       txt      := TListItemText(Objects.FindDrawable('Text5'));
       txt.Text := 'Data: ';
       txt      := TListItemText(Objects.FindDrawable('Text6'));
       txt.Text := dmDB.TAbastecimentodataabastecimento.AsString;
       txt.TagString := dmDB.TAbastecimentosyncfaz.AsString;

       txt      := TListItemText(Objects.FindDrawable('Text4'));
       txt.Text := 'Hora: ';
       txt      := TListItemText(Objects.FindDrawable('Text7'));
       txt.Text := dmDB.TAbastecimentohora.AsString;


       txt      := TListItemText(Objects.FindDrawable('Text8'));
       txt.Text := 'Operador: ';
       txt      := TListItemText(Objects.FindDrawable('Text9'));
       txt.Text := dmDB.TAbastecimentoOperador.AsString;

       txt      := TListItemText(Objects.FindDrawable('Text10'));
       txt.Text := 'Bomba: ';
       txt      := TListItemText(Objects.FindDrawable('Text11'));
       txt.Text := dmDB.TAbastecimentoLocalEstoque.AsString;

       txt      := TListItemText(Objects.FindDrawable('Text12'));
       txt.Text := 'Combustivel: ';
       txt      := TListItemText(Objects.FindDrawable('Text13'));
       txt.Text := dmDB.TAbastecimentocombustivelStr.AsString;

       txt      := TListItemText(Objects.FindDrawable('Text14'));
       txt.Text := 'Litros: ';
       txt      := TListItemText(Objects.FindDrawable('Text15'));
       txt.Text := dmDB.TAbastecimentovolumelt.AsString;

       txt      := TListItemText(Objects.FindDrawable('Text17'));
       txt.Text := 'Atividade: ';
       txt      := TListItemText(Objects.FindDrawable('Text18'));
       txt.Text := dmDB.TAbastecimentoAtividade.AsString;

       txt      := TListItemText(Objects.FindDrawable('Text20'));
       txt.Text := 'Observação: ';

       txt      := TListItemText(Objects.FindDrawable('Text19'));
       txt.Text := dmDB.TAbastecimentoobs.AsString;
       
       txt      := TListItemText(Objects.FindDrawable('Text22'));
       txt.Text := 'Fotos';



       txt      := TListItemText(Objects.FindDrawable('Text16'));
       txt.Text := 'Adicionar Produtos ';

       img := TListItemImage(Objects.FindDrawable('Image10'));
       img.Bitmap     := frmPrincipal.imgCombustivel.Bitmap;

       img := TListItemImage(Objects.FindDrawable('Image10'));
       img.Bitmap     := frmPrincipal.imgCombustivel.Bitmap;

       img := TListItemImage(Objects.FindDrawable('Image11'));
       img.Bitmap     := frmPrincipal.imgOutrosProdutos.Bitmap;

       img := TListItemImage(Objects.FindDrawable('Image21'));
       img.Bitmap     := frmPrincipal.imgFotos.Bitmap;

     end;
     dmDB.TAbastecimento.Next;
   end;
 end;
end;

procedure TfrmAbastecimento.GeraListaManutencao;
var
 item   : TListViewItem;
 txt    : TListItemText;
 txtH   : TListItemPurpose;
 img    : TListItemImage;
 vStatus:string;
begin
   TThread.CreateAnonymousThread(procedure
   begin
    TThread.Synchronize(nil, procedure
    begin
      ListaRevisao.Items.Clear;
      while not dmDb.TListaRevisao.eof do
       begin
         item := ListaRevisao.Items.Add;
           with frmAbastecimento do
           begin
             with item  do
             begin
               txt      := TListItemText(Objects.FindDrawable('Text3'));
               txt.Text := dmDB.TListaRevisaonome.AsString;

               txt      := TListItemText(Objects.FindDrawable('Text5'));
               txt.Text := 'Ultima:';


               txt      := TListItemText(Objects.FindDrawable('Text6'));
               if dmDB.TListaRevisaodatafim.AsString.length>0 then
                txt.Text := FormatDateTime('dd/mm/yyyy',dmDB.TListaRevisaodatafim.AsDateTime)
               else
                txt.Text := '';

               txt      := TListItemText(Objects.FindDrawable('Text8'));
               txt.Text := 'Horimetro Ultima:';

               txt      := TListItemText(Objects.FindDrawable('Text9'));
               txt.Text := dmDB.TListaRevisaohorimetro.AsString;

               txt      := TListItemText(Objects.FindDrawable('Text10'));
               txt.Text := 'Horimetro Proxima:';

               txt      := TListItemText(Objects.FindDrawable('Text11'));
               txt.Text := dmDB.TListaRevisaohorimetroproxima.AsString;

               img := TListItemImage(Objects.FindDrawable('Image10'));
               img.Bitmap := frmPrincipal.imgMaquina.Bitmap;

             end;
             dmDB.TListaRevisao.Next;
           end;
       end;
    end);
   end).Start;
end;

procedure TfrmAbastecimento.GeraListaProdutos(vIdAbastecimento,
  vFiltro: string);
var
 item   : TListViewItem;
 txt    : TListItemText;
 txtH   : TListItemPurpose;
 img    : TListItemImage;
 vStatus:string;
begin
 TThread.CreateAnonymousThread(procedure
 begin
  TThread.Synchronize(nil, procedure
  begin
    dmDB.AbrirAbastecimentoOutros(vIdAbastecimento,vFiltro);
    ListaProdutos.Items.Clear;
    while not dmDb.TAbastecimentoOutros.eof do
     begin
       item := ListaProdutos.Items.Add;
         with frmAbastecimento do
         begin
           with item  do
           begin
             txt      := TListItemText(Objects.FindDrawable('Text14'));
             txt.Text := dmDb.TAbastecimentoOutrosid.AsString;

             txt      := TListItemText(Objects.FindDrawable('Text5'));
             txt.Text := dmDb.TAbastecimentoOutrosProduto.AsString;

             txt      := TListItemText(Objects.FindDrawable('Text6'));
             txt.Text := 'Qtde:';

             txt      := TListItemText(Objects.FindDrawable('Text7'));
             txt.Text := dmDb.TAbastecimentoOutrosquantidade.AsString;

             img := TListItemImage(Objects.FindDrawable('Image14'));
             img.Bitmap := frmPrincipal.imgOutrosProdutos.Bitmap;

           end;
           dmDB.TAbastecimentoOutros.Next;
         end;
     end;
  end);
 end).Start;
end;

procedure TfrmAbastecimento.GeraListaTransferencia(vFiltro: string);
var
 item   : TListViewItem;
 txt    : TListItemText;
 txtH   : TListItemPurpose;
 img    : TListItemImage;
begin
 dmDB.AbrirTrasnferencia(vFiltro);
 dmDB.TMovLocalEstoque.First;
 listaTranferencia.Items.Clear;
 while not dmDB.TMovLocalEstoque.eof do
 begin
   item := listaTranferencia.Items.Add;
   with frmAbastecimento do
   begin
     with item  do
     begin
       txt      := TListItemText(Objects.FindDrawable('Text5'));
       txt.Text := 'Origem: ';
       txt.TagString := dmDB.TMovLocalEstoqueid.AsString;

       txt      := TListItemText(Objects.FindDrawable('Text6'));
       txt.Text := dmDB.TMovLocalEstoqueLocalOrigem.AsString;

       txt      := TListItemText(Objects.FindDrawable('Text8'));
       txt.Text := 'Destino: ';

       txt      := TListItemText(Objects.FindDrawable('Text9'));
       txt.Text := dmDB.TMovLocalEstoqueLocalDestino.AsString;


       txt      := TListItemText(Objects.FindDrawable('Text10'));
       txt.Text := 'Produto: ';

       txt      := TListItemText(Objects.FindDrawable('Text11'));
       txt.Text := dmDB.TMovLocalEstoqueProduto.AsString;



       txt      := TListItemText(Objects.FindDrawable('Text12'));
       txt.Text := 'Data: ';
       txt      := TListItemText(Objects.FindDrawable('Text13'));
       txt.Text := dmDB.TMovLocalEstoquedatamov.AsString;

       txt      := TListItemText(Objects.FindDrawable('Text14'));
       txt.Text := 'Hora: ';
       txt      := TListItemText(Objects.FindDrawable('Text15'));
       txt.Text := dmDB.TMovLocalEstoquehora.AsString;


       txt      := TListItemText(Objects.FindDrawable('Text4'));
       txt.Text := 'Qtde.: ';
       txt      := TListItemText(Objects.FindDrawable('Text3'));
       txt.Text := dmDB.TMovLocalEstoqueqtde.AsString;

       img := TListItemImage(Objects.FindDrawable('Image10'));
       img.Bitmap     := frmPrincipal.imgTransf.Bitmap;

     end;
     dmDB.TMovLocalEstoque.Next;
   end;
 end;
end;

procedure TfrmAbastecimento.LibraryPermissionRequestResult(Sender: TObject;
  const APermissions: TArray<string>;
  const AGrantResults: TArray<TPermissionStatus>);
begin
 if (Length(AGrantResults) = 2) and
           (AGrantResults[0] = TPermissionStatus.Granted) and
           (AGrantResults[1] = TPermissionStatus.Granted) then
                ActPhotoLibrary.Execute
        else
                TDialogService.ShowMessage('Você não tem permissão para acessar as fotos');

end;

procedure TfrmAbastecimento.LimpaCampos;
begin
  edtMaquina.Text          :='';
  edtOperador.Text         :='';
  edtLocalEstoque.Text     :='';
  edtLitros.Value          :=0;
  edtHorimetro.Value       :=0;
  edtData.Date             :=date;
  edtHora.DateTime         :=now;
  cbxCombustivel.ItemIndex :=-1;
end;

procedure TfrmAbastecimento.ListaGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
 btnExcluiItem.Visible   := true;
end;

procedure TfrmAbastecimento.ListaItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
var
 vImgBomba,vImgHorimetro:string;
begin
  vIdAbastecimento   := TAppearanceListViewItem(Lista.Selected).Objects.FindObjectT<TListItemText>
   ('Text3').TagString;
  vFlagSync          := TAppearanceListViewItem(Lista.Selected).Objects.FindObjectT<TListItemText>
   ('Text6').TagString;
  
  if ItemObject is TListItemImage then
  begin
    if TListItemImage(ItemObject).Name='Image11' then
    begin
     btnExcluiProduto.Visible   := false;
     GeraListaProdutos(vIdAbastecimento,vFiltro);
     MudarAba(tbiProdutos,sender);
     Exit;
    end;

    if TListItemImage(ItemObject).Name='Image21' then
    begin
     btnExcluiProduto.Visible  := false;
     dmDB.AbreFotos(vIdAbastecimento);
     frmCameraAbastecimento    := TfrmCameraAbastecimento.Create(Self);
      try
        frmCameraAbastecimento.ShowModal(
        procedure(ModalResult: TModalResult)
        begin
        end);
      finally
        frmCameraAbastecimento.free;
      end;
     Exit;
    end;
  end;
end;

procedure TfrmAbastecimento.ListaProdutosGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
  btnExcluiProduto.Visible   := true;
end;

procedure TfrmAbastecimento.ListaProdutosItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
 vIdItemOutros   := TAppearanceListViewItem(ListaProdutos.Selected).Objects.FindObjectT<TListItemText>
  ('Text14').Text;
end;

procedure TfrmAbastecimento.listaTranferenciaGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
  btnExcluirTranferencia.Visible   := true;
end;

procedure TfrmAbastecimento.listaTranferenciaItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
  vIdTransferencia :=
  TAppearanceListViewItem(listaTranferencia.Selected).Objects.FindObjectT<TListItemText>
   ('Text5').TagString;
end;

end.
