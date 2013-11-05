unit Unit9;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, ExtCtrls, ZConnection, Menus, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset,unit2;

type
  TForm9 = class(TForm)
    ListView1: TListView;
    ListView2: TListView;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    SpeedButton1: TSpeedButton;
    Label4: TLabel;
    Panel1: TPanel;
    ListView3: TListView;
    ZConnection1: TZConnection;
    Panel2: TPanel;
    SpeedButton2: TSpeedButton;
    LabeledEdit1: TLabeledEdit;
    DateTimePicker1: TDateTimePicker;
    Label5: TLabel;
    SpeedButton3: TSpeedButton;
    Label6: TLabel;
    Panel3: TPanel;
    ListView4: TListView;
    ZConnection2: TZConnection;
    Memo1: TMemo;
    PopupMenu1: TPopupMenu;
    Bpvtyn1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    Button3: TButton;
    ZQuery1: TZQuery;
    Label7: TLabel;
    Button4: TButton;
    ZConnection3: TZConnection;
    Button5: TButton;
    Label8: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ListView3SelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure ListView1SelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure ListView4SelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure N3Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ListView4DblClick(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure ListView2SelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure Button4Click(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
  private
    transportId:string;
    productId:string;
    creatorId:string;
    dostavkaId:string;
     SQL_nomenklatura:TStringList;
     SQL_Transport:TStringList;
     SQL_dostavka:TStringList;
     SQL_update_zakaz:TStringList;
    function ListViewFind():TListItem;
    { Private declarations }
  public
   zakazId:string;
   status:TStatus;
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

{$R *.dfm}
uses Unit11, Unit10, Unit1;

function TForm9.ListViewFind;
var
 Item:TListItem;
 i,count:integer;
begin
 i:=0;
  result:=nil;
 while (i<=ListView2.Items.Count-1) do begin
  Item:=ListView2.Items[i];
  count:=item.SubItems.Count;
   Memo1.Lines.Add(Item.SubItems.Strings[count-3]+';'+Item.SubItems.Strings[count-2]+';'+Item.SubItems.Strings[count-1]);
  if ((Item.SubItems.Strings[count-3]=creatorid)and(Item.SubItems.Strings[count-2]=productid)and(Item.SubItems.Strings[count-1]=TransportId)) then
  begin
   result:=Item;
   i:=ListView2.Items.Count;
     Memo1.Lines.Add('exit');
  end;
  inc(i);
 end;//while
end;

procedure TForm9.Button1Click(Sender: TObject);
begin
 dm.DBListView(ListView1,SQL_nomenklatura,dm.ZConnection1,2);
end;

procedure TForm9.Button2Click(Sender: TObject);
var
 Item,item2,findItem:TListItem;
 Columns:TListColumns;
 column:TListColumn;
 addProduct,count:integer;
begin
 Columns:=ListView1.Columns;
 ListView2.Columns.Assign(Columns);
 Column:=ListView2.Columns.Add;
 Column.Caption:='count';
 Column:=ListView2.Columns.Add;
 Column.Caption:='creator_id';
 Column:=ListView2.Columns.Add;
 Column.Caption:='product_id';
 Column:=ListView2.Columns.Add;
 Column.Caption:='TransportId';
 Item:=ListView1.Selected;
// if  (TransportId='') then
//   ShowMessage('Выберите транспорт.')
// else
 if not(item=nil) then begin
  count:=Item.SubItems.Count;
  creatorid:=Item.SubItems.Strings[count-2];
  productid:=Item.SubItems.Strings[count-1];
  Memo1.Lines.Add('creatorid='+creatorid+' productid='+productid);
 // Item.SubItems.Strings[8]=TransportId;
  findItem:=ListViewFind;
  if (findItem=nil) then begin
   item2:=ListView2.Items.Add;
   item2.Assign(Item);
   count:=item2.SubItems.Count;
   item2.SubItems.Add(TransportId);
   item2.SubItems.Insert(count-2,'1');
   item2.SubItems.Strings[count-2]:=Edit1.Text;
   item2.SubItems.Strings[count-3]:=Edit2.Text;
  end//if
  else begin
    Form11:=TForm11.Create(Form9);
   try
    Form11.ShowModal;
    addProduct:=Form11.status;
   finally
    Form11.Close;
   end;
    Form11.Free;
    case addProduct of
    1:begin //Суммировать
       count:=findItem.SubItems.Count;
       findItem.SubItems.Strings[count-4]:=intToStr(strToInt(findItem.SubItems.Strings[count-4])+strToInt(Edit1.Text));
      end;
    2:begin //Обновить
       count:=findItem.SubItems.Count;
       findItem.SubItems.Strings[count-4]:=Edit1.Text;
       findItem.SubItems.Strings[count-5]:=Edit2.Text;
      end;
    end;//case
  end;//else
 end//if
 else ShowMessage('Выберите изделие');
end;

procedure TForm9.FormActivate(Sender: TObject);
begin
     SQL_nomenklatura:=TStringList.Create;
     SQL_Transport:=TStringList.Create;
     SQL_dostavka:=TStringList.Create;
     SQL_update_zakaz:=TStringList.Create;
  dostavkaId:='null';
  TransportId:='null';
  ZConnection1.HostName:=dm.ZConnection1.HostName;
  ZConnection1.Database:=dm.ZConnection1.Database;
  ZConnection1.Catalog:=dm.ZConnection1.Catalog;
  ZConnection1.User:=dm.ZConnection1.User;
  ZConnection1.Password:=dm.ZConnection1.Password;
  ZConnection1.Connected:=true;

  ZConnection2.HostName:=dm.ZConnection1.HostName;
  ZConnection2.Database:=dm.ZConnection1.Database;
  ZConnection2.Catalog:=dm.ZConnection1.Catalog;
  ZConnection2.User:=dm.ZConnection1.User;
  ZConnection2.Password:=dm.ZConnection1.Password;

  ZConnection3.HostName:=dm.ZConnection1.HostName;
  ZConnection3.Database:=dm.ZConnection1.Database;
  ZConnection3.Catalog:=dm.ZConnection1.Catalog;
  ZConnection3.User:=dm.ZConnection1.User;
  ZConnection3.Password:=dm.ZConnection1.Password;

 case status of
 FUpdate: begin
   SQL_update_zakaz:=TStringList.Create;
   SQL_update_zakaz.Add('SELECT p.product_name, p.volume, p.weight, c.creator_name, c.creator_adress,zd.price,zd.count,zd.creator_id,zd.product_id,zd.transport_id ');
   SQL_update_zakaz.Add('FROM zakaz_details zd JOIN product p ON zd.product_id = p.product_id ');
   SQL_update_zakaz.Add('JOIN creator c ON zd.creator_id = c.creator_id ');
   SQL_update_zakaz.Add('JOIN transport t ON zd.transport_id = t.transport_id ');
   SQL_update_zakaz.Add('WHERE zd.zakaz_id='+zakazId);
    Memo1.Lines.Assign(SQL_update_zakaz);
    dm.DBListView(ListView2,SQL_update_zakaz,ZConnection3,0);
      Button3.Visible:=false;
      Button5.Visible:=true;
  end;
    FInsert: begin
      Button3.Visible:=true;
      Button5.Visible:=false;
    end;
 end;//case

  SQL_dostavka.Add('SELECT d.dostavka_adress, d.dostavka_person, d.dostavka_telefon, d.dostavka_id FROM dostavka d');
  SQL_Transport.Add('select transport_model, tonag, transport_price, transport_number, driver_telefon, transport_id from transport');
  SQL_nomenklatura.Add('SELECT p.product_name, p.volume, p.weight, c.creator_name, c.creator_adress ,n.price, n.creator_id, n.product_id ');
  SQL_nomenklatura.Add('FROM nomenklatura n join product p on p.product_id=n.product_id ');
  SQL_nomenklatura.Add('join creator c on c.creator_id=n.creator_id ');
 dm.DBListView(ListView1,SQL_nomenklatura,dm.ZConnection1,2);
 dm.DBListView(ListView3,SQL_Transport,ZConnection1,1);
 dm.DBListView(ListView4,SQL_dostavka,ZConnection2,1);
end;

procedure TForm9.SpeedButton1Click(Sender: TObject);
begin
 Panel1.Visible:=not(Panel1.Visible);

end;

procedure TForm9.ListView3SelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
 Label3.Caption:=item.Caption+';Тонаж='+
        item.SubItems.Strings[0]+';Цена='+#10#13+
        item.SubItems.Strings[1]+';Номер машины='+
        item.SubItems.Strings[2];
 TransportId:=item.SubItems.Strings[4];
end;

procedure TForm9.ListView1SelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
var
 count:integer;
begin
 count:=Item.SubItems.Count;
 Edit2.Text:=Item.SubItems.Strings[count-3];
 Label8.Caption:=Item.Caption+','+Item.SubItems.CommaText;
end;

procedure TForm9.SpeedButton2Click(Sender: TObject);
begin
 Panel2.Visible:= not Panel2.Visible;
 if not Panel2.Visible then
  begin
   panel3.Visible:=false;
  end;
end;

procedure TForm9.SpeedButton3Click(Sender: TObject);
begin
  panel3.Visible:=not panel3.Visible;
end;

procedure TForm9.ListView4SelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
var
 count:integer;
begin
  Label6.Caption:=Item.Caption;
  count:=Item.SubItems.Count;
  dostavkaId:=Item.SubItems.Strings[count-1];
end;

procedure TForm9.N3Click(Sender: TObject);
begin
 Listview2.Items.Delete(Listview2.Selected.Index);
// ListZakazInsert.
end;

procedure TForm9.Button3Click(Sender: TObject);
var
 zQuery:TZQuery;
 SQLtext:string;
 i,count:integer;
 Creator_id, transport_id, product_id,price,zakaz_count:string;
begin
  try
   ZConnection1.Connected:=true;
   ZConnection1.StartTransaction;
   SQLtext:='INSERT INTO zakaz (zakaz_info, zakaz_date, dostavka_id) VALUES ('''+LabeledEdit1.Text+''', '''+FormatDateTime('yyyy-mm-dd',DateTimePicker1.Date)+''', '+dostavkaId+')';
   zQuery:=TZQuery.Create(DM);
   ZQuery.Connection:=ZConnection1;
   ZQuery.SQL.Clear;
   ZQuery.SQL.Add(SQLtext);
   ZQuery.ExecSQL;
     SQLtext:='select LAST_INSERT_ID() as zakaz_id';
   ZQuery.Active:=false;
   ZQuery.SQL.Clear;
   ZQuery.SQL.Add(SQLtext);
   ZQuery.Active:=true;
    ZakazId:=ZQuery.Fields[0].AsString;
   for i:=0 to ListView2.Items.Count-1 do begin
     count:=ListView2.Items[i].SubItems.Count;
     price:=ListView2.Items[i].SubItems.Strings[count-5];
     price:=dm.ReplaceStr(price,',','.');
     zakaz_count:=ListView2.Items[i].SubItems.Strings[count-4];
     Creator_id:=ListView2.Items[i].SubItems.Strings[count-3];
     product_id:=ListView2.Items[i].SubItems.Strings[count-2];
     transport_id:=ListView2.Items[i].SubItems.Strings[count-1];
     SQLtext:='insert INTO zakaz_details (creator_id,zakaz_id,transport_id,product_id,count,price) '+
            'VALUES ('+Creator_id+','+ZakazId+','+transport_id+','+product_id+','+zakaz_count+','+price+')';
     Memo1.Lines.Add(SQLtext);
     ZQuery.Active:=false;
     ZQuery.SQL.Clear;
     ZQuery.SQL.Add(SQLtext);
     ZQuery.ExecSQL;
   end;//for
    ZConnection1.Commit;
    ZQuery.Active:=false;
    ZQuery.Free;
 except
      on E: Exception do begin
                          //ShowMessage(E.Message);
                          Form10:=TForm10.Create(Form1);
                          Form10.Label1.Caption:=E.Message;
                          Form10.ShowModal;
                          form10.Free;
                          end;
 end;
end;

procedure TForm9.ListView4DblClick(Sender: TObject);
var
 count:integer;
begin
 Panel3.Hide;
  Label6.Caption:=ListView4.Selected.Caption;
  count:=ListView4.Items.Count;
  dostavkaId:=ListView4.Selected.SubItems.Strings[count-1];
end;

procedure TForm9.Button5Click(Sender: TObject);
var
 SQLtext,price,zakaz_count,Creator_id,product_id,transport_id:string;
 zQuery:TZQuery;
 i,count:integer;
begin
 try
  ZConnection1.Connected:=true;
  ZConnection1.StartTransaction;
   SQLtext:='DELETE FROM zakaz_details where zakaz_id='+ZakazId;
   zQuery:=TZQuery.Create(DM);
   ZQuery.Connection:=ZConnection1;
   ZQuery.SQL.Clear;
   ZQuery.SQL.Add(SQLtext);
   ZQuery.ExecSQL;
   for i:=0 to ListView2.Items.Count-1 do begin
    count:=ListView2.Items[i].SubItems.Count;
    price:=ListView2.Items[i].SubItems.Strings[count-5];
    price:=dm.ReplaceStr(price,',','.');
    zakaz_count:=ListView2.Items[i].SubItems.Strings[count-4];
    Creator_id:=ListView2.Items[i].SubItems.Strings[count-3];
    product_id:=ListView2.Items[i].SubItems.Strings[count-2];
    transport_id:=ListView2.Items[i].SubItems.Strings[count-1];
   SQLtext:='insert INTO zakaz_details (creator_id,zakaz_id,transport_id,product_id,count,price) '+
            'VALUES ('+Creator_id+','+ZakazId+','+transport_id+' ,'+product_id+','+zakaz_count+','+price+')';
   Memo1.Lines.Add(SQLtext);
   ZQuery.Active:=false;
   ZQuery.SQL.Clear;
   ZQuery.SQL.Add(SQLtext);
   ZQuery.ExecSQL;
  end;//for
  ZConnection1.Commit;
  ZQuery.Active:=false;
  ZQuery.Free;
 except
      on E: Exception do begin
                          //ShowMessage(E.Message);
                          Form10.Label1.Caption:=E.Message;
                          Form10.ShowModal;
                         end;
 end;

end;

procedure TForm9.ListView2SelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
var
 count:integer;
begin
 Count:=Item.SubItems.count;
 Edit3.Text:=Item.SubItems.Strings[count-4];
 Edit4.Text:=Item.SubItems.Strings[count-5];
end;

procedure TForm9.Button4Click(Sender: TObject);
var
 count:integer;
begin
 count:=ListView2.Selected.SubItems.Count;
 ListView2.Selected.SubItems.Strings[count-4]:=Edit3.Text;
 ListView2.Selected.SubItems.Strings[count-5]:=Edit4.Text;
end;

procedure TForm9.Edit3Change(Sender: TObject);
begin
 Edit3.Text:=dm.FilterFloatStr(Edit3.Text);
end;

procedure TForm9.Edit4Change(Sender: TObject);
begin
 Edit4.Text:=dm.FilterFloatStr(Edit4.Text);
end;

procedure TForm9.Edit1Change(Sender: TObject);
begin
  Edit1.Text:=dm.FilterStr(Edit1.Text);
end;

procedure TForm9.Edit2Change(Sender: TObject);
begin
 Edit2.Text:=dm.FilterFloatStr(Edit2.Text);
end;

end.
