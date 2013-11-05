unit Unit26;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls;

type
  TForm26_avto = class(TForm)
    ListView1: TListView;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    SQL_text:TStringList;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form26_avto: TForm26_avto;

implementation

uses Unit2, Unit23, Unit27, Unit22;

{$R *.dfm}

procedure TForm26_avto.FormActivate(Sender: TObject);
begin
 SQL_text:=TStringList.Create;
 SQL_text.Clear;
 SQL_text.Add(' SELECT a.avto_number AS "Номер автомобиля", a.mark_avto AS "Модель", a.tonag AS "Тонаж", a.peregruz AS "Перегруз", ao.name_owner AS "ФИО владельца", ao.tel_owner AS "Телефон владельца", a.avto_id, a.avto_owner_id');
 SQL_text.Add(' FROM  avto a left JOIN avto_owner ao ON a.avto_owner_id = ao.avto_owner_id');
 dm.DBListView(ListView1,SQL_text,dm.ZConnection2,2);
end;

procedure TForm26_avto.FormDeactivate(Sender: TObject);
begin
 SQL_text.Free;
end;

procedure TForm26_avto.ListView1DblClick(Sender: TObject);
var
 count:integer;
begin
 if not(ListView1.Selected=nil) then begin
   Form27_avto_upd:=TForm27_avto_upd.Create(Form26_avto);
   try
    count:=ListView1.Selected.SubItems.Count;
    Form27_avto_upd.AvtoId:=StrToInt(ListView1.Selected.SubItems.Strings[count-2]);
    Form27_avto_upd.AvtoOwnerId:=StrToInt(ListView1.Selected.SubItems.Strings[count-1]);
    Form27_avto_upd.Status:=FUpdate;
    Form27_avto_upd.ShowModal;
   finally
    Form27_avto_upd.Close;
   end;//try
    if Form27_avto_upd.formResult=0 then begin
     dm.DBListView(ListView1,SQL_text, dm.ZConnection2,2);
     //Form1.UpDostavka;
    end;
  Form27_avto_upd.Free;
 end;//if 
end;

procedure TForm26_avto.Button4Click(Sender: TObject);
begin
    Form27_avto_upd:=TForm27_avto_upd.Create(Form26_avto);
   try
    Form27_avto_upd.Status:=FInsert;
    Form27_avto_upd.ShowModal;
   finally
    Form27_avto_upd.Close;
   end;//try
    if Form27_avto_upd.formResult=0 then begin
     dm.DBListView(ListView1,SQL_text, dm.ZConnection2,2);
     //Form1.UpDostavka;
    end;
  Form27_avto_upd.Free;
end;

procedure TForm26_avto.Button3Click(Sender: TObject);
begin
 Close;
end;

procedure TForm26_avto.Button1Click(Sender: TObject);
begin
  Close;
end;

end.


