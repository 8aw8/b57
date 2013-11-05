unit Unit17;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, ComObj, OleServer, ExcelXP, Gauges, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, unit2;

type
  TForm17 = class(TForm)
    Button1: TButton;
    StringGrid1: TStringGrid;
    OpenDialog1: TOpenDialog;
    Button2: TButton;
    ExcelApplication1: TExcelApplication;
    Gauge1: TGauge;
    Button3: TButton;
    ComboBox1: TComboBox;
    ZQuery1: TZQuery;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
   FileName:string;
   XL: variant;
   id:TId;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form17: TForm17;

implementation

{$R *.dfm}




procedure TForm17.Button1Click(Sender: TObject);
var
 i,Column,Row:integer;
 WorkBook:OleVariant;
 range,ValueArray:OleVariant;
begin
 if OpenDialog1.Execute then begin
  FileName:=OpenDialog1.FileName;
  try
   XL := CreateOleObject('Excel.Application');
  // Чтоб не задавал вопрос о сохранении документа
   XL.DisplayAlerts := false;
  // новый документ
 //  XL.WorkBooks.Add;
  // или загружаем его
  XL.Visible:=true;
  WorkBook:=XL.WorkBooks.Open(FileName);
   StringGrid1.RowCount:=XL.ActiveSheet.UsedRange.Rows.Count;
   StringGrid1.ColCount:=XL.ActiveSheet.UsedRange.Columns.Count+1;
//   ValueArray := VarArrayCreate([0, StringGrid1.RowCount-1, 0, StringGrid1.ColCount-1], varVariant);
 //  ValueArray:=XL.ActiveSheet.UsedRange.value;

    Gauge1.MinValue:=1;
    Gauge1.MaxValue:=StringGrid1.RowCount;

  for i:=0 to StringGrid1.RowCount do begin
   StringGrid1.Cells[1,i]:=XL.WorkBooks[1].WorkSheets[1].cells[i+1,1];
   StringGrid1.Cells[2,i]:=XL.WorkBooks[1].WorkSheets[1].cells[i+1,2];
   Gauge1.Progress:=i;
  // StringGrid1.Cells[1,i]:=ValueArray[i,1];
  end;//for

  finally
   XL.Quit;
   XL := Unassigned;
  end;

 end;//if

end;

procedure TForm17.Button2Click(Sender: TObject);
var
  WorkBk : _WorkBook;
  WorkSheet : _WorkSheet;
  K, R, X, Y, i : Integer;
  IIndex : OleVariant;
  RangeMatrix : Variant;
  NomFich : WideString;
  elem: OleVariant;
begin
 if OpenDialog1.Execute then begin
  ExcelApplication1.Connect;
  ExcelApplication1.Visible[0]:=true;
//  ExcelApplication1.Visible
  ExcelApplication1.Workbooks.Open(OpenDialog1.FileName,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,0);
  WorkBk := ExcelApplication1.WorkBooks.Item[1];
  WorkSheet := WorkBk.WorkSheets.Get_Item(1) as _WorkSheet;
  // столбцов, мы активируем его последнюю непустую ячейку
  WorkSheet.Cells.SpecialCells(xlCellTypeLastCell,EmptyParam).Activate;
   // Получаем значение последней строки
   StringGrid1.RowCount := ExcelApplication1.ActiveCell.Row+1;
   // Получаем значение последней колонки
   StringGrid1.ColCount:= ExcelApplication1.ActiveCell.Column+1;

   Gauge1.MinValue:=1;
   Gauge1.MaxValue:=StringGrid1.RowCount;

  // WorkSheet.Range[]

   for i:=1 to StringGrid1.RowCount do begin
    StringGrid1.Cells[1,i]:=ExcelApplication1.Cells.Item[i,1];
    StringGrid1.Cells[2,i]:=ExcelApplication1.Cells.Item[i,2];
    Gauge1.Progress:=i;
   end;//for

   ExcelApplication1.Quit;
   ExcelApplication1.Disconnect;
 end;

end;

procedure TForm17.FormActivate(Sender: TObject);
begin
 dm.initConnect(dm.ZConnection3);
 id:=TId.Create;
  id.ID:='-1';
  ComboBox1.Items.Clear;
  ComboBox1.Items.AddObject('Не выбран',id);
  ComboBox1.ItemIndex:=0;

 ZQuery1.Active:=false;
  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add('select name_category,category_id from product_category');
 ZQuery1.Active:=true;

  ZQuery1.First;
 while not(ZQuery1.Eof) do begin
  id:=TId.Create;
  id.ID:=ZQuery1.FieldByName('category_id').AsString;
  ComboBox1.Items.AddObject(ZQuery1.FieldByName('name_category').AsString,id);
  ZQuery1.Next;
 end;//while
end;

end.
