unit C4D.Params;

interface

uses
  C4D.Types;

type
  TC4DParams = class
  private
    FIcon: TC4DIcons;
    FCaption: string;
    FMsg: string;
    FDetails: string;
  public
    constructor Create;
    property Icon: TC4DIcons read FIcon write FIcon;
    property Caption: string read FCaption write FCaption;
    property Msg: string read FMsg write FMsg;
    property Details: string read FDetails write FDetails;
  end;

implementation

constructor TC4DParams.Create;
begin
  FIcon := TC4DIcons.Msg;
  FCaption := 'Mensagem do sistema';
  FMsg := '';
  FDetails := '';
end;

end.
