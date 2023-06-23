object ServerMethods1: TServerMethods1
  OldCreateOrder = False
  Height = 370
  Width = 436
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\FOODCAFE\database\POS'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 32
    Top = 16
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    VendorLib = 'D:\'#52572#54616#49437' '#51089#50629#47928#49436'\20230321_Waiting\Win32\Debug\fbclient.dll'
    Left = 144
    Top = 16
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 264
    Top = 16
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = FDQuery1
    Left = 360
    Top = 16
  end
end
