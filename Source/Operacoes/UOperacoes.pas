unit UOperacoes;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.StdCtrls, FMX.DateTimeCtrls, FMX.ListBox, FMX.ListView, FMX.Objects,
  FMX.Controls.Presentation, FMX.Layouts, FMX.TabControl, FMX.Edit,
  FMX.ActnList, System.Actions, FMX.ScrollBox, FMX.Memo, System.Rtti,
  FMX.Grid.Style, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components,
  Data.Bind.DBScope, Data.Bind.Grid, FMX.Grid,FMX.VirtualKeyboard,FMX.Platform,
  FMX.EditBox, FMX.NumberBox, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FMX.Gestures;

type
  TfrmOperacao = class(TForm)
    TabPrincipal: TTabControl;
    TabLista: TTabItem;
    TbiNovaOperacao: TTabItem;
    tbiMaquinas: TTabItem;
    tbiProdutos: TTabItem;
    layPrincipal: TLayout;
    ToolBar1: TToolBar;
    Rectangle4: TRectangle;
    ToolBar3: TToolBar;
    Rectangle3: TRectangle;
    Label4: TLabel;
    Rectangle6: TRectangle;
    Layout1: TLayout;
    RectFiltros: TRectangle;
    listaOperacao: TListView;
    Layout2: TLayout;
    Label1: TLabel;
    cbxSetorF: TComboBox;
    Label2: TLabel;
    cbxTalhaoF: TComboBox;
    Label3: TLabel;
    edtDataFiltro: TDateEdit;
    btnBuscarOperacao: TButton;
    btnFinalizar: TButton;
    Image26: TImage;
    btnEditarOp: TButton;
    Image1: TImage;
    Button2: TButton;
    Image2: TImage;
    Layout10: TLayout;
    recSelectAtividade: TRectangle;
    Layout11: TLayout;
    Label5: TLabel;
    edtAtividade: TEdit;
    EditButton1: TEditButton;
    Rectangle7: TRectangle;
    Layout13: TLayout;
    Layout14: TLayout;
    Label32: TLabel;
    Label33: TLabel;
    edtAreaPrev: TEdit;
    edtAreaReal: TEdit;
    Rectangle8: TRectangle;
    Layout16: TLayout;
    Label11: TLabel;
    edtObservacaoAtividade: TEdit;
    Layout31: TLayout;
    Rectangle22: TRectangle;
    Label28: TLabel;
    Rectangle2: TRectangle;
    Layout3: TLayout;
    Label12: TLabel;
    edtTalhao: TEdit;
    EditButton3: TEditButton;
    Rectangle1: TRectangle;
    Layout4: TLayout;
    Layout5: TLayout;
    Label7: TLabel;
    Label13: TLabel;
    edtDataIniAtividade: TDateEdit;
    edtDataFimAtividade: TDateEdit;
    Rectangle9: TRectangle;
    Rectangle10: TRectangle;
    actAcoes: TActionList;
    actMudarAba: TChangeTabAction;
    AcMudarAbaChart: TAction;
    AcMudarAbaDespesas: TAction;
    AcLeft: TAction;
    AcRigth: TAction;
    Rectangle11: TRectangle;
    Rectangle12: TRectangle;
    Rectangle13: TRectangle;
    Rectangle14: TRectangle;
    Layout6: TLayout;
    Layout22: TLayout;
    Layout32: TLayout;
    Rectangle23: TRectangle;
    Label29: TLabel;
    Rectangle16: TRectangle;
    Layout18: TLayout;
    Label6: TLabel;
    edtOperador: TEdit;
    Rectangle17: TRectangle;
    Layout19: TLayout;
    Layout20: TLayout;
    Label14: TLabel;
    Label34: TLabel;
    Rectangle18: TRectangle;
    Layout21: TLayout;
    Label15: TLabel;
    edtObsMaquina: TEdit;
    Rectangle19: TRectangle;
    Layout17: TLayout;
    Label18: TLabel;
    edtMaquina: TEdit;
    EditButton2: TEditButton;
    btnAddMaquina: TButton;
    Image4: TImage;
    Label16: TLabel;
    Button3: TButton;
    Image6: TImage;
    Label17: TLabel;
    Rectangle15: TRectangle;
    Layout7: TLayout;
    Layout8: TLayout;
    Label19: TLabel;
    edtDataMaquina: TDateEdit;
    tbiOcorrencia: TTabItem;
    Rectangle20: TRectangle;
    Rectangle21: TRectangle;
    Layout12: TLayout;
    Layout15: TLayout;
    tbiDetalhes: TTabItem;
    Rectangle24: TRectangle;
    Rectangle25: TRectangle;
    Layout23: TLayout;
    Layout27: TLayout;
    Layout33: TLayout;
    Rectangle27: TRectangle;
    Label30: TLabel;
    Rectangle28: TRectangle;
    Layout24: TLayout;
    Label10: TLabel;
    edtProduto: TEdit;
    EditButton4: TEditButton;
    Rectangle29: TRectangle;
    Layout25: TLayout;
    Layout26: TLayout;
    edtQtdeUtilizada: TEdit;
    edtDataProduto: TDateEdit;
    Layout35: TLayout;
    Label20: TLabel;
    Label35: TLabel;
    Rectangle30: TRectangle;
    Layout28: TLayout;
    Label23: TLabel;
    edtObsProduto: TEdit;
    btnVoltaProduto: TButton;
    Image7: TImage;
    Label21: TLabel;
    btnConfirmaProduto: TButton;
    Image8: TImage;
    Label22: TLabel;
    Layout29: TLayout;
    Layout34: TLayout;
    Rectangle32: TRectangle;
    Label31: TLabel;
    Rectangle33: TRectangle;
    Layout30: TLayout;
    Label26: TLabel;
    edtTipoOcorrencia: TEdit;
    EditButton5: TEditButton;
    Rectangle34: TRectangle;
    Layout36: TLayout;
    Label36: TLabel;
    edtDescricao: TMemo;
    Rectangle35: TRectangle;
    Layout37: TLayout;
    Layout38: TLayout;
    edtDataOcorrencia: TDateEdit;
    Layout39: TLayout;
    Label37: TLabel;
    btnConfirmaOcorrencia: TButton;
    Image9: TImage;
    Label24: TLabel;
    Button4: TButton;
    Image10: TImage;
    Label25: TLabel;
    Layout40: TLayout;
    Rectangle26: TRectangle;
    Layout41: TLayout;
    layTalhoes: TLayout;
    Label38: TLabel;
    Layout43: TLayout;
    Label39: TLabel;
    lblAtividade: TLabel;
    lblTalhao: TLabel;
    Layout44: TLayout;
    Label42: TLabel;
    lblDataInicio: TLabel;
    Label44: TLabel;
    lblDataFim: TLabel;
    layBtnDet: TLayout;
    btnMaquinas: TLayout;
    btnOcorrencia: TLayout;
    btnProdutos: TLayout;
    imgMaquinas: TImage;
    imgProdutos: TImage;
    imgOcorrencia: TImage;
    Label40: TLabel;
    Label41: TLabel;
    Label43: TLabel;
    layGridMaquinas: TLayout;
    Layout46: TLayout;
    Rectangle31: TRectangle;
    Label45: TLabel;
    Layout47: TLayout;
    ToolBar2: TToolBar;
    lblTotalMaquinas: TLabel;
    layProdUtilizados: TLayout;
    Layout48: TLayout;
    Rectangle36: TRectangle;
    Label46: TLabel;
    Layout49: TLayout;
    ToolBar4: TToolBar;
    lblTotalProdutos: TLabel;
    layOcorrenciasOP: TLayout;
    GridOcorrencia: TStringGrid;
    Layout50: TLayout;
    Rectangle37: TRectangle;
    Label47: TLabel;
    Layout51: TLayout;
    ToolBar5: TToolBar;
    lblTotalOcorrencia: TLabel;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB4: TLinkGridToDataSource;
    BindSourceDB2: TBindSourceDB;
    BindSourceDB3: TBindSourceDB;
    BindSourceDB4: TBindSourceDB;
    tabDet: TTabControl;
    tbiMaquinasOp: TTabItem;
    tbiProdutosOP: TTabItem;
    tbiOcorrenciaOP: TTabItem;
    Layout52: TLayout;
    btnExluirMaquina: TButton;
    btnNovaMaquina: TButton;
    Image11: TImage;
    Image12: TImage;
    Layout53: TLayout;
    btnExcluirProduto: TButton;
    Image13: TImage;
    btnNovoProduto: TButton;
    Image14: TImage;
    Layout54: TLayout;
    btnExcluirOcorrencia: TButton;
    Image15: TImage;
    btnNovaOcorrencia: TButton;
    Image17: TImage;
    ToolBar6: TToolBar;
    Rectangle38: TRectangle;
    Label48: TLabel;
    Image18: TImage;
    Button5: TButton;
    Image20: TImage;
    Button6: TButton;
    Image21: TImage;
    LayDetAtividade: TLayout;
    TabAuxCadAtividade: TTabControl;
    tbiApliSolidos: TTabItem;
    tbiPulverizacao: TTabItem;
    Rectangle39: TRectangle;
    Rectangle40: TRectangle;
    Rectangle41: TRectangle;
    Layout56: TLayout;
    Layout57: TLayout;
    Label49: TLabel;
    Label50: TLabel;
    cbxTipoAplicacaoSolido: TComboBox;
    cbxTipoOperacaoSolid: TComboBox;
    Rectangle42: TRectangle;
    Rectangle43: TRectangle;
    RecTipoOperacaoFinalidade: TRectangle;
    Layout55: TLayout;
    cbxTipoOperacaoPulverizacao: TComboBox;
    cbxFinalidadePulverizacao: TComboBox;
    RecCulturaCoberturaQualidade: TRectangle;
    Layout59: TLayout;
    Layout60: TLayout;
    lblCultura: TLabel;
    cbxCulturaPulverizacao: TComboBox;
    recDatas: TRectangle;
    Layout61: TLayout;
    Layout62: TLayout;
    Label55: TLabel;
    Label56: TLabel;
    edtDataInicioPul: TDateEdit;
    edtDataFimPul: TDateEdit;
    RecObs: TRectangle;
    Layout63: TLayout;
    Label57: TLabel;
    edtObservacaoPul: TEdit;
    tbiTalhoesPuverizacao: TTabItem;
    Layout9: TLayout;
    btnVoltaOp: TButton;
    Image3: TImage;
    Label9: TLabel;
    Layout64: TLayout;
    Button7: TButton;
    Image22: TImage;
    Label58: TLabel;
    btnSalvaPuverizacao: TButton;
    Image23: TImage;
    Label59: TLabel;
    Rectangle48: TRectangle;
    Rectangle49: TRectangle;
    RecAddTalhao: TRectangle;
    Layout65: TLayout;
    Label60: TLabel;
    edtAddTalhao: TEdit;
    BtnAddTalhao: TEditButton;
    Layout66: TLayout;
    Layout67: TLayout;
    Button8: TButton;
    Image24: TImage;
    Label61: TLabel;
    btnConfirmaTalhao: TButton;
    Image25: TImage;
    Label62: TLabel;
    GridTalhoesPul: TStringGrid;
    ToolBar7: TToolBar;
    layTotalRegistroGrid: TLayout;
    lblTotalRegistro: TLabel;
    BindSourceDB6: TBindSourceDB;
    Layout68: TLayout;
    lblAreaTotalPrev: TLabel;
    Layout69: TLayout;
    Label63: TLabel;
    lblAreaPrev: TLabel;
    Label65: TLabel;
    lblAreaReal: TLabel;
    Layout70: TLayout;
    lblAreaTotalReal: TLabel;
    tbiReceituario: TTabItem;
    ToolBar8: TToolBar;
    Rectangle5: TRectangle;
    lblNomeReceituario: TLabel;
    Image27: TImage;
    Layout71: TLayout;
    Button12: TButton;
    Image30: TImage;
    Layout72: TLayout;
    Rectangle51: TRectangle;
    Layout73: TLayout;
    Layout74: TLayout;
    Label66: TLabel;
    lblTalhaoRec: TLabel;
    Layout75: TLayout;
    Label68: TLabel;
    lblAtividadeRec: TLabel;
    Layout76: TLayout;
    Label70: TLabel;
    lblDataInicioRec: TLabel;
    Label72: TLabel;
    lblDataFimRec: TLabel;
    Layout81: TLayout;
    Label77: TLabel;
    lblAreaPrevRec: TLabel;
    Label79: TLabel;
    lblAreaRealRec: TLabel;
    BindSourceDB7: TBindSourceDB;
    lblTotalHoras: TLabel;
    BindSourceDB5: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB52: TLinkGridToDataSource;
    btnExcluirTalhao: TButton;
    Image28: TImage;
    Rectangle52: TRectangle;
    Layout77: TLayout;
    Layout78: TLayout;
    Label69: TLabel;
    Label73: TLabel;
    edtHoraIni: TNumberBox;
    edtHoraFim: TNumberBox;
    edtHorasParado: TNumberBox;
    edtHorasTrabalhada: TNumberBox;
    btnConfirmarOp: TButton;
    Image29: TImage;
    Label27: TLabel;
    lblCobertura: TLabel;
    cbxCobertura: TComboBox;
    BindSourceDB8: TBindSourceDB;
    EditButton7: TEditButton;
    btnEditar: TButton;
    Image5: TImage;
    Button1: TButton;
    Image19: TImage;
    Image31: TImage;
    Layout58: TLayout;
    Layout80: TLayout;
    Label51: TLabel;
    lblFinalidade: TLabel;
    btnEditaProduto: TButton;
    Image32: TImage;
    ListaMaquinas: TListView;
    ListaProdutos: TListView;
    ListaOcorrencia: TListView;
    layReceiruario: TLayout;
    lblReceituario: TLabel;
    edtReceituario: TEdit;
    EditButton6: TEditButton;
    Rectangle50: TRectangle;
    ListaDetReceiturario: TListView;
    btnVazao: TLayout;
    Image35: TImage;
    Label64: TLabel;
    tbiVazaoOP: TTabItem;
    Layout87: TLayout;
    recVazao: TRectangle;
    Layout91: TLayout;
    Button16: TButton;
    Image38: TImage;
    Layout83: TLayout;
    Layout84: TLayout;
    Layout85: TLayout;
    Button11: TButton;
    Image33: TImage;
    Label8: TLabel;
    FDQuery1: TFDQuery;
    Layout79: TLayout;
    Rectangle53: TRectangle;
    Label52: TLabel;
    chk5LTHA: TButton;
    Layout82: TLayout;
    Rectangle54: TRectangle;
    Label54: TLabel;
    chk15LTHA: TButton;
    Layout86: TLayout;
    Rectangle56: TRectangle;
    Label67: TLabel;
    chk10LTHA: TButton;
    Layout88: TLayout;
    Rectangle57: TRectangle;
    Label71: TLabel;
    chk20LTHA: TButton;
    Layout89: TLayout;
    Rectangle58: TRectangle;
    Label74: TLabel;
    chk40LTHA: TButton;
    Layout90: TLayout;
    Rectangle59: TRectangle;
    Label75: TLabel;
    chk30LTHA: TButton;
    Layout92: TLayout;
    Rectangle60: TRectangle;
    Label76: TLabel;
    chk50LTHA: TButton;
    Layout93: TLayout;
    Rectangle61: TRectangle;
    Label78: TLabel;
    chk100LTHA: TButton;
    Layout94: TLayout;
    Rectangle62: TRectangle;
    Label80: TLabel;
    chk75LTHA: TButton;
    lblQualiCobertura: TLabel;
    cbxQualidadeCobertura: TComboBox;
    GestureManager1: TGestureManager;
    btnExcluiItem: TRectangle;
    Image34: TImage;
    lblExcluir: TLabel;
    recVariedade: TRectangle;
    Layout95: TLayout;
    Layout96: TLayout;
    Label81: TLabel;
    cbxVariedade: TComboBox;
    btnTalhoes: TLayout;
    Image36: TImage;
    lblTalhoes: TLabel;
    btnHabilitaSync: TRectangle;
    Image37: TImage;
    Label82: TLabel;
    laybtnLista: TLayout;
    Image16: TImage;
    BindSourceDB1: TBindSourceDB;
    LinkFillControlToFieldnome: TLinkFillControlToField;
    CheckBox1: TCheckBox;
    RecCulturaApli: TRectangle;
    Layout97: TLayout;
    Layout98: TLayout;
    Label83: TLabel;
    cbxCulturaApl: TComboBox;
    Rectangle63: TRectangle;
    Label84: TLabel;
    Layout45: TLayout;
    lblIdREC: TLabel;
    Label85: TLabel;
    lblCapRomaneio: TLabel;
    edtRomaneio: TEdit;
    Layout99: TLayout;
    Label53: TLabel;
    lblDetCultura: TLabel;
    Layout100: TLayout;
    Label86: TLabel;
    lblDetVariedade: TLabel;
    Rectangle44: TRectangle;
    Rectangle45: TRectangle;
    Rectangle46: TRectangle;
    Rectangle47: TRectangle;
    Rectangle64: TRectangle;
    tbiAtividadeExtra: TTabItem;
    Layout101: TLayout;
    btnVoltarExtra: TButton;
    Image39: TImage;
    Label87: TLabel;
    Rectangle55: TRectangle;
    Layout102: TLayout;
    Layout103: TLayout;
    Label89: TLabel;
    ComboBox1: TComboBox;
    Rectangle65: TRectangle;
    Layout104: TLayout;
    Layout105: TLayout;
    Label90: TLabel;
    Label91: TLabel;
    edtDataExtraDe: TDateEdit;
    edtDataExtraAte: TDateEdit;
    Rectangle69: TRectangle;
    Layout107: TLayout;
    Layout108: TLayout;
    Label94: TLabel;
    cbxTipoExtra: TComboBox;
    Rectangle67: TRectangle;
    Rectangle68: TRectangle;
    btnConfirmaExtra: TButton;
    Image41: TImage;
    Label88: TLabel;
    Rectangle66: TRectangle;
    Layout106: TLayout;
    Label92: TLabel;
    edtObsExtra: TEdit;
    procedure btnVoltaOpClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EditButton1Click(Sender: TObject);
    procedure btnConfirmarOp1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Image16Click(Sender: TObject);
    procedure btnAddMaquinaClick(Sender: TObject);
    procedure btnVoltaProdutoClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure btnConfirmaProdutoClick(Sender: TObject);
    procedure EditButton4Click(Sender: TObject);
    procedure EditButton5Click(Sender: TObject);
    procedure btnConfirmaOcorrenciaClick(Sender: TObject);
    procedure btnMaquinasClick(Sender: TObject);
    procedure btnProdutosClick(Sender: TObject);
    procedure btnOcorrenciaClick(Sender: TObject);
    procedure btnNovaMaquinaClick(Sender: TObject);
    procedure btnExluirMaquinaClick(Sender: TObject);
    procedure listaOperacaoItemClickEx(const Sender: TObject;
      ItemIndex: Integer; const LocalClickPos: TPointF;
      const ItemObject: TListItemDrawable);
    procedure btnEditarOpClick(Sender: TObject);
    procedure btnExcluirProdutoClick(Sender: TObject);
    procedure btnExcluirOcorrenciaClick(Sender: TObject);
    procedure btnNovaOcorrenciaClick(Sender: TObject);
    procedure btnFinalizarClick(Sender: TObject);
    procedure Image18Click(Sender: TObject);
    procedure EditButton2Click(Sender: TObject);
    procedure edtQtdeUtilizadaKeyUp(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure btnBuscarOperacaoClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure cbxTipoAplicacaoSolidoChange(Sender: TObject);
    procedure btnSalvaPuverizacaoClick(Sender: TObject);
    procedure cbxCulturaPulverizacaoChange(Sender: TObject);
    procedure EditButton6Click(Sender: TObject);
    procedure btnConfirmaTalhaoClick(Sender: TObject);
    procedure GridTalhoesPulEditingDone(Sender: TObject; const ACol,
      ARow: Integer);
    procedure BtnAddTalhaoClick(Sender: TObject);
    procedure EditButton3Click(Sender: TObject);
    procedure btnExcluirTalhaoClick(Sender: TObject);
    procedure edtHoraIniKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure edtHoraIniEnter(Sender: TObject);
    procedure edtHoraFimEnter(Sender: TObject);
    procedure edtHorasParadoEnter(Sender: TObject);
    procedure edtMaquinaEnter(Sender: TObject);
    procedure EditButton7Click(Sender: TObject);
    procedure EditButton7Enter(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure ListaMaquinasItemClickEx(const Sender: TObject;
      ItemIndex: Integer; const LocalClickPos: TPointF;
      const ItemObject: TListItemDrawable);
    procedure ListaProdutosItemClickEx(const Sender: TObject;
      ItemIndex: Integer; const LocalClickPos: TPointF;
      const ItemObject: TListItemDrawable);
    procedure Image31Click(Sender: TObject);
    procedure btnEditaProdutoClick(Sender: TObject);
    procedure ListaOcorrenciaItemClickEx(const Sender: TObject;
      ItemIndex: Integer; const LocalClickPos: TPointF;
      const ItemObject: TListItemDrawable);
    procedure edtHoraIniChangeTracking(Sender: TObject);
    procedure edtHoraFimChangeTracking(Sender: TObject);
    procedure btnVazaoClick(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure chk5LTHAClick(Sender: TObject);
    procedure chk10LTHAClick(Sender: TObject);
    procedure chk15LTHAClick(Sender: TObject);
    procedure chk20LTHAClick(Sender: TObject);
    procedure chk30LTHAClick(Sender: TObject);
    procedure chk40LTHAClick(Sender: TObject);
    procedure chk50LTHAClick(Sender: TObject);
    procedure chk75LTHAClick(Sender: TObject);
    procedure chk100LTHAClick(Sender: TObject);
    procedure btnNovoProdutoClick(Sender: TObject);
    procedure cbxCoberturaChange(Sender: TObject);
    procedure listaOperacaoGesture(Sender: TObject;
      const EventInfo: TGestureEventInfo; var Handled: Boolean);
    procedure btnExcluiItemClick(Sender: TObject);
    procedure cbxVariedadeChange(Sender: TObject);
    procedure edtDataFimPulExit(Sender: TObject);
    procedure edtDataInicioPulExit(Sender: TObject);
    procedure edtDataMaquinaExit(Sender: TObject);
    procedure edtDataIniAtividadeExit(Sender: TObject);
    procedure edtDataFimAtividadeExit(Sender: TObject);
    procedure btnTalhoesClick(Sender: TObject);
    procedure btnHabilitaSyncClick(Sender: TObject);
    procedure edtDataFiltroChange(Sender: TObject);
    procedure cbxCulturaAplChange(Sender: TObject);
    procedure Rectangle63Click(Sender: TObject);
    procedure btnConfirmaExtraClick(Sender: TObject);
    procedure btnVoltarExtraClick(Sender: TObject);
  private
    procedure MudarAba(ATabItem: TTabItem; sender: TObject);
    procedure CarregaComboFiltros;
    procedure myShowMenssagem(msg:string);
    procedure LimpaCampos;
    procedure GeraLista(Filtro:string);
    procedure AbreDetalhesOp(vIdOp: string);
  public
    vIdAtividade,vIdTalhao,vIdSafra,
    vIdMaquina,vIdProduto,vIdTipoOcorrencia,vIdOP,vIdOPTipo,vStatusConfere,
    vIdTipoAplicacaoSolido,vIdCultura,vIdReceituario,vIdPul,vIdCobertura,
    vIdOperador,vIdMaquinaSel,vIdProdutoSel,vIdOcorrenciaSel,vIdReceituarioSel,
    vFlagSync,vIdVariedade:string;
    vFinalizandoOP,vTipoOperacao,vDetalhes :integer;
    procedure Filtrar;
    function  RetornaIdOperacao: integer;
    procedure SomarColunasTalhoes;
    procedure SomarColunasHoras;
    procedure AtualizaBinds;
    function  RetornaIdVazao :integer;

    procedure GeraListaMaquinas;
    procedure GeraListaProdutos;
    procedure GeraListaOcorrencia;
    procedure GeraListaReceituario;
    procedure GerarListaDetReceituario(IdReceituario: string);
    procedure GeraVazao(idOP:string);
    procedure FinalizaOperacaoExtra;

    procedure CarregaCombo;
  end;

var
  frmOperacao: TfrmOperacao;

implementation

{$R *.fmx}

uses  Umsg, UPrincipal, UAtividades, UTalhoes, Maquinas, UProdutos,
  UTipoOcorrencia, UReceituario, UOperadorMaquina, UCadReceituario,
  UDataFunctions, UDataContext;

procedure TfrmOperacao.SomarColunasHoras;
var
  Sum : Double;
  Val : Double;
  I   : Integer;
begin

end;

function TfrmOperacao.RetornaIdVazao: integer;
var
 vId:integer;
 vId1:integer;
begin
 vId1 := strToInt(dmDB.vIdUser)+ strToInt(formatdatetime('mmss',now));
 repeat
  vId:=Random(vId1)*100;
 until (dmDB.VerificaIdVazaoExiste(intToStr(vId)));
 Result := vId;
end;


procedure TfrmOperacao.Rectangle63Click(Sender: TObject);
begin
 try
  dmDB.HabilitaSync(vIdOP);
  ShowMessage('Operação habilitada com sucesso!');
  laybtnLista.Visible := false;
 except
 end
end;

function TfrmOperacao.RetornaIdOperacao: integer;
var
 vId:integer;
 vId1:integer;
begin
 vId1 := strToInt(dmDB.vIdUser)+ strToInt(formatdatetime('mmss',now));
 repeat
  vId:=Random(2020)*100;
 until (dmDB.VerificaIdOperacaoExiste(intToStr(vId)));
 Result := vId;
end;

procedure TfrmOperacao.AbreDetalhesOp(vIdOp: string);
begin
 dmDB.AbreQryOperacao(vIdOp);
 dmDB.AbreMaquinaOperacao(vIdOp);
 GeraListaMaquinas;

 SomarColunasHoras;
 dmDB.AbreProdutoOperacao(vIdOp);
 GeraListaProdutos;

 dmDB.AbreOcorrenciaOperacao(vIdOp);
 GeraListaOcorrencia;
 lblTotalMaquinas.Text    := intToStr(ListaMaquinas.Items.Count);
 lblTotalHoras.Text       := 'Total Horas: '+dmDB.RetornaHorasTotais(vIdOp);
 lblTotalProdutos.Text    := 'Total Registro: '+intToStr(ListaProdutos.Items.Count);
 lblTotalOcorrencia.Text  := 'Total Registro: '+intToStr(ListaOcorrencia.Items.Count);

 lblTalhao.Text          := dmDB.RetornaTalhoesPul(dmDB.qryOpSafraid.AsString);
 lblAreaPrev.Text        := dmDB.qryOpSafraareaprevista.AsString;
 lblAreaReal.Text        := dmDB.qryOpSafraarearealizada.AsString;
 lblTalhaoRec.Text       := dmDB.RetornaTalhoesPul(dmDB.qryOpSafraid.AsString);
 lblAreaPrevRec.Text     := dmDB.qryOpSafraareaprevista.AsString;
 lblAreaRealRec.Text     := dmDB.qryOpSafraarearealizada.AsString;
 lblIdREC.Text           := dmDB.qryOpSafraidreceituario.AsString;

 lblAtividade.Text        := dmDB.qryOpSafraOperacao.AsString;
 lblDataInicio.Text       := dmDB.qryOpSafradatainicio.AsString;
 lblDataFim.Text          := dmDB.qryOpSafradatafim.AsString;
 lblAtividadeRec.Text     := dmDB.qryOpSafraOperacao.AsString;
 lblDataInicioRec.Text       := dmDB.qryOpSafradatainicio.AsString;
 lblDataFimRec.Text          := dmDB.qryOpSafradatafim.AsString;
end;

procedure TfrmOperacao.AtualizaBinds;
begin
 BindSourceDB1.DataSet := nil;
 BindSourceDB1.DataSet := dmDB.TTipoAplicacaoSolido;

 BindSourceDB2.DataSet := nil;
 BindSourceDB2.DataSet := dmDB.TOperacaoSafraMaquinas;

 BindSourceDB3.DataSet := nil;
 BindSourceDB3.DataSet := dmDB.TOperacaoSafraProdutos;

 BindSourceDB4.DataSet := nil;
 BindSourceDB4.DataSet := dmDB.TOperacaoSafraOcorrencia;

 BindSourceDB5.DataSet := nil;
 BindSourceDB5.DataSet := dmDB.TDetTalhoesPul;

 BindSourceDB6.DataSet := nil;
 BindSourceDB6.DataSet := dmDB.TCulturas;

 BindSourceDB7.DataSet := nil;
 BindSourceDB7.DataSet := dmDB.qryGridReceituario;
end;

procedure TfrmOperacao.btnAddMaquinaClick(Sender: TObject);
begin
 if(vIdOPTipo='4') and (edtRomaneio.Text.Length=0) then
 begin
   myShowMenssagem('Informe o Romaneio!!');
   edtRomaneio.SetFocus;
   Exit;
 end;
 if (vIdOPTipo='4') and (dmDb.TOperacaoSafraMaquinas.State=dsInsert) then
 begin
  if not  dmDb.VerificaRomaneioUsado(vIdMaquina,edtRomaneio.Text) then
  begin
   myShowMenssagem('Romaneio ja utilizado em outra maquina!!');
   edtRomaneio.SetFocus;
   Exit;
  end
 end;

 if edtMaquina.Text.Length=0 then
 begin
   myShowMenssagem('Informe a Maquina!!');
   edtMaquina.SetFocus;
   Exit;
 end;

 if edtOperador.Text.Length=0 then
 begin
   myShowMenssagem('Informe o Operador!!');
   edtOperador.SetFocus;
   Exit;
 end;
 if edtHoraIni.Text.Length=0 then
 begin
   myShowMenssagem('Informe a Hora de Inicio!!');
   edtHoraIni.SetFocus;
   Exit;
 end;
 if edtHoraFim.Text.Length=0 then
 begin
   myShowMenssagem('Informe a Hora Fim!!');
   edtHoraFim.SetFocus;
   Exit;
 end;
 if edtDataMaquina.Text.Length=0 then
 begin
   myShowMenssagem('Informe a Data!!');
   edtDataMaquina.SetFocus;
   Exit;
 end;
 edtHorasTrabalhada.Value                              := edtHoraFim.Value-edtHoraIni.Value;

 dmDb.TOperacaoSafraMaquinasidoperacaotalhao.AsString   := vIdOP;
 dmDb.TOperacaoSafraMaquinasidusuario.AsString          := dmDb.vIdUser;

 dmdb.TOperacaoSafraMaquinasidmaquina.AsString         := vIdMaquina;
 dmdb.TOperacaoSafraMaquinasoperador.AsString          := edtOperador.Text;
 dmdb.TOperacaoSafraMaquinashorainicio.AsString        := edtHoraIni.Text;
 dmdb.TOperacaoSafraMaquinashorafim.AsString           := edtHoraFim.Text;
 dmdb.TOperacaoSafraMaquinashoraparada.AsString        := edtHorasParado.Text;
 dmdb.TOperacaoSafraMaquinashoraTrabalhada.AsString    := edtHorasTrabalhada.Text;
 dmdb.TOperacaoSafraMaquinasdata.AsDateTime            := edtDataMaquina.date;
 dmdb.TOperacaoSafraMaquinasobservacao.AsString        := edtObsMaquina.Text;
 dmdb.TOperacaoSafraMaquinasidOperador.AsString        := vIdOperador;
 if (vIdOPTipo='4')then
  dmdb.TOperacaoSafraMaquinasromaneio.AsString         :=edtRomaneio.Text;
 try
   dmdb.TOperacaoSafraMaquinas.ApplyUpdates(-1);
   myShowMenssagem('Maquina Adicionada com sucesso!!');
   dmDB.AbreMaquinaOperacao(vIdOP);
   geraListaMaquinas;
   SomarColunasHoras;
   lblTotalMaquinas.Text    := intToStr(ListaMaquinas.Items.Count);
   lblTotalHoras.Text       := dmDB.RetornaHorasTotais(vIdOp);
   MudarAba(tbiDetalhes,sender);
 except
   on E: Exception do
    myShowMenssagem('Erro ao salvar Maquina:'+E.Message);
 end;
end;

procedure TfrmOperacao.BtnAddTalhaoClick(Sender: TObject);
begin
  if (vIdOPTipo='4')and (GridTalhoesPul.RowCount>0) then
  begin
   myShowMenssagem('Operação so permite um talhão');
   Exit;
  end;
  frmTalhoes := TfrmTalhoes.Create(Self);
  try
    frmTalhoes.ShowModal(
    procedure(ModalResult: TModalResult)
    begin
      vIdTalhao         := dmDB.vIdTalhao;
      if not dmDb.VerificaTalhaoJaAdicionado(vIdPul,vIdTalhao) then
      begin
        myShowMenssagem('Talhao já adicionado nessa operação!');
        Exit;
      end;
      dmDb.TDetTalhoesPul.Close;
      dmDb.TDetTalhoesPul.Open;
      dmDb.TDetTalhoesPul.Insert;
      dmDb.TDetTalhoesPulidTalhao.AsString      := vIdTalhao;
      dmDb.TDetTalhoesPulidOperacao.AsString    := vIdPul;
      dmDb.TDetTalhoesPulAreaPrevista.AsString  := dmdb.vAreaTalhao;
      dmDb.TDetTalhoesPulAreaRealizada.AsString := dmdb.vAreaTalhao;
      try
       dmDb.TDetTalhoesPul.ApplyUpdates(-1);
       dmDb.AbreDetTalhoesPulverizacao(vIdPul);
       SomarColunasTalhoes;
      except
       on E: Exception do
         myShowMenssagem('Erro ao Adicionar Talhao:'+E.Message);
      end;
    end);
  finally
    frmTalhoes.free;
  end;
end;

procedure TfrmOperacao.btnBuscarOperacaoClick(Sender: TObject);
begin
  laybtnLista.Visible := false;
  Filtrar;
end;

procedure TfrmOperacao.btnConfirmaProdutoClick(Sender: TObject);
begin
 if edtProduto.Text.Length=0 then
 begin
   myShowMenssagem('Informe o Produto!!');
   edtProduto.SetFocus;
   Exit;
 end;
 if(edtQtdeUtilizada.Text.Length=0) or (edtQtdeUtilizada.Text='0') then
 begin
   myShowMenssagem('Informe a Quantidade!!');
   edtQtdeUtilizada.SetFocus;
   Exit;
 end;
 if(edtDataProduto.Text.Length=0) then
 begin
   myShowMenssagem('Informe a Data!!');
   edtDataProduto.SetFocus;
   Exit;
 end;
 dmdb.TOperacaoSafraProdutosidproduto.AsString        := vIdProduto;
 dmdb.TOperacaoSafraProdutosqtdeutilidado.AsString    := edtQtdeUtilizada.Text;
 dmdb.TOperacaoSafraProdutosobservacao.AsString       := edtObsProduto.Text;
 dmdb.TOperacaoSafraProdutosdata.AsDateTime           := edtDataProduto.Date;
 try
   dmdb.TOperacaoSafraProdutos.ApplyUpdates(-1);
   myShowMenssagem('Produto Adicionada com sucesso!!');
   dmDB.AbreProdutoOperacao(vIdOP);
   GeraListaProdutos;
   edtProduto.Enabled    := true;
   MudarAba(tbiDetalhes,sender);
 except
   on E: Exception do
    myShowMenssagem('Erro ao salvar Produto:'+E.Message);
 end;
end;

procedure TfrmOperacao.btnConfirmarOp1Click(Sender: TObject);
begin
 if edtAtividade.Text.Length=0 then
 begin
   myShowMenssagem('Informe a Atividade!!');
   edtAtividade.SetFocus;
   Exit;
 end;
 if edtDataIniAtividade.Text.Length=0 then
 begin
   myShowMenssagem('Informe a Data de Inicio!!');
   edtDataIniAtividade.SetFocus;
   Exit;
 end;
 if cbxTipoAplicacaoSolido.ItemIndex=-1 then
 begin
  myShowMenssagem('Informe o Tipo de Aplicação Solido!!');
  cbxTipoAplicacaoSolido.SetFocus;
  Exit;
 end;
 if cbxTipoOperacaoSolid.ItemIndex=-1 then
 begin
  myShowMenssagem('Informe o Tipo de Operação!!');
  cbxTipoOperacaoSolid.SetFocus;
  Exit;
 end;
 if cbxCulturaApl.ItemIndex=-1 then
 begin
   myShowMenssagem('Informe a Cultura!!');
   cbxCulturaApl.SetFocus;
   Exit;
 end;
 if vFinalizandoOP=1 then
 begin
  if edtDataFimAtividade.Text.Length=0 then
  begin
    myShowMenssagem('Informe a Data Fim!!');
    edtDataFimAtividade.SetFocus;
    Exit;
  end;
    dmDB.AbreDetTalhoesPulverizacao(dmDB.TOperacaoSafraid.AsString);
    dmDB.TOperacaoSafraidoperacao.AsString            := vIdAtividade;
    dmDB.TOperacaoSafraidResponsavel.AsString         := dmDB.vIdUser;
    dmDB.TOperacaoSafradatainicio.AsDateTime          := edtDataIniAtividade.Date;
    dmDB.TOperacaoSafradatafim.AsDateTime             := edtDataFimAtividade.Date;
    dmDB.TOperacaoSafraareaPrevista.Asstring          := edtAreaPrev.Text;
    dmDB.TOperacaoSafraarearealizada.Asstring         := edtAreaPrev.Text;
    dmDB.TOperacaoSafraobservacao.AsString            := edtObservacaoAtividade.Text;
    dmDB.TOperacaoSafradataalteracao.AsDateTime       := date;
    dmDB.TOperacaoSafraidusuarioalteracao.AsString    := dmDB.vIdUser;
    dmDB.TOperacaoSafrastatus.AsInteger               := 2;
    dmDB.TOperacaoSafraidsafra.AsString               := vIdSafra;
    dmDB.TOperacaoSafratipoterraaereo.AsString        := cbxTipoOperacaoSolid.Selected.Text;
    dmDB.TOperacaoSafraidtipoaplicacaosolido.AsString := vIdTipoAplicacaoSolido;
    dmDB.TOperacaoSafraidcultura.AsString             := vIdCultura;
    try
      dmDB.TOperacaoSafra.ApplyUpdates(-1);
      vIdPul   := dmDB.TOperacaoSafraID.AsString;
      BindSourceDB5.DataSet := nil;
      dmDB.AbreDetTalhoesPulverizacao(vIdPul);
      BindSourceDB5.DataSet := dmDB.TDetTalhoesPul;
      SomarColunasTalhoes;
      MudarAba(tbiTalhoesPuverizacao,sender);
    except
      on E: Exception do
       myShowMenssagem('Erro ao Finalizar Atividade:'+E.Message);
    end;
 end
 else
 begin
   dmDB.TOperacaoSafraid.AsInteger            := RetornaIdOperacao;
   dmDB.TOperacaoSafraidoperacao.AsString     := vIdAtividade;
//   dmDB.TOperacaoSafraidtalhao.AsString       := vIdTalhao;
   dmDB.TOperacaoSafraidsafra.AsString        := vIdSafra;
   dmDB.TOperacaoSafraidResponsavel.AsString  := dmDB.vIdUser;
   dmDB.TOperacaoSafradatainicio.AsDateTime   := edtDataIniAtividade.Date;
   dmDB.TOperacaoSafraareaPrevista.Asstring   := edtAreaPrev.Text;
   if edtDataFimAtividade.Text.Length>0 then
    dmDB.TOperacaoSafradatafim.AsDateTime     := edtDataFimAtividade.Date;
   if edtAreaReal.Text.Length>0 then
    dmDB.TOperacaoSafraareaRealizada.Asstring := edtAreaReal.Text;
   dmDB.TOperacaoSafraobservacao.AsString     := edtObservacaoAtividade.Text;
   if vIdAtividade='1' then
   begin
    dmDB.TOperacaoSafratipoterraaereo.AsString        := cbxTipoOperacaoSolid.Selected.Text;
    dmDB.TOperacaoSafraidtipoaplicacaosolido.AsString := vIdTipoAplicacaoSolido;
    dmDB.TOperacaoSafraidcultura.AsString             := vIdCultura;
   end;
   try
     dmDB.TOperacaoSafra.ApplyUpdates(-1);
     vIdPul   := dmDB.RetornaMaxIdAtividade;
     dmDB.AbreDetTalhoesPulverizacao(vIdPul);
     myShowMenssagem('Atividade inserida com sucesso,adicione os Talhões');
     recSelectAtividade.Visible := false;
     MudarAba(tbiTalhoesPuverizacao,sender);
     SomarColunasTalhoes;
   except
     on E: Exception do
      myShowMenssagem('Erro ao salvar Atividade:'+E.Message);
   end;
 end;
end;

procedure TfrmOperacao.btnEditarClick(Sender: TObject);
begin
 if vIdMaquinaSel.Length=0 then
 begin
   myShowMenssagem('Selecione uma maquina!');
   Exit;
 end;
 dmDb.TOperacaoSafraMaquinas.Filtered := false;
 dmDb.TOperacaoSafraMaquinas.Filter   := 'ID='+vIdMaquinaSel;
 dmDb.TOperacaoSafraMaquinas.Filtered := true;
 dmDb.TOperacaoSafraMaquinas.Edit;
 vIdOP  := dmDb.TOperacaoSafraMaquinasidoperacaotalhao.AsString;
 dmDb.TOperacaoSafraMaquinasidusuario.AsString         := dmDb.vIdUser;

 if vIdOPTipo='4' then
 begin
   lblCapRomaneio.Visible := true;
   edtRomaneio.Visible    := true;
   edtRomaneio.Text       := dmDB.TOperacaoSafraMaquinasromaneio.AsString;
 end
 else
 begin
   lblCapRomaneio.Visible := false;
   edtRomaneio.Visible    := false;
 end;

 edtMaquina.Text      := dmDB.TOperacaoSafraMaquinasmaquina.AsString;
 vIdMaquina           := dmDB.TOperacaoSafraMaquinasidmaquina.AsString;

 edtOperador.Text     := dmDB.TOperacaoSafraMaquinasoperador.AsString;
 vIdoperador          := dmDB.TOperacaoSafraMaquinasidOperador.AsString;

 edtDataMaquina.Date  := dmDB.TOperacaoSafraMaquinasdata.AsDateTime;

 edtHoraIni.Value      := dmDB.TOperacaoSafraMaquinashorainicio.AsFloat;
 edtHoraFim.Value      := dmDB.TOperacaoSafraMaquinashorafim.AsFloat;
 edtHorasParado.Value  := dmDB.TOperacaoSafraMaquinashoraparada.AsFloat;
 edtObsMaquina.Text    := dmDB.TOperacaoSafraMaquinasobservacao.AsString;

 if vIdOPTipo='4' then
 begin
   lblCapRomaneio.Visible := true;
   edtRomaneio.Visible    := true;
   edtRomaneio.Text       := dmDB.TOperacaoSafraMaquinasromaneio.AsString;
 end
 else
 begin
   lblCapRomaneio.Visible := false;
   edtRomaneio.Visible    := false;
 end;

 MudarAba(tbiMaquinas,sender);
end;

procedure TfrmOperacao.btnEditarOpClick(Sender: TObject);
begin
 laybtnLista.Visible := false;
 vDetalhes := 1;
 if vIdOp.Length=0 then
 begin
   myShowMenssagem('Selecione a Operação!');
   Exit;
 end;
 if strToInt(vIdOPTipo)>2 then
  btnProdutos.Visible := false
 else
  btnProdutos.Visible := true;

 btnExcluirProduto.Enabled := vIdOPTipo<>'2';
 btnNovoProduto.Enabled    := vIdOPTipo<>'2';
 btnVazao.Visible          := vIdOPTipo='2';
 tabDet.Visible := false;
 AbreDetalhesOp(vIdOp);
 MudarAba(tbiDetalhes,Sender);
end;

procedure TfrmOperacao.btnExcluiItemClick(Sender: TObject);
begin
 laybtnLista.Visible := false;
 if vFlagSync='1' then
 begin
   myShowMenssagem('Operação ja sincronizada impossivel deletar!');
   Exit;
 end
 else
 begin
   try
    dmDB.DeleteOperacao(vIdOP,vIdReceituarioSel);
    myShowMenssagem('Operação deletada com sucesso!');
    GeraLista('');
   except
   end;
 end;
end;

procedure TfrmOperacao.btnExcluirOcorrenciaClick(Sender: TObject);
begin
 MessageDlg('Deseja deletar essa Ocorrencia?', System.UITypes.TMsgDlgType.mtInformation,
  [System.UITypes.TMsgDlgBtn.mbYes,
  System.UITypes.TMsgDlgBtn.mbNo
  ], 0,
 procedure(const AResult: System.UITypes.TModalResult)
  begin
   case AResult of
   mrYES:
    begin
      dmDB.TOperacaoSafraOcorrencia.Edit;
      dmDB.TOperacaoSafraOcorrenciastatus.AsInteger :=-1;
      dmDB.TOperacaoSafraOcorrencia.ApplyUpdates(-1);
      dmDB.AbreOcorrenciaOperacao(vIdOP);
      GeraListaOcorrencia;
    end;
   end;
 end);
end;

procedure TfrmOperacao.btnExcluirProdutoClick(Sender: TObject);
begin
  MessageDlg('Deseja deletar esse Produto?', System.UITypes.TMsgDlgType.mtInformation,
  [System.UITypes.TMsgDlgBtn.mbYes,
  System.UITypes.TMsgDlgBtn.mbNo
  ], 0,
 procedure(const AResult: System.UITypes.TModalResult)
  begin
   case AResult of
   mrYES:
    begin
      dmDB.TOperacaoSafraProdutos.Filtered := false;
      dmDB.TOperacaoSafraProdutos.Filter   := 'id='+vIdProdutoSel;
      dmDB.TOperacaoSafraProdutos.Filtered := true;

      dmDB.TOperacaoSafraProdutos.Edit;
      dmDB.TOperacaoSafraProdutosstatus.AsInteger :=-1;
      dmDB.TOperacaoSafraProdutos.ApplyUpdates(-1);
      TThread.Synchronize(nil, procedure
      begin
       dmDB.FDConn.Commit;
       dmDB.AbreProdutoOperacao(vIdOP);
       GeraListaProdutos;
      end);
    end;
   end;
 end);
end;

procedure TfrmOperacao.btnExcluirTalhaoClick(Sender: TObject);
begin
 dmDb.TDetTalhoesPul.Delete;
 dmDb.TDetTalhoesPul.ApplyUpdates(-1);
 dmDb.AbreDetTalhoesPulverizacao(vIdPul);
 SomarColunasTalhoes;
end;

procedure TfrmOperacao.btnExluirMaquinaClick(Sender: TObject);
begin
 MessageDlg('Deseja deletar essa maquina?', System.UITypes.TMsgDlgType.mtInformation,
  [System.UITypes.TMsgDlgBtn.mbYes,
  System.UITypes.TMsgDlgBtn.mbNo
  ], 0,
 procedure(const AResult: System.UITypes.TModalResult)
  begin
   case AResult of
   mrYES:
    begin
      dmDB.TOperacaoSafraMaquinas.Filtered := false;
      dmDB.TOperacaoSafraMaquinas.Filter   := 'id='+vIdMaquinaSel;
      dmDB.TOperacaoSafraMaquinas.Filtered := true;

      dmDB.TOperacaoSafraMaquinas.Edit;
      dmDB.TOperacaoSafraMaquinasstatus.AsInteger :=-1;
      dmDB.TOperacaoSafraMaquinas.ApplyUpdates(-1);
      dmDB.AbreMaquinaOperacao(vIdOP);
      GeraListaMaquinas;
    end;
   end;
 end);
end;

procedure TfrmOperacao.btnFinalizarClick(Sender: TObject);
var
 vIndexFinalidade:integer;
begin
 vDetalhes:=0;
 laybtnLista.Visible := false;
 CarregaCombo;
 if vIdOp.Length=0 then
 begin
   myShowMenssagem('Selecione a Operação!');
   Exit;
 end;
 if vStatusConfere='2' then
 begin
   myShowMenssagem('Operação ja Finalizada!');
   Exit;
 end;

 dmDB.AbreDetTalhoesPulverizacao(vIdOp);
 if dmDB.TDetTalhoesPul.RecordCount=0 then
 begin
   myShowMenssagem('Nenhum talhão adicionado, adicione antes de finalizar!');
   Exit;
 end;

 if dmDB.VerificaMaquinasOperacao(vIdOP) then
 begin
   myShowMenssagem('Informe as maquinas utilizadas antes de finalizar!');
   Exit;
 end;

 if (vIdOPTipo<>'3') and (vIdOPTipo<>'4') and (vIdOPTipo<>'5') and (vIdOPTipo<>'6') then
 begin
   if dmDB.VerificaProdutosOperacao(vIdOP) then
   begin
     myShowMenssagem('Informe os Produtos utilizadas antes de finalizar!');
     Exit;
   end;
   if not dmDB.VerificaProdutosOperacaoZero(vIdOP) then
   begin
     myShowMenssagem('Produtos com quantidade zero edite antes de finalizar!');
     Exit;
   end;
 end;

 if not dmDB.VerificaMaquinaHorasEmAberto(vIdOP) then
 begin
   myShowMenssagem('Existe Maquinas sem horas Trabalhadas edite antes de finalizar!');
   Exit;
 end;
 if (vIdOPTipo<>'5') then
 begin
   MessageDlg('Deseja Realmente Finalizar essa Operação?', System.UITypes.TMsgDlgType.mtInformation,
    [System.UITypes.TMsgDlgBtn.mbYes,
    System.UITypes.TMsgDlgBtn.mbNo
    ], 0,
   procedure(const AResult: System.UITypes.TModalResult)
    begin
     case AResult of
     mrYES:
      begin
        vFinalizandoOP       :=1;
        dmDB.TOperacaoSafra.Close;
        dmDB.TOperacaoSafra.Open;
        dmDB.TOperacaoSafra.Filtered:= false;
        dmDB.TOperacaoSafra.Filter  := 'ID='+vIdOP;
        dmDB.TOperacaoSafra.Filtered:= true;
        dmDB.TOperacaoSafra.Edit;
        vTipoOperacao := dmDB.TOperacaoSafraidoperacao.AsInteger;
        if dmDB.TOperacaoSafraidoperacao.AsInteger=1 then
        begin
          recVariedade.Visible                       := false;
          dmDb.TTipoAplicacaoSolido.Close;
          dmDb.TTipoAplicacaoSolido.Open;
          recSelectAtividade.Visible  := false;
          TabAuxCadAtividade.TabPosition := TTabPosition.None;
          TabAuxCadAtividade.ActiveTab   := tbiApliSolidos;
          edtAtividade.Enabled        := false;
          edtAtividade.Text           := dmDB.TOperacaoSafraoperacao.AsString;
          edtDataIniAtividade.date    := dmDB.TOperacaoSafradatainicio.AsDateTime;
          edtDataFimAtividade.Text    := dmDB.TOperacaoSafradatafim.AsString;
          edtAreaPrev.Text            := dmDB.TOperacaoSafraareaprevista.AsString;
          edtAreaReal.Text            := dmDB.TOperacaoSafraarearealizada.AsString;
          edtObservacaoAtividade.Text := dmDB.TOperacaoSafraobservacao.AsString;
          vIdAtividade                := dmDB.TOperacaoSafraidoperacao.AsString;
          vIdTalhao                   := dmDB.TOperacaoSafraidtalhao.AsString;
          edtTalhao.Text              := dmDB.TOperacaoSafratalhao.AsString;
          cbxTipoOperacaoSolid.ItemIndex   := cbxTipoOperacaoSolid.Items.IndexOf(dmDB.TOperacaoSafratipoterraaereo.AsString);
          vIdTipoAplicacaoSolido           := dmDB.TOperacaoSafraidtipoaplicacaosolido.AsString;
          cbxTipoAplicacaoSolido.ItemIndex := cbxTipoAplicacaoSolido.Items.IndexOf(dmDB.TOperacaoSafratipoaplicacaosolido.AsString);
          cbxCulturaapl.ItemIndex           := cbxCulturaPulverizacao.Items.IndexOf(dmDB.TOperacaoSafraCultura.AsString);
          vIdCultura                        := dmDB.TOperacaoSafraidcultura.AsString;
          mudarAba(TbiNovaOperacao,sender);
        end;
        if dmDB.TOperacaoSafraidoperacao.AsInteger=2 then
        begin
          cbxTipoOperacaoPulverizacao.Items.Clear;
          cbxTipoOperacaoPulverizacao.Items.Add('Terrestre');
          cbxTipoOperacaoPulverizacao.Items.Add('Aéreo');
          recSelectAtividade.Visible := false;
          TabAuxCadAtividade.TabPosition := TTabPosition.None;
          TabAuxCadAtividade.ActiveTab   := tbiPulverizacao;
          dmdb.TCulturas.Close;
          dmdb.TCulturas.Open;
          LayDetAtividade.Visible := true;
          vIdAtividade                               := dmDB.TOperacaoSafraidoperacao.AsString;
          vIdSafra                                   := dmDB.TOperacaoSafraidsafra.AsString;
          dmDB.vIdUser                               := dmDB.TOperacaoSafraidResponsavel.AsString;
          edtDataInicioPul.Date                      := dmDB.TOperacaoSafradatainicio.AsDateTime;
          edtAreaPrev.Text                           := dmDB.TOperacaoSafraareaPrevista.Asstring;
          if dmDB.TOperacaoSafradatafim.AsString.Length=0 then
           edtDataFimPul.Text                  := ''
          else
           edtDataFimPul.Date                   := dmDB.TOperacaoSafradatafim.AsDateTime;
          edtObservacaoAtividade.Text                := dmDB.TOperacaoSafraobservacao.AsString;
          cbxTipoOperacaoPulverizacao.ItemIndex      := cbxTipoOperacaoPulverizacao.Items.IndexOf(dmDB.TOperacaoSafratipoterraaereo.AsString);
          vIndexFinalidade                           := cbxFinalidadePulverizacao.Items.IndexOf(dmDB.TOperacaoSafrafinalidade.AsString);
          vIdCultura                                 := dmDB.TOperacaoSafraidcultura.AsString;
          cbxCulturaPulverizacao.ItemIndex           := cbxCulturaPulverizacao.Items.IndexOf(dmDB.TOperacaoSafraCultura.AsString);
          cbxQualidadeCobertura.Visible              := false;
          lblQualiCobertura.Visible                  := false;
          recVariedade.Visible                       := false;
          lblFinalidade.Visible                      := true;
          cbxFinalidadePulverizacao.Visible          := true;
          lblReceituario.Visible                     := true;
          edtReceituario.Visible                     := true;

          lblCobertura.Visible                       := false;
          cbxCobertura.Visible                       := false;


          cbxFinalidadePulverizacao.ItemIndex        := vIndexFinalidade;
          vIdreceituario                             := dmDB.TOperacaoSafraidreceituario.AsString;
          edtReceituario.text                        := dmDB.TOperacaoSafrareceituario.asstring;

          mudarAba(TbiNovaOperacao,sender);
       end;
       if (dmDB.TOperacaoSafraidoperacao.AsInteger=3)or
        (dmDB.TOperacaoSafraidoperacao.AsInteger=6) then
        begin
          cbxTipoOperacaoPulverizacao.Items.Clear;
          cbxTipoOperacaoPulverizacao.Items.Add(dmDB.TOperacaoSafratipoterraaereo.AsString);
          cbxTipoOperacaoPulverizacao.ItemIndex:=0;
          recSelectAtividade.Visible := false;
          TabAuxCadAtividade.TabPosition := TTabPosition.None;
          TabAuxCadAtividade.ActiveTab   := tbiPulverizacao;
          dmdb.TCulturas.Close;
          dmdb.TCulturas.Open;
          dmdb.TAuxCobertura.Close;
          dmdb.TAuxCobertura.Open;
          lblFinalidade.Visible                      := false;
          cbxFinalidadePulverizacao.Visible          := false;
          lblReceituario.Visible                     := false;
          edtReceituario.Visible                     := false;
          lblCobertura.Visible                       := true;
          cbxCobertura.Visible                       := true;
          cbxQualidadeCobertura.Visible              := true;
          lblQualiCobertura.Visible                  := true;
          cbxCobertura.ItemIndex                     := cbxCobertura.Items.IndexOf(dmDB.TOperacaoSafraCobertura.AsString);
          cbxVariedade.ItemIndex                     := cbxVariedade.Items.IndexOf(dmDB.TOperacaoSafraVariedade.AsString);
          vIdCobertura                               := dmDB.TOperacaoSafraidCobertura.AsString;
          cbxQualidadeCobertura.ItemIndex            := cbxQualidadeCobertura.Items.IndexOf(dmDB.TOperacaoSafraQualidadeCobertura.AsString);
          LayDetAtividade.Visible := true;
          vIdAtividade                               := dmDB.TOperacaoSafraidoperacao.AsString;
          vIdSafra                                   := dmDB.TOperacaoSafraidsafra.AsString;
          dmDB.vIdUser                               := dmDB.TOperacaoSafraidResponsavel.AsString;
          edtDataInicioPul.Date                      := dmDB.TOperacaoSafradatainicio.AsDateTime;
          edtAreaPrev.Text                           := dmDB.TOperacaoSafraareaPrevista.Asstring;
          if dmDB.TOperacaoSafradatafim.AsString.Length=0 then
           edtDataFimPul.Text                  := ''
          else
           edtDataFimPul.Date                        := dmDB.TOperacaoSafradatafim.AsDateTime;
          edtObservacaoAtividade.Text                := dmDB.TOperacaoSafraobservacao.AsString;
          vIdCultura                                 := dmDB.TOperacaoSafraidcultura.AsString;
          cbxCulturaPulverizacao.ItemIndex           := cbxCulturaPulverizacao.Items.IndexOf(dmDB.TOperacaoSafraCultura.AsString);
          vidVariedade                               := dmDB.TOperacaoSafraidvariedade.AsString;
          mudarAba(TbiNovaOperacao,sender);
       end;
       if dmDB.TOperacaoSafraidoperacao.AsInteger=4 then
        begin
          cbxQualidadeCobertura.Visible        := false;
          layReceiruario.Visible               := false;
          RecTipoOperacaoFinalidade.Visible    := false;
          RecCulturaCoberturaQualidade.Visible := true;
          lblCobertura.Visible                 := false;
          lblQualiCobertura.Visible            := false;
          cbxCobertura.Visible                 := false;
          lblCobertura.Visible                 := false;
          cbxCulturaPulverizacao.Visible       := true;
          lblCultura.Visible                   := true;

          recVariedade.Visible                 := true;
          RecObs.Visible                       := true;
          recDatas.Visible                     := true;
          TabAuxCadAtividade.TabPosition       := TTabPosition.None;
          TabAuxCadAtividade.ActiveTab         := tbiPulverizacao;
          LayDetAtividade.Visible              := true;
          recSelectAtividade.Visible           := false;
          cbxVariedade.ItemIndex               := cbxVariedade.Items.IndexOf(dmDB.TOperacaoSafraVariedade.AsString);
          vIdAtividade                         := dmDB.TOperacaoSafraidoperacao.AsString;
          vIdCultura                           := dmDB.TOperacaoSafraidcultura.AsString;
          cbxCulturaPulverizacao.ItemIndex     := cbxCulturaPulverizacao.Items.IndexOf(dmDB.TOperacaoSafraCultura.AsString);
          vIdSafra                             := dmDB.TOperacaoSafraidsafra.AsString;
          dmDB.vIdUser                         := dmDB.TOperacaoSafraidResponsavel.AsString;
          edtDataInicioPul.Date                := dmDB.TOperacaoSafradatainicio.AsDateTime;
          edtAreaPrev.Text                     := dmDB.TOperacaoSafraareaPrevista.Asstring;
          if dmDB.TOperacaoSafradatafim.AsString.Length=0 then
           edtDataFimPul.Text                  := ''
          else
           edtDataFimPul.Date                  := dmDB.TOperacaoSafradatafim.AsDateTime;
          edtObservacaoAtividade.Text          := dmDB.TOperacaoSafraobservacao.AsString;
          vidVariedade                         := dmDB.TOperacaoSafraidvariedade.AsString;
          mudarAba(TbiNovaOperacao,sender);
       end;
      end;
     end;
   end);
 end
 else
 begin
  FinalizaOperacaoExtra;
  myShowMenssagem('Operacao finalizada com sucesso!');
  GeraLista('');
 end;
end;

procedure TfrmOperacao.btnHabilitaSyncClick(Sender: TObject);
begin
 try
  dmDB.HabilitaSync(vIdOP);
  myShowMenssagem('Operacao Habilitada com sucesso!');
  laybtnLista.Visible := false;
 except
  on E: Exception do
    myShowMenssagem('Erro ao salvar Atividade:'+E.Message);
 end
end;

procedure TfrmOperacao.btnMaquinasClick(Sender: TObject);
begin
  btnEditar.Enabled        := vStatusConfere='1';
  btnNovaMaquina.Enabled   := (vStatusConfere='1') or (vIdOPTipo='5');
  btnExluirMaquina.Enabled := (vStatusConfere='1') or (vIdOPTipo='5');
  layBtnDet.Enabled := false;
  GeraListaMaquinas;
  tabDet.ActiveTab   := tbiMaquinasOP;
  tabDet.Visible     := true;
  layBtnDet.Enabled := true;
end;

procedure TfrmOperacao.btnNovaMaquinaClick(Sender: TObject);
begin
 if vIdOPTipo='4' then
 begin
   lblCapRomaneio.Visible := true;
   edtRomaneio.Visible    := true;
 end
 else
 begin
   lblCapRomaneio.Visible := false;
   edtRomaneio.Visible    := false;
 end;
 LimpaCampos;
 dmDb.TOperacaoSafraMaquinas.Close;
 dmDb.TOperacaoSafraMaquinas.Open;
 dmDb.TOperacaoSafraMaquinas.Insert;
// dmDb.TOperacaoSafraMaquinasidoperacaotalhao.AsString  := vIdOP;
// dmDb.TOperacaoSafraMaquinasidusuario.AsString         := dmDb.vIdUser;
 MudarAba(tbiMaquinas,sender);
end;

procedure TfrmOperacao.btnNovaOcorrenciaClick(Sender: TObject);
begin
 LimpaCampos;
 dmDb.TOperacaoSafraOcorrencia.Close;
 dmDb.TOperacaoSafraOcorrencia.Open;
 dmDb.TOperacaoSafraOcorrencia.Insert;
 dmDb.TOperacaoSafraOcorrenciaidoperacaotalhao.AsString  := vIdOP;
 dmDb.TOperacaoSafraOcorrenciaidusuario.AsString         := dmdb.vIdUser;
 MudarAba(tbiOcorrencia,sender);
end;

procedure TfrmOperacao.btnNovoProdutoClick(Sender: TObject);
begin
 LimpaCampos;
 dmDB.TOperacaoSafraProdutos.Close;
 dmDB.TOperacaoSafraProdutos.Open;
 dmDB.TOperacaoSafraProdutos.Insert;
 dmDb.TOperacaoSafraProdutosidoperacaotalhao.AsString  := vIdOP;
 dmDb.TOperacaoSafraProdutosidusuario.AsString         := dmdb.vIdUser;
 MudarAba(tbiProdutos,sender);
end;

procedure TfrmOperacao.btnOcorrenciaClick(Sender: TObject);
begin
  TThread.CreateAnonymousThread(procedure
  begin
   TThread.Synchronize(nil, procedure
   begin
     layBtnDet.Enabled            := false;
     btnNovaOcorrencia.Enabled    := vStatusConfere='1';
     btnExcluirOcorrencia.Enabled := vStatusConfere='1';
   end);
   dmDB.AbreOcorrenciaOperacao(vIdOP);
   tabDet.ActiveTab   := tbiOcorrenciaOP;
   tabDet.Visible     := true;
   TThread.Synchronize(nil, procedure
   begin
     layBtnDet.Enabled := true;
   end);
  end).Start;
end;

procedure TfrmOperacao.btnProdutosClick(Sender: TObject);
begin
 TThread.CreateAnonymousThread(procedure
  begin
   TThread.Synchronize(nil, procedure
   begin
     btnEditaProduto.Enabled   :=vStatusConfere='1';
     btnExcluirProduto.Enabled :=vStatusConfere='1';
     btnNovoProduto.Enabled    :=vStatusConfere='1';
     layBtnDet.Enabled := false;
   end);
  dmDB.AbreProdutoOperacao(vIdOP);
  GeraListaProdutos;
  tabDet.ActiveTab   := tbiProdutosOP;
  tabDet.Visible     := true;
  TThread.Synchronize(nil, procedure
   begin
     layBtnDet.Enabled := true;
   end);
 end).Start;
end;

procedure TfrmOperacao.btnSalvaPuverizacaoClick(Sender: TObject);
begin
 if edtDataInicioPul.Text.Length=0 then
 begin
   myShowMenssagem('Informe a Data de Inicio!!');
   edtDataIniAtividade.SetFocus;
   Exit;
 end;
 if (vIdAtividade='2') or (vIdAtividade='3')or (vIdAtividade='6') then
 begin
   if cbxTipoOperacaoPulverizacao.ItemIndex=-1 then
   begin
     myShowMenssagem('Informe o tipo Operacao!!');
     cbxTipoOperacaoPulverizacao.SetFocus;
     Exit;
   end;
   if cbxCulturaPulverizacao.ItemIndex=-1 then
   begin
     myShowMenssagem('Informe a Cultura!!');
     cbxCulturaPulverizacao.SetFocus;
     Exit;
   end;
 end;
 if vIdAtividade='2' then
 begin
   if edtReceituario.Text.Length=0 then
   begin
     myShowMenssagem('Informe o Receituario!!');
     edtReceituario.SetFocus;
     Exit;
   end;
   if cbxFinalidadePulverizacao.ItemIndex=-1 then
   begin
     myShowMenssagem('Informe a Finalidade!!');
     cbxFinalidadePulverizacao.SetFocus;
     Exit;
   end;
 end;
 if (vIdAtividade='3') or (vIdAtividade='4')or (vIdAtividade='6') then
 begin
   if cbxVariedade.ItemIndex=-1 then
   begin
     myShowMenssagem('Informe a Variedade!!');
     cbxVariedade.SetFocus;
     Exit;
   end;
   if (vIdAtividade='3')or (vIdAtividade='6') then
   begin
     if cbxCobertura.ItemIndex=-1 then
     begin
       myShowMenssagem('Informe a Cobertura!!');
       cbxCobertura.SetFocus;
       Exit;
     end;
     if cbxQualidadeCobertura.ItemIndex=-1 then
     begin
       myShowMenssagem('Informe a Qualidade Cobertura!!');
       cbxCobertura.SetFocus;
       Exit;
     end;
   end;
   if (vIdAtividade='4') then
   begin
    if cbxCulturaPulverizacao.ItemIndex=-1 then
    begin
     myShowMenssagem('Informe a Cultura!!');
     cbxCulturaPulverizacao.SetFocus;
     Exit;
    end;
   end;
 end;
 if vFinalizandoOP=0 then
 begin
  dmDB.TOperacaoSafraid.AsInteger            := RetornaIdOperacao;
  dmDB.TOperacaoSafraidoperacao.AsString     := vIdAtividade;
  dmDB.TOperacaoSafraidsafra.AsString        := vIdSafra;
  dmDB.TOperacaoSafraidResponsavel.AsString  := dmDB.vIdUser;
  dmDB.TOperacaoSafradatainicio.AsDateTime   := edtDataIniAtividade.Date;
  dmDB.TOperacaoSafraareaPrevista.Asstring   := edtAreaPrev.Text;

  if edtDataFimPul.Text.Length>0 then
   dmDB.TOperacaoSafradatafim.AsDateTime     := edtDataFimPul.Date;

  dmDB.TOperacaoSafraobservacao.AsString     := edtObservacaoPul.Text;

  if vIdAtividade<>'4'  then
   dmDB.TOperacaoSafratipoterraaereo.AsString := cbxTipoOperacaoPulverizacao.Selected.Text;

  if vIdAtividade='2' then
  begin
    dmDB.AlteraStatusReceituario(vIdReceituario,'3');
    dmDB.TOperacaoSafrafinalidade.AsString     := cbxFinalidadePulverizacao.Selected.Text;
    dmDB.TOperacaoSafraidreceituario.AsString  := vIdreceituario;
  end;

  if (vIdAtividade='3') or (vIdAtividade='6') then
  begin
   dmDB.TOperacaoSafraidcobertura.AsString         := vIdCobertura;
   dmDB.TOperacaoSafraQualidadeCobertura.AsString  := cbxQualidadeCobertura.Selected.Text;
   dmDB.TOperacaoSafraidvariedade.AsString         := vIdVariedade;
  end;
  if vIdAtividade<>'4' then
   dmDB.TOperacaoSafraidcultura.AsString            := vIdCultura
  else
  begin
   dmDB.TOperacaoSafraidvariedade.AsString         := vIdVariedade;
   dmDB.TOperacaoSafraidcultura.AsString           := vIdCultura;
  end;
  try
    dmDB.TOperacaoSafra.ApplyUpdates(-1);
    vIdPul    := dmDB.RetornaMaxIdAtividade;
    if vIdAtividade<>'2' then
    begin
     myShowMenssagem('Atividade Adicionada com sucesso, adicione os Talhoes');
     RecAddTalhao.Visible     := true;
     btnExcluirTalhao.Visible := true;
    end
    else
    begin
      dmDB.CriaDetPuverisacaoReceituario(vIdReceituario,
       vIdPul);
      RecAddTalhao.Visible     := false;
      btnExcluirTalhao.Visible := false;
    end;
    recSelectAtividade.Visible := false;
    BindSourceDB5.DataSet := nil;
    dmDB.AbreDetTalhoesPulverizacao(vIdPul);

    BindSourceDB5.DataSet := dmDB.TDetTalhoesPul;
    MudarAba(tbiTalhoesPuverizacao,sender);
    SomarColunasTalhoes;
  except
   on E: Exception do
    myShowMenssagem('Erro ao salvar Atividade:'+E.Message);
  end;
 end
 else
 begin
  if edtDataFimPul.Text.Length =0 then
  begin
    myShowMenssagem('Informe a Data Final!');
    Exit;
  end;
  if edtDataFimPul.Date<edtDataInicioPul.Date then
  begin
    myShowMenssagem('Data Final nao pode ser menor que inicial!');
    Exit;
  end;
  vIdPul       := dmDB.TOperacaoSafraID.AsString;
  vIdCobertura := dmDB.TOperacaoSafraidcobertura.AsString;
  BindSourceDB5.DataSet := nil;
  dmDB.AbreDetTalhoesPulverizacao(vIdPul);
  BindSourceDB5.DataSet := dmDB.TDetTalhoesPul;
  MudarAba(tbiTalhoesPuverizacao,sender);
  SomarColunasTalhoes;
 end;
end;

procedure TfrmOperacao.btnTalhoesClick(Sender: TObject);
begin
 layBtnDet.Enabled := false;
  vDetalhes := 1;
 BindSourceDB5.DataSet := nil;
 dmDB.AbreDetTalhoesPulverizacao(vIdOp);
 lblTotalRegistro.Text            := IntToStr(GridTalhoesPul.RowCount);
 vIdPul                           := vIdOp;
 BindSourceDB5.DataSet            := dmDB.TDetTalhoesPul;
 recSelectAtividade.Visible       := false;
 TabAuxCadAtividade.TabPosition   := TTabPosition.None;
 TabAuxCadAtividade.ActiveTab     := tbiTalhoesPuverizacao;
 layBtnDet.Enabled                := true;
 MudarAba(TbiNovaOperacao,sender);
end;

procedure TfrmOperacao.btnVazaoClick(Sender: TObject);
begin
  TThread.CreateAnonymousThread(procedure
  begin
   TThread.Synchronize(nil, procedure
   begin
     recVazao.Enabled  := vStatusConfere='1';
     layBtnDet.Enabled := false;
   end);
     if vFlagSync='1' then
      GridTalhoesPul.ReadOnly := true
     else
      GridTalhoesPul.ReadOnly := false;
     dmDB.AbreVazaoOperacao(vIdOP);
     if dmDB.TVazaoOperacao.IsEmpty then
     begin
       dmDB.TVazaoOperacao.Insert;
       dmDB.TVazaoOperacaoid.AsInteger                    := RetornaIdVazao;
       dmDB.TVazaoOperacaoidoperacaotalhao.AsString       := vidop;
       dmDB.TVazaoOperacaoidusuario.Asstring              := dmDB.vIdUser;
       dmDB.TVazaoOperacao.ApplyUpdates(-1);
     end;
     GeraVazao(vIdOP);
     tabDet.ActiveTab   := tbiVazaoOP;
     tabDet.Visible     := true;
     TThread.Synchronize(nil, procedure
     begin
       layBtnDet.Enabled := true;
     end);
  end).Start;
end;

procedure TfrmOperacao.btnVoltaOpClick(Sender: TObject);
begin

 recSelectAtividade.Visible := true;
 MudarAba(TabLista,sender);
end;

procedure TfrmOperacao.btnVoltaProdutoClick(Sender: TObject);
begin
 MudarAba(tbiDetalhes,sender);
end;

procedure TfrmOperacao.btnVoltarExtraClick(Sender: TObject);
begin
 MessageDlg('Deseja sair sem salvar Operação?', System.UITypes.TMsgDlgType.mtInformation,
  [System.UITypes.TMsgDlgBtn.mbYes,
  System.UITypes.TMsgDlgBtn.mbNo
  ], 0,
 procedure(const AResult: System.UITypes.TModalResult)
  begin
   case AResult of
   mrYES:
    begin
      mudaraba(tablista,sender);
    end;
   end;
 end);
end;

procedure TfrmOperacao.btnConfirmaExtraClick(Sender: TObject);
var
 idOperacao:integer;
begin
   if cbxTipoExtra.ItemIndex=-1 then
   begin
     myShowMenssagem('Informe o Tipo de Operacao!');
     Exit;
   end;
   if edtDataExtraAte.Date<edtDataExtraDe.Date then
   begin
     myShowMenssagem('Data Fim nao por ser menor que data inicio!');
     Exit;
   end;
   dmDb.TOperacaoSafra.Close;
   dmDb.TOperacaoSafra.Open;
   dmDb.TOperacaoSafra.Insert;
   idOperacao                                 := RetornaIdOperacao;
   dmDB.TOperacaoSafraid.AsInteger            := idOperacao;
   dmDB.TOperacaoSafraidoperacao.AsString     := vIdAtividade;
   dmDB.TOperacaoSafraidsafra.AsString        := vIdSafra;
   dmDB.TOperacaoSafraidResponsavel.AsString  := dmDB.vIdUser;
   dmDB.TOperacaoSafraidUsuario.AsString      := dmDB.vIdUser;
   dmDB.TOperacaoSafradatainicio.AsDateTime   := edtDataExtraDe.Date;
   dmDB.TOperacaoSafradatafim.AsDateTime      := edtDataExtraAte.Date;
   dmDB.TOperacaoSafraareaPrevista.AsInteger  := 0;
   dmDB.TOperacaoSafraobservacao.AsString     := edtObsExtra.Text;
   dmDB.TOperacaoSafratipoterraaereo.AsString := 'Terrestre';
   dmDB.TOperacaoSafrafinalidade.AsString     := cbxTipoExtra.Selected.Text;
   dmDB.TOperacaoSafrastatus.AsInteger        := 1;
   dmDB.TOperacaoSafraidcultura.AsInteger     := 90001;
   dmDB.TOperacaoSafraidvariedade.AsInteger   := 90001;
   dmDB.TOperacaoSafraidtalhao.AsInteger      := 0;
   try
    dmDB.TOperacaoSafra.ApplyUpdates(-1);
    vIdOP       := intToStr(idOperacao);
    AbreDetalhesOp(vIdOP);
    myShowMenssagem('Operaçao cadastrada com sucesso, informe as maquinas!');
    btnProdutos.Visible   := false;
    btnOcorrencia.Visible := false;
    btnTalhoes.Visible    := true;
    btnVazao.Visible      := false;
    Filtrar;
    MudarAba(TabLista,sender);
   except
    on E: Exception do
     myShowMenssagem('Erro ao salvar Ocorrencia:'+E.Message);
   end;
end;

procedure TfrmOperacao.btnConfirmaOcorrenciaClick(Sender: TObject);
begin
 if edtTipoOcorrencia.Text.Length=0 then
 begin
   myShowMenssagem('Informe o Tipo!!');
   edtTipoOcorrencia.SetFocus;
   Exit;
 end;
 if edtDescricao.Text.Length=0 then
 begin
   myShowMenssagem('Informe a Descrição!!');
   edtDescricao.SetFocus;
   Exit;
 end;
 if edtDataOcorrencia.Text.Length=0 then
 begin
   myShowMenssagem('Informe a Data!!');
   edtDataOcorrencia.SetFocus;
   Exit;
 end;
 dmDB.TOperacaoSafraOcorrenciadata.AsDateTime              := edtDataOcorrencia.Date;
 dmDB.TOperacaoSafraOcorrenciaidtipoocorrencia.AsString    := vIdTipoOcorrencia;
 dmDB.TOperacaoSafraOcorrenciadescricao.AsString           := edtDescricao.Text;
 try
   dmDB.TOperacaoSafraOcorrencia.ApplyUpdates(-1);
   myShowMenssagem('Ocorrencia Adicionada com sucesso!!');
   dmDB.AbreOcorrenciaOperacao(vIdOP);
   GeraListaOcorrencia;
   MudarAba(tbiDetalhes,sender);
 except
   on E: Exception do
    myShowMenssagem('Erro ao salvar Ocorrencia:'+E.Message);
 end;
end;

procedure TfrmOperacao.btnEditaProdutoClick(Sender: TObject);
begin
  if vIdProdutoSel.Length=0 then
  begin
    myShowMenssagem('Nenhum produto para editar!!');
    Exit;
  end;
  dmdb.TOperacaoSafraProdutos.Filtered := false;
  dmdb.TOperacaoSafraProdutos.Filter   :='id='+vIdProdutoSel;
  dmdb.TOperacaoSafraProdutos.Filtered := true;

  dmdb.TOperacaoSafraProdutos.Edit;
  vIdProduto            := dmdb.TOperacaoSafraProdutosidproduto.AsString;
  edtQtdeUtilizada.Text := dmdb.TOperacaoSafraProdutosqtdeutilidado.AsString;
  edtObsProduto.Text    := dmdb.TOperacaoSafraProdutosobservacao.AsString;
  edtDataProduto.Date   := dmdb.TOperacaoSafraProdutosdata.AsDateTime;
  edtProduto.Text       := dmdb.TOperacaoSafraProdutosProduto.AsString;
  edtProduto.Enabled    := false;
  MudarAba(tbiProdutos,sender);


end;

procedure TfrmOperacao.Button11Click(Sender: TObject);
begin
if chk5LTHA.Text ='X' then
  dmDB.TVazaoOperacaocincoltha.AsInteger          :=1
 else
  dmDB.TVazaoOperacaocincoltha.AsInteger          :=0;

 if chk10LTHA.Text ='X' then
  dmDB.TVazaoOperacaodezltha.AsInteger            :=1
 else
  dmDB.TVazaoOperacaodezltha.AsInteger            :=0;

 if chk15LTHA.Text ='X' then
  dmDB.TVazaoOperacaoquinzeltha.AsInteger         :=1
 else
  dmDB.TVazaoOperacaoquinzeltha.AsInteger         :=0;

 if chk20LTHA.Text ='X' then
  dmDB.TVazaoOperacaovinteltha.AsInteger          :=1
 else
  dmDB.TVazaoOperacaovinteltha.AsInteger          :=0;

 if chk30LTHA.Text ='X' then
  dmDB.TVazaoOperacaotrintaltha.AsInteger         :=1
 else
  dmDB.TVazaoOperacaotrintaltha.AsInteger         :=0;

 if chk40LTHA.Text ='X' then
  dmDB.TVazaoOperacaoquarentaltha.AsInteger       :=1
 else
  dmDB.TVazaoOperacaoquarentaltha.AsInteger       :=0;

 if chk50LTHA.Text ='X' then
  dmDB.TVazaoOperacaocinquentaltha.AsInteger      :=1
 else
  dmDB.TVazaoOperacaocinquentaltha.AsInteger      :=0;

 if chk75LTHA.Text ='X' then
  dmDB.TVazaoOperacaosetentaecincoltha.AsInteger  :=1
 else
  dmDB.TVazaoOperacaosetentaecincoltha.AsInteger  :=0;

 if chk100LTHA.Text ='X' then
  dmDB.TVazaoOperacaocemltha.AsInteger            :=1
 else
  dmDB.TVazaoOperacaocemltha.AsInteger            :=0;

 try
   dmDB.TVazaoOperacao.ApplyUpdates(-1);
   ShowMessage('Vazão Adicionada com sucesso!!');
    MudarAba(TabLista,sender);
 except
   on E: Exception do
    ShowMessage('Erro ao salvar Vazao:'+E.Message);
 end;
end;

procedure TfrmOperacao.Button16Click(Sender: TObject);
begin
 MudarAba(TabLista,sender);
end;

procedure TfrmOperacao.Button1Click(Sender: TObject);
begin
 MudarAba(TabLista,sender);
end;

procedure TfrmOperacao.Button2Click(Sender: TObject);
begin
 laybtnLista.Visible := false;
 vDetalhes := 0;
 recSelectAtividade.Visible := true;
 vFinalizandoOP :=0;
 LimpaCampos;
 LayDetAtividade.Visible := false;
 dmDb.TOperacaoSafra.Close;
 dmDb.TOperacaoSafra.Open;
 dmDb.TOperacaoSafra.Insert;
 dmDb.TOperacaoSafraidsafra.AsString   := vIdSafra;
 dmDb.TOperacaoSafraidtalhao.AsString  := vIdTalhao;
 dmDb.TOperacaoSafraidusuario.AsString := dmDb.vIdUser;
 edtDataFimPul.Text                    := '';
 MudarAba(TbiNovaOperacao,sender);
end;

procedure TfrmOperacao.Button3Click(Sender: TObject);
begin
 MudarAba(tbiDetalhes,sender);
end;

procedure TfrmOperacao.btnConfirmaTalhaoClick(Sender: TObject);
var
 vHoraIni,vHoraControle:TTimer;
 vQry:TFDQuery;
begin
 if (vDetalhes = 1) and (vFinalizandoOP=0) then
 begin
   MudarAba(tbiDetalhes,Sender);
   Exit;
 end;
 recSelectAtividade.Enabled := true;
 vQry:=TFDQuery.Create(nil);
 vQry.Connection := dmDB.FDConn;
 if GridTalhoesPul.RowCount=0 then
 begin
   myShowMenssagem('Informe pelo menos um talhão!!');
   Exit;
 end
 else
 begin
  dmDB.AtualizaAreaPrevPul(vIdPul);
  if vFinalizandoOP=0 then
   myShowMenssagem('Operação Registrada com Sucesso!!')
  else //finalizacao
  begin
   if lblAreaTotalReal.Text = 'Area Real.: 0' then
   begin
     myShowMenssagem('Informe a area realizada!!');
     Exit;
   end;
   //atualiza operacao puverização master
   if vTipoOperacao=2 then
   begin
     dmDB.TOperacaoSafraidoperacao.AsString     := vIdAtividade;
     dmDB.TOperacaoSafraidsafra.AsString        := vIdSafra;
     dmDB.TOperacaoSafraidResponsavel.AsString  := dmDB.vIdUser;
     dmDB.TOperacaoSafradatainicio.AsDateTime   := edtDataInicioPul.Date;
     dmDB.TOperacaoSafraareaPrevista.Asstring   := edtAreaPrev.Text;
     dmDB.TOperacaoSafradatafim.AsDateTime      := edtDataFimPul.Date;
     dmDB.TOperacaoSafraobservacao.AsString     := edtObservacaoAtividade.Text;
     dmDB.TOperacaoSafratipoterraaereo.AsString := cbxTipoOperacaoPulverizacao.Selected.Text;
     dmDB.TOperacaoSafrafinalidade.AsString     := cbxFinalidadePulverizacao.Selected.Text;
     dmDB.TOperacaoSafraidcultura.AsString      := vIdCultura;
     dmDB.TOperacaoSafraidreceituario.AsString  := vIdreceituario;
     dmDB.TOperacaoSafrastatus.AsInteger        := 2;
     dmDB.TOperacaoSafraFlagSync.AsInteger      := 9000;
     dmDB.TOperacaoSafra.ApplyUpdates(-1);
     dmDB.AlteraStatusReceituario(vIdreceituario,'2');
   end;
   if (vTipoOperacao=3) or (vTipoOperacao=6) then
   begin
     dmDB.TOperacaoSafraidoperacao.AsString     := vIdAtividade;
     dmDB.TOperacaoSafraidsafra.AsString        := vIdSafra;
     dmDB.TOperacaoSafraidResponsavel.AsString  := dmDB.vIdUser;
     dmDB.TOperacaoSafradatainicio.AsDateTime   := edtDataInicioPul.Date;
     dmDB.TOperacaoSafraareaPrevista.Asstring   := edtAreaPrev.Text;
     dmDB.TOperacaoSafradatafim.AsDateTime      := edtDataFimPul.Date;
     dmDB.TOperacaoSafraobservacao.AsString     := edtObservacaoAtividade.Text;
     dmDB.TOperacaoSafratipoterraaereo.AsString := cbxTipoOperacaoPulverizacao.Selected.Text;
     dmDB.TOperacaoSafraidcobertura.AsString    := vIdCobertura;
     dmDB.TOperacaoSafraidcultura.AsString      := vIdCultura;
     dmDB.TOperacaoSafraidvariedade.AsString    := vIdVariedade;
     dmDB.TOperacaoSafrastatus.AsInteger        := 2;
     dmDB.TOperacaoSafraQualidadeCobertura.AsString := cbxQualidadeCobertura.Selected.Text;
     dmDB.TOperacaoSafraFlagSync.AsInteger      := 9000;
     dmDB.TOperacaoSafra.ApplyUpdates(-1);
   end;
   if vTipoOperacao=4 then
   begin
     dmDB.TOperacaoSafraidoperacao.AsString     := vIdAtividade;
     dmDB.TOperacaoSafraidsafra.AsString        := vIdSafra;
     dmDB.TOperacaoSafraidResponsavel.AsString  := dmDB.vIdUser;
     dmDB.TOperacaoSafradatainicio.AsDateTime   := edtDataInicioPul.Date;
     dmDB.TOperacaoSafraareaPrevista.Asstring   := edtAreaPrev.Text;
     dmDB.TOperacaoSafradatafim.AsDateTime      := edtDataFimPul.Date;
     dmDB.TOperacaoSafraobservacao.AsString     := edtObservacaoAtividade.Text;
     dmDB.TOperacaoSafraidcultura.AsString      := vIdCultura;
     dmDB.TOperacaoSafraidvariedade.AsString    := vIdVariedade;
     dmDB.TOperacaoSafrastatus.AsInteger        := 2;
     dmDB.TOperacaoSafraidOpMaster.AsString     := vIdOp;
     dmDB.TOperacaoSafraidtalhao.AsString       := dmDB.TDetTalhoesPulidTalhao.AsString;
     dmDB.TOperacaoSafraarearealizada.AsString  := dmDB.RetornaAreaRealizada(vIdPul);
     dmDB.TOperacaoSafraFlagSync.AsInteger      := 9000;
     dmDB.TOperacaoSafra.ApplyUpdates(-1);
   end
   else
   begin
    dmDB.TDetTalhoesPul.First;
    //quebra operacao puverização master
    while not dmDB.TDetTalhoesPul.eof do
    begin
      dmDB.TOperacaoSafra.Close;
      dmDB.TOperacaoSafra.Open;
      dmDB.TOperacaoSafra.Insert;
      dmDB.TOperacaoSafraid.AsInteger                  := RetornaIdOperacao;
      dmDB.TOperacaoSafraidoperacao.AsString           := vIdAtividade;
      dmDB.TOperacaoSafraidsafra.AsString              := vIdSafra;
      dmDB.TOperacaoSafraidResponsavel.AsString        := dmDB.vIdUser;
      dmDB.TOperacaoSafradatainicio.AsDateTime         := edtDataInicioPul.Date;
      dmDB.TOperacaoSafraareaPrevista.Asstring         := dmDB.TDetTalhoesPulAreaPrevista.AsString;
      dmDB.TOperacaoSafraarearealizada.Asstring        := dmDB.TDetTalhoesPulAreaRealizada.AsString;
      dmDB.TOperacaoSafradatafim.AsDateTime            := edtDataFimPul.Date;
      dmDB.TOperacaoSafraidtalhao.AsString             := dmDB.TDetTalhoesPulidTalhao.AsString;
      dmDB.TOperacaoSafraobservacao.AsString           := edtObservacaoAtividade.Text;
      dmDB.TOperacaoSafraidcobertura.AsString          := vIdCobertura;
      if vTipoOperacao=2 then
      begin
       dmDB.TOperacaoSafratipoterraaereo.AsString := cbxTipoOperacaoPulverizacao.Selected.Text;
       dmDB.TOperacaoSafrafinalidade.AsString     := cbxFinalidadePulverizacao.Selected.Text;
       dmDB.TOperacaoSafraidcultura.AsString      := vIdCultura;
       dmDB.TOperacaoSafraidreceituario.AsString  := vIdreceituario;
      end;
      if vTipoOperacao=1 then
      begin
       dmDB.TOperacaoSafraidcultura.AsString             := vIdCultura;
       dmDB.TOperacaoSafratipoterraaereo.AsString        := cbxTipoOperacaoSolid.Selected.Text;
       dmDB.TOperacaoSafraidtipoaplicacaosolido.AsString := vIdTipoAplicacaoSolido;
       dmDB.TOperacaoSafratipoterraaereo.AsString        := cbxTipoAplicacaoSolido.Selected.Text;
      end;
      if(vTipoOperacao=3) or (vTipoOperacao=6) then
      begin
       dmDB.TOperacaoSafraidcultura.AsString             := vIdCultura;
       dmDB.TOperacaoSafraidcobertura.AsString           := vIdCobertura;
       dmDB.TOperacaoSafraQualidadeCobertura.AsString    := cbxQualidadeCobertura.Selected.Text;
       dmDB.TOperacaoSafraidvariedade.AsString           := vIdVariedade;
       dmDB.TOperacaoSafratipoterraaereo.AsString        := cbxTipoOperacaoPulverizacao.Selected.Text;
      end;
      if vTipoOperacao=4 then
      begin
       dmDB.TOperacaoSafraidvariedade.AsString           := vIdVariedade;
       dmDB.TOperacaoSafraidcultura.AsString             := vIdCultura;
      end;
      dmDB.TOperacaoSafraidusuario.AsString      := dmDB.vIdUser;
      dmDB.TOperacaoSafrastatus.AsInteger        := 3;
      dmDB.TOperacaoSafraidOpMaster.AsString     := vIdPul;
      dmDB.TOperacaoSafra.ApplyUpdates(-1);
      dmDB.TDetTalhoesPul.Next;
    end;
     //quebra operacao puverização maquinas
     dmDB.qryOperacaoQuebrada.Close;
     dmDB.qryOperacaoQuebrada.Open;
     dmDB.qryOperacaoQuebrada.Filtered := false;
     dmDB.qryOperacaoQuebrada.Filter   := 'idOpMaster='+vIdPul;
     dmDB.qryOperacaoQuebrada.Filtered := true;
     dmDB.qryOperacaoQuebrada.First;
     while not dmDB.qryOperacaoQuebrada.Eof do
     begin
       dmDB.qryQuebraMaquinasPul.Close;
       dmDB.qryQuebraMaquinasPul.Open;
       dmDB.qryQuebraMaquinasPul.Filtered := false;
       dmDB.qryQuebraMaquinasPul.Filter   := 'idOperacaoTalhao='+vIdPul+' and idTalhao='+dmDB.qryOperacaoQuebradaidtalhao.AsString;
       dmDB.qryQuebraMaquinasPul.Filtered := true;
       while not dmDB.qryQuebraMaquinasPul.eof do
       begin
         dmdb.TOperacaoSafraMaquinas.Close;
         dmdb.TOperacaoSafraMaquinas.Open;
         dmdb.TOperacaoSafraMaquinas.Insert;
         dmdb.TOperacaoSafraMaquinasidoperacaotalhao.AsString  := dmDB.qryOperacaoQuebradaid.AsString;
         dmdb.TOperacaoSafraMaquinasidmaquina.AsString         := dmDB.qryQuebraMaquinasPulidmaquina.AsString;
         dmdb.TOperacaoSafraMaquinasoperador.AsString          := dmDB.qryQuebraMaquinasPuloperador.AsString;
         dmdb.TOperacaoSafraMaquinashorainicio.AsString        := StringReplace(dmDB.qryQuebraMaquinasPulhorainicio.AsString,'.',',',[rfReplaceAll]);;
         dmdb.TOperacaoSafraMaquinashorafim.AsString           := StringReplace(dmDB.qryQuebraMaquinasPulhorafim.AsString,'.',',',[rfReplaceAll]);;
         dmdb.TOperacaoSafraMaquinashoraparada.AsString        := StringReplace(dmDB.qryQuebraMaquinasPulhoraparada.AsString,'.',',',[rfReplaceAll]);
         dmdb.TOperacaoSafraMaquinashoraTrabalhada.AsString    := StringReplace(dmDB.qryQuebraMaquinasPulHorasTalhaoPercent.AsString,'.',',',[rfReplaceAll]);;
         dmdb.TOperacaoSafraMaquinasdata.AsDateTime            := dmDB.qryQuebraMaquinasPuldata.AsDateTime;
         dmdb.TOperacaoSafraMaquinasobservacao.AsString        := dmDB.qryQuebraMaquinasPulobservacao.AsString;
         dmdb.TOperacaoSafraMaquinasidOperador.AsString        := dmDB.qryQuebraMaquinasPulidOperador.AsString;
         dmdb.TOperacaoSafraMaquinasidUsuario.AsString         := dmDB.vIdUser;
         dmdb.TOperacaoSafraMaquinas.ApplyUpdates(-1);
         dmDB.qryQuebraMaquinasPul.Next;
       end;
       //quebra produtos
       dmDB.qryQuebraProdutosPul.Close;
       dmDB.qryQuebraProdutosPul.Open;
       dmDB.qryQuebraProdutosPul.Filtered := false;
       dmDB.qryQuebraProdutosPul.Filter   := 'idOperacaoTalhao='+vIdPul+' and idTalhao='+dmDB.qryOperacaoQuebradaidtalhao.AsString;
       dmDB.qryQuebraProdutosPul.Filtered := true;
       while not dmDB.qryQuebraProdutosPul.eof do
       begin
         dmdb.TOperacaoSafraProdutos.Close;
         dmdb.TOperacaoSafraProdutos.Open;
         dmdb.TOperacaoSafraProdutos.Insert;
         dmdb.TOperacaoSafraProdutosidoperacaotalhao.AsString   := dmDB.qryOperacaoQuebradaid.AsString;
         dmdb.TOperacaoSafraProdutosidproduto.AsString          := dmDB.qryQuebraProdutosPulIdProduto.AsString;
         dmdb.TOperacaoSafraProdutosqtdeutilidado.AsString      := dmDB.qryQuebraProdutosPulQtdeUtilizadaTalhao.AsString;
         dmdb.TOperacaoSafraProdutosobservacao.AsString         := dmDB.qryQuebraProdutosPulobservacao.AsString;
         dmdb.TOperacaoSafraProdutosdata.AsDateTime             := dmDB.qryQuebraProdutosPuldata.AsDateTime;
         dmdb.TOperacaoSafraProdutosidUsuario.AsString          := dmDB.vIdUser;
         dmdb.TOperacaoSafraProdutos.ApplyUpdates(-1);
         dmDB.qryQuebraProdutosPul.Next
       end;
       //quebra Ocorrencia
       dmDB.qryQuebraOcorrenciaPul.Close;
       dmDB.qryQuebraOcorrenciaPul.Open;
       dmDB.qryQuebraOcorrenciaPul.Filtered := false;
       dmDB.qryQuebraOcorrenciaPul.Filter   := 'idOperacaoTalhao='+vIdPul+' and idTalhao='+dmDB.qryOperacaoQuebradaidtalhao.AsString;
       dmDB.qryQuebraOcorrenciaPul.Filtered := true;
       while not dmDB.qryQuebraOcorrenciaPul.eof do
       begin
         dmDB.TOperacaoSafraOcorrencia.Close;
         dmDB.TOperacaoSafraOcorrencia.Open;
         dmDB.TOperacaoSafraOcorrencia.Insert;
         dmDB.TOperacaoSafraOcorrenciaidoperacaotalhao.AsString    := dmDB.qryOperacaoQuebradaid.AsString;
         dmDB.TOperacaoSafraOcorrenciadata.AsDateTime              := dmDB.qryQuebraOcorrenciaPulData.AsDateTime;
         dmDB.TOperacaoSafraOcorrenciaidtipoocorrencia.AsString    := dmDB.qryQuebraOcorrenciaPulidtipoocorrencia.AsString;
         dmDB.TOperacaoSafraOcorrenciadescricao.AsString           := dmDB.qryQuebraOcorrenciaPuldescricao.AsString;
         dmdb.TOperacaoSafraOcorrenciaidUsuario.AsString           := dmDB.vIdUser;
         dmDB.TOperacaoSafraOcorrencia.ApplyUpdates(-1);
         dmDB.qryQuebraOcorrenciaPul.Next
       end;
       //quebra Ocorrencia
       dmDB.TVazaoOperacao.Close;
       dmDB.TVazaoOperacao.Open;
       dmDB.TVazaoOperacao.Filtered := false;
       dmDB.TVazaoOperacao.Filter   := 'idOperacaoTalhao='+vIdPul;
       dmDB.TVazaoOperacao.Filtered := true;
       if not dmDB.TVazaoOperacao.IsEmpty then
       begin
         dmDB.qryQuebraVazaoOperacao.Close;
         dmDB.qryQuebraVazaoOperacao.Open;
         dmDB.qryQuebraVazaoOperacao.Insert;
         dmDB.qryQuebraVazaoOperacaoid.AsInteger                  :=  RetornaIdVazao;
         dmDB.qryQuebraVazaoOperacaoidoperacaotalhao.AsString     :=  dmDB.qryOperacaoQuebradaid.AsString;
         dmDB.qryQuebraVazaoOperacaoidusuario.AsInteger           :=  dmDB.TVazaoOperacaoidusuario.AsInteger;
         dmDB.qryQuebraVazaoOperacaoCincoLTHA.AsInteger           :=  dmDB.TVazaoOperacaoCincoLTHA.AsInteger;
         dmDB.qryQuebraVazaoOperacaoDezLTHA.AsInteger             :=  dmDB.TVazaoOperacaoDezLTHA.AsInteger;
         dmDB.qryQuebraVazaoOperacaoQuinzeLTHA.AsInteger          :=  dmDB.TVazaoOperacaoQuinzeLTHA.AsInteger;
         dmDB.qryQuebraVazaoOperacaoVinteLTHA.AsInteger           :=  dmDB.TVazaoOperacaoVinteLTHA.AsInteger;
         dmDB.qryQuebraVazaoOperacaoTrintaLTHA.AsInteger          :=  dmDB.TVazaoOperacaoTrintaLTHA.AsInteger;
         dmDB.qryQuebraVazaoOperacaoQuarentaLTHA.AsInteger        :=  dmDB.TVazaoOperacaoQuarentaLTHA.AsInteger;
         dmDB.qryQuebraVazaoOperacaoCinquentaLTHA.AsInteger       :=  dmDB.TVazaoOperacaoCinquentaLTHA.AsInteger;
         dmDB.qryQuebraVazaoOperacaoSetentaeCincoLTHA.AsInteger   :=  dmDB.TVazaoOperacaoSetentaeCincoLTHA.AsInteger;
         dmDB.qryQuebraVazaoOperacaoCemLTHA.AsInteger             :=  dmDB.TVazaoOperacaoCemLTHA.AsInteger;
         dmDB.qryQuebraVazaoOperacao.ApplyUpdates(-1);
       end;
       dmDB.qryOperacaoQuebrada.Next;
     end;
   end;
   myShowMenssagem('Operação Finalizada com Sucesso!!');
  end;
  MudarAba(TabLista,sender);
  GeraLista('');
 end;
end;

procedure TfrmOperacao.CarregaCombo;
begin
  dmdb.TCulturas.Close;
  dmdb.TCulturas.Open;
  dmdb.TCulturas.First;
  cbxCulturaPulverizacao.Items.Clear;
  cbxCulturaapl.Items.Clear;
  while not dmdb.TCulturas.eof do
  begin
    cbxCulturaPulverizacao.Items.Add(dmdb.TCulturasnome.AsString);
    cbxCulturaapl.Items.Add(dmdb.TCulturasnome.AsString);
    dmdb.TCulturas.Next;
  end;

  dmdb.TCultivares.Close;
  dmdb.TCultivares.Open;
  dmdb.TCultivares.First;
  cbxVariedade.Items.Clear;
  while not dmdb.TCultivares.eof do
  begin
   cbxVariedade.Items.Add(dmdb.TCultivaresnome.AsString);
   dmdb.TCultivares.next;
  end;

  dmdb.TAuxCobertura.Close;
  dmdb.TAuxCobertura.Open;
  dmdb.TAuxCobertura.First;
  while not dmdb.TAuxCobertura.eof do
  begin
   cbxCobertura.Items.Add(dmdb.TAuxCoberturanome.AsString);
   dmdb.TAuxCobertura.next;
  end;
end;

procedure TfrmOperacao.CarregaComboFiltros;
begin
 dmDB.TTalhoes.Close;
 dmDB.TTalhoes.Open();
 dmDB.TTalhoes.Filtered := false;
 dmDB.TTalhoes.Filter   := 'STATUS=1';
 dmDB.TTalhoes.Filtered := true;
 cbxTalhaoF.Items.Clear;
 cbxTalhaoF.Items.Add('Todos');
 while not dmDB.TTalhoes.Eof do
 begin
   cbxTalhaoF.Items.Add(dmDB.TTalhoesnome.AsString);
   dmDB.TTalhoes.Next;
 end;
 cbxTalhaoF.ItemIndex :=0;

 dmDB.TSetor.Close;
 dmDB.TSetor.Open();
 dmDB.TSetor.Filtered := false;
 dmDB.TSetor.Filter   := 'STATUS=1';
 dmDB.TSetor.Filtered := true;
 cbxSetorF.Items.Clear;
 cbxSetorF.Items.Add('Todos');
 while not dmDB.TSetor.Eof do
 begin
   cbxSetorF.Items.Add(dmDB.TSetornome.AsString);
   dmDB.TSetor.Next;
 end;
 cbxSetorF.ItemIndex :=0;
end;

procedure TfrmOperacao.cbxCoberturaChange(Sender: TObject);
begin
 if dmFunctions=nil then
   dmFunctions := TdmFunctions.Create(Self);
 if cbxCobertura.ItemIndex>-1 then
  vIdCobertura := dmFunctions.RetornaIdCobertura(cbxCobertura.Selected.Text);
end;

procedure TfrmOperacao.cbxCulturaAplChange(Sender: TObject);
begin
 if dmFunctions=nil then
   dmFunctions := TdmFunctions.Create(Self);
 if cbxCulturaApl.ItemIndex>-1 then
  vIdCultura := dmFunctions.RetornaIdCultura(cbxCulturaApl.Selected.Text);
end;

procedure TfrmOperacao.cbxCulturaPulverizacaoChange(Sender: TObject);
begin
 if dmFunctions=nil then
   dmFunctions := TdmFunctions.Create(Self);
 if cbxCulturaPulverizacao.ItemIndex>-1 then
  vIdCultura := dmFunctions.RetornaIdCultura(cbxCulturaPulverizacao.Selected.Text);
end;

procedure TfrmOperacao.cbxTipoAplicacaoSolidoChange(Sender: TObject);
begin
 if cbxTipoAplicacaoSolido.ItemIndex>-1 then
  vIdTipoAplicacaoSolido := LinkFillControlToFieldnome.BindList.GetSelectedValue.AsString;
end;

procedure TfrmOperacao.cbxVariedadeChange(Sender: TObject);
begin
 if dmFunctions=nil then
  dmFunctions := TdmFunctions.Create(Self);

 if cbxVariedade.ItemIndex>-1 then
  vIdVariedade := dmFunctions.RetornaIdVariedade(cbxVariedade.Selected.Text);
end;

procedure TfrmOperacao.chk100LTHAClick(Sender: TObject);
begin
 if chk100LTHA.Text='' then
   chk100LTHA.Text :='X'
  else
   chk100LTHA.Text :='';
  Exit;
end;

procedure TfrmOperacao.chk10LTHAClick(Sender: TObject);
begin
  if chk10LTHA.Text='' then
   chk10LTHA.Text :='X'
  else
   chk10LTHA.Text :='';
  Exit;
end;

procedure TfrmOperacao.chk15LTHAClick(Sender: TObject);
begin
  if chk15LTHA.Text='' then
   chk15LTHA.Text :='X'
  else
   chk15LTHA.Text :='';
  Exit;
end;

procedure TfrmOperacao.chk20LTHAClick(Sender: TObject);
begin
 if chk20LTHA.Text='' then
   chk20LTHA.Text :='X'
  else
   chk20LTHA.Text :='';
 Exit;
end;

procedure TfrmOperacao.chk30LTHAClick(Sender: TObject);
begin
 if chk30LTHA.Text='' then
   chk30LTHA.Text :='X'
  else
   chk30LTHA.Text :='';
 Exit;
end;

procedure TfrmOperacao.chk40LTHAClick(Sender: TObject);
begin
 if chk40LTHA.Text='' then
   chk40LTHA.Text :='X'
  else
   chk40LTHA.Text :='';
  Exit;
end;

procedure TfrmOperacao.chk50LTHAClick(Sender: TObject);
begin
  if chk50LTHA.Text='' then
   chk50LTHA.Text :='X'
  else
   chk50LTHA.Text :='';
  Exit;
end;

procedure TfrmOperacao.chk5LTHAClick(Sender: TObject);
begin
  if chk5LTHA.Text='' then
   chk5LTHA.Text :='X'
  else
   chk5LTHA.Text :='';
  Exit;
end;

procedure TfrmOperacao.chk75LTHAClick(Sender: TObject);
begin
  if chk75LTHA.Text='' then
   chk75LTHA.Text :='X'
  else
   chk75LTHA.Text :='';
  Exit;
end;

procedure TfrmOperacao.EditButton1Click(Sender: TObject);
begin
  CarregaCombo;
  frmAtividades := TfrmAtividades.Create(Self);
  try
    frmAtividades.ShowModal(
    procedure(ModalResult: TModalResult)
    begin
      edtAtividade.Text := dmDB.TOperacoesnome.AsString;
      vIdAtividade      := dmDB.TOperacoesid.AsString;
      vIdOPTipo         := vIdAtividade;
      if vIdAtividade='1' then
      begin
        dmDb.TTipoAplicacaoSolido.Close;
        dmDb.TTipoAplicacaoSolido.Open;
        dmDb.TTipoAplicacaoSolido.Filtered := false;
        dmDb.TTipoAplicacaoSolido.Filter   := 'Status=1';
        dmDb.TTipoAplicacaoSolido.Filtered := True;
        TabAuxCadAtividade.TabPosition := TTabPosition.None;
        TabAuxCadAtividade.ActiveTab   := tbiApliSolidos;
        LayDetAtividade.Visible := true;
        recVariedade.Visible := false;
      end;
      if vIdAtividade='2' then
      begin
        cbxTipoOperacaoPulverizacao.Items.Clear;
        cbxTipoOperacaoPulverizacao.Items.Add('Terrestre');
        cbxTipoOperacaoPulverizacao.Items.Add('Aéreo');
        cbxTipoOperacaoPulverizacao.ItemIndex :=-1;
        edtreceituario.Text     := '';
        lblCobertura.Visible    := false;
        cbxCobertura.Visible    := false;
        cbxQualidadeCobertura.Visible := false;
        lblQualiCobertura.Visible     := false;
        layReceiruario.Visible  := true;
        lblReceituario.Visible  := true;
        edtReceituario.Visible  := true;
        lblfinalidade.visible   := true;
        cbxFinalidadePulverizacao.Visible := true;
        recVariedade.Visible := false;
//        recSelectAtividade.Visible := false;
        TabAuxCadAtividade.TabPosition := TTabPosition.None;
        TabAuxCadAtividade.ActiveTab   := tbiPulverizacao;
        BindSourceDB6.DataSet := nil;
        BindSourceDB6.DataSet := dmDB.TCulturas;
        LayDetAtividade.Visible := true;
      end;
      if (vIdAtividade='3') OR (vIdAtividade='6') then
      begin
        cbxCulturaApl.Visible:= true;
        cbxTipoOperacaoPulverizacao.Items.Clear;
        cbxTipoOperacaoPulverizacao.Items.Add('Convencional');
        cbxTipoOperacaoPulverizacao.Items.Add('Direto');
        cbxTipoOperacaoPulverizacao.ItemIndex :=-1;
        lblCobertura.Visible              := true;
        cbxCobertura.Visible              := true;
        lblQualiCobertura.Visible         := true;
        cbxQualidadeCobertura.Visible     := true;
        lblReceituario.Visible            := false;
        edtReceituario.Visible            := false;
        layReceiruario.Visible            := false;
        lblfinalidade.visible             := false;
        cbxFinalidadePulverizacao.Visible := false;
        recSelectAtividade.Visible        := false;
        TabAuxCadAtividade.TabPosition    := TTabPosition.None;
        TabAuxCadAtividade.ActiveTab      := tbiPulverizacao;
        BindSourceDB6.DataSet             := nil;
        BindSourceDB6.DataSet             := dmDB.TCulturas;
        LayDetAtividade.Visible           := true;
        recVariedade.Visible              := true;
      end;
      if vIdAtividade='4' then
      begin
        layReceiruario.Visible               := false;
        RecTipoOperacaoFinalidade.Visible    := false;
        RecCulturaCoberturaQualidade.Visible := true;
        lblCobertura.Visible                 := false;
        lblQualiCobertura.Visible            := false;
        cbxQualidadeCobertura.Visible        := false;
        cbxCobertura.Visible                 := false;
        lblCobertura.Visible                 := false;
        recVariedade.Visible                 := true;
        cbxCulturaPulverizacao.Visible       := true;
        lblCultura.Visible                   := true;
        RecObs.Visible                       := true;
        recDatas.Visible                     := true;
        TabAuxCadAtividade.TabPosition       := TTabPosition.None;
        TabAuxCadAtividade.ActiveTab         := tbiPulverizacao;
        BindSourceDB6.DataSet                := nil;
        BindSourceDB6.DataSet                := dmDB.TCulturas;
        LayDetAtividade.Visible              := true;
      end;
      if vIdAtividade='5' then
      begin
        edtobsextra.Text                  :='';
        cbxTipoExtra.ItemIndex            :=-1;
        TabAuxCadAtividade.TabPosition    := TTabPosition.None;
        TabAuxCadAtividade.ActiveTab      := tbiAtividadeExtra;
        LayDetAtividade.Visible           := true;
      end;
    end);
  finally
    frmAtividades.free;
  end;
end;

procedure TfrmOperacao.EditButton2Click(Sender: TObject);
begin
  frmMaquinas := TfrmMaquinas.Create(Self);
  try
    frmMaquinas.ShowModal(
    procedure(ModalResult: TModalResult)
    begin
      edtMaquina.Text   := dmDB.vMarcaModelo;
      vIdMaquina        := dmDB.vIdMaquinaSel;
    end);
  finally
    frmMaquinas.free;
  end;
end;

procedure TfrmOperacao.EditButton3Click(Sender: TObject);
begin
  frmTalhoes := TfrmTalhoes.Create(Self);
  try
    frmTalhoes.ShowModal(
    procedure(ModalResult: TModalResult)
    begin
      vIdTalhao         := dmDB.vIdTalhao;
      edtTalhao.Text    := dmDB.vNomeTalhao;
      edtAreaPrev.Text  := dmDB.vAreaTalhao;
      try
       SomarColunasTalhoes;
      except
       on E: Exception do
         myShowMenssagem('Erro ao Adicionar Talhao:'+E.Message);
      end;
    end);
  finally
    frmTalhoes.free;
  end;
end;

procedure TfrmOperacao.EditButton4Click(Sender: TObject);
begin
  frmprodutos := Tfrmprodutos.Create(Self);
  try
    frmprodutos.vTipo :='1';
    frmprodutos.ShowModal(
    procedure(ModalResult: TModalResult)
    begin
      edtProduto.Text   := dmdb.vNomeProduto;
      vIdProduto        := dmdb.vIdProduto;
    end);
  finally
    frmprodutos.free;
  end;
end;

procedure TfrmOperacao.EditButton5Click(Sender: TObject);
begin
 frmTipoOcorrencia := TfrmTipoOcorrencia.Create(Self);
  try
    frmTipoOcorrencia.ShowModal(
    procedure(ModalResult: TModalResult)
    begin
      edtTipoOcorrencia.Text := dmDB.vNomeTipoOocrrencia;
      vIdTipoOcorrencia      := dmDB.vIdTipoOcorrencia;
    end);
  finally
    frmTipoOcorrencia.free;
  end;
end;

procedure TfrmOperacao.EditButton6Click(Sender: TObject);
var
 Obs:string;
begin
  frmCadReceituario := TfrmCadReceituario.Create(Self);
  try
    frmCadReceituario.vCadOperacao :=1;
    frmCadReceituario.AbreReceituario(' AND STATUS=1');
    frmCadReceituario.cbxStatusF.ItemIndex:=1;
    frmCadReceituario.cbxStatusF.Enabled:=False;
    frmCadReceituario.ShowModal(
    procedure(ModalResult: TModalResult)
    begin
     if dmDB.vIdReceituario.Length>0 then
     begin
      edtReceituario.Text := dmDB.vNomeReceituario;
      vIdReceituario      := dmDB.vIdReceituario;
      Obs := dmDB.RetornaObsReceituario(vIdReceituario);
      if obs.Length>1 then
      begin
        myShowMenssagem('Observação:'+Obs);
      end;
     end;
    end);
  finally
    frmCadReceituario.free;
  end;
end;

procedure TfrmOperacao.EditButton7Click(Sender: TObject);
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

procedure TfrmOperacao.EditButton7Enter(Sender: TObject);
begin
  EditButton7Click(Sender);
end;

procedure TfrmOperacao.edtDataFiltroChange(Sender: TObject);
begin
  laybtnLista.Visible := false;
end;

procedure TfrmOperacao.edtDataFimAtividadeExit(Sender: TObject);
begin
 if edtDataFimAtividade.Text.Length=0 then
  edtDataFimAtividade.Date := date;
end;

procedure TfrmOperacao.edtDataFimPulExit(Sender: TObject);
begin
 if edtDataFimPul.Text.Length=0 then
  edtDataFimPul.Date := date;
end;

procedure TfrmOperacao.edtDataIniAtividadeExit(Sender: TObject);
begin
 if edtDataIniAtividade.Text.Length=0 then
  edtDataIniAtividade.Date := date;
end;

procedure TfrmOperacao.edtDataInicioPulExit(Sender: TObject);
begin
 if edtDataInicioPul.Text.Length=0 then
  edtDataInicioPul.Date := date;
end;

procedure TfrmOperacao.edtDataMaquinaExit(Sender: TObject);
begin
 if edtDataMaquina.Text.Length=0 then
  edtDataMaquina.Date := date;
end;

procedure TfrmOperacao.edtHoraFimChangeTracking(Sender: TObject);
begin
 edtHorasTrabalhada.Value := edtHoraFim.Value-edtHoraIni.Value;
end;

procedure TfrmOperacao.edtHoraFimEnter(Sender: TObject);
begin
  edtHoraFim.SelectAll;
end;

procedure TfrmOperacao.edtHoraIniChangeTracking(Sender: TObject);
begin
 edtHorasTrabalhada.Value := edtHoraFim.Value-edtHoraIni.Value;
end;

procedure TfrmOperacao.edtHoraIniEnter(Sender: TObject);
begin
 edtHoraIni.SelectAll;
end;

procedure TfrmOperacao.edtHoraIniKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
 if (keyChar in ['0'..'9',','] = false) then
 begin
   KeyChar := #0;
 end;
end;

procedure TfrmOperacao.edtHorasParadoEnter(Sender: TObject);
begin
  edtHorasParado.SelectAll;
end;

procedure TfrmOperacao.edtMaquinaEnter(Sender: TObject);
begin
  EditButton2Click(sender);
end;

procedure TfrmOperacao.edtQtdeUtilizadaKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
 if (keyChar in ['0'..'9',','] = false) then
 begin
   KeyChar := #0;
 end;
end;

procedure TfrmOperacao.Filtrar;
var
 vFiltro:string;
begin
  if CheckBox1.IsChecked then
  vFiltro := 'and o.status=2 and o.FlagSync=0'
  else
  begin
    vFiltro := ' AND o.datainicio='+FormatDateTime('yyyy-mm-dd',edtDataFiltro.Date).QuotedString;
  end;
  GeraLista(vFiltro);
end;

procedure TfrmOperacao.FinalizaOperacaoExtra;
begin
    dmDB.AbreOperacaoExta(vidOp);
    dmDB.AlteraStatusOperacao(vidOp);
    dmDB.AbreDetTalhoesPulverizacao(vIdOp);
    dmDB.TDetTalhoesPul.First;
    while not dmDB.TDetTalhoesPul.eof do
    begin
      dmDB.TOperacaoSafra.Close;
      dmDB.TOperacaoSafra.Open;
      dmDB.TOperacaoSafra.Insert;
      dmDB.TOperacaoSafraid.AsInteger                  := RetornaIdOperacao;
      dmDB.TOperacaoSafraidoperacao.AsString           := dmDB.TOperacaoExtraidoperacao.AsString;
      dmDB.TOperacaoSafraidsafra.AsString              := vIdSafra;
      dmDB.TOperacaoSafraidResponsavel.AsString        := dmDB.vIdUser;
      dmDB.TOperacaoSafradatainicio.AsDateTime         := dmDB.TOperacaoExtradatainicio.AsDateTime;
      dmDB.TOperacaoSafradatafim.AsDateTime            := dmDB.TOperacaoExtradatafim.AsDateTime;
      dmDB.TOperacaoSafraidtalhao.AsString             := dmDB.TDetTalhoesPulidTalhao.AsString;
      dmDB.TOperacaoSafraobservacao.AsString           := dmDB.TOperacaoExtraobservacao.AsString;
      dmDB.TOperacaoSafrafinalidade.AsString           := dmDB.TOperacaoExtrafinalidade.AsString;
      dmDB.TOperacaoSafraidusuario.AsString            := dmDB.vIdUser;
      dmDB.TOperacaoSafrastatus.AsInteger              := 3;
      dmDB.TOperacaoSafraidOpMaster.AsString           := vIdPul;
      dmDB.TOperacaoSafra.ApplyUpdates(-1);
      dmDB.TDetTalhoesPul.Next;
    end;
     //quebra operacao puverização maquinas
     dmDB.qryOperacaoQuebrada.Close;
     dmDB.qryOperacaoQuebrada.Open;
     dmDB.qryOperacaoQuebrada.Filtered := false;
     dmDB.qryOperacaoQuebrada.Filter   := 'idOpMaster='+vidOp;
     dmDB.qryOperacaoQuebrada.Filtered := true;
     dmDB.qryOperacaoQuebrada.First;
     while not dmDB.qryOperacaoQuebrada.Eof do
     begin
       dmDB.qryQuebraMaquinasPul.Close;
       dmDB.qryQuebraMaquinasPul.Open;
       dmDB.qryQuebraMaquinasPul.Filtered := false;
       dmDB.qryQuebraMaquinasPul.Filter   := 'idOperacaoTalhao='+vIdPul+' and idTalhao='+dmDB.qryOperacaoQuebradaidtalhao.AsString;
       dmDB.qryQuebraMaquinasPul.Filtered := true;
       while not dmDB.qryQuebraMaquinasPul.eof do
       begin
         dmdb.TOperacaoSafraMaquinas.Close;
         dmdb.TOperacaoSafraMaquinas.Open;
         dmdb.TOperacaoSafraMaquinas.Insert;
         dmdb.TOperacaoSafraMaquinasidoperacaotalhao.AsString  := dmDB.qryOperacaoQuebradaid.AsString;
         dmdb.TOperacaoSafraMaquinasidmaquina.AsString         := dmDB.qryQuebraMaquinasPulidmaquina.AsString;
         dmdb.TOperacaoSafraMaquinasoperador.AsString          := dmDB.qryQuebraMaquinasPuloperador.AsString;
         dmdb.TOperacaoSafraMaquinashorainicio.AsString        := StringReplace(dmDB.qryQuebraMaquinasPulhorainicio.AsString,'.',',',[rfReplaceAll]);;
         dmdb.TOperacaoSafraMaquinashorafim.AsString           := StringReplace(dmDB.qryQuebraMaquinasPulhorafim.AsString,'.',',',[rfReplaceAll]);;
         dmdb.TOperacaoSafraMaquinashoraparada.AsString        := StringReplace(dmDB.qryQuebraMaquinasPulhoraparada.AsString,'.',',',[rfReplaceAll]);
         dmdb.TOperacaoSafraMaquinashoraTrabalhada.AsString    := StringReplace(dmDB.qryQuebraMaquinasPulHorasTalhaoPercent.AsString,'.',',',[rfReplaceAll]);;
         dmdb.TOperacaoSafraMaquinasdata.AsDateTime            := dmDB.qryQuebraMaquinasPuldata.AsDateTime;
         dmdb.TOperacaoSafraMaquinasobservacao.AsString        := dmDB.qryQuebraMaquinasPulobservacao.AsString;
         dmdb.TOperacaoSafraMaquinasidOperador.AsString        := dmDB.qryQuebraMaquinasPulidOperador.AsString;

         dmdb.TOperacaoSafraMaquinasidUsuario.AsString         := dmDB.vIdUser;
         dmdb.TOperacaoSafraMaquinas.ApplyUpdates(-1);
         dmDB.qryQuebraMaquinasPul.Next;
       end;
       dmDB.qryOperacaoQuebrada.Next;
     end;
end;

procedure TfrmOperacao.FormKeyUp(Sender: TObject; var Key: Word;
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

procedure TfrmOperacao.FormShow(Sender: TObject);
begin
 laybtnLista.Visible := false;
 vDetalhes := 0;
 frmOperacao.StyleBook := frmPrincipal.StyleBook1;
 laybtnLista.Visible := false;
// AtualizaBinds;
// CarregaComboFiltros;
 GeraLista('');
 dmDB.TSafra.Close;
 dmDB.TSafra.Open;
 vIdSafra := dmDB.TSafraid.AsString;
 TabPrincipal.TabPosition := TTabPosition.None;
 TabPrincipal.ActiveTab   := TabLista;
 tabDet.TabPosition := TTabPosition.None;
end;

procedure TfrmOperacao.GeraLista(Filtro:string);
var
 item   : TListViewItem;
 txt    : TListItemText;
 txtH   : TListItemPurpose;
 img    : TListItemImage;
 vStatus:string;
begin
 TThread.CreateAnonymousThread(procedure
 begin
  dmDB.AbreOperacaoSafra(Filtro);
  TThread.Synchronize(nil, procedure
  begin
    listaOperacao.Items.Clear;
     while not dmDb.TOperacaoSafra.eof do
     begin
       if dmDB.TOperacaoSafrastatus.AsInteger=1 then
        vStatus:='Aberta'
       else
        vStatus:='Finalizada';
       item := listaOperacao.Items.Add;
         with frmOperacao do
         begin
           with item  do
           begin
             txt :=   TListItemText(Objects.FindDrawable('Text3'));
             txt.Text := dmDB.RetornaTalhoesPul(dmDB.TOperacaoSafraid.AsString);

             txt :=   TListItemText(Objects.FindDrawable('Text16'));
             txt.Text := dmDB.TOperacaoSafrastatus.AsString;

             if dmDB.TOperacaoSafraidoperacao.AsInteger=2 then
             begin
               img := TListItemImage(Objects.FindDrawable('Image13'));
               img.Bitmap     := frmPrincipal.imgReceituario.Bitmap;
               img.TagString  := dmDb.TOperacaoSafraidreceituario.AsString;
             end;

             txt :=   TListItemText(Objects.FindDrawable('Text13'));
             txt.Text := dmDb.TOperacaoSafraid.AsString;

             txt :=   TListItemText(Objects.FindDrawable('Text14'));
             txt.Text := dmDb.TOperacaoSafraidoperacao.AsString;

             txt :=   TListItemText(Objects.FindDrawable('Text15'));
             txt.Text := dmDb.TOperacaoSafraFlagSync.AsString;


             txt :=   TListItemText(Objects.FindDrawable('Text4'));
             txt.Text := 'Atividade:';
             txt :=   TListItemText(Objects.FindDrawable('Text5'));
             txt.Text := dmDb.TOperacaoSafraOperacao.AsString;

             txt :=   TListItemText(Objects.FindDrawable('Text6'));
             txt.Text := 'Inicio:';
             txt :=   TListItemText(Objects.FindDrawable('Text7'));
             txt.Text := dmDb.TOperacaoSafradatainicio.AsString;

             txt :=   TListItemText(Objects.FindDrawable('Text8'));
             txt.Text := 'Fim:';
             txt :=   TListItemText(Objects.FindDrawable('Text9'));
             txt.Text := dmDb.TOperacaoSafradatafim.AsString;

             txt :=   TListItemText(Objects.FindDrawable('Text10'));
             txt.Text := 'Status:';

             if dmDb.TOperacaoSafraFlagSync.AsString='0' then
             begin
              txt :=   TListItemText(Objects.FindDrawable('Text11'));
              txt.Text := vStatus+'-'+' Pendente Sync';
             end;

             if dmDb.TOperacaoSafraFlagSync.AsString='1' then
             begin
              txt :=   TListItemText(Objects.FindDrawable('Text11'));
              txt.Text := vStatus+'-'+' Sincronizada';
             end;

             if vStatus='Finalizada' then
             begin
               img := TListItemImage(Objects.FindDrawable('Image12'));
               img.ScalingMode := TImageScalingMode.Stretch;
               img.Bitmap     := frmPrincipal.imgRetanguloVerde.Bitmap;
             end
             else
             begin
               img := TListItemImage(Objects.FindDrawable('Image12'));
               img.Visible  := false;
             end;

             txt :=   TListItemText(Objects.FindDrawable('Text17'));
             txt.Text := 'Cultura:';
             txt :=   TListItemText(Objects.FindDrawable('Text18'));
             txt.Text := dmDb.TOperacaoSafraCultura.AsString;

             txt :=   TListItemText(Objects.FindDrawable('Text20'));
             txt.Text := 'Variedade:';
             txt :=   TListItemText(Objects.FindDrawable('Text19'));
             txt.Text := dmDb.TOperacaoSafraVariedade.AsString;

             txt :=   TListItemText(Objects.FindDrawable('Text21'));
             txt.Text := 'Cobertura:';
             txt :=   TListItemText(Objects.FindDrawable('Text22'));
             txt.Text := dmDb.TOperacaoSafraCobertura.AsString;


             img := TListItemImage(Objects.FindDrawable('Image14'));
             img.ScalingMode := TImageScalingMode.Stretch;
             img.Bitmap      := frmPrincipal.imgFort.Bitmap;
           end;
           dmDB.TOperacaoSafra.Next;
         end;
     end;
  end);
 end).Start;
end;

procedure TfrmOperacao.GeraListaMaquinas;
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
    dmDb.TOperacaoSafraMaquinas.First;
    ListaMaquinas.Items.Clear;
    while not dmDb.TOperacaoSafraMaquinas.eof do
     begin
         item := ListaMaquinas.Items.Add;
         with frmOperacao do
         begin
           with item  do
           begin
             txt      := TListItemText(Objects.FindDrawable('Text3'));
             txt.Text := dmDb.TOperacaoSafraMaquinasmaquina.AsString;

             txt      := TListItemText(Objects.FindDrawable('Text10'));
             txt.Text := dmDb.TOperacaoSafraMaquinasdata.AsString;

             txt      := TListItemText(Objects.FindDrawable('Text5'));
             txt.Text := '(h)Ini: '+dmDb.TOperacaoSafraMaquinashorainicio.AsString;


             txt      := TListItemText(Objects.FindDrawable('Text6'));
             txt.Text := '(h)Fim: '+dmDb.TOperacaoSafraMaquinashorafim.AsString;


             txt      := TListItemText(Objects.FindDrawable('Text4'));
             txt.Text := '(h)Parado: '+dmDb.TOperacaoSafraMaquinashoraparada.AsString;



             txt      := TListItemText(Objects.FindDrawable('Text7'));
             txt.Text := '(h)Trab.: '+dmDb.TOperacaoSafraMaquinashoraTrabalhada.AsString;

             txt           := TListItemText(Objects.FindDrawable('Text8'));
             txt.TagString := dmDb.TOperacaoSafraMaquinasid.AsString;
             txt.Text := 'Romaneio: ';

             txt      := TListItemText(Objects.FindDrawable('Text9'));
             txt.Text := dmDb.TOperacaoSafraMaquinasromaneio.AsString;

             img := TListItemImage(Objects.FindDrawable('Image14'));
             img.Bitmap     := frmPrincipal.imgMaquina.Bitmap;
           end;
           dmDB.TOperacaoSafraMaquinas.Next;
         end;
     end;
  end);
 end).Start;
end;

procedure TfrmOperacao.GeraListaOcorrencia;
var
 item   : TListViewItem;
 txt    : TListItemText;
 txtH   : TListItemPurpose;
 img    : TListItemImage;
 vStatus:string;
begin
// TThread.CreateAnonymousThread(procedure
// begin
//  TThread.Synchronize(nil, procedure
//  begin
    dmDb.TOperacaoSafraOcorrencia.First;
    ListaOcorrencia.Items.Clear;
    while not dmDb.TOperacaoSafraOcorrencia.eof do
     begin
       item := ListaOcorrencia.Items.Add;
         with frmOperacao do
         begin
           with item  do
           begin
             txt      := TListItemText(Objects.FindDrawable('Text8'));
             txt.Text := dmDb.TOperacaoSafraOcorrenciaid.AsString;

             txt      := TListItemText(Objects.FindDrawable('Text3'));
             txt.Text := dmDb.TOperacaoSafraOcorrenciaTipoOcorrencia.AsString;

             txt      := TListItemText(Objects.FindDrawable('Text10'));
             txt.Text := dmDb.TOperacaoSafraOcorrenciadata.AsString;

             txt      := TListItemText(Objects.FindDrawable('Text7'));
             txt.Text := dmDb.TOperacaoSafraOcorrenciadescricao.AsString;

             img := TListItemImage(Objects.FindDrawable('Image14'));
             img.Bitmap     := frmPrincipal.imgOcorrencia.Bitmap;
           end;
           dmDB.TOperacaoSafraOcorrencia.Next;
         end;
     end;
//  end);
// end).Start;
end;

procedure TfrmOperacao.GeraListaProdutos;
var
 item   : TListViewItem;
 txt    : TListItemText;
 txtH   : TListItemPurpose;
 img    : TListItemImage;
 vStatus:string;
begin
// TThread.CreateAnonymousThread(procedure
// begin
//  TThread.Synchronize(nil, procedure
//  begin
    dmDb.TOperacaoSafraProdutos.First;
    ListaProdutos.Items.Clear;
    while not dmDb.TOperacaoSafraProdutos.eof do
     begin
       item := ListaProdutos.Items.Add;
         with frmOperacao do
         begin
           with item  do
           begin
             txt      := TListItemText(Objects.FindDrawable('Text8'));
             txt.Text := dmDb.TOperacaoSafraProdutosid.AsString;

             txt      := TListItemText(Objects.FindDrawable('Text9'));
             txt.Text := dmDb.TOperacaoSafraProdutosidproduto.AsString;

             txt      := TListItemText(Objects.FindDrawable('Text3'));
             txt.Text := dmDb.TOperacaoSafraProdutosProduto.AsString;

             txt      := TListItemText(Objects.FindDrawable('Text10'));
             txt.Text := 'Data: '+dmDb.TOperacaoSafraProdutosdata.AsString;

             txt      := TListItemText(Objects.FindDrawable('Text4'));
             txt.Text := 'Total Utilizado: ';

             txt      := TListItemText(Objects.FindDrawable('Text7'));
             txt.Text := dmDb.TOperacaoSafraProdutosqtdeutilidado.AsString;

             img := TListItemImage(Objects.FindDrawable('Image14'));
             img.Bitmap     := frmPrincipal.imgSeed.Bitmap;
           end;
           dmDB.TOperacaoSafraProdutos.Next;
         end;
     end;
//  end);
// end).Start;
end;


procedure TfrmOperacao.GeraListaReceituario;
var
 item   : TListViewItem;
 txt    : TListItemText;
 txtH   : TListItemPurpose;
 img    : TListItemImage;
 vStatus:string;
begin
 dmDB.AbreDetReceituario(vIdReceituario);
 TThread.CreateAnonymousThread(procedure
 begin
  TThread.Synchronize(nil, procedure
  begin
    dmDb.TDetReceituario.First;
    ListaDetReceiturario.Items.Clear;
    while not dmDb.TDetReceituario.eof do
     begin
       item := ListaDetReceiturario.Items.Add;
         with frmCadReceituario do
         begin
           with item  do
           begin
             txt      := TListItemText(Objects.FindDrawable('Text14'));
             txt.Text := dmDb.TDetReceituarioid.AsString;

             txt      := TListItemText(Objects.FindDrawable('Text3'));
             txt.Text := dmDB.RetornaTalhoesReceiturario(vIdReceituario);

             txt      := TListItemText(Objects.FindDrawable('Text4'));
             txt.Text := 'Produto: ';

             txt      := TListItemText(Objects.FindDrawable('Text5'));
             txt.Text := dmDb.TDetReceituarioproduto.AsString;

             txt      := TListItemText(Objects.FindDrawable('Text6'));
             txt.Text := 'Area Prev.: ';

             txt      := TListItemText(Objects.FindDrawable('Text7'));
             txt.Text := dmDB.RetornaReceiturarioAreaTotal(vIdReceituario)+' he';

             txt      := TListItemText(Objects.FindDrawable('Text8'));
             txt.Text := 'Indicação: ';

             txt      := TListItemText(Objects.FindDrawable('Text9'));
             txt.Text := dmDb.TDetReceituarioqtdporhe.AsString +' /he';

             txt      := TListItemText(Objects.FindDrawable('Text10'));
             txt.Text := 'Total Prev.: ';

             txt      := TListItemText(Objects.FindDrawable('Text11'));
             txt.Text := dmDB.RetornaPrevisaoProduto(dmDb.TDetReceituarioidproduto.AsString,vIdReceituario);

             img := TListItemImage(Objects.FindDrawable('Image14'));
             img.Bitmap     := frmPrincipal.imgSeed.Bitmap;
           end;
           dmDB.TDetReceituario.Next;
         end;
     end;
  end);
 end).Start;
end;

procedure TfrmOperacao.GridTalhoesPulEditingDone(Sender: TObject; const ACol,
  ARow: Integer);
begin
 dmDB.AtualizaAreaRealizadaPul(dmDB.TDetTalhoesPulid.AsString,
  GridTalhoesPul.Cells[2,GridTalhoesPul.Row]);
 BindSourceDB5.DataSet := nil;
  dmDb.AbreDetTalhoesPulverizacao(vIdPul);
 BindSourceDB5.DataSet := dmDB.TDetTalhoesPul;
 SomarColunasTalhoes;
end;

procedure TfrmOperacao.Image16Click(Sender: TObject);
begin
  laybtnLista.Visible := false;
  Close;
end;

procedure TfrmOperacao.Image18Click(Sender: TObject);
begin
 MudarAba(TabLista,sender);
end;

procedure TfrmOperacao.Image31Click(Sender: TObject);
begin
 if vDetalhes = 1 then
 begin
   MudarAba(tbiDetalhes,Sender);
   Exit;
 end;
 MudarAba(TabLista,sender);
end;

procedure TfrmOperacao.LimpaCampos;
begin
  edtAtividade.Text           :='';
  edtObservacaoAtividade.Text :='';
  edtTalhao.Text              :='';
  edtAreaReal.Text            :='';
  edtAreaPrev.Text            :='';
  edtMaquina.Text             :='';
  edtOperador.Text            :='';
  edtHoraIni.Value            :=0;
  edtHoraFim.Value            :=0;
  edtHorasParado.Value        :=0;
  edtHorasTrabalhada.Value    :=0;
  edtObsMaquina.Text          :='';
  edtProduto.Text             :='';
  edtQtdeUtilizada.Text       :='';
  edtObsProduto.Text          :='';
  edtTipoOcorrencia.Text      :='';
  edtDescricao.Text           :='';
  edtDataMaquina.date         :=date;
  edtDataProduto.date         :=date;
  edtDataOcorrencia.Text      :='';
  edtDataFimAtividade.Text    :='';
  cbxQualidadeCobertura.ItemIndex :=-1;

end;

procedure TfrmOperacao.ListaMaquinasItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
 vIdMaquinaSel :=
   TAppearanceListViewItem(ListaMaquinas.Selected).Objects.FindObjectT<TListItemText>
   ('Text8').TagString;
end;

procedure TfrmOperacao.ListaOcorrenciaItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
 vIdOcorrenciaSel :=
   TAppearanceListViewItem(ListaOcorrencia.Selected).Objects.FindObjectT<TListItemText>
   ('Text8').Text;
end;

procedure TfrmOperacao.listaOperacaoGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
 if vIdOP.Length>0 then
  laybtnLista.Visible := true;
end;

procedure TfrmOperacao.listaOperacaoItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
 vIdOP :=
   TAppearanceListViewItem(listaOperacao.Selected).Objects.FindObjectT<TListItemText>
   ('Text13').Text;

 vIdOPTipo :=
   TAppearanceListViewItem(listaOperacao.Selected).Objects.FindObjectT<TListItemText>
   ('Text14').Text;

  vStatusConfere :=
   TAppearanceListViewItem(listaOperacao.Selected).Objects.FindObjectT<TListItemText>
   ('Text16').Text;

  vFlagSync :=
   TAppearanceListViewItem(listaOperacao.Selected).Objects.FindObjectT<TListItemText>
   ('Text15').Text;

  lblDetCultura.Text   := TAppearanceListViewItem(listaOperacao.Selected).Objects.FindObjectT<TListItemText>
   ('Text19').Text;

  lblDetVariedade.Text :=  TAppearanceListViewItem(listaOperacao.Selected).Objects.FindObjectT<TListItemText>
   ('Text18').Text;

  if vIdOPTipo='2' then
   dmDB.vPulverizacao:=1
  else
   dmDB.vPulverizacao:=0;

  btnProdutos.Visible   := vIdOPTipo<>'5';
  btnOcorrencia.Visible := vIdOPTipo<>'5';
  btnVazao.Visible      := vIdOPTipo<>'5';
  vIdReceituarioSel :=
   TAppearanceListViewItem(listaOperacao.Selected).Objects.FindObjectT<TListItemImage>
  ('Image13').TagString;

  if vIdOPTipo='2' then
  begin
    if ItemObject is TListItemImage then
    begin
     if TListItemImage(ItemObject).Name='Image13' then
     begin
       GerarListaDetReceituario(vIdReceituarioSel);
       AbreDetalhesOp(vIdOp);
       MudarAba(tbiReceituario,sender);
       Exit;
     end;
    end;
  end;
end;

procedure TfrmOperacao.GerarListaDetReceituario(IdReceituario: string);
var
 item   : TListViewItem;
 txt    : TListItemText;
 txtH   : TListItemPurpose;
 img    : TListItemImage;
 vStatus:string;
begin
 dmDB.AbreDetReceituario(IdReceituario);
 TThread.CreateAnonymousThread(procedure
 begin
  TThread.Synchronize(nil, procedure
  var vAreaTotal,vPrevProduto:string;
  begin
    dmDb.TDetReceituario.First;
    ListaDetReceiturario.Items.Clear;
    while not dmDb.TDetReceituario.eof do
     begin
        vAreaTotal   :=  dmDB.RetornaReceiturarioAreaTotal(IdReceituario);
        vPrevProduto :=  dmDB.RetornaPrevisaoProduto(dmDb.TDetReceituarioidproduto.AsString,IdReceituario);
        item := ListaDetReceiturario.Items.Add;
         with frmOperacao do
         begin
           with item  do
           begin
             txt      := TListItemText(Objects.FindDrawable('Text14'));
             txt.Text := dmDb.TDetReceituarioid.AsString;

             txt      := TListItemText(Objects.FindDrawable('Text4'));
             txt.Text := 'Produto: ';

             txt      := TListItemText(Objects.FindDrawable('Text5'));
             txt.Text := dmDb.TDetReceituarioproduto.AsString;

             txt      := TListItemText(Objects.FindDrawable('Text6'));
             txt.Text := 'Area Prev.: ';

             txt      := TListItemText(Objects.FindDrawable('Text7'));
             txt.Text := vAreaTotal+' he';

             txt      := TListItemText(Objects.FindDrawable('Text8'));
             txt.Text := 'Indicação: ';

             txt      := TListItemText(Objects.FindDrawable('Text9'));
             txt.Text := dmDb.TDetReceituarioqtdporhe.AsString +' /he';

             txt      := TListItemText(Objects.FindDrawable('Text10'));
             txt.Text := 'Total Prev.: ';

             txt      := TListItemText(Objects.FindDrawable('Text11'));
             txt.Text := vPrevProduto;

             img := TListItemImage(Objects.FindDrawable('Image14'));
             img.Bitmap     := frmPrincipal.imgSeed.Bitmap;
           end;
           dmDB.TDetReceituario.Next;
         end;
     end;
  end);
 end).Start;
end;

procedure TfrmOperacao.GeraVazao(idOP: string);
begin
 dmDB.TVazaoOperacao.Close;
 dmDB.TVazaoOperacao.Open;
 dmDB.TVazaoOperacao.Filtered := false;
 dmDB.TVazaoOperacao.Filter   := 'idoperacaotalhao='+idOP;
 dmDB.TVazaoOperacao.Filtered := true;
 if not dmDB.TVazaoOperacao.IsEmpty then
 begin
   dmDB.TVazaoOperacao.Edit;

   if dmDB.TVazaoOperacaocincoltha.AsInteger=1 then
    chk5LTHA.Text :='X'
   else
    chk5LTHA.Text :='';

   if dmDB.TVazaoOperacaodezltha.AsInteger=1 then
    chk10LTHA.Text :='X'
   else
    chk10LTHA.Text :='';

   if dmDB.TVazaoOperacaoquinzeltha.AsInteger=1 then
    chk15LTHA.Text :='X'
   else
    chk15LTHA.Text :='';

   if dmDB.TVazaoOperacaovinteltha.AsInteger=1 then
    chk20LTHA.Text :='X'
   else
    chk20LTHA.Text :='';

   if dmDB.TVazaoOperacaotrintaltha.AsInteger=1 then
    chk30LTHA.Text :='X'
   else
    chk30LTHA.Text :='';

   if dmDB.TVazaoOperacaoquarentaltha.AsInteger=1 then
    chk40LTHA.Text :='X'
   else
    chk40LTHA.Text :='';

   if dmDB.TVazaoOperacaocinquentaltha.AsInteger=1 then
    chk50LTHA.Text :='X'
   else
    chk50LTHA.Text :='';

   if dmDB.TVazaoOperacaosetentaecincoltha.AsInteger=1 then
    chk75LTHA.Text :='X'
   else
    chk75LTHA.Text :='';

   if dmDB.TVazaoOperacaocemltha.AsInteger=1 then
    chk100LTHA.Text :='X'
   else
    chk100LTHA.Text :='';
 end
end;

procedure TfrmOperacao.ListaProdutosItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
 vIdProdutoSel :=
 TAppearanceListViewItem(ListaProdutos.Selected).Objects.FindObjectT<TListItemText>
 ('Text8').Text;
 vIdProduto     :=
 TAppearanceListViewItem(ListaProdutos.Selected).Objects.FindObjectT<TListItemText>
 ('Text9').Text;
end;

procedure TfrmOperacao.MudarAba(ATabItem: TTabItem; sender: TObject);
begin
  actMudarAba.Tab := ATabItem;
  actMudarAba.ExecuteTarget(sender);
end;

procedure TfrmOperacao.myShowMenssagem(msg: string);
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

procedure TfrmOperacao.SomarColunasTalhoes;
var
  Sum : Double;
  Val : Double;
  Sum1 : Double;
  Val1 : Double;
  I   : Integer;
begin
  Sum  := 0;
  Val  := 0;
  Sum1 := 0;
  Val1 := 0;
  I   := 0;
  for I := 0 to GridTalhoesPul.RowCount-1 do
  begin
   if TryStrToFloat(GridTalhoesPul.Cells[1,I],Val) then
    Sum := Sum + Val;
   if TryStrToFloat(GridTalhoesPul.Cells[2,I],Val1) then
    Sum1 := Sum1 + Val1;
  end;
  if I>0 then
  begin
    lblAreaTotalPrev.Text         := 'Area Prev.: '+ FloatToStr(Sum);
    lblAreaTotalReal.Text         := 'Area Real.: '+ FloatToStr(Sum1);
  end
  else
  begin
    lblAreaTotalPrev.Text         := 'Area Prev.: 0';
    lblAreaTotalReal.Text         := 'Area Real.: 0';
  end;
  lblTotalRegistro.Text           := IntToStr(GridTalhoesPul.RowCount);
end;

end.



