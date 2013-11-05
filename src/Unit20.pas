unit Unit20;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ComCtrls, unit2;

type
  TForm20 = class(TForm)
    ListView1: TListView;
    ImageList1: TImageList;
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
  private
    { Private declarations }
  public
    sql_text:TstringList;
    status:TStatus;
    zakazId:string;
    { Public declarations }
  end;

var
  Form20: TForm20;

implementation

{$R *.dfm}

procedure TForm20.FormActivate(Sender: TObject);
var
 item:TListItem;
begin
 sql_text:=TStringList.Create;
 CASE status of
  FInsert:begin
   sql_text.Clear;
   sql_text.Add('SELECT * FROM zakaz_details zd where zd.zakaz_id='+zakazId);

 //  sql_text.Add(' SELECT zd.position, p.product_name, zdz.count, zd.count - zdz.count, zd.creator_id,zd.product_id,zd.zakaz_id,zd.pricedate');
 //  sql_text.Add(' FROM zakaz_details zd LEFT JOIN zakaz_details_zayavka zdz ON zd.creator_id = zdz.creator_id');
 //  sql_text.Add(' AND zd.product_id = zdz.product_id  AND zd.priceDate = zdz.pricedate  AND zd.zakaz_id = zdz.zakaz_id');
 //  sql_text.Add(' JOIN product p ON zd.product_id = p.product_id');
 //  sql_text.Add(' WHERE  zdz.zakaz_id IS NOT NULL AND (zd.count - zdz.count) > 0  AND zdz.zakaz_id = '+zakazId);


   dm.DBListView(ListView1,sql_text,dm.ZConnection2,0);
   item:=ListView1.Items.Add;
   item.Caption:='fffffffffff';
   item.ImageIndex:=1;
   item.Checked:=true;
   item.SubItems.Add('ygfyvcyvfy');
   item.SubItemImages[0]:=1;
  end;
  FUpdate:begin


  end;
 end;//case

end;

procedure TForm20.FormDeactivate(Sender: TObject);
begin
 sql_text.Free;
end;

end.
