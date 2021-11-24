unit UCadReceituario;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts,
  FMX.TabControl, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, FMX.DateTimeCtrls, FMX.ListBox,
  FMX.Edit, FMX.ActnList, System.Actions, System.Rtti, FMX.Grid.Style,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope,
  FMX.ScrollBox, FMX.Grid, FMX.EditBox, FMX.NumberBox;

type
  TfrmCadReceituario = class(TForm)
    actAcoes: TActionList;
    actMudarAba: TChangeTabAction;
    AcMudarAbaChart: TAction;
    AcMudarAbaDespesas: TAction;
    AcLeft: TAction;
    AcRigth: TAction;
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
    btnSelecionar: TButton;
    Image6: TImage;
    Rectangle22: TRectangle;
    Label28: TLabel;
    Image31: TImage;
    Layout2: TLayout;
    Label1: TLabel;
    cbxSetorF: TComboBox;
    Label2: TLabel;
    cbxTalhaoF: TComboBox;
    btnBuscarOperacao: TButton;
    Label18: TLabel;
    cbxStatusF: TComboBox;
    Layout3: TLayout;
    listaReceituarios: TListView;
    tbiCad: TTabItem;
    Layout1: TLayout;
    Rectangle1: TRectangle;
    Label4: TLabel;
    Image1: TImage;
    Rectangle2: TRectangle;
    Layout64: TLayout;
    btnProximo: TButton;
    Image23: TImage;
    Label59: TLabel;
    Layout4: TLayout;
    Layout5: TLayout;
    Rectangle3: TRectangle;
    edtNome: TEdit;
    Label5: TLabel;
    Layout6: TLayout;
    Rectangle15: TRectangle;
    Label17: TLabel;
    edtDataCriacao: TDateEdit;
    tbiCadDet: TTabItem;
    layDet: TLayout;
    Rectangle5: TRectangle;
    layFiltros: TLayout;
    Rectangle6: TRectangle;
    Label8: TLabel;
    Button2: TButton;
    edtTalhaoF: TEdit;
    Label9: TLabel;
    edtProdutoF: TEdit;
    Rectangle4: TRectangle;
    Label10: TLabel;
    Image2: TImage;
    ListaDetReceiturario: TListView;
    layAddDetReceituario: TLayout;
    TabControl1: TTabControl;
    tbiProdutos: TTabItem;
    Rectangle7: TRectangle;
    Layout8: TLayout;
    btnExcluir: TButton;
    Image3: TImage;
    Rectangle14: TRectangle;
    Label15: TLabel;
    Ü: TImage;
    ToolBar4: TToolBar;
    Rectangle10: TRectangle;
    Label11: TLabel;
    Rectangle11: TRectangle;
    Layout9: TLayout;
    Layout7: TLayout;
    cbxIndicacao: TComboBox;
    Label12: TLabel;
    Rectangle13: TRectangle;
    Layout11: TLayout;
    Label14: TLabel;
    Rectangle9: TRectangle;
    Label7: TLabel;
    Image9: TImage;
    Rectangle12: TRectangle;
    tbiTalhoes: TTabItem;
    Rectangle8: TRectangle;
    ToolBar1: TToolBar;
    Rectangle16: TRectangle;
    Label16: TLabel;
    Rectangle17: TRectangle;
    lblAreaTotal: TLabel;
    Rectangle20: TRectangle;
    Layout15: TLayout;
    Label20: TLabel;
    edttalhao: TEdit;
    EditButton1: TEditButton;
    Image14: TImage;
    listaProdutosRec: TListView;
    ListaTalhoesRec: TListView;
    Layout14: TLayout;
    Button3: TButton;
    Image4: TImage;
    Button5: TButton;
    Image16: TImage;
    Label6: TLabel;
    Rectangle18: TRectangle;
    Layout10: TLayout;
    Label13: TLabel;
    edtProduto: TEdit;
    EditButton4: TEditButton;
    Image13: TImage;
    edtQtdIndicadaProduto: TEdit;
    lblTotalReceituario: TLabel;
    Layout12: TLayout;
    Rectangle19: TRectangle;
    Label3: TLabel;
    edtDataPrevAplicacao: TDateEdit;
    Label19: TLabel;
    edtNumeroF: TEdit;
    procedure btnProximoClick(Sender: TObject);
    procedure btnNovaMaquinaClick(Sender: TObject);
    procedure EditButton1Click(Sender: TObject);
    procedure EditButton4Click(Sender: TObject);
    procedure Rectangle9Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Image31Click(Sender: TObject);
    procedure listaReceituariosItemClickEx(const Sender: TObject;
      ItemIndex: Integer; const LocalClickPos: TPointF;
      const ItemObject: TListItemDrawable);
    procedure btnEditarClick(Sender: TObject);
    procedure btnBuscarOperacaoClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnExluirMaquinaClick(Sender: TObject);
    procedure ListaDetReceiturarioItemClickEx(const Sender: TObject;
      ItemIndex: Integer; const LocalClickPos: TPointF;
      const ItemObject: TListItemDrawable);
    procedure btnExcluirClick(Sender: TObject);
    procedure GridProdutosCellClick(const Column: TColumn; const Row: Integer);
    procedure Button3Click(Sender: TObject);
    procedure gridTalhoCellClick(const Column: TColumn; const Row: Integer);
    procedure Button5Click(Sender: TObject);
    procedure Rectangle14Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSelecionarClick(Sender: TObject);
    procedure listaProdutosRecItemClickEx(const Sender: TObject;
      ItemIndex: Integer; const LocalClickPos: TPointF;
      const ItemObject: TListItemDrawable);
    procedure ListaTalhoesRecItemClickEx(const Sender: TObject;
      ItemIndex: Integer; const LocalClickPos: TPointF;
      const ItemObject: TListItemDrawable);
    procedure edtQtdIndicadaProdutoKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);

  private
    procedure MudarAba(ATabItem: TTabItem; sender: TObject);
    procedure GerarListaDetReceituario(IdReceituario:string);
    procedure GerarListaTalhaoReceituario(IdReceituario:string);
    procedure GerarListaProdutosReceituario(IdReceituario:string);
  public
    vIdReceituario,vNomeReceituario,vIdTalhao,vIdProduto,vStatusRec,
    vIdDetReceituario,vIdDetTalhaoReceituario:string;
    vCadOperacao:integer;
    procedure AbreReceituario(vFiltro:string);
    procedure myShowMenssagem(msg:string);
  end;

var
  frmCadReceituario: TfrmCadReceituario;

implementation

{$R *.fmx}

uses UPrincipal, UDataContext, UTalhoes, UProdutos, Umsg;

procedure TfrmCadReceituario.AbreReceituario(vFiltro:string);
var
 item   : TListViewItem;
 txt    : TListItemText;
 txtH   : TListItemPurpose;
 img    : TListItemImage;
 vStatus:string;
begin
 dmDB.TReceituario.Filtered := false;
 with dmDB.TReceituario,dmDB.TReceituario.SQL do
 begin
  Clear;
  Add('select id,');
  Add('status,');
  Add('nome,');
  Add('responsavel,');
  Add('idResponsavel,');
  Add('DataRegistro,');
  Add('datarecomendacao,');
  Add('dataprevaplicacao,');
  Add('cast(observacao as VARCHAR(100)) observacao from receiturario');
  Add('where Status>-1');
  Add(vFiltro);
  Add('order by dataregistro DESC');
  Open;
 end;
 dmDB.TReceituario.First;
 listaReceituarios.Items.Clear;
  while not dmDb.TReceituario.eof do
   begin
     item := listaReceituarios.Items.Add;
       with frmCadReceituario do
       begin
         with item  do
         begin
           txt      := TListItemText(Objects.FindDrawable('Text8'));
           txt.Text := dmDb.TReceituarioid.AsString;

           txt      := TListItemText(Objects.FindDrawable('Text9'));
           txt.Text := dmDb.TReceituariostatus.AsString;

           txt      := TListItemText(Objects.FindDrawable('Text3'));
           txt.Text := dmDb.TReceituarionome.AsString;

           txt      := TListItemText(Objects.FindDrawable('Text4'));
           txt.Text := 'Recomendação: ';

           txt      := TListItemText(Objects.FindDrawable('Text5'));
           txt.Text := dmDb.TReceituariodatarecomendacao.AsString;


           txt      := TListItemText(Objects.FindDrawable('Text8'));
           txt.Text := 'Prev. Aplicacao: ';

           txt      := TListItemText(Objects.FindDrawable('Text9'));
           txt.Text := dmDb.TReceituariodataprevaplicacao.AsString;

           txt      := TListItemText(Objects.FindDrawable('Text6'));
           txt.Text := 'Status: ';

           case dmDb.TReceituariostatus.AsInteger of
            0: vStatus:='Pedente Sincronizar';
            1: vStatus:='Aberto';
            2: vStatus:='Finalizado';
            3: vStatus:='Em Uso';
           end;

           txt      := TListItemText(Objects.FindDrawable('Text7'));
           txt.Text := vStatus;

           txt      := TListItemText(Objects.FindDrawable('Text10'));
           txt.Text := dmDB.RetornaTalhoesReceiturario(dmDb.TReceituarioid.AsString);

           img := TListItemImage(Objects.FindDrawable('Image12'));
           img.ScalingMode := TImageScalingMode.Stretch;
           img.Bitmap     := frmPrincipal.imgRetanguloVerde.Bitmap;
         end;
         dmDB.TReceituario.Next;
       end;
   end;

end;

procedure TfrmCadReceituario.btnBuscarOperacaoClick(Sender: TObject);
var
 vFiltro:string;
begin
  if cbxStatusF.ItemIndex>-1 then
  begin
    vFiltro := vFiltro+' AND STATUS='+intToStr(cbxStatusF.ItemIndex);
  end;
  if edtNumeroF.Text.Length>0 then
   vFiltro := vFiltro+' AND ID='+edtNumeroF.Text;

  AbreReceituario(vFiltro);
  lblTotalReceituario.Text:='Total Receituarios: '+intToStr(listaReceituarios.Items.Count);
end;

procedure TfrmCadReceituario.btnEditarClick(Sender: TObject);
begin
 if vIdReceituario.Length=0 then
 begin
  ShowMessage('Selecione o Receituario');
  Exit;
 end;
 layAddDetReceituario.Visible := false;
 btnExcluir.Visible := vStatusRec='0';
 GerarListaDetReceituario(vIdReceituario);
 MudarAba(tbiCadDet,sender);
end;

procedure TfrmCadReceituario.btnExcluirClick(Sender: TObject);
begin
 if vIdDetReceituario.Length=0 then
 begin
   ShowMessage('Selecione um Item!');
   Exit;
 end;
 dmDB.DeleteDetReceituario(vIdDetReceituario);
 ShowMessage('Detalhe Excluido com sucesso!');
 GerarListaProdutosReceituario(vIdReceituario);
end;

procedure TfrmCadReceituario.btnExluirMaquinaClick(Sender: TObject);
begin
 if vIdReceituario.Length=0 then
 begin
   ShowMessage('Selecione um item!');
   Exit;
 end;
  if vStatusRec<>'0' then
 begin
   ShowMessage('Receituario ja sincronizado!');
   Exit;
 end;
 MessageDlg('Deseja deletar esse Receituario?', System.UITypes.TMsgDlgType.mtInformation,
  [System.UITypes.TMsgDlgBtn.mbYes,
  System.UITypes.TMsgDlgBtn.mbNo
  ], 0,
  procedure(const AResult: System.UITypes.TModalResult)
  begin
   case AResult of
   mrYES:
    begin
     TThread.Synchronize(nil, procedure
      begin
       dmDB.DeleteReceituario(vIdReceituario);
       ShowMessage('Receituario Excluido com sucesso!');
       AbreReceituario('');
       lblTotalReceituario.Text:='Total Receituarios: '+intToStr(listaReceituarios.Items.Count);
      end);
    end;
   end;
  end);
end;

procedure TfrmCadReceituario.btnNovaMaquinaClick(Sender: TObject);
begin
 edtNome.Text := intToStr(dmDB.RetornaIdReceituario);
 dmDB.TReceituario.Close;
 dmDB.TReceituario.Open;
 dmDB.TReceituario.Insert;
 layAddDetReceituario.Visible := true;
 layFiltros.Visible   := false;
 MudarAba(tbiCad,sender);
end;

procedure TfrmCadReceituario.btnProximoClick(Sender: TObject);
begin

 if edtNome.Text.Length=0 then
 begin
   ShowMessage('Informe o nome do Receituario!');
   Exit;
 end;

 if not dmDB.VerificaExiste('Nome','receiturario',edtNome.Text) then
 begin
   ShowMessage('Ja existe um Receituario com esse nome!');
   Exit;
 end;
 vIdReceituario                                := edtNome.Text;
 dmDB.TReceituarioid.AsString                  := vIdReceituario;
 dmDB.TReceituariostatus.AsInteger             :=0;
 dmDB.TReceituarionome.AsString                :=edtNome.Text;
 dmDB.TReceituarioidResponsavel.AsString       :=dmDB.vIdUser;
 dmDB.TReceituariodatarecomendacao.AsDateTime  :=edtDataCriacao.DateTime;
 dmDB.TReceituarioDataPrevAplicacao.AsDateTime :=edtDataPrevAplicacao.DateTime;
 dmDB.TReceituarioresponsavel.AsString         :=frmPrincipal.edtUsuario.Text;
 try
   edtTalhao.Text             := '';
   edtProduto.Text            := '';
   cbxIndicacao.ItemIndex     :=-1;
   edtQtdIndicadaProduto.Text := '';
   layAddDetReceituario.Visible := true;
   layFiltros.Visible           := false;
   dmDB.TReceituario.ApplyUpdates(-1);
   dmDB.TDetReceituario.Close;
   dmDB.TDetReceituario.Open;
   TabControl1.TabPosition := TTabPosition.None;
   TabControl1.ActiveTab   := tbiTalhoes;
   layAddDetReceituario.Visible := true;
//   gridTalho.RowCount           :=0;
   GerarListaDetReceituario(vIdReceituario);
   MudarAba(tbiCadDet,sender);
 except
  on E: Exception do
    ShowMessage('Erro ao salvar Receituario:'+E.Message);
 end;

end;

procedure TfrmCadReceituario.btnSelecionarClick(Sender: TObject);
begin
 if vIdReceituario.Length=0 then
 begin
  ShowMessage('Selecione um Receituario');
  Exit;
 end
 else
 begin
  dmDB.vIdReceituario   :=vIdReceituario;
  dmDB.vNomeReceituario :=vNomeReceituario;
  dmDB.vStatusRec       :=vStatusRec;
  Close;
 end;
end;

procedure TfrmCadReceituario.Button1Click(Sender: TObject);
begin
 layFiltros.Visible           := true;
 MudarAba(tbiLista,sender);
end;

procedure TfrmCadReceituario.Button3Click(Sender: TObject);
begin
 if vIdDetTalhaoReceituario.Length=0 then
 begin
   ShowMessage('Selecione um Item!');
   Exit;
 end;
 dmDB.DeleteDetTalhaoReceituario(vIdDetTalhaoReceituario);
 ShowMessage('Talhao Excluido com sucesso!');
 GerarListaTalhaoReceituario(vIdReceituario);
 lblAreaTotal.Text :='Area Total: '+dmDB.RetornaAreaTotalDetReceituario(vIdReceituario)+' (ha)';
end;

procedure TfrmCadReceituario.Button5Click(Sender: TObject);
begin
 if ListaTalhoesRec.Items.Count =0 then
 begin
   ShowMessage('Informe pelo menos um talhao!!');
   Exit;
 end;
 MessageDlg('Já adicionou todos os Talhões?'+#13+'Deseja Proseguir', System.UITypes.TMsgDlgType.mtInformation,
  [System.UITypes.TMsgDlgBtn.mbYes,
  System.UITypes.TMsgDlgBtn.mbNo
  ], 0,
  procedure(const AResult: System.UITypes.TModalResult)
  begin
   case AResult of
   mrYES:
    begin
     TThread.Synchronize(nil, procedure
      begin
       TabControl1.ActiveTab := tbiProdutos;
      end);
    end;
   end;
  end);
end;

procedure TfrmCadReceituario.EditButton1Click(Sender: TObject);
begin
  vIdReceituario:=vIdReceituario;
  frmTalhoes := TfrmTalhoes.Create(Self);
  try
    frmTalhoes.ShowModal(
    procedure(ModalResult: TModalResult)
    begin
      vIdTalhao         := dmdb.vIdTalhao;
      if vIdTalhao.Length>0 then
       begin
         if not dmDB.VerificaTalhaoJaAdicionadoReceituario(vIdReceituario,vidTalhao) then
         begin
           ShowMessage('Talhao ja Adicionado!');
           edttalhao.SetFocus;
         end
         else
         begin
           dmDb.TDetReceituarioTalhao.Close;
           dmDb.TDetReceituarioTalhao.Open;
           dmDb.TDetReceituarioTalhao.Insert;
           dmDb.TDetReceituarioTalhaoid.AsInteger            := dmDB.RetornaIdReceituarioTalhao;
           dmDb.TDetReceituarioTalhaoidreceiturario.AsString := vIdReceituario;
           dmDb.TDetReceituarioTalhaoidusuario.AsString      := dmDB.vIdUser;
           dmDb.TDetReceituarioTalhaoidtalhao.AsString       := vIdTalhao;
           dmDb.TDetReceituarioTalhaoareahe.AsString         := dmdb.vAreaTalhao;
           try
            dmDb.TDetReceituarioTalhao.ApplyUpdates(-1);
            GerarListaTalhaoReceituario(vIdReceituario);
            lblAreaTotal.Text :='Area Total: '+dmDB.RetornaAreaTotalDetReceituario(vIdReceituario)+' (ha)';
           except
           on E : Exception do
             ShowMessage('Erro ao inserir Detalhe:'+E.Message);
           end;
         end;
       end;
    end);
  finally
   frmTalhoes.free;
  end;
end;

procedure TfrmCadReceituario.EditButton4Click(Sender: TObject);
begin
 frmprodutos := Tfrmprodutos.Create(Self);
  try
    frmprodutos.ShowModal(
    procedure(ModalResult: TModalResult)
    begin
      edtProduto.Text   := dmDB.vNomeProduto;
      vIdProduto        := dmDB.vIdProduto;
    end);
  finally
    frmprodutos.free;
  end;
end;

procedure TfrmCadReceituario.edtQtdIndicadaProdutoKeyDown(Sender: TObject;
  var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
 if not (keyChar in ['0'..'9','.',','])
 and (ord(keychar)<>8) and (keychar<>#0)then
 begin
  beep;
  KeyChar := #0;
 end;
end;

procedure TfrmCadReceituario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 vCadOperacao :=0;
end;

procedure TfrmCadReceituario.FormShow(Sender: TObject);
var
 vFiltro:string;
begin
 frmCadReceituario.StyleBook := frmPrincipal.StyleBook1;
 if (vCadOperacao=0) and (dmDB.vAgronomo='0') then
 begin
   btnExluirMaquina.Visible := false;
   btnNovaMaquina.Visible   := false;
   btnSelecionar.Visible    := false;
   cbxSetorF.ItemIndex      := 1;
   cbxSetorF.Enabled        := false;
   vFiltro := vFiltro+' AND STATUS=1';
   AbreReceituario(vFiltro);
    lblTotalReceituario.Text:='Total Receituarios: '+intToStr(listaReceituarios.Items.Count);
 end
 else
 begin
   if (vCadOperacao=1)  then
   begin
     cbxSetorF.Enabled        := true;
     btnExluirMaquina.Visible := false;
     btnNovaMaquina.Visible   := false;
     btnSelecionar.Visible    := true;
   end
   else
   begin
     cbxSetorF.Enabled        := true;
     btnExluirMaquina.Visible := true;
     btnNovaMaquina.Visible   := true;
     btnSelecionar.Visible    := false;
     cbxStatusF.ItemIndex     :=1;
     lblTotalReceituario.Text:='Total Receituarios: '+intToStr(listaReceituarios.Items.Count);
   end;
 end;
 tbPrincipal.TabPosition      := TTabPosition.None;
 tbPrincipal.ActiveTab        := tbiLista;
 layAddDetReceituario.Visible := false;
end;

procedure TfrmCadReceituario.GerarListaDetReceituario(IdReceituario: string);
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
  var
   vTalhoes,vAreaTotal,vPrevProduto:string;
  begin
    dmDb.TDetReceituario.First;
    ListaDetReceiturario.Items.Clear;
    while not dmDb.TDetReceituario.eof do
     begin
         item := ListaDetReceiturario.Items.Add;
         vTalhoes     :=  dmDB.RetornaTalhoesReceiturario(vIdReceituario);
         vAreaTotal   :=  dmDB.RetornaReceiturarioAreaTotal(vIdReceituario);
         vPrevProduto :=  dmDB.RetornaPrevisaoProduto(dmDb.TDetReceituarioidproduto.AsString,vIdReceituario);
         with frmCadReceituario do
         begin
           with item  do
           begin
             txt      := TListItemText(Objects.FindDrawable('Text14'));
             txt.Text := dmDb.TDetReceituarioid.AsString;

             txt      := TListItemText(Objects.FindDrawable('Text3'));
             txt.Text := vTalhoes;

             txt      := TListItemText(Objects.FindDrawable('Text4'));
             txt.Text := 'Produto: ';

             txt      := TListItemText(Objects.FindDrawable('Text5'));
             txt.Text := dmDb.TDetReceituarioproduto_1.AsString;

             txt      := TListItemText(Objects.FindDrawable('Text6'));
             txt.Text := 'Area Prev.: ';

             txt      := TListItemText(Objects.FindDrawable('Text7'));
             txt.Text := vAreaTotal+' he';

             txt      := TListItemText(Objects.FindDrawable('Text8'));
             txt.Text := 'Indicação: ';

             txt      := TListItemText(Objects.FindDrawable('Text9'));
             txt.Text := dmDb.TDetReceituarioqtdporhe.AsString +' /he';

             txt      := TListItemText(Objects.FindDrawable('Text10'));
             txt.Text := 'Total Prev.: ';

             txt      := TListItemText(Objects.FindDrawable('Text11'));
             txt.Text := vPrevProduto;

             img := TListItemImage(Objects.FindDrawable('Image14'));
             img.Bitmap     := frmPrincipal.imgSeed.Bitmap;
           end;
           dmDB.TDetReceituario.Next;
         end;
     end;
  end);
 end).Start;
end;

procedure TfrmCadReceituario.GerarListaProdutosReceituario(
  IdReceituario: string);
var
 item   : TListViewItem;
 txt    : TListItemText;
 txtH   : TListItemPurpose;
 img    : TListItemImage;
 vStatus:string;
begin
 dmDB.AbrirDetProdutosReceiturario(IdReceituario);
 TThread.CreateAnonymousThread(procedure
 begin
  TThread.Synchronize(nil, procedure
  begin
    dmDb.TDetReceituario.First;
    listaProdutosRec.Items.Clear;
    while not dmDb.TDetReceituario.eof do
     begin
         item := listaProdutosRec.Items.Add;
         with frmCadReceituario do
         begin
           with item  do
           begin
             txt      := TListItemText(Objects.FindDrawable('Text13'));
             txt.Text := dmDb.TDetReceituarioid.AsString;

             txt      := TListItemText(Objects.FindDrawable('Text3'));
             txt.Text := dmDb.TDetReceituarioProduto.Asstring;

             txt      := TListItemText(Objects.FindDrawable('Text4'));
             txt.Text := 'Recomendação(ha): ';

             txt      := TListItemText(Objects.FindDrawable('Text5'));
             txt.Text := dmDb.TDetReceituarioqtdporhe.Asstring+' he';

             txt      := TListItemText(Objects.FindDrawable('Text6'));
             txt.Text := 'Finalidade: ';

             txt      := TListItemText(Objects.FindDrawable('Text7'));
             txt.Text := dmDb.TDetReceituariofinalidade.AsString;

             img := TListItemImage(Objects.FindDrawable('Image12'));
             img.Bitmap     := frmPrincipal.imgSeed.Bitmap;

             img := TListItemImage(Objects.FindDrawable('Image13'));
             img.ScalingMode := TImageScalingMode.Stretch;
             img.Bitmap     := frmPrincipal.imgRetanguloVerde.Bitmap;
           end;
           dmDB.TDetReceituario.Next;
         end;
     end;
  end);
 end).Start;
end;

procedure TfrmCadReceituario.GerarListaTalhaoReceituario(IdReceituario: string);
var
 item   : TListViewItem;
 txt    : TListItemText;
 txtH   : TListItemPurpose;
 img    : TListItemImage;
 vStatus:string;
begin
 dmDB.AbrirDetTalhaoReceiturario(IdReceituario);
 TThread.CreateAnonymousThread(procedure
 begin
  TThread.Synchronize(nil, procedure
  var
   vTalhoes,vAreaTotal,vPrevProduto:string;
  begin
    dmDb.TGridReceituarioTalhao.First;
    ListaTalhoesRec.Items.Clear;
    while not dmDb.TGridReceituarioTalhao.eof do
     begin
         item := ListaTalhoesRec.Items.Add;
         with frmCadReceituario do
         begin
           with item  do
           begin
             txt      := TListItemText(Objects.FindDrawable('Text13'));
             txt.Text := dmDb.TGridReceituarioTalhaoid.AsString;

             txt      := TListItemText(Objects.FindDrawable('Text3'));
             txt.Text := dmDb.TGridReceituarioTalhaotalhao.Asstring;

             txt      := TListItemText(Objects.FindDrawable('Text4'));
             txt.Text := 'Area(ha): ';

             txt      := TListItemText(Objects.FindDrawable('Text5'));
             txt.Text := dmDb.TGridReceituarioTalhaoareahe.Asstring+' he';

             img := TListItemImage(Objects.FindDrawable('Image12'));
             img.Bitmap     := frmPrincipal.imgTalhao.Bitmap;

             img := TListItemImage(Objects.FindDrawable('Image13'));
             img.ScalingMode := TImageScalingMode.Stretch;
             img.Bitmap     := frmPrincipal.imgRetanguloVerde.Bitmap;
           end;
           dmDB.TGridReceituarioTalhao.Next;
         end;
     end;
  end);
 end).Start;
end;

procedure TfrmCadReceituario.gridTalhoCellClick(const Column: TColumn;
  const Row: Integer);
begin
  vIdDetTalhaoReceituario := dmDB.TGridReceituarioTalhaoid.AsString;
end;

procedure TfrmCadReceituario.Image1Click(Sender: TObject);
begin
 MudarAba(tbiLista,Sender);
end;

procedure TfrmCadReceituario.Image2Click(Sender: TObject);
begin
 MudarAba(tbiLista,Sender);
end;

procedure TfrmCadReceituario.Image31Click(Sender: TObject);
begin
 Close;
end;

procedure TfrmCadReceituario.Image6Click(Sender: TObject);
begin
 layAddDetReceituario.Visible := false;
 layFiltros.Visible           := true;
end;

procedure TfrmCadReceituario.ListaDetReceiturarioItemClickEx(
  const Sender: TObject; ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
  vIdDetReceituario :=
   TAppearanceListViewItem(ListaDetReceiturario.Selected).Objects.FindObjectT<TListItemText>
   ('Text14').Text;
end;

procedure TfrmCadReceituario.listaProdutosRecItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
 vIdDetReceituario :=
   TAppearanceListViewItem(listaProdutosRec.Selected).Objects.FindObjectT<TListItemText>
   ('Text13').Text;
end;

procedure TfrmCadReceituario.listaReceituariosItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
var
 Obs:String;
begin
  vIdReceituario :=
   TAppearanceListViewItem(listaReceituarios.Selected).Objects.FindObjectT<TListItemText>
   ('Text3').Text;
  vStatusRec     :=
   TAppearanceListViewItem(listaReceituarios.Selected).Objects.FindObjectT<TListItemText>
   ('Text9').Text;
  vNomeReceituario:=
   TAppearanceListViewItem(listaReceituarios.Selected).Objects.FindObjectT<TListItemText>
   ('Text3').Text;
  Obs := dmDB.RetornaObsReceituario(vIdReceituario);
  if obs.Length>1 then
  begin
    myShowMenssagem('Observação:'+Obs);
  end;
end;

procedure TfrmCadReceituario.ListaTalhoesRecItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
  vIdDetTalhaoReceituario :=
   TAppearanceListViewItem(ListaTalhoesRec.Selected).Objects.FindObjectT<TListItemText>
   ('Text13').Text;
end;

procedure TfrmCadReceituario.MudarAba(ATabItem: TTabItem; sender: TObject);
begin
  actMudarAba.Tab := ATabItem;
  actMudarAba.ExecuteTarget(sender);
end;

procedure TfrmCadReceituario.myShowMenssagem(msg: string);
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

procedure TfrmCadReceituario.Rectangle14Click(Sender: TObject);
begin
 if listaProdutosRec.items.count=0 then
 begin
   ShowMessage('Informe pelo menos um Produto!');
   edtProduto.SetFocus;
   Exit;
 end;
 MessageDlg('Já adicionou todos os Produtos?'+#13+'Deseja Finalizar?', System.UITypes.TMsgDlgType.mtInformation,
  [System.UITypes.TMsgDlgBtn.mbYes,
  System.UITypes.TMsgDlgBtn.mbNo
  ], 0,
  procedure(const AResult: System.UITypes.TModalResult)
  begin
   case AResult of
   mrYES:
    begin
     TThread.Synchronize(nil, procedure
      begin
       ShowMessage('Receiturario Criado com Sucesso!!');
       AbreReceituario(' AND STATUS>-1');
       lblTotalReceituario.Text:='Total Receituarios: '+intToStr(listaReceituarios.Items.Count);
       MudarAba(tbiLista,Sender);
      end);
    end;
   end;
  end);
end;

procedure TfrmCadReceituario.Rectangle9Click(Sender: TObject);
begin
 if cbxIndicacao.ItemIndex=-1 then
 begin
   ShowMessage('Informe a Indicação!');
   cbxIndicacao.SetFocus;
   Exit;
 end;

 if edtProduto.Text.Length=0 then
 begin
   ShowMessage('Informe o Produto!');
   edtProduto.SetFocus;
   Exit;
 end;
 if edtQtdIndicadaProduto.Text.Length=0 then
 begin
   ShowMessage('Informe a Qtde. Indicada!');
   edtQtdIndicadaProduto.SetFocus;
   Exit;
 end;
 if not dmDB.VerificaProdutoJaAdicionadoReceituario(vIdReceituario,vIdProduto) then
 begin
   ShowMessage('Produto ja Adicionado!');
   edtProduto.SetFocus;
   Exit;
 end;
 dmDB.TDetReceituario.Insert;
 dmDB.TDetReceituarioidreceiturario.AsString  := vIdReceituario;
 dmDB.TDetReceituarioid.AsInteger             := dmDB.RetornaIdReceituario;
 dmDB.TDetReceituarioidusuario.AsString       := dmDB.vIdUser;
 dmDB.TDetReceituariofinalidade.AsString      := cbxIndicacao.Selected.Text;
 dmDB.TDetReceituarioqtdporhe.AsString        := edtQtdIndicadaProduto.Text;
 dmDB.TDetReceituarioidproduto.AsString       := vIdProduto;
 dmDB.TDetReceituarioproduto.AsString         := edtProduto.Text;
 dmDB.TDetReceituariostatus.AsInteger         :=1;
 try
  dmDB.TDetReceituario.ApplyUpdates(-1);
  GerarListaProdutosReceituario(vIdReceituario);
  edtTalhao.Text             := '';
  edtProduto.Text            := '';
  edtQtdIndicadaProduto.Text := '';
 except
  on E : Exception do
   ShowMessage('Erro ao inserir Detalhe:'+E.Message);
 end;
end;


procedure TfrmCadReceituario.GridProdutosCellClick(const Column: TColumn;
  const Row: Integer);
begin
 vIdDetReceituario := dmDB.TDetReceituarioid.AsString;
end;

end.

