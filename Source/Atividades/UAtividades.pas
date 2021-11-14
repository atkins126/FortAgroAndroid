unit UAtividades;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  FMX.Grid.Style, FMX.Ani, FMX.StdCtrls, FMX.ScrollBox, FMX.Grid, FMX.Edit,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope,FMX.VirtualKeyboard,FMX.Platform;

type
  TfrmAtividades = class(TForm)
    layListaP: TLayout;
    imgLogoCad: TImage;
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
    ToolBar1: TToolBar;
    recToolBar: TRectangle;
    lblCad: TLabel;
    btnFechar: TImage;
    AnimacaoMnu: TFloatAnimation;
    Rectangle1: TRectangle;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    btnSelecionar: TButton;
    Image1: TImage;
    procedure edtNomeFiltroChangeTracking(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure StringGrid1CellDblClick(const Column: TColumn;
      const Row: Integer);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure btnFecharClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
  private
    procedure myShowMenssagem(msg:string);
  public
    { Public declarations }
  end;

var
  frmAtividades: TfrmAtividades;

implementation

{$R *.fmx}

uses UDataContext, Umsg, UPrincipal;

procedure TfrmAtividades.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAtividades.btnSelecionarClick(Sender: TObject);
begin
 if dmDB.TOperacoesid.AsString.Length=0 then
 begin
   myShowMenssagem('Selecione uma atividade!');
   Exit;
 end
 else
  Close;
end;

procedure TfrmAtividades.edtNomeFiltroChangeTracking(Sender: TObject);
begin
if edtNomeFiltro.Text.Length>0 then
 begin
   dmDB.TOperacoes.Filtered := false;
   dmDB.TOperacoes.Filter   := 'NOME LIKE '+QuotedStr('%'+edtNomeFiltro.Text+'%');
   dmDB.TOperacoes.Filtered := true;
 end
 else
 begin
   dmDB.TOperacoes.Filtered := false;
   dmDB.TOperacoes.Close;
   dmDB.TOperacoes.Open;
 end;
 lblTotalRegistro.Text := intToStr(StringGrid1.RowCount);
end;

procedure TfrmAtividades.FormKeyUp(Sender: TObject; var Key: Word;
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

procedure TfrmAtividades.FormShow(Sender: TObject);
begin
 BindSourceDB1.DataSet := nil;
 dmDB.TOperacoes.Close;
 dmDB.TOperacoes.Open();
 dmDB.TOperacoes.Filtered := false;
 dmDB.TOperacoes.Filter   := 'STATUS=1';
 dmDB.TOperacoes.Filtered := true;
 BindSourceDB1.DataSet    := dmDB.TOperacoes;
end;

procedure TfrmAtividades.myShowMenssagem(msg: string);
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

procedure TfrmAtividades.StringGrid1CellDblClick(const Column: TColumn;
  const Row: Integer);
begin
 Close;
end;

end.
