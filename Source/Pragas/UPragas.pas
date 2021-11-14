unit UPragas;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.Ani, FMX.StdCtrls, FMX.ListView, FMX.Edit, FMX.Controls.Presentation,
  FMX.Objects, FMX.Layouts;

type
  TfrmPragas = class(TForm)
    layListaP: TLayout;
    imgLogoCad: TImage;
    Rectangle1: TRectangle;
    layLista: TLayout;
    layFiltros: TLayout;
    RecGro: TRectangle;
    Label1: TLabel;
    edtNomeFiltro: TEdit;
    btnSelecionar: TButton;
    Image1: TImage;
    Lista: TListView;
    ToolBar1: TToolBar;
    recToolBar: TRectangle;
    lblCad: TLabel;
    btnFechar: TImage;
    AnimacaoMnu: TFloatAnimation;
    procedure FormShow(Sender: TObject);
    procedure edtNomeFiltroChangeTracking(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure ListaItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure btnFecharClick(Sender: TObject);
  private
    vNomePraga,
    vIdPraga:string;
    procedure GeraLista;
  public
    { Public declarations }
  end;

var
  frmPragas: TfrmPragas;

implementation

{$R *.fmx}

uses UPrincipal, UDataContext;

procedure TfrmPragas.btnFecharClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmPragas.btnSelecionarClick(Sender: TObject);
begin
if vIdPraga.Length=0 then
 begin
   ShowMessage('Selecione uma Praga!');
   Exit;
 end
 else
 begin
  dmDB.vIdPraga       := vIdPraga;
  dmDB.vNomePraga     := vNomePraga;
  Close;
 end
end;

procedure TfrmPragas.edtNomeFiltroChangeTracking(Sender: TObject);
begin
 if edtNomeFiltro.Text.Length>0 then
 begin
   dmDb.TPragas.Filtered := false;
   dmDb.TPragas.Filter   := 'NOME LIKE '+QuotedStr('%'+edtNomeFiltro.Text+'%');
   dmDb.TPragas.Filtered := true;
 end
 else
 begin
   dmDb.TPragas.Filtered := false;
   dmDb.TPragas.Close;
   dmDb.TPragas.Open;
 end;
 GeraLista;
end;

procedure TfrmPragas.FormShow(Sender: TObject);
begin
 vIdPraga:='';
 frmPragas.StyleBook := frmPrincipal.StyleBook1;
 dmDB.TPragas.Close;
 dmDB.TPragas.Open();
 GeraLista;
end;

procedure TfrmPragas.GeraLista;
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
    dmDb.TPragas.First;
    Lista.Items.Clear;
    while not dmDb.TPragas.eof do
     begin
       item := Lista.Items.Add;
         with frmPragas do
         begin
           with item  do
           begin
             txt      := TListItemText(Objects.FindDrawable('Text14'));
             txt.Text := dmDb.TPragasid.AsString;

             txt      := TListItemText(Objects.FindDrawable('Text5'));
             txt.Text := dmDb.TPragasnome.AsString;

             img := TListItemImage(Objects.FindDrawable('Image14'));
             img.Bitmap     := frmPrincipal.imgPragas.Bitmap;

           end;
           dmDB.TPragas.Next;
         end;
     end;
  end);
 end).Start;
end;

procedure TfrmPragas.ListaItemClickEx(const Sender: TObject; ItemIndex: Integer;
  const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
begin
 vIdPraga:=
   TAppearanceListViewItem(Lista.Selected).Objects.FindObjectT<TListItemText>
   ('Text14').Text;

  vNomePraga:=
   TAppearanceListViewItem(Lista.Selected).Objects.FindObjectT<TListItemText>
   ('Text5').Text;
end;

end.
