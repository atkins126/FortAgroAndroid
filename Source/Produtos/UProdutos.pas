unit UProdutos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  FMX.Grid.Style, FMX.Ani, FMX.StdCtrls, FMX.ScrollBox, FMX.Grid, FMX.Edit,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Components, Data.Bind.DBScope, Data.Bind.Grid,FMX.VirtualKeyboard,FMX.Platform,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView,db;

type
  TfrmProdutos = class(TForm)
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
    BindingsList1: TBindingsList;
    BindSourceDB1: TBindSourceDB;
    btnSelecionar: TButton;
    Image1: TImage;
    ListaProdutos: TListView;
    edtCodFabricante: TEdit;
    Label2: TLabel;
    Button1: TButton;
    procedure StringGrid1CellDblClick(const Column: TColumn;
      const Row: Integer);
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure btnSelecionarClick(Sender: TObject);
    procedure ListaProdutosItemClickEx(const Sender: TObject;
      ItemIndex: Integer; const LocalClickPos: TPointF;
      const ItemObject: TListItemDrawable);
    procedure btnFecharClick(Sender: TObject);
    procedure edtNomeFiltroKeyUp(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure edtCodFabricanteKeyUp(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
  private
    procedure myShowMenssagem(msg: string);
    procedure GeraLista;
    procedure Filtro;
  public
    vIdProduto,vNomeProduto,vTipo,vCodProduto:string;
    { Public declarations }
  end;

var
  frmProdutos: TfrmProdutos;

implementation

{$R *.fmx}

uses UDataContext, UPrincipal, Umsg;

procedure TfrmProdutos.btnFecharClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmProdutos.btnSelecionarClick(Sender: TObject);
begin
 if vIdProduto.Length=0 then
 begin
   myShowMenssagem('Selecione um Produto!');
   Exit;
 end
 else
 begin
  dmDB.vIdProduto                := vIdProduto;
  dmDB.vNomeProduto              := vNomeProduto;
  dmDB.vCodFabricanteProduto     := vCodProduto;
  Close;
 end
end;

procedure TfrmProdutos.Button1Click(Sender: TObject);
begin
 Filtro;
end;

procedure TfrmProdutos.edtCodFabricanteKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
 if key=13 then
  Filtro;
end;

procedure TfrmProdutos.edtNomeFiltroKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
 if key=13 then
  Filtro;
end;

procedure TfrmProdutos.myShowMenssagem(msg: string);
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

procedure TfrmProdutos.Filtro;
var
 vFiltro :string;
begin
 if vTipo='1' then
  vFiltro :=' AND DEFENCIVO=1';
 if vTipo='2' then
  vFiltro :=' AND DEFENCIVO=0';
 if vTipo='3' then
  vFiltro :=' AND DEFENCIVO=0';
 if edtNomeFiltro.Text.Length>0 then
  vFiltro := ' AND NOME LIKE '+QuotedStr('%'+edtNomeFiltro.Text+'%');
 if edtCodFabricante.Text.Length>0 then
  vFiltro := ' AND codigofabricante LIKE '+QuotedStr('%'+edtCodFabricante.Text+'%');
 dmDB.AbreProdutos(vFiltro);
 GeraLista;
end;

procedure TfrmProdutos.FormKeyUp(Sender: TObject; var Key: Word;
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

procedure TfrmProdutos.FormShow(Sender: TObject);
begin
 frmProdutos.StyleBook := frmPrincipal.StyleBook1;
end;

procedure TfrmProdutos.GeraLista;
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
    dmDb.TProdutos.First;
    ListaProdutos.Items.Clear;
    while not dmDb.TProdutos.eof do
     begin
       item := ListaProdutos.Items.Add;
         with frmProdutos do
         begin
           with item  do
           begin
             txt      := TListItemText(Objects.FindDrawable('Text14'));
             txt.Text := dmDb.TProdutosid.AsString;

             txt      := TListItemText(Objects.FindDrawable('Text4'));
             txt.Text := 'Produto: ';
             txt      := TListItemText(Objects.FindDrawable('Text5'));
             txt.Text := dmDb.TProdutosnome.AsString;

             txt      := TListItemText(Objects.FindDrawable('Text6'));
             txt.Text := 'Cod. Fabricante: ';
             txt      := TListItemText(Objects.FindDrawable('Text7'));
             txt.Text := dmDb.TProdutoscodigofabricante.AsString;

             img := TListItemImage(Objects.FindDrawable('Image14'));
             img.Bitmap := frmPrincipal.imgSeed.Bitmap;

           end;
           dmDB.TProdutos.Next;
         end;
     end;
  end);
 end).Start;
end;

procedure TfrmProdutos.ListaProdutosItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
 vIdProduto:=
   TAppearanceListViewItem(ListaProdutos.Selected).Objects.FindObjectT<TListItemText>
   ('Text14').Text;

  vNomeProduto:=
   TAppearanceListViewItem(ListaProdutos.Selected).Objects.FindObjectT<TListItemText>
   ('Text5').Text;

  vCodProduto:=
   TAppearanceListViewItem(ListaProdutos.Selected).Objects.FindObjectT<TListItemText>
   ('Text7').Text;
end;

procedure TfrmProdutos.StringGrid1CellDblClick(const Column: TColumn;
  const Row: Integer);
begin
 Close;
end;

end.
