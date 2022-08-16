program Wort_Hogs_PAT2022;

uses
  Forms,
  Home in 'Home.pas' {Home_pg},
  Student_applicationPg in 'Student_applicationPg.pas' {New_Student_Application_Pg},
  Back_End in 'Back_End.pas',
  WortHogs_DB_connections in 'WortHogs_DB_connections.pas' {WortHogs_DataModule: TDataModule},
  Administrator_DashBoard in 'Administrator_DashBoard.pas' {Admin_Pg},
  Login_RegistrationPg in 'Login_RegistrationPg.pas' {Login},
  StudentDash in 'StudentDash.pas' {Student_Dash},
  WortHogs_Emailing_system in 'WortHogs_Emailing_system.pas',
  Help in 'Help.pas' {Help_form};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(THome_pg, Home_pg);
  Application.CreateForm(TLogin, Login);
  Application.CreateForm(TAdmin_Pg, Admin_Pg);
  Application.CreateForm(TNew_Student_Application_Pg, New_Student_Application_Pg);
  Application.CreateForm(TStudent_Dash, Student_Dash);
  Application.CreateForm(TWortHogs_DataModule, WortHogs_DataModule);
  Application.CreateForm(THelp_form, Help_form);
  Application.Run;
end.
