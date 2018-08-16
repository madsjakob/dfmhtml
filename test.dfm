object soAftale: TsoAftale
  Left = 0
  Top = 0
  Width = 1008
  Height = 668
  TabOrder = 0
  OnResize = soCustomFrameResize
  object lblMessage: TLabel
    Left = 0
    Top = 0
    Width = 1008
    Height = 13
    Align = alTop
    Alignment = taCenter
    AutoSize = False
    Caption = '???'
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Microsoft Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Layout = tlCenter
    Visible = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 13
    Width = 1008
    Height = 26
    Align = alTop
    BevelOuter = bvNone
    Caption = ' '
    TabOrder = 0
    object ToolBar1: TToolBar
      Left = 0
      Top = 0
      Width = 1008
      Height = 26
      Align = alClient
      AutoSize = True
      ButtonWidth = 159
      Caption = 'ToolBar1'
      DisabledImages = ImageList1
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      Images = ImageList1
      List = True
      ShowCaptions = True
      TabOrder = 0
      object btnVisKort: TToolButton
        Left = 0
        Top = 0
        AutoSize = True
        Caption = 'Kort'
        ImageIndex = 26
        OnClick = btnVisKortClick
      end
      object ToolButton1: TToolButton
        Left = 50
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 49
        Style = tbsSeparator
      end
      object btnVisRuteplan: TToolButton
        Left = 58
        Top = 0
        AutoSize = True
        Caption = 'Ruteplan'
        ImageIndex = 51
        OnClick = btnVisRuteplanClick
      end
      object ToolButton2: TToolButton
        Left = 132
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 49
        Style = tbsSeparator
      end
      object btnValidereKrakAdr: TToolButton
        Left = 140
        Top = 0
        AutoSize = True
        Caption = 'K&rakvalider'
        ImageIndex = 53
        OnClick = btnValidereKrakAdrClick
      end
      object ToolButton3: TToolButton
        Left = 224
        Top = 0
        Width = 8
        Caption = 'ToolButton3'
        ImageIndex = 49
        Style = tbsSeparator
      end
      object btnGentag: TToolButton
        Left = 232
        Top = 0
        AutoSize = True
        Caption = 'Gentag'
        ImageIndex = 50
        OnClick = btnGentagClick
      end
      object ToolButton4: TToolButton
        Left = 298
        Top = 0
        Width = 8
        Caption = 'ToolButton4'
        ImageIndex = 0
        Style = tbsSeparator
      end
      object tlbMail: TToolButton
        Left = 306
        Top = 0
        AutoSize = True
        Caption = 'Send bekr�ftelse til m�gler'
        OnClick = tlbMailClick
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 39
    Width = 1008
    Height = 290
    Align = alTop
    BevelOuter = bvNone
    Caption = ' '
    TabOrder = 1
    object pnlLeft: TPanel
      Left = 0
      Top = 0
      Width = 473
      Height = 290
      Align = alLeft
      BevelOuter = bvNone
      Caption = ' '
      TabOrder = 0
      object GroupBox2: TGroupBox
        Left = 0
        Top = 0
        Width = 473
        Height = 173
        Align = alTop
        Caption = ' Generelt '
        TabOrder = 0
        object lblType: TLabel
          Left = 8
          Top = 24
          Width = 24
          Height = 13
          Caption = 'Type'
        end
        object lblEmne: TLabel
          Left = 8
          Top = 48
          Width = 27
          Height = 13
          Caption = 'Emne'
        end
        object lbMaegler: TLabel
          Left = 8
          Top = 71
          Width = 36
          Height = 13
          Caption = 'M�gler'
        end
        object lblSagProjektsalg: TLabel
          Left = 8
          Top = 95
          Width = 19
          Height = 13
          Caption = 'Sag'
        end
        object btnSagFjern: TSpeedButton
          Left = 403
          Top = 92
          Width = 21
          Height = 21
          Anchors = [akTop, akRight]
          Flat = True
          OnClick = btnSagFjernClick
        end
        object btnSagVis: TSpeedButton
          Left = 426
          Top = 92
          Width = 41
          Height = 21
          Anchors = [akTop, akRight]
          Caption = '�bn'
          Flat = True
          OnClick = btnSagVisClick
        end
        object lblSaelgerT: TLabel
          Left = 96
          Top = 120
          Width = 369
          Height = 27
          AutoSize = False
          Caption = 'lblSaelgerT'
        end
        object lblSaelgerC: TLabel
          Left = 8
          Top = 120
          Width = 53
          Height = 13
          Caption = 'lblSaelgerC'
        end
        object lblTilmeldPaakraevet: TLabel
          Left = 420
          Top = 20
          Width = 47
          Height = 26
          Anchors = [akTop, akRight]
          Caption = 'Tilmelding p�kr�vet'
          WordWrap = True
        end
        object lblNoeglenrC: TLabel
          Left = 8
          Top = 152
          Width = 60
          Height = 13
          Caption = 'lblNoeglenrC'
        end
        object lblNoeglenrT: TLabel
          Left = 96
          Top = 152
          Width = 60
          Height = 13
          Caption = 'lblNoeglenrT'
        end
        object cmbType: TComboBox
          Left = 96
          Top = 20
          Width = 305
          Height = 21
          Style = csDropDownList
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 13
          TabOrder = 0
          OnChange = OnChange
          OnClick = cmbTypeClick
          OnEnter = cmbTypeEnter
        end
        object edtEmne: TTypeEdit
          Left = 96
          Top = 44
          Width = 305
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Color = clWhite
          EditStyle = esTekst
          LookupButton = False
          MaxLength = 255
          ReadOnly = False
          TabOrder = 1
          OnChange = OnChange
          OnExit = OnExit
        end
        object edtMaegler: TTypeEdit
          Left = 96
          Top = 68
          Width = 305
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          EditStyle = esTekst
          LookupButton = True
          MaxLength = 11
          ReadOnly = True
          TabOrder = 2
          TabStop = True
          OnLookup = edtMaeglerLookup
        end
        object edtSag: TTypeEdit
          Left = 96
          Top = 92
          Width = 305
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          EditStyle = esTekst
          LookupButton = True
          MaxLength = 11
          ReadOnly = True
          TabOrder = 3
          TabStop = True
          OnLookup = edtSagLookup
        end
        object chkTilmeldPaakraevet: TCheckBox
          Left = 403
          Top = 22
          Width = 15
          Height = 17
          Anchors = [akTop, akRight]
          Caption = ' '
          TabOrder = 4
          OnClick = OnChange
          OnExit = OnExit
        end
      end
      object GroupBox3: TGroupBox
        Left = 0
        Top = 173
        Width = 473
        Height = 117
        Align = alClient
        Caption = ' Tid '
        TabOrder = 1
        object lblGentagAftale: TLabel
          Left = 8
          Top = 92
          Width = 72
          Height = 13
          Caption = 'lblGentagAftale'
        end
        object Label1: TLabel
          Left = 227
          Top = 21
          Width = 11
          Height = 13
          Caption = 'kl.'
        end
        object Label6: TLabel
          Left = 227
          Top = 45
          Width = 11
          Height = 13
          Caption = 'kl.'
        end
        object lblStart: TLabel
          Left = 8
          Top = 21
          Width = 22
          Height = 13
          Caption = 'Start'
        end
        object lblSlut: TLabel
          Left = 8
          Top = 45
          Width = 18
          Height = 13
          Caption = 'Slut'
        end
        object imgAftaleSlut: TImage
          Left = 200
          Top = 43
          Width = 16
          Height = 16
          Transparent = True
          OnClick = imgAftaleSlutClick
        end
        object imgAftaleStart: TImage
          Left = 200
          Top = 19
          Width = 16
          Height = 16
          Transparent = True
          OnClick = imgAftaleStartClick
        end
        object Label7: TLabel
          Left = 200
          Top = 69
          Width = 19
          Height = 13
          Caption = 'min.'
        end
        object edtStartTid: TTypeEdit
          Left = 242
          Top = 17
          Width = 65
          Height = 21
          Color = clWhite
          EditStyle = esTid
          LookupButton = False
          MaxLength = 255
          ReadOnly = False
          TabOrder = 1
          TabStop = True
          OnChange = OnChange
          OnExit = OnExit
        end
        object edtSlutTid: TTypeEdit
          Left = 242
          Top = 41
          Width = 65
          Height = 21
          Color = clWhite
          EditStyle = esTid
          LookupButton = False
          MaxLength = 255
          ReadOnly = False
          TabOrder = 3
          TabStop = True
          OnChange = OnChange
          OnExit = OnExit
        end
        object chkHeleDagen: TCheckBox
          Left = 317
          Top = 43
          Width = 77
          Height = 17
          Caption = 'Hele dagen'
          TabOrder = 5
          OnClick = chkHeleDagenClick
        end
        object edtStartDato: TTypeEdit
          Left = 96
          Top = 17
          Width = 100
          Height = 21
          Color = clWhite
          EditStyle = esDato
          LookupButton = False
          MaxLength = 255
          ReadOnly = False
          TabOrder = 0
          TabStop = True
          OnChange = OnChange
          OnExit = OnExit
        end
        object edtSlutDato: TTypeEdit
          Left = 96
          Top = 41
          Width = 100
          Height = 21
          Color = clWhite
          EditStyle = esDato
          LookupButton = False
          MaxLength = 255
          ReadOnly = False
          TabOrder = 2
          TabStop = True
          OnChange = OnChange
          OnExit = OnExit
        end
        object chkIkkeBekraeftet: TCheckBox
          Left = 317
          Top = 19
          Width = 91
          Height = 17
          Caption = 'Ikke bekr�ftet'
          Enabled = False
          TabOrder = 4
          OnClick = chkIkkeBekraeftetClick
        end
        object cbxAktiverPaamindelse: TCheckBox
          Left = 6
          Top = 67
          Width = 103
          Height = 17
          Alignment = taLeftJustify
          Caption = 'P�mindelse'
          TabOrder = 6
          OnClick = cbxAktiverPaamindelseClick
        end
        object edtPaamindelseTid: TTypeEdit
          Left = 115
          Top = 65
          Width = 81
          Height = 21
          Color = clWhite
          EditStyle = esHeltal
          LookupButton = False
          MaxLength = 255
          ReadOnly = False
          TabOrder = 7
          TabStop = True
          OnChange = OnChange
          OnExit = OnExit
        end
        object btnKoerselstidspunkt: TButton
          Left = 242
          Top = 64
          Width = 65
          Height = 22
          Caption = 'K�rselstid'
          TabOrder = 8
          OnClick = btnKoerselstidspunktClick
        end
        object chkMedIKoersel: TCheckBox
          Left = 317
          Top = 67
          Width = 103
          Height = 17
          Caption = 'K�rselsregnskab'
          TabOrder = 9
          OnClick = chkMedIKoerselClick
        end
      end
    end
    object Panel3: TPanel
      Left = 473
      Top = 0
      Width = 535
      Height = 290
      Align = alClient
      BevelOuter = bvNone
      Caption = ' '
      TabOrder = 1
      object GroupBox4: TGroupBox
        Left = 0
        Top = 173
        Width = 535
        Height = 117
        Align = alClient
        Caption = ' Noter '
        TabOrder = 0
        object memBeskrivelse: TMemo
          Left = 2
          Top = 15
          Width = 531
          Height = 100
          Align = alClient
          ScrollBars = ssVertical
          TabOrder = 0
          OnChange = OnChange
          OnExit = OnExit
        end
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 535
        Height = 173
        Align = alTop
        Caption = ' Adresse '
        TabOrder = 1
        object Label2: TLabel
          Left = 6
          Top = 46
          Width = 39
          Height = 13
          Caption = 'Vejnavn'
        end
        object Label3: TLabel
          Left = 6
          Top = 117
          Width = 58
          Height = 13
          Caption = 'Postnummer'
        end
        object Label4: TLabel
          Left = 189
          Top = 117
          Width = 32
          Height = 13
          Caption = 'Distrikt'
        end
        object Label27: TLabel
          Left = 6
          Top = 68
          Width = 56
          Height = 13
          Caption = 'Husnummer'
        end
        object Label28: TLabel
          Left = 165
          Top = 68
          Width = 39
          Height = 13
          Caption = 'Bogstav'
        end
        object LblEtage: TLabel
          Left = 284
          Top = 68
          Width = 28
          Height = 13
          Caption = 'Etage'
        end
        object LblSide: TLabel
          Left = 390
          Top = 68
          Width = 21
          Height = 13
          Caption = 'Side'
        end
        object Label5: TLabel
          Left = 6
          Top = 92
          Width = 46
          Height = 13
          Caption = 'Stednavn'
        end
        object Label9: TLabel
          Left = 8
          Top = 142
          Width = 68
          Height = 13
          Caption = 'Sted (Outlook)'
        end
        object Label10: TLabel
          Left = 8
          Top = 18
          Width = 50
          Height = 13
          Caption = 'Overf�r fra'
        end
        object sdeEjdNr: TTypeEdit
          Left = 96
          Top = 65
          Width = 57
          Height = 21
          Cursor = crIBeam
          Color = clWhite
          EditStyle = esTekst
          LookupButton = False
          MaxLength = 6
          ReadOnly = False
          TabOrder = 1
          TabStop = True
          OnChange = OnChange
          OnExit = OnExit
        end
        object sdeEjdBogstav: TTypeEdit
          Left = 208
          Top = 65
          Width = 65
          Height = 21
          Cursor = crIBeam
          Color = clWhite
          EditStyle = esTekst
          LookupButton = False
          MaxLength = 2
          ReadOnly = False
          TabOrder = 2
          TabStop = True
          OnChange = OnChange
          OnExit = OnExit
        end
        object sdeEjdEtage: TTypeEdit
          Left = 317
          Top = 65
          Width = 65
          Height = 21
          Cursor = crIBeam
          Color = clWhite
          EditStyle = esTekst
          LookupButton = False
          MaxLength = 4
          ReadOnly = False
          TabOrder = 3
          TabStop = True
          OnChange = OnChange
          OnExit = OnExit
        end
        object sdeEjdSide: TTypeEdit
          Left = 416
          Top = 65
          Width = 111
          Height = 21
          Cursor = crIBeam
          Anchors = [akLeft, akTop, akRight]
          Color = clWhite
          EditStyle = esTekst
          LookupButton = False
          MaxLength = 6
          ReadOnly = False
          TabOrder = 4
          TabStop = True
          OnChange = OnChange
          OnExit = OnExit
        end
        object sdeEjdStednavn: TTypeEdit
          Left = 96
          Top = 89
          Width = 431
          Height = 21
          Cursor = crIBeam
          Anchors = [akLeft, akTop, akRight]
          Color = clWhite
          EditStyle = esTekst
          LookupButton = False
          MaxLength = 255
          ReadOnly = False
          TabOrder = 5
          TabStop = True
          OnChange = OnChange
          OnExit = OnExit
        end
        object tedPostnummer: TTypeEdit
          Left = 96
          Top = 113
          Width = 85
          Height = 21
          Color = clWhite
          EditStyle = esTekst
          LookupButton = True
          MaxLength = 4
          ReadOnly = False
          TabOrder = 6
          TabStop = True
          OnChange = OnChange
          OnExit = tedPostnummerExit
          OnLookup = tedPostnummerLookup
        end
        object tedPostdistrikt: TTypeEdit
          Left = 224
          Top = 113
          Width = 304
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Color = clWhite
          EditStyle = esTekst
          LookupButton = True
          MaxLength = 255
          ReadOnly = False
          TabOrder = 7
          TabStop = True
          OnChange = OnChange
          OnExit = tedPostnummerExit
          OnLookup = tedPostnummerLookup
        end
        object edtVejnavn: TEdit
          Left = 96
          Top = 42
          Width = 431
          Height = 21
          Cursor = crIBeam
          Anchors = [akLeft, akTop, akRight]
          MaxLength = 34
          TabOrder = 0
          OnChange = OnChange
          OnExit = OnExit
        end
        object edtSted: TTypeEdit
          Left = 152
          Top = 138
          Width = 373
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Color = clWhite
          EditStyle = esTekst
          LookupButton = False
          MaxLength = 255
          ReadOnly = False
          TabOrder = 8
          TabStop = True
          OnChange = OnChange
          OnExit = OnExit
        end
        object ToolBar2: TToolBar
          Left = 96
          Top = 15
          Width = 350
          Height = 27
          Align = alNone
          ButtonWidth = 74
          Caption = 'ToolBar2'
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          Images = ImageList1
          List = True
          ShowCaptions = True
          TabOrder = 9
          object spbOvfSag: TToolButton
            Left = 0
            Top = 0
            Caption = 'Sag'
            ImageIndex = 9
            OnClick = spbOvfSagClick
          end
          object spbOvfDeltager: TToolButton
            Left = 74
            Top = 0
            Caption = 'Deltager'
            ImageIndex = 14
            OnClick = spbOvfDeltagerClick
          end
          object spbOvfForretning: TToolButton
            Left = 148
            Top = 0
            Caption = 'Forretning'
            ImageIndex = 60
            OnClick = spbOvfForretningClick
          end
          object spbProjektsalgSager: TToolButton
            Left = 222
            Top = 0
            Caption = 'Sager'
            ImageIndex = 9
            OnClick = spbProjektsalgSagerClick
          end
        end
        object chkStedManuelt: TCheckBox
          Left = 96
          Top = 137
          Width = 46
          Height = 22
          BiDiMode = bdLeftToRight
          Caption = 'Afvig'
          ParentBiDiMode = False
          TabOrder = 10
          OnClick = chkStedManueltClick
        end
      end
    end
  end
  object pnlDeltagere: TGroupBox
    Left = 0
    Top = 329
    Width = 1008
    Height = 339
    Align = alClient
    Caption = ' Deltagere '
    TabOrder = 2
  end
  object ImageList1: TImageList
    Left = 416
    Top = 167
  end
end
