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
  //C4DShow('Mensagem workshop', 'Detalhes', TC4DIcons.Msg);
  ShowMsg('Mensagem de teste com detalhes', 'Mais detalhes aqui');
  ShowMsg('Mensagem de teste sem detalhes');
end;

procedure TC4DMsgViewMain.btnWarningClick(Sender: TObject);
begin
  ShowWarning('Mensagem de teste [Warning]', 'Aqui mais detalhes');
end;

procedure TC4DMsgViewMain.btnSuccessClick(Sender: TObject);
begin
  ShowSuccess('Mensagem de teste [Success]', 'Aqui mais detalhes');
end;

procedure TC4DMsgViewMain.btnErrorClick(Sender: TObject);
begin
  ShowError('Menssgem de teste [Error]', 'Mais detalhes');
end;

procedure TC4DMsgViewMain.btnPermissionClick(Sender: TObject);
begin
  ShowPermission('Mensagem de teste [Permission]', 'Aqui mais detalhes');
end;

procedure TC4DMsgViewMain.btnObligatoryClick(Sender: TObject);
begin
  ShowObligatory();
end;

procedure TC4DMsgViewMain.btnEmptyClick(Sender: TObject);
begin
  ShowEmpty('Mensagem de teste [Empty]', 'Nenhum resultado encontrado');
end;

procedure TC4DMsgViewMain.btnQuestionClick(Sender: TObject);
begin
  if(ShowQuestion('Minha pergunta', 'Meus detalhes'))then
    ShowSuccess('Respondeu sim')
  else
    ShowError('Respondeu não');
end;

procedure TC4DMsgViewMain.lbYoutubeClick(Sender: TObject);
begin
  ShellExecute(0, nil, PChar(TLabel(Sender).Caption), '', '', SW_ShowNormal);
end;

end.
