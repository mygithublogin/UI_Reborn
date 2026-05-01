

nMainbar = {
    indicator = { 
        range = 'R',             -- you can set everything as range indicator, but only shown if you use 'hotkey' as OutOfRangeColoring :)  -- \226\128\162 
    },
    
    button = { 
        showKeybinds            = true,
        showMacronames          = false, 
        showButtonBackground    = true,     -- a background for every button, if you want to see empty buttons too
        OutOfRangeColoring      = 'icon',   -- you can use:
                                            -- 'icon'
                                            -- 'hotkey' (will show the range indicator instead of the hotkey if ['Keybind = false'] )
                                            -- false (no range indicator)
                                        
        countFontsize           = 10,
        countFont               = 'Fonts\\FRIZQT__.TTF',
        
        macronameFontsize       = 18,
        macronameFont           = 'Fonts\\FRIZQT__.TTF',
        
        hotkeyFontsize          = 10,
        hotkeyFont              = 'Fonts\\FRIZQT__.TTF',
    },
        
    color = {           -- Red, Green, Blue
        Normal      =   { 1, 1, 1 },                                                                                                                                                                                                     
        IsEquipped  =   { 0, 1, 0 },
        
        OutOfRange  =   { 0.9, 0, 0 },
        OutOfMana   =   { 0.3, 0.3, 1 },
        
        NotUsable   =   { 0.35, 0.35, 0.34 },
        
        HotKeyText  =   { 1, 1, 1 },
        MacroText   =   { 1, 1, 1 },
        CountText   =   { 1, 1, 1 },
    },

    expBar = {
        mouseover = true,
        fontsize = 14,
        font = 'Fonts\\ARIALN.ttf',
    },
    
    repBar = {
        mouseover = true,
        fontsize = 14,
        font = 'Fonts\\ARIALN.ttf',
    },
    
    MainMenuBar = {
        scale = 1,
        hideGryphons = false,
        shortBar = true,
    },
    
    vehicle = {
        scale               = 0.8,
    },
    
    petbar = {
        mouseover           = false,
        scale               = 0.8,
        alpha               = 1,
    },
    
    possessbar = {
        scale               = 1,
        alpha               = 1,
    },
    
    stanceBar = {
        mouseover           = false,
        hide                = false,
        scale               = 1,
        alpha               = 1,
    },
    
    multiBarLeft = {
        mouseover           = false,
        alpha               = 1,
    },
    
    multiBarRight = {
        mouseover           = false,
        alpha               = 1,
    },
    
    multiBarBottomLeft = {
        mouseover           = false,
        alpha               = 1,
    },
    
    multiBarBottomRight = {
        mouseover           = false,
        alpha               = 1,
    },
    
    totemManager = {
        scale               = 0.8,
        alpha               = 1,
        hideRecallButton    = false,
    },
}
