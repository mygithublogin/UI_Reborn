

local _G = getfenv(0)
local path = 'Interface\\AddOns\\UI_Reborn\\media\\'

UFP = "UnitFramePortrait_Update"; UICC = "Interface\\TargetingFrame\\UI-Classes-Circles"; CIT = CLASS_ICON_TCOORDS

hooksecurefunc(UFP,function(self) if self.portrait then local t = CIT[select(2,UnitClass(self.unit))] if t then self.portrait:SetTexture(UICC) self.portrait:SetTexCoord(unpack(t)) end end end)

hooksecurefunc('PetActionBar_Update', function()
    for _, name in pairs({
        'PetActionButton',
        'PossessButton',
        'ShapeshiftButton',

    }) do
        for i = 1, 12 do
            local button = _G[name..i]
            if (button and not isAlreadySkinned1) then
                button:SetNormalTexture(path..'overlay')

                local icon = _G[name..i..'Icon']
                icon:SetTexCoord(0.03, 0.97, 0.03, 0.97)
                icon:SetPoint('TOPRIGHT', button, 1, 1)
                icon:SetPoint('BOTTOMLEFT', button, -1, -1)
                
                local cooldown = _G[name..i..'Cooldown']
                cooldown:ClearAllPoints()
                cooldown:SetPoint('BOTTOMLEFT', icon, -1, -1)
                cooldown:SetPoint('TOPRIGHT', icon, 1, 1)
                
                local normal
                if (name == 'PetActionButton') then 
                    normal = _G[name..i..'NormalTexture2'] 
                else 
                    normal = _G[name..i..'NormalTexture'] 
                end
                normal:ClearAllPoints()
                normal:SetPoint('TOPRIGHT', button, 1, 1)
                normal:SetPoint('BOTTOMLEFT', button, -1, -1)
                normal:SetVertexColor(nMainbar.color.Normal[1], nMainbar.color.Normal[2], nMainbar.color.Normal[3], 1)

                
                local flash = _G[name..i..'Flash']
                flash:SetTexture(flashtex)
                
                local check = button:GetCheckedTexture()
                button:SetCheckedTexture(path..'checked')
                check:SetAllPoints(normal)
                check:SetDrawLayer('OVERLAY')
                
                local push = button:GetPushedTexture()
                button:SetPushedTexture(path..'pushed')
                push:SetAllPoints(normal)
                push:SetDrawLayer('OVERLAY')

                local hig = button:GetHighlightTexture()
                hig:SetAllPoints(normal)
                button:SetHighlightTexture(path..'highlight')
                
                local isAlreadySkinned1 = true
            end
        end
    end
end)

hooksecurefunc('ActionButton_Update', function(self)
    if (not isAlreadySkinned2) then
        local button = _G[self:GetName()]
        button:SetNormalTexture(path..'overlay')
        
        local normal = _G[self:GetName()..'NormalTexture']
        normal:ClearAllPoints()
        normal:SetPoint('TOPRIGHT', button, 1, 1)
        normal:SetPoint('BOTTOMLEFT', button, -1, -1)
        normal:SetVertexColor(nMainbar.color.Normal[1], nMainbar.color.Normal[2], nMainbar.color.Normal[3], 1)
        
        local icon = _G[self:GetName()..'Icon']
        icon:SetTexCoord(0.03, 0.97, 0.03, 0.97)
        
        local cooldown = _G[self:GetName()..'Cooldown']
        cooldown:ClearAllPoints()
        cooldown:SetPoint('TOPRIGHT', icon, -1.5, -1.5)
        cooldown:SetPoint('BOTTOMLEFT', icon, 1.5, 1.5)
        
        button:SetPushedTexture(path..'pushed')
        button:GetPushedTexture():SetAllPoints(normal)

        button:SetCheckedTexture(path..'checked')
        button:GetCheckedTexture():SetAllPoints(normal)
        
        button:SetHighlightTexture(path..'highlight')
        button:GetHighlightTexture():SetAllPoints(normal)

        local border = _G[self:GetName()..'Border']
        border:SetDrawLayer('OVERLAY')
        border:SetAllPoints(normal)
        border:SetTexture(path..'highlight')
        border:SetVertexColor(unpack(nMainbar.color.IsEquipped))
                
        local count = _G[self:GetName()..'Count']
        count:SetPoint('BOTTOMRIGHT', button, 0, 1)
        count:SetFont(nMainbar.button.countFont, nMainbar.button.countFontsize, 'OUTLINE')
        count:SetVertexColor(nMainbar.color.CountText[1], nMainbar.color.CountText[2], nMainbar.color.CountText[3], 1)

        local macroname = _G[self:GetName()..'Name']
        if (not nMainbar.button.showMacronames) then
            macroname:SetAlpha(0)
        else
            macroname:SetDrawLayer('OVERLAY')
            macroname:SetWidth(button:GetWidth() + 5)
            macroname:SetFont(nMainbar.button.macronameFont, nMainbar.button.macronameFontsize, 'OUTLINE')
            macroname:SetVertexColor(unpack(nMainbar.color.MacroText))
        end

        if (nMainbar.button.showButtonBackground ) then
            local back = _G[self:GetName()..'Background']
            local backtex = _G[self:GetName()..'BackgroundTexture']

            if (button and not back and not backtex) then
                local backgroundParent = CreateFrame('Frame', self:GetName()..'Background')
                backgroundParent:SetParent(button)
                backgroundParent:SetFrameLevel(0)
                     
                local background = backgroundParent:CreateTexture(self:GetName()..'BackgroundTexture')
                background:SetParent(backgroundParent)  
                background:SetTexture('Interface\\AddOns\\UI_Reborn\\media\\backdrop')
                background:SetPoint('TOPRIGHT', button, 2, 2)
                background:SetPoint('BOTTOMLEFT', button, -2, -2)
            end
        end
        local isAlreadySkinned2 = true
    end
    
    if (IsEquippedAction(self.action)) then
        _G[self:GetName()..'Border']:SetAlpha(1)
    else
        _G[self:GetName()..'Border']:SetAlpha(0)
    end 
end)     

hooksecurefunc('ActionButton_ShowGrid', function(self)
    _G[self:GetName()..'NormalTexture']:SetVertexColor(nMainbar.color.Normal[1], nMainbar.color.Normal[2], nMainbar.color.Normal[3], 1) 
    
    if (IsEquippedAction(self.action)) then
        _G[self:GetName()..'Border']:SetAlpha(1)
    else
        _G[self:GetName()..'Border']:SetAlpha(0)
    end
end)

hooksecurefunc('ActionButton_UpdateUsable', function(self)
    _G[self:GetName()..'NormalTexture']:SetVertexColor(nMainbar.color.Normal[1], nMainbar.color.Normal[2], nMainbar.color.Normal[3], 1) 
    
	local isUsable, notEnoughMana = IsUsableAction(self.action)
	if (isUsable) then
		_G[self:GetName()..'Icon']:SetVertexColor(1, 1, 1)
	elseif (notEnoughMana) then
		_G[self:GetName()..'Icon']:SetVertexColor(unpack(nMainbar.color.OutOfMana))
	else
		_G[self:GetName()..'Icon']:SetVertexColor(unpack(nMainbar.color.NotUsable))
	end
end)

hooksecurefunc('ActionButton_UpdateHotkeys', function(self)
    local hotkey = _G[self:GetName()..'HotKey']
    
    if (not nMainbar.button.showKeybinds) then
        hotkey:SetText(nMainbar.indicator.range)
        hotkey:Hide()
    end
    
    if (nMainbar.button.showKeybinds or nMainbar.button.OutOfRangeColoring == 'hotkey') then
        hotkey:SetFont(nMainbar.button.hotkeyFont, nMainbar.button.hotkeyFontsize, 'OUTLINE')
        hotkey:SetDrawLayer('OVERLAY')
        hotkey:ClearAllPoints()
        hotkey:SetPoint('TOPRIGHT', self, 0, -3)
        hotkey:SetVertexColor(nMainbar.color.HotKeyText[1], nMainbar.color.HotKeyText[2], nMainbar.color.HotKeyText[3])
    end
end)

-- --------------------------------------------------------------------
-- create a new original function, 
-- its easier and do use less cpu cycles than a hooksecuredfunc (!)
-- --------------------------------------------------------------------

function ActionButton_OnUpdate(self, elapsed)
	if (ActionButton_IsFlashing(self)) then

		local flashtime = self.flashtime
		flashtime = flashtime - elapsed
		
		if (flashtime <= 0) then
			local overtime = - flashtime
			if (overtime >= ATTACK_BUTTON_FLASH_TIME) then
				overtime = 0
			end
			flashtime = ATTACK_BUTTON_FLASH_TIME - overtime

			local flashTexture = _G[self:GetName()..'Flash']
			if (flashTexture:IsShown()) then
				flashTexture:Hide()
			else
				flashTexture:Show()
			end
		end
		
		self.flashtime = flashtime
	end

	local rangeTimer = self.rangeTimer
	if (rangeTimer) then
		rangeTimer = rangeTimer - elapsed
		if (rangeTimer <= 0) then
            
            if (nMainbar.button.OutOfRangeColoring == 'icon') then
                local isInRange = false
                if (ActionHasRange(self.action) and IsActionInRange(self.action) == 0) then
                    _G[self:GetName()..'Icon']:SetVertexColor(unpack(nMainbar.color.OutOfRange))
                    isInRange = true
                end
                    
                if (self.isInRange ~= isInRange) then
                    self.isInRange = isInRange
                    ActionButton_UpdateUsable(self)
                end
                rangeTimer = TOOLTIP_UPDATE_TIME
            end
            
            if (nMainbar.button.OutOfRangeColoring == 'hotkey') then
                local rangeTimer = self.rangeTimer;
                if (rangeTimer) then
                    rangeTimer = rangeTimer - elapsed;

                    if (rangeTimer <= 0) then
                        local hotkey = _G[self:GetName()..'HotKey']
                        local valid = IsActionInRange(self.action)
                        if (hotkey:GetText() == RANGE_INDICATOR or hotkey:GetText() == nMainbar.indicator.range) then
                            hotkey:SetText(nMainbar.indicator.range)
                            if (valid == 0) then
                                hotkey:Show()
                                hotkey:SetVertexColor(unpack(nMainbar.color.OutOfRange))
                            elseif (valid == 1) then
                                hotkey:Show()
                                hotkey:SetVertexColor(unpack(nMainbar.color.HotKeyText))
                            else
                                hotkey:Hide()
                            end
                        else
                            if (valid == 0) then
                                hotkey:SetVertexColor(unpack(nMainbar.color.OutOfRange))
                            else
                                hotkey:SetVertexColor(unpack(nMainbar.color.HotKeyText))
                            end
                        end
                        rangeTimer = TOOLTIP_UPDATE_TIME
                    end
                    
                    self.rangeTimer = rangeTimer
                end
            end
		end
		self.rangeTimer = rangeTimer
	end
end