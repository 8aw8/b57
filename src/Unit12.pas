unit Unit12;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, ZConnection, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Unit2, Menus, ExtCtrls,
  Grids, OleServer, ExcelXP, Unit3, Excel2000;

type
  TForm12 = class(TForm)
    ListView1: TListView;
    ListView2: TListView;
    GroupBox1: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    GroupBox2: TGroupBox;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    Label3: TLabel;
    StaticText1: TStaticText;
    ListView3: TListView;
    ZConnection1: TZConnection;
    ZConnection2: TZConnection;
    ZConnection3: TZConnection;
    ZQuery1: TZQuery;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    Label4: TLabel;
    Memo1: TMemo;
    StringGrid1: TStringGrid;
    Button7: TButton;
    Button3: TButton;
    ZConnection4: TZConnection;
    Label5: TLabel;
    PopupMenu2: TPopupMenu;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    Edit2: TEdit;
    StaticText2: TStaticText;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    PopupMenu3: TPopupMenu;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    Label9: TLabel;
    ExcelApplication1: TExcelApplication;
    Button4: TButton;
    Label10: TLabel;
    N17: TMenuItem;
    Shape1: TShape;
    DateTimePicker1: TDateTimePicker;
    Button5: TButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ListView3DblClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure StringGrid1SetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure N3Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Edit2Change(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
   SQL_dostavka:TStringList;
   SQL_nomenklatura:TStringList;
   SQL_text:TStringList;
     { Private declarations }
   price,position:string;
     id:TId;
     firstString:boolean;
     positionCount,dostavkaId,CreatorId,transport_id,product_id,zakaz_count,zakaz_date,priceDate:string;
     tonag,summa,Price_tonna,summa_all:double;
     Thread:TDBThread;

   function FindItems(FindItem:TListItem):TListItem;
   function FindItemsCells(FindItem:TListItem):integer;
   procedure UpdateResult;
   procedure FindNomenklatura;
   procedure FindNomenklatura2;
  public
    status:TStatus;
    ZakazId:string;
    List:TStringList;
    { Public declarations }
  end;

var
  Form12: TForm12;

implementation

{$R *.dfm}

uses Unit13, Unit10, Unit1, Unit11, Unit15, Unit14, Unit18, Unit30;

procedure TForm12.UpdateResult;
var
 i:integer; Fcount,FSumma,FTonag, FTransport :single;
begin
  if firstString then begin
     Summa:=0;
     tonag:=0;
    for i:=1 to StringGrid1.RowCount-1 do begin
      StringGrid1.Cells[0,i]:=IntToStr(i);
      if StringGrid1.Cells[2,i]='' then Fcount:=0 else Fcount:=StrToFloat(dm.ReplaceStr(StringGrid1.Cells[2,i],'.',','));
      if StringGrid1.Cells[3,i]='' then FTonag:=0 else FTonag:=StrToFloat(dm.ReplaceStr(StringGrid1.Cells[3,i],'.',','));
      if StringGrid1.Cells[6,i]='' then FSumma:=0 else FSumma:=StrToFloat(dm.ReplaceStr(StringGrid1.Cells[6,i],'.',','));
         StringGrid1.Cells[7,i]:=floatToStr(round(Fcount*FTonag*1000)/1000);
      tonag:=tonag + Fcount*FTonag;
      summa:=summa + Fcount*FSumma;
    end;//for i
      Label4.Caption:='Тонаж заказа '+ FloatToStr(round(tonag*1000)/1000) +' т.';
      Label5.Caption:='Итого без учета доставки '+ FloatToStr(round(Summa*100)/100)+' руб.';

      if round(tonag/20)=0 then Label6.Caption:='Ориентировочно 1 машина 20 т.'
                           else begin
                            Label6.Caption:='Ориентировочно '+IntToStr(trunc(tonag/20)+1)+' машина 20 т.';
//                            if (tonag-round(tonag/20)*20)>0 then Label7.Caption:='Перегруз '+ floatToStr(tonag-round(tonag/20)*20)+ 'т.';
                           end;
     if Edit2.Text='' then FTransport:=0 else FTransport:=StrToFloat(dm.ReplaceStr(Edit2.Text,'.',','));



     if tonag=0 then Price_tonna:=0 else Price_tonna:=((trunc(tonag/20)+1)*FTransport)/tonag;

     Label9.Caption:='Стоимость доставки 1 тонны '+floatToStr(round(Price_tonna*100)/100)+' руб.';

     summa_all:=0;

     for i:=1 to StringGrid1.RowCount-1 do begin
       if StringGrid1.Cells[2,i]='' then Fcount:=0 else Fcount:=StrToFloat(dm.ReplaceStr(StringGrid1.Cells[2,i],'.',','));
       if StringGrid1.Cells[6,i]='' then FSumma:=0 else FSumma:=StrToFloat(dm.ReplaceStr(StringGrid1.Cells[6,i],'.',','));
       if StringGrid1.Cells[3,i]='' then FTonag:=0 else FTonag:=StrToFloat(dm.ReplaceStr(StringGrid1.Cells[3,i],'.',','));
       StringGrid1.Cells[8,i]:=floatToStr(round((FSumma+FTonag*Price_tonna)*100)/100);
       summa_all:=summa_all+(Fcount*FSumma+Fcount*FTonag*Price_tonna);
     end;//for i
      Label10.Caption:='Стоимость заказа с доставкой '+floatToStr(round(summa_all*100)/100)+' руб.';
   end;

end;


procedure TForm12.FindNomenklatura;
var
 i:integer;s:string;
 item:TListItem; datePrice:TDate;
begin
   datePrice:=DateTimePicker1.Date-1;

  ListView2.Items.Clear;
 if Edit1.Text='' then
  for i:=0 to ListView1.Items.Count-1 do begin
   s:=ListView1.Items[i].SubItems.Strings[ListView1.Items[i].SubItems.Count-3];
 //              sleep(30);
 //  memo1.Lines.Add(DateToStr(datePrice)+'<='+  DateToStr(strToDate(ListView1.Items[i].SubItems.Strings[4])) );

   if (((ComboBox1.Items.Objects[ComboBox1.ItemIndex] as TId).ID=s) or ((ComboBox1.Items.Objects[ComboBox1.ItemIndex] as TId).ID='-1')) and
        (datePrice<=strToDate(ListView1.Items[i].SubItems.Strings[4]))  then begin
    Item:=ListView2.Items.Add;
    Item.Caption:=ListView1.Items[i].Caption;
    Item.SubItems.AddStrings(ListView1.Items[i].SubItems);
   end;//if
  end//for
 else
 for i:=0 to ListView1.Items.Count-1 do begin
   //      sleep(30);
    s:=ListView1.Items[i].SubItems.Strings[ListView1.Items[i].SubItems.Count-3];
  if  (datePrice<=strToDate(ListView1.Items[i].SubItems.Strings[4])) and
      (pos(edit1.Text, ListView1.Items[i].Caption)>0)  and
      (((ComboBox1.Items.Objects[ComboBox1.ItemIndex] as TId).ID=s) or ((ComboBox1.Items.Objects[ComboBox1.ItemIndex] as TId).ID='-1'))
   then begin
    Item:=ListView2.Items.Add;
    Item.Caption:=ListView1.Items[i].Caption;
    Item.SubItems.AddStrings(ListView1.Items[i].SubItems);
   end;//if
 end;//for
end;

procedure TForm12.FindNomenklatura2;
var
 i:integer;s:string;
 item:TListItem; datePrice:TDate;
begin
   datePrice:=DateTimePicker1.Date-1;

  ListView2.Items.Clear;
 if Edit1.Text='' then
  for i:=0 to ListView1.Items.Count-1 do begin
   s:=ListView1.Items[i].SubItems.Strings[ListView1.Items[i].SubItems.Count-3];

 //  memo1.Lines.Add(DateToStr(datePrice)+'<='+  DateToStr(strToDate(ListView1.Items[i].SubItems.Strings[4])) );

   if (((ComboBox1.Items.Objects[ComboBox1.ItemIndex] as TId).ID=s) or ((ComboBox1.Items.Objects[ComboBox1.ItemIndex] as TId).ID='-1')) and
        (datePrice<=strToDate(ListView1.Items[i].SubItems.Strings[4]))  then begin
    Item:=ListView2.Items.Add;
    Item.Caption:=ListView1.Items[i].Caption;
    Item.SubItems.AddStrings(ListView1.Items[i].SubItems);
   end;//if
  end//for
 else
 for i:=0 to ListView1.Items.Count-1 do begin
    s:=ListView1.Items[i].SubItems.Strings[ListView1.Items[i].SubItems.Count-3];
  if  (datePrice<=strToDate(ListView1.Items[i].SubItems.Strings[4])) and
      (pos(edit1.Text, ListView1.Items[i].Caption)>0)  and
      (((ComboBox1.Items.Objects[ComboBox1.ItemIndex] as TId).ID=s) or ((ComboBox1.Items.Objects[ComboBox1.ItemIndex] as TId).ID='-1'))
   then begin
    Item:=ListView2.Items.Add;
    Item.Caption:=ListView1.Items[i].Caption;
    Item.SubItems.AddStrings(ListView1.Items[i].SubItems);
   end;//if
 end;//for
end;


function TForm12.FindItems;
var
 Item:TListItem;
 i,count:integer;
begin
 i:=0;
  result:=nil;
 if not(FindItem=nil) then begin
  while (i<=ListView1.Items.Count-1) do begin
   Item:=ListView1.Items[i];
   count:=item.SubItems.Count;
     if ((Item.SubItems.Strings[count-1]=FindItem.SubItems.Strings[count-1])and(Item.SubItems.Strings[count-2]=FindItem.SubItems.Strings[count-2])) then
   begin
    result:=Item;
     i:=ListView2.Items.Count;
   //  Memo1.Lines.Add('exit');
   end;
   inc(i);
  end;//while
 end;//if
end;

function TForm12.FindItemsCells;
var
 List:TStrings;
 i,count,CCount:integer;
begin
 result:=-1;
 i:=1;
 if not(FindItem=nil) then begin
  while (i<=StringGrid1.RowCount-1) do begin
     List:=StringGrid1.Rows[i];
     CCount:=StringGrid1.ColCount;
     count:=FindItem.SubItems.Count;
     if ((List.Strings[Ccount-1]=FindItem.SubItems.Strings[count-1])and(List.Strings[Ccount-2]=FindItem.SubItems.Strings[count-2])) then
   begin
    result:=i;
     i:=StringGrid1.RowCount+1;
   //  Memo1.Lines.Add('exit');
   end;
   inc(i);
  end;//while
 end;//if
end;


procedure TForm12.SpeedButton1Click(Sender: TObject);
begin
 ListView3.Visible:= not ListView3.Visible;
end;

procedure TForm12.FormActivate(Sender: TObject);
var
 i:integer;
begin

 Shape1.Brush:=Form1.Shape1.Brush;

  Label3.Caption:='Не выбран';
   Button1.Visible:=true;
   Button3.Visible:=false;
  for i:=1 to StringGrid1.RowCount do begin
   StringGrid1.Rows[i].Clear;
  end;//for i
  StringGrid1.RowCount:=2;
  firstString:=false;

 transport_id:=' null ';
 firstString:=false;
 dostavkaId:=' null ';

  StringGrid1.Cells[0,0]:='№';
  StringGrid1.Cells[1,0]:='Наименование';
  StringGrid1.Cells[2,0]:='Количество';
  StringGrid1.Cells[3,0]:='Вес одной штуки, т.';
  StringGrid1.Cells[4,0]:='Цена закупки, руб';
  StringGrid1.Cells[5,0]:='Наценка, %';
  StringGrid1.Cells[6,0]:='Цена без доставки, руб';
  StringGrid1.Cells[7,0]:='Тонаж';
  StringGrid1.Cells[8,0]:='Цена с доставкой, руб';
  StringGrid1.Cells[9,0]:='Дата формирования цены';
  StringGrid1.ColWidths[10]:=-1;
  StringGrid1.ColWidths[11]:=-1;
  StringGrid1.ColWidths[12]:=-1;


 ListView3.Visible:=false;
 SQL_dostavka:=TStringList.Create;
 SQL_nomenklatura:=TStringList.Create;
 SQL_text:=TStringList.Create;
 SQL_text.Clear;
 SQL_dostavka.Clear;
 SQL_dostavka.Add('select d.dostavka_person as "Заказчик", d.dostavka_adress as "Адрес", d.dostavka_telefon as "Телефон", d.dostavka_id from dostavka d');
  ZConnection1.HostName:=dm.ZConnection1.HostName;
  ZConnection1.Database:=dm.ZConnection1.Database;
  ZConnection1.Catalog:=dm.ZConnection1.Catalog;
  ZConnection1.User:=dm.ZConnection1.User;
  ZConnection1.Password:=dm.ZConnection1.Password;
  ZConnection1.Connected:=true;
    ZConnection3.HostName:=dm.ZConnection1.HostName;
    ZConnection3.Database:=dm.ZConnection1.Database;
    ZConnection3.Catalog:=dm.ZConnection1.Catalog;
    ZConnection3.User:=dm.ZConnection1.User;
    ZConnection3.Password:=dm.ZConnection1.Password;
    ZConnection3.Connected:=true;
// dm.DBListView(ListView3,SQL_dostavka, ZConnection1,1);
 //  SQL_nomenklatura.Clear;
 //  SQL_nomenklatura.Add('select p.product_name as "Изделие", p.volume as "Объем", p.weight as "Вес", c.creator_name as "Производитель", n.price "Закупочная цена", p.category_id, n.creator_id, n.product_id');
 //  SQL_nomenklatura.Add('from nomenklatura n join creator c on n.creator_id=c.creator_id');
 //  SQL_nomenklatura.Add('join product p on n.product_id=p.product_id');
 //  SQL_nomenklatura.Add('left join product_category pc on p.category_id=pc.category_id');
    ZConnection2.HostName:=dm.ZConnection1.HostName;
    ZConnection2.Database:=dm.ZConnection1.Database;
    ZConnection2.Catalog:=dm.ZConnection1.Catalog;
    ZConnection2.User:=dm.ZConnection1.User;
    ZConnection2.Password:=dm.ZConnection1.Password;
    ZConnection2.Connected:=true;
     ZConnection4.HostName:=dm.ZConnection1.HostName;
     ZConnection4.Database:=dm.ZConnection1.Database;
     ZConnection4.Catalog:=dm.ZConnection1.Catalog;
     ZConnection4.User:=dm.ZConnection1.User;
     ZConnection4.Password:=dm.ZConnection1.Password;
     ZConnection4.Connected:=true;
//  dm.DBListView(ListView1,SQL_nomenklatura, ZConnection4,3);
//  ListView1:=form1.ListView;
//  dm.CopyListView(form1.ListView,ListView1);
  ListView1.Items:=form1.ListView.Items;
  ListView1.Columns:=form1.ListView.Columns;
  dm.CopyListView(form1.ListView,ListView2);


//  dm.CopyListView(form1.ListViewDostavka,ListView3);
  ListView3.Items:=form1.ListViewDostavka.Items;
  ListView3.Columns:=form1.ListViewDostavka.Columns;

   ComboBox1.Items.AddStrings(Form1.ComboBoxCategory.Items);
   ComboBox1.ItemIndex:=0;

   DateTimePicker1.Date:=now;





//  dm.DBListView(ListView2,SQL_nomenklatura, ZConnection2,3);
{

 ZQuery1.Active:=false;
 ZQuery1.SQL.Clear;
 ZQuery1.SQL.Add('select name_category,category_id from product_category');
 ZQuery1.Active:=true;

  id:=TId.Create;
  id.ID:='-1';
  ComboBox1.Items.Clear;
  ComboBox1.Items.AddObject('Все',id);
  ComboBox1.ItemIndex:=0;

  ZQuery1.First;
 while not(ZQuery1.Eof) do begin
  id:=TId.Create;
  id.ID:=ZQuery1.FieldByName('category_id').AsString;
  ComboBox1.Items.AddObject(ZQuery1.FieldByName('name_category').AsString,id);
  ZQuery1.Next;
 end;//while
}




 if status=FUpdate then begin
    Button1.Visible:=false;
    Button3.Visible:=true;
    SQL_text.Clear;
    SQL_text.Add(' SELECT zd.position as "№", p.product_name as "Наименование", zd.count as "Количество", p.weight as "Вес одной штуки, т." , n.price as "Цена закупки, руб", (round((zd.price / n.price),2)  - 1)*100 as "Наценка, %", zd.price as "Цена без доставки, руб", ');
    SQL_text.Add(' zd.count*p.weight as "Тонаж",  0 as "Цена с доставкой, руб",  zd.pricedate as "Дата формирования цены", zd.creator_id, zd.product_id, zd.pricedate');
    SQL_text.Add(' FROM zakaz_details zd');
    SQL_text.Add(' JOIN nomenklatura n ON zd.product_id = n.product_id AND zd.creator_id = n.creator_id and zd.pricedate=n.pricedate');
    SQL_text.Add(' JOIN product p ON zd.product_id = p.product_id');
    SQL_text.Add(' where zd.zakaz_id='+zakazId);
    SQL_text.Add(' order by zd.position');
    dm.DBStringGridView(StringGrid1,SQL_text,ZConnection3,3);

  //  StringGrid1.ColWidths[9]:=-1;
  //  StringGrid1.ColWidths[10]:=-1;

    if StringGrid1.RowCount=2 then firstString:=true;

     Summa:=0;
     tonag:=0;

    if StringGrid1.RowCount=1 then
     begin
       StringGrid1.RowCount:=2;
       StringGrid1.FixedRows:=1;
     end;
    if StringGrid1.RowCount>2 then firstString:=true;
     ZQuery1.Active:=false;
       ZQuery1.SQL.Clear;
       ZQuery1.SQL.Add(' SELECT d.dostavka_id, d.dostavka_person, d.dostavka_adress, d.dostavka_telefon, z.zakaz_date, z.mashine_price');
       ZQuery1.SQL.Add(' FROM zakaz z left join dostavka d on z.dostavka_id=d.dostavka_id');
       ZQuery1.SQL.Add(' where z.zakaz_id='+zakazId);
     ZQuery1.Active:=true;
     //ZQuery1.First;
      Label3.Caption:=ZQuery1.FieldByName('dostavka_person').AsString+', '+ZQuery1.FieldByName('dostavka_adress').AsString+', '+ZQuery1.FieldByName('dostavka_telefon').AsString;
      dostavkaId:=ZQuery1.FieldByName('dostavka_id').AsString;
      if dostavkaId='' then dostavkaId:='null ';
      zakaz_date:=ZQuery1.FieldByName('zakaz_date').AsString;
      DateTimePicker1.Date:=ZQuery1.FieldByName('zakaz_date').AsDateTime;

      Label8.Caption:='Заказ № '+Zakazid+' от '+zakaz_date;
      Edit2.Text:=ZQuery1.FieldByName('mashine_price').AsString;
      UpdateResult;
 end;//if
   FindNomenklatura;

end;

procedure TForm12.FormDeactivate(Sender: TObject);
var
 i:integer;
begin
// Button3Click(Button3);
 for i:=0 to ComboBox1.Items.Count-1 do begin
     id:=(ComboBox1.Items.Objects[i] as TId);
   if (id=nil) then id.Free;
 end;//for
 SQL_dostavka.Free;
 SQL_text.Free;
end;

procedure TForm12.Button3Click(Sender: TObject);
var
  SQLtext:string; i,RowCount,ColCount:integer;
begin
 try
   ZConnection3.Connected:=true;
   ZConnection3.StartTransaction;
    SQLtext:='update zakaz set dostavka_id='+dostavkaId+', mashine_price='+Edit2.Text+' where zakaz_id='+ZakazId;
    Memo1.Lines.Add(SQLtext);
     ZQuery1.SQL.Clear;
     ZQuery1.SQL.Add(SQLtext);
     ZQuery1.ExecSQL;
    SQLtext:='delete from zakaz_details where zakaz_id='+ZakazId;
    Memo1.Lines.Add(SQLtext);
   ZQuery1.Active:=false;
   ZQuery1.SQL.Clear;
   ZQuery1.SQL.Add(SQLtext);
   ZQuery1.ExecSQL;
// Добавление списка заказа
    RowCount:=StringGrid1.RowCount;
    ColCount:=StringGrid1.ColCount;
  if (firstString=true) then
   for i:=1 to RowCount-1 do begin
    CreatorId:=StringGrid1.Rows[i].Strings[ColCount-3];
    product_id:=StringGrid1.Rows[i].Strings[ColCount-2];
    zakaz_count:=StringGrid1.Rows[i].Strings[2];
    price:= dm.NumFormat(StringGrid1.Rows[i].Strings[6]);
    position:=StringGrid1.Rows[i].Strings[0];
    priceDate:=FormatDateTime('yyyy-mm-dd', StrToDate(StringGrid1.Rows[i].Strings[ColCount-1]));

    ZQuery1.SQL.Clear;
    SQLtext:='insert INTO zakaz_details (creator_id,zakaz_id, priceDate, transport_id,product_id,count,price, position) '+
            'VALUES ('+CreatorId+','+ZakazId+','''+priceDate+''','+transport_id+','+product_id+','+zakaz_count+','+price+', '+position+')';
    Memo1.Lines.Add(SQLtext);

    ZQuery1.SQL.Add(SQLtext);
    ZQuery1.ExecSQL;
   end;//for
    ZConnection3.Commit;
 except
      on E: Exception do begin
                          //ShowMessage(E.Message);
                          Form10:=TForm10.Create(Form1);
                          Form10.Label1.Caption:=E.Message;
                          Form10.ShowModal;
                          form10.Free;
                          end;
 end;
   ZConnection3.Connected:=false;
end;

procedure TForm12.Button1Click(Sender: TObject);
var
 SQLtext:string; i,RowCount,ColCount:integer;
begin
 if dostavkaid=' null ' then
  begin
    ShowMessage('Выбирите заказчика');
  end
 else begin
   try
   ZConnection3.Connected:=true;
   ZConnection3.StartTransaction;
   SQLtext:='INSERT INTO zakaz (zakaz_date, dostavka_id, mashine_price) VALUES ('''+FormatDateTime('yyyy-mm-dd',now)+''', '+dostavkaId+', '+Edit2.Text+')';
   Memo1.Lines.Add(SQLtext);
   ZQuery1.SQL.Clear;
   ZQuery1.SQL.Add(SQLtext);
   ZQuery1.ExecSQL;
     SQLtext:='select LAST_INSERT_ID() as zakaz_id';
   ZQuery1.Active:=false;
   ZQuery1.SQL.Clear;
   ZQuery1.SQL.Add(SQLtext);
   ZQuery1.Active:=true;
    ZakazId:=ZQuery1.Fields[0].AsString;
// Добавление списка заказа
    RowCount:=StringGrid1.RowCount;
    ColCount:=StringGrid1.ColCount;
   for i:=1 to RowCount-1 do begin
    CreatorId:=StringGrid1.Rows[i].Strings[ColCount-3];
    product_id:=StringGrid1.Rows[i].Strings[ColCount-2];
    zakaz_count:=StringGrid1.Rows[i].Strings[2];
    price:= dm.NumFormat(StringGrid1.Rows[i].Strings[6]);
    position:=StringGrid1.Rows[i].Strings[0];
    priceDate:=FormatDateTime('yyyy-mm-dd', StrToDate(StringGrid1.Rows[i].Strings[ColCount-1]));

    ZQuery1.SQL.Clear;
    SQLtext:='insert INTO zakaz_details (creator_id,zakaz_id, priceDate, transport_id,product_id,count,price, position) '+
             'VALUES ('+CreatorId+','+ZakazId+','''+priceDate+''','+transport_id+','+product_id+','+zakaz_count+','+price+', '+position+')';
    Memo1.Lines.Add(SQLtext);
    ZQuery1.SQL.Add(SQLtext);
    ZQuery1.ExecSQL;

   end;//for
    ZConnection3.Commit;
 except
      on E: Exception do begin
                          //ShowMessage(E.Message);
                          Form10:=TForm10.Create(Form1);
                          Form10.Label1.Caption:=E.Message;
                          Form10.ShowModal;
                          form10.Free;
                          end;
 end;
   ZConnection3.Connected:=false;
   Form12.Close;
 end;
end;

procedure TForm12.ListView3DblClick(Sender: TObject);
var
 count:integer;
begin
 if not(ListView3.Selected=nil) then begin
    count:=ListView3.Selected.SubItems.Count;
    dostavkaId:=ListView3.Selected.SubItems.Strings[count-1];
    Label3.Caption:=ListView3.Selected.Caption;
    ListView3.Visible:=false;
 end;//if
end;

procedure TForm12.ComboBox1Change(Sender: TObject);
begin
  if  not(Thread=nil) then begin
   Thread.StopThread:=true;
   Thread:=dm.findListView(ListView1,ListView2, DateTimePicker1.Date, Edit1.Text,(ComboBox1.Items.Objects[ComboBox1.ItemIndex] as TId).ID);
  end
  else
   Thread:=dm.findListView(ListView1,ListView2, DateTimePicker1.Date, Edit1.Text,(ComboBox1.Items.Objects[ComboBox1.ItemIndex] as TId).ID);
// FindNomenklatura;
end;
{var
 i:integer;
 item:TListItem;
 s:string;
begin
 ListView2.Items.Clear;
 if (ComboBox1.Items.Objects[ComboBox1.ItemIndex] as TId).ID='-1' then
  for i:=0 to ListView1.Items.Count-1 do begin
    Item:=ListView2.Items.Add;
    Item.Caption:=ListView1.Items[i].Caption;
    Item.SubItems.AddStrings(ListView1.Items[i].SubItems);
  end//for
 else
 for i:=0 to ListView1.Items.Count-1 do begin
   s:=ListView1.Items[i].SubItems.Strings[ListView1.Items[i].SubItems.Count-3];
   Memo1.Lines.Add(s);
   if ((ComboBox1.Items.Objects[ComboBox1.ItemIndex] as TId).ID=s)
   then begin
    Item:=ListView2.Items.Add;
    Item.Caption:=ListView1.Items[i].Caption;
    Item.SubItems.AddStrings(ListView1.Items[i].SubItems);
   end;//if
 end;//for

{
 ListView2.Items.Clear;
 //Edit1.Text:=(ComboBox1.Items.Objects[ComboBox1.ItemIndex] as TId).ID;
   if (ComboBox1.Items.Objects[ComboBox1.ItemIndex] as TId).ID='-1' then where:=''
   else where:='where p.category_id ='+(ComboBox1.Items.Objects[ComboBox1.ItemIndex] as TId).ID;

   SQL_nomenklatura.Clear;
   SQL_nomenklatura.Add(' select p.product_name, p.volume, p.weight, c.creator_name, c.creator_adress, n.price, p.category_id, n.creator_id, n.product_id');
   SQL_nomenklatura.Add(' from nomenklatura n join creator c on n.creator_id=c.creator_id');
   SQL_nomenklatura.Add(' join product p on n.product_id=p.product_id');
   SQL_nomenklatura.Add(' left join product_category pc on p.category_id=pc.category_id');
   SQL_nomenklatura.Add(where);
   dm.DBListView(ListView2,SQL_nomenklatura, ZConnection2,0);

end;
  }
procedure TForm12.Button6Click(Sender: TObject);
var
 List:TStringList;
begin

// StringGrid1.Rows[StringGrid1.RowCount-1].Assign(ListView2.Selected.SubItems);
// StringGrid1.Rows[StringGrid1.RowCount-1].Insert(0,ListView2.Selected.Caption);
 //Memo1.Lines.Assign(StringGrid1.Rows[StringGrid1.RowCount-1]);
// StringGrid1.RowCount:=StringGrid1.RowCount+1;

   // StringGrid1.Rows[StringGrid1.RowCount-1].a

  List:=TStringList.Create;
  List.Assign(ListView2.Selected.SubItems);
  List.Insert(0,ListView2.Selected.Caption);
  StringGrid1.Rows[StringGrid1.RowCount-1].Assign(List);
  StringGrid1.RowCount:=StringGrid1.RowCount+1;
  StringGrid1.ColWidths[StringGrid1.ColCount-1]:=-1;
  StringGrid1.ColWidths[StringGrid1.ColCount-2]:=-1;
  List.Clear;
  List.Free;
  Memo1.Lines.Assign(StringGrid1.Rows[StringGrid1.RowCount-2]);
end;

procedure TForm12.Button7Click(Sender: TObject);
var
 ItemCount,RCount,row :integer;
 item:TlistItem;
begin
 item:=ListView2.Selected;
 if not(item=nil) then begin
  row:=FindItemsCells(item);
  if not(row=-1) then ShowMessage('Позиция уже существует.')
  else begin
     Form15.ShowModal;
     if Form15.formResult=0 then begin
         positionCount:=Form15.Edit1.Text;
         ItemCount:=ListView2.Selected.SubItems.Count;
         //   if StringGrid1.RowCount>=2 then StringGrid1.RowCount:=StringGrid1.RowCount+1;
          if firstString then StringGrid1.RowCount:=StringGrid1.RowCount+1 else firstString:=true;
          rCount:=StringGrid1.RowCount;
           StringGrid1.Rows[RCount-1].Add(intTostr(StringGrid1.RowCount-1));
           StringGrid1.Rows[RCount-1].Add(item.Caption);
           StringGrid1.Rows[RCount-1].Add(positionCount);
           StringGrid1.Rows[RCount-1].Add(ListView2.Selected.SubItems.Strings[ItemCount-8]); //wight
           StringGrid1.Rows[RCount-1].Add(ListView2.Selected.SubItems.Strings[ItemCount-6]); //price
           StringGrid1.Rows[RCount-1].Add('0');
           StringGrid1.Rows[RCount-1].Add(ListView2.Selected.SubItems.Strings[ItemCount-6]); //price
           StringGrid1.Rows[RCount-1].Add('0');   //tonage
           StringGrid1.Rows[RCount-1].Add('0');    //price+transport
           StringGrid1.Rows[RCount-1].Add(ListView2.Selected.SubItems.Strings[ItemCount-4]);    //priceDate
           StringGrid1.Rows[RCount-1].Add(ListView2.Selected.SubItems.Strings[ItemCount-2]);
           StringGrid1.Rows[RCount-1].Add(ListView2.Selected.SubItems.Strings[ItemCount-1]);
           StringGrid1.Rows[RCount-1].Add(ListView2.Selected.SubItems.Strings[ItemCount-4]);
  //   StringGrid1.MouseToCell();
  //  if StringGrid1.RowCount=2 then StringGrid1.RowCount:=StringGrid1.RowCount+1;
      UpdateResult;
      end;// if Form15.formResult=0
    end;//if (row=-1) .. else

 end;//if


end;

procedure TForm12.Button2Click(Sender: TObject);
var
 i:integer;
begin
  if MessageBox(Form12.Handle,'Вы, действительно, хотите очистить весь заказ?','Предупреждение, очистка заказа',MB_OKCANCEL)=IDOK then begin
 //MB_OKCANCEL
    for i:=1 to StringGrid1.RowCount do begin
      StringGrid1.Rows[i].Clear;
    end;//for i
      StringGrid1.RowCount:=2;
      firstString:=false;
      UpdateResult;
  end;
end;

procedure TForm12.Edit1Change(Sender: TObject);
begin
  if  not(Thread=nil) then begin
   Thread.StopThread:=true;
   Thread:=dm.findListView(ListView1,ListView2, DateTimePicker1.Date, Edit1.Text,(ComboBox1.Items.Objects[ComboBox1.ItemIndex] as TId).ID);
  end
  else
   Thread:=dm.findListView(ListView1,ListView2, DateTimePicker1.Date, Edit1.Text,(ComboBox1.Items.Objects[ComboBox1.ItemIndex] as TId).ID);
// FindNomenklatura;
end;

{var
 i:integer; item:TListItem; s:string;
begin
  ListView2.Items.Clear;
 if Edit1.Text='' then
  for i:=0 to ListView1.Items.Count-1 do begin
   s:=ListView1.Items[i].SubItems.Strings[ListView1.Items[i].SubItems.Count-3];
   if ((ComboBox1.Items.Objects[ComboBox1.ItemIndex] as TId).ID=s)  then begin
    Item:=ListView2.Items.Add;
    Item.Caption:=ListView1.Items[i].Caption;
    Item.SubItems.AddStrings(ListView1.Items[i].SubItems);
   end;//if
  end//for
 else
 for i:=0 to ListView1.Items.Count-1 do begin
    s:=ListView1.Items[i].SubItems.Strings[ListView1.Items[i].SubItems.Count-3];
  if (pos(edit1.Text, ListView1.Items[i].Caption)>0) and (((ComboBox1.Items.Objects[ComboBox1.ItemIndex] as TId).ID=s) or ((ComboBox1.Items.Objects[ComboBox1.ItemIndex] as TId).ID='-1'))
   then begin
    Item:=ListView2.Items.Add;
    Item.Caption:=ListView1.Items[i].Caption;
    Item.SubItems.AddStrings(ListView1.Items[i].SubItems);
   end;//if
 end;//for

end;   }

procedure TForm12.StringGrid1SetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: String);
var
 s:string;
begin
  s:=(Sender as TStringGrid).Cells[ACol,ARow];
  if s='' then s:='0,001';
 case ACol of
 5:begin
    (Sender as TStringGrid).Cells[6,ARow]:=floatToStr(round(strToFloat((Sender as TStringGrid).Cells[4,ARow])*(1+strToFloat(s)/100)*1000)/1000);
   end;
 6:begin
    (Sender as TStringGrid).Cells[5,ARow]:=floatToStr(100-(strToFloat((Sender as TStringGrid).Cells[4,ARow])*100)/strToFloat(s));
   end;
 end;//case
  UpdateResult;
 // if ARow=6 then StringGrid1.Cells[ACol,5]:=floatToStr(StrToFloat(dm.ReplaceStr(StringGrid1.Cells[ACol,4],'.',','))*StrToFloat(dm.ReplaceStr(StringGrid1.Cells[ACol,6],'.',','))/100);
end;

procedure TForm12.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
 if ACol in [0,1,3,4,7,8] then StringGrid1.Options:= StringGrid1.Options-[goEditing]
 else StringGrid1.Options:= StringGrid1.Options+[goEditing];
end;

procedure TForm12.StringGrid1KeyPress(Sender: TObject; var Key: Char);
begin
 if not((key in dm.floatNum((Sender as TStringGrid).Cells[(Sender as TStringGrid).Col,(Sender as TStringGrid).Row])) or (ord(key) in [8,13])) then key:=char(0);
  //  if not (Key in ['0'..'9',',','.']) then key:=char(0);
end;

procedure TForm12.N3Click(Sender: TObject);
begin
 if (StringGrid1.RowCount>1) and (StringGrid1.Row>0) then begin
   StringGrid1.Rows[StringGrid1.Row].Clear;
   StringGrid1.Rows[StringGrid1.Row].AddStrings(StringGrid1.Rows[StringGrid1.RowCount-1]);
   StringGrid1.Rows[StringGrid1.RowCount-1].Clear;
   StringGrid1.RowCount:=StringGrid1.RowCount-1;
   UpdateResult;
  end;//if
end;

procedure TForm12.N13Click(Sender: TObject);
var
 count:integer;
begin
 if not(ListView3.Selected=nil) then begin
  count:=ListView3.Selected.SubItems.Count;
  try
    Form14.DostavkaId:=ListView3.Selected.SubItems.Strings[count-1];
    Form14.Status:=FUpdate;
    Form14.ShowModal;
   finally
    Form14.Close;
   end;//try
    if Form14.formResult=0 then dm.DBListView(ListView3,SQL_dostavka, ZConnection1,1);
 end;//if
end;

procedure TForm12.N11Click(Sender: TObject);
begin
   try
    Form14.Status:=FInsert;
    Form14.ShowModal;
   finally
    Form14.Close;
   end;//try
    if Form14.formResult=0 then dm.DBListView(ListView3,SQL_dostavka, ZConnection1,1);
end;

procedure TForm12.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
  const //здесь определяем Ваш цвет. Так же можно использовать цвета по умолчанию.
  clPaleGreen = TColor($CCFFCC);
  clPaleRed = TColor($CCCCFF);
begin
  //Если ячейка получает фокус, то нам надо закрасить её другими цветами
  if (gdFocused in State) then
  begin
    StringGrid1.Canvas.Brush.Color := clBlack;
    StringGrid1.Canvas.Font.Color := clWhite;
  end
  else //Если же ячейка теряет фокус, то закрашиваем её красным и зелёным
    if ACol in [0,1,3,4,7,8,9] then //Вторая колонка будет зелёной , другие - ячейки красными
      StringGrid1.Canvas.Brush.color := clPaleGreen
    else
      StringGrid1.canvas.brush.Color := clPaleRed;

  //Теперь закрасим ячейки, но только, если ячейка не Title- Row/Column
  //Естественно это завит от того, есть у Вас title-Row/Columns или нет.
  
  if (ACol >= 0) and (ARow > 0) then
  begin
    //Закрашиваем бэкграунд
    StringGrid1.Canvas.FillRect(Rect);
      //Закрашиваем текст (Text). Также здесь можно добавить выравнивание и т.д..
    StringGrid1.Canvas.TextOut(Rect.Left, Rect.Top, StringGrid1.Cells[ACol, ARow]);
  end;


end;

procedure TForm12.Edit2Change(Sender: TObject);
begin
 Edit2.Text:=dm.FilterFloatStr(Edit2.Text);
 UpdateResult;
end;

procedure TForm12.Button4Click(Sender: TObject);
var
 WorkBk : _WorkBook;
  WorkSheet : _WorkSheet;
  K, R, X, Y, i, j : Integer;
  IIndex : OleVariant;
  RangeMatrix : Variant;
  NomFich : WideString;
  elem: OleVariant;
  top:integer;
begin
  top:=5;
  ExcelApplication1.Connect;
  ExcelApplication1.Visible[0]:=true;
//  ExcelApplication1.Visible

  ExcelApplication1.Workbooks.Open(ExtractfilePath(Application.Exename)+'\template\zakaz.xlt',EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,0);
//  ExcelApplication1.Workbooks.Open(ExtractfilePath(Application.Exename)+'\template\zakaz.xlt' ,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,0);
  WorkBk := ExcelApplication1.WorkBooks.Item[1];
  WorkSheet := WorkBk.WorkSheets.Get_Item(1) as _WorkSheet;

   ExcelApplication1.Cells.Item[top-3,1]:='Заказ №';
   ExcelApplication1.Cells.Item[top-3,2]:=ZakazId;
   ExcelApplication1.Cells.Item[top-3,3]:='от';
   ExcelApplication1.Cells.Item[top-3,4]:=zakaz_date;
   ExcelApplication1.Cells.Item[top-2,1]:='Заказчик:';
   ExcelApplication1.Cells.Item[top-2,2]:=Label3.Caption;


  for j:=0 to StringGrid1.ColCount-4 do begin
     ExcelApplication1.Cells.Item[top,j+1]:=StringGrid1.Cells[j,0];
  end;//for j
   ExcelApplication1.Range[ExcelApplication1.Cells.Item[top,1],ExcelApplication1.Cells.item[top,StringGrid1.ColCount-2]].Font.Bold:=true;
  if firstString then
   for i:=1 to StringGrid1.RowCount-1 do begin
     ExcelApplication1.Cells.Item[i+top,1]:=StringGrid1.Cells[0,i];
     ExcelApplication1.Cells.Item[i+top,2]:=StringGrid1.Cells[1,i];
     ExcelApplication1.Cells.Item[i+top,3]:=StrToFloat(StringGrid1.Cells[2,i]);
     ExcelApplication1.Cells.Item[i+top,4]:=StrToFloat(StringGrid1.Cells[3,i]);
     ExcelApplication1.Cells.Item[i+top,5]:=StrToFloat(StringGrid1.Cells[4,i]);
     ExcelApplication1.Cells.Item[i+top,6]:=StrToFloat(StringGrid1.Cells[5,i]);
     ExcelApplication1.Cells.Item[i+top,7]:=StrToFloat(StringGrid1.Cells[6,i]);
     ExcelApplication1.Cells.Item[i+top,8]:=StrToFloat(StringGrid1.Cells[7,i]);
     ExcelApplication1.Cells.Item[i+top,9]:=StrToFloat(StringGrid1.Cells[8,i]);
     ExcelApplication1.Cells.Item[i+top,10]:=StringGrid1.Cells[9,i];
   end;//for i
//      ExcelApplication1.Range[ExcelApplication1.Cells.Item[top,1],ExcelApplication1.Cells.item[StringGrid1.RowCount,StringGrid1.ColCount-2]].Select;
      ExcelApplication1.Range[ExcelApplication1.Cells.Item[top,1],ExcelApplication1.Cells.item[StringGrid1.RowCount+top-1,StringGrid1.ColCount-2]].Borders.Weight:=2;
      ExcelApplication1.Range[ExcelApplication1.Cells.Item[top,1],ExcelApplication1.Cells.item[StringGrid1.RowCount+top-1,StringGrid1.ColCount-2]].WrapText:=true;
      ExcelApplication1.Range[ExcelApplication1.Cells.Item[top,1],ExcelApplication1.Cells.item[StringGrid1.RowCount+top-1,StringGrid1.ColCount-2]].HorizontalAlignment:=3;

      ExcelApplication1.Cells.item[StringGrid1.RowCount+top+1,1]:='Тонаж заказа:';
      ExcelApplication1.Cells.item[StringGrid1.RowCount+top+1,2]:=tonag;
      ExcelApplication1.Cells.item[StringGrid1.RowCount+top+2,1]:='Стоимость доставки 1 т.';
      ExcelApplication1.Cells.item[StringGrid1.RowCount+top+2,2]:=Price_tonna;
      ExcelApplication1.Cells.item[StringGrid1.RowCount+top+3,1]:='Итого без учета доставки';
      ExcelApplication1.Cells.item[StringGrid1.RowCount+top+3,2]:=summa;
      ExcelApplication1.Cells.item[StringGrid1.RowCount+top+4,1]:='Цена машины';
      ExcelApplication1.Cells.item[StringGrid1.RowCount+top+4,2]:= Edit2.Text;
      ExcelApplication1.Cells.item[StringGrid1.RowCount+top+5,1]:='Стоимость заказа с учетом доставки';
      ExcelApplication1.Cells.item[StringGrid1.RowCount+top+5,2]:= summa_all;


      ExcelApplication1.Range[ExcelApplication1.Cells.item[StringGrid1.RowCount+top+1,1],ExcelApplication1.Cells.item[StringGrid1.RowCount+top+5,1]].WrapText:=true;
  {
  // столбцов, мы активируем его последнюю непустую ячейку
  WorkSheet.Cells.SpecialCells(xlCellTypeLastCell,EmptyParam).Activate;
   // Получаем значение последней строки
   StringGrid1.RowCount := ExcelApplication1.ActiveCell.Row+1;
   // Получаем значение последней колонки
   StringGrid1.ColCount:= ExcelApplication1.ActiveCell.Column+1;

   Gauge1.MinValue:=1;
   Gauge1.MaxValue:=StringGrid1.RowCount;

  // WorkSheet.Range[]

   for i:=1 to StringGrid1.RowCount do begin
    StringGrid1.Cells[1,i]:=ExcelApplication1.Cells.Item[i,1];
    StringGrid1.Cells[2,i]:=ExcelApplication1.Cells.Item[i,2];
    Gauge1.Progress:=i;
   end;//for
   }
   //ExcelApplication1.Quit;
   ExcelApplication1.Disconnect;

end;

procedure TForm12.N9Click(Sender: TObject);
var
 i,ItemCount:integer;s:string;
 Item:TListItem;
begin
  if not(ListView2.Selected=nil) then begin
     try
    // n.creator_id, n.product_id
        ItemCount:=ListView2.Selected.SubItems.Count;
        Form18.creatorId:=ListView2.Selected.SubItems.Strings[ItemCount-2];
        form18.productId:=ListView2.Selected.SubItems.Strings[ItemCount-1];
   //     Form18.ShowModal;
     finally
        Form18.Close;
     end;//try
   //    dm.DBListView(ListView1,SQL_nomenklatura, ZConnection4,3);
   //    dm.DBListView(ListView2,SQL_nomenklatura, ZConnection2,3);

  end//if not(ListView2.Selected=nil) then begin
  else


end;

procedure TForm12.N17Click(Sender: TObject);
begin
 Form1.UpDostavka;
  ListView3.Items.Clear;
  ListView3.Columns.Clear;
  ListView3.Items:=form1.ListViewDostavka.Items;
  ListView3.Columns:=form1.ListViewDostavka.Columns;
end;

procedure TForm12.DateTimePicker1Change(Sender: TObject);
begin
  if  not(Thread=nil) then begin
   Thread.StopThread:=true;
   Thread:=dm.findListView(ListView1,ListView2, DateTimePicker1.Date, Edit1.Text,(ComboBox1.Items.Objects[ComboBox1.ItemIndex] as TId).ID);
  end
  else
   Thread:=dm.findListView(ListView1,ListView2, DateTimePicker1.Date, Edit1.Text,(ComboBox1.Items.Objects[ComboBox1.ItemIndex] as TId).ID);
// FindNomenklatura;
end;

procedure TForm12.Button5Click(Sender: TObject);
begin
  Form30_logistic:=TForm30_logistic.Create(Form12);
 try
   Form30_logistic.ZakazID:=StrToInt(ZakazId);
   Form30_logistic.ShowModal;
 finally
   Form30_logistic.Close;
 end;
   Form30_logistic.Free;
end;

end.
