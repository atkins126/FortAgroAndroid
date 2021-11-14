unit UReceituario;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  FMX.Grid.Style, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.Bind.EngExt, Fmx.Bind.DBEngExt,
  Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Components, Data.Bind.Grid, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Data.Bind.DBScope, FMX.Ani, FMX.StdCtrls, FMX.ScrollBox,
  FMX.Grid, FMX.Edit, FMX.Controls.Presentation, FMX.Objects, FMX.Layouts,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView;

type
  TfrmReceituario = class(TForm)
    layListaP: TLayout;
    imgLogoCad: TImage;
    layLista: TLayout;
    StringGrid1: TStringGrid;
    ToolBar2: TToolBar;
    layTotalRegistroGrid: TLayout;
    lblTotalRegistro: TLabel;
    layFooterGrid1: TLayout;
    Label4: TLabel;
    Layout1: TLayout;
    ToolBar1: TToolBar;
    recToolBar: TRectangle;
    lblCad: TLabel;
    btnFechar: TImage;
    AnimacaoMnu: TFloatAnimation;
    BindSourceDB1: TBindSourceDB;
    BindSourceDB2: TBindSourceDB;
    qryAux: TFDQuery;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    btnSelecionar: TButton;
    Image1: TImage;
    ListaDetReceiturario: TListView;
    procedure StringGrid1CellDblClick(const Column: TColumn;
      const Row: Integer);
    procedure btnSelecionarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure StringGrid1CellClick(const Column: TColumn; const Row: Integer);
  private
    procedure myShowMenssagem(msg: string);
    procedure GerarListaDetReceituario(IdReceituario:string);
  public
    { Public declarations }
  end;

var
  frmReceituario: TfrmReceituario;

implementation

{$R *.fmx}

uses UDataContext, UPrincipal, Umsg;

procedure TfrmReceituario.FormShow(Sender: TObject);
begin
  BindSourceDB1.DataSet :=nil;
  dmDB.TReceituario.Close;
  dmDB.TReceituario.Open;
  dmDB.TReceituario.Filtered := false;
  dmDB.TReceituario.Filter   := 'STATUS=1';
  dmDB.TReceituario.Filtered := true;
  BindSourceDB1.DataSet      := dmDB.TReceituario;

  BindSourceDB2.DataSet      := nil;
  dmDB.TDetReceituario.Close;
  dmDB.TDetReceituario.Open;
  dmDB.TDetReceituario.Filtered := false;
  dmDB.TDetReceituario.Filter   := 'STATUS=1';
  dmDB.TDetReceituario.Filtered := true;
  BindSourceDB2.DataSet         := dmDB.TDetReceituario;
end;

procedure TfrmReceituario.GerarListaDetReceituario(IdReceituario: string);
var
 item   : TListViewItem;
 txt    : TListItemText;
 txtH   : TListItemPurpose;
 img    : TListItemImage;
 vStatus:string;
begin
 dmDB.AbreDetReceituario(IdReceituario);
 TThread.CreateAnonymousThread(procedure
 begin
  TThread.Synchronize(nil, procedure
  begin
    dmDb.TDetReceituario.First;
    ListaDetReceiturario.Items.Clear;
    while not dmDb.TDetReceituario.eof do
     begin
       item := ListaDetReceiturario.Items.Add;
         with frmReceituario do
         begin
           with item  do
           begin
//             txt      := TListItemText(Objects.FindDrawable('Text3'));
//             txt.Text := dmDb.TDetReceituariotalhao.AsString;

             txt      := TListItemText(Objects.FindDrawable('Text4'));
             txt.Text := 'Produto: ';

             txt      := TListItemText(Objects.FindDrawable('Text5'));
             txt.Text := dmDb.TDetReceituarioproduto.AsString;

             txt      := TListItemText(Objects.FindDrawable('Text6'));
             txt.Text := 'Area Prev.: ';

//             txt      := TListItemText(Objects.FindDrawable('Text7'));
//             txt.Text := dmDb.TDetReceituarioareaTalhao.AsString+' he';

             txt      := TListItemText(Objects.FindDrawable('Text8'));
             txt.Text := 'Indicação: ';

             txt      := TListItemText(Objects.FindDrawable('Text9'));
             txt.Text := dmDb.TDetReceituarioqtdporhe.AsString +' /he';

             txt      := TListItemText(Objects.FindDrawable('Text10'));
             txt.Text := 'Total Prev.: ';

//             txt      := TListItemText(Objects.FindDrawable('Text11'));
//             txt.Text := dmDb.TDetReceituariototalPrevisto.AsString;

             img := TListItemImage(Objects.FindDrawable('Image14'));
             img.Bitmap     := frmPrincipal.imgSeed.Bitmap;
           end;
           dmDB.TDetReceituario.Next;
         end;
     end;
  end);
 end).Start;
end;

procedure TfrmReceituario.myShowMenssagem(msg: string);
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

procedure TfrmReceituario.btnFecharClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmReceituario.btnSelecionarClick(Sender: TObject);
begin
 if dmDB.TReceituarioid.AsString.Length=0 then
 begin
   myShowMenssagem('Selecione um Receituario!');
   Exit;
 end
 else
  Close;
end;

procedure TfrmReceituario.StringGrid1CellClick(const Column: TColumn;
  const Row: Integer);
begin
 GerarListaDetReceituario(dmDB.TReceituarioid.AsString);
end;

procedure TfrmReceituario.StringGrid1CellDblClick(const Column: TColumn;
  const Row: Integer);
begin
 Close;
end;

end.
