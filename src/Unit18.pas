unit Unit18;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Menus;

type
   TIDnomenklatura = class(TObject)
  private
    { Private declarations }
  public
    ID:string;{ Public declarations }
    width,volume:string;
  end;

  TForm18 = class(TForm)
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ListView1: TListView;
    Label4: TLabel;
    Button1: TButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
  private
   id:TIDnomenklatura;
   SQL:TStringlist;
    { Private declarations }
  public
   creatorId, productId:string;
    { Public declarations }
  end;

var
  Form18: TForm18;

implementation

{$R *.dfm}

uses unit2, Unit10, Unit1,Unit19;

procedure TForm18.FormActivate(Sender: TObject);
begin
 Sql:=TStringList.Create;

 dm.ZQuery2.Active:=false;
 dm.ZQuery2.SQL.Clear;
 dm.ZQuery2.SQL.Add('select product_id, product_name, weight, volume from product order by product_name');
 dm.ZQuery2.Active:=true;

  dm.ZQuery2.First;
 while not(dm.ZQuery2.Eof) do begin
  id:=TIDnomenklatura.Create;
  id.ID:=dm.ZQuery2.FieldByName('product_id').AsString;
  id.width:=dm.ZQuery2.FieldByName('weight').AsString;
  id.volume:=dm.ZQuery2.FieldByName('volume').AsString;
  ComboBox1.Items.AddObject(dm.ZQuery2.FieldByName('product_name').AsString,id);
  dm.ZQuery2.Next;
 end;//while
  dm.ZQuery2.Active:=false;

end;

procedure TForm18.ComboBox1Change(Sender: TObject);
var
 id:TIDnomenklatura;
begin
 if not(ComboBox1.ItemIndex=-1) then begin
  id:=(ComboBox1.Items.Objects[ComboBox1.ItemIndex] as TIDnomenklatura);
  Edit1.Text:=id.width;
  Edit2.Text:=id.volume;

  Sql.Clear;
  SQL.Add(' select c.creator_name as "�����-������������", n.price as "���������", n.pricedate as "���� ������������ ����", c.creator_id, n.product_id ');
  SQL.Add(' from nomenklatura n join creator c on n.creator_id=c.creator_id');
  SQL.Add(' where n.product_id='+id.ID);

  dm.DBListView(ListView1,SQl,dm.ZConnection2,2);

 end;//if 

end;

procedure TForm18.FormDeactivate(Sender: TObject);
begin
 Form1.UpNomenklatura;
 Sql.Clear;
 SQL.Free;
end;

procedure TForm18.Edit1Change(Sender: TObject);
begin
 Edit1.Text:=dm.FilterFloatStr(Edit1.Text);
end;

procedure TForm18.Edit2Change(Sender: TObject);
begin
 Edit2.Text:=dm.FilterFloatStr(Edit2.Text);
end;

procedure TForm18.Button1Click(Sender: TObject);
var
 id:TIDnomenklatura;
begin
 if not(ComboBox1.ItemIndex=-1) then begin
  id:=(ComboBox1.Items.Objects[ComboBox1.ItemIndex] as TIDnomenklatura);
  try
   dm.ZQuery2.Active:=false;
    dm.ZConnection2.Connect;
    dm.ZConnection2.StartTransaction;
     dm.ZQuery2.SQL.Clear;

     dm.ZQuery2.SQL.Add(' update product');
     dm.ZQuery2.SQL.Add(' set volume='+dm.NumFormat(Edit2.Text)+',');
     dm.ZQuery2.SQL.Add(' weight='+dm.NumFormat(Edit1.Text));
     dm.ZQuery2.SQL.Add(' where product_id='+id.id);

    dm.ZQuery2.ExecSQL;
    dm.ZConnection2.Commit;
    dm.ZConnection2.Disconnect;
   except
    on E: Exception do begin
                          //ShowMessage(E.Message);
                          Form10:=TForm10.Create(Form1);
                          Form10.Label1.Caption:=E.Message;
                          Form10.ShowModal;
                          form10.Free;
                         end;
    end;//try
     id.volume:=Edit2.Text;
     id.width:=Edit1.Text;
 end;//if
end;

procedure TForm18.ListView1DblClick(Sender: TObject);
var
 count:integer;
begin
  if not(ListView1.Selected=nil) then begin
    count:=ListView1.Selected.SubItems.Count;
    productId:=ListView1.Selected.SubItems.Strings[Count-1];
    creatorId:=ListView1.Selected.SubItems.Strings[Count-2];

  end;//if
end;

procedure TForm18.N3Click(Sender: TObject);
var
 id:TIDnomenklatura;
begin
    if not(ComboBox1.ItemIndex=-1) then
    try
     Form19.ProductName:=ComboBox1.Items.Strings[ComboBox1.ItemIndex];
     Form19.productId:=(ComboBox1.Items.Objects[ComboBox1.ItemIndex] as TIDnomenklatura).ID;
     Form19.status:=fInsertPrice;
     Form19.ShowModal;
       id:=(ComboBox1.Items.Objects[ComboBox1.ItemIndex] as TIDnomenklatura);
       Sql.Clear;
       SQL.Add(' select c.creator_name as "�����-������������", n.price as "���������",n.pricedate as "���� ������������ ����", c.creator_id, n.product_id ');
       SQL.Add(' from nomenklatura n join creator c on n.creator_id=c.creator_id');
       SQL.Add(' where n.product_id='+id.ID);
     dm.DBListView(ListView1,SQl,dm.ZConnection2,2);
    finally
     Form19.Close;
    end
     else ShowMessage('�������� �������');
 end;

procedure TForm18.N4Click(Sender: TObject);
var
 count:integer;
begin
 if not(ListView1.Selected=nil) then
  if not(ComboBox1.ItemIndex=-1) then begin
    try
      Form19.ProductName:=ComboBox1.Items.Strings[ComboBox1.ItemIndex];
      Form19.productId:=(ComboBox1.Items.Objects[ComboBox1.ItemIndex] as TIDnomenklatura).ID;
        count:=ListView1.Selected.SubItems.count;
      Form19.creatorId:=ListView1.Selected.SubItems.Strings[count-2];
      Form19.creatorName:=ListView1.Selected.Caption;
     Form19.status:=FUpdatePrice;
     Form19.price:=ListView1.Selected.SubItems.Strings[0];
     Form19.datePrice:=ListView1.Selected.SubItems.Strings[1];
     Form19.ShowModal;
    finally
     Form19.Close;
    end;
     id:=(ComboBox1.Items.Objects[ComboBox1.ItemIndex] as TIDnomenklatura);
      Sql.Clear;
       SQL.Add(' select c.creator_name as "�����-������������", n.price as "���������", n.pricedate as "���� ������������ ����", c.creator_id, n.product_id ');
       SQL.Add(' from nomenklatura n join creator c on n.creator_id=c.creator_id');
       SQL.Add(' where n.product_id='+id.ID);
      dm.DBListView(ListView1,SQl,dm.ZConnection2,2);
  end//  if not(ComboBox1.ItemIndex=-1) then begin
     else ShowMessage('�������� �������.')
 else ShowMessage('�������� ���������� ����.');
end;

end.
