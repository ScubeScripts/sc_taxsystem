--░██████╗░█████╗░██╗░░░██╗██████╗░███████╗░██████╗░█████╗░██████╗░██╗██████╗░████████╗░██████╗░░░░░░██████╗░███████╗████████╗░█████╗░
--██╔════╝██╔══██╗██║░░░██║██╔══██╗██╔════╝██╔════╝██╔══██╗██╔══██╗██║██╔══██╗╚══██╔══╝██╔════╝░░░░░░██╔══██╗██╔════╝╚══██╔══╝██╔══██╗
--╚█████╗░██║░░╚═╝██║░░░██║██████╦╝█████╗░░╚█████╗░██║░░╚═╝██████╔╝██║██████╔╝░░░██║░░░╚█████╗░█████╗██████╦╝█████╗░░░░░██║░░░███████║
--░╚═══██╗██║░░██╗██║░░░██║██╔══██╗██╔══╝░░░╚═══██╗██║░░██╗██╔══██╗██║██╔═══╝░░░░██║░░░░╚═══██╗╚════╝██╔══██╗██╔══╝░░░░░██║░░░██╔══██║
--██████╔╝╚█████╔╝╚██████╔╝██████╦╝███████╗██████╔╝╚█████╔╝██║░░██║██║██║░░░░░░░░██║░░░██████╔╝░░░░░░██████╦╝███████╗░░░██║░░░██║░░██║
--╚═════╝░░╚════╝░░╚═════╝░╚═════╝░╚══════╝╚═════╝░░╚════╝░╚═╝░░╚═╝╚═╝╚═╝░░░░░░░░╚═╝░░░╚═════╝░░░░░░░╚═════╝░╚══════╝░░░╚═╝░░░╚═╝░░╚═╝

Config = {}

Config.Locale = 'en' -- de, fr, en, it, dk, sv and es

-- Payment-System
Config.Society = 'society_police' -- All funds go to society_yoursociety
Config.useBilling = false -- true = players receive an invoice || false = players pay automatically, if not enough money in the bank, then invoice

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
Config.Marker = vector3(-836.8, -273.36, 39.0)

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

Translation = {
    ['de'] = {
        ['pttext'] = 'Du hast ',
        ['pttext_2'] = '$ für deinen Handyvertrag bezahlt.',
        ['handy'] = 'Handyvertrag',
        ['pay_pttext'] = 'Gebüren bezahlt',
        ['cttext'] = 'Du hast ',
        ['cttext1'] = '$ an deine KFZ-Versicherung gezahlt.',
        ['pay_cttext'] = 'Versicherung bezahlt',
        ['text'] = 'Du hast ',
        ['text1'] = '$ an Steuern bezahlt.',
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
        ['ct_open'] = 'Drücke ~INPUT_CONTEXT~ um das Menü zu öffnen.',
        ['ct_insur'] = 'Versicherte Fahrzeuge',
        ['ct_noveh'] = 'Keine Fahrzeuge',
        ['ct_novehl'] = 'Es sind keine Fahrzeuge vorhanden.',
        ['ct_novehi'] = 'Es gibt keine Fahrzeuge, die versichert werden können.',
        ['ct_novehui'] = 'Es gibt keine Fahrzeuge, wo die Versicherung aufgehoben werden kann.',
        ['ct_insurc'] = 'Fahrzeug versichern',
        ['ct_plate'] = 'Kennzeichen',
        ['ct_revinsur'] = 'Versicherung Aufheben',
        ['ct_payment'] = 'Du hast eine Rechnung erhalten.',
        ['ct_pay'] = 'Rechnung bezahlt',
        ['ct_litepay'] = 'Restliche Kosten bezahlt',
    },
    ['en'] = {
        ['pttext'] = 'You have paid ',
        ['pttext_2'] = '$ for your mobile contract.',
        ['handy'] = 'Mobile Contract',
        ['pay_pttext'] = 'Fees paid',
        ['cttext'] = 'You have paid ',
        ['cttext1'] = '$ to your car insurance .',
        ['pay_cttext'] = 'Insurance paid',
        ['text'] = 'You have paid ',
        ['text1'] = '$ in taxes.',
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
        ['ct_open'] = 'Press ~INPUT_CONTEXT~ to open the menu.',
        ['ct_insur'] = 'Insured Vehicles',
        ['ct_noveh'] = 'No Vehicles',
        ['ct_novehl'] = 'There are no vehicles available.',
        ['ct_novehi'] = 'There are no vehicles that can be insured.',
        ['ct_novehui'] = 'There are no vehicles where the insurance can be canceled.',
        ['ct_insurc'] = 'Insure Vehicle',
        ['ct_plate'] = 'License Plate',
        ['ct_revinsur'] = 'Cancel Insurance',
        ['ct_payment'] = 'You have received a bill.',
        ['ct_pay'] = 'Bill paid',
        ['ct_litepay'] = 'Remaining costs paid',
    },
    ['fr'] = {
        ['pttext'] = 'Vous avez payé ',
        ['pttext_2'] = '$ pour votre contrat mobile.',
        ['handy'] = 'Contrat Mobile',
        ['pay_pttext'] = 'Frais payés',
        ['cttext'] = 'Vous avez payé ',
        ['cttext1'] = '$ à votre assurance automobile .',
        ['pay_cttext'] = 'Assurance payée',
        ['text'] = 'Vous avez payé ',
        ['text1'] = '$ en taxes.',
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
        ['ct_open'] = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu.',
        ['ct_insur'] = 'Véhicules Assurés',
        ['ct_noveh'] = 'Aucun Véhicule',
        ['ct_novehl'] = 'Il n\'y a aucun véhicule disponible.',
        ['ct_novehi'] = 'Il n\'y a aucun véhicule qui peut être assuré.',
        ['ct_novehui'] = 'Il n\'y a aucun véhicule dont l\'assurance peut être annulée.',
        ['ct_insurc'] = 'Assurer un Véhicule',
        ['ct_plate'] = 'Plaque d\'Immatriculation',
        ['ct_revinsur'] = 'Annuler l\'Assurance',
        ['ct_payment'] = 'Vous avez reçu une facture.',
        ['ct_pay'] = 'Facture payée',
        ['ct_litepay'] = 'Coûts restants payés',
    },
    ['it'] = {
        ['pttext'] = 'Hai pagato ',
        ['pttext_2'] = '$ per il tuo contratto mobile.',
        ['handy'] = 'Contratto Mobile',
        ['pay_pttext'] = 'Tariffe pagate',
        ['cttext'] = 'Hai pagato ',
        ['cttext1'] = '$ alla tua assicurazione auto .',
        ['pay_cttext'] = 'Assicurazione pagata',
        ['text'] = 'Hai pagato ',
        ['text1'] = '$ in tasse.',
        ['pay_text'] = 'Tasse',
        ['er_player'] = '[ERRORE] Giocatore non trovato!',
        ['er_lp'] = '[ERRORE] Veicolo senza targa trovato!',
        ['er_ident'] = '[ERRORE] Il giocatore non ha un identificatore valido!',
        ['er_lpc'] = '[ERRORE] Nessuna targa fornita!',
        ['cwp'] = 'Il veicolo con targa ',
        ['cwp_1'] = ' è stato assicurato con successo.',
        ['er_ins'] = 'Il veicolo non può essere assicurato.',
        ['insc'] = 'L\'assicurazione per il veicolo con targa ',
        ['insc_1'] = ' è stata annullata con successo.',
        ['er_rins'] = 'Il veicolo non può essere disassicurato.',
        ['success'] = 'Successo',
        ['error'] = 'Errore',
        ['ct_open'] = 'Premi ~INPUT_CONTEXT~ per aprire il menu.',
        ['ct_insur'] = 'Veicoli Assicurati',
        ['ct_noveh'] = 'Nessun Veicolo',
        ['ct_novehl'] = 'Non ci sono veicoli disponibili.',
        ['ct_novehi'] = 'Non ci sono veicoli che possono essere assicurati.',
        ['ct_novehui'] = 'Non ci sono veicoli la cui assicurazione può essere annullata.',
        ['ct_insurc'] = 'Assicura Veicolo',
        ['ct_plate'] = 'Targa',
        ['ct_revinsur'] = 'Annulla Assicurazione',
        ['ct_payment'] = 'Hai ricevuto una fattura.',
        ['ct_pay'] = 'Fattura pagata',
        ['ct_litepay'] = 'Costi rimanenti pagati',
    },
    ['dk'] = {
        ['pttext'] = 'Du har betalt ',
        ['pttext_2'] = '$ for din mobilaftale.',
        ['handy'] = 'Mobilaftale',
        ['pay_pttext'] = 'Gebyrer betalt',
        ['cttext'] = 'Du har betalt ',
        ['cttext1'] = '$ til din bilforsikring .',
        ['pay_cttext'] = 'Forsikring betalt',
        ['text'] = 'Du har betalt ',
        ['text1'] = '$ i skat.',
        ['pay_text'] = 'Skat',
        ['er_player'] = '[FEJL] Spilleren kunne ikke findes!',
        ['er_lp'] = '[FEJL] Køretøj uden nummerplade fundet!',
        ['er_ident'] = '[FEJL] Spilleren har ingen gyldig identifikator!',
        ['er_lpc'] = '[FEJL] Ingen nummerplade angivet!',
        ['cwp'] = 'Køretøjet med nummerpladen ',
        ['cwp_1'] = ' er blevet forsikret.',
        ['er_ins'] = 'Køretøjet kunne ikke forsikres.',
        ['insc'] = 'Forsikringen for køretøjet med nummerpladen ',
        ['insc_1'] = ' er blevet annulleret.',
        ['er_rins'] = 'Køretøjet kunne ikke af-forsikres.',
        ['success'] = 'Succes',
        ['error'] = 'Fejl',
        ['ct_open'] = 'Tryk ~INPUT_CONTEXT~ for at åbne menuen.',
        ['ct_insur'] = 'Forsikrede Køretøjer',
        ['ct_noveh'] = 'Ingen Køretøjer',
        ['ct_novehl'] = 'Der er ingen køretøjer tilgængelige.',
        ['ct_novehi'] = 'Der er ingen køretøjer, der kan forsikres.',
        ['ct_novehui'] = 'Der er ingen køretøjer, hvis forsikring kan annulleres.',
        ['ct_insurc'] = 'Forsikr Køretøj',
        ['ct_plate'] = 'Nummerplade',
        ['ct_revinsur'] = 'Annuller Forsikring',
        ['ct_payment'] = 'Du har modtaget en regning.',
        ['ct_pay'] = 'Regning betalt',
        ['ct_litepay'] = 'Resterende omkostninger betalt',
    },
    ['sv'] = {
        ['pttext'] = 'Du har betalat ',
        ['pttext_2'] = '$ för ditt mobilabonnemang.',
        ['handy'] = 'Mobilabonnemang',
        ['pay_pttext'] = 'Avgifter betalda',
        ['cttext'] = 'Du har betalat ',
        ['cttext1'] = '$ till din bilförsäkring .',
        ['pay_cttext'] = 'Försäkring betalad',
        ['text'] = 'Du har betalat ',
        ['text1'] = '$ i skatt.',
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
        ['er_rins'] = 'Fordonet kunde inte avförsäkras.',
        ['success'] = 'Framgång',
        ['error'] = 'Fel',
        ['ct_open'] = 'Tryck ~INPUT_CONTEXT~ för att öppna menyn.',
        ['ct_insur'] = 'Försäkrade Fordon',
        ['ct_noveh'] = 'Inga Fordon',
        ['ct_novehl'] = 'Det finns inga fordon tillgängliga.',
        ['ct_novehi'] = 'Det finns inga fordon som kan försäkras.',
        ['ct_novehui'] = 'Det finns inga fordon vars försäkring kan avbrytas.',
        ['ct_insurc'] = 'Försäkra Fordon',
        ['ct_plate'] = 'Registreringsskylt',
        ['ct_revinsur'] = 'Avbryt Försäkring',
        ['ct_payment'] = 'Du har fått en räkning.',
        ['ct_pay'] = 'Räkning betalad',
        ['ct_litepay'] = 'Återstående kostnader betalda',
    },
    ['es'] = {
        ['pttext'] = 'Has pagado ',
        ['pttext_2'] = '$ por tu contrato de móvil.',
        ['handy'] = 'Contrato de Móvil',
        ['pay_pttext'] = 'Tarifas pagadas',
        ['cttext'] = 'Has pagado ',
        ['cttext1'] = '$ a tu seguro de coche .',
        ['pay_cttext'] = 'Seguro pagado',
        ['text'] = 'Has pagado ',
        ['text1'] = '$ en impuestos.',
        ['pay_text'] = 'Impuestos',
        ['er_player'] = '[ERROR] ¡No se pudo encontrar al jugador!',
        ['er_lp'] = '[ERROR] ¡Vehículo sin matrícula encontrado!',
        ['er_ident'] = '[ERROR] ¡El jugador no tiene un identificador válido!',
        ['er_lpc'] = '[ERROR] ¡No se proporcionó ninguna matrícula!',
        ['cwp'] = 'El vehículo con la matrícula ',
        ['cwp_1'] = ' ha sido asegurado con éxito.',
        ['er_ins'] = 'No se pudo asegurar el vehículo.',
        ['insc'] = 'El seguro del vehículo con la matrícula ',
        ['insc_1'] = ' ha sido cancelado con éxito.',
        ['er_rins'] = 'No se pudo desasegurar el vehículo.',
        ['success'] = 'Éxito',
        ['error'] = 'Error',
        ['ct_open'] = 'Presiona ~INPUT_CONTEXT~ para abrir el menú.',
        ['ct_insur'] = 'Vehículos Asegurados',
        ['ct_noveh'] = 'Sin Vehículos',
        ['ct_novehl'] = 'No hay vehículos disponibles.',
        ['ct_novehi'] = 'No hay vehículos que puedan ser asegurados.',
        ['ct_novehui'] = 'No hay vehículos cuyo seguro pueda ser cancelado.',
        ['ct_insurc'] = 'Asegurar Vehículo',
        ['ct_plate'] = 'Matrícula',
        ['ct_revinsur'] = 'Cancelar Seguro',
        ['ct_payment'] = 'Has recibido una factura.',
        ['ct_pay'] = 'Factura pagada',
        ['ct_litepay'] = 'Costos restantes pagados',
    },
}

