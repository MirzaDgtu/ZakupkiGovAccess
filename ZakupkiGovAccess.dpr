program ZakupkiGovAccess;

uses
  Vcl.Forms,
  RangeDT in 'RangeDT.pas' {fmRangeDT},
  Main in 'Main.pas' {fmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfmMain, fmMain);
  Application.Run;
end.
