unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, System.Actions,
  Vcl.ActnList, Vcl.Menus, Vcl.ToolWin, System.ImageList, Vcl.ImgList;

type
  TfmMain = class(TForm)
    sbBottomMain: TStatusBar;
    AL: TActionList;
    IL: TImageList;
    menuMain: TMainMenu;
    ToolBar1: TToolBar;
    btnConnect: TToolButton;
    btnDisconnect: TToolButton;
    btnRangeDT: TToolButton;
    actConnect: TAction;
    actDisconnect: TAction;
    actRangeDT: TAction;
    procedure actRangeDTExecute(Sender: TObject);
    procedure sbBottomMainDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
      const Rect: TRect);
  private
    { Private declarations }
    procedure setRangeInfoToSB(panel: TStatusPanel; dtBeg, dtEnd: TDate);
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

implementation

{$R *.dfm}

uses RangeDT;

procedure TfmMain.actRangeDTExecute(Sender: TObject);
var
   dfmRange: TfmRangeDT;
begin
     dfmRange := TfmRangeDT.Create(Application);

     try
      if dfmRange.ShowModal = mrOk then
        setRangeInfoToSB(sbBottomMain.Panels[2], dfmRange.dtpBeg.Date, dfmRange.dtpEnd.Date);
     finally
       FreeAndNil(dfmRange);
     end;
end;

procedure TfmMain.sbBottomMainDrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
  with StatusBar.Canvas do
    try
      Font.Style := Font.Style + [TFontStyle.fsBold];
      Font.Name := 'Time New Roman';
      Panel.Alignment := taCenter;

      if Panel.Index = 2 then
        Begin
          Font.Color := clGreen;
          IL.Draw(sbBottomMain.Canvas, Rect.Left, Rect.Top, 16);
        End;
    finally
      TextOut(Rect.Left+25, Rect.Top, Panel.Text);
    end;
end;

procedure TfmMain.setRangeInfoToSB(panel: TStatusPanel; dtBeg, dtEnd: TDate);
begin
  panel.Text := Format('[%s] - [%s]', [FormatDateTime('dd.mm.yyyy', dtBeg),
                                       FormatDateTime('dd.mm.yyyy', dtEnd)]);
end;

end.
