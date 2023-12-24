program C4DMsg;

uses
  Vcl.Forms,
  C4DMsg.View.Main in 'Src\View\C4DMsg.View.Main.pas' {C4DMsgViewMain},
  C4D.Msg in '..\Src\C4D.Msg.pas',
  C4D.Msg.View in '..\Src\C4D.Msg.View.pas' {C4DMsgView},
  C4D.Types in '..\Src\C4D.Types.pas',
  C4D.Params in '..\Src\C4D.Params.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TC4DMsgViewMain, C4DMsgViewMain);
  Application.Run;
end.
