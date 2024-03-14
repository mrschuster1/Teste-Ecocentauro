object ProviderConnection: TProviderConnection
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 458
  Width = 516
  PixelsPerInch = 120
  object Conn: TFDConnection
    Params.Strings = (
      'DriverID=FB'
      'User_Name=sysdba'
      'Password=masterkey')
    LoginPrompt = False
    BeforeConnect = ConnBeforeConnect
    Left = 160
    Top = 128
  end
  object WaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 288
    Top = 128
  end
  object FBDriverLink: TFDPhysFBDriverLink
    Left = 240
    Top = 208
  end
end
