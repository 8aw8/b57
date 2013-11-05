unit Unit8;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IniFiles;

type
  TForm8 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit4: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    iniFile:TIniFile;
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

{$R *.dfm}
 uses Unit2;

procedure TForm8.Button3Click(Sender: TObject);
begin
 Close;
end;

procedure TForm8.Button1Click(Sender: TObject);
begin
 IniFile:=TIniFile.Create(ExtractfilePath(Application.Exename)+'connectDb.ini');
 iniFile.WriteString('ConnectDB','DBhost',Edit1.Text);
 iniFile.WriteString('ConnectDB','DBname',Edit2.Text);
 iniFile.WriteString('ConnectDB','DBUser',Edit3.Text);
 iniFile.WriteString('ConnectDB','DBpassword',Edit4.Text);
 IniFile.UpdateFile;
 IniFile.Destroy;
 Close;
end;

procedure TForm8.FormCreate(Sender: TObject);
begin
 if FileExists(ExtractfilePath(Application.Exename)+'connectDb.ini') then begin
   IniFile:=TIniFile.Create(ExtractfilePath(Application.Exename)+'connectDb.ini');
    Edit1.Text:=iniFile.ReadString('ConnectDB','DBhost','');
    Edit2.Text:=iniFile.ReadString('ConnectDB','DBname','');
    Edit3.Text:=iniFile.ReadString('ConnectDB','DBUser','');
    Edit4.Text:=iniFile.ReadString('ConnectDB','DBpassword','');
   IniFile.Destroy;
  end;
end;

procedure TForm8.Button2Click(Sender: TObject);
begin
 try
  dm.ZConnection1.Connected:=false;
  dm.ZConnection1.HostName:=Edit1.Text;
  dm.ZConnection1.Database:=Edit2.Text;
  dm.ZConnection1.Catalog:=Edit2.Text;
  dm.ZConnection1.User:=Edit3.Text;
  dm.ZConnection1.Password:=Edit4.Text;
  dm.ZConnection1.Connected:=true;
 except
   on E: Exception do  ShowMessage(E.Message);
//   (E.Message, E.HelpContext);
 end;
  if dm.ZConnection1.Connected then begin
   ShowMessage('База данных подключена.');
   dm.ZConnection1.Connected:=false;
  end;

end;

end.
