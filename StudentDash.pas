unit StudentDash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Login_RegistrationPg, StdCtrls, ExtCtrls,
  worthogs_db_connections, TeEngine, TeeProcs, Chart, jpeg, Series;

type
  TStudent_Dash = class(TForm)
    pgc1: TPageControl;
    Panel1: TPanel;
    Panel2: TPanel;
    btnLogout: TButton;
    btnHelp: TButton;
    btnDetails: TButton;
    btnSubjects: TButton;
    PG2: TPageControl;
    TB1: TTabSheet;
    TB2: TTabSheet;
    output: TRichEdit;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    stats: TChart;
    btnSubjectStats: TButton;
    btnNP: TButton;
    btnPP: TButton;
    Panel3: TPanel;
    btnResults: TButton;
    Series1: TBarSeries;
    procedure btnLogoutClick(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
    procedure btnDetailsClick(Sender: TObject);
    procedure btnNPClick(Sender: TObject);
    procedure btnPPClick(Sender: TObject);
    procedure OnActivate(Sender: TObject);
    procedure btnSubjectsClick(Sender: TObject);
    procedure btnResultsClick(Sender: TObject);
    procedure btnSubjectStatsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Student_Dash: TStudent_Dash;
  switch, counter: integer;
  SubjectComboNo: string;
  arrSubject: array [1 .. 100] of string;
  arrpassword: array [1 .. 100] of string;
  arrMarks: array [1 .. 7] of string;
  arrMarks1: array [1 .. 100] of string;
  arrMarks2: array [1 .. 100] of string;
  arrMarks3: array [1 .. 100] of string;
  arrMarks4: array [1 .. 100] of string;
  arrMarks5: array [1 .. 100] of string;
  arrMarks6: array [1 .. 100] of string;
  arrMarks7: array [1 .. 100] of string;

implementation

uses Home, Help;
{$R *.dfm}

procedure TStudent_Dash.btnLogoutClick(Sender: TObject);
begin
  Home_pg.Show;
  Student_Dash.Hide;
  output.Clear;
end;

procedure TStudent_Dash.btnDetailsClick(Sender: TObject);
var
  name, surname, id, Grade, id2, sline: string;
  learnernum: integer;

begin
  switch := 0;
  output.Clear;
  with WortHogs_DataModule do
  begin
    tblLearners.First;
    while not tblLearners.Eof do
    begin
      if (tblLearners['Reg_No'] = strtoint(Login.username)) then // This displays basic info on a richedt based on the user that logged in
      begin // Uses password from the edt in the login for students to search for their
        name := tblLearners['LearnerName']; // info in database.
        surname := tblLearners['LearnerSurname'];
        id := tblLearners['Learner_ID'];
        learnernum := tblLearners['Reg_No'];
        id2 := tblLearners['Parent_ID'];
        Grade := tblLearners['Grade'];
        SubjectComboNo := tblLearners['SubjectComboNo'];
        Inc(switch);
      end;
      tblLearners.Next;
    end;
    tblProsLearners.First;
    while not tblProsLearners.Eof do
    begin
      if tblProsLearners['Learner_ID'] = Login.username then
      begin
        name := tblProsLearners['LearnerName'];
        surname := tblProsLearners['LearnerSurname'];
        id := tblProsLearners['Learner_ID'];
        learnernum := tblProsLearners['Reg_No'];
        Grade := tblProsLearners['Grade'];
        id2 := tblProsLearners['Parent_ID'];
        dec(switch);
      end;
      tblProsLearners.Next;
    end;
  end;
  sline := 'User Information' + #13 + '===========' + #13 + 'Student Name:' +
    #9 + name + #13 + 'Student Surname:' + surname +#9+ #13 + 'Student ID:' +
    #9 + id + #13 + 'Learner Number:' + #9 + IntToStr(learnernum)
    + #13 + 'Grade:' + #9 + Grade + #13 + 'Parent ID:' + #9 + id2;
  if (switch > 0) or (switch < 0) then
  begin
    output.Lines.Add(sline);
  end
  else if switch = 0 then
  begin
    output.Lines.Add('Notice:' + #13 + '=====' + #13 +
        'Not logged into any profile, cannot view Details ');
  end;
end;

procedure TStudent_Dash.btnHelpClick(Sender: TObject);
begin
  Help_form.Show;

end;

procedure TStudent_Dash.btnNPClick(Sender: TObject);
begin
  TB1.Hide;
  TB2.Show;
end;

procedure TStudent_Dash.btnPPClick(Sender: TObject);
begin
  TB2.Hide;
  TB1.Show;
end;

procedure TStudent_Dash.btnResultsClick(Sender: TObject);
var
  sline, subject1, subject2, subject3, subject4, subject5, subject6,
    subject7: string;
  tfile: Textfile;

begin
  if switch > 0 then
  begin
    subject1 := InputBox('Mark entery', 'Subject 1', ''); // Allows you to store marks in a text file , these marks will be displayed on a bargraph.
    subject2 := InputBox('Mark entery', 'Subject 2', '');
    subject3 := InputBox('Mark entery', 'Subject 3', '');
    subject4 := InputBox('Mark entery', 'Subject 4', '');
    subject5 := InputBox('Mark entery', 'Subject 5', '');
    subject6 := InputBox('Mark entery', 'Subject 6', '');
    subject7 := InputBox('Mark entery', 'Subject 7', '');
    sline := Login.password + '#' + subject1 + '#' + subject2 + '#' +
      subject3 + '#' + subject4 + '#' + subject5 + '#' + subject6 + '#' +
      subject7;
    if FileExists('Results.txt') then
    begin
      AssignFile(tfile, 'Results.txt');
      Append(tfile);
      Writeln(tfile, sline);
    end;
    CloseFile(tfile);
  end
  else if switch < 0 then
  begin
    output.Lines.Add(
      'Your application is currently under review, there you cannot enter any subject marks yet')
  end
  else if switch = 0 then
  begin
    output.Lines.Add('Notice:' + #13 + '=====' + #13 +
        'Not logged into any profile, cannot enter subject marks ');
  end;
end;

procedure TStudent_Dash.btnSubjectsClick(Sender: TObject);
var
  sline, sline2, sline3, password, subjects: string;
  i: integer;
  tfile: Textfile;
begin
  output.Clear; // displays learners subjects as well as loads results from textfile along side.
  if switch > 0 then
  begin
    counter := 0;
    sline3 := '';
    if FileExists('Results.txt') then
    begin
      AssignFile(tfile, 'Results.txt');
      Reset(tfile);
      while not Eof(tfile) do
      begin
        Inc(counter);
        Readln(tfile, sline3);
        arrpassword[counter] := Copy(sline3, 1, Pos('#', sline3) - 1);
        Delete(sline3, 1, Pos('#', sline3));

        arrMarks1[counter] := Copy(sline3, 1, Pos('#', sline3) - 1);
        Delete(sline3, 1, Pos('#', sline3));

        arrMarks2[counter] := Copy(sline3, 1, Pos('#', sline3) - 1);
        Delete(sline3, 1, Pos('#', sline3));

        arrMarks3[counter] := Copy(sline3, 1, Pos('#', sline3) - 1);
        Delete(sline3, 1, Pos('#', sline3));

        arrMarks4[counter] := Copy(sline3, 1, Pos('#', sline3) - 1);
        Delete(sline3, 1, Pos('#', sline3));

        arrMarks5[counter] := Copy(sline3, 1, Pos('#', sline3) - 1);
        Delete(sline3, 1, Pos('#', sline3));

        arrMarks6[counter] := Copy(sline3, 1, Pos('#', sline3) - 1);
        Delete(sline3, 1, Pos('#', sline3));

        arrMarks7[counter] := sline3;
      end;
      CloseFile(tfile);
    end;
  end;
  for i := 1 to counter do
  begin
    if (arrpassword[i] = Login.password) then
    begin
      arrMarks[1] := arrMarks1[i];
      arrMarks[2] := arrMarks2[i];
      arrMarks[3] := arrMarks3[i];
      arrMarks[4] := arrMarks4[i];
      arrMarks[5] := arrMarks5[i];
      arrMarks[6] := arrMarks6[i];
      arrMarks[7] := arrMarks7[i];
    end;
  end;
  with WortHogs_DataModule do
  begin
    tblSubject.First;
    while not tblSubject.Eof do
    begin
      if SubjectComboNo = tblSubject['SubjectComboNo'] then
      begin
        arrSubject[1] := tblSubject['Subject1'];
        arrSubject[2] := tblSubject['Subject2'];
        arrSubject[3] := tblSubject['Subject3'];
        arrSubject[4] := tblSubject['Subject4'];
        arrSubject[5] := tblSubject['Subject5'];
        arrSubject[6] := tblSubject['Subject6'];
        arrSubject[7] := tblSubject['Subject7'];
      end;
      tblSubject.Next;
    end;
  end;
  sline := 'Subject Combination:' + #13 + '=============';
  output.Lines.Add(sline);
  sline2 := ' ';
  for i := 1 to 7 do
  begin
    subjects := IntToStr(i) + ')' + sline2 + arrSubject[i] + ':' + arrMarks[i]
      + #13;
    output.Lines.Add(subjects);
  end;
end;

procedure TStudent_Dash.btnSubjectStatsClick(Sender: TObject);
var
  i: integer;
begin

  Series1.Clear;
  with stats do
  begin
    Series1.AddBar(strtoint(arrMarks[1]), arrSubject[1], clblue); // displays a visual representation of the marks obtain by the learn on to a bargraph with the asigned subject.
    Series1.AddBar(strtoint(arrMarks[2]), arrSubject[2], clblue);
    Series1.AddBar(strtoint(arrMarks[3]), arrSubject[3], clblue);
    Series1.AddBar(strtoint(arrMarks[4]), arrSubject[4], clblue);
    Series1.AddBar(strtoint(arrMarks[5]), arrSubject[5], clblue);
    Series1.AddBar(strtoint(arrMarks[6]), arrSubject[6], clblue);
    Series1.AddBar(strtoint(arrMarks[7]), arrSubject[7], clblue);
  end;
end;

procedure TStudent_Dash.OnActivate(Sender: TObject);
begin
  //
  output.Paragraph.TabCount := 2;
  output.Paragraph.Tab[0] := 10;
  output.Paragraph.Tab[1] := 100;
end;

end.
