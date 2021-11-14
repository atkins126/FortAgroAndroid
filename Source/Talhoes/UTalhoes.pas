unit UTalhoes;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  FMX.Grid.Style, FMX.Ani, FMX.StdCtrls, FMX.ScrollBox, FMX.Grid, FMX.ListBox,
  FMX.Edit, FMX.Controls.Presentation, FMX.Objects, FMX.Layouts,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope,FMX.VirtualKeyboard,
  FMX.Platform, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView;

type
  TfrmTalhoes = class(TForm)
    layListaP: TLayout;
    imgLogoCad: TImage;
    layLista: TLayout;
    layFiltros: TLayout;
    RecGro: TRectangle;
    Label1: TLabel;
    edtNomeFiltro: TEdit;
    edtSetorF: TEdit;
    Label4: TLabel;
    ToolBar1: TToolBar;
    recToolBar: TRectangle;
    lblCad: TLabel;
    btnFechar: TImage;
    AnimacaoMnu: TFloatAnimation;
    Rectangle1: TRectangle;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    btnSelecionar: TButton;
    Image1: TImage;
    ListaTalhoes: TListView;
    procedure StringGrid1CellDblClick(const Column: TColumn;
      const Row: Integer);
    procedure FormShow(Sender: TObject);
    procedure edtNomeFiltroChangeTracking(Sender: TObject);
    procedure edtSetorFChangeTracking(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure ListaTalhoesItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
  private
    procedure Filtro;
    procedure SomarColunas;
    procedure myShowMenssagem(msg: string);
    procedure GeraLista;
  public
    vIdTalhao,vAreaTalhao,vNomeTalhao:string;
  end;

var
  frmTalhoes: TfrmTalhoes;

implementation

{$R *.fmx}

uses UDataContext, Umsg, UOperacoes, UPrincipal;

procedure TfrmTalhoes.FormKeyUp(Sender: TObject; var Key: Word;
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

procedure TfrmTalhoes.FormShow(Sender: TObject);
begin
 frmTalhoes.StyleBook := frmPrincipal.StyleBook1;
 BindSourceDB1.DataSet   := nil;
 dmDB.TTalhoes.Close;
 dmDB.TTalhoes.Open();
 dmDB.TTalhoes.Filtered := false;
 dmDB.TTalhoes.Filter   := 'STATUS=1';
 dmDB.TTalhoes.Filtered := true;
 BindSourceDB1.DataSet  := dmDB.TTalhoes;
 GeraLista;
end;

procedure TfrmTalhoes.GeraLista;
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
    dmDb.TTalhoes.First;
    ListaTalhoes.Items.Clear;
    while not dmDb.TTalhoes.eof do
     begin
       item := ListaTalhoes.Items.Add;
         with frmTalhoes do
         begin
           with item  do
           begin
             txt      := TListItemText(Objects.FindDrawable('Text14'));
             txt.Text := dmDb.TTalhoesid.AsString;

             txt      := TListItemText(Objects.FindDrawable('Text10'));
             txt.Text := dmDb.TTalhoesareahe.AsString;


             txt      := TListItemText(Objects.FindDrawable('Text5'));
             txt.Text := dmDb.TTalhoesnome.AsString;

             txt      := TListItemText(Objects.FindDrawable('Text4'));
             txt.Text := 'Setor:';

             txt      := TListItemText(Objects.FindDrawable('Text7'));
             txt.Text := dmDb.TTalhoessetor.AsString;

             txt      := TListItemText(Objects.FindDrawable('Text6'));
             txt.Text := 'Area(ha):';

             txt      := TListItemText(Objects.FindDrawable('Text8'));
             txt.Text := dmDb.TTalhoesareahe.AsString;


             img := TListItemImage(Objects.FindDrawable('Image14'));
             img.Bitmap := frmPrincipal.imgTalhao.Bitmap;

           end;
           dmDB.TTalhoes.Next;
         end;
     end;
  end);
 end).Start;
end;

procedure TfrmTalhoes.ListaTalhoesItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
  vIdTalhao:=
   TAppearanceListViewItem(ListaTalhoes.Selected).Objects.FindObjectT<TListItemText>
   ('Text14').Text;

  vNomeTalhao:=
   TAppearanceListViewItem(ListaTalhoes.Selected).Objects.FindObjectT<TListItemText>
   ('Text5').Text;

  vAreaTalhao:=
   TAppearanceListViewItem(ListaTalhoes.Selected).Objects.FindObjectT<TListItemText>
   ('Text10').Text;
end;

procedure TfrmTalhoes.btnFecharClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmTalhoes.btnSelecionarClick(Sender: TObject);
begin
 if vIdTalhao.Length=0 then
 begin
   myShowMenssagem('Selecione um Talhao!');
   Exit;
 end
 else
 begin
  dmDB.vIdTalhao    := vIdTalhao;
  dmDB.vNomeTalhao  := vNomeTalhao;
  dmDB.vAreaTalhao  := vAreaTalhao;
  Close;
 end;
end;

procedure TfrmTalhoes.myShowMenssagem(msg: string);
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

procedure TfrmTalhoes.edtNomeFiltroChangeTracking(Sender: TObject);
begin
 Filtro;
 GeraLista;
end;

procedure TfrmTalhoes.edtSetorFChangeTracking(Sender: TObject);
begin
 Filtro;
 GeraLista;
end;

procedure TfrmTalhoes.Filtro;
var
 vFiltro:string;
 vFiltrado:integer;
begin
 vFiltrado :=0;
 vFiltro   :='';
 if edtNomeFiltro.Text.Length>0 then
 begin
   vFiltro :='NOME LIKE '+QuotedStr('%'+edtNomeFiltro.Text+'%');
   vFiltrado :=1;
 end;

 if edtSetorF.Text.Length>0 then
 begin
   if vFiltrado=1 then
    vFiltro :=vFiltro+' AND SETOR LIKE '+QuotedStr('%'+edtSetorF.Text+'%')
   else
    vFiltro :='SETOR LIKE '+QuotedStr('%'+edtSetorF.Text+'%');
    vFiltrado :=1;
 end;

 if vFiltrado=1 then
 begin
   dmDB.TTalhoes.Filtered := false;
   dmDB.TTalhoes.Filter   := vFiltro;
   dmDB.TTalhoes.Filtered := true;
 end
 else
 begin
   dmDB.TTalhoes.Filtered := false;
   dmDB.TTalhoes.Close;
   dmDB.TTalhoes.Open;
 end;
 SomarColunas;
end;

procedure TfrmTalhoes.SomarColunas;
begin
end;

procedure TfrmTalhoes.StringGrid1CellDblClick(const Column: TColumn;
  const Row: Integer);
begin
 Close;
end;

end.
