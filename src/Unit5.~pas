unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZConnection, Menus;

type
  TForm5 = class(TForm)
    ListView1: TListView;
    Button1: TButton;
    Button2: TButton;
    ZConnection1: TZConnection;
    PopupMenu1: TPopupMenu;
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
  private
    SQL_text:TStringList;
       { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}
uses  Unit2, unit1, Unit14;

procedure TForm5.Button1Click(Sender: TObject);
begin
  try
    Form14.Status:=FInsert;
    Form14.ShowModal;
   finally
    Form14.Close;
   end;//try
    if Form14.formResult=0 then begin
     dm.DBListView(ListView1,SQL_text, dm.ZConnection2,1);
     Form1.UpDostavka;
    end;

end;

procedure TForm5.FormActivate(Sender: TObject);
var
 sql:String;
begin
 dm.initConnect(dm.ZConnection2);
 SQL_text:=TStringList.Create;
 SQL_text.Clear;
 SQL_text.Add('SELECT d.dostavka_adress as "Адрес", d.dostavka_person as "Контактное лицо", d.dostavka_telefon as "Контактный телефон", d.dostavka_id FROM dostavka d');
 dm.DBListView(ListView1,SQL_text,dm.ZConnection2,1);
end;

procedure TForm5.FormDeactivate(Sender: TObject);
begin
 Sql_text.Free;
end;

procedure TForm5.Button2Click(Sender: TObject);
var
 sql:String;
begin
{
 sql:='SELECT p.product_name, p.volume, p.weight, pc.name_category, c.creator_name, c.creator_adress ,n.price, n.creator_id, n.product_id, p.category_id '+
      'FROM nomenklatura n join product p on p.product_id=n.product_id '+
      'join creator c on c.creator_id=n.creator_id '+
      'left join product_category pc on pc.category_id=p.category_id';
 DM.DBListView(ListView1,SQL,DM.ZConnection1,0);
}
end;

procedure TForm5.ListView1DblClick(Sender: TObject);
var
 count:integer;
begin
  if not(ListView1.Selected=nil) then begin
  count:=ListView1.Selected.SubItems.Count;
  try
    Form14.DostavkaId:=ListView1.Selected.SubItems.Strings[count-1];
    Form14.Status:=FUpdate;
    Form14.ShowModal;
   finally
    Form14.Close;
   end;//try
    if Form14.formResult=0 then dm.DBListView(ListView1,SQL_text, dm.ZConnection2,1);
 end;//if
end;

end.
