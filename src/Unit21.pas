unit Unit21;

interface

uses
  Classes, ComCtrls, Controls, SysUtils, unit3;

type
  TFindThread = class(TDBThread)
  private
    { Private declarations }
   procedure FindNomenklatura;
  protected
    procedure Execute; override;
  public
    StopThread:boolean;
    ListView1,ListView2:TListView;
    datePrice:TDate;
    FindString:string;
    idCategory:string;
  end;

implementation

{ Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure TFindThread.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ TFindThread }

procedure TFindThread.FindNomenklatura;
var
 i:integer;s:string;
 item:TListItem;
begin
   ListView2.Items.Clear;
 //  ListView1.Items.BeginUpdate;
 //  ListView2.Items.BeginUpdate;

    i:=0;

 if FindString='' then
  While (i<=ListView1.Items.Count-1) and (not StopThread) do begin
   s:=ListView1.Items[i].SubItems.Strings[ListView1.Items[i].SubItems.Count-3];
//               sleep(30);
   if (
        ((IDCategory=s) or (IDCategory='-1')) and
        (datePrice<=strToDate(ListView1.Items[i].SubItems.Strings[4]))
      )  then begin
    Item:=ListView2.Items.Add;
    Item.Caption:=ListView1.Items[i].Caption;
    Item.SubItems.AddStrings(ListView1.Items[i].SubItems);
   end;//if
    inc(i);
  end//while
 else
 While (i<=ListView1.Items.Count-1) and (not StopThread) do begin
  //       sleep(30);
    s:=ListView1.Items[i].SubItems.Strings[ListView1.Items[i].SubItems.Count-3];
  if  (datePrice<=strToDate(ListView1.Items[i].SubItems.Strings[4])) and
      (pos(FindString, ListView1.Items[i].Caption)>0)  and
      ((IDCategory=s) or (IDCategory='-1'))
   then begin
    Item:=ListView2.Items.Add;
    Item.Caption:=ListView1.Items[i].Caption;
    Item.SubItems.AddStrings(ListView1.Items[i].SubItems);
   end;//if
    inc(i);
 end;//while

 //  ListView1.Items.EndUpdate;
 //  ListView2.Items.EndUpdate;

end;

procedure TFindThread.Execute;
begin
 StopThread:=false;
// Synchronize(FindNomenklatura);
  FindNomenklatura;
  { Place thread code here }
  StopThread:=true;
end;

end.
 