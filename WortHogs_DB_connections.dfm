object WortHogs_DataModule: TWortHogs_DataModule
  OldCreateOrder = False
  Height = 343
  Width = 771
  object WortHogs_ADO_connection: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=F:\Re' +
      'ddy_Jerome_12B\Wort_HogsDB(2002-2003).mdb;Mode=ReadWrite;Persist' +
      ' Security Info=False;Jet OLEDB:System database="";Jet OLEDB:Regi' +
      'stry Path="";Jet OLEDB:Database Password="";Jet OLEDB:Engine Typ' +
      'e=5;Jet OLEDB:Database Locking Mode=1;Jet OLEDB:Global Partial B' +
      'ulk Ops=2;Jet OLEDB:Global Bulk Transactions=1;Jet OLEDB:New Dat' +
      'abase Password="";Jet OLEDB:Create System Database=False;Jet OLE' +
      'DB:Encrypt Database=False;Jet OLEDB:Don'#39't Copy Locale on Compact' +
      '=False;Jet OLEDB:Compact Without Replica Repair=False;Jet OLEDB:' +
      'SFP=False'
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 128
    Top = 8
  end
  object tblParents: TADOTable
    Active = True
    Connection = WortHogs_ADO_connection
    CursorType = ctStatic
    TableName = 'tblParent'
    Left = 32
    Top = 80
  end
  object dscParents: TDataSource
    DataSet = tblParents
    Left = 32
    Top = 136
  end
  object tblLearners: TADOTable
    Active = True
    Connection = WortHogs_ADO_connection
    CursorType = ctStatic
    TableName = 'tblLearner'
    Left = 128
    Top = 88
  end
  object tblProsLearners: TADOTable
    Active = True
    Connection = WortHogs_ADO_connection
    CursorType = ctStatic
    TableName = 'tblProspective_Learner'
    Left = 216
    Top = 80
  end
  object dscLearners: TDataSource
    DataSet = tblLearners
    Left = 128
    Top = 136
  end
  object dscProsLearner: TDataSource
    DataSet = tblProsLearners
    Left = 216
    Top = 136
  end
  object dscQryParents: TDataSource
    DataSet = qryParents
    Left = 32
    Top = 248
  end
  object dscQryLearners: TDataSource
    DataSet = qryLearners
    Left = 128
    Top = 248
  end
  object dscQryProsLearners: TDataSource
    DataSet = qryProsLearners
    Left = 224
    Top = 248
  end
  object qryParents: TADOQuery
    Connection = WortHogs_ADO_connection
    DataSource = dscParents
    Parameters = <>
    Left = 32
    Top = 192
  end
  object qryLearners: TADOQuery
    Connection = WortHogs_ADO_connection
    DataSource = dscLearners
    Parameters = <>
    Left = 128
    Top = 192
  end
  object qryProsLearners: TADOQuery
    Connection = WortHogs_ADO_connection
    DataSource = dscProsLearner
    Parameters = <>
    Left = 216
    Top = 192
  end
  object tblSubject: TADOTable
    Active = True
    Connection = WortHogs_ADO_connection
    CursorType = ctStatic
    TableName = 'tblSubject'
    Left = 312
    Top = 80
  end
  object dscSubject: TDataSource
    DataSet = tblSubject
    Left = 312
    Top = 136
  end
  object qrySubjects: TADOQuery
    Connection = WortHogs_ADO_connection
    DataSource = dscSubject
    Parameters = <>
    Left = 312
    Top = 192
  end
  object dscQrySubjects: TDataSource
    DataSet = qrySubjects
    Left = 312
    Top = 248
  end
  object tblRegisteredStudent: TADOTable
    Active = True
    Connection = WortHogs_ADO_connection
    CursorType = ctStatic
    TableName = 'tblRegistered_Learner'
    Left = 424
    Top = 80
  end
  object dscRegisteredStudent: TDataSource
    DataSet = tblRegisteredStudent
    Left = 424
    Top = 136
  end
  object qryRegisteredStudent: TADOQuery
    Connection = WortHogs_ADO_connection
    DataSource = dscRegisteredStudent
    Parameters = <>
    Left = 424
    Top = 200
  end
  object dscQryRegisteredStudent: TDataSource
    DataSet = qryRegisteredStudent
    Left = 424
    Top = 256
  end
end
