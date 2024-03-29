unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, unit2, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Buttons, ExtCtrls, ZConnection, Menus ;

type
  TForm7 = class(TForm)
    ListView1: TListView;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Button2: TButton;
    Button3: TButton;
    ZQuery1: TZQuery;
    SpeedButton1: TSpeedButton;
    StaticText1: TStaticText;
    Edit4: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    SpeedButton2: TSpeedButton;
    StaticText2: TStaticText;
    Label6: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    ListView2: TListView;
    ListView3: TListView;
    ZConnection1: TZConnection;
    ZConnection2: TZConnection;
    ZConnection3: TZConnection;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure ListView2DblClick(Sender: TObject);
    procedure ListView3DblClick(Sender: TObject);
    procedure ListView1SelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
  private
   SQL_creator:TStringList;
   SQL_category:TStringList;
   SQL_nomenclatura:TStringList;
   CreatorId:string;
   CategoryId:string;
   ProductId:string;
   ProductCategoryId:string;
   count:integer;
   zQuery:TZQuery;
   SQLtext:string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

uses Unit14;

{$R *.dfm}


procedure TForm7.Button1Click(Sender: TObject);
begin
 SQL_nomenclatura.Clear;
 SQL_nomenclatura.Add(' select p.product_name, pc.Name_category, p.volume, p.weight, c.creator_name, c.creator_adress, n.price, n.creator_id, n.product_id');
 SQL_nomenclatura.Add(' from nomenklatura n join creator c on n.creator_id=c.creator_id');
 SQL_nomenclatura.Add(' join product p on n.product_id=p.product_id');
 SQL_nomenclatura.Add(' left join product_category pc on p.category_id=pc.category_id');
 dm.DBListView(ListView1,SQL_nomenclatura,ZConnection2,2);
end;

procedure TForm7.FormActivate(Sender: TObject);
begin
   SQL_creator:=TStringList.Create;
   SQL_creator.Clear;
   SQL_category:=TStringList.Create;
   SQL_category.Clear;
   SQL_nomenclatura:=TStringList.Create;
   SQL_nomenclatura.Clear;

 ProductCategoryId:=' null ';
 ZQuery1.Connection:=dm.ZConnection1;
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

  SQL_category.Add('select name_category, category_id from product_category');
  dm.DBListView(ListView3,SQL_category,dm.ZConnection1, 1);
  SQL_creator.Add('select creator_name, creator_adress, creator_id from creator');
  dm.DBListView(ListView2,SQL_creator,dm.ZConnection1, 1);
  SQL_nomenclatura.add(' select p.product_name, pc.Name_category, p.volume, p.weight, c.creator_name, c.creator_adress, n.price, n.creator_id, n.product_id');
  SQL_nomenclatura.add(' from nomenklatura n join creator c on n.creator_id=c.creator_id');
  SQL_nomenclatura.add(' join product p on n.product_id=p.product_id');
  SQL_nomenclatura.add(' left join product_category pc on p.category_id=pc.category_id');
 dm.DBListView(ListView1,SQL_nomenclatura,dm.ZConnection1,2);
end;

procedure TForm7.Button3Click(Sender: TObject);
var
 SQLtext:string;
begin
 if CreatorId='' then ShowMessage('�������� �����-���������') else
 begin
   ZConnection1.StartTransaction;
   {
    SQLtext:='insert into product (product_name, volume, weight, category_id) values ('''+Edit1.Text+''','+ dm.NumFormat(Edit2.Text)+','+ dm.NumFormat(Edit3.Text)+','+  ProductCategoryId+')';
     zQuery:=TZQuery.Create(DM);
     ZQuery.Connection:=ZConnection1;
     ZQuery.SQL.Clear;
     ZQuery.SQL.Add(SQLtext);
     ZQuery.ExecSQL;

     SQLtext:='select LAST_INSERT_ID() as product_id';
     ZQuery.Active:=false;
     ZQuery.SQL.Clear;
     ZQuery.SQL.Add(SQLtext);
     ZQuery.Active:=true;
     ProductId:=ZQuery.Fields[0].AsString;

    SQLtext:='insert INTO nomenklatura (creator_id,product_id,price) value ('+CreatorId+','+ProductId+','+ dm.NumFormat(Edit4.Text)+')';
     zQuery:=TZQuery.Create(DM);
     ZQuery.Connection:=ZConnection1;
     ZQuery.SQL.Clear;
     ZQuery.SQL.Add(SQLtext);
     ZQuery.ExecSQL;
    }
//    PROCEDURE InsertNomenklatura(IN product_name VARCHAR (50), IN weight FLOAT, IN volume FLOAT, IN category_id INT (11), IN creator_id INT (11), IN price FLOAT)
    SQLtext:='CALL InsertNomenklatura("'+Edit1.Text+'", '+dm.NumFormat(Edit3.Text)+', '+dm.NumFormat(Edit2.Text)+', '+ProductCategoryId+' , '+CreatorId+', '+dm.NumFormat(Edit4.Text)+')';
     zQuery:=TZQuery.Create(DM);
     ZQuery.Connection:=ZConnection1;
     ZQuery.SQL.Clear;
     ZQuery.SQL.Add(SQLtext);
     ZQuery.ExecSQL;


//     CALL InsertNomenklatura("zzzZ+ ", 0.00, 0.00, NULL  , 1, 1.00  );

     ZConnection1.Commit;

     SQL_nomenclatura.Clear;
       SQL_nomenclatura.Add(' select p.product_name, pc.Name_category, p.volume, p.weight, c.creator_name, c.creator_adress, n.price, n.creator_id, n.product_id');
       SQL_nomenclatura.Add(' from nomenklatura n join creator c on n.creator_id=c.creator_id');
       SQL_nomenclatura.Add(' join product p on n.product_id=p.product_id');
       SQL_nomenclatura.Add(' left join product_category pc on p.category_id=pc.category_id');
     dm.DBListView(ListView1,SQL_nomenclatura,ZConnection2,2);
 end;//if CreatorId=''
end;

procedure TForm7.SpeedButton1Click(Sender: TObject);
begin
 Panel1.Visible:= not Panel1.Visible;
end;

procedure TForm7.SpeedButton2Click(Sender: TObject);
begin
 Panel2.Visible:=not Panel2.Visible;
end;

procedure TForm7.ListView2DblClick(Sender: TObject);
begin
 if not(ListView2.Selected=nil) then begin
  Label5.Caption:=ListView2.Selected.Caption;
  count:=ListView2.Selected.SubItems.Count;
  CreatorId:=ListView2.Selected.SubItems.Strings[count-1];
  Panel1.Visible:=false;
 end; 
end;

procedure TForm7.ListView3DblClick(Sender: TObject);
begin
 if not(ListView3.Selected=nil) then begin
  Label6.Caption:=ListView3.Selected.Caption;
  count:=ListView3.Selected.SubItems.Count;
  ProductCategoryId:=ListView3.Selected.SubItems.Strings[count-1];
  panel2.Visible:=false;
 end; 
end;

procedure TForm7.ListView1SelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
  if not(item=nil) then begin
     Edit1.Text:=Item.Caption;
     Edit2.Text:=Item.SubItems.Strings[1];
     Edit3.Text:=Item.SubItems.Strings[2];
     Edit4.Text:=Item.SubItems.Strings[5];
     Label5.Caption:=Item.SubItems.Strings[3];
     Label6.Caption:=Item.SubItems.Strings[0];
  end;//if not(item=nil)
end;

procedure TForm7.Edit2Change(Sender: TObject);
begin
  Edit2.Text:=dm.FilterFloatStr(Edit2.Text);
end;

procedure TForm7.Edit3Change(Sender: TObject);
begin
   Edit3.Text:=dm.FilterFloatStr(Edit3.Text);
end;

procedure TForm7.Edit4Change(Sender: TObject);
begin
   Edit4.Text:=dm.FilterFloatStr(Edit4.Text);
end;

procedure TForm7.FormDestroy(Sender: TObject);
begin
   SQL_creator.Free;
   SQL_category.Free;
   SQL_nomenclatura.Free;
end;

procedure TForm7.Button2Click(Sender: TObject);

begin
   if CreatorId='' then ShowMessage('�������� �����-���������') else
 begin
   ZConnection1.StartTransaction;

      ProductId:=ListView1.Selected.SubItems.Strings[ListView1.Selected.SubItems.Count-1];
      CreatorId:=ListView1.Selected.SubItems.Strings[ListView1.Selected.SubItems.Count-2];

    SQLtext:='UPDATE product '+
             'SET product_name ='''+Edit1.Text+''','+
             'volume='+dm.NumFormat(Edit2.Text)+','+
             'weight='+dm.NumFormat(Edit3.Text)+','+
             'category_id='+ProductCategoryId+
             ' where product_id='+ProductId;
     zQuery:=TZQuery.Create(DM);
     ZQuery.Connection:=ZConnection1;
     ZQuery.SQL.Clear;
     ZQuery.SQL.Add(SQLtext);
     ZQuery.ExecSQL;

    SQLtext:='update nomenklatura set price='+ dm.NumFormat(Edit4.Text)+
             ' where creator_id='+CreatorId+
             ' and product_id='+ProductId;
     zQuery:=TZQuery.Create(DM);
     ZQuery.Connection:=ZConnection1;
     ZQuery.SQL.Clear;
     ZQuery.SQL.Add(SQLtext);
     ZQuery.ExecSQL;

     ZConnection1.Commit;

     SQL_nomenclatura.Clear;
       SQL_nomenclatura.Add(' select p.product_name, pc.Name_category, p.volume, p.weight, c.creator_name, c.creator_adress, n.price, n.creator_id, n.product_id');
       SQL_nomenclatura.Add(' from nomenklatura n join creator c on n.creator_id=c.creator_id');
       SQL_nomenclatura.Add(' join product p on n.product_id=p.product_id');
       SQL_nomenclatura.Add(' left join product_category pc on p.category_id=pc.category_id');
     dm.DBListView(ListView1,SQL_nomenclatura,ZConnection2,2);
 end;//if CreatorId=''
end;

procedure TForm7.N4Click(Sender: TObject);
begin
{ if not(ListView3.Selected=nil) then begin
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
 }
end;

end.
