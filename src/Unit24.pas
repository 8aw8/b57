unit Unit24;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls;

type
  TForm24_driver = class(TForm)
    ListView1: TListView;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
     SQL_text:TStringList;
  public
    { Public declarations }
  end;

var
  Form24_driver: TForm24_driver;

implementation

uses Unit2, Unit25, Unit23;

{$R *.dfm}

procedure TForm24_driver.FormActivate(Sender: TObject);
begin
 SQL_text:=TStringList.Create;
 SQL_text.Clear;
 SQL_text.Add( 'SELECT ad.name_driver AS "��� ��������", ad.tel_driver AS "������� ��������", ad.address AS "����� ��������", ad.avto_driver_id FROM avto_driver ad');
 dm.DBListView(ListView1,SQL_text,dm.ZConnection2,1);
end;

procedure TForm24_driver.FormDeactivate(Sender: TObject);
begin
   SQL_text.Free;
end;

procedure TForm24_driver.ListView1DblClick(Sender: TObject);
var
 count:integer;
begin
    Form25_driver_upd:=TForm25_driver_upd.Create(Form24_driver);
   try
    count:=ListView1.Selected.SubItems.Count;
    Form25_driver_upd.avtoDriverId:=strToint(ListView1.Selected.SubItems.Strings[count-1]);
    Form25_driver_upd.Status:=FUpdate;
    Form25_driver_upd.ShowModal;
   finally
    Form25_driver_upd.Close;
   end;//try
    if Form25_driver_upd.formResult=0 then begin
     dm.DBListView(ListView1,SQL_text, dm.ZConnection2,1);
     //Form1.UpDostavka;
    end;
  Form25_driver_upd.Free;
end;

procedure TForm24_driver.Button1Click(Sender: TObject);
begin
  Form25_driver_upd:=TForm25_driver_upd.Create(Form24_driver);
   try
    Form25_driver_upd.Status:=FInsert;
    Form25_driver_upd.ShowModal;
   finally
    Form25_driver_upd.Close;
   end;//try
    if Form25_driver_upd.formResult=0 then begin
     dm.DBListView(ListView1,SQL_text, dm.ZConnection2,1);
     //Form1.UpDostavka;
    end;
  Form25_driver_upd.Free;
end;

end.
