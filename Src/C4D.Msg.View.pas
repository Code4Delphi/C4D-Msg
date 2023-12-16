unit C4D.Msg.View;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.ExtCtrls,
  Vcl.Buttons,
  Vcl.StdCtrls,
  Vcl.Menus,
  Vcl.ImgList,
  System.ImageList,
  C4D.Types,
  C4D.Params;

type
  TC4DMsgView = class(TForm)
    pnButtons: TPanel;
    pnDetailsBack: TPanel;
    mmDetails: TMemo;
    ImageList1: TImageList;
    pnTop: TPanel;
    pnDetalhes: TPanel;
    pnVerMaisDetalhesBack: TPanel;
    lbSeeDetails: TLabel;
    pnLogoBack: TPanel;
    imgIcon: TImage;
    mmMsg: TMemo;
    btnYes: TBitBtn;
    btnNo: TBitBtn;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure lbSeeDetailsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnYesClick(Sender: TObject);
    procedure btnNoClick(Sender: TObject);
  private
    FHeightFormExpanded: Integer;
    FHeightPanelDetails: Integer;
    FHeightFormWithdrawn: Integer;
    FParams: TC4DParams;
    procedure ConfigButtons;
    procedure MemoTextVerticalCenter(const AMemo: TMemo; const ANumLinesDisplay: Integer);
  public
    property Params: TC4DParams write FParams;
  end;

implementation

{$R *.dfm}

procedure TC4DMsgView.FormCreate(Sender: TObject);
begin
  Self.FormStyle := fsStayOnTop;
  FHeightFormExpanded := Self.Height;
  FHeightPanelDetails := pnDetailsBack.Height;
  FHeightFormWithdrawn := FHeightFormExpanded - FHeightPanelDetails;
  Constraints.MinHeight := FHeightFormWithdrawn;
  Constraints.MinWidth := 550;
end;

procedure TC4DMsgView.FormShow(Sender: TObject);
begin
  Self.Height := FHeightFormWithdrawn;
  ImageList1.GetIcon(Integer(FParams.Icon), imgIcon.Picture.Icon);

  mmMsg.Text := FParams.Msg;
  Self.MemoTextVerticalCenter(mmMsg, 11);
  mmDetails.Text := FParams.Details.Trim;

  mmDetails.Visible := False;
  lbSeeDetails.Caption := 'Ver mais detalhes >>';
  lbSeeDetails.Visible := mmDetails.Text <> '';

  Self.ConfigButtons;
end;

procedure TC4DMsgView.MemoTextVerticalCenter(const AMemo: TMemo; const ANumLinesDisplay: Integer);
var
  i: Integer;
  LText: string;
  LLinesCount: Integer;
begin
  LText := AMemo.Lines.Text.Trim;
  LLinesCount := AMemo.Lines.Count;

  if(LLinesCount < ANumLinesDisplay)then
  begin
    AMemo.Lines.Clear;
    for i := 1 to Trunc((ANumLinesDisplay - LLinesCount) / 2) do
      AMemo.Lines.Add(' ');

    AMemo.Lines.Add(LText);
  end;
end;

procedure TC4DMsgView.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case(Key)of
    VK_F4:
      if(ssAlt in Shift)then
        Key := 0;
    VK_Escape:
    begin
      if(Shift = [])then
      begin
        if(btnNo.Visible)then
          btnNo.Click
        else
          btnYes.Click;
      end;
    end;
    107{+}:
      if(lbSeeDetails.Visible)then
        lbSeeDetailsClick(lbSeeDetails);
  end;
end;

procedure TC4DMsgView.ConfigButtons;
begin
  btnNo.Visible := FParams.Icon = TC4DIcons.Question;
  btnYes.Caption := 'Sim &1';
  if(FParams.Icon <> TC4DIcons.Question)then
    btnYes.Caption := 'OK &1';
end;

procedure TC4DMsgView.lbSeeDetailsClick(Sender: TObject);
begin
  if(mmDetails.Visible)then
  begin
    mmDetails.Visible := False;
    lbSeeDetails.Caption := 'Ver mais detalhes >>';
    Self.Height := FHeightFormWithdrawn;
  end
  else
  begin
    mmDetails.Visible := True;
    lbSeeDetails.Caption := 'Ver menos detalhes <<';
    Self.Height := FHeightFormExpanded;
  end;
  Self.Refresh;
  Self.Repaint;
end;

procedure TC4DMsgView.btnYesClick(Sender: TObject);
begin
  Self.Close;
  Self.ModalResult := mrYes;
end;

procedure TC4DMsgView.btnNoClick(Sender: TObject);
begin
  Self.Close;
  Self.ModalResult := mrNo;
end;

end.
