unit Unit23;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Unit2;

type
  TForm23_disp_upd = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
     Status:TStatus;
     formResult:integer;
     dispetcherId,Disp_tel,Disp_name:string;

    { Public declarations }
  end;

var
  Form23_disp_upd: TForm23_disp_upd;

implementation

{$R *.dfm}

procedure TForm23_disp_upd.FormActivate(Sender: TObject);
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
       dm.ZQuery2.SQL.Add('SELECT d.name_disp,d.tel_disp FROM Dispetcher d where d.dispetcher_id='+dispetcherId);
     dm.ZQuery2.Active:=true;
       Edit1.Text:=dm.ZQuery2.FieldByName('name_disp').AsString;
       Edit2.Text:=dm.ZQuery2.FieldByName('tel_disp').AsString;
     dm.ZQuery2.Active:=false;
    end;//FUpdate
 end;//case
end;

procedure TForm23_disp_upd.Button1Click(Sender: TObject);
begin
 case status of
  FInsert:
  begin
    dm.ZQuery2.Active:=false;
      dm.ZConnection2.Connect;
      dm.ZConnection2.StartTransaction;
    dm.ZQuery2.SQL.Clear;
     dm.ZQuery2.SQL.Add(' insert into Dispetcher (name_disp,tel_disp)');
     dm.ZQuery2.SQL.Add(' VALUES ('''+Edit1.Text+''','''+Edit2.Text+''')');
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
      dm.ZQuery2.SQL.Add(' update Dispetcher');
      dm.ZQuery2.SQL.Add(' set name_disp="'+Edit1.Text+'",tel_disp="'+Edit2.Text+'"');
      dm.ZQuery2.SQL.Add(' where dispetcher_id='+dispetcherId);
    dm.ZQuery2.ExecSQL;
      dm.ZConnection2.Commit;
      dm.ZConnection2.Disconnect;
      formResult:=0;
    formResult:=0;
  end;//FUpdate
 end;//case
   Close;
end;

procedure TForm23_disp_upd.Button2Click(Sender: TObject);
begin
  Close;
end;

end.
