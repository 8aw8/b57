unit Unit2;

interface

uses
  SysUtils, Classes, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZConnection, ComCtrls, Controls, Grids, Unit3, Unit1, Unit4, Unit21;

type
 TId = class(TObject)
  private
    { Private declarations }
  public
    ID:string;{ Public declarations }
 end;
  TNumeric=set of char;
  TStatus=(FUpdate,FInsert);
  TStatusPrice=(FUpdatePrice,FInsertPrice,FUpdateDataPrice);

  TDM = class(TDataModule)
    ZConnection1: TZConnection;
    ZQuery1: TZQuery;
    ZConnection2: TZConnection;
    ZConnection3: TZConnection;
    ZConnection4: TZConnection;
    ZQuery2: TZQuery;
  private
    { Private declarations }


  public
    NewListView:TListView;
    { Public declarations }
    SyncThread:TSyncThread;
    DBThread:TDBThread;
    findListViewThread:TFindThread;
    ListThread:TStringList;
    a:set of char;
 //  procedure DBListView(ListView:TListView; SQLtext:string; Connect: TZConnection; HideFields:word);
   function floatNum(s:string):TNumeric;
   procedure DBListView(ListView:TListView; SQL_text:TStringList; Connect: TZConnection; HideFields:word);
   function ReplaceStr(const s, srch, replace: string): string;
   function FilterStr(s:string):string;
   function FilterFloatStr(s:string):string;
   function NumFormat(s:string):string;
   procedure DBStringGridView(sg:TStringGrid; SQL_text:TStringList; Connect: TZConnection; HideFields:word);
   procedure initConnect(Connect: TZConnection);
   procedure CopyListView(src_ListView,dsc_ListView:TListView);
   function findListView(ListView1:TListView; var ListView2:TListView;  datePrice:TDate; FindString:string; idCategory:string):TDBThread;

  end;

var
  DM: TDM;

implementation

uses Unit10;


{$R *.dfm}

function TDM.floatNum;
begin
 if s='' then result:=['0'..'9']
 else if (s[1]='0') and (length(s)=1) then result:=[',','.']
 else if (pos(',',s)>0) or (pos('.',s)>0) then result:=['0'..'9']
 else result:=['0'..'9','.',','];
end;

function TDM.NumFormat(s:string):string;
var
 count,i:integer;
begin
  if s='' then s:='0'
  else begin
  count:=length(s);
  i:=1;
  while i<=count do begin
   if s[i]=',' then begin
                     s[i]:='.';
                     i:=count;
                    end;
     inc(i);
  end;//while
  end;//else
  result:=s;
end;

procedure TDM.DBStringGridView;
var
 zQuery:TZQuery;i,rowCount,ColCount:integer;
 ZConnect:TZConnection;
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

      ZQuery.Connection:=zconnect;
      ZQuery.SQL.Clear;
//      ZQuery.SQL.Add(SQLtext);
      for i:=0 to SQL_text.Count-1 do begin
        ZQuery.SQL.Add(SQL_text.Strings[i]);
      end;//for i

      ZQuery.Active:=true;
   except
      on E: Exception do begin
                          //ShowMessage(E.Message);
                          Form10.Label1.Caption:=E.Message;
                          Form10.ShowModal;
                         //    StopThread:=true;
                         end;
      //   (E.Message, E.HelpContext);
     end;
       sg.FixedRows:=1;
       sg.ColCount:=ZQuery.FieldCount;
       sg.Rows[0].Clear;
       for i:=0 to ZQuery.FieldCount-1 do begin
        sg.Rows[0].Add(ZQuery.Fields[i].FullName);
        sg.ColWidths[i]:=length(ZQuery.Fields[i].FullName)*8;
      end;//for
       ZQuery.First;
      if ZQuery.Eof then begin
          sg.FixedRows:=1;
          sg.RowCount:=2;
      end;

       ZQuery.First;
       while not(ZQuery.Eof) do begin
          RowCount:=sg.RowCount;
           for i:=0 to ZQuery.FieldCount-1 do begin
            SG.Rows[RowCount-1].Add(ZQuery.Fields[i].AsString);
           end;//for
          sg.RowCount:=sg.RowCount+1;
        ZQuery.Next;
       end;//while

       for i:=1 to HideFields do begin
        sg.ColWidths[sg.ColCount-i]:=-1;
       end;//for

       sg.RowCount:=sg.RowCount-1;

      zConnect.Connected:=false;
      ZQuery.Active:=false;
      ZQuery.Free;
      zConnect.Free;
end;

function TDM.FilterStr(s:string):string;
var
 i:integer;
begin
 a:=['0','1','2','3','4','5','6','7','8','9','.',','];
 result:='';
 for i:=1 to Length(s) do
  if s[i] in a then result:=result+s[i];
end;

function TDM.FilterFloatStr(s:string):string;
var
 i:integer;
 points:set of char;
 s1:string;
begin
  a:=['0','1','2','3','4','5','6','7','8','9','.',','];
  points:=['.',','];
  result:='';
  if not(length(s)=0) then begin
    if (s[1] in points) then s:=copy(s,2,Length(s)-1);
   // if (s[length(s)] in points) then s:=copy(s,1,Length(s)-1);
  end;//if

 for i:=1 to Length(s) do begin
  if s[i] in a then
                  if (s[i] in points) then
                    begin
                      result:=result+s[i];
                     // result:=result+'.';
                      a:=a-points;
                    end
                  else
                    begin
                      result:=result+s[i];
                    end;
 end;//for
//  if not(length(s)=0) then begin
//   if (s[1] in points) then result:='0'+s;
 //  if (s[length(s)] in points) then result:=s+'0';
//  end;//if
 //result:=NumFormat(result);
end;

procedure TDM.DBListView;
   begin
     DBThread:=TDBThread.Create(true);
     DBThread.Connect:=Connect;
     DBThread.SQL_text:=SQL_Text;
     DBThread.ListView:=ListView;
     DBThread.HideFields:=HideFields;
     ListThread.AddObject(intToStr(DBThread.ThreadID),DBThread);
     DBThread.Resume;
   end;

function TDM.ReplaceStr(const s, srch, replace: string): string;
var
i : integer;
source: string;
begin
source:= s;
result:= '';
repeat
i:=pos(srch, source);
if i > 0 then begin
result := result + copy(source,1,i-1) + replace;
source := copy (source,i+length(srch),maxint);
end
else
result := result + source;
until i<=0;
end;
procedure TDM.initConnect;
  begin
    Connect.HostName:=dm.ZConnection1.HostName;
    Connect.Database:=dm.ZConnection1.Database;
    Connect.Catalog:=dm.ZConnection1.Catalog;
    Connect.User:=dm.ZConnection1.User;
    Connect.Password:=dm.ZConnection1.Password;
  end;

procedure TDM.CopyListView;
var
 i:integer;
 item:TListItem;
 Column:TListColumn;
begin
  dsc_ListView.Columns.Clear;
 for i:=0 to src_ListView.Columns.Count-1 do begin
     Column:=dsc_ListView.Columns.Add;
     Column.Caption:=src_ListView.Columns.Items[i].Caption;
     Column.Width:=src_ListView.Columns.Items[i].Width;
 end;//for

  dsc_ListView.Items.Clear;
 for i:=0 to src_ListView.Items.Count-1 do begin
    Item:=dsc_ListView.Items.Add;
    Item.Caption:=src_ListView.Items[i].Caption;
    Item.SubItems.AddStrings(src_ListView.Items[i].SubItems);
 end;//for
end;

function TDM.findListView;
begin
     findListViewThread:=TFindThread.Create(true);
     findListViewThread.ListView1:=ListView1;
     findListViewThread.ListView2:=ListView2;
     findListViewThread.datePrice:=datePrice;
     findListViewThread.FindString:=FindString;
     findListViewThread.idCategory:=idCategory;
//     DBThread.Connect:=Connect;
  //   DBThread.SQL_text:=SQL_Text;
//     DBThread.ListView:=ListView;
//     DBThread.HideFields:=HideFields;
     ListThread.AddObject(intToStr(findListViewThread.ThreadID),findListViewThread);
     findListViewThread.Resume;
     result:=findListViewThread;
end;

end.
