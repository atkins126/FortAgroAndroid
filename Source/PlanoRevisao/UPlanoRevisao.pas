unit UPlanoRevisao;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.Ani, FMX.ListView, FMX.StdCtrls, FMX.Edit, FMX.Objects,
  FMX.Controls.Presentation, FMX.Layouts;

type
  TfrmPlanoRevisao = class(TForm)
    layListaP: TLayout;
    imgLogoCad: TImage;
    ToolBar1: TToolBar;
    recToolBar: TRectangle;
    lblCad: TLabel;
    btnFechar: TImage;
    layLista: TLayout;
    layFiltros: TLayout;
    RecGro: TRectangle;
    edtNomeFiltro: TEdit;
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
    ListaMaquinas: TListView;
    AnimacaoMnu: TFloatAnimation;
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure ListaMaquinasItemClickEx(const Sender: TObject;
      ItemIndex: Integer; const LocalClickPos: TPointF;
      const ItemObject: TListItemDrawable);
  private
    procedure Filtro;
    procedure myShowMenssagem(msg: string);
    procedure GeraListaPlanoRevi;
  public
    vIdPlano,vNomePlano,vFiltro:string;
  end;

var
  frmPlanoRevisao: TfrmPlanoRevisao;

implementation

{$R *.fmx}

uses UPrincipal, UDMRevisao;

{ TfrmPlanoRevisao }

procedure TfrmPlanoRevisao.btnFecharClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmPlanoRevisao.btnSelecionarClick(Sender: TObject);
begin
 if vIdPlano.Length=0 then
 begin
   myShowMenssagem('Selecione um Plano!');
   Exit;
 end
 else
 begin
   DMRevisao.vIdPlanoSelect    :=vIdPlano;
   DMRevisao.vNomePlanoSelect  :=vNomePlano;
  Close;
 end;
end;

procedure TfrmPlanoRevisao.Filtro;
begin
 DMRevisao.TRevisao.Filtered := false;
 vFiltro :='';
 if edtNomeFiltro.Text.Length>0 then
 begin
   vFiltro := 'NOME LIKE '+QuotedStr('%'+edtNomeFiltro.Text+'%');
 end;
 begin
   if vFiltro.Length>0 then
   begin
    DMRevisao.TRevisao.Filtered := false;
    DMRevisao.TRevisao.Close;
    DMRevisao.TRevisao.Open;
    DMRevisao.TRevisao.Filter   := vFiltro;
    DMRevisao.TRevisao.Filtered := true;
   end
   else
   begin
    DMRevisao.TRevisao.Filtered := false;
    DMRevisao.TRevisao.Close;
    DMRevisao.TRevisao.Open;
   end;
 end;
 GeraListaPlanoRevi;
end;

procedure TfrmPlanoRevisao.FormShow(Sender: TObject);
begin
 frmPlanoRevisao.StyleBook := frmPrincipal.StyleBook1;
 if vFiltro.Length>0 then
 begin
  dmRevisao.AbrePlanoRevisaoMaquina(vFiltro);
 end
 else
 begin
  DMRevisao.TRevisao.Close;
  DMRevisao.TRevisao.Open();
 end;
 GeraListaPlanoRevi;
end;

procedure TfrmPlanoRevisao.GeraListaPlanoRevi;
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
    DMRevisao.TRevisao.First;
    ListaMaquinas.Items.Clear;
    while not DMRevisao.TRevisao.eof do
     begin
       item := ListaMaquinas.Items.Add;
         with frmPlanoRevisao do
         begin
           with item  do
           begin
             txt           := TListItemText(Objects.FindDrawable('Text3'));
             txt.Text      := DMRevisao.TRevisaonome.AsString;
             txt.TagString := DMRevisao.TRevisaoid.AsString;

             txt      := TListItemText(Objects.FindDrawable('Text10'));
             txt.Text := 'Intervalo Horas:';

             txt      := TListItemText(Objects.FindDrawable('Text6'));
             txt.Text := DMRevisao.TRevisaointervalohoras.AsString;

             img := TListItemImage(Objects.FindDrawable('Image14'));
             img.Bitmap     := frmPrincipal.imgMecanico.Bitmap;
           end;
           DMRevisao.TRevisao.Next;
         end;
     end;
  end);
 end).Start;
end;

procedure TfrmPlanoRevisao.ListaMaquinasItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
  vIdPlano :=
   TAppearanceListViewItem(ListaMaquinas.Selected).Objects.FindObjectT<TListItemText>
   ('Text3').TagString;

  vNomePlano :=
   TAppearanceListViewItem(ListaMaquinas.Selected).Objects.FindObjectT<TListItemText>
   ('Text3').Text;

end;

procedure TfrmPlanoRevisao.myShowMenssagem(msg: string);
begin

end;

end.
