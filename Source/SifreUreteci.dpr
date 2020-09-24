program SifreUreteci;

uses
  Forms,
  MainFormUnit in 'Units\MainFormUnit.pas' {MainForm},
  u_math in 'Units\u_math.pas',
  u_password in 'Units\u_password.pas';

{$R *.res}
{$R WindowsXP.res}

begin
  Application.Initialize;
  Application.Title := 'Þifre Üreteci';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
