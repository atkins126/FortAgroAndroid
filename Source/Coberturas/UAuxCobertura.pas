unit UAuxCobertura;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  FMX.Grid.Style, Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.Grid,
  Data.Bind.DBScope, FMX.Ani, FMX.StdCtrls, FMX.ScrollBox, FMX.Grid, FMX.Edit,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts;

type
  TForm1 = class(TForm)
    layListaP: TLayout;
    imgLogoCad: TImage;
    Rectangle1: TRectangle;
    layLista: TLayout;
    layFiltros: TLayout;
    RecGro: TRectangle;
    Label1: TLabel;
    edtNomeFiltro: TEdit;
    StringGrid1: TStringGrid;
    ToolBar2: TToolBar;
    layTotalRegistroGrid: TLayout;
    lblTotalRegistro: TLabel;
    layFooterGrid1: TLayout;
    Layout1: TLayout;
    lblAreaTotalGrid: TLabel;
    btnSelecionar: TButton;
    Image1: TImage;
    ToolBar1: TToolBar;
    recToolBar: TRectangle;
    lblCad: TLabel;
    btnFechar: TImage;
    AnimacaoMnu: TFloatAnimation;
    BindSourceDB1: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    BindingsList1: TBindingsList;
    procedure FormShow(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure edtNomeFiltroChangeTracking(Sender: TObject);
  private
    procedure Filtro;
    procedure SomarColunas;
    procedure myShowMenssagem(msg: string);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses UPrincipal, UDataContext, Umsg;

procedure TForm1.btnFecharClick(Sender: TObject);
begin
 Close;
end;

procedure TForm1.btnSelecionarClick(Sender: TObject);
begin
 if dmDB.TTalhoesId.AsString.Length=0 then
 begin
   myShowMenssagem('Selecione uma atividade!');
   Exit;
 end
 else
  Close;
end;

procedure TForm1.edtNomeFiltroChangeTracking(Sender: TObject);
begin
  if edtNomeFiltro.Text.Length>0 then
 begin
   dmDb.TAuxCobertura.Filtered := false;
   dmDb.TAuxCobertura.Filter   := 'NOME LIKE '+QuotedStr('%'+edtNomeFiltro.Text+'%');
   dmDb.TAuxCobertura.Filtered := true;
 end
 else
 begin
   dmDb.TAuxCobertura.Filtered := false;
   dmDb.TAuxCobertura.Close;
   dmDb.TAuxCobertura.Open;
 end;
 lblTotalRegistro.Text := intToStr(StringGrid1.RowCount);
end;

procedure TForm1.Filtro;
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
 if vFiltrado=1 then
 begin
   dmDB.TAuxCobertura.Filtered := false;
   dmDB.TAuxCobertura.Filter   := vFiltro;
   dmDB.TAuxCobertura.Filtered := true;
 end
 else
 begin
   dmDB.TAuxCobertura.Filtered := false;
   dmDB.TAuxCobertura.Close;
   dmDB.TAuxCobertura.Open;
 end;
 SomarColunas;

end;

procedure TForm1.FormShow(Sender: TObject);
begin
 Form1.StyleBook := frmPrincipal.StyleBook1;
 BindSourceDB1.DataSet   := nil;
 dmDB.TAuxCobertura.Close;
 dmDB.TAuxCobertura.Open();
 dmDB.TAuxCobertura.Filtered := false;
 dmDB.TAuxCobertura.Filter   := 'STATUS=1';
 dmDB.TAuxCobertura.Filtered := true;
 BindSourceDB1.DataSet  := dmDB.TAuxCobertura;
end;

procedure TForm1.myShowMenssagem(msg: string);
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

procedure TForm1.SomarColunas;
begin
  lblTotalRegistro.Text       := intToStr(StringGrid1.RowCount)
end;

end.
