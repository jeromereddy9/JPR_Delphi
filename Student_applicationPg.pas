unit Student_applicationPg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Back_End, StdCtrls, Spin, ExtCtrls, ComCtrls, DBCtrls, Mask,
  DateUtils, WortHogs_DB_connections, WortHogs_Emailing_system, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdComponent,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient,
  IdSMTPBase, IdSMTP, IdBaseComponent, IdMessage, jpeg;

type
  TNew_Student_Application_Pg = class(TForm)
    pgcontrol_Application: TPageControl;
    tb_LearnerDetails: TTabSheet;
    tb_Other: TTabSheet;
    tb_Submit: TTabSheet;
    p1: TPanel;
    l1: TLabel;
    edtLearnerName: TEdit;
    l2: TLabel;
    l3: TLabel;
    edtLearnerSurname: TEdit;
    edtPrevious: TEdit;
    l5: TLabel;
    cmbGrade: TComboBox;
    l6: TLabel;
    edtSAIDLearner: TEdit;
    Pl4: TPanel;
    l16: TLabel;
    l17: TLabel;
    l18: TLabel;
    l19: TLabel;
    l20: TLabel;
    edtAdress: TEdit;
    edtSuburb: TEdit;
    btnNext2: TButton;
    edtCity: TEdit;
    edtpostalCode: TEdit;
    chbYes: TCheckBox;
    chbNo: TCheckBox;
    l7: TLabel;
    DTP1: TDateTimePicker;
    l4: TLabel;
    p2: TPanel;
    l8: TLabel;
    l9: TLabel;
    l14: TLabel;
    l10: TLabel;
    l13: TLabel;
    l11: TLabel;
    l15: TLabel;
    l12: TLabel;
    edtParentName: TEdit;
    edtParentSurname: TEdit;
    edtCellnum: TEdit;
    edtEmail: TEdit;
    edtOccupation: TEdit;
    edtParentID: TEdit;
    cmbMaritalStatus: TComboBox;
    BtnNext1: TButton;
    l21: TLabel;
    dbedtcomboNumber: TDBEdit;
    dbedt1: TDBEdit;
    dbedt2: TDBEdit;
    dbedt3: TDBEdit;
    dbedt4: TDBEdit;
    dbedt5: TDBEdit;
    dbedt6: TDBEdit;
    dbedt7: TDBEdit;
    l22: TLabel;
    btnNext: TButton;
    btnBack: TButton;
    btnForward: TButton;
    l23: TLabel;
    btnHelp2: TButton;
    btnHelp1: TButton;
    output: TRichEdit;
    btnSubmit: TButton;
    Label16: TLabel;
    edtTemp: TEdit;
    btnConfirm: TButton;
    btnBack1: TButton;
    btnBack2: TButton;
    btnCreateProfile: TButton;
    IdMessage1: TIdMessage;
    IdSMTP1: TIdSMTP;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    Panel3: TPanel;
    btnHome: TButton;
    gb1: TGroupBox;
    img1: TImage;
    img2: TImage;
    img3: TImage;
    procedure edtPreviousClick(sender: Tobject); // dynamic component
    procedure OnActivate(sender: Tobject);
    procedure chbYesClick(sender: Tobject);
    procedure chbNoClick(sender: Tobject);
    procedure BtnNext1Click(sender: Tobject);
    procedure btnForwardClick(sender: Tobject);
    procedure btnBackClick(sender: Tobject);
    procedure btnNextClick(sender: Tobject);
    procedure btnConfirmClick(sender: Tobject);
    procedure btnSubmitClick(sender: Tobject);
    procedure btnBack1Click(sender: Tobject);
    procedure btnBack2Click(sender: Tobject);
    procedure btnCreateProfileClick(sender: Tobject);
    procedure btnHomeClick(sender: Tobject);
    procedure btnHelp1Click(sender: Tobject);
    procedure btnHelp2Click(sender: Tobject);
  private
    { Private declarations }
  public
    { Public declarations }
    arrSubject: array [1 .. 7] of string; // basic array
    procedure gmail(username, password, totarget, subject, body: string);
    procedure validateDetails(Lname, Lsurname, Pname, Psurname, occupation,
      cellnumber: string; grade, marital: integer);
    procedure validateID(PID, LID: string);
    procedure validateGmail(gmail: string);
    procedure validateD(num: Tdate);
    procedure validateaddress(address, suburb, city, postal: string);
  end;

var
  New_Student_Application_Pg: TNew_Student_Application_Pg;
  objBack_end: TBack_End; // OOP object
  objEmail: TEmail;
  learnerName, LearnerSurname, LearnerID, grade, PreviousSchool: string;
  ParentName, ParentSurname, ParentID, occupation, Email, cellnumber,
    marital_Status, temp: string;
  DOB, DOR: Tdate;
  address, subjectComboNo: string;
  error6, error7, error8, error9, error10: integer;

implementation

uses Administrator_DashBoard, Home, Help;
{$R *.dfm}

procedure TNew_Student_Application_Pg.OnActivate(sender: Tobject);
begin
  //
end;

procedure TNew_Student_Application_Pg.validateaddress(address, suburb, city,
  postal: string);
var
  i: integer;
begin
  for i := 1 to Length(postal) do
  begin
    if not(postal[i] in ['0' .. '9']) then
    begin
      edtpostalCode.Color := clred;
      ShowMessage('Invalid postal code');
    end;
  end;
  if postal = '' then
  begin
    edtpostalCode.Color := clred;
    ShowMessage('Invalid postal code');
  end;
  if address = '' then
  begin
    edtAdress.Color := clred;
    ShowMessage('Invalid address');
  end;
  if suburb = '' then
  begin
    edtSuburb.Color := clred;
    ShowMessage('Invalid suburb');
  end;
  if city = '' then
  begin
    edtCity.Color := clred;
    ShowMessage('Invalid city');
  end;
end;

procedure TNew_Student_Application_Pg.validateD(num: Tdate);
begin
  num := YearsBetween(today, DTP1.Date);
  if (num < 15) or (num > 19) then
  begin
    ShowMessage('Invalid Date chosen');
  end;
end;

procedure TNew_Student_Application_Pg.validateDetails(Lname, Lsurname, Pname,
  Psurname, occupation, cellnumber: string; grade, marital: integer);
var
  i, error1: integer;
begin

  for i := 1 to Length(Lname) do
  begin
    if (Lname[i] in ['0' .. '9']) or (Lname = '') then
    begin
      edtLearnerName.Color := clred;
      ShowMessage('The learner name you have entered is invalid.');
    end;
  end;
  for i := 1 to Length(Pname) do
  begin
    if (Pname[i] in ['0' .. '9']) or (Pname = '') then
    begin
      edtParentName.Color := clred;
      ShowMessage('The Parent name you have entered is invalid.');
    end;
  end;
  for i := 1 to Length(Lsurname) do
  begin
    if (Lsurname[i] in ['0' .. '9']) or (Lsurname = '') then
    begin
      edtLearnerSurname.Color := clred;
      ShowMessage('The Learner Surname you have entered is invalid.');
    end;
  end;
  for i := 1 to Length(Psurname) do
  begin
    if (Psurname[i] in ['0' .. '9']) or (Psurname = '') then
    begin
      edtParentSurname.Color := clred;
      ShowMessage('The Parent surname you have entered is invalid.');
    end;
  end;
  for i := 1 to Length(occupation) do
  begin
    if (occupation[i] in ['0' .. '9']) or (occupation = '') then
    begin
      edtOccupation.Color := clred;
      ShowMessage('The Occupation field is not filled.');
    end;
  end;
  for i := 1 to Length(cellnumber) do
  begin
    if not(cellnumber[i] in ['0' .. '9']) then
    begin
      edtCellnum.Color := clred;
      ShowMessage('The cell number you have entered contains letters.');
    end;
  end;
  if (Length(cellnumber) <> 10) or (cellnumber = '') then
  begin
    edtCellnum.Color := clred;
    ShowMessage('The cell number you have entered is not 10-digits long.');
  end;
  if (Psurname = '') then
  begin
    edtParentSurname.Color := clred;
    ShowMessage('The Parent surname you have entered is invalid.');
  end;
  if (Lsurname = '') then
  begin
    edtLearnerSurname.Color := clred;
    ShowMessage('The Learner Surname you have entered is invalid.');
  end;
  if (Pname = '') then
  begin
    edtParentName.Color := clred;
    ShowMessage('The Parent name you have entered is invalid.');
  end;
  if (Lname = '') then
  begin
    edtLearnerName.Color := clred;
    ShowMessage('The learner name you have entered is invalid.');
  end;
  if (occupation = '') then
  begin
    edtOccupation.Color := clred;
    ShowMessage('The Occupation field is not filled.');
  end;

  if grade = -1 then
  begin
    cmbGrade.Color := clred;
    ShowMessage('Please select a grade.');
  end;
  if marital = -1 then
  begin
    cmbMaritalStatus.Color := clred;
    ShowMessage('Please select a Marital Status.');
  end;
end;

procedure TNew_Student_Application_Pg.validateGmail(gmail: string);
// validation
var
  i, word: integer;
  gm: string;
begin
  error10 := 0;

  if gmail = '' then
  begin
    edtEmail.Color := clred;
    ShowMessage('Invalid Gmail address');
  end;
end;

procedure TNew_Student_Application_Pg.validateID(PID, LID: string);
// validation
var
  flag: boolean;
  i: integer;
begin

  for i := 1 to Length(LID) do
  begin
    if not(LID[i] in ['0' .. '9']) then
    begin
      edtSAIDLearner.Color := clred;
      ShowMessage('The Learner ID you have entered is invalid.');
    end;
  end;
  for i := 1 to Length(PID) do
  begin
    if not(PID[i] in ['0' .. '9']) then
    begin
      edtParentID.Color := clred;
      ShowMessage('The Parent ID you have entered is invalid.');
    end;
  end;
  if (Length(LID) <> 13) or (LID = '') then
  begin
    edtSAIDLearner.Color := clred;
    ShowMessage('The Learner ID you have entered is invalid.');
  end;
  if (Length(PID) <> 13) or (PID = '') then
  begin
    edtParentID.Color := clred;
    ShowMessage('The Parent ID you have entered is invalid.');
  end;
end;

procedure TNew_Student_Application_Pg.btnBack1Click(sender: Tobject);
begin
  tb_Other.Hide;
  tb_LearnerDetails.Show;
end;

procedure TNew_Student_Application_Pg.btnBack2Click(sender: Tobject);
begin
  tb_Other.Show;
  tb_Submit.Hide;
end;

procedure TNew_Student_Application_Pg.btnBackClick(sender: Tobject);
begin
  WortHogs_DataModule.tblSubject.Prior;
end;

procedure TNew_Student_Application_Pg.btnCreateProfileClick(sender: Tobject);
begin
  output.Clear;
  objBack_end := TBack_End.create(learnerName, LearnerSurname, LearnerID,
    PreviousSchool, Email, cellnumber, ParentName, ParentSurname, temp,
    address, grade, DOB, DOR); // instantiation of object
  output.Lines.Add(objBack_end.TOString);
end;

procedure TNew_Student_Application_Pg.btnForwardClick(sender: Tobject);
begin
  WortHogs_DataModule.tblSubject.Next;
end;

procedure TNew_Student_Application_Pg.btnHelp1Click(sender: Tobject);
begin
  Help_form.Show;
end;

procedure TNew_Student_Application_Pg.btnHelp2Click(sender: Tobject);
begin
  Help_form.Show;
end;

procedure TNew_Student_Application_Pg.btnHomeClick(sender: Tobject);
begin
  Home_pg.Show;
  New_Student_Application_Pg.Hide;

  edtLearnerName.Clear;
  edtLearnerSurname.Clear;
  edtSAIDLearner.Clear;
  edtAdress.Clear;
  edtSuburb.Clear;
  edtCity.Clear;
  edtpostalCode.Clear;
  edtParentName.Clear;
  edtParentSurname.Clear;
  edtParentID.Clear;
  edtCellnum.Clear;
  edtEmail.Clear;
  edtOccupation.Clear;
  edtTemp.Clear;
  cmbGrade.ItemIndex := -1;
  cmbMaritalStatus.ItemIndex := -1;
  chbYes.Checked := False;
  chbNo.Checked := False;
  output.Clear;
end;

procedure TNew_Student_Application_Pg.BtnNext1Click(sender: Tobject);
begin
  learnerName := edtLearnerName.Text;
  LearnerSurname := edtLearnerSurname.Text;
  DOB := DTP1.Date;
  DOR := SysUtils.Date;
  LearnerID := edtSAIDLearner.Text;
  grade := cmbGrade.Text;
  if (chbYes.Checked = True) AND (chbNo.Checked = False) then
  begin
    PreviousSchool := 'WortHogs HighSchool';
  end
  else if (chbNo.Checked = True) AND (chbYes.Checked = False) then
  begin
    PreviousSchool := edtPrevious.Text;
  end;
  ParentName := edtParentName.Text;
  ParentSurname := edtParentSurname.Text;
  ParentID := edtParentID.Text;
  Email := edtEmail.Text;
  cellnumber := edtCellnum.Text;
  marital_Status := cmbMaritalStatus.Text;
  ParentID := edtParentID.Text;
  occupation := edtOccupation.Text;

  validateDetails(learnerName, LearnerSurname, ParentName, ParentSurname,
    occupation, cellnumber, cmbGrade.ItemIndex, cmbMaritalStatus.ItemIndex);
  validateID(ParentID, LearnerID);
  validateD(DOB);
  validateGmail(Email);

  tb_LearnerDetails.Hide;
  tb_Other.Show;
end;

procedure TNew_Student_Application_Pg.btnNextClick(sender: Tobject);
begin
  address := edtAdress.Text + #9 + edtSuburb.Text + #9 + edtCity.Text + #9 +
    edtpostalCode.Text;
  arrSubject[1] := dbedt1.Text;
  arrSubject[2] := dbedt2.Text;
  arrSubject[3] := dbedt3.Text;
  arrSubject[4] := dbedt4.Text;
  arrSubject[5] := dbedt5.Text;
  arrSubject[6] := dbedt6.Text;
  arrSubject[7] := dbedt7.Text;

  subjectComboNo := dbedtcomboNumber.Text;
  validateaddress(edtAdress.Text, edtSuburb.Text, edtCity.Text,
    edtpostalCode.Text);
  tb_Other.Hide;
  tb_Submit.Show;

end;

procedure TNew_Student_Application_Pg.btnSubmitClick(sender: Tobject);
var
  Regfee: Real;
  sbody, sSubject, mail_username, mail_password, mail_to, mail_subject,
    mail_body: string;
  tfile: TextFile;
begin
  //
  Regfee := 500;
  with WortHogs_DataModule do
  begin
    tblProsLearners.last;
    tblProsLearners.insert;
    tblProsLearners['Learner_ID'] := LearnerID;
    tblProsLearners['LearnerName'] := learnerName;
    tblProsLearners['LearnerSurname'] := LearnerSurname;
    tblProsLearners['Parent_ID'] := ParentID;
    tblProsLearners['RegFee'] := Regfee;
    tblProsLearners['DOB'] := DOB;
    tblProsLearners['Temp_pass'] := temp;
    tblProsLearners['Grade'] := grade;
    tblProsLearners['SubjectComboNo'] := subjectComboNo;
    tblProsLearners['Email'] := Email;
    tblProsLearners.Post;
    // tblProsLearners.Refresh;

    tblParents.last;
    tblParents.insert;
    tblParents['Parent_ID'] := ParentID;
    tblParents['ParentName'] := ParentName;
    tblParents['ParentSurname'] := ParentSurname;
    tblParents['Address'] := address;
    tblParents['Marital_Status'] := marital_Status;
    tblParents['ParentNum'] := cellnumber;
    tblParents['Email'] := Email;
    tblParents['Occupation'] := occupation;
    tblParents.Post;
    // tblParents.Refresh;

  end;
  sSubject := 'Application Received';
  sbody :=
    'Good day, we thank you for wanting to study at our Prestigous School. We have received your application and it is being review, we will get back to you with our decision in the near future.' + #13 + 'Your ID:' + LearnerID + #13 + ' This is your temporary password: ' + temp;
  mail_username := 'worthogshigh@gmail.com';
  mail_password := 'onsipidmntdeiazd';
  mail_to := Email;
  mail_subject := sSubject;
  mail_body := sbody;

  try

    begin
      gmail(mail_username, mail_password, mail_to, mail_subject, mail_body);
    end;
  except
    // Delphi Is mY Power?
  end;
end;

procedure TNew_Student_Application_Pg.btnConfirmClick(sender: Tobject);
var
  choice: String;
begin

  choice := UpperCase(InputBox('Temp Password',
      'Are you sure you would like to have this as your temporary password. NB. you will not be able to change it(Yes/No)', 'No'));

  if choice = 'YES' then
  begin
    temp := edtTemp.Text;
  end
  else if choice = 'NO' then
  begin
    edtTemp.Clear;
  end
  else if not(choice = 'YES') or (choice = 'NO') then
  begin
    edtTemp.Color := clred;
    ShowMessage('Please enter a valid response');
  end;
end;

procedure TNew_Student_Application_Pg.chbNoClick(sender: Tobject);
begin
  if chbNo.Checked = False then
  begin
    edtPrevious.Hide;
    chbYes.Enabled := True;
  end
  else if chbNo.Checked = True then
  begin
    edtPrevious := TEdit.create(New_Student_Application_Pg);
    // Dynamic object creation
    edtPrevious.Parent := p1;
    edtPrevious.Width := 161;
    edtPrevious.Height := 21;
    edtPrevious.Left := 47;
    edtPrevious.Top := 286;
    edtPrevious.TextHint := 'Enter Previous School';
    edtPrevious.OnClick := edtPreviousClick;
    chbYes.Enabled := False;
  end;
end;

procedure TNew_Student_Application_Pg.chbYesClick(sender: Tobject);
begin

  if chbYes.Checked = True then
  begin
    chbNo.Enabled := False;

  end
  else
  begin
    chbNo.Enabled := True;
  end;
end;

Procedure TNew_Student_Application_Pg.edtPreviousClick;
begin
  //
end;

procedure TNew_Student_Application_Pg.gmail(username, password, totarget,
  subject, body: string);
var
  DATA: TIdMessage;
  SMTP: TIdSMTP;
  SSL: TIdSSLIOHandlerSocketOpenSSL;

begin

  SMTP := TIdSMTP.create(nil); // Emailing system , that sends predetermined emails to those who submit an application
  DATA := TIdMessage.create(nil);
  SSL := TIdSSLIOHandlerSocketOpenSSL.create(nil);

  SSL.SSLOptions.Method := sslvTLSv1;
  SSL.SSLOptions.Mode := sslmUnassigned;
  SSL.SSLOptions.VerifyMode := [];
  SSL.SSLOptions.VerifyDepth := 0;

  DATA.From.address := username;
  DATA.Recipients.EMailAddresses := totarget;
  DATA.subject := subject;
  DATA.body.Text := body;

  SMTP.IOHandler := SSL;
  SMTP.Host := 'smtp.gmail.com';
  SMTP.Port := 587;
  SMTP.username := username;
  SMTP.password := password;
  SMTP.UseTLS := utUseExplicitTLS;

  SMTP.Connect;
  SMTP.Send(DATA);
  SMTP.Disconnect;

  SMTP.Free;
  DATA.Free;
  SSL.Free;

end;

end.
