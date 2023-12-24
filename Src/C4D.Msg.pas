unit C4D.Msg;

interface

uses
  System.SysUtils,
  Vcl.Controls,
  C4D.Types,
  C4D.Params,
  C4D.Msg.View;

procedure ShowMsg(const AMsg: string; const ADetails: string = '');
procedure ShowWarning(const AMsg: string; const ADetails: string = '');
procedure ShowSuccess(const AMsg: string = ''; const ADetails: string = '');
procedure ShowError(const AMsg: string; const ADetails: string = '');
procedure ShowPermission(const AMsg: string; const ADetails: string = '');
procedure ShowObligatory(const AMsg: string = ''; const ADetails: string = '');
procedure ShowEmpty(const AMsg: string; const ADetails: string = '');
function ShowQuestion(const AMsg: string; const ADetails: string = ''): Boolean;

implementation

function C4DShow(const AMsg, ADetails: string; const AIcon: TC4DIcons): Boolean;
var
  LParams: TC4DParams;
  LView: TC4DMsgView;
begin
  LParams := TC4DParams.Create;
  try
    LParams.Icon := AIcon;
    LParams.Msg := AMsg;
    LParams.Details := ADetails;

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

procedure ShowMsg(const AMsg: string; const ADetails: string = '');
begin
  C4DShow(AMsg, ADetails, TC4DIcons.Msg);
end;

procedure ShowWarning(const AMsg: string; const ADetails: string = '');
begin
  C4DShow(AMsg, ADetails, TC4DIcons.Warning);
end;

procedure ShowSuccess(const AMsg: string = ''; const ADetails: string = '');
begin
  C4DShow(AMsg, ADetails, TC4DIcons.Success);
end;

procedure ShowError(const AMsg: string; const ADetails: string = '');
begin
  C4DShow(AMsg, ADetails, TC4DIcons.Error);
end;

procedure ShowPermission(const AMsg: string; const ADetails: string = '');
begin
  C4DShow(AMsg, ADetails, TC4DIcons.Permission);
end;

procedure ShowObligatory(const AMsg: string = ''; const ADetails: string = '');
var
  LMsg: string;
begin
  LMsg := AMsg;
  if(LMsg.Trim.IsEmpty)then
    LMsg := 'Campo obrigatório sem preenchimento';

  C4DShow(LMsg, ADetails, TC4DIcons.Obligatory);
end;

procedure ShowEmpty(const AMsg: string; const ADetails: string = '');
begin
  C4DShow(AMsg, ADetails, TC4DIcons.Empty);
end;

function ShowQuestion(const AMsg: string; const ADetails: string = ''): Boolean;
begin
  Result := C4DShow(AMsg, ADetails, TC4DIcons.Question);
end;

end.
