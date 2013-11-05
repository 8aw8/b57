unit Unit13;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm13 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    Count,price,transport_price:string;
    return:integer;
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation

{$R *.dfm}

Uses unit2;

procedure TForm13.Button1Click(Sender: TObject);
begin
 Count:=dm.NumFormat(Edit1.Text);
 Price:=dm.NumFormat(Edit2.Text);
 transport_price:=dm.NumFormat(Edit3.Text);
 return:=0;
 Close;
end;

procedure TForm13.Button2Click(Sender: TObject);
begin
  return:=-1;
  Close;
end;

end.
