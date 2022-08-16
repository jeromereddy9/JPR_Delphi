unit Administrator_DashBoard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ComCtrls, WortHogs_DB_connections,
  Student_applicationPg, ExtCtrls, StdCtrls, dblookup, Mask, DBCtrls,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL,
  IdComponent, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  IdMessageClient, IdSMTPBase, IdSMTP, IdBaseComponent, IdMessage, jpeg, math,
  DateUtils;

type
  TAdmin_Pg = class(TForm)
    Pg3: TPageControl;
    Administrator_Panel: TTabSheet;
    DBParent: TDBGrid;
    Students: TTabSheet;
    ProsLearner: TTabSheet;
    DBLearners: TDBGrid;
    DBProsLearners: TDBGrid;
    Management: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    DBParentsearch: TDBGrid;
    edtSearchName: TEdit;
    DbedtPID: TDBEdit;
    DbedtpName: TDBEdit;
    DbedtPSurname: TDBEdit;
    DbedtPAdress: TDBEdit;
    DBedtMarital_status: TDBEdit;
    dbedtcellNum: TDBEdit;
    dbedtOccupation: TDBEdit;
    edtpID: TEdit;
    edtPName: TEdit;
    edtPSurname: TEdit;
    edtPAddress: TEdit;
    edtCellNum: TEdit;
    edtOccupation: TEdit;
    cmbMarital: TComboBox;
    btnUpdateP: TButton;
    Pl4: TPanel;
    btnsearchIDL: TButton;
    Button14: TButton;
    Label1: TLabel;
    Label2: TLabel;
    PL5: TPanel;
    DBedtFees: TDBEdit;
    chb1: TCheckBox;
    chb2: TCheckBox;
    DBLearnerID: TDBEdit;
    DBLearnerName: TDBEdit;
    DBLearnerSurname: TDBEdit;
    DBRegfee: TDBEdit;
    DBLNumber: TDBEdit;
    DBLPassword: TDBEdit;
    DBFees: TDBEdit;
    Panel3: TPanel;
    Panel4: TPanel;
    btnBack: TButton;
    btnDetails: TButton;
    btnsort2: TButton;
    btnSearch: TButton;
    btnID: TButton;
    edtname: TEdit;
    Panel5: TPanel;
    BtnAccept: TButton;
    btnReject: TButton;
    Panel6: TPanel;
    Panel7: TPanel;
    btnBoth: TButton;
    IdMessage1: TIdMessage;
    IdSMTP1: TIdSMTP;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    DBedt1: TDBEdit;
    DBedt2: TDBEdit;
    btnPrevious: TButton;
    btnNext2: TButton;
    Label4: TLabel;
    Label5: TLabel;
    DBedt3: TDBEdit;
    Label6: TLabel;
    Panel8: TPanel;
    btnAdd: TButton;
    output: TRichEdit;
    btnView: TButton;
    btnLogout: TButton;
    Panel9: TPanel;
    Button3: TButton;
    btnAddP: TButton;
    btndeleteP: TButton;
    btnSort: TButton;
    Button2: TButton;
    btnSearchpID: TButton;
    GroupBox1: TGroupBox;
    Panel10: TPanel;
    btnHelp: TButton;
    Panel11: TPanel;
    edtLearnerID: TEdit;
    edtLearnerName: TEdit;
    edtLearnerSurname: TEdit;
    edtRegFee: TEdit;
    edtLearnerNumber: TEdit;
    edtLearner_Password: TEdit;
    edtFees: TEdit;
    DTP1: TDateTimePicker;
    DTP2: TDateTimePicker;
    DBL: TDBGrid;
    edtsearchNameL: TEdit;
    Label3: TLabel;
    btnUpdate: TButton;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Panel12: TPanel;
    Panel13: TPanel;
    btnAddL: TButton;
    btnDeleteL: TButton;
    btnLearner: TButton;
    btnSortL: TButton;
    btnFees: TButton;
    btntotal: TButton;
    Button1: TButton;
    GroupBox5: TGroupBox;
    Button5: TButton;
    GroupBox6: TGroupBox;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    btndelete3: TButton;
    procedure FormActivate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure btnAddPClick(Sender: TObject);
    procedure btndeletePClick(Sender: TObject);
    procedure btnSortClick(Sender: TObject);
    procedure btnSearchpIDClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnUpdatePClick(Sender: TObject);
    procedure btnLearnerClick(Sender: TObject);
    procedure btnAddLClick(Sender: TObject);
    procedure btnDeleteLClick(Sender: TObject);
    procedure btnSortLClick(Sender: TObject);
    procedure btnsearchIDLClick(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
    procedure btnFeesClick(Sender: TObject);
    procedure btntotalClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure btnDetailsClick(Sender: TObject);
    procedure btnsort2Click(Sender: TObject);
    procedure btnIDClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnBothClick(Sender: TObject);
    procedure BtnAcceptClick(Sender: TObject);
    procedure btnPreviousClick(Sender: TObject);
    procedure btnNext2Click(Sender: TObject);
    procedure btnRejectClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnViewClick(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure btnLogoutClick(Sender: TObject);
    procedure btndelete3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure gmail(username, password, totarget, subject, body: string);
  end;

var
  Admin_Pg: TAdmin_Pg;
  searchIDPL: string;

implementation

uses Login_RegistrationPg, Help;
{$R *.dfm}

procedure TAdmin_Pg.BtnAcceptClick(Sender: TObject);
var
  fees: real;
  password, name, surname, ID: string;
  learner_No: integer;
  sbody, sSubject, mail_username, mail_password, mail_to, mail_subject,
    mail_body, sgmail: string;
begin

  //

  fees := 7500;
  with WortHogs_DataModule do
  begin
    learner_No := randomrange(1, 100) + 1;
    name := tblProsLearners['LearnerName'];
    surname := tblProsLearners['LearnerSurname'];
    ID := tblProsLearners['Learner_ID'];
    password := Copy(name, 1, 3) + Copy(surname, 1, 1) + Copy(ID, 1, 4);
    tblProsLearners.First;
    while NOT tblProsLearners.Eof do
    begin

      if tblProsLearners['Learner_ID'] = DBedt2.Text then
      begin

        tblRegisteredStudent.Last;
        tblRegisteredStudent.insert;
        tblRegisteredStudent['Reg_No'] := learner_No;
        tblRegisteredStudent['Learner_ID'] := tblProsLearners['Learner_ID'];
        tblRegisteredStudent.Post;
        tblRegisteredStudent.Refresh;

        sgmail := tblProsLearners['Email'];
        tblLearners.Last;
        tblLearners.insert;
        tblLearners['Learner_ID'] := tblProsLearners['Learner_ID'];
        tblLearners['LearnerName'] := tblProsLearners['LearnerName'];
        tblLearners['LearnerSurname'] := tblProsLearners['LearnerSurname'];
        tblLearners['Parent_ID'] := tblProsLearners['Parent_ID'];
        tblLearners['DOB'] := tblProsLearners['DOB'];
        tblLearners['DOR'] := today;
        tblLearners['RegFee'] := tblProsLearners['RegFee'];
        tblLearners['Fees'] := fees;
        tblLearners['Grade'] := tblProsLearners['Grade'];
        tblLearners['FeesPaid'] := False;
        tblLearners['Learner_Password'] := password;
        tblLearners['Reg_No'] := learner_No;
        tblLearners['SubjectComboNo'] := tblProsLearners['SubjectComboNo'];
        tblLearners.Post;
        tblLearners.Refresh;

      end;

      tblProsLearners.Edit;
      qryProsLearners.Close;
      qryProsLearners.SQL.Clear;
      qryProsLearners.SQL.Add(
        'delete * from tblProspective_Learner where Learner_ID ="' + ID + '"');
      DBProsLearners.DataSource := dscQryProsLearners;
      qryProsLearners.ExecSQL;
      tblProsLearners.Next;
    end;
  end;
  sSubject := 'Application Successful';
  sbody := 'Congradulations on being accepted' + #13 + #13 +
    'These are your login credentials' + #13 + #13 + 'Your Learner No:' +
    IntToStr(learner_No) + #13 + ' This is your password: ' + password;

  mail_username := 'worthogshigh@gmail.com';
  mail_password := 'onsipidmntdeiazd';
  mail_to := sgmail;
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

procedure TAdmin_Pg.btnAddClick(Sender: TObject);
var
  sline, username, password: string;
  tfile: Textfile;
begin
  username := InputBox('Admin Creation', 'Enter a Username', '');
  password := InputBox('Admin Creation', 'Enter a password', '');
  sline := username + '#' + password;
  if FileExists('Admins.txt') then
  begin
    AssignFile(tfile, 'Admins.txt');
    append(tfile);
    Writeln(tfile, sline);
  end;
  CloseFile(tfile);
  ShowMessage('New Admin Created');
end;

procedure TAdmin_Pg.btnAddLClick(Sender: TObject);
begin
  with WortHogs_DataModule do
  begin
    tblLearners.Last;
    tblLearners.insert;
    tblLearners['Learner_ID'] := InputBox('Learner Information',
      'Enter Learner ID', '');
    tblLearners['LearnerName'] := InputBox('Learner Information',
      'Enter Learner Name', '');
    tblLearners['LearnerSurname'] := InputBox('Learner Information',
      'Enter Learner Surname', '');
    tblLearners['Parent_ID'] := InputBox('Parent Information',
      'Enter Parent ID', '');
    tblLearners['DOB'] := DTP1.Date;
    tblLearners['DOR'] := DTP2.Date;
    tblLearners['Reg_No'] := InputBox('Learner Information', 'Enter Number',
      '');

    if (chb1.Checked = True) and (chb2.Checked = False) then
    begin
      tblLearners['RegFee'] := 0;
      tblLearners['Fees'] := 0;
      tblLearners['FeesPaid'] := True;
    end
    else if (chb1.Checked = False) and (chb2.Checked = True) then
    begin
      tblLearners['RegFee'] := StrToFloat(InputBox('Learner Information',
          'Enter Registration fee amount due', ''));
      tblLearners['Fees'] := StrToFloat(InputBox('Learner Information',
          'Enter fees amount', ''));
      tblLearners['FeesPaid'] := False;
    end;
    tblLearners['Learner_Password'] := InputBox('Learner Information',
      'Enter new password', '');
    tblLearners.Post;
    tblLearners.Refresh;
  end;
end;

procedure TAdmin_Pg.btnAddPClick(Sender: TObject);
begin
  with WortHogs_DataModule do
  begin
    tblParents.Last; // Inserting into table
    tblParents.insert;
    tblParents['Parent_ID'] := InputBox('Parent Information',
      'Enter Parent ID', '');
    tblParents['ParentName'] := InputBox('Parent Information',
      'Enter Parent Name', '');
    tblParents['ParentSurname'] := InputBox('Parent Information',
      'Enter Parent Surname', '');
    tblParents['Address'] := InputBox('Parent Information',
      'Enter Parent Adress', '');
    tblParents['Marital_Status'] := InputBox('Parent Information',
      'Enter Marital_Status', '');
    tblParents['ParentNum'] := InputBox('Parent Information',
      'Enter Parent cell number', '');
    tblParents['Occupation'] := InputBox('Parent Information',
      'Enter Parent Occupation', '');
    tblParents.Post;
    tblParents.Refresh;
  end;
end;

procedure TAdmin_Pg.btnBackClick(Sender: TObject);
begin
  Admin_Pg.Hide;
  Login.Show;
end;

procedure TAdmin_Pg.btnBothClick(Sender: TObject);
begin
  with WortHogs_DataModule do
  begin
    qryProsLearners.Close;
    qryProsLearners.SQL.Clear;
    qryProsLearners.SQL.Add(
      'select LearnerName,ParentName,Learner_ID,tblProspective_Learner.Parent_ID from tblParent, tblProspective_Learner where tblParent.Parent_ID = tblProspective_Learner.Parent_ID');
    // Query between two tables
    DBProsLearners.DataSource := dscQryProsLearners;
    qryProsLearners.ExecSQL;
  end;
end;

procedure TAdmin_Pg.btndelete3Click(Sender: TObject);
begin
  with WortHogs_DataModule do
  begin
    tblProsLearners.Next;
    tblProsLearners.Edit;
    qryProsLearners.Close;
    qryProsLearners.SQL.Clear;
    qryProsLearners.SQL.Add(
      'delete * from tblProspective_Learner where Learner_ID ="' + searchIDPL +
        '"');
    DBProsLearners.DataSource := dscQryProsLearners;
    qryProsLearners.ExecSQL;
  end;
end;

procedure TAdmin_Pg.btnDeleteLClick(Sender: TObject);
var
  DeleteAll, deleteLearner: string;
begin
  DeleteAll := UpperCase(InputBox('delete Learner',
      'Do you want delete all Learners?', 'No'));
  with WortHogs_DataModule do
  begin
    tblLearners.Edit;
    if DeleteAll = 'NO' then
    begin
      deleteLearner := InputBox('Delete Learner', 'Enter Parent ID', '');
      qryLearners.Close;
      qryLearners.SQL.Clear;
      qryLearners.SQL.Add('Delete *from tblLearner where Learner_ID = " ' +
          deleteLearner + '"');
      DBLearners.DataSource := dscQryLearners;
      qryLearners.ExecSQL;
    end
    else if DeleteAll = 'YES' then
    begin
      qryLearners.Close;
      qryLearners.SQL.Clear;
      qryLearners.SQL.Add('Delete * from tblLearner');
      DBLearners.DataSource := dscQryLearners;
      qryLearners.ExecSQL;
    end;
  end;
end;

procedure TAdmin_Pg.btndeletePClick(Sender: TObject);
var
  DeleteAll, deleteParent: string;
begin
  DeleteAll := UpperCase(InputBox('delete Parent',
      'Do you want delete all Parents?', 'No'));
  with WortHogs_DataModule do
  begin
    tblParents.Edit;
    if DeleteAll = 'NO' then
    begin
      deleteParent := InputBox('Delete Parent', 'Enter Parent ID', '');
      qryParents.Close;
      qryParents.SQL.Clear;
      qryParents.SQL.Add('Delete *from tblParent where Parent_ID = " ' +
        // Deleting from table
          deleteParent + '"');
      DBParent.DataSource := dscQryParents;
      qryParents.ExecSQL;
    end
    else if DeleteAll = 'YES' then
    begin
      qryParents.Close;
      qryParents.SQL.Clear;
      qryParents.SQL.Add('Delete * from tblParent'); // Deleting from table
      DBParent.DataSource := dscQryParents;
      qryParents.ExecSQL;
    end;
  end;

end;

procedure TAdmin_Pg.btnDetailsClick(Sender: TObject);
begin
  with WortHogs_DataModule do
  begin
    qryProsLearners.Close;
    qryProsLearners.SQL.Clear;
    qryProsLearners.SQL.Add('Select * from tblProspective_Learner ');
    DBProsLearners.DataSource := dscQryProsLearners;
    qryProsLearners.Open;
  end;

end;

procedure TAdmin_Pg.btnFeesClick(Sender: TObject);
begin
  with WortHogs_DataModule do
  begin
    qryLearners.Close;
    qryLearners.SQL.Clear;
    qryLearners.SQL.Add(
      'Select LearnerName,RegFee,fees from tblLearner where FeesPaid = False');
    DBL.DataSource := dscQryLearners;
    qryLearners.Open;
  end;
end;

procedure TAdmin_Pg.btnHelpClick(Sender: TObject);
begin
  //
  Help_form.Show;
end;

procedure TAdmin_Pg.btnIDClick(Sender: TObject);
begin
  searchIDPL := InputBox('Search Learner by ID', 'Enter the Learner ID', '');
  try
    with WortHogs_DataModule do
    begin
      qryProsLearners.Close;
      qryProsLearners.SQL.Clear;
      qryProsLearners.SQL.Add(
        'Select * from tblProspective_Learner where Learner_ID = "' +
          searchIDPL + '"');
      DBProsLearners.DataSource := dscQryProsLearners;
      qryProsLearners.Open;
    end;
  Except
    on E: Exception do
    begin
      ShowMessage(
        'The ID you have entered has not been found please ensure it is valid or is contain in the database');
    end;
  end;
end;

procedure TAdmin_Pg.btnLearnerClick(Sender: TObject);
begin
  with WortHogs_DataModule do
  begin
    qryLearners.Close;
    qryLearners.SQL.Clear;
    qryLearners.SQL.Add('Select * from tblLearner ');
    // selecting records from table
    DBLearners.DataSource := dscQryLearners;
    qryLearners.Open;
  end;
end;

procedure TAdmin_Pg.btnNext2Click(Sender: TObject);
begin
  with WortHogs_DataModule do
  begin
    tblProsLearners.Next;
  end;
end;

procedure TAdmin_Pg.btnPreviousClick(Sender: TObject);
begin
  with WortHogs_DataModule do
  begin
    tblProsLearners.Prior;
  end;
end;

procedure TAdmin_Pg.btnRejectClick(Sender: TObject);
var
  ID: string;
  sbody, sSubject, mail_username, mail_password, mail_to, mail_subject,
    mail_body, sgmail: string;
begin
  ID := DBedt3.Text;
  with WortHogs_DataModule do
  begin
    if tblProsLearners['Parent_ID'] = ID then
    begin
      sgmail := tblProsLearners['Email'];
      tblProsLearners.Edit;
      qryProsLearners.Close;
      qryProsLearners.SQL.Clear;
      qryProsLearners.SQL.Add(
        'delete * from tblProspective_Learner where Learner_ID ="' + ID + '"');
      DBProsLearners.DataSource := dscQryProsLearners;
      qryProsLearners.ExecSQL;
    end;
    if tblParents['Parent_ID'] = ID then
    begin
      tblParents.Edit;
      qryParents.Close;
      qryParents.SQL.Clear;
      qryParents.SQL.Add(
        'delete * from tblProspective_Learner where Learner_ID ="' + ID + '"');
      DBParent.DataSource := dscQryParents;
      qryParents.ExecSQL;
    end;
  end;
  sSubject := 'Application Unsuccessful';
  sbody := 'We regret to inform you that your application has been declined.';
  mail_username := 'worthogshigh@gmail.com';
  mail_password := 'onsipidmntdeiazd';
  mail_to := sgmail;
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

procedure TAdmin_Pg.btnSearchClick(Sender: TObject);
var
  search: string;
begin
  search := edtname.Text;
  with WortHogs_DataModule do
  begin
    try
      qryProsLearners.Close;
      qryProsLearners.SQL.Clear;
      qryProsLearners.SQL.Add(
        'select * from tblProspective_Learner where LearnerName LIKE "%' +
          search + '%"');
      DBProsLearners.DataSource := dscQryProsLearners;
      qryProsLearners.Open;
    except
      on E: Exception do
      begin
        ShowMessage('An error has occured');
      end;
    end;
  end;
end;

procedure TAdmin_Pg.btnsearchIDLClick(Sender: TObject);
var
  searchID: string;
begin
  searchID := InputBox('Search Learner by ID', 'Enter the Learner ID', '');
  try
    with WortHogs_DataModule do
    begin
      qryLearners.Close;
      qryLearners.SQL.Clear;
      qryLearners.SQL.Add('Select * from tblLearner where Learner_ID = "' +
          searchID + '"');
      DBL.DataSource := dscQryLearners;
      qryLearners.Open;
    end;
  Except
    on E: Exception do
    begin
      ShowMessage(
        'The ID you have entered has not been found please ensure it is valid or is contain in the database');
    end;
  end;
end;

procedure TAdmin_Pg.btnSortClick(Sender: TObject);
begin
  with WortHogs_DataModule do
  begin
    qryParents.Close;
    qryParents.SQL.Clear;
    qryParents.SQL.Add('Select * from tblParent order by ParentName ASC');
    // sort SQL
    DBParent.DataSource := dscQryParents;
    qryParents.Open;
  end;
end;

procedure TAdmin_Pg.btnSortLClick(Sender: TObject);
begin
  with WortHogs_DataModule do
  begin
    qryLearners.Close;
    qryLearners.SQL.Clear;
    qryLearners.SQL.Add('Select * from tblLearner order by LearnerName ASC');
    // sort SQL
    DBLearners.DataSource := dscQryLearners;
    qryLearners.Open;
  end;
end;

procedure TAdmin_Pg.btntotalClick(Sender: TObject);
begin
  with WortHogs_DataModule do
  begin
    qryLearners.Close;
    qryLearners.SQL.Clear;
    qryLearners.SQL.Add(
      'Select sum(Fees) +sum(RegFee) as [Total fees due] from tblLearner ');
    // calculation using sum
    DBL.DataSource := dscQryLearners;
    qryLearners.Open;
  end;
end;

procedure TAdmin_Pg.btnUpdateClick(Sender: TObject);
begin
  with WortHogs_DataModule do // Editing records in table
  begin
    tblLearners.Edit;
    if edtLearnerName.Text = '' then
    begin
      tblLearners['LearnerName'] := DBLearnerName.Text;
    end
    else
    begin
      tblLearners['LearnerName'] := edtLearnerName.Text;
    end;
    if edtLearnerSurname.Text = '' then
    begin
      tblLearners['LearnerSurname'] := DBLearnerSurname.Text;
    end
    else
    begin
      tblLearners['LearnerSurname'] := edtLearnerSurname.Text;
    end;
    if edtLearnerID.Text = '' then
    begin
      tblLearners['Learner_ID'] := DBLearnerID.Text;
    end
    else
    begin
      tblLearners['Learner_ID'] := edtLearnerID.Text;
    end;
    if edtRegFee.Text = '' then
    begin
      tblLearners['RegFee'] := DBRegfee.Text;
    end
    else
    begin
      tblLearners['RegFee'] := StrToFloat(edtRegFee.Text);
    end;
    if edtLearnerNumber.Text = '' then
    begin
      tblLearners['Reg_No'] := DBLNumber.Text;
    end
    else
    begin
      tblLearners['Reg_No'] := strtoint(edtLearnerNumber.Text);
    end;
    if edtLearner_Password.Text = '' then
    begin
      tblLearners['Learner_Password'] := DBLPassword.Text;
    end
    else
    begin
      tblLearners['Learner_Password'] := (edtLearner_Password.Text);
    end;
    if edtFees.Text = '' then
    begin
      tblLearners['Fees'] := DBFees.Text;
    end
    else
    begin
      tblLearners['Fees'] := StrToFloat(edtFees.Text);
    end;
    if (tblLearners['RegFee'] > 0) or (tblLearners['Fees'] > 0) then
    begin
      tblLearners['FeesPaid'] := False;
    end
    else
    begin
      tblLearners['FeesPaid'] := True;
    end;
    tblLearners['DOB'] := DTP1.Date;
    tblLearners['DOR'] := DTP2.Date;
    if (chb1.Checked = True) and (chb2.Checked = False) then
    begin
      tblLearners['FeesPaid'] := True;
    end
    else if (chb1.Checked = False) and (chb2.Checked = True) then
    begin
      tblLearners['FeesPaid'] := False;
    end;
    tblLearners.Post;
    tblLearners.Refresh;

  end;

end;

procedure TAdmin_Pg.btnUpdatePClick(Sender: TObject);
begin
  with WortHogs_DataModule do
  begin
    tblParents.Edit;
    if edtpID.Text = '' then
    begin
      tblParents['Parent_ID'] := DbedtPID.Text;
    end
    else
    begin
      tblParents['Parent_ID'] := edtpID.Text;
    end;
    if edtPName.Text = '' then
    begin
      tblParents['ParentName'] := DbedtpName.Text;
    end
    else
    begin
      tblParents['ParentName'] := edtPName.Text;
    end;
    if edtPSurname.Text = '' then
    begin
      tblParents['ParentSurname'] := DbedtPSurname.Text;
    end
    else
    begin
      tblParents['ParentSurname'] := edtPSurname.Text;
    end;
    if edtPAddress.Text = '' then
    begin
      tblParents['Address'] := DbedtPAdress.Text;
    end
    else
    begin
      tblParents['Address'] := edtPAddress.Text;
    end;
    if cmbMarital.ItemIndex = -1 then
    begin
      tblParents['Marital_Status'] := DBedtMarital_status.Text;
    end
    else
    begin
      tblParents['Marital_Status'] := cmbMarital.Text;
    end;
    if edtCellNum.Text = '' then
    begin
      tblParents['ParentNum'] := dbedtcellNum.Text;
    end
    else
    begin
      tblParents['ParentNum'] := edtCellNum.Text;
    end;
    if edtOccupation.Text = '' then
    begin
      tblParents['Occupation'] := dbedtOccupation.Text;
    end
    else
    begin
      tblParents['Occupation'] := edtOccupation.Text;
    end;
    tblParents.Post;
    tblParents.Refresh;
  end;
end;

procedure TAdmin_Pg.btnViewClick(Sender: TObject);
var
  arrUsername: array [1 .. 100] of string;
  arrPassword: array [1 .. 100] of string;
  IC, i, counter: integer;
  sline, username, password: string;
  tfile: Textfile;
begin
  if FileExists('Admins.txt') then
  begin
    counter := 0;
    AssignFile(tfile, 'Admins.txt');
    Reset(tfile);
    IC := 0;
    while not Eof(tfile) do
    begin
      Inc(IC);
      Readln(tfile, sline);

      arrUsername[IC] := Copy(sline, 1, pos('#', sline) - 1);
      Delete(sline, 1, pos('#', sline));

      arrPassword[IC] := sline;

    end;
    CloseFile(tfile);
  end;
  output.Lines.Add('Admins:' + #13 + '==========');
  for i := 0 to IC do
  begin
    sline := arrUsername[i] + #9;
    output.Lines.Add(sline);
  end;
  output.Lines.Add(sline);
end;

procedure TAdmin_Pg.btnSearchpIDClick(Sender: TObject);
var
  searchID: string;
begin
  searchID := InputBox('Search Parent by ID', 'Enter the Parent ID', '');
  try
    with WortHogs_DataModule do
    begin
      qryParents.Close;
      qryParents.SQL.Clear;
      qryParents.SQL.Add('Select * from tblParent where Parent_ID = "' +
          searchID + '"');
      DBParent.DataSource := dscQryParents;
      qryParents.Open;
    end;
  Except
    on E: Exception do
    begin
      ShowMessage(
        'The ID you have entered has not been found please ensure it is valid or is contain in the database');
    end;
  end;
end;

procedure TAdmin_Pg.btnsort2Click(Sender: TObject);
begin
  with WortHogs_DataModule do
  begin
    qryProsLearners.Close;
    qryProsLearners.SQL.Clear;
    qryProsLearners.SQL.Add(
      'Select * from tblProspective_Learner order by LearnerName ASC ');
    DBProsLearners.DataSource := dscQryProsLearners;
    qryProsLearners.Open;
  end;
end;

procedure TAdmin_Pg.Button14Click(Sender: TObject);
var
  search: string;
begin
  search := edtsearchNameL.Text;
  with WortHogs_DataModule do
  begin
    try
      qryLearners.Close;
      qryLearners.SQL.Clear;
      qryLearners.SQL.Add
        ('select * from tblLearner where LearnerName LIKE "%' + search +
          '%"'); // complex query using LIKE as well as using a variable
      DBL.DataSource := dscQryLearners;
      qryLearners.Open;
    except
      on E: Exception do
      begin
        ShowMessage('An error has occured');
      end;
    end;
  end;
end;

procedure TAdmin_Pg.Button1Click(Sender: TObject);
begin
  with WortHogs_DataModule do
  begin
    qryLearners.Close;
    qryLearners.SQL.Clear;
    qryLearners.SQL.Add(
      'Select AVG(Fees) as [Average Fees Owed] from tblLearner ');
    // calculation using average
    DBL.DataSource := dscQryLearners;
    qryLearners.Open;
  end;
end;

procedure TAdmin_Pg.Button2Click(Sender: TObject);
var
  search: string;
begin
  search := edtSearchName.Text;
  with WortHogs_DataModule do
  begin
    try
      qryParents.Close;
      qryParents.SQL.Clear;
      qryParents.SQL.Add('select * from tblParent where ParentName LIKE "%' +
          search + '%"'); // Search SQL and Dynamic query
      DBParentsearch.DataSource := dscQryParents;
      qryParents.Open;
    except
      on E: Exception do
      begin
        ShowMessage('An error has occured');
      end;
    end;
  end;
end;

procedure TAdmin_Pg.Button3Click(Sender: TObject);
begin
  with WortHogs_DataModule do
  begin
    qryParents.Close; // previous queries are closed (similar to closeFile)
    qryParents.SQL.Clear; // clears previous queries
    qryParents.SQL.Add('Select * from tblParent '); // the SQl statement
    DBParent.DataSource := dscQryParents; // to set new data on dbgrid foe each execution
    qryParents.Open; // to open/run the query
  end;
end;

procedure TAdmin_Pg.Button5Click(Sender: TObject);
begin
  Students.Hide;
  Administrator_Panel.Show;

end;

procedure TAdmin_Pg.FormActivate(Sender: TObject);
begin
  //
end;

procedure TAdmin_Pg.gmail(username, password, totarget, subject, body: string);
var
  DATA: TIdMessage;
  SMTP: TIdSMTP;
  SSL: TIdSSLIOHandlerSocketOpenSSL;

begin

  SMTP := TIdSMTP.create(nil);
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

procedure TAdmin_Pg.btnLogoutClick(Sender: TObject);
begin
  //
  Application.Terminate;
end;

end.
