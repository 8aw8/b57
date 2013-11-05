unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, DB, Grids, DBGrids,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Unit5, Menus, IniFiles;

type
  TForm1 = class(TForm)
    ListView1: TListView;
    Button2: TButton;
    Button4: TButton;
    Button5: TButton;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    Button1: TButton;
    N6: TMenuItem;
    N7: TMenuItem;
    Button3: TButton;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    Panel1: TPanel;
    Shape1: TShape;
    Label1: TLabel;
    PopupMenu1: TPopupMenu;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    CheckBox1: TCheckBox;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    TreeView1: TTreeView;
    Label2: TLabel;
    N29: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure ListView1CustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure N25Click(Sender: TObject);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure N26Click(Sender: TObject);
    procedure N27Click(Sender: TObject);
    procedure N28Click(Sender: TObject);
  private
    { Private declarations }
    numbers:set of char;
    sqltest:TStringList;
    SQL_nomenklatura:TStringList;
    SQL_dostavka:TStringList;

    function FileLastWrite (const filename : string) : string;
//-------------------Preload-----------
    procedure OpenCatalog;
  public
    { Public declarations }
    ListView:TListView;
    ListViewDostavka:TListView;
    ListViewOwnerAvto:TListView;
    ComboBoxCategory:TComboBox;

    procedure UpDostavka;
    procedure UpNomenklatura;
    procedure UpCategory;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Unit2, Unit4, Unit6, Unit7, Unit8, Unit9, Unit12, Unit17, Unit10,
  Unit18, Unit20, Unit22, Unit24, Unit26, Unit28;

function TForm1.FileLastWrite (const filename : string) : string;
var
  FileHandle : THandle;
  LocalFileTime : TFileTime;
  DosFileTime : DWORD;
  LastAccessedTime : TDateTime;
  FindData : TWin32FindData;
begin
  Result := '';
  FileHandle := FindFirstFile(PChar(filename), FindData);
  if FileHandle <> INVALID_HANDLE_VALUE then
  begin
    Windows.FindClose(FileHandle);
    if (FindData.dwFileAttributes and FILE_ATTRIBUTE_DIRECTORY) = 0 then
    begin
      FileTimeToLocalFileTime(FindData.ftLastWriteTime, LocalFileTime);
      FileTimeToDosDateTime(LocalFileTime,
      LongRec(DosFileTime).Hi,LongRec(DosFileTime).Lo);
      LastAccessedTime := FileDateToDateTime(DosFileTime);
      Result := DateTimeToStr(LastAccessedTime);
    end;
  end;
end;

procedure TForm1.OpenCatalog;
begin
  ListView:=TListView.Create(Form1);
  ListView.ParentWindow:=Form1.Handle;
  ListView.Visible:=false;

  ListViewDostavka:=TListView.Create(Form1);
  ListViewDostavka.ParentWindow:=Form1.Handle;
  ListViewDostavka.Visible:=false;

  ComboBoxCategory:=TComboBox.Create(Form1);
  ComboBoxCategory.ParentWindow:=Form1.Handle;
  ComboBoxCategory.Visible:=false;

  dm.initConnect(dm.ZConnection2);

  UpDostavka;
  UpNomenklatura;
  UpCategory;
end;

procedure TForm1.UpDostavka;
begin
 SQL_dostavka.Clear;
 SQL_dostavka.Add('select d.dostavka_person as "Заказчик", d.dostavka_adress as "Адрес", d.dostavka_telefon as "Телефон", d.dostavka_id from dostavka d');
 dm.DBListView(ListViewDostavka,SQL_dostavka, dm.ZConnection2,1);
end;

procedure TForm1.upNomenklatura;
begin
   SQL_nomenklatura.Clear;
   SQL_nomenklatura.Add('select p.product_name as "Изделие", p.volume as "Объем", p.weight as "Вес", c.creator_name as "Производитель", n.price as "Закупочная цена", n.pricedate as "Дата формирования цены", n.pricedate,  p.category_id, n.creator_id, n.product_id ');
   SQL_nomenklatura.Add('from nomenklatura n join creator c on n.creator_id=c.creator_id');
   SQL_nomenklatura.Add('join product p on n.product_id=p.product_id');
   SQL_nomenklatura.Add('left join product_category pc on p.category_id=pc.category_id');
   dm.DBListView(ListView,SQL_nomenklatura, dm.ZConnection2,4);
end;

procedure TForm1.UpCategory;
var
 id:TId;
begin
 dm.ZConnection2.Connect;

 dm.ZQuery2.Active:=false;
 dm.ZQuery2.SQL.Clear;
 dm.ZQuery2.SQL.Add('select name_category,category_id from product_category');
 dm.ZQuery2.Active:=true;

  id:=TId.Create;
  id.ID:='-1';
  ComboBoxCategory.Items.Clear;
  ComboBoxCategory.Items.AddObject('Все',id);
  ComboBoxCategory.ItemIndex:=0;

  dm.ZQuery2.First;
 while not(dm.ZQuery2.Eof) do begin
  id:=TId.Create;
  id.ID:=dm.ZQuery2.FieldByName('category_id').AsString;
  ComboBoxCategory.Items.AddObject(dm.ZQuery2.FieldByName('name_category').AsString,id);
  dm.ZQuery2.Next;
 end;//while

 dm.ZQuery2.Active:=false;
 dm.ZConnection2.Disconnect;

end;


procedure TForm1.FormActivate(Sender: TObject);
var
 iniFile:TIniFile;
 connect:string;
begin

 SQL_dostavka:=TStringList.Create;
 SQL_nomenklatura:=TStringList.Create;
 sqltest:=TStringList.Create;
 numbers:=['0','1','2','3','4','5','6','7','8','9','.',','];
  DM.ListThread:=TStringList.Create;
  DM.SyncThread:=TSyncThread.Create(true);
  DM.SyncThread.Resume;
  Connect:=' База данных не подключена';

 if FileExists(ExtractfilePath(Application.Exename)+'connectDb.ini') then begin
    try
      iniFile:=TIniFile.Create(ExtractfilePath(Application.Exename)+'connectDb.ini');
      dm.ZConnection1.Connected:=false;
      dm.ZConnection1.HostName:=iniFile.ReadString('ConnectDB','DBhost','');
      dm.ZConnection1.Database:=iniFile.ReadString('ConnectDB','DBname','');
      dm.ZConnection1.Catalog:=iniFile.ReadString('ConnectDB','DBname','');
      dm.ZConnection1.User:=iniFile.ReadString('ConnectDB','DBUser','');
      dm.ZConnection1.Password:=iniFile.ReadString('ConnectDB','DBpassword','');
      dm.ZConnection1.Connected:=true;
      Connect:=' Подключен.';
    except
      on E: Exception do  ShowMessage(E.Message);
//   (E.Message, E.HelpContext);
    end;
  if dm.ZConnection1.Connected then begin
    ShowMessage('База данных подключена.');
    dm.initConnect(dm.ZConnection2);

        OpenCatalog;

     sqltest.Clear;
     sqltest.Add(' SELECT z.zakaz_id as "Номер заказа", z.zakaz_date as "Дата формирования заказа", d.dostavka_person as "Контактное лицо", d.dostavka_telefon as "Телефон", d.dostavka_adress as "Адрес", z.zakaz_info as "Информация о заказе", z.enabled, z.zakaz_id');
     sqltest.Add(' FROM zakaz z left join dostavka d on z.dostavka_id=d.dostavka_id');
     sqltest.Add(' where z.enabled=1');
    dm.DBListView(ListView1,sqltest,dm.ZConnection2,2);
  end;
 end//if FileExists
  else
   ShowMessage('Файл конфигурации connectDb.ini не найден в папке '+ExtractfilePath(Application.Exename));
//   DateToStr(FileAge(ExtractfilePath(Application.Exename)+'project1.exe'));

  Form1.Caption:='B57 Версия от '+FileLastWrite(ExtractfilePath(Application.Exename)+'project1.exe')+Connect;

end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SQL_nomenklatura.Free;
  SQL_dostavka.Free;
  sqltest.Free;
  ListViewDostavka.Free;
  ListView.Free;
  DM.SyncThread.Terminate;
  DM.SyncThread.Free;
  DM.ListThread.Free;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
 Form5:=TForm5.Create(Form1);
 try
  Form5.ShowModal;
 finally
  Form5.Close;
 end;
 Form5.Free;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
 try
  Form7.ShowModal;
 finally
 end;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
  Form1.Close;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
 try
  Form8.ShowModal;
 finally
  Form8.Close;
 end;
end;

procedure TForm1.N5Click(Sender: TObject);
var
 iniFile:TIniFile;
 Connect:string;
begin
 Connect:=' База данных не подключена';
 if FileExists(ExtractfilePath(Application.Exename)+'connectDb.ini') then begin
    try
      iniFile:=TIniFile.Create(ExtractfilePath(Application.Exename)+'connectDb.ini');
      dm.ZConnection1.Connected:=false;
      dm.ZConnection1.HostName:=iniFile.ReadString('ConnectDB','DBhost','');
      dm.ZConnection1.Database:=iniFile.ReadString('ConnectDB','DBname','');
      dm.ZConnection1.Catalog:=iniFile.ReadString('ConnectDB','DBname','');
      dm.ZConnection1.User:=iniFile.ReadString('ConnectDB','DBUser','');
      dm.ZConnection1.Password:=iniFile.ReadString('ConnectDB','DBpassword','');
      dm.ZConnection1.Connected:=true;
      Connect:=' Подключен.';
    except
      on E: Exception do  ShowMessage(E.Message);
//   (E.Message, E.HelpContext);
    end;
  if dm.ZConnection1.Connected then ShowMessage('База данных подключена.');
 end//if FileExists
 else
   ShowMessage('Файл конфигурации connectDb.ini не найден в папке '+ExtractfilePath(Application.Exename));
   Form1.Caption:=Form1.Caption+Connect;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  try
    Form9.status:=FInsert;
    Form9.ShowModal;
  finally
   Form9.Close;
  end;
 end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 dm.initConnect(dm.ZConnection2);
 sqltest.Clear;
 sqltest.Add(' SELECT z.zakaz_id as "Номер заказа", z.zakaz_date as "Дата формирования заказа", d.dostavka_person as "Контактное лицо", d.dostavka_telefon as "Телефон", d.dostavka_adress as "Адрес", z.zakaz_info as "Информация о заказе", z.enabled, z.zakaz_id');
 sqltest.Add(' FROM zakaz z left join dostavka d on z.dostavka_id=d.dostavka_id');
  if not CheckBox1.Checked then sqltest.Add(' where z.enabled=1');
  dm.DBListView(ListView1,sqltest,dm.ZConnection2,2);
//  : Номер заказа; Дата; Лицо; Контактный номер; Адрес доставки; инфа
end;

procedure TForm1.ListView1DblClick(Sender: TObject);
var
 count:integer;
begin
 Form12:=TForm12.Create(Form1);
  try
   count:=ListView1.Selected.SubItems.Count;
   Form12.zakazId:=ListView1.Selected.SubItems.Strings[count-1];
   Form12.status:=FUpdate;
   Form12.ShowModal;
  finally
   Form12.Close;
  end;
    Form12.Free;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 try
  Form12.status:=FInsert;
  Form12.ShowModal;
  Button2Click(Button2);
 finally
  Form12.Close;
 end;
end;

procedure TForm1.N18Click(Sender: TObject);
begin
 try
  Form17.ShowModal;
 finally
  Form17.Close;
 end;
end;

procedure TForm1.N15Click(Sender: TObject);
var
 count:integer;
 zakazId:string;
 flag:string;
begin
 if not(ListView1.Selected=nil) then begin
     count:=ListView1.Selected.SubItems.Count;
     zakazId:=ListView1.Selected.SubItems.Strings[count-1];
   if ListView1.Selected.SubItems.Strings[count-2]='0' then flag:='1';
   if ListView1.Selected.SubItems.Strings[count-2]='1' then flag:='0';

  try
   dm.ZQuery2.Active:=false;
    dm.ZConnection2.Connect;
    dm.ZConnection2.StartTransaction;
     dm.ZQuery2.SQL.Clear;
     dm.ZQuery2.SQL.Add(' update zakaz set Enabled='+flag);
     dm.ZQuery2.SQL.Add(' where zakaz_id='+zakazId);
    dm.ZQuery2.ExecSQL;
    dm.ZConnection2.Commit;
    dm.ZConnection2.Disconnect;
    ListView1.Selected.SubItems.Strings[count-2]:=flag;
  except
      on E: Exception do begin
                          //ShowMessage(E.Message);
                          Form10:=TForm10.Create(Form1);
                          Form10.Label1.Caption:=E.Message;
                          Form10.ShowModal;
                          form10.Free;
                         end;
      //   (E.Message, E.HelpContext);
  end;
 end;//if
end;

procedure TForm1.ListView1CustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
var
  Count:integer;
 begin
  Count:=item.SubItems.Count;
  if item.SubItems.Strings[Count-2]='0' then
   Sender.canvas.Brush.Color:=clRed;

End;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
var
 Count:integer;
begin
  if not(ListView1.Selected=nil) then begin
    Count:=ListView1.Selected.SubItems.Count;
    if ListView1.Selected.SubItems.Strings[Count-2]='0' then PopupMenu1.Items[3].Caption:='Востановить заказ'
    else PopupMenu1.Items[3].Caption:='Удалить заказ';

  end;//if
end;

procedure TForm1.N10Click(Sender: TObject);
begin
 try
  Form18.ShowModal;
 finally
  Form18.Close;
 end;
end;

procedure TForm1.N20Click(Sender: TObject);
begin
// try
//  Form20.status:=FInsert;
//  Form20.ShowModal;
// finally
//  Form20.Close;
// end;
end;

procedure TForm1.N22Click(Sender: TObject);
var
 count:integer;
begin
 try
  count:=ListView1.Selected.SubItems.Count;
  Form20.zakazId:=ListView1.Selected.SubItems.Strings[count-1];
  Form20.status:=FInsert;
  Form20.ShowModal;
 finally
  Form20.Close;
 end;
end;

procedure TForm1.N25Click(Sender: TObject);
begin
 Form22_disp:=TForm22_disp.Create(Form1);
 try
  Form22_disp.ShowModal;
 finally
  Form22_disp.Close;
 end;
 Form22_disp.Free;
end;

procedure TForm1.TreeView1Change(Sender: TObject; Node: TTreeNode);
begin
 //   Label2.Caption:=IntToStr(node.SelectedIndex);
end;

procedure TForm1.N26Click(Sender: TObject);
begin
  Form24_driver:=TForm24_driver.Create(Form1);
 try
  Form24_driver.ShowModal;
 finally
  Form24_driver.Close;
 end;
  Form24_driver.Free;
end;

procedure TForm1.N27Click(Sender: TObject);
begin
   Form26_avto:=TForm26_avto.Create(Form1);
 try
  Form26_avto.ShowModal;
 finally
  Form26_avto.Close;
 end;
  Form26_avto.Free;
end;

procedure TForm1.N28Click(Sender: TObject);
begin
  Form28_owner:=TForm28_owner.Create(Form1);
 try
  Form28_owner.ShowModal;
 finally
  Form28_owner.Close;
 end;
  Form28_owner.Free;
end;

end.
