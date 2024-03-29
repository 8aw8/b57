unit Unit3;

{
procedure TDBThread.UpdateListView;
var
 Item:TListItem; i,j:integer;
 Items:TListItems;
 Column:TListColumn;
begin

  ListView.Columns.Clear;
  ListView.Clear;

  for i:=0 to ZQuery.FieldCount-1 do begin
        Column:=ListView.Columns.Add;
        Column.Caption:=ZQuery.Fields[i].FullName;
  end;//for

  for j:=1 to 100 do begin
 ZQuery.First;
 while not(ZQuery.Eof) do begin
  item:=ListView.Items.Add;
  item.Caption:=ZQuery.Fields[0].AsString;
  ZQuery.Next;
  for i:=1 to ZQuery.FieldCount-1 do begin
    item.SubItems.Add(ZQuery.Fields[i].AsString);
  end;//for
 end;//while
 end;//for j

end;
}

interface

uses
  Classes, SysUtils, ComCtrls, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZConnection, ExtCtrls, StdCtrls;

type
  TDBThread = class(TThread)
  private
    { Private declarations }
    ZQuery:TZQuery;
    ZConnect: TZConnection;
    Panel:TPanel;
    Button:TButton;
    procedure UpdateListView();
    function ConnectDB:boolean;
    procedure ShowListView();
    procedure ShowPanel();
    procedure HidePanel();
  protected
    procedure Execute; override;
  public
    ListView:TListView;
    SQLtext:string;
    SQL_text:TStringList;
    Connect: TZConnection;
    HideFields:word;
    StopThread:boolean;
 //   columnSize:array of integer;
    procedure ButtonClick (Sender: TObject);
  end;

implementation

uses Unit1, Unit2, unit10;

{ Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure TDBThread.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ TDBThread }

function TDBThread.ConnectDB;
var
 i:integer;
begin
  try
    zQuery:=TZQuery.Create(DM);
    ZConnect:=TZConnection.Create(DM);
    ZConnect.HostName:=Connect.HostName;
    ZConnect.Database:=Connect.Database;
    ZConnect.Catalog:=Connect.Catalog;
    ZConnect.User:=Connect.User;
    ZConnect.Password:=Connect.Password;
    ZConnect.Protocol:=Connect.Protocol;
    for i:=0 to Connect.Properties.Count-1 do
     ZConnect.Properties.Add(Connect.Properties.Strings[i]);

      Zconnect.Connected:=true;
      ZQuery.Connection:=ZConnect;
      ZQuery.SQL.Clear;
//      ZQuery.SQL.Add(SQLtext);
      ZQuery.SQL.Assign(SQL_text);
      ZQuery.Active:=true;
  except
      on E: Exception do begin
                          //ShowMessage(E.Message);
                          Form10:=TForm10.Create(Form1);
                          Form10.Label1.Caption:=E.Message;
                          Form10.ShowModal;
                          form10.Free;
                           ZQuery.Active:=false;
                           ZQuery.Free;
                           ZConnect.Disconnect;
                           ZConnect.Free;
                          StopThread:=true;
                         end;
      //   (E.Message, E.HelpContext);
  end;
  result:=not StopThread;
end;

procedure TDBThread.ShowListView;
var
 Column:TListColumn;
 a:TWidth;
 Item:TListItem;
 i,j:integer;
 ss:TWidth;
 ColumnSize:TStringList;
begin
  StopThread:=false;
    ShowPanel;
 if ConnectDB then begin

  ColumnSize:=TStringList.Create;
  ColumnSize.Clear;

  ListView.Columns.Clear;
  ListView.Clear;

      for i:=0 to ZQuery.FieldCount-1 do begin
          ColumnSize.Add(intToStr(length(ZQuery.Fields[i].FullName)));
      end;//for

      for i:=0 to ZQuery.FieldCount-1-HideFields do begin
        Column:=ListView.Columns.Add;
        Column.Caption:=ZQuery.Fields[i].FullName;
      end;//for

      ZQuery.First;
 //      ListView.Items.BeginUpdate;
       while not(ZQuery.Eof) and not(Terminated) do begin
          item:=ListView.Items.Add;
          item.Caption:=ZQuery.Fields[0].AsString;
        if length(item.Caption)>strToInt(columnSize.Strings[0]) then columnSize.Strings[0]:=intToStr(length(item.Caption));
          for i:=1 to ZQuery.FieldCount-1 do begin
            item.SubItems.Add(ZQuery.Fields[i].AsString);
            if length(ZQuery.Fields[i].AsString)>strToInt(columnSize.Strings[i]) then columnSize.Strings[i]:=intToStr(length(ZQuery.Fields[i].AsString));
          end;//for
        ZQuery.Next;
       end;//while

      for i:=0 to ZQuery.FieldCount-1-HideFields do begin
   //      ListView.Columns[i].Width:= ListView.Canvas.TextWidth(StringOfChar('A', columnSize[i]+1));
        ListView.Columns[i].Width:= ListView.Canvas.TextWidth(StringOfChar('A', strToInt(columnSize.Strings[i])+1));
      end;//for
          columnSize.Clear;
          columnSize.Free;

 //     ListView.Items.EndUpdate;
    ZQuery.Active:=false;
    ZConnect.Connected:=false;

   end;//  if ConnectDB

      HidePanel;

     ZQuery.Free;
     ZConnect.Free;
     StopThread:=true;
end;

procedure TDBThread.ButtonClick;
begin
 (Sender as TButton).Caption:='������ ������';
  HidePanel;
 StopThread:=true;
  Terminate;
end;

procedure TDBThread.UpdateListView;
begin

end;
procedure  TDBThread.ShowPanel;
begin
   // Form1.Panel1.Visible:=true;
 Panel:=TPanel.Create(ListView);
 Panel.Parent:=ListView;
 Panel.Width:=200;
 Panel.Height:=100;
 Panel.left:=(ListView.Width-panel.Width) div 2;
 Panel.Top:=(ListView.Height-panel.Height) div 2;
 Button:=TButton.Create(Panel);
 Button.Parent:=Panel;
 Button.Width:=80;
 Button.Height:=50;
 Button.Left:=(Panel.Width-Button.Width) div 2;
 Button.Top:=(Panel.Height-Button.Height) div 2;
 Button.OnClick:=ButtonClick;
end;

procedure  TDBThread.HidePanel;
var
 i:integer;
begin
    Button.Visible:=false;
    Button.Free;
    Panel.Visible:=false;
    Panel.Free;
end;

procedure TDBThread.Execute;
begin
   Synchronize(ShowListView);
    // ShowListView;

end;

end.
