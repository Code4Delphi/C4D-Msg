unit C4DMsg.View.Main;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  C4D.Msg;

type
  TForm1 = class(TForm)
    btnMsg: TButton;
    btnWarning: TButton;
    btnSuccess: TButton;
    btnError: TButton;
    btnQuestion: TButton;
    btnEmpty: TButton;
    btnPermission: TButton;
    btnObligatory: TButton;
    procedure btnMsgClick(Sender: TObject);
    procedure btnErrorClick(Sender: TObject);
    procedure btnObligatoryClick(Sender: TObject);
    procedure btnQuestionClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnErrorClick(Sender: TObject);
begin
  ShowError('Menssgem de erro', 'Mais detalhes');
end;

procedure TForm1.btnMsgClick(Sender: TObject);
begin
  //C4DShow('Mensagem workshop', 'Detalhes', TC4DIcons.Msg);
  ShowMsg('Mensagem workshop', 'Detalhes');
  ShowMsg('Mensagem workshop');
end;

procedure TForm1.btnObligatoryClick(Sender: TObject);
begin
  ShowObligatory();
end;

procedure TForm1.btnQuestionClick(Sender: TObject);
begin
  if(ShowQuestion('Minha pergunta', 'Meus detalhes'))then
    ShowSuccess('Respondeu sim')
  else
    ShowError('Respondeu não');
end;

end.
