unit UPluviometro;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.Ani, FMX.ListView, FMX.StdCtrls, FMX.Edit, FMX.Objects,
  FMX.Controls.Presentation, FMX.Layouts;

type
  TfrmPluviometro = class(TForm)
    layListaP: TLayout;
    imgLogoCad: TImage;
    ToolBar1: TToolBar;
    recToolBar: TRectangle;
    lblCad: TLabel;
    btnFechar: TImage;
    layLista: TLayout;
    layFiltros: TLayout;
    RecGro: TRectangle;
    edtSetorF: TEdit;
    ClearEditButton3: TClearEditButton;
    lblPf: TLabel;
    SpeedButton1: TSpeedButton;
    layImg: TLayout;
    Rectangle6: TRectangle;
    Layout17: TLayout;
    Layout18: TLayout;
    ToolBar4: TToolBar;
    lblNomeProduto: TLabel;
    Image10: TImage;
    imgVisualizar: TImage;
    btnSelecionar: TButton;
    Image1: TImage;
    ListaPluviometros: TListView;
    AnimacaoMnu: TFloatAnimation;
    procedure FormShow(Sender: TObject);
    procedure edtSetorFChangeTracking(Sender: TObject);
    procedure ListaPluviometrosItemClickEx(const Sender: TObject;
      ItemIndex: Integer; const LocalClickPos: TPointF;
      const ItemObject: TListItemDrawable);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    procedure GeraListaPluviometro;
  public
    vIdPluviometro,vNomePluv:string;
  end;

var
  frmPluviometro: TfrmPluviometro;

implementation

{$R *.fmx}

uses UPrincipal, UDataContext;

procedure TfrmPluviometro.btnFecharClick(Sender: TObject);
begin
 if vIdPluviometro.Length=0 then
  ShowMessage('Selecione o Pluviometro')
 else
 begin
  dmDB.vNomePluvSel      := vNomePluv;
  dmDB.vIdPluviometroSel := vIdPluviometro;
  Close;
 end;
end;

procedure TfrmPluviometro.btnSelecionarClick(Sender: TObject);
begin
 if vIdPluviometro.Length=0 then
  ShowMessage('Selecione o Pluviometro')
 else
 begin
  dmDB.vNomePluvSel      := vNomePluv;
  dmDB.vIdPluviometroSel := vIdPluviometro;
  Close;
 end;
end;

procedure TfrmPluviometro.edtSetorFChangeTracking(Sender: TObject);
begin
  if edtSetorF.Text.Length>0 then
    dmDB.AbrePluviometro('and setor like '+QuotedStr('%'+edtSetorF.Text+'%'))
  else
    dmDB.AbrePluviometro('');
  GeraListaPluviometro;
end;

procedure TfrmPluviometro.FormShow(Sender: TObject);
begin
 frmPluviometro.StyleBook := frmPrincipal.StyleBook1;
 dmDB.AbrePluviometro('');
 GeraListaPluviometro;
end;

procedure TfrmPluviometro.GeraListaPluviometro;
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
    dmDb.TPluviometro.First;
    ListaPluviometros.Items.Clear;
    while not dmDb.TPluviometro.eof do
     begin
       item := ListaPluviometros.Items.Add;
         with frmPluviometro do
         begin
           with item  do
           begin
             txt      := TListItemText(Objects.FindDrawable('Text8'));
             txt.Text := dmDb.TPluviometroid.AsString;
             txt.TagString := dmDb.TPluviometronome.AsString;

             txt      := TListItemText(Objects.FindDrawable('Text3'));
             txt.Text := dmDb.TPluviometronome.AsString;

             txt      := TListItemText(Objects.FindDrawable('Text10'));
             txt.Text := 'Setor:';

             txt      := TListItemText(Objects.FindDrawable('Text6'));
             txt.Text := dmDb.TPluviometrosetor.AsString;

             txt      := TListItemText(Objects.FindDrawable('Text9'));
             txt.Text := 'Talhões:';

             txt      := TListItemText(Objects.FindDrawable('Text7'));
             txt.Text := dmDB.RetornaTalhoesPluviometro(dmDb.TPluviometroid.AsString);

             img := TListItemImage(Objects.FindDrawable('Image14'));
             img.Bitmap     := frmPrincipal.imgPluviometro.Bitmap;
           end;
           dmDb.TPluviometro.Next;
         end;
     end;
  end);
 end).Start;
end;

procedure TfrmPluviometro.ListaPluviometrosItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
  vIdPluviometro :=
   TAppearanceListViewItem(ListaPluviometros.Selected).Objects.FindObjectT<TListItemText>
   ('Text8').Text;
  vNomePluv       :=
   TAppearanceListViewItem(ListaPluviometros.Selected).Objects.FindObjectT<TListItemText>
   ('Text8').TagString;
end;

end.
