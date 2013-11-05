unit Unit29;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Unit2;

type
  TForm29_owner_upd = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
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
     AutoOwnerId:integer;
  end;

var
  Form29_owner_upd: TForm29_owner_upd;

implementation

{$R *.dfm}

procedure TForm29_owner_upd.FormActivate(Sender: TObject);
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
       dm.ZQuery2.SQL.Add('select name_owner, tel_owner from avto_owner where avto_owner_id='+intToStr(AutoOwnerId));
     dm.ZQuery2.Active:=true;
       Edit1.Text:=dm.ZQuery2.FieldByName('name_owner').AsString;
       Edit2.Text:=dm.ZQuery2.FieldByName('tel_owner').AsString;
     dm.ZQuery2.Active:=false;
    end;//FUpdate
 end;//case
end;

procedure TForm29_owner_upd.Button1Click(Sender: TObject);
begin
 case status of
  FInsert:
  begin
    dm.ZQuery2.Active:=false;
      dm.ZConnection2.Connect;
      dm.ZConnection2.StartTransaction;
    dm.ZQuery2.SQL.Clear;
    dm.ZQuery2.SQL.Add(' insert into avto_owner (name_owner, tel_owner)');
    dm.ZQuery2.SQL.Add(' values ('''+Edit1.Text+''','''+Edit2.Text+''')');
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
      dm.ZQuery2.SQL.Add(' update avto_owner');
      dm.ZQuery2.SQL.Add(' set name_owner="'+Edit1.Text+'",tel_owner="'+Edit2.Text+'"');
      dm.ZQuery2.SQL.Add(' where avto_owner_id='+intToStr(AutoOwnerId));
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
