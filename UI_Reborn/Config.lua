local DF = LibStub('AceAddon-3.0'):GetAddon('UI_Reborn')

local moduleOptions = {}
local options = {
    type = 'group',
    args = {
    }
}

function DF:SetupOptions()
    self.optFrames = {}
    LibStub('AceConfigRegistry-3.0'):RegisterOptionsTable('UI_Reborn', options)
    self.optFrames['UI_Reborn'] =
        LibStub('AceConfigDialog-3.0'):AddToBlizOptions('UI_Reborn', 'UI_Reborn')

    local profiles = LibStub('AceDBOptions-3.0'):GetOptionsTable(self.db)
    profiles.order = 999
    LibStub('AceConfig-3.0'):RegisterOptionsTable('UI_Reborn_Profiles', profiles)
    LibStub('AceConfigDialog-3.0'):AddToBlizOptions('UI_Reborn_Profiles', 'Profiles', 'UI_Reborn')
end

function DF:RegisterModuleOptions(name, options)
    --self:Print('RegisterModuleOptions()', name, options)
    moduleOptions[name] = options
    -- function AceConfigDialog:AddToBlizOptions(appName, name, parent, ...)
    LibStub('AceConfigRegistry-3.0'):RegisterOptionsTable('UI_Reborn_' .. name, options)

    self.optFrames[name] =
        LibStub('AceConfigDialog-3.0'):AddToBlizOptions('UI_Reborn_' .. name, name, 'UI_Reborn')
end

function DF:RegisterSlashCommands()
    self:RegisterChatCommand('iu', 'SlashCommand')
    self:RegisterChatCommand('improvedui', 'SlashCommand')
end

function DF:SlashCommand(msg)
    --self:Print('Slash: ' .. msg)
    InterfaceOptionsFrame_OpenToCategory('UI_Reborn')
    InterfaceOptionsFrame_OpenToCategory('UI_Reborn')
end
