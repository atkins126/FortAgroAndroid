unit UContratos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  FMX.Grid.Style, FMX.Ani, FMX.StdCtrls, FMX.ScrollBox, FMX.Grid, FMX.Edit,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope,FMX.VirtualKeyboard,FMX.Platform,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FMX.Gestures;


type
  TfrmContratos = class(TForm)
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
    ToolBar1: TToolBar;
    recToolBar: TRectangle;
    lblCad: TLabel;
    btnFechar: TImage;
    AnimacaoMnu: TFloatAnimation;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    Lista: TListView;
    GestureManager1: TGestureManager;
    laybtnLista: TLayout;
    btnHabilitaSync: TRectangle;
    Image37: TImage;
    Label82: TLabel;
    Rectangle63: TRectangle;
    Label84: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure btnSelecionarClick(Sender: TObject);
    procedure edtNomeFiltroChangeTracking(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure ListaItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure ListaGesture(Sender: TObject; const EventInfo: TGestureEventInfo;
      var Handled: Boolean);
    procedure Rectangle63Click(Sender: TObject);
  private
    { Private declarations }
  public
    vComprador,
    vIdContrato,vNumeroContrato:string;
    procedure GeraLista;
    procedure myShowMenssagem(msg: string);
  end;

var
  frmContratos: TfrmContratos;

implementation

{$R *.fmx}

uses UPrincipal, UDataContext, Umsg;

procedure TfrmContratos.myShowMenssagem(msg: string);
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

procedure TfrmContratos.Rectangle63Click(Sender: TObject);
begin
 try
  dmDB.HabilitaSyncContrato(vIdContrato);
  ShowMessage('Contrato habilitada com sucesso!');
  laybtnLista.Visible := false;
 except
 end
end;

procedure TfrmContratos.btnFecharClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmContratos.btnSelecionarClick(Sender: TObject);
begin
 if vIdContrato.Length=0 then
 begin
   ShowMessage('Selecione um Contrato!');
   Exit;
 end
 else
 begin
  dmDB.vIdContrato         := vIdContrato;
  dmDB.vComprador          := vComprador;
  dmDB.vNumeroContrato     := vNumeroContrato;
  Close;
 end
end;

procedure TfrmContratos.edtNomeFiltroChangeTracking(Sender: TObject);
begin
 if edtNomeFiltro.Text.Length>0 then
 begin
   dmDb.ContratosGrid.Filtered := false;
   if frmPrincipal.vNovoEmbarque=1 then
    dmDb.ContratosGrid.Filter   := 'numerocontrato ='+edtNomeFiltro.Text+' and status=3'
   else
    dmDb.ContratosGrid.Filter   := 'numerocontrato ='+edtNomeFiltro.Text;
   dmDb.ContratosGrid.Filtered := true;
 end
 else
 begin
   dmDb.ContratosGrid.Filtered := false;
   dmDb.ContratosGrid.Close;
   dmDb.ContratosGrid.Open;
 end;
 GeraLista;
end;

procedure TfrmContratos.FormKeyUp(Sender: TObject; var Key: Word;
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

procedure TfrmContratos.FormShow(Sender: TObject);
begin
  laybtnLista.Visible := false;
  dmDb.ContratosGrid.close;
  dmDb.ContratosGrid.Open;
  if frmPrincipal.vNovoEmbarque=1 then
  begin
   dmDb.ContratosGrid.Filtered := false;
   dmDb.ContratosGrid.Filter   := 'status=3';
   dmDb.ContratosGrid.Filtered := True;
  end
  else
  begin
   dmDb.ContratosGrid.Filtered := false;
   dmDb.ContratosGrid.Filter   := 'status>-1';
   dmDb.ContratosGrid.Filtered := True;
  end;
  GeraLista;
end;

procedure TfrmContratos.GeraLista;
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
    dmDb.ContratosGrid.First;
    Lista.Items.Clear;
    while not dmDb.ContratosGrid.eof do
     begin
         item := Lista.Items.Add;
         with frmContratos do
         begin
           with item  do
           begin
             txt           := TListItemText(Objects.FindDrawable('Text8'));
             txt.Text      := 'N°: ';
             txt.TagString := dmDb.ContratosGridid.AsString;

             txt           := TListItemText(Objects.FindDrawable('Text3'));
             txt.text      := dmDb.ContratosGridnumerocontrato.AsString;

             txt           := TListItemText(Objects.FindDrawable('Text7'));
             txt.Text      := dmDb.ContratosGridnumerocontrato.AsString;

             txt           := TListItemText(Objects.FindDrawable('Text6'));
             txt.Text      := 'Comprador: ';

             txt           := TListItemText(Objects.FindDrawable('Text5'));
             txt.Text      := dmDb.ContratosGridComprador.AsString;


             txt           := TListItemText(Objects.FindDrawable('Text4'));
             txt.Text      := 'Total Compra';
             txt           := TListItemText(Objects.FindDrawable('Text7'));
             txt.Text      := dmDb.ContratosGridtotalcompravolume.AsString;

             txt           := TListItemText(Objects.FindDrawable('Text10'));
             txt.Text      := 'Total Embarcado';
             txt           := TListItemText(Objects.FindDrawable('Text9'));
             txt.Text      := dmDb.ContratosGridtotalembarquevolume.AsString;

             txt           := TListItemText(Objects.FindDrawable('Text14'));
             txt.Text      := 'Saldo';
             txt           := TListItemText(Objects.FindDrawable('Text11'));
             txt.Text      := FormatFloat('####,##0.00',(dmDb.ContratosGridtotalcompravolume.AsFloat-dmDb.ContratosGridtotalembarquevolume.AsFloat));

             img := TListItemImage(Objects.FindDrawable('Image14'));
             img.Bitmap     := frmPrincipal.imgContrato.Bitmap;

           end;
           dmDb.ContratosGrid.Next;
         end;
     end;
  end);
 end).Start;
end;

procedure TfrmContratos.ListaGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
  laybtnLista.Visible := true;
end;

procedure TfrmContratos.ListaItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
  vIdContrato:=
   TAppearanceListViewItem(Lista.Selected).Objects.FindObjectT<TListItemText>
   ('Text8').TagString;

  vNumeroContrato:=
   TAppearanceListViewItem(Lista.Selected).Objects.FindObjectT<TListItemText>
   ('Text7').Text;

  vComprador:=
   TAppearanceListViewItem(Lista.Selected).Objects.FindObjectT<TListItemText>
   ('Text5').Text;
end;

end.
