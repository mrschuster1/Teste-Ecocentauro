object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = 'Teste Eco'
  ClientHeight = 692
  ClientWidth = 1058
  Color = clBtnFace
  CustomTitleBar.Control = TitleBarPanel1
  CustomTitleBar.Enabled = True
  CustomTitleBar.Height = 38
  CustomTitleBar.SystemColors = False
  CustomTitleBar.SystemButtons = False
  CustomTitleBar.BackgroundColor = 10114859
  CustomTitleBar.ForegroundColor = clWhite
  CustomTitleBar.InactiveBackgroundColor = 10114859
  CustomTitleBar.InactiveForegroundColor = clWhite
  CustomTitleBar.ButtonForegroundColor = clWhite
  CustomTitleBar.ButtonBackgroundColor = 10114859
  CustomTitleBar.ButtonHoverForegroundColor = 65793
  CustomTitleBar.ButtonHoverBackgroundColor = 13732700
  CustomTitleBar.ButtonPressedForegroundColor = 65793
  CustomTitleBar.ButtonPressedBackgroundColor = 15395562
  CustomTitleBar.ButtonInactiveForegroundColor = clWhite
  CustomTitleBar.ButtonInactiveBackgroundColor = 10114859
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI Semibold'
  Font.Style = []
  Font.Quality = fqClearTypeNatural
  FormStyle = fsMDIForm
  GlassFrame.Enabled = True
  GlassFrame.Top = 38
  WindowState = wsMaximized
  StyleElements = [seFont, seClient]
  OnCloseQuery = FormCloseQuery
  TextHeight = 15
  object Splitter1: TSplitter
    Left = 200
    Top = 70
    Height = 622
    AutoSnap = False
    Color = 10114859
    MinSize = 43
    ParentColor = False
    ResizeStyle = rsUpdate
    OnCanResize = Splitter1CanResize
    OnMoved = Splitter1Moved
    ExplicitLeft = 8
    ExplicitTop = 8
    ExplicitHeight = 633
  end
  object pnlMenu: TPanel
    Left = 0
    Top = 37
    Width = 1058
    Height = 33
    Align = alTop
    BevelOuter = bvNone
    Color = 10114859
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
    object btnMenu: TSpeedButton
      AlignWithMargins = True
      Left = 5
      Top = 0
      Width = 33
      Height = 33
      Margins.Left = 5
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      Caption = #59136
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -23
      Font.Name = 'Segoe MDL2 Assets'
      Font.Style = []
      Font.Quality = fqClearTypeNatural
      ParentFont = False
      OnClick = btnMenuClick
      ExplicitLeft = 0
    end
  end
  object svMenu: TSplitView
    Left = 0
    Top = 70
    Width = 200
    Height = 622
    CompactWidth = 43
    OpenedWidth = 200
    Placement = svpLeft
    TabOrder = 1
    object CategoryButtons1: TCategoryButtons
      Left = 0
      Top = 0
      Width = 200
      Height = 622
      Align = alClient
      BackgroundGradientColor = 10114859
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      ButtonFlow = cbfVertical
      ButtonOptions = [boFullSize, boGradientFill, boShowCaptions]
      Categories = <
        item
          Caption = 'Cadastros'
          Color = 10114859
          Collapsed = False
          Items = <
            item
              Caption = 'Clientes'
              ImageIndex = 0
              ImageName = 'clientes'
              OnClick = CategoryButtons1Categories0Items0Click
            end>
          TextColor = clWhite
        end>
      Color = 10114859
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      Font.Quality = fqClearTypeNatural
      HotButtonColor = 13666649
      Images = VirtualImageListIcons
      RegularButtonColor = 10114859
      SelectedButtonColor = 7421984
      TabOrder = 0
    end
  end
  object TitleBarPanel1: TTitleBarPanel
    Left = 0
    Top = 0
    Width = 1058
    Height = 37
    CustomButtons = <>
  end
  object VirtualImageListIcons: TVirtualImageList
    Images = <
      item
        CollectionIndex = 0
        CollectionName = 'clientes'
        Name = 'clientes'
      end>
    ImageCollection = ImageCollectionIcons
    Left = 528
    Top = 352
  end
  object ImageCollectionIcons: TImageCollection
    Images = <
      item
        Name = 'clientes'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000097048597300000B1300000B1301009A9C18000001A549444154789C
              ED96312F435114C79F48DBB4DD442CEA4BF00D18AC161BAB09DF80C9279074C6
              28D14994CD864ED5C16631989A1A10D1E927274EA8A7D77BEDBDA59AF34B6EF2
              72EFF9DF73EEBBE7DE7BA2C8300CC3308C7F04900336812BE0599B7C6FC8D8A0
              F55E00D3C0356EEA623328BD17FAE77E72DE19442EB4DE1BDDF6B4AC87D67B03
              D4624E4E8092B66A6CEC32B4DE1BE029E6A4D43136131B7B0CADF7661416508B
              39A9AA6369A74929E0ABF746EF699F43ECA5F746AF41B9E292109B6C687D10F4
              21AA7B3E647DEB83207F47B658F2540FA6B40BEDCB0E5A6F18461F00056011D8
              012AC00DD0045E8136D0021AC011B00DCC03F90E7D5EFBB6D4A6A19AB6CED1D4
              392BEA437C157C83CE004BC0B13AEA15B95D0EB5C5CB8834B4D5B7C490E925F0
              316019B86578B803D680F1A4E027803386977360CA157C51F3D0C53DB007AC00
              B3C0A4A65946BFA56F556DC4D6C50BB02081F05E5EF4AA97188BDD165076E4E1
              BE4C9E3A073FE79B030E1CE767D7535FEE2678E852EE7ED4ECFDE228975BC1F5
              7C27FDC94F0E42D2E40BC1F5FC33225BC01F138DDC0E188661188611FD3E6F93
              B6291EBD61A70B0000000049454E44AE426082}
          end>
      end>
    Left = 432
    Top = 336
  end
end
