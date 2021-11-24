unit UItensRevisao;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.StdCtrls, FMX.ListView, FMX.Ani, FMX.Edit, FMX.Controls.Presentation,
  FMX.Objects, FMX.Layouts, FMX.TabControl,db, FMX.ListBox;

type
  TfrmItensRevisao = class(TForm)
    tbPrincipal: TTabControl;
    tbiLista: TTabItem;
    layListaP: TLayout;
    imgLogoCad: TImage;
    layLista: TLayout;
    layFiltros: TLayout;
    RecGro: TRectangle;
    Label1: TLabel;
    edtNomeFiltro: TEdit;
    ToolBar1: TToolBar;
    recToolBar: TRectangle;
    lblCad: TLabel;
    btnFechar: TImage;
    AnimacaoMnu: TFloatAnimation;
    tbiCad: TTabItem;
    recCad: TRectangle;
    AnimacaoCad: TFloatAnimation;
    layCad: TLayout;
    RectCad: TRectangle;
    LaySubCad: TLayout;
    laySubSubCad: TLayout;
    Rsub: TRectangle;
    laySubSubSubCad: TLayout;
    Layout1: TLayout;
    edtNome: TEdit;
    Label4: TLabel;
    laybutons: TLayout;
    Layout5: TLayout;
    btnSalvar: TRectangle;
    btnNovoItem: TRectangle;
    Label2: TLabel;
    Image6: TImage;
    Layout2: TLayout;
    Rectangle1: TRectangle;
    Layout3: TLayout;
    Layout4: TLayout;
    Label5: TLabel;
    ToolBar3: TToolBar;
    btnVoltar: TImage;
    ListaMaquinas: TListView;
    Label21: TLabel;
    Image16: TImage;
    btnSelecionar: TButton;
    Image1: TImage;
    edtGrupo: TEdit;
    procedure FormShow(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure ListaMaquinasItemClickEx(const Sender: TObject;
      ItemIndex: Integer; const LocalClickPos: TPointF;
      const ItemObject: TListItemDrawable);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnNovoItemClick(Sender: TObject);
    procedure edtNomeFiltroChangeTracking(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    vIdItemRevSel:string;
    procedure GeraLista;
    function RetornaIdItemRevisao: integer;

  end;

var
  frmItensRevisao: TfrmItensRevisao;

implementation

{$R *.fmx}

uses UPrincipal, UDMRevisao, UDataContext;

{ TfrmItensRevisao }

procedure TfrmItensRevisao.btnFecharClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmItensRevisao.btnSalvarClick(Sender: TObject);
begin
 if edtGrupo.Text.Length=0 then
  begin
    ShowMessage('Informe o Grupo!!');
    edtGrupo.SetFocus;
    Exit;
  end;

  if edtNome.Text.Length=0 then
  begin
    ShowMessage('Informe o Nome!!');
    edtNome.SetFocus;
    Exit;
  end;

  dmRevisao.TAuxRevisaoItemNome.AsString  := edtNome.Text;
  if dmRevisao.TAuxRevisaoItem.State=dsEdit then
  begin
   dmRevisao.TAuxRevisaoItemIdUsuarioAlteracao.AsString  := dmDB.vIdUser;
   dmRevisao.TAuxRevisaoItemDataAlteracao.AsDateTime     := now;
  end;
  if dmRevisao.TAuxRevisaoItem.State=dsInsert then
  begin
   if not dmRevisao.VerificaCadastroExiste('NOME','AuxRevisaoItens',edtNome.Text.QuotedString) then
   begin
     ShowMessage('Ja existe um Item com esse nome:'+edtNome.Text);
     Exit;
   end;
   dmRevisao.TAuxRevisaoItemIdUsuario.AsString := dmDB.vIdUser;
  end;
  dmRevisao.TAuxRevisaoItemGrupo.AsString     := edtGrupo.Text;
  try
   TThread.Synchronize(nil,procedure
   begin
    dmRevisao.TAuxRevisaoItemSyncAWS.AsInteger :=0;
    dmRevisao.TAuxRevisaoItemsyncfaz.AsInteger :=0;
    dmRevisao.TAuxRevisaoItemid.AsInteger :=RetornaIdItemRevisao;
    dmRevisao.TAuxRevisaoItemstatus.AsInteger :=1;
    dmRevisao.TAuxRevisaoItemdatareg.AsDateTime := now;
    dmRevisao.TAuxRevisaoItem.ApplyUpdates(-1);
    dmDB.FDConn.Commit;
    dmRevisao.TAuxRevisaoItem.Close;
    dmRevisao.TAuxRevisaoItem.Open();
    GeraLista;
   end);
   tbPrincipal.ActiveTab := tbiLista;
  except
   on E : Exception do
     ShowMessage('Erro ao Inserir Item Revisao:'+E.Message);
  end;
end;

function TfrmItensRevisao.RetornaIdItemRevisao: integer;
var
 vId:integer;
 vId1:integer;
begin
 vId1 := strToInt(dmDB.vIdUser)+ strToInt(formatdatetime('mmss',now));
 repeat
  vId:=Random(vId1);
 until (dmDB.VerificaIdItemRevisaoExiste(intToStr(vId)));
 Result := vId;
end;


procedure TfrmItensRevisao.btnSelecionarClick(Sender: TObject);
begin
 if vIdItemRevSel.Length=0 then
 begin
   ShowMessage('Selecione um Item!');
   Exit;
 end
 else
 begin
  Close;
 end;
end;

procedure TfrmItensRevisao.btnVoltarClick(Sender: TObject);
begin
 tbPrincipal.ActiveTab := tbiLista;
end;

procedure TfrmItensRevisao.edtNomeFiltroChangeTracking(Sender: TObject);
begin
 if edtNomeFiltro.Text.Length>0 then
 begin
   DMRevisao.TAuxRevisaoItem.Filtered := false;
   DMRevisao.TAuxRevisaoItem.Filter   := 'NOME LIKE '+QuotedStr('%'+edtNomeFiltro.Text+'%');
   DMRevisao.TAuxRevisaoItem.Filtered := true;
 end
 else
 begin
   DMRevisao.TAuxRevisaoItem.Filtered := false;
   DMRevisao.TAuxRevisaoItem.Close;
   DMRevisao.TAuxRevisaoItem.Open;
 end;
 GeraLista;
end;

procedure TfrmItensRevisao.FormShow(Sender: TObject);
begin
  GeraLista;
  tbPrincipal.TabPosition := TTabPosition.None;
  tbPrincipal.ActiveTab   := tbiLista;
end;

procedure TfrmItensRevisao.GeraLista;
var
 item   : TListViewItem;
 txt    : TListItemText;
 txtH   : TListItemPurpose;
 img    : TListItemImage;
 vStatus:string;
begin
 DMRevisao.TAuxRevisaoItem.Close;
 DMRevisao.TAuxRevisaoItem.Open;
 TThread.CreateAnonymousThread(procedure
 begin
  TThread.Synchronize(nil, procedure
  begin
    ListaMaquinas.Items.Clear;
    while not DMRevisao.TAuxRevisaoItem.eof do
     begin
       item := ListaMaquinas.Items.Add;
         with frmItensRevisao do
         begin
           with item  do
           begin
             txt      := TListItemText(Objects.FindDrawable('Text3'));
             txt.Text := DMRevisao.TAuxRevisaoItemgrupo.AsString;
             txt.TagString := DMRevisao.TAuxRevisaoItemId.AsString;

             txt      := TListItemText(Objects.FindDrawable('Text10'));
             txt.Text := 'Nome:';
             txt      := TListItemText(Objects.FindDrawable('Text6'));
             txt.Text := DMRevisao.TAuxRevisaoItemnome.AsString;

             img := TListItemImage(Objects.FindDrawable('Image14'));
             img.Bitmap     := frmPrincipal.imgMecanico.Bitmap;
           end;
           DMRevisao.TAuxRevisaoItem.Next;
         end;
     end;
  end);
 end).Start;
end;

procedure TfrmItensRevisao.ListaMaquinasItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
  dmDB.vNomeItemRevSelect :=
   TAppearanceListViewItem(ListaMaquinas.Selected).Objects.FindObjectT<TListItemText>
   ('Text6').Text;

  vIdItemRevSel :=
  TAppearanceListViewItem(ListaMaquinas.Selected).Objects.FindObjectT<TListItemText>
   ('Text3').TagString;

  dmDB.vIdItemRevSelect :=
   TAppearanceListViewItem(ListaMaquinas.Selected).Objects.FindObjectT<TListItemText>
   ('Text3').TagString;
end;


procedure TfrmItensRevisao.btnNovoItemClick(Sender: TObject);
begin
 edtNome.Text :='';
 edtGrupo.Text :='';
 dmRevisao.TAuxRevisaoItem.Close;
 dmRevisao.TAuxRevisaoItem.Open;
 dmRevisao.TAuxRevisaoItem.Insert;
 tbPrincipal.ActiveTab := tbiCad;
end;

end.

