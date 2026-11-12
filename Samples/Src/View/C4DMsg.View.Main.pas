unit C4DMsg.View.Main;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Winapi.ShellAPI,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.Imaging.pngimage,
  Vcl.ExtCtrls,
  C4D.Msg;

type
  TC4DMsgViewMain = class(TForm)
    btnMsg: TButton;
    btnWarning: TButton;
    btnSuccess: TButton;
    btnError: TButton;
    btnQuestion: TButton;
    btnEmpty: TButton;
    btnPermission: TButton;
    btnObligatory: TButton;
    pnBackLogoELinks: TPanel;
    pnBackLogo: TPanel;
    Image1: TImage;
    pnBackLinks: TPanel;
    lbYoutube: TLabel;
    lbGitHub: TLabel;
    lbTelegram: TLabel;
    procedure btnMsgClick(Sender: TObject);
    procedure btnErrorClick(Sender: TObject);
    procedure btnObligatoryClick(Sender: TObject);
    procedure btnQuestionClick(Sender: TObject);
    procedure btnWarningClick(Sender: TObject);
    procedure btnSuccessClick(Sender: TObject);
    procedure btnPermissionClick(Sender: TObject);
    procedure btnEmptyClick(Sender: TObject);
    procedure lbYoutubeClick(Sender: TObject);
  private

  public

  end;

var
  C4DMsgViewMain: TC4DMsgViewMain;

implementation

{$R *.dfm}

procedure TC4DMsgViewMain.btnMsgClick(Sender: TObject);
begin
  ShowMsg('My message', 'More details (optional)');
  ShowMsg('Test message without details');
end;

procedure TC4DMsgViewMain.btnWarningClick(Sender: TObject);
begin
  ShowWarning('Test message [Warning]', 'More details');
end;

procedure TC4DMsgViewMain.btnSuccessClick(Sender: TObject);
begin
  ShowSuccess('Test message [Success]', 'More details');
end;

procedure TC4DMsgViewMain.btnErrorClick(Sender: TObject);
begin
  ShowError('Test message [Error]', 'More details');
end;

procedure TC4DMsgViewMain.btnPermissionClick(Sender: TObject);
begin
  ShowPermission('Test message [Permission]', 'More details');
end;

procedure TC4DMsgViewMain.btnObligatoryClick(Sender: TObject);
begin
  ShowObligatory();
end;

procedure TC4DMsgViewMain.btnEmptyClick(Sender: TObject);
begin
  ShowEmpty('Test message [Empty]', 'No results found');
end;

procedure TC4DMsgViewMain.btnQuestionClick(Sender: TObject);
begin
  if ShowQuestion('My question', 'More details') then
    ShowSuccess('You answered YES')
  else
    ShowError('You answered NO');
end;

procedure TC4DMsgViewMain.lbYoutubeClick(Sender: TObject);
begin
  ShellExecute(0, nil, PChar(TLabel(Sender).Caption), '', '', SW_ShowNormal);
end;

end.
