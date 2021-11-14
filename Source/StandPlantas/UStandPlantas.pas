unit UStandPlantas;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.EditBox, FMX.NumberBox, FMX.Edit, FMX.ListView, FMX.DateTimeCtrls,
  FMX.ListBox, FMX.StdCtrls, FMX.Objects, FMX.Controls.Presentation,
  FMX.Layouts, FMX.TabControl, FMX.ActnList, System.Actions, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components,Data.db, Data.Bind.Grid, Data.Bind.DBScope;

type
  TfrmStandPlantas = class(TForm)
    tbPrincipal: TTabControl;
    tbiLista: TTabItem;
    LayLista: TLayout;
    layBtnLista: TLayout;
    Layout52: TLayout;
    btnExluirMaquina: TButton;
    Image11: TImage;
    btnNovaMaquina: TButton;
    Image12: TImage;
    btnEditar: TButton;
    Image5: TImage;
    Rectangle22: TRectangle;
    Label28: TLabel;
    Image31: TImage;
    Layout2: TLayout;
    Label1: TLabel;
    cbxSetorF: TComboBox;
    Label2: TLabel;
    cbxTalhaoF: TComboBox;
    Label3: TLabel;
    edtDataFiltro: TDateEdit;
    btnBuscarOperacao: TButton;
    Layout3: TLayout;
    listaStand: TListView;
    tbiCad: TTabItem;
    Layout1: TLayout;
    Rectangle1: TRectangle;
    Label4: TLabel;
    Image1: TImage;
    Rectangle2: TRectangle;
    Layout64: TLayout;
    Layout4: TLayout;
    Layout5: TLayout;
    Rectangle3: TRectangle;
    Label5: TLabel;
    Layout6: TLayout;
    Rectangle4: TRectangle;
    Label6: TLabel;
    Layout7: TLayout;
    Rectangle5: TRectangle;
    edtDataSemente: TDateEdit;
    Layout8: TLayout;
    Label7: TLabel;
    Label8: TLabel;
    edtQtdSementes: TNumberBox;
    Layout9: TLayout;
    Rectangle6: TRectangle;
    edtDataPlantas: TDateEdit;
    Layout10: TLayout;
    Label9: TLabel;
    Label10: TLabel;
    edtQtdPlantas: TNumberBox;
    Button9: TButton;
    Image25: TImage;
    Label62: TLabel;
    actAcoes: TActionList;
    actMudarAba: TChangeTabAction;
    AcMudarAbaChart: TAction;
    AcMudarAbaDespesas: TAction;
    AcLeft: TAction;
    AcRigth: TAction;
    cbxCulturas: TComboBox;
    cbxVariedade: TComboBox;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkFillControlToFieldnome: TLinkFillControlToField;
    BindSourceDB2: TBindSourceDB;
    LinkFillControlToFieldid: TLinkFillControlToField;
    Layout11: TLayout;
    Rectangle7: TRectangle;
    Label11: TLabel;
    edtAddTalhao: TEdit;
    BtnAddTalhao: TEditButton;
    Label12: TLabel;
    edtTalhaoF: TEdit;
    procedure btnNovaMaquinaClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure BtnAddTalhaoClick(Sender: TObject);
    procedure cbxVariedadeChange(Sender: TObject);
    procedure cbxCulturasChange(Sender: TObject);
    procedure btnBuscarOperacaoClick(Sender: TObject);
    procedure listaStandItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure Image31Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private
    vIdCultura,vIdVariedade,vIdTalhao,vFiltro,vIdStand:string;
    procedure GeraLista;
    procedure MudarAba(ATabItem: TTabItem; sender: TObject);
    function  RetornaId: integer;
  public
    { Public declarations }
  end;

var
  frmStandPlantas: TfrmStandPlantas;

implementation

{$R *.fmx}

uses UPrincipal, UDataContext, UTalhoes;

procedure TfrmStandPlantas.BtnAddTalhaoClick(Sender: TObject);
begin
  frmTalhoes := TfrmTalhoes.Create(Self);
  try
    frmTalhoes.ShowModal(
    procedure(ModalResult: TModalResult)
    begin
      edtAddTalhao.Text := dmDB.vNomeTalhao;
      vIdTalhao         := dmDB.vIdTalhao;
    end);
  finally
    frmTalhoes.free;
  end;
end;

procedure TfrmStandPlantas.btnBuscarOperacaoClick(Sender: TObject);
begin
 vFiltro :=' AND DataSementes='+
  FormatDateTime('yyyy-mm-dd',edtDataFiltro.Date).QuotedString;

 if edtTalhaoF.Text.Length>0 then
  vFiltro := vFiltro +' AND TALHAO LIKE '+QuotedStr('%'+edtTalhaoF.Text+'%');

 dmDB.AbreStandPlatas(vFiltro);
 GeraLista;
end;

procedure TfrmStandPlantas.btnEditarClick(Sender: TObject);
begin
  if vIdStand.Length=0 then
  begin
    ShowMessage('Selecione um Stand');
    Exit;
  end;

  dmDB.TStandPlantas.Filtered := false;
  dmDB.TStandPlantas.Filter   := 'id='+vIdStand;
  dmdb.TStandPlantas.Filtered := true;
  dmdb.TStandPlantas.Edit;
  cbxCulturas.ItemIndex     := cbxCulturas.Items.IndexOf(dmDB.TStandPlantasCultura.AsString);
  cbxVariedade.ItemIndex    := cbxVariedade.Items.IndexOf(dmDB.TStandPlantasVariedade.AsString);
  edtQtdSementes.Text       := dmDB.TStandPlantasQtdeSementes.AsString;
  edtQtdPlantas.Text        := dmDB.TStandPlantasQtdePlantas.AsString;
  vIdCultura                := dmDB.TStandPlantasidCultura.AsString;
  vIdVariedade              := dmDB.TStandPlantasIdVariedade.AsString;
  vIdTalhao                 := dmDB.TStandPlantasIdTalhao.AsString;
  edtAddTalhao.Text         :=  dmDB.TStandPlantasTalhao.AsString;
  dmDB.TStandPlantas.edit;
  MudarAba(tbiCad,Sender);
end;

procedure TfrmStandPlantas.btnNovaMaquinaClick(Sender: TObject);
begin
  cbxCulturas.ItemIndex    := -1;
  cbxVariedade.ItemIndex   := -1;
  edtQtdSementes.Text      := '';
  edtQtdPlantas.Text       := '';
  dmDB.TStandPlantas.Close;
  dmDB.TStandPlantas.Open;
  dmDB.TStandPlantas.Insert;
  MudarAba(tbiCad,Sender);
end;

procedure TfrmStandPlantas.Button9Click(Sender: TObject);
begin
 if cbxCulturas.ItemIndex =-1 then
 begin
   ShowMessage('Informe a Cultura');
   Exit;
 end;
 if cbxVariedade.ItemIndex =-1 then
 begin
   ShowMessage('Informe a Variedade');
   Exit;
 end;
 if edtDataSemente.Text.Length=0 then
 begin
   ShowMessage('Informe a data das Semetes');
   Exit;
 end;
 if (edtQtdSementes.Text.Length=0)or(edtQtdSementes.Value<=0)  then
 begin
   ShowMessage('Informe a Qtde de Semetes');
   Exit;
 end;
 if dmDB.TStandPlantas.state=dsInsert then
  dmDB.TStandPlantasid.AsInteger      := RetornaId;


 dmDB.TStandPlantasidUsuario.AsString      := dmDB.vIdUser;
 dmDB.TStandPlantasDataSementes.AsDateTime := edtDataSemente.Date;
 dmDB.TStandPlantasidCultura.AsString      := vIdCultura;
 dmDB.TStandPlantasIdVariedade.AsString    := vIdVariedade;
 dmDB.TStandPlantasQtdeSementes.AsFloat    := edtQtdSementes.Value;
 dmDB.TStandPlantasQtdePlantas.AsFloat     := edtQtdPlantas.Value;
 dmDB.TStandPlantasIdTalhao.AsString       := vIdTalhao;
 if edtQtdPlantas.Value>0 then
  dmDB.TStandPlantasDataPlantas.AsDateTime := edtDataPlantas.Date;
 try
  dmDB.TStandPlantas.ApplyUpdates(-1);
  ShowMessage('Stand Lançado com sucesso!');
  dmDB.AbreStandPlatas('');
  GeraLista;
  MudarAba(tbiLista,sender);
 except
  on E: Exception do
    ShowMessage('Erro ao salvar Stand:'+E.Message);
 end;
end;

function TfrmStandPlantas.RetornaId: integer;
var
 vId:integer;
 vId1:integer;
begin
 vId1 := strToInt(dmDB.vIdUser)+ strToInt(formatdatetime('mmss',now));
 repeat
  vId:=Random(2020)*100;
 until (dmDB.VerificaIdStandExiste(intToStr(vId)));
 Result := vId;
end;

procedure TfrmStandPlantas.cbxCulturasChange(Sender: TObject);
begin
 if cbxCulturas.ItemIndex>-1 then
  vIdCultura := dmDB.RetornaIdTabela('auxculturas','nome',cbxCulturas.Selected.Text);
end;

procedure TfrmStandPlantas.cbxVariedadeChange(Sender: TObject);
begin
 if cbxVariedade.ItemIndex>-1 then
  vIdVariedade := dmDB.RetornaIdTabela('auxcultivares','nome',cbxVariedade.Selected.Text);
end;

procedure TfrmStandPlantas.FormShow(Sender: TObject);
begin
  GeraLista;
  tbPrincipal.TabPosition := TTabPosition.None;
  tbPrincipal.ActiveTab   := tbiLista;

  dmDB.TCulturas.Close;
  dmDB.TCulturas.Open;

  dmDB.TCultivares.Close;
  dmDB.TCultivares.Open;
end;

procedure TfrmStandPlantas.GeraLista;
var
 item   : TListViewItem;
 txt    : TListItemText;
 txtH   : TListItemPurpose;
 img    : TListItemImage;
 vStatus:string;
begin
  dmDB.AbreStandPlatas(vFiltro);
  dmDb.TStandPlantas.First;
  listaStand.Items.Clear;
  while not dmDb.TStandPlantas.eof do
   begin
     item := listaStand.Items.Add;
       with frmStandPlantas do
       begin
         with item  do
         begin
           txt      := TListItemText(Objects.FindDrawable('Text11'));
           txt.Text := dmDb.TStandPlantasid.AsString;

           txt      := TListItemText(Objects.FindDrawable('Text3'));
           txt.Text := dmDb.TStandPlantasTalhao.AsString;

           txt      := TListItemText(Objects.FindDrawable('Text4'));
           txt.Text := 'Cultura: '+dmDb.TStandPlantasCultura.AsString;

           txt      := TListItemText(Objects.FindDrawable('Text6'));
           txt.Text := 'Variedade: '+dmDb.TStandPlantasVariedade.AsString;


           txt      := TListItemText(Objects.FindDrawable('Text8'));
           txt.Text := 'Data: '+dmDb.TStandPlantasDataSementes.AsString;

           txt      := TListItemText(Objects.FindDrawable('Text5'));
           txt.Text := 'Qtde. Sementes: '+dmDb.TStandPlantasQtdeSementes.AsString;

           txt      := TListItemText(Objects.FindDrawable('Text10'));
           txt.Text := 'Data: '+dmDb.TStandPlantasDataPlantas.AsString;

           txt      := TListItemText(Objects.FindDrawable('Text9'));
           txt.Text := 'Qtde. Plantas: '+dmDb.TStandPlantasQtdePlantas.AsString;
         end;
         dmDB.TStandPlantas.Next;
       end;
   end;

end;

procedure TfrmStandPlantas.listaStandItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
  vIdStand :=
   TAppearanceListViewItem(listaStand.Selected).Objects.FindObjectT<TListItemText>
   ('Text11').Text;
end;

procedure TfrmStandPlantas.MudarAba(ATabItem: TTabItem; sender: TObject);
begin
   actMudarAba.Tab := ATabItem;
   actMudarAba.ExecuteTarget(sender);
end;

procedure TfrmStandPlantas.Image1Click(Sender: TObject);
begin
 Close;
end;

procedure TfrmStandPlantas.Image31Click(Sender: TObject);
begin
  Close;
end;

end.
