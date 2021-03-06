unit Maquinas;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  FMX.Grid.Style, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.DBScope, FMX.Ani, FMX.StdCtrls, FMX.ScrollBox,
  FMX.Grid, FMX.ListBox, FMX.Edit, FMX.Controls.Presentation, FMX.Objects,
  FMX.Layouts,FMX.VirtualKeyboard,FMX.Platform, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView;

type
  TfrmMaquinas = class(TForm)
    layListaP: TLayout;
    imgLogoCad: TImage;
    ToolBar1: TToolBar;
    recToolBar: TRectangle;
    lblCad: TLabel;
    btnFechar: TImage;
    AnimacaoMnu: TFloatAnimation;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    layLista: TLayout;
    layFiltros: TLayout;
    RecGro: TRectangle;
    edtPrefixoF: TEdit;
    Label14: TLabel;
    SpeedButton1: TSpeedButton;
    layImg: TLayout;
    Rectangle6: TRectangle;
    Layout17: TLayout;
    Layout18: TLayout;
    ToolBar4: TToolBar;
    lblNomeProduto: TLabel;
    Image10: TImage;
    imgVisualizar: TImage;
    ToolBar2: TToolBar;
    layTotalRegistroGrid: TLayout;
    lblTotalRegistro: TLabel;
    layFooterGrid1: TLayout;
    btnSelecionar: TButton;
    Image1: TImage;
    ListaMaquinas: TListView;
    ClearEditButton1: TClearEditButton;
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure btnSelecionarClick(Sender: TObject);
    procedure StringGrid1CellDblClick(const Column: TColumn;
      const Row: Integer);
    procedure SpeedButton1Click(Sender: TObject);
    procedure edtPrefixoFChangeTracking(Sender: TObject);
    procedure edtNomeFiltroChangeTracking(Sender: TObject);
    procedure edtPlacaFChangeTracking(Sender: TObject);
    procedure ListaMaquinasItemClickEx(const Sender: TObject;
      ItemIndex: Integer; const LocalClickPos: TPointF;
      const ItemObject: TListItemDrawable);
    procedure ClearEditButton1Click(Sender: TObject);
    procedure ClearEditButton2Click(Sender: TObject);
    procedure ClearEditButton3Click(Sender: TObject);
  private
    procedure Filtro;
    procedure myShowMenssagem(msg: string);
    procedure GeraListaMaquinas;
  public
    vIdMaquinaSel,vMarcaModelo,vUltimoHorimetro,vFiltro:string;
  end;

var
  frmMaquinas: TfrmMaquinas;

implementation

{$R *.fmx}

uses UDataContext, UPrincipal, Umsg;

procedure TfrmMaquinas.btnFecharClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmMaquinas.btnSelecionarClick(Sender: TObject);
begin
 if vIdMaquinaSel.Length=0 then
 begin
   myShowMenssagem('Selecione uma Maquina!');
   Exit;
 end
 else
 begin
  dmDB.vIdMaquinaSel     := vIdMaquinaSel;
  dmDB.vMarcaModelo      := vMarcaModelo;
  dmDB.vUltimoHorimetro  := vUltimoHorimetro;

  Close;
 end;
end;

procedure TfrmMaquinas.ClearEditButton1Click(Sender: TObject);
begin
 Filtro;
end;

procedure TfrmMaquinas.ClearEditButton2Click(Sender: TObject);
begin
 Filtro;
end;

procedure TfrmMaquinas.ClearEditButton3Click(Sender: TObject);
begin
 Filtro;
end;

procedure TfrmMaquinas.edtNomeFiltroChangeTracking(Sender: TObject);
begin
 Filtro
end;

procedure TfrmMaquinas.edtPlacaFChangeTracking(Sender: TObject);
begin
 Filtro
end;

procedure TfrmMaquinas.edtPrefixoFChangeTracking(Sender: TObject);
begin
 Filtro;
end;

procedure TfrmMaquinas.myShowMenssagem(msg: string);
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

procedure TfrmMaquinas.SpeedButton1Click(Sender: TObject);
begin
  Filtro;
end;

procedure TfrmMaquinas.StringGrid1CellDblClick(const Column: TColumn;
  const Row: Integer);
begin
  Close;
end;

procedure TfrmMaquinas.Filtro;
begin
 dmdb.TUsuario.Filtered := false;
 if edtPrefixoF.Text.Length>0 then
  vFiltro := ' AND PREFIXO LIKE'+QuotedStr('%'+edtPrefixoF.Text+'%')
 else
  vFiltro := '';
 dmDB.AbreMaquinas(vFiltro);
 GeraListaMaquinas;
 lblTotalRegistro.Text := intToStr(ListaMaquinas.Items.Count);
end;

procedure TfrmMaquinas.FormKeyUp(Sender: TObject; var Key: Word;
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

procedure TfrmMaquinas.FormShow(Sender: TObject);
begin
 frmMaquinas.StyleBook := frmPrincipal.StyleBook1;
 if dmDB.vPulverizacao=1 then
 begin
  edtPrefixoF.Enabled := false;
  dmDB.AbreMaquinas(' AND PREFIXO LIKE '+QuotedStr('%'+'PV'+'%'));
  GeraListaMaquinas;
 end
 else
 begin
  edtPrefixoF.Enabled := true;
 end;
end;

procedure TfrmMaquinas.GeraListaMaquinas;
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
    dmDb.TMaquina.First;
    ListaMaquinas.Items.Clear;
    while not dmDb.TMaquina.eof do
     begin
       item := ListaMaquinas.Items.Add;
         with frmMaquinas do
         begin
           with item  do
           begin
             txt      := TListItemText(Objects.FindDrawable('Text8'));
             txt.Text := dmDb.TMaquinaid.AsString;

             txt      := TListItemText(Objects.FindDrawable('Text3'));
             txt.Text := dmDb.TMaquinaprefixo.AsString;

             txt      := TListItemText(Objects.FindDrawable('Text10'));
             txt.Text := 'Marca:';

             txt      := TListItemText(Objects.FindDrawable('Text6'));
             txt.Text := dmDb.TMaquinamarca.AsString;

             txt      := TListItemText(Objects.FindDrawable('Text9'));
             txt.Text := 'Modelo:';

             txt      := TListItemText(Objects.FindDrawable('Text7'));
             txt.Text := dmDb.TMaquinamodelo.AsString;

             txt      := TListItemText(Objects.FindDrawable('Text5'));
             txt.Text := 'Placa: '+dmDb.TMaquinaplaca.AsString;

             txt      := TListItemText(Objects.FindDrawable('Text4'));
             txt.Text := 'N? S?rie: '+dmDb.TMaquinanumeroserie.AsString;
             txt.TagString := dmDB.TMaquinahorimetro.AsString;

             img := TListItemImage(Objects.FindDrawable('Image14'));
             img.Bitmap     := frmPrincipal.imgMaquina.Bitmap;
           end;
           dmDB.TMaquina.Next;
         end;
     end;
  end);
 end).Start;
end;

procedure TfrmMaquinas.ListaMaquinasItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
 vIdMaquinaSel :=
   TAppearanceListViewItem(ListaMaquinas.Selected).Objects.FindObjectT<TListItemText>
   ('Text8').Text;
 vMarcaModelo :=
   TAppearanceListViewItem(ListaMaquinas.Selected).Objects.FindObjectT<TListItemText>
   ('Text6').Text+'-'+
   TAppearanceListViewItem(ListaMaquinas.Selected).Objects.FindObjectT<TListItemText>
   ('Text7').Text+'-'+
   TAppearanceListViewItem(ListaMaquinas.Selected).Objects.FindObjectT<TListItemText>
   ('Text3').Text;
 vUltimoHorimetro:=
 TAppearanceListViewItem(ListaMaquinas.Selected).Objects.FindObjectT<TListItemText>
   ('Text4').TagString;
end;

end.
