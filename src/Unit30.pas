unit Unit30;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, unit2;

type
  TForm30_logistic = class(TForm)
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    ListView1: TListView;
    ListView2: TListView;
    ListView3: TListView;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    StaticText6: TStaticText;
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
    procedure ListView2DblClick(Sender: TObject);
    procedure ListView3DblClick(Sender: TObject);
  private
       Count:integer;
    { Private declarations }
  public
    { Public declarations }
     SQL_Disp,SQL_avto,SQL_driver:TStringList;
     AvtoId,DispetcherId,AvtoDriverId,ZakazID:integer;
     NewAvtoId,NewDispetcherId,NewAvtoDriverId:integer;
     Status:TStatus;
  end;

var
  Form30_logistic: TForm30_logistic;

implementation


{$R *.dfm}

procedure TForm30_logistic.FormActivate(Sender: TObject);
begin
 ListView1.Top:= SpeedButton1.Top;
 ListView2.Top:= SpeedButton2.Top;
 ListView3.Top:= SpeedButton3.Top;
 ListView1.Left:=SpeedButton1.Left+SpeedButton1.Width+3;
 ListView2.Left:=SpeedButton2.Left+SpeedButton2.Width+3;
 ListView3.Left:=SpeedButton3.Left+SpeedButton3.Width+3;

 SQL_Disp:=TStringList.Create;
 SQL_Disp.Clear;
 SQL_Disp.Add('SELECT d.name_disp as "��� ����������", d.tel_disp as "���������� �������",d.dispetcher_id FROM Dispetcher d');
 dm.DBListView(ListView1,SQL_Disp,dm.ZConnection2,1);

 SQL_avto:=TStringList.Create;
 SQL_avto.Clear;
 SQL_avto.Add(' SELECT a.avto_number AS "����� ����������", a.mark_avto AS "������", a.tonag AS "�����", a.peregruz AS "��������", ao.name_owner AS "��� ���������", ao.tel_owner AS "������� ���������", a.avto_id, a.avto_owner_id');
 SQL_avto.Add(' FROM  avto a left JOIN avto_owner ao ON a.avto_owner_id = ao.avto_owner_id');
 dm.DBListView(ListView2,SQL_avto,dm.ZConnection2,2);

 SQL_driver:=TStringList.Create;
 SQL_driver.Clear;
 SQL_driver.Add( 'SELECT ad.name_driver AS "��� ��������", ad.tel_driver AS "������� ��������", ad.address AS "����� ��������", ad.avto_driver_id FROM avto_driver ad');
 dm.DBListView(ListView3,SQL_driver,dm.ZConnection2,1);

 NewAvtoId:=-1;
 NewDispetcherId:=-1;
 NewAvtoDriverId:=-1;

     dm.ZQuery2.Active:=false;
       dm.ZQuery2.SQL.Clear;
       dm.ZQuery2.SQL.Add(' select l.avto_id,l.avto_driver_id,l.dispetcher_id, price_avto,price_dispatcher, a.avto_number, a.mark_avto, ad.name_driver, ad.tel_driver, d.name_disp, d.tel_disp');
       dm.ZQuery2.SQL.Add(' from logistiks l join avto a on l.avto_id=a.avto_id');
       dm.ZQuery2.SQL.Add('                  join avto_driver ad on ad.avto_driver_id=l.avto_driver_id');
       dm.ZQuery2.SQL.Add('                  join dispetcher d on l.dispetcher_id=d.dispetcher_id');
       dm.ZQuery2.SQL.Add('  where zakaz_id='+IntToStr(ZakazId));
     dm.ZQuery2.Active:=true;
      if dm.ZQuery2.Eof then Status:=FInsert
      else
        begin
          Status:=FUpdate;
          dm.ZQuery2.First;
          avtoId:=dm.ZQuery2.FieldByName('avto_id').AsInteger;
          AvtoDriverId:=dm.ZQuery2.FieldByName('avto_driver_id').AsInteger;
          dispetcherId:=dm.ZQuery2.FieldByName('dispetcher_Id').AsInteger;
        end;


//       Edit1.Text:=dm.ZQuery2.FieldByName('avto_number').AsString;
//       Edit2.Text:=dm.ZQuery2.FieldByName('mark_avto').AsString;
//       Edit3.Text:=dm.ZQuery2.FieldByName('tonag').AsString;
//       CheckBox1.Checked:=StrToBool(dm.ZQuery2.FieldByName('peregruz').AsString);
//       Label1.Caption:=dm.ZQuery2.FieldByName('name_owner').AsString+', '+dm.ZQuery2.FieldByName('tel_owner').AsString;
     dm.ZQuery2.Active:=false;
end;

procedure TForm30_logistic.SpeedButton1Click(Sender: TObject);
begin
  ListView1.Visible:= not ListView1.Visible;
  ListView2.Visible:=false;
  ListView3.Visible:=false;
end;

procedure TForm30_logistic.SpeedButton2Click(Sender: TObject);
begin
  ListView1.Visible:=false;
  ListView2.Visible:= not ListView2.Visible;
  ListView3.Visible:=false;
end;

procedure TForm30_logistic.SpeedButton3Click(Sender: TObject);
begin
  ListView1.Visible:=false;
  ListView2.Visible:=false;
  ListView3.Visible:= not ListView3.Visible;
end;

procedure TForm30_logistic.FormDeactivate(Sender: TObject);
begin
  SQL_Disp.Free;
  SQL_avto.Free;
  SQL_driver.Free;
end;

procedure TForm30_logistic.ListView1DblClick(Sender: TObject);
begin
   if not(ListView1.Selected=nil) then begin
    count:=ListView1.Selected.SubItems.Count;
    NewDispetcherId:=StrToInt(ListView1.Selected.SubItems.Strings[count-1]);
    StaticText4.Caption:=ListView1.Selected.Caption+', '+ListView1.Selected.SubItems.Strings[0]+'  ';
    ListView1.Visible:=false;
 end;//if
end;

procedure TForm30_logistic.ListView2DblClick(Sender: TObject);
begin
 if not(ListView2.Selected=nil) then begin
    count:=ListView2.Selected.SubItems.Count;
    NewAvtoId:=StrToInt(ListView2.Selected.SubItems.Strings[count-1]);
    StaticText5.Caption:=ListView2.Selected.Caption+', '+ListView2.Selected.SubItems.Strings[0]+'  ';
    ListView2.Visible:=false;
 end;//if
end;

procedure TForm30_logistic.ListView3DblClick(Sender: TObject);
begin
   if not(ListView3.Selected=nil) then begin
      count:=ListView3.Selected.SubItems.Count;
      NewAvtoDriverId:=StrToInt(ListView3.Selected.SubItems.Strings[count-1]);
      StaticText6.Caption:=ListView3.Selected.Caption+', '+ListView3.Selected.SubItems.Strings[0]+'  ';
      ListView3.Visible:=false;
   end;//if
end;

end.
