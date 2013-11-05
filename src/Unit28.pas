unit Unit28;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls;

type
  TForm28_owner = class(TForm)
    ListView1: TListView;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    SQL_text:TStringList;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form28_owner: TForm28_owner;

implementation

uses Unit2, Unit29;

{$R *.dfm}

procedure TForm28_owner.FormActivate(Sender: TObject);
begin
 SQL_text:=TStringList.Create;
 SQL_text.Clear;
 SQL_text.Add('select ao.name_owner as "ФИО владельца", ao.tel_owner as "Телефон", ao.avto_owner_id from avto_owner ao');
 dm.DBListView(ListView1,SQL_text,dm.ZConnection2,1);
end;

procedure TForm28_owner.FormDeactivate(Sender: TObject);
begin
  SQL_text.Free;
end;

procedure TForm28_owner.ListView1DblClick(Sender: TObject);
var
 count:integer;
begin
  if not(ListView1.Selected=nil) then begin
   Form29_owner_upd:=TForm29_owner_upd.Create(Form28_owner);
   try
    count:=ListView1.Selected.SubItems.Count;
    Form29_owner_upd.AutoOwnerId:=StrToInt(ListView1.Selected.SubItems.Strings[count-1]);
    Form29_owner_upd.Status:=FUpdate;
    Form29_owner_upd.ShowModal;
   finally
    Form29_owner_upd.Close;
   end;//try
    if Form29_owner_upd.formResult=0 then begin
     dm.DBListView(ListView1,SQL_text, dm.ZConnection2,1);
     //Form1.UpDostavka;
    end;
  Form29_owner_upd.Free;
 end;//if
end;

procedure TForm28_owner.Button1Click(Sender: TObject);
begin
    Form29_owner_upd:=TForm29_owner_upd.Create(Form28_owner);
   try
    Form29_owner_upd.Status:=FInsert;
    Form29_owner_upd.ShowModal;
   finally
    Form29_owner_upd.Close;
   end;//try
    if Form29_owner_upd.formResult=0 then begin
     dm.DBListView(ListView1,SQL_text, dm.ZConnection2,1);
     //Form1.UpDostavka;
    end;
  Form29_owner_upd.Free;
end;

end.
