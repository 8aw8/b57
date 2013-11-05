unit Unit15;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm15 = class(TForm)
    Edit1: TEdit;
    StaticText1: TStaticText;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    formResult:integer;
  end;

var
  Form15: TForm15;


implementation

{$R *.dfm}

uses unit2;

procedure TForm15.Button1Click(Sender: TObject);
begin
  formResult:=0;
  Close;
end;

procedure TForm15.Button2Click(Sender: TObject);
begin
  formResult:=-1;
  Close;
end;

procedure TForm15.Edit1Change(Sender: TObject);
begin
 //edit1.Text:=dm.FilterStr(edit1.Text);
end;

procedure TForm15.FormActivate(Sender: TObject);
begin
  Edit1.Text:='1';
end;

procedure TForm15.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if not ((Key in ['0'..'9',',','.']) or (ord(key) in [8,13])) then key:=char(0);
end;

end.
