unit UServicosRevisao;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation, FMX.Edit, FMX.Layouts, FMX.Ani,
  FMX.TabControl, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.DateTimeCtrls, FMX.ListView, FMX.Gestures;

type
  TfrmServicosRevisao = class(TForm)
    tbPrincipal: TTabControl;
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
    Label4: TLabel;
    laybutons: TLayout;
    Layout5: TLayout;
    btnSalvar: TRectangle;
    Label2: TLabel;
    Image6: TImage;
    Layout2: TLayout;
    Rectangle1: TRectangle;
    Layout3: TLayout;
    Layout4: TLayout;
    edtResponsavel: TEdit;
    Label5: TLabel;
    ToolBar3: TToolBar;
    btnVoltar: TImage;
    tbiLista: TTabItem;
    layListaP: TLayout;
    imgLogoCad: TImage;
    layLista: TLayout;
    Rectangle2: TRectangle;
    Layout6: TLayout;
    Button1: TButton;
    Image2: TImage;
    ToolBar1: TToolBar;
    recToolBar: TRectangle;
    lblCad: TLabel;
    btnFechar: TImage;
    AnimacaoMnu: TFloatAnimation;
    edtData: TDateEdit;
    Layout7: TLayout;
    Rectangle3: TRectangle;
    Layout8: TLayout;
    Layout9: TLayout;
    edtDescricao: TEdit;
    Label1: TLabel;
    Layout10: TLayout;
    Rectangle4: TRectangle;
    Layout11: TLayout;
    Layout12: TLayout;
    Label3: TLabel;
    edtValor: TEdit;
    ListaRev: TListView;
    laybtnLista: TLayout;
    btnExcluiItem: TRectangle;
    Image34: TImage;
    lblExcluir: TLabel;
    btnEditar: TRectangle;
    Image37: TImage;
    Label82: TLabel;
    GestureManager1: TGestureManager;
    procedure ListaRevGesture(Sender: TObject;
      const EventInfo: TGestureEventInfo; var Handled: Boolean);
    procedure btnExcluiItemClick(Sender: TObject);
    procedure ListaRevItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure btnEditarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    vIdServico,vData,vResponsavel,vDescricao,vValor:string;
    vEdit:Integer;
    procedure geraLista;
    function RetornaIdServicoRevisao: integer;
  end;

var
  frmServicosRevisao: TfrmServicosRevisao;

implementation

{$R *.fmx}

uses UPrincipal, UDMRevisao, UDataContext;

{ TfrmServicosRevisao }

procedure TfrmServicosRevisao.btnEditarClick(Sender: TObject);
begin
 if vIdServico.Length=0 then
 begin
   ShowMessage('Selecione um serviço!');
   Exit;
 end;
  vEdit                 :=1;
  edtData.Text          :=vData;
  edtResponsavel.Text   :=vResponsavel;
  edtDescricao.Text     :=vDescricao;
  edtValor.Text         :=vValor;
  tbPrincipal.ActiveTab := tbiCad;
end;

procedure TfrmServicosRevisao.btnExcluiItemClick(Sender: TObject);
begin
 laybtnLista.Visible := false;
 if vIdServico.Length=0 then
 begin
  ShowMessage('Selecione uma Serviço!');
  Exit;
 end;
 try
  dmRevisao.MudaStatusDelete('servicomanutencao', vIdServico);
  dmRevisao.MudaStatusEditItemSync('servicomanutencao', vIdServico);
  ShowMessage('Serviço deletado com sucesso!!');
  geraLista;
 except
  on E : Exception do
   ShowMessage('Erro ao excluir Servico: '+E.Message);
 end;
end;

procedure TfrmServicosRevisao.btnFecharClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmServicosRevisao.btnSalvarClick(Sender: TObject);
begin
  dmRevisao.TRevisaoServicos.Filtered := false;
  dmRevisao.TRevisaoServicos.Close;
  dmRevisao.TRevisaoServicos.Open;
  if edtResponsavel.Text.Length=0 then
  begin
    ShowMessage('Informe o Responsavel!!');
    Exit;
  end;

  if edtDescricao.Text.Length=0 then
  begin
    ShowMessage('Informe a Descricao!!');
    Exit;
  end;

  if edtValor.Text.Length=0 then
  begin
    ShowMessage('Informe o Valor!!');
    Exit;
  end;
  if vEdit=1 then
  begin
   dmRevisao.MudaStatusEditItemSync('servicomanutencao',vIdServico);
   dmRevisao.TRevisaoServicos.Filtered := false;
   dmRevisao.TRevisaoServicos.Filter   := 'id='+vIdServico;
   dmRevisao.TRevisaoServicos.Filtered := true;
   dmRevisao.TRevisaoServicos.Edit;
  end
  else
   dmRevisao.TRevisaoServicos.Insert;

  if vEdit=0 then
   dmRevisao.TRevisaoServicosid.AsInteger            := RetornaIdServicoRevisao;

  dmRevisao.TRevisaoServicosidusuario.AsString       := dmDB.vIdUser;
  dmRevisao.TRevisaoServicosdatarealizado.AsDateTime := edtData.Date;
  dmRevisao.TRevisaoServicosresponsavel.AsString     := edtResponsavel.Text;
  dmRevisao.TRevisaoServicostiposervico.AsInteger    := 1;
  dmRevisao.TRevisaoServicosidrevisao.AsString       := dmDB.vIdRevSelect;
  dmRevisao.TRevisaoServicosdescricao.AsString       := edtDescricao.Text;
  dmRevisao.TRevisaoServicosvalortotal.AsString      := edtValor.Text;
  try
    dmRevisao.TRevisaoServicos.ApplyUpdates(-1);
    ShowMessage('Serviço cadastrado com sucesso!');
    geraLista;
    tbPrincipal.ActiveTab := tbiLista;
  except
    on E : Exception do
     ShowMessage('Erro ao Inserir Servico:'+E.Message);
  end;
end;

procedure TfrmServicosRevisao.btnVoltarClick(Sender: TObject);
begin
 tbPrincipal.ActiveTab := tbiLista;
end;

function TfrmServicosRevisao.RetornaIdServicoRevisao: integer;
var
 vId:integer;
 vId1:integer;
begin
 vId1 := strToInt(dmDB.vIdUser)* strToInt(formatdatetime('ddmmss',now));
 repeat
  vId  :=vId1;
 until (dmDB.VerificaIdServicoRevisaoExiste(intToStr(vId)));
 Result := vId;
end;

procedure TfrmServicosRevisao.Button1Click(Sender: TObject);
begin
 vEdit :=0;
 edtResponsavel.Text   :='';
 edtDescricao.Text     :='';
 edtValor.Text         :='0';
 tbPrincipal.ActiveTab :=tbiCad;
end;

procedure TfrmServicosRevisao.FormShow(Sender: TObject);
begin
 laybtnLista.Visible     := false;
 tbPrincipal.TabPosition := TTabPosition.None;
 tbPrincipal.ActiveTab   := tbiLista;
 geraLista;
end;

procedure TfrmServicosRevisao.geraLista;
var
 item   : TListViewItem;
 txt    : TListItemText;
 txtH   : TListItemPurpose;
 img    : TListItemImage;
begin
 dmRevisao.AbrirServicosRevisao(dmDB.vIdRevSelect);
 ListaRev.Items.Clear;
 while not DMRevisao.TRevisaoServicos.eof do
 begin
   item := ListaRev.Items.Add;
   with frmServicosRevisao do
   begin
     with item  do
     begin
       txt           := TListItemText(Objects.FindDrawable('Text1'));
       txt.Text      := DMRevisao.TRevisaoServicosdescricao.AsString;
       txt.TagString := DMRevisao.TRevisaoServicosid.AsString;

       txt           := TListItemText(Objects.FindDrawable('Text6'));
       txt.Text      := 'Data: ';

       txt           := TListItemText(Objects.FindDrawable('Text5'));
       txt.Text      := DMRevisao.TRevisaoServicosdatarealizado.AsString;

       txt           := TListItemText(Objects.FindDrawable('Text8'));
       txt.Text      := 'Responsável: ';
       txt           := TListItemText(Objects.FindDrawable('Text9'));
       txt.Text      := DMRevisao.TRevisaoServicosresponsavel.AsString;

       txt      := TListItemText(Objects.FindDrawable('Text7'));
       txt.Text := 'Valor: ';
       txt      := TListItemText(Objects.FindDrawable('Text10'));
       txt.Text := 'R$ '+DMRevisao.TRevisaoServicosvalortotal.AsString;
     end;
     DMRevisao.TRevisaoServicos.Next;
   end;
 end;
end;

procedure TfrmServicosRevisao.ListaRevGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
 laybtnLista.Visible := true;
end;

procedure TfrmServicosRevisao.ListaRevItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
 vIdServico := TAppearanceListViewItem(ListaRev.Selected).Objects.FindObjectT<TListItemText>
  ('Text1').TagString;
 vDescricao:= TAppearanceListViewItem(ListaRev.Selected).Objects.FindObjectT<TListItemText>
  ('Text1').Text;
 vData      := TAppearanceListViewItem(ListaRev.Selected).Objects.FindObjectT<TListItemText>
  ('Text5').Text;
 vResponsavel:= TAppearanceListViewItem(ListaRev.Selected).Objects.FindObjectT<TListItemText>
  ('Text9').Text;
 vValor:= TAppearanceListViewItem(ListaRev.Selected).Objects.FindObjectT<TListItemText>
  ('Text10').Text;
end;

end.

