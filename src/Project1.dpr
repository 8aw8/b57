program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {DM: TDataModule},
  Unit3 in 'Unit3.pas',
  aaa in 'aaa.pas',
  Unit4 in 'Unit4.pas',
  Unit5 in 'Unit5.pas' {Form5},
  Unit6 in 'Unit6.pas' {Form6},
  Unit7 in 'Unit7.pas' {Form7},
  Unit8 in 'Unit8.pas' {Form8},
  Unit9 in 'Unit9.pas' {Form9},
  Unit11 in 'Unit11.pas' {Form11},
  Unit10 in 'Unit10.pas' {Form10},
  Unit12 in 'Unit12.pas' {Form12},
  Unit13 in 'Unit13.pas' {Form13},
  Unit14 in 'Unit14.pas' {Form14},
  Unit15 in 'Unit15.pas' {Form15},
  Unit16 in 'Unit16.pas' {Form16},
  Unit17 in 'Unit17.pas' {Form17},
  Unit18 in 'Unit18.pas' {Form18},
  Unit19 in 'Unit19.pas' {Form19},
  Unit20 in 'Unit20.pas' {Form20},
  Unit21 in 'Unit21.pas',
  Unit22 in 'Unit22.pas' {Form22_disp},
  Unit23 in 'Unit23.pas' {Form23_disp_upd},
  Unit24 in 'Unit24.pas' {Form24_driver},
  Unit25 in 'Unit25.pas' {Form25_driver_upd},
  Unit26 in 'Unit26.pas' {Form26_avto},
  Unit27 in 'Unit27.pas' {Form27_avto_upd},
  Unit28 in 'Unit28.pas' {Form28_owner},
  Unit29 in 'Unit29.pas' {Form29_owner_upd},
  Unit30 in 'Unit30.pas' {Form30_logistic};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'b52';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TForm8, Form8);
  Application.CreateForm(TForm9, Form9);
  Application.CreateForm(TForm11, Form11);
  Application.CreateForm(TForm10, Form10);
  Application.CreateForm(TForm15, Form15);
  Application.CreateForm(TForm12, Form12);
  Application.CreateForm(TForm13, Form13);
  Application.CreateForm(TForm14, Form14);
  Application.CreateForm(TForm16, Form16);
  Application.CreateForm(TForm17, Form17);
  Application.CreateForm(TForm18, Form18);
  Application.CreateForm(TForm19, Form19);
  Application.CreateForm(TForm20, Form20);
  Application.CreateForm(TForm22_disp, Form22_disp);
  Application.CreateForm(TForm23_disp_upd, Form23_disp_upd);
  Application.CreateForm(TForm24_driver, Form24_driver);
  Application.CreateForm(TForm25_driver_upd, Form25_driver_upd);
  Application.CreateForm(TForm26_avto, Form26_avto);
  Application.CreateForm(TForm27_avto_upd, Form27_avto_upd);
  Application.CreateForm(TForm28_owner, Form28_owner);
  Application.CreateForm(TForm29_owner_upd, Form29_owner_upd);
  Application.CreateForm(TForm30_logistic, Form30_logistic);
  Application.Run;
end.
