unit WortHogs_Emailing_system;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, math, ShellAPI, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdComponent,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient,
  IdSMTPBase, IdSMTP, IdBaseComponent, IdMessage, WortHogs_DB_connections;

type
  TEmail = Class(TObject)
  private
    //
    fusername, fpassword, ftotarget, fsubject, fbody: string;
  public
    //
    constructor create(username, password, totarget, subject, body: string);
    procedure gmail;
  end;

implementation

{ TEmail }

constructor TEmail.create(username, password, totarget, subject, body: string);
begin
  //
  fusername := username;
  fpassword := password;
  ftotarget := totarget;
  fsubject := subject;
  fbody := body;
end;

procedure TEmail.gmail;
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

  DATA.From.Address := fusername;
  DATA.Recipients.EMailAddresses := ftotarget;
  DATA.subject := fsubject;
  DATA.body.Text := fbody;

  SMTP.IOHandler := SSL;
  SMTP.Host := 'smtp.gmail.com';
  SMTP.Port := 587;
  SMTP.username := fusername;
  SMTP.password := fpassword;
  SMTP.UseTLS := utUseExplicitTLS;

  SMTP.Connect;
  SMTP.Send(DATA);
  SMTP.Disconnect;

  SMTP.Free;
  DATA.Free;
  SSL.Free;

end;

end.
