object soOenske: TsoOenske
  Left = 0
  Top = 0
  Width = 997
  Height = 587
  TabOrder = 0
  OnResize = soCustomFrameResize
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 505
    Height = 587
    Align = alLeft
    BevelOuter = bvNone
    Caption = ' '
    TabOrder = 0
    object pnlNavnKat: TPanel
      Left = 0
      Top = 0
      Width = 505
      Height = 34
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object lblNavn: TLabel
        Left = 8
        Top = 12
        Width = 26
        Height = 13
        Caption = 'Navn'
      end
      object Label2: TLabel
        Left = 422
        Top = 12
        Width = 11
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'ID'
      end
      object edtNavn: TTypeEdit
        Left = 40
        Top = 9
        Width = 313
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Color = clWhite
        EditStyle = esTekst
        LookupButton = False
        MaxLength = 50
        ReadOnly = False
        TabOrder = 0
        TabStop = True
        OnChange = onChange
        OnExit = onExit
      end
      object edtOenskeLoebeNr: TTypeEdit
        Left = 437
        Top = 9
        Width = 67
        Height = 21
        Anchors = [akTop, akRight]
        EditStyle = esTekst
        LookupButton = False
        MaxLength = 255
        ReadOnly = True
        TabOrder = 1
      end
    end
    object grbEjendomstyper: TGroupBox
      Left = 0
      Top = 34
      Width = 505
      Height = 143
      Align = alTop
      Caption = ' Ejendomstyper '
      TabOrder = 1
    end
    object gbxKriterier: TGroupBox
      Left = 0
      Top = 177
      Width = 505
      Height = 274
      Align = alClient
      Caption = ' Søgekriterier '
      TabOrder = 2
      object pnlAnnoncetype: TPanel
        Left = 2
        Top = 15
        Width = 501
        Height = 30
        Align = alTop
        BevelOuter = bvNone
        Caption = ' '
        TabOrder = 0
        Visible = False
        OnResize = pnlAnnoncetypeResize
        object lblAnnoncetype: TLabel
          Left = 8
          Top = 8
          Width = 63
          Height = 13
          Caption = 'Annoncetype'
        end
        object cmbAnnoncetype: TComboBox
          Left = 106
          Top = 4
          Width = 391
          Height = 21
          Style = csDropDownList
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 13
          TabOrder = 0
          OnChange = cmbAnnoncetypeChange
          OnExit = onExit
          Items.Strings = (
            'Kun salgsemner'
            'Kun udlejningsemner')
        end
      end
      object Panel2: TPanel
        Left = 2
        Top = 242
        Width = 501
        Height = 30
        Align = alBottom
        BevelOuter = bvNone
        Caption = ' '
        TabOrder = 1
      end
      object Panel3: TPanel
        Left = 2
        Top = 45
        Width = 501
        Height = 197
        Align = alClient
        BevelOuter = bvNone
        Caption = ' '
        TabOrder = 2
        object pnlLeje: TPanel
          Left = 0
          Top = 0
          Width = 501
          Height = 27
          Align = alTop
          BevelOuter = bvNone
          Caption = ' '
          TabOrder = 0
          OnResize = pnlLejeResize
          object Panel12: TPanel
            Left = 0
            Top = 0
            Width = 104
            Height = 27
            Align = alLeft
            BevelOuter = bvNone
            BorderWidth = 2
            Caption = ' '
            TabOrder = 0
            object lblLeje: TLabel
              Left = 8
              Top = 6
              Width = 70
              Height = 13
              Caption = 'Leje pr. måned'
            end
          end
          object pnlLejeInterval: TPanel
            Left = 104
            Top = 0
            Width = 397
            Height = 27
            Align = alClient
            BevelOuter = bvNone
            BorderWidth = 2
            TabOrder = 1
            object lblLejeInterval: TLabel
              Left = 112
              Top = 3
              Width = 9
              Height = 13
              Caption = ' - '
            end
            object edtLejeIntervalFra: TTypeEdit
              Left = 2
              Top = 2
              Width = 105
              Height = 23
              Color = clWhite
              EditStyle = esKroner
              LookupButton = False
              MaxLength = 255
              ReadOnly = False
              TabOrder = 0
              TabStop = True
              OnChange = onChange
              OnExit = onExit
            end
            object edtLejeIntervalTil: TTypeEdit
              Left = 290
              Top = 2
              Width = 105
              Height = 23
              Color = clWhite
              EditStyle = esKroner
              LookupButton = False
              MaxLength = 255
              ReadOnly = False
              TabOrder = 1
              TabStop = True
              OnChange = onChange
              OnExit = onExit
            end
          end
        end
        object pnlPris: TPanel
          Left = 0
          Top = 27
          Width = 501
          Height = 27
          Align = alTop
          BevelOuter = bvNone
          Caption = ' '
          TabOrder = 1
          OnResize = pnlPrisResize
          object Panel9: TPanel
            Left = 0
            Top = 0
            Width = 104
            Height = 27
            Align = alLeft
            BevelOuter = bvNone
            BorderWidth = 2
            Caption = ' '
            TabOrder = 0
            object lblCaption: TLabel
              Left = 8
              Top = 6
              Width = 17
              Height = 13
              Caption = 'Pris'
            end
          end
          object pnlPrisInterval: TPanel
            Left = 104
            Top = 0
            Width = 397
            Height = 27
            Align = alClient
            BevelOuter = bvNone
            BorderWidth = 2
            TabOrder = 1
            object lblPrisinterval: TLabel
              Left = 112
              Top = 3
              Width = 9
              Height = 13
              Caption = ' - '
            end
            object edtPrisIntervalFra: TTypeEdit
              Left = 2
              Top = 2
              Width = 105
              Height = 23
              Color = clWhite
              EditStyle = esKroner
              LookupButton = False
              MaxLength = 255
              ReadOnly = False
              TabOrder = 0
              TabStop = True
              OnChange = onChange
              OnExit = onExit
            end
            object edtPrisIntervalTil: TTypeEdit
              Left = 290
              Top = 2
              Width = 105
              Height = 23
              Color = clWhite
              EditStyle = esKroner
              LookupButton = False
              MaxLength = 255
              ReadOnly = False
              TabOrder = 1
              TabStop = True
              OnChange = onChange
              OnExit = onExit
            end
          end
        end
        object UserControlList1: TUserControlList
          Left = 0
          Top = 54
          Width = 501
          Height = 143
          HorzScrollBar.Smooth = True
          HorzScrollBar.Tracking = True
          VertScrollBar.Smooth = True
          VertScrollBar.Tracking = True
          Align = alClient
          ShowFocusRect = False
          TabOrder = 2
        end
      end
    end
    object gbxPostnummer: TGroupBox
      Left = 0
      Top = 451
      Width = 505
      Height = 90
      Align = alBottom
      Caption = ' Postnummer '
      TabOrder = 3
      object lblPostnummerBeskrivelse: TLabel
        Left = 8
        Top = 69
        Width = 156
        Height = 13
        Caption = 'Skriv fx. "2100,4000-4200,3600"'
      end
      object lblPostnummerInterval: TLabel
        Left = 8
        Top = 23
        Width = 70
        Height = 13
        Caption = 'Postnr. interval'
      end
      object edtPostnummerInterval: TMemo
        Left = 88
        Top = 20
        Width = 313
        Height = 45
        Anchors = [akLeft, akTop, akRight]
        Color = clWhite
        MaxLength = 255
        TabOrder = 0
        OnChange = onChange
        OnExit = onExit
      end
      object btnPostnrValider: TButton
        Left = 407
        Top = 20
        Width = 90
        Height = 21
        Anchors = [akTop, akRight]
        Caption = 'Valider'
        TabOrder = 1
        OnClick = btnPostnrValiderClick
      end
    end
    object grbSenesteKontakt: TGroupBox
      Left = 0
      Top = 541
      Width = 505
      Height = 46
      Align = alBottom
      TabOrder = 4
      object Label1: TLabel
        Left = 8
        Top = 20
        Width = 131
        Height = 13
        Caption = 'Guldkøber senest kontaktet'
      end
      object edtSenesteKontakt: TTypeEdit
        Left = 154
        Top = 16
        Width = 126
        Height = 21
        Color = clWhite
        EditStyle = esDato
        LookupButton = False
        MaxLength = 255
        ReadOnly = False
        TabOrder = 0
        OnChange = onChange
        OnExit = onExit
      end
    end
  end
  object Panel4: TPanel
    Left = 509
    Top = 0
    Width = 488
    Height = 587
    Align = alClient
    BevelOuter = bvNone
    Caption = ' '
    TabOrder = 1
    object Panel7: TPanel
      Left = 0
      Top = 552
      Width = 488
      Height = 35
      Align = alBottom
      BevelOuter = bvNone
      Caption = ' '
      TabOrder = 3
      object btnKoeberSogerSager: TButton
        Left = 382
        Top = 5
        Width = 100
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Find sager'
        TabOrder = 0
        OnClick = btnKoeberSogerSagerClick
      end
      object pnlSendBekraeft: TPanel
        Left = 0
        Top = 0
        Width = 113
        Height = 35
        Align = alLeft
        BevelOuter = bvNone
        Caption = ' '
        TabOrder = 1
        object btnSendBekraeft: TButton
          Left = 0
          Top = 5
          Width = 105
          Height = 25
          Caption = 'Send bekræftelse'
          TabOrder = 0
          OnClick = btnSendBekraeftClick
        end
      end
    end
    object GroupBox3: TGroupBox
      Left = 0
      Top = 161
      Width = 488
      Height = 129
      Align = alClient
      Caption = ' Intern bemærkning '
      TabOrder = 0
      object membemaerkning: TMemo
        Left = 2
        Top = 15
        Width = 484
        Height = 112
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 0
        OnChange = membemaerkningChange
      end
    end
    object GroupBox4: TGroupBox
      Left = 0
      Top = 418
      Width = 488
      Height = 134
      Align = alBottom
      Caption = ' Opfølgning / sletning '
      TabOrder = 2
      object Panel6: TPanel
        Left = 2
        Top = 15
        Width = 484
        Height = 64
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 8
        Caption = ' '
        TabOrder = 0
        object Label6: TLabel
          Left = 8
          Top = 32
          Width = 468
          Height = 13
          Align = alTop
          Caption = 
            'Ønsket deltager i Find købere på sager, så længe Aktivt er marke' +
            'ret.'
          WordWrap = True
        end
        object lblDanboligTxt: TLabel
          Left = 8
          Top = 48
          Width = 67
          Height = 13
          Caption = 'lblDanboligTxt'
        end
        object lblSysOpretRediger: TLabel
          Left = 8
          Top = 68
          Width = 90
          Height = 13
          Caption = 'lblSysOpretRediger'
        end
        object lblHjemOpretRediger: TLabel
          Left = 8
          Top = 88
          Width = 97
          Height = 13
          Caption = 'lblHjemOpretRediger'
        end
        object Panel8: TPanel
          Left = 8
          Top = 8
          Width = 468
          Height = 24
          Align = alTop
          BevelOuter = bvNone
          Caption = ' '
          TabOrder = 0
          object rdbUdfoert: TRadioButton
            Left = 240
            Top = 0
            Width = 113
            Height = 17
            Caption = 'Udført'
            TabOrder = 0
            OnClick = rdbUdfoertClick
          end
        end
        object rdbAktiv: TRadioButton
          Left = 8
          Top = 8
          Width = 113
          Height = 17
          Caption = 'Aktivt'
          TabOrder = 1
          OnClick = rdbAktivClick
        end
        object rdbInaktiv: TRadioButton
          Left = 128
          Top = 8
          Width = 113
          Height = 17
          Caption = 'Ikke aktiveret'
          TabOrder = 2
          OnClick = rdbInaktivClick
        end
      end
      object uclAktiviteter: TUserControlList
        Left = 2
        Top = 79
        Width = 484
        Height = 53
        Align = alBottom
        ShowFocusRect = False
        TabOrder = 1
      end
    end
    object UserControlList2: TUserControlList
      Left = 0
      Top = 0
      Width = 488
      Height = 161
      Align = alTop
      ShowFocusRect = False
      TabOrder = 4
    end
    object gbxInternBemaerkning: TGroupBox
      Left = 0
      Top = 290
      Width = 488
      Height = 64
      Align = alBottom
      Caption = ' Offentlig bemærkning '
      TabOrder = 1
      object memOffentligbemaerkning: TMemo
        Left = 2
        Top = 15
        Width = 484
        Height = 47
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 0
        OnChange = memOffentligbemaerkningChange
      end
    end
    object gbxEksternBemaerkning: TGroupBox
      Left = 0
      Top = 354
      Width = 488
      Height = 64
      Align = alBottom
      Caption = ' Tekst fra kundeprofil '
      TabOrder = 5
      object memEksternBemaerkning: TMemo
        Left = 2
        Top = 15
        Width = 484
        Height = 47
        TabStop = False
        Align = alClient
        Color = clBtnFace
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
        OnChange = membemaerkningChange
      end
    end
  end
  object Panel5: TPanel
    Left = 505
    Top = 0
    Width = 4
    Height = 587
    Align = alLeft
    BevelOuter = bvNone
    Caption = ' '
    TabOrder = 2
  end
end
