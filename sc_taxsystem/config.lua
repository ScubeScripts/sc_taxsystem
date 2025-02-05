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
    },
    ['en'] = {
        ['pttext'] = 'You have paid ~g~',
        ['pttext_2'] = '$ ~w~for your cell phone contract.',
        ['handy'] = 'Mobile Phone Contract',
        ['pay_pttext'] = 'Fees paid',
        ['cttext'] = 'You have paid ~g~',
        ['cttext1'] = '$ ~w~to your car insurance.',
        ['pay_cttext'] = 'Insurance paid',
        ['text'] = 'You have paid ~g~',
        ['text1'] = '$ ~w~in taxes.',
        ['pay_text'] = 'taxes',
    },
    ['fr'] = {
        ['pttext'] = "Vous avez payé",
        ['pttext_2'] = "$ ~w~pour votre contrat de téléphone portable.",
        ['handy'] = "Contrat de téléphone portable",
        ['pay_pttext'] = "Frais payés",
        ['cttext'] = 'Tu as payé ~g~',
        ['cttext1'] = '$ ~w~à ton assurance auto.',
        ['pay_cttext'] = 'Assurance payée',
        ['text'] = 'Vous avez payé ~g~',
        ['text1'] = '$ ~w~en impôts.',
        ['pay_text'] = 'impôts',
    },
    ['it'] = {
        ['pttext'] = 'Hai pagato',
        ['pttext_2'] = '$ ~w~per il tuo contratto di telefonia mobile.',
        ['handy'] = 'Contratto di telefonia mobile',
        ['pay_pttext'] = 'Tariffe pagate',
        ['cttext'] = 'Hai pagato ~g~',
        ['cttext1'] = '$ ~w~alla tua assicurazione auto.',
        ['pay_cttext'] = 'Assicurazione pagata',
        ['text'] = 'Hai pagato ~g~',
        ['text1'] = '$ ~w~in tasse.',
        ['pay_text'] = 'tasse',
    },
    ['dk'] = {
        ['pttext'] = 'Du har betalt',
        ['pttext_2'] = '$ ~w~for din mobiltelefonkontrakt.',
        ['handy'] = 'Mobiltelefonkontrakt',
        ['pay_pttext'] = 'Gebyrer betalt',
        ['cttext'] = 'Du har betalt ~g~',
        ['cttext1'] = '$ ~w~til din bilforsikring.',
        ['pay_cttext'] = 'Forsikring betalt',
        ['text'] = 'Du har betalt ~g~',
        ['text1'] = '$ ~w~i skat.',
        ['pay_text'] = 'skat',
    },
    ['sv'] = {
        ['pttext'] = 'Du har betalat',
        ['pttext_2'] = '$ ~w~för ditt mobiltelefonavtal.',
        ['handy'] = 'Mobiltelefonavtal',
        ['pay_pttext'] = 'Avgifter betalda',
        ['cttext'] = 'Du har betalat ~g~',
        ['cttext1'] = '$ ~w~till din bilförsäkring.',
        ['pay_cttext'] = 'Försäkring betalad',
        ['text'] = 'Du har betalat ~g~',
        ['text1'] = '$ ~w~i skatt.',
        ['pay_text'] = 'skatt',
    },
    ['es'] = {
        ['pttext'] = 'Has pagado g',
        ['pttext_2'] = '$ wpor tu contrato de teléfono móvil.',
        ['handy'] = 'Contrato de teléfono móvil',
        ['pay_pttext'] = 'Pago de tarifas',
        ['cttext'] = 'Ha pagado ~g~',
        ['cttext1'] = '$ ~w~a tu seguro de coche.',
        ['pay_cttext'] = 'Seguro pagado',
        ['text'] = 'Has pagado ~g~',
        ['text1'] = '$ ~w~en impuestos.',
        ['pay_text'] = 'impuestos',
    },
}

