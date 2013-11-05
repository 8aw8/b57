unit Unit14;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ZConnection, unit2, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  TForm14 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    ZConnection1: TZConnection;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    Button1: TButton;
    Button2: TButton;
    ZQuery1: TZQuery;
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    Sql_text:TStringList;
    { Private declarations }
  public
   Status:TStatus;
   Adress,person,telefon,DostavkaId:string;
   formResult:integer;

    { Public declarations }
  end;

var
  Form14: TForm14;

implementation

{$R *.dfm}


procedure TForm14.FormActivate(Sender: TObject);
begin
    ZConnection1.HostName:=dm.ZConnection1.HostName;
    ZConnection1.Database:=dm.ZConnection1.Database;
    ZConnection1.Catalog:=dm.ZConnection1.Catalog;
    ZConnection1.User:=dm.ZConnection1.User;
    ZConnection1.Password:=dm.ZConnection1.Password;
 case status of
  FInsert:
  begin

  end;//FInsert
  FUpdate:
  begin
    ZQuery1.Active:=false;
     ZQuery1.SQL.Clear;
     ZQuery1.SQL.Add('SELECT d.dostavka_adress, d.dostavka_person, d.dostavka_telefon FROM dostavka d where d.dostavka_id='+DostavkaId);
    ZQuery1.Active:=true;
     Edit1.Text:=ZQuery1.FieldByName('dostavka_person').AsString;
     Edit2.Text:=ZQuery1.FieldByName('dostavka_adress').AsString;
     Edit3.Text:=ZQuery1.FieldByName('dostavka_telefon').AsString;
    ZQuery1.Active:=false;
  end;//FUpdate
 end;//case
end;

procedure TForm14.Button1Click(Sender: TObject);
begin
 case status of
  FInsert:
  begin
   ZQuery1.Active:=false;
    ZConnection1.Connect;
    ZConnection1.StartTransaction;
     ZQuery1.SQL.Clear;
     ZQuery1.SQL.Add(' insert into dostavka (dostavka_adress, dostavka_person, dostavka_telefon)');
     ZQuery1.SQL.Add(' VALUES ('''+Edit2.Text+''','''+Edit1.Text+''','''+Edit3.Text+''')');
    ZQuery1.ExecSQL;
    ZConnection1.Commit;
    ZConnection1.Disconnect;
  end;//FInsert
  FUpdate:
  begin
    ZQuery1.Active:=false;
    ZConnection1.Connect;
    ZConnection1.StartTransaction;
     ZQuery1.SQL.Clear;
     ZQuery1.SQL.Add(' update dostavka set dostavka_adress='''+Edit2.Text+''',');
     ZQuery1.SQL.Add(' dostavka_person='''+Edit1.Text+''',');
     ZQuery1.SQL.Add(' dostavka_telefon='''+Edit3.Text+'''');
     ZQuery1.SQL.Add(' where dostavka_id='+DostavkaId);
    ZQuery1.ExecSQL;
    ZConnection1.Commit;
    ZConnection1.Disconnect;
  end;//FUpdate
 end;//case

 formResult:=0;
 Close;
end;

procedure TForm14.Button2Click(Sender: TObject);
begin
 formResult:=-1;
 Close;
end;

end.
