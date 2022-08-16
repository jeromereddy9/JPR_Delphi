unit Back_End;

interface

Uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, math, DateUtils;

Type
  TBack_End = Class(TObject)
  private
    //
    fLname, fLSurname, fIDNumber, fschool, femail, fcellnum, fPname, fPSurname,
      fTemp_pass, faddress, fGrade: string;
    fDOB, fDOR: TDate;
  public
    //
    constructor create(Lname, LSurname, IDNumber, school, email, cellnum,
      Pname, PSurname, Temp_pass, address, Grade: string; DOB, DOR: TDate);

    function TOString: string;
  End;

implementation

{ TBack_End }

{ TBack_End }

constructor TBack_End.create(Lname, LSurname, IDNumber, school, email, cellnum,
  Pname, PSurname, Temp_pass, address, Grade: string; DOB, DOR: TDate);
begin
  fLname := Lname;
  fLSurname := LSurname;
  fIDNumber := IDNumber;
  fschool := school;
  femail := email;
  fcellnum := cellnum;
  fPname := Pname;
  fPSurname := PSurname;
  fGrade := Grade;
  fDOB := DOB;
  fDOR := DOR;
  fTemp_pass := Temp_pass;
  faddress := address;
end;

function TBack_End.TOString: string;
begin
  Result := 'Student Name: ' + fLname + #13 + 'Student Surname: ' + fLSurname +
    #13 + 'Student ID Number: ' + fIDNumber + #13 + #13 + 'Previous School: ' +
    fschool + #13 + 'Grade: ' + (fGrade) + #13 + 'Date of Birth: ' + DateToStr
    (fDOB) + #13 + 'Date of Registration: ' + DateToStr(fDOR)
    + #13 + 'Temporary Password: ' + fTemp_pass + #13 + #13 +
    'Parent Name: ' + fPname + #13 + 'Parent Surname: ' + fPSurname + #13 +
    #13 + 'Contact information' + #13 + '===================' + #13 + #13 +
    'Cell Number: ' + fcellnum + #13 + 'Email Address: ' + femail + #13 + #13 +
    'Address: ' + faddress;

end;

end.
