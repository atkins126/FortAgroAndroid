unit URevisaoMaquinas;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  System.Rtti, FMX.Grid.Style, FMX.ScrollBox, FMX.Grid, FMX.EditBox,
  FMX.NumberBox, FMX.StdCtrls, FMX.Edit, FMX.ListView, FMX.Ani,
  FMX.DateTimeCtrls, FMX.Controls.Presentation, FMX.Objects, FMX.Layouts,
  FMX.TabControl, FMX.ListBox,DB, FMX.Gestures;

type
  TfrmRevisaoMaquina = class(TForm)
    tbPrincipal: TTabControl;
    tbiLista: TTabItem;
    tbiItens: TTabItem;
    layListaP: TLayout;
    imgLogoCad: TImage;
    layLista: TLayout;
    layFiltros: TLayout;
    RecGro: TRectangle;
    Label1: TLabel;
    edtNomeFiltro: TEdit;
    GroupBox1: TGroupBox;
    Label22: TLabel;
    Label27: TLabel;
    edtDataInicio: TDateEdit;
    DateEdit1: TDateEdit;
    ToolBar1: TToolBar;
    recToolBar: TRectangle;
    lblCad: TLabel;
    btnFechar: TImage;
    AnimacaoMnu: TFloatAnimation;
    tbiCad: TTabItem;
    recCad: TRectangle;
    AnimacaoCad: TFloatAnimation;
    layCad: TLayout;
    Layout1: TLayout;
    ToolBar3: TToolBar;
    btnVoltar: TImage;
    layEdit: TLayout;
    Rectangle4: TRectangle;
    Layout11: TLayout;
    Layout12: TLayout;
    layData: TLayout;
    lblItem: TLabel;
    Layout13: TLayout;
    Rectangle5: TRectangle;
    Label6: TLabel;
    edtProduto: TEdit;
    EditButton2: TEditButton;
    ClearEditButton4: TClearEditButton;
    Layout14: TLayout;
    Rectangle6: TRectangle;
    Label7: TLabel;
    edtqtde: TNumberBox;
    edtTab: TEdit;
    Rectangle7: TRectangle;
    Label8: TLabel;
    Image8: TImage;
    Rectangle8: TRectangle;
    Label10: TLabel;
    Image9: TImage;
    Layout10: TLayout;
    Rectangle9: TRectangle;
    Label11: TLabel;
    edtCodFab: TEdit;
    tbiAddItem: TTabItem;
    ToolBar5: TToolBar;
    Image12: TImage;
    Layout19: TLayout;
    Rectangle15: TRectangle;
    Layout20: TLayout;
    Layout24: TLayout;
    Layout25: TLayout;
    btnAddItem: TRectangle;
    Label26: TLabel;
    Image14: TImage;
    Layout26: TLayout;
    Rectangle19: TRectangle;
    Layout27: TLayout;
    Layout28: TLayout;
    Label28: TLabel;
    edtProdutoUtilizado: TEdit;
    EditButton3: TEditButton;
    ClearEditButton6: TClearEditButton;
    Layout29: TLayout;
    Rectangle20: TRectangle;
    Layout30: TLayout;
    Layout31: TLayout;
    Label31: TLabel;
    edtItemRevisao: TEdit;
    btnBuscaItem: TEditButton;
    ClearEditButton5: TClearEditButton;
    Layout37: TLayout;
    Rectangle22: TRectangle;
    btnVoltar1: TRectangle;
    Image31: TImage;
    Label23: TLabel;
    Layout38: TLayout;
    btnNovo: TRectangle;
    Image1: TImage;
    Label24: TLabel;
    Rectangle1: TRectangle;
    layMaquina: TLayout;
    Layout4: TLayout;
    Maquina: TLabel;
    edtMaquina: TEdit;
    edtPlanoRevisao: TEdit;
    EditButton5: TEditButton;
    ClearEditButton2: TClearEditButton;
    Label4: TLabel;
    edtHorimetro: TEdit;
    Rectangle2: TRectangle;
    layPlanoRevisao: TLayout;
    Layout8: TLayout;
    Label5: TLabel;
    Rectangle3: TRectangle;
    Layout34: TLayout;
    Layout35: TLayout;
    Label9: TLabel;
    Label12: TLabel;
    edtDataIni: TDateEdit;
    edtDataFim: TDateEdit;
    Label13: TLabel;
    Layout36: TLayout;
    Rectangle14: TRectangle;
    Layout39: TLayout;
    Layout40: TLayout;
    Label15: TLabel;
    edtQtd: TNumberBox;
    RectCad: TRectangle;
    laySubSubCad: TLayout;
    Rsub: TRectangle;
    laySubSubSubCad: TLayout;
    Lista: TListView;
    Layout15: TLayout;
    Layout16: TLayout;
    Label20: TLabel;
    cbxTipo: TComboBox;
    Rectangle16: TRectangle;
    Layout32: TLayout;
    Layout33: TLayout;
    EditButton1: TEditButton;
    Image10: TImage;
    Layout2: TLayout;
    layStatus: TLayout;
    Rectangle10: TRectangle;
    Layout5: TLayout;
    Layout7: TLayout;
    Label2: TLabel;
    cbxStatus: TComboBox;
    ListaRev: TListView;
    btnExcluiRev: TRectangle;
    Image2: TImage;
    lblExcluir: TLabel;
    btnExluiItem: TRectangle;
    Image3: TImage;
    Label3: TLabel;
    lblCodFab: TLabel;
    Label14: TLabel;
    edtObsManu: TEdit;
    btnGerar: TRectangle;
    Label16: TLabel;
    Image4: TImage;
    Rectangle12: TRectangle;
    Rectangle13: TRectangle;
    Label18: TLabel;
    Image6: TImage;
    btnAddIntem: TRectangle;
    Label17: TLabel;
    Image5: TImage;
    GestureManager1: TGestureManager;
    procedure btnVoltar1Click(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtDataInicioClosePicker(Sender: TObject);
    procedure DateEdit1ClosePicker(Sender: TObject);
    procedure edtNomeFiltroChangeTracking(Sender: TObject);
    procedure EditButton5Click(Sender: TObject);
    procedure EditButton1Click(Sender: TObject);
    procedure btnGerarClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure Image12Click(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnBuscaItemClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure ListaRevItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure EditButton3Click(Sender: TObject);
    procedure btnAddItemClick(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure ListaRevGesture(Sender: TObject;
      const EventInfo: TGestureEventInfo; var Handled: Boolean);
    procedure btnExcluiItemClick(Sender: TObject);
    procedure ListaItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure btnExcluiItemListaClick(Sender: TObject);
    procedure ListaGesture(Sender: TObject; const EventInfo: TGestureEventInfo;
      var Handled: Boolean);
    procedure cbxTipoChange(Sender: TObject);
    procedure btnCancelaClick(Sender: TObject);
    procedure Image10Click(Sender: TObject);
    procedure btnAddIntemClick(Sender: TObject);
    procedure Rectangle13Click(Sender: TObject);
    procedure btnExcluiRevClick(Sender: TObject);
    procedure btnExluiItemClick(Sender: TObject);
  private
    var
     vItemInsert:integer;
    procedure GeraLista(vFiltro:string);
    procedure GeraListaiTens(idPlanoManutencao: string);
  public
    vIdMaquina,vIdPlanoRev,vIdRevisao,vNomeMaquina,vHorimetro,vDataIni,vDataFim,
    vStatusRev,vIdItem,vIdProduto,vStatusSync,vStatusSyncItem,vRevisaoIdItem,vRevisaoItem,
    vItemLista,vItemProdutoLista,vItemProdutoCodigoFab,vItemQtdeLista,
    vItemListaObs,vPlanoRevLista,vIdPlaRevLista,vTipoLista,vTipoItemLista,
    vIdTabelaItens:string;


    vEdit:integer;
    function  RetornaIdItemRevisao: integer;
    procedure Filtro;
    function  RetornaIdRevisao: integer;
  end;

var
  frmRevisaoMaquina: TfrmRevisaoMaquina;

implementation

{$R *.fmx}

uses UPrincipal, UDMRevisao, Maquinas, UProdutos, UPlanoRevisao, UDataContext,
  UItensRevisao, UServicosRevisao;

procedure TfrmRevisaoMaquina.btnAddIntemClick(Sender: TObject);
begin
  vTipoItemLista           :='0';
  edtProdutoUtilizado.Text :='';
  edtItemRevisao.Text      :='';
  edtqtde.Value            :=1;
  edtObsManu.Text          :='';
  vItemInsert :=1;
  tbPrincipal.ActiveTab    :=tbiAddItem;
end;

procedure TfrmRevisaoMaquina.btnAddItemClick(Sender: TObject);
var
 vIdItemRev:string;
begin
  if edtItemRevisao.Text.Length=0 then
  begin
   ShowMessage('Informe o Item!');
   Exit;
  end;
  if vTipoItemLista='0' then
  begin
    if  edtProdutoUtilizado.Text.Length=0 then
    begin
     ShowMessage('Informe o Produto!');
     Exit;
    end;
    if (edtQtd.Text.Length=0) or (edtQtd.Value=0) then
    begin
     ShowMessage('Informe a Qtde!');
     Exit;
    end;
  end;
  if vItemInsert=1 then
  begin
   try
     vIdItemRev := intToStr(RetornaIdItemRevisao);
     dmRevisao.InsereNovoItemRevisao(
     vIdRevisao,
     vidproduto,
     StringReplace(edtQtd.Text,',','.',[rfReplaceAll]),
     edtItemRevisao.Text,
     '0',
     edtObsManu.Text,
     vidItem);
     GeraListaiTens(vIdRevisao);
    dmRevisao.MudaStatusEditItemSync('revisaomaquinaitens',vIdItemRev);
    tbPrincipal.ActiveTab := tbiItens;
   except
    on E : Exception do
     ShowMessage(E.ClassName+'Erro ao inserir Item : '+E.Message);
   end
  end;
  if vItemInsert=0 then
  begin
   try
    //id, iditem, item, qtd, observacao,idProduto
    dmRevisao.UpdateItemRevisao(
     vIdTabelaItens,
     vRevisaoIdItem,
     vRevisaoItem,
     StringReplace(edtQtd.Text,',','.',[rfReplaceAll]),
     edtObsManu.Text,
     vIdProduto);

     GeraListaiTens(vIdRevisao);
     dmRevisao.MudaStatusEditItemSync('revisaomaquinaitens',vIdTabelaItens);
     dmRevisao.MudaStatusEditItemSync('revisaomaquinaitens',vIdTabelaItens);

     tbPrincipal.ActiveTab := tbiItens;
   except
    on E : Exception do
     ShowMessage(E.ClassName+'Erro ao Atualizar Item : '+E.Message);
   end
  end;
  dmRevisao.MudaStatusRevisaoEditSync(vIdRevisao);
end;

function TfrmRevisaoMaquina.RetornaIdRevisao: integer;
var
 vId:integer;
 vId1:integer;
begin
 vId1 := strToInt(dmDB.vIdUser)* strToInt(formatdatetime('ddmmss',now));
 repeat
  vId  :=vId1;
 until (dmDB.VerificaRevisaoExiste(intToStr(vId)));
 Result := vId;
end;

procedure TfrmRevisaoMaquina.btnBuscaItemClick(Sender: TObject);
begin
  frmItensRevisao := TfrmItensRevisao.Create(Self);
  try
    frmItensRevisao.ShowModal(
    procedure(ModalResult: TModalResult)
    begin
      edtItemRevisao.Text := dmDB.vNomeItemRevSelect;
      vIdItem             := dmDB.vIdItemRevSelect;
      vRevisaoIdItem    := dmDB.vIdItemRevSelect;
    end);
  finally
    frmItensRevisao.free;
  end;
end;

procedure TfrmRevisaoMaquina.btnCancelaClick(Sender: TObject);
begin
  tbPrincipal.ActiveTab := tbiLista;
end;

procedure TfrmRevisaoMaquina.btnExcluiItemClick(Sender: TObject);
begin
 btnExcluiRev.Visible := false;
 if vIdRevisao.Length=0 then
 begin
  ShowMessage('Selecione uma revisao!');
  Exit;
 end;
 if vStatusSync='1' then
 begin
  ShowMessage('Revisão ja Sincronizada!!');
  Exit;
 end
 else
 begin
   try
    dmRevisao.MudaStatusDelete('revisaomaquina', vIdRevisao);
    ShowMessage('Revisão deletada com sucesso!!');
    Filtro;
    btnExcluiRev.Visible := false;
   except
    on E : Exception do
     ShowMessage('Erro ao excluir Revisao: '+E.Message);
   end;
 end;
end;

procedure TfrmRevisaoMaquina.btnFecharClick(Sender: TObject);
begin
 btnExluiItem.Visible := false;
 Close;
end;

procedure TfrmRevisaoMaquina.btnGerarClick(Sender: TObject);
var
 vIdRevInsert:string;
begin
 if edtMaquina.Text.Length=0 then
 begin
  ShowMessage('Informe a maquina!');
  Exit;
 end;
 if (edtHorimetro.Text.Length=0)and (edtHorimetro.Text='0') then
 begin
  ShowMessage('Informe o Horimentro!');
  Exit;
 end;
 if cbxStatus.ItemIndex=3 then
 begin
   dmRevisao.AbreItensRevisaoApl(vIdRevisao);
   if dmRevisao.RetornaItensRevisaoConfirmados(vIdRevisao)<=0 then
   begin
     ShowMessage('Confirme pelo menos um item antes de finalizar!');
     cbxStatus.ItemIndex :=0;
     Exit;
   end;
 end;
 if dmRevisao.TRevisaoMaquinaApl.State<>dsEdit then
 begin
   if cbxTipo.ItemIndex=0 then
   begin
    if edtPlanoRevisao.Text.Length=0 then
    begin
     ShowMessage('Informe o Plano de Revisão!');
     Exit;
    end;
    dmRevisao.TRevisaoMaquinaApl.Close;
    dmRevisao.TRevisaoMaquinaApl.Open;
    dmRevisao.TRevisaoMaquinaApl.Insert;
    dmRevisao.TRevisaoMaquinaAplid.AsInteger            := RetornaIdRevisao;
    if cbxStatus.ItemIndex=3 then
      dmRevisao.TRevisaoMaquinaAplstatus.AsInteger      := 2
    else
      dmRevisao.TRevisaoMaquinaAplstatus.AsInteger      := cbxStatus.ItemIndex;
    dmRevisao.TRevisaoMaquinaApldatareg.AsDateTime      := Now;
    dmRevisao.TRevisaoMaquinaAplidusuario.AsString      := dmDB.vIdUser;
    dmRevisao.TRevisaoMaquinaAplidplanorevisao.AsString := vIdPlanoRev;
    dmRevisao.TRevisaoMaquinaAplidmaquina.AsString      := vIdMaquina;
    dmRevisao.TRevisaoMaquinaApldatainicio.AsDateTime   := edtDataIni.Date;
    dmRevisao.TRevisaoMaquinaApldatafim.AsDateTime      := edtDataFim.Date;
    dmRevisao.TRevisaoMaquinaAplidresponsavel.AsString  := dmDB.vIdUser;
    dmRevisao.TRevisaoMaquinaAplhorimetro.AsString      := edtHorimetro.Text;
    dmRevisao.TRevisaoMaquinaApltipo.AsInteger          := cbxTipo.ItemIndex;
    dmRevisao.TRevisaoMaquinaAplsyncaws.AsInteger       := 0;
    dmRevisao.TRevisaoMaquinaAplsyncfaz.AsInteger       := 0;
    try
     dmRevisao.TRevisaoMaquinaApl.ApplyUpdates(-1);
     vIdRevInsert := dmRevisao.RetornaIdMaxRevisao;
     dmRevisao.IsereItensRevisao(vIdPlanoRev,vIdRevInsert);
     ShowMessage('Revisão cadastrada com sucesso, adicione os itens!');
     GeraLista('');
     tbPrincipal.ActiveTab := tbiLista
    except
     on E : Exception do
       ShowMessage('Erro ao Inserir Revisao: '+E.Message);
    end;
   end
   else
   begin
    dmRevisao.TRevisaoMaquinaApl.Close;
    dmRevisao.TRevisaoMaquinaApl.Open;
    dmRevisao.TRevisaoMaquinaApl.Insert;
    dmRevisao.TRevisaoMaquinaAplid.AsInteger             := RetornaIdRevisao;
    if cbxStatus.ItemIndex=3 then
      dmRevisao.TRevisaoMaquinaAplstatus.AsInteger       := 2
    else
      dmRevisao.TRevisaoMaquinaAplstatus.AsInteger       := cbxStatus.ItemIndex;
    dmRevisao.TRevisaoMaquinaAplidusuario.AsString       := dmDB.vIdUser;
    dmRevisao.TRevisaoMaquinaApldatareg.AsDateTime       := Now;
    dmRevisao.TRevisaoMaquinaAplidmaquina.AsString       := vIdMaquina;
    dmRevisao.TRevisaoMaquinaApldatainicio.AsDateTime    := edtDataIni.Date;
    dmRevisao.TRevisaoMaquinaApldatafim.AsDateTime       := edtDataFim.Date;
    dmRevisao.TRevisaoMaquinaAplidresponsavel.AsString   := dmDB.vIdUser;
    dmRevisao.TRevisaoMaquinaAplhorimetro.AsString       := edtHorimetro.Text;
    dmRevisao.TRevisaoMaquinaApltipo.AsInteger           := cbxTipo.ItemIndex;
    dmRevisao.TRevisaoMaquinaAplidplanorevisao.AsInteger := 0;
    dmRevisao.TRevisaoMaquinaAplsyncaws.AsInteger        := 0;
    dmRevisao.TRevisaoMaquinaAplsyncfaz.AsInteger        := 0;
    try
     dmRevisao.TRevisaoMaquinaApl.ApplyUpdates(-1);
     vIdRevInsert := dmRevisao.RetornaIdMaxRevisao;
     ShowMessage('Revisão cadastrada com sucesso, adicione os itens!');
     GeraLista('');
     tbPrincipal.ActiveTab := tbiLista
    except
     on E : Exception do
       ShowMessage('Erro ao Inserir Revisao: '+E.Message);
    end;
   end;
 end
 else
 begin
  if cbxTipo.ItemIndex=0 then
   begin
    if edtPlanoRevisao.Text.Length=0 then
    begin
     ShowMessage('Informe o Plano de Revisão!');
     Exit;
    end;
    dmRevisao.TRevisaoMaquinaAplstatus.AsInteger        := cbxStatus.ItemIndex;
    dmRevisao.TRevisaoMaquinaApldatareg.AsDateTime      := Now;
    dmRevisao.TRevisaoMaquinaAplidusuario.AsString      := dmDB.vIdUser;
    dmRevisao.TRevisaoMaquinaAplidplanorevisao.AsString := vIdPlanoRev;
    dmRevisao.TRevisaoMaquinaAplidmaquina.AsString      := vIdMaquina;
    dmRevisao.TRevisaoMaquinaApldatainicio.AsDateTime   := edtDataIni.Date;
    dmRevisao.TRevisaoMaquinaApldatafim.AsDateTime      := edtDataFim.Date;
    dmRevisao.TRevisaoMaquinaAplidresponsavel.AsString  := dmDB.vIdUser;
    dmRevisao.TRevisaoMaquinaAplhorimetro.AsString      := edtHorimetro.Text;
    dmRevisao.TRevisaoMaquinaApltipo.AsInteger          := cbxTipo.ItemIndex;
    dmRevisao.TRevisaoMaquinaAplsyncaws.AsInteger       := 0;
    dmRevisao.TRevisaoMaquinaAplsyncfaz.AsInteger       := 0;
    try
     dmRevisao.TRevisaoMaquinaApl.ApplyUpdates(-1);
     ShowMessage('Revisão cadastrada com sucesso, adicione os itens!');
     GeraLista('');
     tbPrincipal.ActiveTab := tbiLista
    except
     on E : Exception do
       ShowMessage('Erro ao Inserir Revisao: '+E.Message);
    end;
   end
   else
   begin
    dmRevisao.TRevisaoMaquinaAplstatus.AsInteger        := cbxStatus.ItemIndex;
    dmRevisao.TRevisaoMaquinaAplidusuario.AsString      := dmDB.vIdUser;
    dmRevisao.TRevisaoMaquinaApldatareg.AsDateTime      := Now;
    dmRevisao.TRevisaoMaquinaAplidmaquina.AsString      := vIdMaquina;
    dmRevisao.TRevisaoMaquinaApldatainicio.AsDateTime   := edtDataIni.Date;
    dmRevisao.TRevisaoMaquinaApldatafim.AsDateTime      := edtDataFim.Date;
    dmRevisao.TRevisaoMaquinaAplidresponsavel.AsString  := dmDB.vIdUser;
    dmRevisao.TRevisaoMaquinaAplhorimetro.AsString      := edtHorimetro.Text;
    dmRevisao.TRevisaoMaquinaApltipo.AsInteger          := cbxTipo.ItemIndex;
    dmRevisao.TRevisaoMaquinaAplsyncaws.AsInteger       := 0;
    dmRevisao.TRevisaoMaquinaAplsyncfaz.AsInteger       := 0;
    try
     dmRevisao.TRevisaoMaquinaApl.ApplyUpdates(-1);
     ShowMessage('Revisão cadastrada com sucesso, adicione os itens!');
     GeraLista('');
     tbPrincipal.ActiveTab := tbiLista
    except
     on E : Exception do
       ShowMessage('Erro ao Inserir Revisao: '+E.Message);
    end;
   end;
 end;
end;

procedure TfrmRevisaoMaquina.btnNovoClick(Sender: TObject);
begin
  layEdit.Visible           := false;
  vEdit                     :=0;
  edtMaquina.Text           :='';
  edtHorimetro.Text         :='0';
  cbxStatus.ItemIndex       :=-1;
  cbxTipo.ItemIndex         := -1;
  edtPlanoRevisao.Text      :='';
  layPlanoRevisao.Enabled   := false;
  dmRevisao.TRevisaoMaquinaApl.Close;
  dmRevisao.TRevisaoMaquinaApl.Open;
  dmRevisao.TRevisaoMaquinaApl.Insert;
  tbPrincipal.ActiveTab      := tbiCad;
end;

procedure TfrmRevisaoMaquina.btnSalvarClick(Sender: TObject);
var
 vIdRevInsert:integer;
begin
 if cbxTipo.ItemIndex=-1 then
 begin
  ShowMessage('Informe o tipo de Revisão');
  Exit;
 end;
 if cbxTipo.ItemIndex=0 then
 begin
  if edtPlanoRevisao.Text.Length=0 then
  begin
   ShowMessage('Informe o Plano de Revisão');
   Exit;
  end;
 end;
 if edtMaquina.Text.Length=0 then
 begin
  ShowMessage('Informe a maquina!');
  Exit;
 end;
 if (edtHorimetro.Text.Length=0)and (edtHorimetro.Text='0') then
 begin
  ShowMessage('Informe o Horimentro!');
  Exit;
 end;


 if dmRevisao.TRevisaoMaquinaApl.State = dsInsert then
 begin
  vIdRevInsert                                  := RetornaIdRevisao;
  dmRevisao.TRevisaoMaquinaAplid.AsInteger      := vIdRevInsert
 end
 else
 begin
  dmRevisao.TRevisaoMaquinaAplsyncfaz.AsInteger := 2;
  if cbxStatus.ItemIndex=3 then
   begin
     if dmDB.RevisaoQtdeItensConfirmados(dmRevisao.TRevisaoMaquinaAplid.AsString)=0 then
     begin
       ShowMessage('Confirme os itens antes de Finaliza!!');
       Exit;
     end;
   end;
 end;

 dmRevisao.TRevisaoMaquinaAplidusuario.AsString      :=dmDB.vIdUser;

 if vIdPlanoRev.Length=0 then
  dmRevisao.TRevisaoMaquinaAplidplanorevisao.AsString :='0'
 else
  dmRevisao.TRevisaoMaquinaAplidplanorevisao.AsString :=vIdPlanoRev;

 dmRevisao.TRevisaoMaquinaApltipo.AsInteger          := cbxTipo.ItemIndex;
 dmRevisao.TRevisaoMaquinaAplidmaquina.AsString      := vIdMaquina;
 dmRevisao.TRevisaoMaquinaApldatainicio.AsDateTime   := edtDataIni.DateTime;
 dmRevisao.TRevisaoMaquinaApldatafim.AsDateTime      := edtDataFim.DateTime;
 dmRevisao.TRevisaoMaquinaAplidresponsavel.AsString  := dmDB.vIdUser;
 dmRevisao.TRevisaoMaquinaAplhorimetro.AsString      := edtHorimetro.Text;
 dmRevisao.TRevisaoMaquinaAplstatus.AsInteger        := cbxStatus.ItemIndex;
 try
  dmRevisao.TRevisaoMaquinaApl.ApplyUpdates(-1);
  if vEdit=0 then
  begin
   if cbxTipo.ItemIndex=0 then
   begin
    dmRevisao.AbriPlanoRevisaoItens(vIdPlanoRev);
    while not dmRevisao.TPlanoRevisaoItens.eof  do
    begin
      dmRevisao.TRevisaoMaquinaItens.Close;
      dmRevisao.TRevisaoMaquinaItens.Open();
      dmRevisao.TRevisaoMaquinaItens.Insert;

      dmRevisao.TRevisaoMaquinaItensid.AsInteger          :=RetornaIdItemRevisao;
      dmRevisao.TRevisaoMaquinaItensidrevisao.Asinteger   :=vIdRevInsert;
      dmRevisao.TRevisaoMaquinaItensiditem.AsString       :=dmRevisao.TPlanoRevisaoItensiditem.AsString;
      dmRevisao.TRevisaoMaquinaItensitem.AsString         :=dmRevisao.TPlanoRevisaoItensitem.AsString;
      if dmRevisao.TPlanoRevisaoItensidproduto.AsString.Length>0 then
       dmRevisao.TRevisaoMaquinaItensidproduto.AsString   :=dmRevisao.TPlanoRevisaoItensidproduto.AsString;
      if dmRevisao.TPlanoRevisaoItensproduto.AsString.Length>0 then
       dmRevisao.TRevisaoMaquinaItensqtde.AsString        :=dmRevisao.TPlanoRevisaoItensqtde.AsString;
      if dmRevisao.TPlanoRevisaoItensobservacao.AsString.Length>0 then
       dmRevisao.TRevisaoMaquinaItensobservacao.AsString  := dmRevisao.TPlanoRevisaoItensobservacao.AsString;
      dmRevisao.TRevisaoMaquinaItensidusuario.AsString    := dmDB.vIdUser;
      dmRevisao.TRevisaoMaquinaItenstipo.AsString         := dmRevisao.TPlanoRevisaoItenstipo.AsString;
      try
       dmRevisao.TRevisaoMaquinaItens.ApplyUpdates(-1);
     dmRevisao.TPlanoRevisaoItens.Next;
     except
      on E : Exception do
       ShowMessage('Erro ao Itens Revisao: '+E.Message);
     end;
    end;
   end;
  end
  else
   vIdRevInsert :=  strToInt(vIdRevisao);
  GeraLista('');
  GeraListaITens(intToStr(vIdRevInsert));
  tbPrincipal.ActiveTab := tbiLista;
 except
  on E : Exception do
   ShowMessage('Erro ao inserir Revisao: '+E.Message);
 end;
end;

procedure TfrmRevisaoMaquina.btnVoltar1Click(Sender: TObject);
begin
 Close;
end;

procedure TfrmRevisaoMaquina.btnVoltarClick(Sender: TObject);
begin
 tbPrincipal.ActiveTab := tbiLista;
end;

procedure TfrmRevisaoMaquina.cbxTipoChange(Sender: TObject);
begin
 layPlanoRevisao.Enabled := cbxTipo.ItemIndex=0;
 layMaquina.Enabled      := cbxTipo.ItemIndex>-1;
 layStatus.Enabled       := cbxTipo.ItemIndex>-1;
 layData.Enabled         := cbxTipo.ItemIndex>-1;
end;

procedure TfrmRevisaoMaquina.DateEdit1ClosePicker(Sender: TObject);
begin
 btnExcluiRev.Visible := false;
 Filtro;
end;

procedure TfrmRevisaoMaquina.EditButton1Click(Sender: TObject);
var
 vIdPlanos:string;
begin
  vIdPlanos := dmRevisao.RetornaPlanoRevisaoMaquinas(vidMaquina);
  frmPlanoRevisao := TfrmPlanoRevisao.Create(Self);
  try
    frmPlanoRevisao.vFiltro:=' where id in('+vIdPlanos+')';
    frmPlanoRevisao.ShowModal(
    procedure(ModalResult: TModalResult)
    begin
      vIdPlanoRev               := DMRevisao.vIdPlanoSelect;
      edtPlanoRevisao.Text      :=  DMRevisao.vNomePlanoSelect;
    end);
  finally
    frmPlanoRevisao.free;
  end;
end;

procedure TfrmRevisaoMaquina.EditButton3Click(Sender: TObject);
begin
  frmProdutos := TfrmProdutos.Create(Self);
  try
    frmProdutos.vTipo :='3';
    frmProdutos.ShowModal(
    procedure(ModalResult: TModalResult)
    begin
     edtProdutoUtilizado.Text := dmDB.vNomeProduto;
     vIdProduto               := DMdb.vIdProduto;
     lblCodFab.Text           := 'Cod. Fabri.:'+dmDB.vCodFabricanteProduto;
    end);
  finally
    frmProdutos.Free;
  end;
end;

procedure TfrmRevisaoMaquina.EditButton5Click(Sender: TObject);
begin
  frmMaquinas := TfrmMaquinas.Create(Self);
  try
    frmMaquinas.ShowModal(
    procedure(ModalResult: TModalResult)
    begin
      vIdMaquina         := dmDB.vIdMaquinaSel;
      edtMaquina.Text    := dmDB.vMarcaModelo;
    end);
  finally
    frmMaquinas.free;
  end;
end;

procedure TfrmRevisaoMaquina.edtDataInicioClosePicker(Sender: TObject);
begin
 btnExcluiRev.Visible := false;
 Filtro;
end;

procedure TfrmRevisaoMaquina.edtNomeFiltroChangeTracking(Sender: TObject);
begin
 btnExcluiRev.Visible := false;
 Filtro;
end;

procedure TfrmRevisaoMaquina.Filtro;
var
 vFiltro:string;
begin
 vFiltro := '';
 if edtNomeFiltro.Text.Length>0 then
  vFiltro := ' and m.prefixo like '+QuotedStr('%'+edtNomeFiltro.Text+'%');

 vFiltro  := vFiltro+' and c.datainicio between '+FormatDateTime('yyyy-mm-dd',edtDataInicio.Date).QuotedString+' and '+
 FormatDateTime('yyyy-mm-dd',edtDataFim.Date).QuotedString;
 GeraLista(vFiltro);
end;

procedure TfrmRevisaoMaquina.FormShow(Sender: TObject);
begin
  edtDataInicio.Date       := date-30;
  tbPrincipal.TabPosition  := TTabPosition.None;
  tbPrincipal.ActiveTab    := tbiLista;
  btnExcluiRev.Visible     := false;
  btnExluiItem.Visible     := false;
  layPlanoRevisao.Enabled  := false;
  layMaquina.Enabled       := false;
  layStatus.Enabled        := false;
  layData.Enabled          := false;
  GeraLista('');
end;

procedure TfrmRevisaoMaquina.GeraLista(vFiltro: string);
var
 item   : TListViewItem;
 txt    : TListItemText;
 txtH   : TListItemPurpose;
 img    : TListItemImage;
begin
 dmRevisao.AbreRevisaoApl(vFiltro);
 ListaRev.Items.Clear;
 DMRevisao.TRevisaoMaquinaAplLista.First;
 while not DMRevisao.TRevisaoMaquinaAplLista.eof do
 begin
   item := ListaRev.Items.Add;
   with frmRevisaoMaquina do
   begin
     with item  do
     begin
      if DMRevisao.TRevisaoMaquinaAplListastatus.AsInteger>-1 then
      begin
       if DMRevisao.TRevisaoMaquinaAplListatipo.AsInteger=1 then
       begin
        txt      := TListItemText(Objects.FindDrawable('Text1'));
        txt.Text := 'Revisão Corretiva Id :'+DMRevisao.TRevisaoMaquinaAplListaid.AsString;
        txt.TagString := DMRevisao.TRevisaoMaquinaAplListaid.AsString;
       end;
       if DMRevisao.TRevisaoMaquinaAplListatipo.AsInteger=0 then
       begin
        txt      := TListItemText(Objects.FindDrawable('Text1'));
        txt.Text := 'Revisão Preventiva Id:'+DMRevisao.TRevisaoMaquinaAplListaid.AsString;
        txt.TagString := DMRevisao.TRevisaoMaquinaAplListaid.AsString;
       end;
       txt      := TListItemText(Objects.FindDrawable('Text2'));
       txt.Text := 'Plano:';
       txt.TagString := DMRevisao.TRevisaoMaquinaAplListaidplanorevisao.AsString;

       txt           := TListItemText(Objects.FindDrawable('Text3'));
       txt.Text      := DMRevisao.TRevisaoMaquinaAplListaplanorevisao.AsString;
       txt.TagString := DMRevisao.TRevisaoMaquinaAplListatipo.AsString;

       txt      := TListItemText(Objects.FindDrawable('Text4'));
       txt.Text := 'Maquina: ';

       txt      := TListItemText(Objects.FindDrawable('Text5'));
       txt.Text := DMRevisao.TRevisaoMaquinaAplListaprefixo.AsString;
       txt.TagString := DMRevisao.TRevisaoMaquinaAplListasyncfaz.AsString;


       txt      := TListItemText(Objects.FindDrawable('Text6'));
       txt.Text := 'Horimetro: ';

       txt      := TListItemText(Objects.FindDrawable('Text7'));
       txt.Text := DMRevisao.TRevisaoMaquinaAplListahorimetro.AsString;
       txt.TagString := DMRevisao.TRevisaoMaquinaAplListaidmaquina.AsString;

       txt      := TListItemText(Objects.FindDrawable('Text8'));
       txt.Text := 'Inicio: ';
       txt      := TListItemText(Objects.FindDrawable('Text9'));
       txt.Text := DMRevisao.TRevisaoMaquinaAplListadatainicio.AsString;

       txt      := TListItemText(Objects.FindDrawable('Text10'));
       txt.Text := 'Fim: ';
       txt      := TListItemText(Objects.FindDrawable('Text11'));
       txt.Text := DMRevisao.TRevisaoMaquinaAplListadatafim.AsString;

       txt      := TListItemText(Objects.FindDrawable('Text12'));
       txt.Text := 'Status: ';
       txt      := TListItemText(Objects.FindDrawable('Text13'));
       if DMRevisao.TRevisaoMaquinaAplListaStatus.AsInteger=0 then
        txt.Text := 'Iniciada';
       if DMRevisao.TRevisaoMaquinaAplListaStatus.AsInteger=1 then
        txt.Text := 'Aguardando Serviços';
       if DMRevisao.TRevisaoMaquinaAplListaStatus.AsInteger=2 then
        txt.Text := 'Aguardando Compras';
       if DMRevisao.TRevisaoMaquinaAplListaStatus.AsInteger=3 then
        txt.Text := 'Finalizada';
       txt.TagString := DMRevisao.TRevisaoMaquinaAplListaStatus.AsString;

       txt      := TListItemText(Objects.FindDrawable('Text14'));
       txt.Text := 'Items Confirmados:';
       txt      := TListItemText(Objects.FindDrawable('Text15'));
       txt.Text := intToStr(dmDB.RevisaoQtdeItensConfirmados(DMRevisao.TRevisaoMaquinaAplListaid.AsString));


       txt      := TListItemText(Objects.FindDrawable('Text16'));
       txt.Text := 'Editar';
       img := TListItemImage(Objects.FindDrawable('Image19'));
       img.Bitmap     := frmPrincipal.imgEdit.Bitmap;

       txt      := TListItemText(Objects.FindDrawable('Text17'));
       txt.Text := 'Itens';
       img := TListItemImage(Objects.FindDrawable('Image20'));
       img.Bitmap     := frmPrincipal.imgMecanico.Bitmap;

       txt      := TListItemText(Objects.FindDrawable('Text18'));
       txt.Text := 'Serviços';
       img := TListItemImage(Objects.FindDrawable('Image21'));
       img.Bitmap     := frmPrincipal.imgSeviceMec.Bitmap;

       img := TListItemImage(Objects.FindDrawable('Image22'));
       img.Bitmap     := frmPrincipal.imgRetanguloVerde.Bitmap;

     end;
     end;
     DMRevisao.TRevisaoMaquinaAplLista.Next;
   end;
 end;
end;

procedure TfrmRevisaoMaquina.GeraListaITens(idPlanoManutencao: string);
var
 item   : TListViewItem;
 txt    : TListItemText;
 txtH   : TListItemPurpose;
 img    : TListItemImage;
 vStatus:string;
begin
 dmRevisao.AbreItensRevisaoApl(idPlanoManutencao);
 TThread.CreateAnonymousThread(procedure
 begin
  TThread.Synchronize(nil, procedure
  begin
   dmRevisao.TRevisaoMaquinaItens.First;
   Lista.Items.Clear;
   while not dmRevisao.TRevisaoMaquinaItens.eof do
   begin
     item := Lista.Items.Add;
     with frmRevisaoMaquina do
     begin
       with item  do
       begin
         txt           := TListItemText(Objects.FindDrawable('Text15'));
         txt.Text      := 'Produto : ';
         txt.TagString := dmRevisao.TRevisaoMaquinaItensid.AsString;

         txt           := TListItemText(Objects.FindDrawable('Text2'));
         txt.Text      := dmRevisao.TRevisaoMaquinaItensnome.AsString;
         txt.TagString := dmRevisao.TRevisaoMaquinaItenssyncfaz.AsString;

         txt           := TListItemText(Objects.FindDrawable('Text1'));
         txt.Text      := dmRevisao.TRevisaoMaquinaItenstipoStr.AsString;
         txt.TagString := dmRevisao.TRevisaoMaquinaItenstipo.AsString;

         txt           := TListItemText(Objects.FindDrawable('Text3'));
         txt.Text      := 'Item : ';
         txt.TagString := dmRevisao.TRevisaoMaquinaItensiditem.AsString;

         txt           := TListItemText(Objects.FindDrawable('Text4'));
         txt.text      := dmRevisao.TRevisaoMaquinaItensitem.AsString;

         txt           := TListItemText(Objects.FindDrawable('Text5'));
         txt.Text      := 'Codigo Fabricante : ';
         txt.TagString := dmRevisao.TRevisaoMaquinaItenscodigofabricante.AsString;

         txt           := TListItemText(Objects.FindDrawable('Text6'));
         txt.text      := dmRevisao.TRevisaoMaquinaItenscodigofabricante.AsString;

         txt           := TListItemText(Objects.FindDrawable('Text7'));
         txt.Text      := 'Qtde : ';
         txt.TagString := dmRevisao.TRevisaoMaquinaItensidproduto.AsString;

         txt           := TListItemText(Objects.FindDrawable('Text8'));
         txt.text      := dmRevisao.TRevisaoMaquinaItensqtde.AsString;

         txt           := TListItemText(Objects.FindDrawable('Text9'));
         txt.Text      := 'Obs: ';

         txt           := TListItemText(Objects.FindDrawable('Text10'));
         txt.text      := dmRevisao.TRevisaoMaquinaItensobservacao.AsString;

         if dmRevisao.TRevisaoMaquinaItensstatus.AsInteger=1 then
          begin
           txt           := TListItemText(Objects.FindDrawable('Text11'));
           txt.text      := 'Pendente: ';

           img := TListItemImage(Objects.FindDrawable('Image14'));
           img.Bitmap     := nil;

           img := TListItemImage(Objects.FindDrawable('Image12'));
           img.Bitmap     := frmPrincipal.imgListaConfirma.Bitmap
          end
          else
          begin
           txt           := TListItemText(Objects.FindDrawable('Text11'));
           txt.text      := 'Confirmado';

           img := TListItemImage(Objects.FindDrawable('Image14'));
           img.Bitmap     := frmPrincipal.imgRetanguloVerde.Bitmap;

           img := TListItemImage(Objects.FindDrawable('Image12'));
           img.Bitmap     := nil;
          end;
          img := TListItemImage(Objects.FindDrawable('Image13'));
          img.Bitmap     := frmPrincipal.imgMecanico.Bitmap;
       end;
     end;
     dmRevisao.TRevisaoMaquinaItens.Next;
   end;
  end);
 end).Start;
end;


procedure TfrmRevisaoMaquina.Image10Click(Sender: TObject);
begin
 tbPrincipal.ActiveTab := tbiLista;
end;

procedure TfrmRevisaoMaquina.Image12Click(Sender: TObject);
begin
  tbPrincipal.ActiveTab := tbiItens;
end;

procedure TfrmRevisaoMaquina.Image3Click(Sender: TObject);
begin

 tbPrincipal.ActiveTab := tbiLista;
 Geralista('');
end;

procedure TfrmRevisaoMaquina.ListaGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
 btnExluiItem.Visible   := true;
end;

procedure TfrmRevisaoMaquina.ListaItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
 btnExluiItem.Visible := false;

 vStatusSyncItem:= TAppearanceListViewItem(Lista.Selected).Objects.FindObjectT<TListItemText>
  ('Text2').TagString;

 vIdTabelaItens:= TAppearanceListViewItem(Lista.Selected).Objects.FindObjectT<TListItemText>
  ('Text15').TagString;

  vRevisaoItem := TAppearanceListViewItem(Lista.Selected).Objects.FindObjectT<TListItemText>
  ('Text4').Text;

  vRevisaoIdItem := TAppearanceListViewItem(Lista.Selected).Objects.FindObjectT<TListItemText>
  ('Text3').TagString;

  vItemProdutoLista     := TAppearanceListViewItem(Lista.Selected).Objects.FindObjectT<TListItemText>
  ('Text2').Text;

  vItemProdutoCodigoFab := TAppearanceListViewItem(Lista.Selected).Objects.FindObjectT<TListItemText>
  ('Text6').Text;

  vItemQtdeLista        := TAppearanceListViewItem(Lista.Selected).Objects.FindObjectT<TListItemText>
  ('Text8').Text;

  vItemListaObs         :=TAppearanceListViewItem(Lista.Selected).Objects.FindObjectT<TListItemText>
  ('Text10').Text;

  vIdProduto            := TAppearanceListViewItem(Lista.Selected).Objects.FindObjectT<TListItemText>
  ('Text7').TagString;

  vTipoItemLista        := TAppearanceListViewItem(Lista.Selected).Objects.FindObjectT<TListItemText>
  ('Text1').TagString;

  if ItemObject is TListItemImage then
  begin
    if TListItemImage(ItemObject).Name='Image12' then
    begin
     if (vTipoItemLista='0') and (vIdProduto.Length=0) then
     begin
      ShowMessage('Informe o produto utilizado antes de confirmar!!');
      Exit;
     end
     else
     begin
      dmRevisao.MudaStatusConfirma('revisaomaquinaitens', vIdTabelaItens);
      dmRevisao.MudaStatusEditItemSync('revisaomaquinaitens',vIdTabelaItens);
      GeraListaiTens(vIdRevisao);
     end;
    end;
  end;
end;

procedure TfrmRevisaoMaquina.ListaRevGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
  btnExcluiRev.Visible     := true;
end;

procedure TfrmRevisaoMaquina.ListaRevItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
   btnExcluiRev.Visible := false;
   vIdRevisao :=
   TAppearanceListViewItem(ListaRev.Selected).Objects.FindObjectT<TListItemText>
   ('Text1').TagString;

  vPlanoRevLista := TAppearanceListViewItem(ListaRev.Selected).Objects.FindObjectT<TListItemText>
   ('Text3').Text;

  vIdPlaRevLista :=
  TAppearanceListViewItem(ListaRev.Selected).Objects.FindObjectT<TListItemText>
   ('Text2').TagString;

  vTipoLista  :=
  TAppearanceListViewItem(ListaRev.Selected).Objects.FindObjectT<TListItemText>
   ('Text3').TagString;

  vStatusSync :=
   TAppearanceListViewItem(ListaRev.Selected).Objects.FindObjectT<TListItemText>
   ('Text5').TagString;

  vNomeMaquina := TAppearanceListViewItem(ListaRev.Selected).Objects.FindObjectT<TListItemText>
   ('Text5').Text;

  vIdMaquina   := TAppearanceListViewItem(ListaRev.Selected).Objects.FindObjectT<TListItemText>
   ('Text7').TagString;

  vHorimetro  := TAppearanceListViewItem(ListaRev.Selected).Objects.FindObjectT<TListItemText>
   ('Text7').Text;

  vDataIni  := TAppearanceListViewItem(ListaRev.Selected).Objects.FindObjectT<TListItemText>
   ('Text9').Text;

  vDataFim  := TAppearanceListViewItem(ListaRev.Selected).Objects.FindObjectT<TListItemText>
   ('Text11').Text;

  vStatusRev   := TAppearanceListViewItem(ListaRev.Selected).Objects.FindObjectT<TListItemText>
   ('Text13').TagString;

  dmDB.vIdRevSelect := vIdRevisao;
  if ItemObject is TListItemImage then
  begin
   if TListItemImage(ItemObject).Name='Image19' then
   begin
     if vStatusSync='1' then
     begin
      ShowMessage('Revisão ja Sincronizada!!');
      Exit;
     end;
     cbxTipo.ItemIndex   := strToInt(vTipoLista);
     edtPlanoRevisao.Text:= vPlanoRevLista;
     edtPlanoRevisao.Enabled := vTipoLista='0';
     vIdPlanoRev         := vIdPlaRevLista;
     edtMaquina.Text     := vNomeMaquina;
     edtHorimetro.Text   := vHorimetro;
     cbxStatus.ItemIndex := strToInt(vStatusRev);
     edtDataIni.Date     := StrToDate(vDataIni);
     edtDataFim.Date     := StrToDate(vDataFim);
     dmRevisao.AbreRevisaoAplInsertEdit(vIdRevisao);
     if dmRevisao.TRevisaoMaquinaApl.RecordCount>0 then
     begin
      dmRevisao.TRevisaoMaquinaApl.Edit;
      vEdit :=1;
      tbPrincipal.ActiveTab := tbiCad;
      Exit;
     end
     else
      ShowMessage('Revisão Não encontrada!');
   end;
   if TListItemImage(ItemObject).Name='Image20' then
   begin
     GeraListaiTens(vIdRevisao);
     tbPrincipal.ActiveTab := tbiItens;
     Exit;
   end;
   if TListItemImage(ItemObject).Name='Image21' then
   begin
    frmServicosRevisao := TfrmServicosRevisao.Create(Self);
    try
      frmServicosRevisao.ShowModal(
      procedure(ModalResult: TModalResult)
      begin
      end);
    finally
      frmServicosRevisao.free;
    end;
   end;
  end;
end;

procedure TfrmRevisaoMaquina.btnExcluiItemListaClick(Sender: TObject);
begin
 btnExcluiRev.Visible := false;
 if vRevisaoItem.Length=0 then
 begin
   ShowMessage('Selecione um item!!');
   Exit;
 end;
 try
  dmRevisao.MudaStatusDelete('revisaomaquinaitens', vRevisaoItem);
  dmRevisao.MudaStatusEditItemSync('revisaomaquinaitens',vRevisaoItem);
  ShowMessage('Item deletado com sucesso!!');
  GeraListaiTens(vIdRevisao);
  btnExcluiRev.Visible := false;
 except
  on E : Exception do
   ShowMessage('Erro ao excluir Revisao Item: '+E.Message);
 end;
end;

procedure TfrmRevisaoMaquina.btnExcluiRevClick(Sender: TObject);
begin
 btnExcluiRev.Visible := false;
 if vStatusSync='1' then
 begin
  ShowMessage('Revisão ja Sincronizada!');
  Exit;
 end
 else
 begin
   try
    dmRevisao.DeletaRevisao(vIdRevisao);
    ShowMessage('Revisão Deletada com sucesso!');
    GeraLista('');
   except
    on E : Exception do
     ShowMessage(E.ClassName+'Erro ao deletar Revisão: '+E.Message);
   end;
 end;
end;

procedure TfrmRevisaoMaquina.btnExluiItemClick(Sender: TObject);
begin
 btnExluiItem.Visible := false;
 if vStatusSyncItem='1' then
 begin
  ShowMessage('Item ja Sincronizada!');
  Exit;
 end
 else
 begin
   try
    dmRevisao.DeletaRevisaoitem(vIdTabelaItens);
    ShowMessage('Item Deletado com sucesso!');
    GeraListaiTens(vIdRevisao);
   except
    on E : Exception do
     ShowMessage(E.ClassName+'Erro ao deletar Item: '+E.Message);
   end;
 end;
end;

procedure TfrmRevisaoMaquina.Rectangle13Click(Sender: TObject);
begin
 if vTipoItemLista='0' then
 begin
  edtProdutoUtilizado.Enabled := true;
  edtItemRevisao.Enabled      := false;
  edtProdutoUtilizado.Text    := vItemProdutoLista;
  edtQtd.Value                := strToFloat(vItemQtdeLista);
  edtQtd.Enabled              := true;
 end
 else
 begin
  edtItemRevisao.Enabled      := true;
  edtProdutoUtilizado.Enabled := true;
  edtProdutoUtilizado.Text    := '';
  edtQtd.Value                := 0;
  edtProdutoUtilizado.Enabled := false;
  edtQtd.Enabled              := false;
 end;
  edtItemRevisao.Text      := vRevisaoItem;
  edtObsManu.Text          := vItemListaObs;
  vidItem                  := vRevisaoIdItem;
  lblCodFab.Text           := 'Cod. Fabri.:'+vItemProdutoCodigoFab;
  vItemInsert :=0;
  tbPrincipal.ActiveTab    :=tbiAddItem;
end;

function TfrmRevisaoMaquina.RetornaIdItemRevisao: integer;
var
 vId:integer;
 vId1:integer;
begin
 vId1 := strToInt(dmDB.vIdUser)* strToInt(formatdatetime('ddmmss',now));
 repeat
  vId  :=Random(vId1);
 until (dmDB.VerificaIdItemRevisaoExiste(intToStr(vId)));
 Result := vId;
end;

end.

