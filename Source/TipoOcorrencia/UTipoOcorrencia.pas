unit UTipoOcorrencia;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  FMX.Grid.Style, FMX.Ani, FMX.StdCtrls, FMX.ScrollBox, FMX.Grid, FMX.Edit,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope,FMX.VirtualKeyboard,FMX.Platform,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView;

type
  TfrmTipoOcorrencia = class(TForm)
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
    AnimacaoMnu: TFloatAnimation;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    btnFechar: TImage;
    btnSelecionar: TButton;
    Image1: TImage;
    Lista: TListView;
    procedure edtNomeFiltroChangeTracking(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure btnSelecionarClick(Sender: TObject);
    procedure ListaItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure btnFecharClick(Sender: TObject);
  private
    procedure myShowMenssagem(msg: string);
    procedure GeraLista;
  public
    vIdTipoOcorrencia,vNomeTipoOocrrencia:string;
  end;

var
  frmTipoOcorrencia: TfrmTipoOcorrencia;

implementation

{$R *.fmx}

uses UDataContext, UPrincipal, Umsg;

procedure TfrmTipoOcorrencia.btnFecharClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmTipoOcorrencia.btnSelecionarClick(Sender: TObject);
begin
 if dmDB.TAuxOcorrenciaid.AsString.Length=0 then
 begin
   myShowMenssagem('Selecione uma atividade!');
   Exit;
 end
 else
 begin
  dmDB.vIdTipoOcorrencia   := vIdTipoOcorrencia;
  dmDB.vNomeTipoOocrrencia := vNomeTipoOocrrencia;
  Close;
 end;
end;

procedure TfrmTipoOcorrencia.myShowMenssagem(msg: string);
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

procedure TfrmTipoOcorrencia.edtNomeFiltroChangeTracking(Sender: TObject);
begin
 if edtNomeFiltro.Text.Length>0 then
 begin
   dmdb.TAuxOcorrencia.Filtered := false;
   dmdb.TAuxOcorrencia.Filter   := 'NOME LIKE '+QuotedStr('%'+edtNomeFiltro.Text+'%');
   dmdb.TAuxOcorrencia.Filtered := true;
 end
 else
 begin
   dmdb.TAuxOcorrencia.Filtered := false;
   dmdb.TAuxOcorrencia.Close;
   dmdb.TAuxOcorrencia.Open;
 end;
 GeraLista;
end;

procedure TfrmTipoOcorrencia.FormKeyUp(Sender: TObject; var Key: Word;
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

procedure TfrmTipoOcorrencia.FormShow(Sender: TObject);
begin
 frmTipoOcorrencia.StyleBook := frmPrincipal.StyleBook1;
 BindSourceDB1.DataSet        := nil;
 dmDB.TAuxOcorrencia.Close;
 dmDB.TAuxOcorrencia.Open();
 dmDB.TAuxOcorrencia.Filtered := false;
 dmDB.TAuxOcorrencia.Filter   := 'STATUS=1';
 dmDB.TAuxOcorrencia.Filtered := true;
 BindSourceDB1.DataSet        := dmDB.TAuxOcorrencia;
 GeraLista;
end;

procedure TfrmTipoOcorrencia.GeraLista;
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
    dmDb.TAuxOcorrencia.First;
    Lista.Items.Clear;
    while not dmDb.TAuxOcorrencia.eof do
     begin
       item := Lista.Items.Add;
         with frmTipoOcorrencia do
         begin
           with item  do
           begin
             txt      := TListItemText(Objects.FindDrawable('Text14'));
             txt.Text := dmDb.TAuxOcorrenciaid.AsString;

             txt      := TListItemText(Objects.FindDrawable('Text5'));
             txt.Text := dmDb.TAuxOcorrencianome.AsString;

             img := TListItemImage(Objects.FindDrawable('Image14'));
             img.Bitmap := frmPrincipal.imgOcorrencia1.Bitmap;

           end;
           dmDB.TAuxOcorrencia.Next;
         end;
     end;
  end);
 end).Start;
end;

procedure TfrmTipoOcorrencia.ListaItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
 vIdTipoOcorrencia :=
   TAppearanceListViewItem(Lista.Selected).Objects.FindObjectT<TListItemText>
   ('Text14').Text;

  vNomeTipoOocrrencia:=
   TAppearanceListViewItem(Lista.Selected).Objects.FindObjectT<TListItemText>
   ('Text5').Text;
end;

end.
