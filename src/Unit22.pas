unit Unit22;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TForm22_disp = class(TForm)
    ListView1: TListView;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
  private
    { Private declarations }
    SQL_text:TStringList;
  public
    { Public declarations }
  end;

var
  Form22_disp: TForm22_disp;

implementation

uses Unit2, unit23, Unit14, Unit1;

{$R *.dfm}

procedure TForm22_disp.FormActivate(Sender: TObject);
begin
 SQL_text:=TStringList.Create;
 SQL_text.Clear;
 SQL_text.Add('SELECT d.name_disp as "ФИО диспетчера", d.tel_disp as "Контактный телефон",d.dispetcher_id FROM Dispetcher d');
 dm.DBListView(ListView1,SQL_text,dm.ZConnection2,1);
end;

procedure TForm22_disp.FormDeactivate(Sender: TObject);
begin
  SQL_text.Free;
end;

procedure TForm22_disp.Button1Click(Sender: TObject);
begin
  Form23_disp_upd:=TForm23_disp_upd.Create(Form22_disp);
   try
    Form23_disp_upd.Status:=FInsert;
    Form23_disp_upd.ShowModal;
   finally
    Form23_disp_upd.Close;
   end;//try
    if Form23_disp_upd.formResult=0 then begin
     dm.DBListView(ListView1,SQL_text, dm.ZConnection2,1);
     //Form1.UpDostavka;
    end;
  Form23_disp_upd.Free;

end;

procedure TForm22_disp.ListView1DblClick(Sender: TObject);
var
 count:integer;
begin
   Form23_disp_upd:=TForm23_disp_upd.Create(Form22_disp);
   try
    count:=ListView1.Selected.SubItems.Count;
    Form23_disp_upd.dispetcherId:=ListView1.Selected.SubItems.Strings[count-1];
    Form23_disp_upd.Status:=FUpdate;
    Form23_disp_upd.ShowModal;
   finally
    Form23_disp_upd.Close;
   end;//try
    if Form23_disp_upd.formResult=0 then begin
     dm.DBListView(ListView1,SQL_text, dm.ZConnection2,1);
     //Form1.UpDostavka;
    end;
  Form23_disp_upd.Free;  
end;

end.
