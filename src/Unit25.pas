unit Unit25;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Unit2;

type
  TForm25_driver_upd = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     Status:TStatus;
     formResult:integer;
     avtoDriverId:integer;
  end;

var
  Form25_driver_upd: TForm25_driver_upd;

implementation

{$R *.dfm}

procedure TForm25_driver_upd.FormActivate(Sender: TObject);
begin
   formResult:=-1;
 case status of
  FInsert:
    begin

    end;//FInsert
  FUpdate:
    begin
     dm.ZQuery2.Active:=false;
       dm.ZQuery2.SQL.Clear;
       dm.ZQuery2.SQL.Add('SELECT ad.name_driver, ad.tel_driver, ad.address FROM avto_driver ad where ad.avto_driver_id='+intToStr(avtoDriverId));
     dm.ZQuery2.Active:=true;
       Edit1.Text:=dm.ZQuery2.FieldByName('name_driver').AsString;
       Edit2.Text:=dm.ZQuery2.FieldByName('tel_driver').AsString;
       Edit3.Text:=dm.ZQuery2.FieldByName('address').AsString;
     dm.ZQuery2.Active:=false;
    end;//FUpdate
 end;//case
end;

procedure TForm25_driver_upd.Button1Click(Sender: TObject);
begin
   case status of
  FInsert:
  begin
    dm.ZQuery2.Active:=false;
      dm.ZConnection2.Connect;
      dm.ZConnection2.StartTransaction;
    dm.ZQuery2.SQL.Clear;
     dm.ZQuery2.SQL.Add(' insert into avto_driver (name_driver, tel_driver, address)');
     dm.ZQuery2.SQL.Add(' values ("'+Edit1.Text+'","'+Edit2.Text+'","'+Edit3.Text+'")');
    dm.ZQuery2.ExecSQL;
      dm.ZConnection2.Commit;
      dm.ZConnection2.Disconnect;
      formResult:=0;
   end;//FInsert
  FUpdate:
  begin
     dm.ZQuery2.Active:=false;
      dm.ZConnection2.Connect;
      dm.ZConnection2.StartTransaction;
    dm.ZQuery2.SQL.Clear;
      dm.ZQuery2.SQL.Add(' update avto_driver');
      dm.ZQuery2.SQL.Add(' set name_driver="'+Edit1.Text+'"');
      dm.ZQuery2.SQL.Add(' ,tel_driver="'+Edit2.Text+'"');
      dm.ZQuery2.SQL.Add(' ,address="'+Edit3.Text+'"');
      dm.ZQuery2.SQL.Add(' where avto_driver_id='+intToStr(avtoDriverId));
    dm.ZQuery2.ExecSQL;
      dm.ZConnection2.Commit;
      dm.ZConnection2.Disconnect;
      formResult:=0;
    formResult:=0;
  end;//FUpdate
 end;//case
   Close;
end;

end.
