unit Login_RegistrationPg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Administrator_DashBoard, Home,
  WortHogs_DB_connections, jpeg;

type
  TLogin = class(TForm)
    Login_image: TImage;
    edtname_loginPg: TEdit;
    edtPassword_LoginPg: TEdit;
    btnLogin: TButton;
    btnApply: TButton;
    btnhelp: TButton;
    btnBack: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    edtusername: TEdit;
    edtpassword: TEdit;
    btnlogin2: TButton;
    Panel3: TPanel;
    Panel4: TPanel;
    Image1: TImage;
    chbShow1: TCheckBox;
    chbShow2: TCheckBox;
    procedure btnApplyClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure btnlogin2Click(Sender: TObject);
    procedure chbShow1Click(Sender: TObject);
    procedure chbShow2Click(Sender: TObject);
    procedure OnActivate(Sender: TObject);
    procedure btnhelpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    arrusername: array [1 .. 100] of string;
    arrpassword: array [1 .. 100] of string;
    learnersID, learnersNo, password, username: string;
  end;

var
  Login: TLogin;

implementation

uses Student_applicationPg, StudentDash, Help;
{$R *.dfm}

procedure TLogin.btnApplyClick(Sender: TObject);
begin
  Login.Hide;
  New_Student_Application_Pg.Show;
end;

procedure TLogin.btnBackClick(Sender: TObject);
begin
  Login.Hide;
  Home_pg.Show;
end;

procedure TLogin.btnhelpClick(Sender: TObject);
begin
  Help_form.Show;
end;

procedure TLogin.btnlogin2Click(Sender: TObject);
var
  IC, i, counter: integer;
  sline, username, password: string;
  tfile: textfile;
begin
  username := edtusername.Text;
  password := edtpassword.Text;
  if FileExists('Admins.txt') then
  begin
    counter := 0;
    AssignFile(tfile, 'Admins.txt');
    Reset(tfile);
    IC := 0;
    while not eof(tfile) do
    begin
      Inc(IC);
      Readln(tfile, sline);

      arrusername[IC] := copy(sline, 1, pos('#', sline) - 1);
      Delete(sline, 1, pos('#', sline));

      arrpassword[IC] := sline;

    end;
    CloseFile(tfile);
  end;
  for i := 1 to IC do
  begin
    if (arrusername[i] = username) And (arrpassword[i] = password) then
    begin
      Dec(counter);
    end;
  end;
  if counter < 0 then
  begin
    Admin_Pg.Show;
    Login.Hide;
    edtusername.Clear;
    edtpassword.Clear;
  end
  else
  begin
    ShowMessage('The credentials you have entered are invalid');
    edtusername.Color := clred;
    edtpassword.Color := clred;
  end;
end;

procedure TLogin.btnLoginClick(Sender: TObject);
var
  IC, i, counter: integer;
  sline: string;
  tfile: textfile;
begin
  counter := 0;
  username := edtname_loginPg.Text;
  password := edtPassword_LoginPg.Text;
  with WortHogs_DataModule do
  begin
    tblLearners.First;
    while not tblLearners.eof do
    begin
      if (tblLearners['Reg_No'] = username) and
        (tblLearners['Learner_Password'] = password) then
      begin
        Inc(counter);
      end;
      tblLearners.Next;
    end;
  end;
  with WortHogs_DataModule do
  begin
    while not tblProsLearners.eof do
    begin
      if (tblProsLearners['Learner_ID'] = username) and
        (tblProsLearners['Temp_pass'] = password) then
      begin
        Dec(counter);
      end;
      tblProsLearners.Next;
    end;
  end;

  if counter > 0 then
  begin
    Login.Hide;
    Student_Dash.Show;
    edtname_loginPg.Clear;
    edtPassword_LoginPg.Clear;
  end
  else if counter < 0 then
  begin
    Login.Hide;
    Student_Dash.Show;
  end
  else
  begin
    ShowMessage('The credentials you have entered are invalid');
    edtname_loginPg.Color := clred;
    edtPassword_LoginPg.Color := clred;
  end;
end;

procedure TLogin.chbShow1Click(Sender: TObject);
begin
  if chbShow1.Checked = False then
  begin

    edtPassword_LoginPg.PasswordChar := '*';
  end
  else if chbShow1.Checked = True then
  begin
    edtPassword_LoginPg.PasswordChar := #0;

  end;
end;

procedure TLogin.chbShow2Click(Sender: TObject);
begin
  if chbShow2.Checked = False then
  begin

    edtpassword.PasswordChar := '*';
  end
  else if chbShow2.Checked = True then
  begin

    edtpassword.PasswordChar := #0;
  end;
end;

procedure TLogin.OnActivate(Sender: TObject);
begin
  edtpassword.PasswordChar := '*';
  edtPassword_LoginPg.PasswordChar := '*';
end;

end.
