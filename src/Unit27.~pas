unit Unit27;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, unit2;

type
  TForm27_avto_upd = class(TForm)
    Edit1: TEdit;
    Edit3: TEdit;
    CheckBox1: TCheckBox;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    Button2: TButton;
    Button1: TButton;
    Label1: TLabel;
    Button4: TButton;
    Panel1: TPanel;
    ListView1: TListView;
    Edit2: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    SQL_text:TStringList;
  public
   Status:TStatus;
   formResult:integer;
   AvtoId,AvtoOwnerId,newAvtoOwnerId:integer;
   AvtoNumber,markAvto:string[50];
   tonag:double;
   peregruz:integer;
    { Public declarations }
  end;

var
  Form27_avto_upd: TForm27_avto_upd;

implementation

uses DB;

{$R *.dfm}

procedure TForm27_avto_upd.FormActivate(Sender: TObject);
begin
  Panel1.Left:=Button4.Left;
  Panel1.Top:=Button4.Top+Button4.Height+2;

  newAvtoOwnerId:=-1;

 SQL_text:=TStringList.Create;
   SQL_text.Clear;
   SQL_text.Add(' SELECT ao.name_owner AS "ФИО владельца", ao.tel_owner AS "Телефон владельца", ao.avto_owner_id FROM  avto_owner ao');
 dm.DBListView(ListView1,SQL_text,dm.ZConnection2,1);

  formResult:=-1;
 case status of
  FInsert:
    begin

    end;//FInsert
  FUpdate:
    begin
       newAvtoOwnerId:=AvtoOwnerId;
     dm.ZQuery2.Active:=false;
       dm.ZQuery2.SQL.Clear;
       dm.ZQuery2.SQL.Add(' SELECT a.avto_number, mark_avto, a.tonag, a.peregruz, ao.name_owner, ao.tel_owner');
       dm.ZQuery2.SQL.Add(' FROM  avto a JOIN avto_owner ao ON a.avto_owner_id = ao.avto_owner_id');
       dm.ZQuery2.SQL.Add(' WHERE a.avto_id='+IntToStr(AvtoId)+' and a.avto_owner_id='+IntToStr(AvtoOwnerId));
     dm.ZQuery2.Active:=true;
       dm.ZQuery2.First;
       Edit1.Text:=dm.ZQuery2.FieldByName('avto_number').AsString;
       Edit2.Text:=dm.ZQuery2.FieldByName('mark_avto').AsString;
       Edit3.Text:=dm.ZQuery2.FieldByName('tonag').AsString;
       CheckBox1.Checked:=StrToBool(dm.ZQuery2.FieldByName('peregruz').AsString);
       Label1.Caption:=dm.ZQuery2.FieldByName('name_owner').AsString+', '+dm.ZQuery2.FieldByName('tel_owner').AsString;
     dm.ZQuery2.Active:=false;
    end;//FUpdate
 end;//case
end;

procedure TForm27_avto_upd.Button4Click(Sender: TObject);
begin
  Panel1.Visible:= not Panel1.Visible;
end;

procedure TForm27_avto_upd.FormDeactivate(Sender: TObject);
begin
 SQL_text.Free;
end;

procedure TForm27_avto_upd.ListView1DblClick(Sender: TObject);
var
 Count:integer;
begin
   if not(ListView1.Selected=nil) then begin
    count:=ListView1.Selected.SubItems.Count;
    newAvtoOwnerId:=StrToInt(ListView1.Selected.SubItems.Strings[count-1]);
    Label1.Caption:=ListView1.Selected.Caption+', '+ListView1.Selected.SubItems.Strings[0];
    Panel1.Visible:=false;
 end;//if
 end;

procedure TForm27_avto_upd.Button1Click(Sender: TObject);
begin
 case status of
  FInsert:
  begin
   if not(newAvtoOwnerId=-1) then begin
    dm.ZQuery2.Active:=false;
      dm.ZConnection2.Connect;
      dm.ZConnection2.StartTransaction;
    dm.ZQuery2.SQL.Clear;
     dm.ZQuery2.SQL.Add(' insert into avto (avto_owner_id,avto_number, mark_avto, peregruz, tonag)');
     dm.ZQuery2.SQL.Add(' VALUES ('+intToStr(newAvtoOwnerId)+',"'+Edit1.Text+'", "'+Edit2.Text+'",'+BoolToStr(CheckBox1.Checked)+','+dm.NumFormat(Edit3.Text)+')');
    dm.ZQuery2.ExecSQL;
      dm.ZConnection2.Commit;
      dm.ZConnection2.Disconnect;
      formResult:=0;
     Close;
   end //if
     else ShowMessage('Выбирите владельца автомобиля.');

   end;//FInsert
  FUpdate:
  begin
     dm.ZQuery2.Active:=false;
      dm.ZConnection2.Connect;
      dm.ZConnection2.StartTransaction;
    dm.ZQuery2.SQL.Clear;
        dm.ZQuery2.SQL.Add(' update avto');
        dm.ZQuery2.SQL.Add(' set avto_owner_id='+intToStr(newAvtoOwnerId));
        dm.ZQuery2.SQL.Add(' ,avto_number="'+Edit1.Text+'"');
        dm.ZQuery2.SQL.Add(' ,mark_avto="'+Edit2.Text+'"');
        dm.ZQuery2.SQL.Add(' ,peregruz='+BoolToStr(CheckBox1.Checked));
        dm.ZQuery2.SQL.Add(' ,tonag='+dm.NumFormat(Edit3.Text));
        dm.ZQuery2.SQL.Add(' where avto_id='+IntToStr(AvtoId));
    dm.ZQuery2.ExecSQL;
      dm.ZConnection2.Commit;
      dm.ZConnection2.Disconnect;
      formResult:=0;
    formResult:=0;
     Close;
  end;//FUpdate
 end;//case

end;

procedure TForm27_avto_upd.Edit3Change(Sender: TObject);
begin
   Edit3.Text:=dm.FilterFloatStr(Edit3.Text);
end;

procedure TForm27_avto_upd.Button2Click(Sender: TObject);
begin
 Close;
end;

end.
