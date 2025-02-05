-- ░██████╗░█████╗░██╗░░░██╗██████╗░███████╗░██████╗░█████╗░██████╗░██╗██████╗░████████╗░██████╗
-- ██╔════╝██╔══██╗██║░░░██║██╔══██╗██╔════╝██╔════╝██╔══██╗██╔══██╗██║██╔══██╗╚══██╔══╝██╔════╝
-- ╚█████╗░██║░░╚═╝██║░░░██║██████╦╝█████╗░░╚█████╗░██║░░╚═╝██████╔╝██║██████╔╝░░░██║░░░╚█████╗░
-- ░╚═══██╗██║░░██╗██║░░░██║██╔══██╗██╔══╝░░░╚═══██╗██║░░██╗██╔══██╗██║██╔═══╝░░░░██║░░░░╚═══██╗
-- ██████╔╝╚█████╔╝╚██████╔╝██████╦╝███████╗██████╔╝╚█████╔╝██║░░██║██║██║░░░░░░░░██║░░░██████╔╝
-- ╚═════╝░░╚════╝░░╚═════╝░╚═════╝░╚══════╝╚═════╝░░╚════╝░╚═╝░░╚═╝╚═╝╚═╝░░░░░░░░╚═╝░░░╚═════╝░   

Config = {}

Config.Locale = 'en'

--sc_phonetax
Config.PtAllow = true
Config.PtPrice = 25 --How much should it cost
Config.PtTime = 30 --Time between payments || Specified here in minutes
Config.PtChar = 'WEB_FRUIT' -- Find other Chars: https://wiki.rage.mp/index.php?title=Notification_Pictures
Config.PtName = 'DigitalDen'

Config.ItemsToCheck = {
    {name = "phone", minimumCount = 1},
    --{name = "newitem", minimumCount = 1},
    --{name = "newitem", minimumCount = 1},
}

--sc_cartax
Config.CtAllow = true
Config.CtPrice = 30 --How much should it cost
Config.CtTime = 15 --Time between payments || Specified here in minutes
Config.CtChar = 'CHAR_MP_MORS_MUTUAL' -- Find other Chars: https://wiki.rage.mp/index.php?title=Notification_Pictures
Config.CtName = 'MORS MUTUAL'

--[NEW] sc_playertax
Config.UtAllow = true
Config.UtTime = 25 --Time between payments || Specified here in minutes
Config.UtName = 'IRS'
Config.UtChar = 'CHAR_BLANK_ENTRY'

-- Bank Tax Brackets
Config.HoboClassLimit  =  2000
Config.PoorClassLimit  =  10000
Config.LowerClassLimit  =  20000
Config.LowerMiddleClassLimit = 50000
Config.MiddleClassLimit = 100000
Config.UpperMiddleClassLimit = 500000
Config.LowerHigherClassLimit =  1000000
Config.HigherClassLimit =  5000000

-- Bank Tax Deductions (Multiplier)
Config.HoboClassTax  =  0
Config.PoorClassTax  =  1
Config.LowerClassTax  =  2
Config.LowerMiddleClassTax = 2
Config.MiddleClassTax =  2
Config.UpperMiddleClassTax =  3
Config.LowerHigherClassTax = 3
Config.HigherClassTax =  3
Config.UpperHigherClassTax = 4

Config.Notify = {
    {name = "bulletin", enabled = false},
    {name = "default", enabled = false},
    {name = "ox_lib", enabled = true},
}

--Bulletin Config
Config.Delay = 5000 --How long should the notification be displayed || Default 5 seconds
Config.Position = 'bottomleft' -- "bottomleft", "topleft", "topright", "bottomright", "bottom", "top"
Config.Progress = true -- true/false
Config.exitAnim = 'fadeOut'
Config.Theme = 'default' -- Other Themes: (default, success, info, warning, error)

Translation = {
    ['de'] = {
        ['pttext'] = 'Du hast ~g~',
        ['pttext_2'] = '$ ~w~für deinen Handyvertrag bezahlt.',
        ['handy'] = 'Handyvertrag',
        ['pay_pttext'] = 'Gebüren bezahlt',
        ['cttext'] = 'Du hast ~r~',
        ['cttext1'] = '$ ~w~an deine ~o~KFZ-Versicherung ~w~gezahlt.',
        ['pay_cttext'] = 'Versicherung bezahlt',
        ['text'] = 'Du hast ~g~',
        ['text1'] = '$ ~w~an Steuern bezahlt.',
        ['pay_text'] = 'Steuern',
        ['er_player'] = '[ERROR] Spieler konnte nicht gefunden werden!',
        ['er_lp'] = '[ERROR] Fahrzeug ohne Kennzeichen gefunden!',
        ['er_ident'] = '[ERROR] Spieler hat keine gültige Identifier!',
        ['er_lpc'] = '[ERROR] Kein Kennzeichen übergeben!',
        ['cwp'] = 'Das Fahrzeug mit dem Kennzeichen ',
        ['cwp_1'] = ' wurde erfolgreich versichert.',
        ['er_ins'] = 'Das Fahrzeug konnte nicht versichert werden.',
        ['insc'] = 'Die Versicherung des Fahrzeugs mit dem Kennzeichen ',
        ['insc_1'] = ' wurde erfolgreich aufgehoben.',
        ['er_rins'] = 'Das Fahrzeug konnte nicht entversichert werden.',
        ['success'] = 'Erfolg',
        ['error'] = 'Fehler',
    },
    ['en'] = {
        ['pttext'] = 'You have paid ~g~',
        ['pttext_2'] = '$ ~w~for your phone contract.',
        ['handy'] = 'Phone contract',
        ['pay_pttext'] = 'Fees paid',
        ['cttext'] = 'You have paid ~r~',
        ['cttext1'] = '$ ~w~for your ~o~car insurance~w~.',
        ['pay_cttext'] = 'Insurance paid',
        ['text'] = 'You have paid ~g~',
        ['text1'] = '$ ~w~in taxes.',
        ['pay_text'] = 'Taxes',
        ['er_player'] = '[ERROR] Player could not be found!',
        ['er_lp'] = '[ERROR] Vehicle without license plate found!',
        ['er_ident'] = '[ERROR] Player has no valid identifier!',
        ['er_lpc'] = '[ERROR] No license plate provided!',
        ['cwp'] = 'The vehicle with the license plate ',
        ['cwp_1'] = ' has been successfully insured.',
        ['er_ins'] = 'The vehicle could not be insured.',
        ['insc'] = 'The insurance for the vehicle with the license plate ',
        ['insc_1'] = ' has been successfully canceled.',
        ['er_rins'] = 'The vehicle could not be uninsured.',
        ['success'] = 'Success',
        ['error'] = 'Error',
    },
    ['fr'] = {
        ['pttext'] = 'Vous avez payé ~g~',
        ['pttext_2'] = '$ ~w~pour votre contrat téléphonique.',
        ['handy'] = 'Contrat téléphonique',
        ['pay_pttext'] = 'Frais payés',
        ['cttext'] = 'Vous avez payé ~r~',
        ['cttext1'] = '$ ~w~pour votre ~o~assurance automobile~w~.',
        ['pay_cttext'] = 'Assurance payée',
        ['text'] = 'Vous avez payé ~g~',
        ['text1'] = '$ ~w~en taxes.',
        ['pay_text'] = 'Taxes',
        ['er_player'] = '[ERREUR] Le joueur n\'a pas pu être trouvé !',
        ['er_lp'] = '[ERREUR] Véhicule sans plaque d\'immatriculation trouvé !',
        ['er_ident'] = '[ERREUR] Le joueur n\'a pas d\'identifiant valide !',
        ['er_lpc'] = '[ERREUR] Aucune plaque d\'immatriculation fournie !',
        ['cwp'] = 'Le véhicule avec la plaque d\'immatriculation ',
        ['cwp_1'] = ' a été assuré avec succès.',
        ['er_ins'] = 'Le véhicule n\'a pas pu être assuré.',
        ['insc'] = 'L\'assurance du véhicule avec la plaque d\'immatriculation ',
        ['insc_1'] = ' a été annulée avec succès.',
        ['er_rins'] = 'Le véhicule n\'a pas pu être désassuré.',
        ['success'] = 'Succès',
        ['error'] = 'Erreur',
    },
    ['it'] = {
        ['pttext'] = 'Hai pagato ~g~',
        ['pttext_2'] = '$ ~w~per il tuo contratto telefonico.',
        ['handy'] = 'Contratto telefonico',
        ['pay_pttext'] = 'Tariffe pagate',
        ['cttext'] = 'Hai pagato ~r~',
        ['cttext1'] = '$ ~w~per la tua ~o~assicurazione auto~w~.',
        ['pay_cttext'] = 'Assicurazione pagata',
        ['text'] = 'Hai pagato ~g~',
        ['text1'] = '$ ~w~in tasse.',
        ['pay_text'] = 'Tasse',
        ['er_player'] = '[ERRORE] Giocatore non trovato!',
        ['er_lp'] = '[ERRORE] Veicolo senza targa trovato!',
        ['er_ident'] = '[ERRORE] Il giocatore non ha un identificatore valido!',
        ['er_lpc'] = '[ERRORE] Nessuna targa fornita!',
        ['cwp'] = 'Il veicolo con targa ',
        ['cwp_1'] = ' è stato assicurato con successo.',
        ['er_ins'] = 'Il veicolo non ha potuto essere assicurato.',
        ['insc'] = 'L\'assicurazione del veicolo con targa ',
        ['insc_1'] = ' è stata annullata con successo.',
        ['er_rins'] = 'Il veicolo non ha potuto essere disassicurato.',
        ['success'] = 'Successo',
        ['error'] = 'Errore',
    },
    ['dk'] = {
        ['pttext'] = 'Du har betalt ~g~',
        ['pttext_2'] = '$ ~w~for din telefonkontrakt.',
        ['handy'] = 'Telefonkontrakt',
        ['pay_pttext'] = 'Gebyrer betalt',
        ['cttext'] = 'Du har betalt ~r~',
        ['cttext1'] = '$ ~w~for din ~o~bilforsikring~w~.',
        ['pay_cttext'] = 'Forsikring betalt',
        ['text'] = 'Du har betalt ~g~',
        ['text1'] = '$ ~w~i skat.',
        ['pay_text'] = 'Skat',
        ['er_player'] = '[FEJL] Spilleren kunne ikke findes!',
        ['er_lp'] = '[FEJL] Køretøj uden nummerplade fundet!',
        ['er_ident'] = '[FEJL] Spilleren har ikke en gyldig identifikator!',
        ['er_lpc'] = '[FEJL] Ingen nummerplade angivet!',
        ['cwp'] = 'Køretøjet med nummerpladen ',
        ['cwp_1'] = ' er blevet forsikret.',
        ['er_ins'] = 'Køretøjet kunne ikke forsikres.',
        ['insc'] = 'Forsikringen for køretøjet med nummerpladen ',
        ['insc_1'] = ' er blevet annulleret.',
        ['er_rins'] = 'Køretøjet kunne ikke af-forsikres.',
        ['success'] = 'Succes',
        ['error'] = 'Fejl',
    },
    ['sv'] = {
        ['pttext'] = 'Du har betalat ~g~',
        ['pttext_2'] = '$ ~w~för ditt telefonabonnemang.',
        ['handy'] = 'Telefonabonnemang',
        ['pay_pttext'] = 'Avgifter betalda',
        ['cttext'] = 'Du har betalat ~r~',
        ['cttext1'] = '$ ~w~för din ~o~bilförsäkring~w~.',
        ['pay_cttext'] = 'Försäkring betalad',
        ['text'] = 'Du har betalat ~g~',
        ['text1'] = '$ ~w~i skatt.',
        ['pay_text'] = 'Skatt',
        ['er_player'] = '[FEL] Spelaren kunde inte hittas!',
        ['er_lp'] = '[FEL] Fordon utan registreringsskylt hittades!',
        ['er_ident'] = '[FEL] Spelaren har ingen giltig identifierare!',
        ['er_lpc'] = '[FEL] Ingen registreringsskylt angiven!',
        ['cwp'] = 'Fordonet med registreringsskylten ',
        ['cwp_1'] = ' har försäkrats.',
        ['er_ins'] = 'Fordonet kunde inte försäkras.',
        ['insc'] = 'Försäkringen för fordonet med registreringsskylten ',
        ['insc_1'] = ' har avbrutits.',
        ['er_rins'] = 'Fordonet kunde inte av-försäkras.',
        ['success'] = 'Framgång',
        ['error'] = 'Fel',
    },
    ['es'] = {
        ['pttext'] = 'Has pagado ~g~',
        ['pttext_2'] = '$ ~w~por tu contrato de teléfono.',
        ['handy'] = 'Contrato de teléfono',
        ['pay_pttext'] = 'Tarifas pagadas',
        ['cttext'] = 'Has pagado ~r~',
        ['cttext1'] = '$ ~w~por tu ~o~seguro de coche~w~.',
        ['pay_cttext'] = 'Seguro pagado',
        ['text'] = 'Has pagado ~g~',
        ['text1'] = '$ ~w~en impuestos.',
        ['pay_text'] = 'Impuestos',
        ['er_player'] = '[ERROR] ¡No se pudo encontrar al jugador!',
        ['er_lp'] = '[ERROR] ¡Vehículo sin matrícula encontrado!',
        ['er_ident'] = '[ERROR] ¡El jugador no tiene un identificador válido!',
        ['er_lpc'] = '[ERROR] ¡No se proporcionó ninguna matrícula!',
        ['cwp'] = 'El vehículo con la matrícula ',
        ['cwp_1'] = ' ha sido asegurado.',
        ['er_ins'] = 'El vehículo no pudo ser asegurado.',
        ['insc'] = 'El seguro del vehículo con la matrícula ',
        ['insc_1'] = ' ha sido cancelado.',
        ['er_rins'] = 'El vehículo no pudo ser desasegurado.',
        ['success'] = 'Éxito',
        ['error'] = 'Error',
    },
}

