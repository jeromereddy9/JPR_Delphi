unit WortHogs_DB_connections;

interface

uses
  SysUtils, Classes, DB, ADODB, IdBaseComponent, IdMessage, IdTCPConnection,
  IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase,
  IdSMTP, IdComponent, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL,
  IdSSLOpenSSL;

type
  TWortHogs_DataModule = class(TDataModule)
    WortHogs_ADO_connection: TADOConnection;
    tblParents: TADOTable;
    dscParents: TDataSource;
    tblLearners: TADOTable;
    tblProsLearners: TADOTable;
    dscLearners: TDataSource;
    dscProsLearner: TDataSource;
    dscQryParents: TDataSource;
    dscQryLearners: TDataSource;
    dscQryProsLearners: TDataSource;
    qryParents: TADOQuery;
    qryLearners: TADOQuery;
    qryProsLearners: TADOQuery;
    tblSubject: TADOTable;
    dscSubject: TDataSource;
    qrySubjects: TADOQuery;
    dscQrySubjects: TDataSource;
    tblRegisteredStudent: TADOTable;
    dscRegisteredStudent: TDataSource;
    qryRegisteredStudent: TADOQuery;
    dscQryRegisteredStudent: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WortHogs_DataModule: TWortHogs_DataModule;

implementation

{$R *.dfm}

end.
