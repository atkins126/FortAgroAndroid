unit UItensRevisao;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.StdCtrls, FMX.ListView, FMX.Ani, FMX.Edit, FMX.Controls.Presentation,
  FMX.Objects, FMX.Layouts, FMX.TabControl;

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
    mnu: TImage;
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
    Label2: TLabel;
    Image6: TImage;
    Layout2: TLayout;
    Rectangle1: TRectangle;
    Layout3: TLayout;
    Layout4: TLayout;
    edtGrupo: TEdit;
    Label5: TLabel;
    ToolBar3: TToolBar;
    btnVoltar: TImage;
    ListaMaquinas: TListView;
    btnSelecionar: TButton;
    Image1: TImage;
    Rectangle18: TRectangle;
    Label21: TLabel;
    Image16: TImage;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    procedure GeraLista;
  end;

var
  frmItensRevisao: TfrmItensRevisao;

implementation

{$R *.fmx}

uses UPrincipal, UDMRevisao;

{ TfrmItensRevisao }

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
 TThread.CreateAnonymousThread(procedure
 begin
  TThread.Synchronize(nil, procedure
  begin
    DMRevisao.TAuxRevisaoItem.First;
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

end.
