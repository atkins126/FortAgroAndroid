unit UCamAbastecimento;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Controls.Presentation, FMX.Objects, FMX.TabControl, FMX.Layouts,
  FMX.TreeView, FMX.MultiView, System.Actions, FMX.ActnList, FMX.Ani,
  FMX.Effects, FMX.Filter.Effects, System.Rtti, FMX.Grid.Style, FMX.ScrollBox,
  FMX.Grid, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.DBScope, FMX.ListBox, FMX.DateTimeCtrls,
  System.Bluetooth, System.Bluetooth.Components,System.Threading,FireDAC.Comp.Client,
  FMX.EditBox, FMX.SpinBox, FMX.Memo,IdHTTP,System.Json.writers,System.Json.Readers,System.JSON.Types,
  Rest.Json,System.JSON, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, Data.Bind.ObjectScope,
  REST.Client, IPPeerClient,REST.Types,FMX.VirtualKeyboard,FMX.Platform,
  IdHashMessageDigest,System.ImageList,
  FMX.ImgList, FMX.Media, System.Sensors, System.Sensors.Components,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.Gestures, FMX.NumberBox, FMX.ListView,u99Permissions,
  FMX.MediaLibrary.Actions, FMX.StdActns
  {$IF DEFINED(iOS) or DEFINED(ANDROID)}
   ,Androidapi.JNI.Os, Androidapi.Helpers,
   Androidapi.JNI.GraphicsContentViewText,System.Permissions,FMX.DialogService
   {$ENDIF}
  ,Soap.EncdDecd;

type
  TfrmCameraAbastecimento = class(TForm)
    ActionList1: TActionList;
    ActPhotoLibrary: TTakePhotoFromLibraryAction;
    ActPhotoCamera: TTakePhotoFromCameraAction;
    VertScrollBox1: TVertScrollBox;
    btnFotoBomba: TRectangle;
    Image18: TImage;
    Label40: TLabel;
    btnFotoHorimetro: TRectangle;
    Image17: TImage;
    Label21: TLabel;
    RecImgBomba: TRectangle;
    imgBomba: TImage;
    RecImgHrimetro: TRectangle;
    imgHorimetro: TImage;
    Layout20: TLayout;
    btnVoltarProduto: TRectangle;
    Image3: TImage;
    Label16: TLabel;
    Layout8: TLayout;
    Rectangle29: TRectangle;
    Label42: TLabel;
    Rectangle1: TRectangle;
    procedure ActPhotoCameraDidFinishTaking(Image: TBitmap);
    procedure FormActivate(Sender: TObject);
    procedure btnFotoHorimetroClick(Sender: TObject);
    procedure btnFotoBombaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnVoltarProdutoClick(Sender: TObject);
  private
    {$IFDEF ANDROID}
    PermissaoCamera, PermissaoReadStorage, PermissaoWriteStorage : string;
    procedure TakePicturePermissionRequestResult(
        Sender: TObject; const APermissions: TArray<string>;
        const AGrantResults: TArray<TPermissionStatus>);
    procedure DisplayMessageCamera(Sender: TObject;
                const APermissions: TArray<string>;
                const APostProc: TProc);
    procedure LibraryPermissionRequestResult(
        Sender: TObject; const APermissions: TArray<string>;
        const AGrantResults: TArray<TPermissionStatus>);
    procedure DisplayMessageLibrary(Sender: TObject;
                const APermissions: TArray<string>;
                const APostProc: TProc);
    {$ENDIF}
    function BitmapFromBase64(const base64: string): TBitmap;
    function Base64FromBitmap(Bitmap: TBitmap): string;
  public
    vImg :integer;
  end;

var
  frmCameraAbastecimento: TfrmCameraAbastecimento;

implementation

{$R *.fmx}

uses UDataContext;


{ TForm1 }

procedure TfrmCameraAbastecimento.ActPhotoCameraDidFinishTaking(Image: TBitmap);
begin
  if vImg=1 then
    imgHorimetro.Bitmap.Assign(Image);
  if vImg=2 then
    imgBomba.Bitmap.Assign(Image);
end;

procedure TfrmCameraAbastecimento.DisplayMessageCamera(Sender: TObject;
  const APermissions: TArray<string>; const APostProc: TProc);
begin
       TDialogService.ShowMessage('O app precisa acessar as fotos do seu dispositivo',
                procedure(const AResult: TModalResult)
                begin
                        APostProc;
                end);
end;

procedure TfrmCameraAbastecimento.DisplayMessageLibrary(Sender: TObject;
  const APermissions: TArray<string>; const APostProc: TProc);
begin
 TDialogService.ShowMessage('O app precisa acessar a câmera e as fotos do seu dispositivo',
  procedure(const AResult: TModalResult)
  begin
    APostProc;
  end);
end;

function TfrmCameraAbastecimento.Base64FromBitmap(Bitmap: TBitmap): string;
var
  Input: TBytesStream;
  Output: TStringStream;
begin
  Input := TBytesStream.Create;
  try
    Bitmap.SaveToStream(Input);
    Input.Position := 0;
    Output := TStringStream.Create('', TEncoding.ASCII);
    try
      Soap.EncdDecd.EncodeStream(Input, Output);
      Result := Output.DataString;
    finally
      Output.Free;
    end;
  finally
    Input.Free;
  end;

end;

function TfrmCameraAbastecimento.BitmapFromBase64(
  const base64: string): TBitmap;
var
  Input: TStringStream;
  Output: TBytesStream;
begin
  Input := TStringStream.Create(base64, TEncoding.ASCII);
  try
    Output := TBytesStream.Create;
    try
      Soap.EncdDecd.DecodeStream(Input, Output);
      Output.Position := 0;
      Result := TBitmap.Create;
      try
        Result.LoadFromStream(Output);
      except
        Result.Free;
        raise;
      end;
    finally
      Output.Free;
    end;
  finally
    Input.Free;
  end;
end;

procedure TfrmCameraAbastecimento.btnFotoBombaClick(Sender: TObject);
begin
vImg:=2;
{$IFDEF ANDROID}
        PermissionsService.RequestPermissions([PermissaoCamera,
                                               PermissaoReadStorage,
                                               PermissaoWriteStorage],
                                               TakePicturePermissionRequestResult,
                                               DisplayMessageCamera
                                               );
        {$ENDIF}

        {$IFDEF IOS}
        ActPhotoCamera.Execute;
        {$ENDIF}
end;

procedure TfrmCameraAbastecimento.btnFotoHorimetroClick(Sender: TObject);
begin
 vImg:=1;
{$IFDEF ANDROID}
        PermissionsService.RequestPermissions([PermissaoCamera,
                                               PermissaoReadStorage,
                                               PermissaoWriteStorage],
                                               TakePicturePermissionRequestResult,
                                               DisplayMessageCamera
                                               );
        {$ENDIF}

        {$IFDEF IOS}
        ActPhotoCamera.Execute;
        {$ENDIF}
end;

procedure TfrmCameraAbastecimento.btnVoltarProdutoClick(Sender: TObject);
begin
 if not imgHorimetro.Bitmap.IsEmpty then
    dmDB.vImg64Horimetro := Base64FromBitmap(imgHorimetro.Bitmap);
 if not imgBomba.Bitmap.IsEmpty then
    dmDB.vImg64Bomba := Base64FromBitmap(imgBomba.Bitmap);
 Close;
end;

procedure TfrmCameraAbastecimento.FormActivate(Sender: TObject);
begin
  {$IFDEF ANDROID}
        PermissaoCamera := JStringToString(TJManifest_permission.JavaClass.CAMERA);
        PermissaoReadStorage := JStringToString(TJManifest_permission.JavaClass.READ_EXTERNAL_STORAGE);
        PermissaoWriteStorage := JStringToString(TJManifest_permission.JavaClass.WRITE_EXTERNAL_STORAGE);
  {$ENDIF}
end;

procedure TfrmCameraAbastecimento.FormShow(Sender: TObject);
begin
 if dmDB.vImg64Horimetro.Length>0 then
  imgHorimetro.Bitmap  := BitmapFromBase64(dmDB.vImg64Horimetro)
 else
  imgHorimetro.Bitmap  := nil;
 if dmDB.vImg64Bomba.Length>0 then
  imgBomba.Bitmap  := BitmapFromBase64(dmDB.vImg64Bomba)
 else
  imgBomba.Bitmap  := nil;
end;

procedure TfrmCameraAbastecimento.LibraryPermissionRequestResult(Sender: TObject;
  const APermissions: TArray<string>;
  const AGrantResults: TArray<TPermissionStatus>);
begin
      // 2 Permissoes: READ_EXTERNAL_STORAGE e WRITE_EXTERNAL_STORAGE

        if (Length(AGrantResults) = 2) and
           (AGrantResults[0] = TPermissionStatus.Granted) and
           (AGrantResults[1] = TPermissionStatus.Granted) then
                ActPhotoLibrary.Execute
        else
                TDialogService.ShowMessage('Você não tem permissão para acessar as fotos');

end;

procedure TfrmCameraAbastecimento.TakePicturePermissionRequestResult(Sender: TObject;
  const APermissions: TArray<string>;
  const AGrantResults: TArray<TPermissionStatus>);
begin
        if (Length(AGrantResults) = 3) and
           (AGrantResults[0] = TPermissionStatus.Granted) and
           (AGrantResults[1] = TPermissionStatus.Granted) and
           (AGrantResults[2] = TPermissionStatus.Granted) then
                ActPhotoCamera.Execute
        else
                TDialogService.ShowMessage('Você não tem permissão para tirar fotos');

end;

end.
