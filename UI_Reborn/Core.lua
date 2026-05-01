local DF = LibStub('AceAddon-3.0'):NewAddon('UI_Reborn', 'AceConsole-3.0')
local db
local defaults = {
    profile = {
        modules = {['Actionbar'] = true, ['Castbar'] = true, ['Chat'] = false, ['Minimap'] = true, ['Unitframe'] = true},
        bestnumber = 42
    }
}

function DF:OnInitialize()
    -- Called when the addon is loaded
    self.db = LibStub('AceDB-3.0'):New('UI_Reborn_DB', defaults, true)
    db = self.db.profile
    self:SetupOptions()
    self:RegisterSlashCommands()
end

function DF:OnEnable()
    -- Called when the addon is enabled
    self.Wrath(self)
end

function DF:OnDisable()
    -- Called when the addon is disabled
end

function DF:GetModuleEnabled(module)
    return db.modules[module]
end

function DF:SetModuleEnabled(module, value)
    local old = db.modules[module]
    db.modules[module] = value
    if old ~= value then
        if value then
            self:EnableModule(module)
        else
            self:DisableModule(module)
        end
    end
end

local name, realm = UnitName('player')

function DF:Debug(m, value)
end

function DF:GetClassColor(class, alpha)
    local r, g, b, hex = GetClassColor(class)
    if alpha then
        return r, g, b, alpha
    else
        return r, g, b, 1
    end
end

--=============================================================================
-- FIX FOR DISAPPEARING ACTION BARS (Sirus / 3.3.5)
--=============================================================================
local fixFrame = CreateFrame("Frame")
function DF:OnEvent(event, ...)
    if event == "PLAYER_ENTERING_WORLD" then
        -- Force update UI frame positions
        if UIParent_ManageFramePositions then
            UIParent_ManageFramePositions()
        end
        
        -- Force MainMenuBar to show if it got hidden by a loading screen/vehicle exit
        if MainMenuBar and not MainMenuBar:IsShown() then
            MainMenuBar:Show()
        end
        
        -- Optional: Ensure custom multi-bars retain their alpha
        if MultiBarBottomLeft then MultiBarBottomLeft:SetAlpha(1) end
        if MultiBarBottomRight then MultiBarBottomRight:SetAlpha(1) end
    end
end
fixFrame:SetScript("OnEvent", function(self, event, ...) DF:OnEvent(event, ...) end)

function DF:Wrath()
    fixFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
end
