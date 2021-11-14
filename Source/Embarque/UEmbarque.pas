unit UEmbarque;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.StdCtrls, FMX.Edit, FMX.DateTimeCtrls,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, FMX.TabControl;

type
  TfrmEmbarque = class(TForm)
    tbPrincipal: TTabControl;
    tbiLista: TTabItem;
    recPrincipal: TRectangle;
    Layout5: TLayout;
    btnNovo: TRectangle;
    Image9: TImage;
    Label7: TLabel;
    btnVoltar1: TRectangle;
    Image31: TImage;
    Label4: TLabel;
    GroupBox2: TGroupBox;
    Layout2: TLayout;
    Layout3: TLayout;
    Layout4: TLayout;
    edtDataF: TDateEdit;
    Label1: TLabel;
    Layout9: TLayout;
    Label9: TLabel;
    edtContratoF: TEdit;
    ToolBar2: TToolBar;
    Layout10: TLayout;
    Lista: TListView;
    recTop: TRectangle;
    Label14: TLabel;
    tbiCad: TTabItem;
    Rectangle3: TRectangle;
    ToolBar1: TToolBar;
    recTopListapontos: TRectangle;
    Label20: TLabel;
    btnBuscar: TSpeedButton;
    Image12: TImage;
    edtPlacaF: TEdit;
    Ü: TLabel;
    Layout67: TLayout;
    btnVoltar2: TButton;
    Image24: TImage;
    Label61: TLabel;
    btnSalvarGrupo: TButton;
    Image25: TImage;
    Label62: TLabel;
    Layout1: TLayout;
    Layout6: TLayout;
    Layout11: TLayout;
    Label15: TLabel;
    Label16: TLabel;
    edtDatEmbarque: TDateEdit;
    edtHoraEmbarque: TTimeEdit;
    Layout7: TLayout;
    Layout8: TLayout;
    Label5: TLabel;
    Label6: TLabel;
    edtPlaca: TEdit;
    edtNumNF: TEdit;
    GroupBox1: TGroupBox;
    Layout12: TLayout;
    Layout13: TLayout;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    edtTara: TEdit;
    edtBruto: TEdit;
    edtPesoLiquido: TEdit;
    GroupBox3: TGroupBox;
    Layout14: TLayout;
    Layout15: TLayout;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    edtImp: TEdit;
    edtQueb: TEdit;
    edtVerd: TEdit;
    Layout16: TLayout;
    Layout17: TLayout;
    Label3: TLabel;
    Label8: TLabel;
    edtAvar: TEdit;
    edtUmid: TEdit;
    Layout18: TLayout;
    Layout19: TLayout;
    Label10: TLabel;
    edtContrato: TEdit;
    EditButton2: TEditButton;
    btnExcluiItem: TRectangle;
    Image1: TImage;
    lblExcluir: TLabel;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Rectangle4: TRectangle;
    Rectangle5: TRectangle;
    Rectangle6: TRectangle;
    Rectangle7: TRectangle;
    Layout20: TLayout;
    Layout22: TLayout;
    Label12: TLabel;
    edtNumNFF: TEdit;
    procedure FormShow(Sender: TObject);
    procedure btnSalvarGrupoClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure EditButton2Click(Sender: TObject);
    procedure btnVoltar2Click(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnVoltar1Click(Sender: TObject);
    procedure edtBrutoChangeTracking(Sender: TObject);
    procedure edtTaraChangeTracking(Sender: TObject);
    procedure ListaItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure ListaGesture(Sender: TObject; const EventInfo: TGestureEventInfo;
      var Handled: Boolean);
    procedure btnExcluiItemClick(Sender: TObject);
  private
    { Private declarations }
  public
    vSync,vIdContrato,vIdEmbarque:string;
    procedure GeraLista;
  end;

var
  frmEmbarque: TfrmEmbarque;

implementation

{$R *.fmx}

uses UPrincipal, UDataContext, UContratos;

procedure TfrmEmbarque.btnBuscarClick(Sender: TObject);
var
 vFiltro:string;
begin
 vFiltro := ' and a.dataembarque='+FormatDateTime('yyy-mm-dd',edtDataF.Date).QuotedString;
 if edtContratoF.Text.Length>0 then
  vFiltro := vFiltro+' and b.numerocontrato='+edtContratoF.Text.QuotedString;
 if edtPlacaF.Text.Length>0 then
  vFiltro := vFiltro+' and a.Placa='+edtPlacaF.Text.QuotedString;
 if edtNumNFF.Text.Length>0 then
  vFiltro := vFiltro+' and a.numeronf='+edtNumNFF.Text;

  dmDB.AbreEmbarque(vFiltro);
  GeraLista;
end;

procedure TfrmEmbarque.btnExcluiItemClick(Sender: TObject);
begin
 btnExcluiItem.Visible := false;
   MessageDlg('Deseja Realmente Deletar esse Registro?', System.UITypes.TMsgDlgType.mtInformation,
   [System.UITypes.TMsgDlgBtn.mbYes,
   System.UITypes.TMsgDlgBtn.mbNo
   ], 0,
   procedure(const AResult: System.UITypes.TModalResult)
   begin
    case AResult of
     mrYES:
     begin
       dmDB.DeletaEmbarque(vIdEmbarque);
       btnBuscarClick(Sender);
     end;
     mrNo:
    end;
   end);
end;

procedure TfrmEmbarque.btnNovoClick(Sender: TObject);
begin
  edtPlaca.Text           :='';
  edtContrato.Text        :='';
  edtTara.Text            :='0';
  edtBruto.Text           :='0';
  edtPesoLiquido.Text     :='0';
  edtImp.Text             :='0';
  edtQueb.Text            :='0';
  edtVerd.Text            :='0';
  edtAvar.Text            :='0';
  edtUmid.Text            :='0';
  tbPrincipal.ActiveTab   :=tbiCad;
end;

procedure TfrmEmbarque.btnSalvarGrupoClick(Sender: TObject);
begin
  if edtContrato.Text.Length=0 then
  begin
    ShowMessage('Informe o Contrato!');
    edtContrato.SetFocus;
    Exit;
  end;
  if edtPlaca.Text.Length=0 then
  begin
    ShowMessage('Informe a Placa!');
    edtPlaca.SetFocus;
    Exit;
  end;
  if edtTara.Text='0' then
  begin
    ShowMessage('Informe a Tara!');
    edtTara.SetFocus;
    Exit;
  end;
  if edtBruto.Text='0' then
  begin
    ShowMessage('Informe o Peso Bruto!');
    edtBruto.SetFocus;
    Exit;
  end;
  dmDB.Embarques.Close;
  dmDB.Embarques.Open;
  dmDB.Embarques.Insert;
  dmDB.Embarquesidusuario.ASstring        := dmDB.vIdUser;
  dmDB.Embarquesidcontrato.ASstring       := vidContrato;
  dmDB.Embarquesnumeronf.ASstring         := edtNumNF.Text;
  dmDB.Embarquesplaca.ASstring            := edtPlaca.Text;
  dmDB.Embarquesdataembarque.AsDateTime   := edtDatEmbarque.DateTime;
  dmDB.Embarquestara.ASstring             := edtTara.Text;
  dmDB.Embarquesbruto.ASstring            := edtBruto.Text;
  dmDB.Embarquesliquido.ASstring          := edtPesoLiquido.Text;
  dmDB.Embarqueshorabarque.AsDateTime     := edtHoraEmbarque.Time;
  dmDB.Embarquesimp.AsString              := edtImp.Text;
  dmDB.Embarquesqueb.AsString             := edtQueb.Text;
  dmDB.EmbarquesVerd.AsString             := edtVerd.Text;
  dmDB.EmbarquesAvar.AsString             := edtAvar.Text;
  dmDB.EmbarquesUmid.AsString             := edtUmid.Text;
  try
   dmDB.Embarques.ApplyUpdates(-1);
   dmDB.Embarques.Close;
   dmDB.Embarques.Open;
   dmDB.AtualizaTotalEmbarqueContrato(vidContrato);
   ShowMessage('Embarque Realizado com Sucesso!');
   GeraLista;
   tbPrincipal.ActiveTab := tbiLista;
  except
   on E : Exception do
    ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
  end;
end;

procedure TfrmEmbarque.btnVoltar1Click(Sender: TObject);
begin
 Close;
end;

procedure TfrmEmbarque.btnVoltar2Click(Sender: TObject);
begin
 tbPrincipal.ActiveTab := tbiLista;
end;

procedure TfrmEmbarque.EditButton2Click(Sender: TObject);
begin
 frmPrincipal.vNovoEmbarque :=1;
 frmContratos := TfrmContratos.Create(Self);
  try
    frmContratos.ShowModal(
    procedure(ModalResult: TModalResult)
    begin
      edtContrato.Text   := dmDB.vNumeroContrato+'-'+dmDB.vComprador;
      vIdContrato        := dmDB.vIdContrato;
    end);
  finally
    frmContratos.free;
  end;
end;

procedure TfrmEmbarque.edtBrutoChangeTracking(Sender: TObject);
begin
 if TEdit(Sender).Text.Length<=0 then
  TEdit(Sender).Text := '0';
 edtPesoLiquido.text := floatTostr(strToFloat(edtBruto.Text)-strToFloat(edtTara.Text));
end;

procedure TfrmEmbarque.edtTaraChangeTracking(Sender: TObject);
begin
 if TEdit(Sender).Text.Length<=0 then
  TEdit(Sender).Text := '0';
 edtPesoLiquido.text := floatTostr(strToFloat(edtBruto.Text)-strToFloat(edtTara.Text));
end;

procedure TfrmEmbarque.FormShow(Sender: TObject);
begin
  tbPrincipal.TabPosition  := TTabPosition.None;
  tbPrincipal.ActiveTab    := tbiLista;
  btnExcluiItem.Visible    := false;
  dmDB.AbreEmbarque('');
  GeraLista
end;

procedure TfrmEmbarque.GeraLista;
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
    dmDb.embarquesGrid.First;
    Lista.Items.Clear;
    while not dmDb.embarquesGrid.eof do
     begin
       item := Lista.Items.Add;
         with frmEmbarque do
         begin
           with item  do
           begin
             txt      := TListItemText(Objects.FindDrawable('Text5'));
             txt.Text := 'N° Con.:';
             txt.TagString := dmDb.EmbarquesGridId.AsString;

             txt      := TListItemText(Objects.FindDrawable('Text7'));
             txt.Text := dmDb.EmbarquesGridnumerocontrato.AsString+' - '+
              dmDb.EmbarquesGridComprador.AsString;
             txt.TagString := dmDb.EmbarquesGridsyncfaz.AsString;

             txt      := TListItemText(Objects.FindDrawable('Text4'));
             txt.Text := 'Comprador:';

             txt      := TListItemText(Objects.FindDrawable('Text8'));
             txt.Text := 'Placa:';
             txt      := TListItemText(Objects.FindDrawable('Text9'));
             txt.Text := dmDb.EmbarquesGridPlaca.AsString;

             txt      := TListItemText(Objects.FindDrawable('Text12'));
             txt.Text := 'N° Nota:';
             txt      := TListItemText(Objects.FindDrawable('Text13'));
             txt.Text := dmDb.EmbarquesGridnumeronf.AsString;

             txt      := TListItemText(Objects.FindDrawable('Text11'));
             txt.Text := 'Tara';
             txt      := TListItemText(Objects.FindDrawable('Text3'));
             txt.Text := dmDb.EmbarquesGridtara.AsString;

             txt      := TListItemText(Objects.FindDrawable('Text10'));
             txt.Text := 'Bruto';
             txt      := TListItemText(Objects.FindDrawable('Text14'));
             txt.Text := dmDb.EmbarquesGridbruto.AsString;

             txt      := TListItemText(Objects.FindDrawable('Text16'));
             txt.Text := 'Liquido';
             txt      := TListItemText(Objects.FindDrawable('Text15'));
             txt.Text := dmDb.EmbarquesGridbruto.AsString;

             txt      := TListItemText(Objects.FindDrawable('Text18'));
             txt.Text := 'Imp.';
             txt      := TListItemText(Objects.FindDrawable('Text19'));
             txt.Text := dmDb.EmbarquesGridImp.AsString+'%';

             txt      := TListItemText(Objects.FindDrawable('Text20'));
             txt.Text := 'Queb.';
             txt      := TListItemText(Objects.FindDrawable('Text21'));
             txt.Text := dmDb.EmbarquesGridQueb.AsString+'%';

             txt      := TListItemText(Objects.FindDrawable('Text22'));
             txt.Text := 'Verd.';
             txt      := TListItemText(Objects.FindDrawable('Text23'));
             txt.Text := dmDb.EmbarquesGridVerd.AsString+'%';

             txt      := TListItemText(Objects.FindDrawable('Text24'));
             txt.Text := 'Avar.';
             txt      := TListItemText(Objects.FindDrawable('Text25'));
             txt.Text := dmDb.EmbarquesGridAvar.AsString+'%';

             txt      := TListItemText(Objects.FindDrawable('Text26'));
             txt.Text := 'Umid.';
             txt      := TListItemText(Objects.FindDrawable('Text27'));
             txt.Text := dmDb.EmbarquesGridUmid.AsString+'%';

             img := TListItemImage(Objects.FindDrawable('Image10'));
             img.Bitmap     := frmPrincipal.imgContrato.Bitmap;

             img := TListItemImage(Objects.FindDrawable('Image11'));
             img.Bitmap     := frmPrincipal.imgPeso.Bitmap;

             img := TListItemImage(Objects.FindDrawable('Image17'));
             img.Bitmap     := frmPrincipal.imgTaxa.Bitmap;
           end;
           dmDB.embarquesGrid.Next;
         end;
     end;
  end);
 end).Start;
end;

procedure TfrmEmbarque.ListaGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
 if vSync='0' then
  btnExcluiItem.Visible   := true;
end;

procedure TfrmEmbarque.ListaItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
  vSync :=
   TAppearanceListViewItem(Lista.Selected).Objects.FindObjectT<TListItemText>
   ('Text7').TagString;

  vIdEmbarque:=
   TAppearanceListViewItem(Lista.Selected).Objects.FindObjectT<TListItemText>
   ('Text5').TagString;
end;

end.
