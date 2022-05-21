unit RangeDT;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls;

type
  TfmRangeDT = class(TForm)
    grbRandeDT: TGroupBox;
    lblBegDT: TLabel;
    lblEndDT: TLabel;
    dtpBeg: TDateTimePicker;
    dtpEnd: TDateTimePicker;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    procedure dtpEndChange(Sender: TObject);
    procedure dtpBegChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmRangeDT: TfmRangeDT;

implementation

{$R *.dfm}

{ TfmRangeDT }


procedure TfmRangeDT.dtpBegChange(Sender: TObject);
begin
  if dtpBeg.Date > dtpEnd.Date then
    dtpEnd.Date := dtpBeg.Date;
end;

procedure TfmRangeDT.dtpEndChange(Sender: TObject);
begin
     if dtpEnd.Date < dtpBeg.Date then
       dtpBeg.Date := dtpEnd.Date;
end;

end.
