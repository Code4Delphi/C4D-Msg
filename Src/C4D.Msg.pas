unit C4D.Msg;

interface

uses
  System.SysUtils,
  Vcl.Controls,
  C4D.Types,
  C4D.Params,
  C4D.Msg.View;

procedure ShowMsg(const AMsg: string; const Adetails: string = '');
procedure ShowError(const AMsg: string; const Adetails: string = '');
procedure ShowObligatory(const AMsg: string = ''; const Adetails: string = '');
procedure ShowSuccess(const AMsg: string = ''; const Adetails: string = '');
function ShowQuestion(const AMsg: string; const Adetails: string = ''): Boolean;

implementation

function C4DShow(const AMsg, Adetails: string; const AIcon: TC4DIcons): Boolean;
var
  LParams: TC4DParams;
  LView: TC4DMsgView;
begin
  LParams := TC4DParams.Create;
  try
    LParams.Icon := AIcon;
    LParams.Msg := AMsg;
    LParams.Details := Adetails;

    LView := TC4DMsgView.Create(nil);
    try
      LView.Params := LParams;
      Result := LView.ShowModal = mrYes;
    finally
      LView.Free;
    end;
  finally
    LParams.Free;
  end;
end;

procedure ShowMsg(const AMsg: string; const Adetails: string = '');
begin
  C4DShow(AMsg, Adetails, TC4DIcons.Msg);
end;

procedure ShowError(const AMsg: string; const Adetails: string = '');
begin
  C4DShow(AMsg, Adetails, TC4DIcons.Error);
end;

procedure ShowObligatory(const AMsg: string = ''; const Adetails: string = '');
var
  LMsg: string;
begin
  LMsg := AMsg;
  if(LMsg.Trim.IsEmpty)then
    LMsg := 'Campo obrigatório sem preenchimento';

  C4DShow(LMsg, Adetails, TC4DIcons.Obligatory);
end;

procedure ShowSuccess(const AMsg: string = ''; const Adetails: string = '');
begin
  C4DShow(AMsg, Adetails, TC4DIcons.Success);
end;

function ShowQuestion(const AMsg: string; const Adetails: string = ''): Boolean;
begin
  Result := C4DShow(AMsg, Adetails, TC4DIcons.Question);
end;

end.
