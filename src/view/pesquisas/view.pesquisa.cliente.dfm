object FormPesquisaCliente: TFormPesquisaCliente
  Left = 0
  Top = 0
  Caption = 'Pesquisa de clientes'
  ClientHeight = 625
  ClientWidth = 826
  Color = clBtnFace
  CustomTitleBar.Control = TitleBarPanel1
  CustomTitleBar.Enabled = True
  CustomTitleBar.Height = 38
  CustomTitleBar.SystemColors = False
  CustomTitleBar.SystemButtons = False
  CustomTitleBar.BackgroundColor = 10114859
  CustomTitleBar.ForegroundColor = clWhite
  CustomTitleBar.InactiveBackgroundColor = clWhite
  CustomTitleBar.InactiveForegroundColor = 10066329
  CustomTitleBar.ButtonForegroundColor = clWhite
  CustomTitleBar.ButtonBackgroundColor = 10114859
  CustomTitleBar.ButtonHoverForegroundColor = clWhite
  CustomTitleBar.ButtonHoverBackgroundColor = 13732700
  CustomTitleBar.ButtonPressedForegroundColor = clWhite
  CustomTitleBar.ButtonPressedBackgroundColor = 15395562
  CustomTitleBar.ButtonInactiveForegroundColor = 10114859
  CustomTitleBar.ButtonInactiveBackgroundColor = 10114859
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI Semibold'
  Font.Style = []
  Font.Quality = fqClearTypeNatural
  GlassFrame.Enabled = True
  GlassFrame.Top = 38
  StyleElements = [seFont, seClient]
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  TextHeight = 15
  object pnlMain: TPanel
    Left = 0
    Top = 37
    Width = 826
    Height = 533
    Align = alClient
    BevelOuter = bvNone
    Padding.Left = 10
    Padding.Top = 10
    Padding.Right = 10
    Padding.Bottom = 10
    TabOrder = 0
    ExplicitTop = 0
    ExplicitHeight = 532
    object edtPesquisa: TSearchBox
      AlignWithMargins = True
      Left = 10
      Top = 10
      Width = 806
      Height = 23
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 20
      Align = alTop
      TabOrder = 0
      TextHint = 'Pesquisa'
      OnChange = edtPesquisaChange
    end
    object GridPesquisa: TDBGrid
      Left = 10
      Top = 53
      Width = 806
      Height = 470
      Align = alClient
      BorderStyle = bsNone
      DataSource = dsPesquisa
      DrawingStyle = gdsClassic
      FixedColor = 14210507
      Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI Semibold'
      TitleFont.Style = []
      TitleFont.Quality = fqClearTypeNatural
      OnDblClick = GridPesquisaDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Caption = 'Nome'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CPF'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OBS'
          Title.Caption = 'Observa'#231#245'es'
          Width = 127
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ATIVO'
          Title.Caption = 'Ativo'
          Visible = True
        end>
    end
  end
  object TitleBarPanel1: TTitleBarPanel
    Left = 0
    Top = 0
    Width = 826
    Height = 37
    CustomButtons = <>
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 570
    Width = 826
    Height = 55
    Align = alBottom
    BevelOuter = bvNone
    Color = 10114859
    Padding.Left = 10
    Padding.Top = 10
    Padding.Right = 10
    Padding.Bottom = 10
    ParentBackground = False
    TabOrder = 2
    ExplicitLeft = -132
    ExplicitWidth = 958
    object pnlSair: TPanel
      AlignWithMargins = True
      Left = 716
      Top = 10
      Width = 100
      Height = 35
      Margins.Left = 10
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alRight
      BevelOuter = bvNone
      Color = 204
      ParentBackground = False
      TabOrder = 0
      ExplicitLeft = 848
      object btnSair: TSpeedButton
        Left = 0
        Top = 0
        Width = 100
        Height = 35
        Margins.Left = 10
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alClient
        Caption = 'Sai&r'
        ImageIndex = 0
        ImageName = 'clientes'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Segoe UI Semibold'
        Font.Style = []
        Font.Quality = fqClearTypeNatural
        ParentFont = False
        OnClick = btnSairClick
        ExplicitLeft = 942
        ExplicitTop = 10
        ExplicitWidth = 90
      end
    end
    object pnlConfirmar: TPanel
      AlignWithMargins = True
      Left = 606
      Top = 10
      Width = 100
      Height = 35
      Margins.Left = 10
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alRight
      BevelOuter = bvNone
      Color = 1014050
      ParentBackground = False
      TabOrder = 1
      ExplicitLeft = 628
      object btnConfirmar: TSpeedButton
        Left = 0
        Top = 0
        Width = 100
        Height = 35
        Margins.Left = 10
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alClient
        Caption = '&Confirmar'
        ImageIndex = 0
        ImageName = 'clientes'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Segoe UI Semibold'
        Font.Style = []
        Font.Quality = fqClearTypeNatural
        ParentFont = False
        OnClick = btnConfirmarClick
        ExplicitLeft = 942
        ExplicitTop = 10
        ExplicitWidth = 90
      end
    end
  end
  object ImageCollectionIcons: TImageCollection
    Images = <
      item
        Name = 'sair'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000097048597300000B1300000B1301009A9C18000002CE49444154789C
              ED99CD6A534114C77FC45868B3B16A04531F4177ADC97348D1AD42A92EC54D88
              1FD085DAAD1F555F40C1A2856A9FC38225606957455394D2622BA4A99B918123
              94E34C7A33999BDB607E3090DC9BF9CF99B977CE9C730203060C88410EA80077
              8105A00EEC00BFA5EDC8B5F7400D284B9FCCB900CC025F01D361B37D1E036359
              187E0678091C0418AE5B0B78019CEE95F1D780AD0886EB6635AFA669785E56DD
              67C04FE03530054C0045E0A4B4A25CB3F7DE00BB6D74E664ACA80C034B9E01BF
              00D7E5379DE8DD00563D9A1F3BD46B4BDE637C13B8DDE56AE5813BA2A5F53FC4
              7A12AF1CE2DF8071E23101341CE33C8FB161B5E83250223E25D1D6E34D76E32A
              B71C2B9F86F17FB19B7D4D8DF903182500ED719A915F1B1F171D7BE259C809DB
              522276C3F68A7B6AECFD4E9FFCACC35546F7CDC20CFF52706CEA472424E7886D
              AC9F4F0BE399C44D65C346D200B0E23861A31D2A0E8C671223C09EB2C5BADB23
              A9A94E363C4813D366126FD5FD6A12C105D5C9C62F6962DA4C625ADD7B9744B0
              1EF2D8BAC0B49944595D5F4922B8AD3A9D8D6050489B01CEA96BF6603D129DA4
              0C6534012319DBE1EFADFF6202DBFDFE0AD555A7CB64B7892B219BB8EFDD684D
              75B2396C9A188FF196F990834CFBDEDD8C428902F04BD9321E1ACCD9043C2D8C
              2798BB151ACCE1705FAB1984D39BCA86879D888E39121A5B3DE8150FBA4D6890
              72DF6191660FE222CB25474AF99448497DA30749FD7AACA41EA9556A3FBD2C03
              C5A6087C728C77A55BE13987E89A540F62BE36EB8E719EC410CF4BAD528B37A5
              7A603D462805E0BEA7B4B8089C2012C352AB74C52D0D49C06D0E9B9411F1F39B
              1ECDC5340ECFBCD42A7DD1E39EE4B0D3729A1725141F92A8B22C139D779CB046
              799C682BEF62523C8389DCBEC7D8B0491995729F3EEC42DABEACFA2932A02415
              B38D00C36D1F1B1E9CE718909353BA2A31FB8A647607D2ECE7CF72AF2ABF3D16
              7FB30E18409FF3071338315A57B65F6C0000000049454E44AE426082}
          end>
      end
      item
        Name = 'cancelar'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000097048597300000B1300000B1301009A9C180000030649444154789C
              ED99DF4B544114C73F6C9BB1FA9295426BFF41FAA6E9DF11D63ED44341648FD1
              CBB2FD807DA87CADB4FA07148C12ACFE8E844448EC494A4944C982552B3006CE
              C2E53073F7DED971AF0BFB8581E5DE39DFF9CECC9D33E79C850E3AE8200472C0
              18701F980796811DE08FB41D79F60EA800A36293392E0093C037E0306533364F
              81812C849F055E01071EC275DB075E02675A25BE046C0510AE9BE1BC7A94C2F3
              B2EA2E013F8119E0163002F40127A5F5C933F36E16D88DE19996B182A2007C74
              0CF805B8217DD2F0DD04561C9C1F52F2C522EF105F03EE36B95A79E09E7069FE
              F7A176E2B585FC3B304C388C00EB9671A6421C584DBA0814098FA270EBF1C69B
              71955B96953F0AF17598C3BEAAC6DC047AF180F638B598CFE6A207BFCB66D072
              265EF8DCB0FB8AC41C581BAAC05FF9DC92A2243655C7FB076AECBDB43B3F6971
              95368F508DF4493A89BAF8BA9D6D123D9643FD24A9F89C25B6317EDEB6D55121
              49265172D80C5AFA4EA87E6B4903C031CB0D5B4829A8D4645F836EE097EA6FDC
              6D43549491090FE29044585AF175CC299B320930AF8C4CFCD20871027DC51BDC
              56766F4980659F6D8B11EA2B1E497CA2B64B24C0B6323A4772D826E12BDEA05F
              D99B8BB5217492D2453A8C3B26F10FB89692EB94E2D86FC504AEC44CE07A2B26
              B0DDEE9FD0B232BA94E1211EF339C46DEF462BCA68B609F169FAD8F0C6E722D3
              BE7737A350A207F8ADFA0FFB067326016F753077C73798432A6651E3950CC2E9
              0DA5E13129306049684CF5A05509CDA366131AA4DC1725A9C5C4452153CA214B
              4AF93C5452BFDE82A4FE6BA8A41EA955EADB7451060A8D3EE09365BCCBCD124F
              5B48571D9EC31743969537ED5908F2BCD42A35794DAA07C663F8A20778E8282D
              2E0027088482D42A6D01DABA24E026874D8A6EF1F31B0ECE8590C5DDE84E4C39
              063C94047C4EE29751F9A6BBA4F5CBB309090FF40D7BA83C4EB09577252C9B31
              027CDB8F100736297AA5DCA72F3B9FB627AB7E9A0C50948AD99A87706363C283
              F31C03E4E4962E4BCCBE2499DD8134F3FBB3BC2B4BDF63F1376B071DD0E6F80F
              281C6606D5C884160000000049454E44AE426082}
          end>
      end
      item
        Name = 'confirmar'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000097048597300000B1300000B1301009A9C180000030A49444154789C
              ED994D6B534114861F6AACB4D9583582A9FFC0BA6B6D7F8754B370A350AA4B71
              13EA0774A176EB47D53F50C1A285AABFC382A160695745539462B115D25485C8
              C00984E3DCDC9B3B274985BC3090E4CEBCF3CEDC99F315E8A1871E2CD0074C00
              B781256015D8017E49DB91DFDE0033C0B88CE93ACE0273C067A0D66273631E02
              C3DD107E12780E1CA410AE5B1578069CE894F802B06D205C37C779B99DC233B2
              EB51027E000BC0143006E480A3D272F29B7BF612D86DC2332F73996200781F31
              E127E0AAF46985EF1AB016C1F9AE45BEA6C84488AF003703772B03DC122ECDFF
              D6EA4DBCF0907F0146B1C31850F6CCF3D4E2C26AD215208F3DF2C2ADE79B0C31
              95DB9E9D6F87F83ADC655F57737E038648016D712AC6C7260A239E3BF1248D87
              AD2A1277613B853B6AEEFD56DFFC9CC7549ADB66C139FE45D673A91F90107D9E
              D8C6D9F976A000FC06663DCFAE2B0D9B4903C0098F8735732A1EF135697A1183
              C09ED2E2CC6D2C66D4A0850E88AFC97777811BF14AF52926215F5283A63A24BE
              E0E93BADFABD4E32C16A9AD7D606F148E2D3D8B744027C57834ED11DF10EA73D
              21772C7492D24F382E79C4FF01AEC48C3BA6C654AD17E0B3E1163B1FB480A447
              6836819010F1A98F90BEC41722C4C7090A15EFF349250B333A92409885F8D466
              543B3297C36A34136825DE61318D23D3B67737229488126A253E0BFC545CA369
              8339978093701116E21D6EA40DE6908A59E3E0B526E174D42242C467812DC577
              BF1582614F42E3AA07245C448878877BA1090D52EE6B24A9C4C445F545848A3F
              EF49291F5B25F5E5989DA85BA190A47EC32AA9476A95FA6CAFC844D6C8011F3C
              F35D0C259EF790AE7B920F028FCD86679E4716E419A9556AF28A540F9CC5488B
              2C7037A2B4B80C1CC1080352ABF4D9FAB224E02E874D8A41B1F35B119CCBEDC8
              C33352AB8C725A7B92C34E8B37CF4928DE2F51E5B82C74D1E3616BCAE298EDBC
              0F9362196AC6EDABC5854D8A2129F7696797A6EDCBAE1FA70BC84BC56C338570
              37C68507673804E8132F5D9498BD2499DD8134F7F9A33C2B4ADF43F1376B0F3D
              F09FE32F3F89325D9F9680260000000049454E44AE426082}
          end>
      end>
    Left = 718
    Top = 144
  end
  object VirtualImageListIcons: TVirtualImageList
    Images = <
      item
        CollectionIndex = 0
        CollectionName = 'sair'
        Name = 'clientes'
      end
      item
        CollectionIndex = 1
        CollectionName = 'cancelar'
        Name = 'cancelar'
      end
      item
        CollectionIndex = 2
        CollectionName = 'confirmar'
        Name = 'confirmar'
      end>
    ImageCollection = ImageCollectionIcons
    Left = 718
    Top = 152
  end
  object dsPesquisa: TDataSource
    OnStateChange = dsPesquisaStateChange
    OnDataChange = dsPesquisaDataChange
    Left = 408
    Top = 296
  end
end
