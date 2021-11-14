unit UPluviometria;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Effects, FMX.Edit, FMX.ListBox, FMX.DateTimeCtrls,
  FMX.Controls.Presentation, FMX.Objects, FMX.TabControl, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  FMX.Gestures, FMX.EditBox, FMX.NumberBox,FMX.VirtualKeyboard,FMX.Platform;

type
  TfrmPluviometria = class(TForm)
    layBase: TLayout;
    recPrincipal: TRectangle;
    tbPrincipal: TTabControl;
    tbiLista: TTabItem;
    Rectangle3: TRectangle;
    Layout5: TLayout;
    btnNovoForn: TRectangle;
    Image9: TImage;
    Label7: TLabel;
    Rectangle18: TRectangle;
    Image31: TImage;
    Label4: TLabel;
    GroupBox2: TGroupBox;
    Layout1: TLayout;
    Layout2: TLayout;
    Layout4: TLayout;
    edtDataF: TDateEdit;
    Label1: TLabel;
    Layout22: TLayout;
    Label9: TLabel;
    ToolBar2: TToolBar;
    laymsg: TLayout;
    RecStatusAcao: TRectangle;
    layBaseMSG: TLayout;
    Layout23: TLayout;
    Layout24: TLayout;
    Layout25: TLayout;
    ShadowEffect14: TShadowEffect;
    layBtnControls: TLayout;
    SEffectBtnConfirm1: TShadowEffect;
    btnConfirmar: TRectangle;
    layBntConfirm: TLayout;
    imgBntConfirm: TImage;
    lblBtnConfirm: TLabel;
    SEffectBtnConfirm: TShadowEffect;
    btnCancel: TRectangle;
    layBtnCancel: TLayout;
    ImgBtnCancel: TImage;
    lblBtnCancel: TLabel;
    SEffectBtnCancel: TShadowEffect;
    lblmsg: TLabel;
    Image8: TImage;
    Layout31: TLayout;
    Rectangle16: TRectangle;
    btnVoltar: TSpeedButton;
    Label14: TLabel;
    btnBuscarAnimal: TSpeedButton;
    Image12: TImage;
    tbiCad: TTabItem;
    Layout3: TLayout;
    ListaPluviometria: TListView;
    btnExcluiItem: TRectangle;
    Image1: TImage;
    lblExcluir: TLabel;
    GestureManager1: TGestureManager;
    TimerMsg: TTimer;
    layTBICad: TLayout;
    Rectangle1: TRectangle;
    Layout6: TLayout;
    Layout7: TLayout;
    Layout8: TLayout;
    Rectangle2: TRectangle;
    Layout9: TLayout;
    Label2: TLabel;
    Layout12: TLayout;
    Rectangle6: TRectangle;
    Layout13: TLayout;
    Label8: TLabel;
    Layout14: TLayout;
    Rectangle7: TRectangle;
    Layout15: TLayout;
    Label10: TLabel;
    edtData: TDateEdit;
    Layout67: TLayout;
    btnVoltar2: TButton;
    Image24: TImage;
    Label61: TLabel;
    btnSalvarGrupo: TButton;
    Image25: TImage;
    Label62: TLabel;
    edtPluviometro: TEdit;
    EditButton6: TEditButton;
    Label3: TLabel;
    edtHora: TTimeEdit;
    edtSetorF: TEdit;
    Rectangle4: TRectangle;
    edtChuvaMM: TEdit;
    procedure FormShow(Sender: TObject);
    procedure ListaPluviometriaItemClickEx(const Sender: TObject;
      ItemIndex: Integer; const LocalClickPos: TPointF;
      const ItemObject: TListItemDrawable);
    procedure btnBuscarAnimalClick(Sender: TObject);
    procedure ListaPluviometriaGesture(Sender: TObject;
      const EventInfo: TGestureEventInfo; var Handled: Boolean);
    procedure btnExcluiItemClick(Sender: TObject);
    procedure btnNovoFornClick(Sender: TObject);
    procedure btnSalvarGrupoClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure TimerMsgTimer(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure Rectangle18Click(Sender: TObject);
    procedure Rectangle4Click(Sender: TObject);
    procedure btnVoltar2Click(Sender: TObject);
    procedure edtPluviometroClick(Sender: TObject);
    procedure btnExcluiItemMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnExcluiItemMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnNovoFornMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnNovoFornMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure Rectangle18MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure Rectangle18MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure edtChuvaMMKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
  private
    vFlagSync,vIdPluviometria,vIdPluvFiltro,vIdPluviometro :string;
    procedure GeraLista(vFiltro:string);
    procedure MyShowMessage(msg: string; btnCancel: Boolean;Alert:integer);

  public
    { Public declarations }
  end;

var
  frmPluviometria: TfrmPluviometria;

implementation

{$R *.fmx}

uses UPrincipal, UDataContext, UPluviometro;

{ TfrmPluviometria }

procedure TfrmPluviometria.MyShowMessage(msg: string; btnCancel: Boolean;Alert:integer);
var
  KeyboardService: IFMXVirtualKeyboardService;
begin
 if TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService, IInterface(KeyboardService)) then
  KeyboardService.HideVirtualKeyboard;
 lblmsg.Text := msg;
 laymsg.Visible := true;

 if Alert=0 then
  {$IFDEF ANDROID}
   frmPrincipal.Vibrar(500)
  {$ENDIF}
 else
 begin
   {$IFDEF ANDROID}
    frmPrincipal.Vibrar(500);
   {$ENDIF}
   Sleep(250);
   {$IFDEF ANDROID}
   frmPrincipal.Vibrar(500)
   {$ENDIF}
 end;
 TimerMsg.Enabled := true;
end;

procedure TfrmPluviometria.Rectangle18Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmPluviometria.Rectangle18MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  Rectangle18.Opacity :=1;
end;

procedure TfrmPluviometria.Rectangle18MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  Rectangle18.Opacity :=0.5;
end;

procedure TfrmPluviometria.Rectangle4Click(Sender: TObject);
begin
 tbPrincipal.ActiveTab := tbiLista;
end;

procedure TfrmPluviometria.btnBuscarAnimalClick(Sender: TObject);
var
 vFiltro:string;
begin
 vFiltro := ' AND datacoleta='+FormatDateTime('yyyy-mm-dd',edtDataF.Date).QuotedString;
 if edtSetorF.Text.Length>0 then
   vFiltro := vFiltro+' AND Setor like '+QuotedStr('%'+edtSetorF.Text+'%') ;
 GeraLista(vFiltro);
end;

procedure TfrmPluviometria.btnConfirmarClick(Sender: TObject);
begin
 laymsg.Visible   := false;
 TimerMsg.Enabled := false;
end;

procedure TfrmPluviometria.btnExcluiItemClick(Sender: TObject);
begin
 btnExcluiItem.Visible := false;
 if vFlagSync='0' then
 begin
   MessageDlg('Deseja Realmente Deletar esse Registro?', System.UITypes.TMsgDlgType.mtInformation,
   [System.UITypes.TMsgDlgBtn.mbYes,
   System.UITypes.TMsgDlgBtn.mbNo
   ], 0,
   procedure(const AResult: System.UITypes.TModalResult)
   begin
    case AResult of
     mrYES:
     begin
       dmDB.DeletaPluviometria(vIdPluviometria);
       GeraLista('');
     end;
     mrNo:
    end;
   end);
 end
 else
 begin
   ShowMessage('Registro ja Sincronizado!!');
 end;
end;

procedure TfrmPluviometria.btnExcluiItemMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
 btnExcluiItem.Opacity :=1;
end;

procedure TfrmPluviometria.btnExcluiItemMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  btnExcluiItem.Opacity :=0.5;
end;

procedure TfrmPluviometria.btnNovoFornClick(Sender: TObject);
begin
 edtPluviometro.Text      :='';
 edtData.Date             := date;
 edtHora.Time             := now;
 edtChuvaMM.text          := '0';
 dmDB.TPluviometria.Close;
 dmDB.TPluviometria.Open;
 dmDB.TPluviometria.Insert;
 tbPrincipal.ActiveTab:=tbicad;
end;

procedure TfrmPluviometria.btnNovoFornMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  btnNovoForn.Opacity :=1;
end;

procedure TfrmPluviometria.btnNovoFornMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  btnNovoForn.Opacity :=0.5;
end;

procedure TfrmPluviometria.btnSalvarGrupoClick(Sender: TObject);
begin
 if edtPluviometro.Text.Length=0 then
 begin
   MyShowMessage('Informe o Pluviometro',false,1);
   Exit;
 end;
 if (edtChuvaMM.Text.Length=0)or (edtChuvaMM.Text='0,00')  then
 begin
   MyShowMessage('Informe o Volume Chuva!',false,1);
   Exit;
 end;
 dmDB.TPluviometriaidpluviometro.AsString := vIdPluviometro;
 dmDB.TPluviometriadatacoleta.AsDateTime  := edtData.DateTime;
 dmDB.TPluviometriahora.AsDateTime        := edtHora.DateTime;
 dmDB.TPluviometriavolumemm.AsFloat       := strToFloat(edtChuvaMM.text);
 dmDB.TPluviometriaidusuario.AsString     := dmDB.vIdUser;
 try
  dmDB.TPluviometria.ApplyUpdates(-1);
  GeraLista('');
  tbPrincipal.ActiveTab := tbiLista;
 except
  on E : Exception do
   myShowMessage('Erro ao inserir Pluviometria : '+E.Message,false,1);
 end;
end;

procedure TfrmPluviometria.btnVoltar2Click(Sender: TObject);
begin
if tbPrincipal.TabIndex=1 then
 begin
  tbPrincipal.ActiveTab := tbiLista;
  Exit;
 end;
 if tbPrincipal.TabIndex=0 then
 begin
  Close;
 end;
end;

procedure TfrmPluviometria.btnVoltarClick(Sender: TObject);
begin
 if tbPrincipal.TabIndex=1 then
 begin
  tbPrincipal.ActiveTab := tbiLista;
  Exit;
 end;
 if tbPrincipal.TabIndex=0 then
 begin
  Close;
 end;
end;

procedure TfrmPluviometria.edtChuvaMMKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
if not (keyChar in ['0'..'9','.',','])
 and (ord(keychar)<>8) and (keychar<>#0)then
 begin
  beep;
  KeyChar := #0;
 end;
end;

procedure TfrmPluviometria.edtPluviometroClick(Sender: TObject);
begin
 frmPluviometro := TfrmPluviometro.Create(Self);
  try
    frmPluviometro.ShowModal(
    procedure(ModalResult: TModalResult)
    begin
      edtPluviometro.Text := dmDB.vNomePluvSel;
      vIdPluviometro      := dmDB.vIdPluviometroSel;
    end);
  finally
    frmPluviometro.free;
  end;
end;

procedure TfrmPluviometria.FormShow(Sender: TObject);
begin
 laymsg.Visible := false;
 tbPrincipal.ActiveTab   :=  tbiLista;
 tbPrincipal.TabPosition :=  TTabPosition.None;
 edtDataF.Date           :=  date ;
 btnExcluiItem.Visible := false;
 GeraLista('');
end;

procedure TfrmPluviometria.GeraLista(vFiltro: string);
var
 item   : TListViewItem;
 txt    : TListItemText;
 txtH   : TListItemPurpose;
 img    : TListItemImage;
begin
 dmDB.AbrirPluviometriua(vFiltro);
 dmDB.TPluviometria.First;
 ListaPluviometria.Items.Clear;
 while not dmDB.TPluviometria.eof do
 begin
   item := ListaPluviometria.Items.Add;
   with frmPluviometria do
   begin
     with item  do
     begin
       txt      := TListItemText(Objects.FindDrawable('Text3'));
       txt.Text := dmDB.TPluviometriaPluviometro.AsString;
       txt.TagString := dmDB.TPluviometriaid.AsString;

       txt      := TListItemText(Objects.FindDrawable('Text5'));
       txt.Text := 'Data: ';

       txt      := TListItemText(Objects.FindDrawable('Text4'));
       txt.Text := 'Hora: ';

       txt      := TListItemText(Objects.FindDrawable('Text8'));
       txt.Text := 'Chuva(mm): ';

       txt      := TListItemText(Objects.FindDrawable('Text14'));
       txt.Text := 'Talhões: ';

       txt      := TListItemText(Objects.FindDrawable('Text10'));
       txt.Text := 'Setor: ';

       txt      := TListItemText(Objects.FindDrawable('Text6'));
       txt.Text := dmDB.TPluviometriadatacoleta.AsString;
       txt.TagString := dmDB.TPluviometriasyncfaz.AsString;

       txt      := TListItemText(Objects.FindDrawable('Text7'));
       txt.Text := dmDB.TPluviometriahora.AsString;

       txt      := TListItemText(Objects.FindDrawable('Text9'));
       txt.Text := dmDB.TPluviometriavolumemm.AsString;

       txt      := TListItemText(Objects.FindDrawable('Text11'));
       txt.Text := dmDB.TPluviometriaSetor.AsString;

       txt      := TListItemText(Objects.FindDrawable('Text13'));
       txt.Text := dmDB.RetornaTalhoesPluviometro(dmDB.TPluviometriaidpluviometro.AsString);

       img := TListItemImage(Objects.FindDrawable('Image14'));
       img.Bitmap     := frmPrincipal.imgPluviometro.Bitmap;
     end;
     dmDB.TPluviometria.Next;
   end;
 end;
end;

procedure TfrmPluviometria.ListaPluviometriaGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
  btnExcluiItem.Visible := true;
end;

procedure TfrmPluviometria.ListaPluviometriaItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
 vIdPluviometria :=
   TAppearanceListViewItem(ListaPluviometria.Selected).Objects.FindObjectT<TListItemText>
   ('Text3').TagString;
 vFlagSync :=
   TAppearanceListViewItem(ListaPluviometria.Selected).Objects.FindObjectT<TListItemText>
   ('Text6').TagString;
end;

procedure TfrmPluviometria.TimerMsgTimer(Sender: TObject);
begin
 if RecStatusAcao.Stroke.Color=TAlphaColorRec.White then
  begin
   RecStatusAcao.Stroke.Kind  :=  TBrushKind.Solid;
   RecStatusAcao.Stroke.Color :=  TAlphaColorRec.Red;
  end
  else
  begin
   RecStatusAcao.Stroke.Kind  :=  TBrushKind.Solid;
   RecStatusAcao.Stroke.Color :=  TAlphaColorRec.White;
  end;
end;

end.
