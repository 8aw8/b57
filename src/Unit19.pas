unit Unit19;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, unit2, ComCtrls;

type
  TForm19 = class(TForm)
    ComboBox1: TComboBox;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    DateTimePicker1: TDateTimePicker;
    Label4: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
   SQL:TStringlist;
   id:TId;
    { Private declarations }
  public
   status:TStatusPrice;
   creatorId, productId,datePrice:string;
   creatorName,ProductName,price:string;
    { Public declarations }
  end;

var
  Form19: TForm19;

implementation

uses Unit10, Unit1;

{$R *.dfm}

procedure TForm19.FormActivate(Sender: TObject);
var
 i:integer;
begin
   SQL:=TStringList.Create;

   case status of
    FInsertPrice:begin
     DateTimePicker1.DateTime:=now;
      Label2.Caption:=ProductName;
      ComboBox1.Enabled:=true;
        for i:=0 to ComboBox1.Items.count-1 do begin
           (ComboBox1.Items.Objects[i] as TId).Free;
         end;//for
         ComboBox1.Items.Clear;
       try
          dm.ZQuery2.Active:=false;
            dm.ZQuery2.SQL.Clear;
            dm.ZQuery2.SQL.Add(' select c.creator_name, c.creator_id');
            dm.ZQuery2.SQL.Add(' from creator c where c.creator_id not in (select n.creator_id from nomenklatura n');
            dm.ZQuery2.SQL.Add(' where n.product_id='+productId+')');
          dm.ZQuery2.Active:=true;
         dm.ZQuery2.First;
         while not(dm.ZQuery2.Eof) do begin
           id:=TID.Create;
           id.ID:=dm.ZQuery2.FieldByName('creator_id').AsString;
          ComboBox1.Items.AddObject(dm.ZQuery2.FieldByName('creator_name').AsString,id);
          dm.ZQuery2.Next;
         end;//while
         dm.ZQuery2.Active:=false;
       except
        on E: Exception do begin
                          //ShowMessage(E.Message);
                          Form10:=TForm10.Create(Form1);
                          Form10.Label1.Caption:=E.Message;
                          Form10.ShowModal;
                          form10.Free;
                         end;
       end;//try
    end;//FInsert
    FUpdatePrice:begin
       Label2.Caption:=ProductName;
       ComboBox1.Items.Clear;
       ComboBox1.Items.Add(CreatorName);
       ComboBox1.ItemIndex:=0;
       ComboBox1.Enabled:=false;
       Edit1.Text:=Price;
       DateTimePicker1.Date:=StrToDate(datePrice);
       DateTimePicker1.Visible:=false;
    end;//FUpdate
   end;//case
end;

procedure TForm19.FormDeactivate(Sender: TObject);
begin
 SQl.Clear;
 sql.Free;
end;

procedure TForm19.Button1Click(Sender: TObject);
begin
   case status of
    FInsertPrice:
      begin
       if not(ComboBox1.ItemIndex=-1) then begin
         try
          dm.ZQuery2.Active:=false;
          dm.ZConnection2.Connect;
          dm.ZConnection2.StartTransaction;
           dm.ZQuery2.SQL.Clear;
            creatorId:=(ComboBox1.Items.Objects[ComboBox1.ItemIndex] as TId).ID;
            datePrice:=FormatDateTime('yyyy-mm-dd',DateTimePicker1.Date);
           dm.ZQuery2.SQL.Add(' insert into nomenklatura (creator_id, price, product_id, PriceDate)');
           dm.ZQuery2.SQL.Add(' values ('+creatorId+','+dm.NumFormat(Edit1.Text)+','+productId+','''+datePrice+''')');

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
                          dm.ZConnection2.Rollback;
                          dm.ZConnection2.Disconnect;
                         end;
          end;//try
            Close;
         end// if not(ComboBox1.ItemIndex=-1)
        else
          ShowMessage('Выбирете завод-производитель.');

      end;//FInsert


    FUpdatePrice:
      begin
       if DateTimePicker1.Visible then
        if not(DateToStr(DateTimePicker1.Date)=datePrice) then begin
         try
          dm.ZQuery2.Active:=false;
          dm.ZConnection2.Connect;
          dm.ZConnection2.StartTransaction;
           dm.ZQuery2.SQL.Clear;

      //      FormatDateTime('yyyy-mm-dd',StrToDate(datePrice));
        //  creatorId:=(ComboBox1.Items.Objects[ComboBox1.ItemIndex] as TId).ID;

           dm.ZQuery2.SQL.Add(' insert into nomenklatura (creator_id, price, product_id, PriceDate)');
           dm.ZQuery2.SQL.Add(' values ('+creatorId+','+dm.NumFormat(Edit1.Text)+','+productId+','''+FormatDateTime('yyyy-mm-dd',DateTimePicker1.Date)+''')');

//         dm.ZQuery2.SQL.Add(' update nomenklatura n');
//         dm.ZQuery2.SQL.Add(' set n.price='+dm.NumFormat(Edit1.Text));
//         dm.ZQuery2.SQL.Add(' ,n.PriceDate='''+FormatDateTime('yyyy-mm-dd',DateTimePicker1.Date)+'''');
//         dm.ZQuery2.SQL.Add(' where n.creator_id='+creatorId+' and n.product_id='+productId+' and n.PriceDate='''+FormatDateTime('yyyy-mm-dd',StrToDate(datePrice))+'''');

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
                          dm.ZConnection2.Rollback;
                          dm.ZConnection2.Disconnect;
                         end;
         end;//try
              close;
        end //if not(DateTimePicker1.Date
       else ShowMessage('Измените дату формирования цены')
      else Close;
      end;//FUpdate
   end;//case
end;

procedure TForm19.Button2Click(Sender: TObject);
begin
 Close;
end;

procedure TForm19.Edit1Change(Sender: TObject);
begin
 Edit1.Text:=dm.FilterFloatStr(Edit1.Text);
 DateTimePicker1.Visible:=not(price=Edit1.Text);
// if not(price=Edit1.Text) then DateTimePicker1.Visible:=true else

end;

end.
