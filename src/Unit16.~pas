unit Unit16;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, unit2, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset;

type
  TForm16 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    Button1: TButton;
    Button2: TButton;
    ZQuery1: TZQuery;
    procedure FormActivate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    status:TStatus;
    CreatorId:string;
    { Public declarations }
  end;

var
  Form16: TForm16;

implementation

{$R *.dfm}

procedure TForm16.FormActivate(Sender: TObject);
begin
  case status of
  FInsert:
  begin

  end;//FInsert
  FUpdate:
  begin
    ZQuery1.Active:=false;
     ZQuery1.SQL.Clear;
     ZQuery1.SQL.Add('select c.creator_name, c.creator_adress, c.creator_id from creator c where c.creator_id='+CreatorId);
    ZQuery1.Active:=true;
     Edit1.Text:=ZQuery1.FieldByName('creator_name').AsString;
     Edit2.Text:=ZQuery1.FieldByName('creator_adress').AsString;
    ZQuery1.Active:=false;
  end;//FUpdate
 end;//case
end;

procedure TForm16.Button2Click(Sender: TObject);
begin
  Close;
end;

end.
