object soDigitalSigneringOrdre: TsoDigitalSigneringOrdre
  Left = 0
  Top = 0
  Width = 900
  Height = 600
  Constraints.MinHeight = 516
  Constraints.MinWidth = 900
  TabOrder = 0
  object gbStatus: TGroupBox
    Left = 0
    Top = 0
    Width = 900
    Height = 81
    Align = alTop
    Caption = 'Status'
    TabOrder = 0
    object lblCreated: TLabel
      Left = 16
      Top = 32
      Width = 47
      Height = 13
      Caption = 'lblCreated'
    end
    object lblDeadline: TLabel
      Left = 208
      Top = 32
      Width = 52
      Height = 13
      Caption = 'lblDeadline'
    end
    object lblOprettetAf: TLabel
      Left = 440
      Top = 32
      Width = 58
      Height = 13
      Caption = 'lblOprettetAf'
    end
    object lblStatus: TLabel
      Left = 640
      Top = 32
      Width = 40
      Height = 13
      Caption = 'lblStatus'
    end
  end
  object gbAnnulleret: TGroupBox
    Left = 0
    Top = 81
    Width = 900
    Height = 96
    Align = alTop
    Caption = 'Annulleret'
    TabOrder = 1
    object lblAnnulleretAf: TLabel
      Left = 16
      Top = 24
      Width = 67
      Height = 13
      Caption = 'lblAnnulleretAf'
    end
    object memAnnulleretBesked: TMemo
      Left = 208
      Top = 15
      Width = 685
      Height = 71
      Anchors = [akLeft, akTop, akRight, akBottom]
      Color = clMenu
      Lines.Strings = (
        'memAnnulleretBesked')
      ReadOnly = True
      TabOrder = 0
    end
  end
  object uclSigneringsRunder: TUserControlList
    Left = 0
    Top = 177
    Width = 900
    Height = 423
    Align = alClient
    ShowFocusRect = False
    TabOrder = 2
  end
end
