unit Unit4;

interface

uses
  Classes, SysUtils, Graphics;

type
  TSyncThread = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
  end;

implementation

uses unit1, unit2, unit3;

{ Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure TSyncThread.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ TSyncThread }

procedure TSyncThread.Execute;
var
 i:integer;
begin
  while (not Terminated) do begin
    sleep(60);

  if dm.ZConnection1.Ping then begin
                                Form1.Shape1.Brush.Color:=clLime;
                                Form1.Label1.Caption:='База данных '+dm.ZConnection1.Database+' на '+ dm.ZConnection1.HostName+' подключена';
                               end
                          else begin
                                Form1.Shape1.Brush.Color:=clRed;
                                Form1.Label1.Caption:='Нет подключения к базе данных';
                               end;
  // Form1.Memo1.Lines.Clear;

     i:=0;
   while i<dm.ListThread.Count do begin
    if ((dm.ListThread.Objects[i] as TDBThread).stopThread) then
     begin
       (dm.ListThread.Objects[i] as TThread).Terminate;
       (dm.ListThread.Objects[i] as TThread).Free;
        dm.ListThread.Delete(i);
     end;
  //  else
  //    Form1.Memo1.Lines.Add(dm.ListThread.Strings[i]);

      inc(i);
   end;//while Form1.List.Count
  end;//while

  { Place thread code here }
end;

end.
