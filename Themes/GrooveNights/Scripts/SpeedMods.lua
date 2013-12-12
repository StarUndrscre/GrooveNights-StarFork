--[[
Simple SpeedMods API for 3.95/OpenITG, version 1.0
Licensed under Creative Commons Attribution-Share Alike 3.0 Unported
(http://creativecommons.org/licenses/by-sa/3.0/)

Globally callable functions to set up multi-line speed mods and access the
currently applied speed modifier.

Written by Cameron Ball for OpenITG (http://www.boxorroxors.net/)
All I ask is that you keep this notice intact and don't redistribute in bytecode.
--]]


-- This is purely for convenience
local ProfileTable

-- Without this check, when StepMania starts it will report a lua runtime error as PROFILEMAN apparently doesn't exist yet.
if PROFILEMAN ~= nil then
    ProfileTable = PROFILEMAN:GetMachineProfile():GetSaved()
end

-- Valid speed mod row type names.
local Names = { "Basic", "Advanced", "Pro" }

function SpeedModTypeRow()
        local type = GetSpeedModRowType()

        local function Load(self, list, pn)
                -- what we're doing here is checking what we got from profileman against the valid names.
                for i=1,3 do
                        if type == string.lower(Names[i]) then list[i] = true return end
                end

                -- if nothing matched then just default to pro
                list[3] = true
        end

        local function Save(self, list, pn)
                -- go through each item in the list and save the first one that is set to true
                for i=1,3 do
                        if list[i] then
                                ProfileTable.SpeedModType = string.lower(Names[i])
                                PROFILEMAN:SaveMachineProfile()
                                return
                        end
                end
        end

        local Params = { Name = "SpeedModType" }

        return CreateOptionRow( Params, Names, Load, Save )
end

function GetSpeedModRowType()
        local type = ProfileTable.SpeedModType

        -- as soon as we find a valid name, return it.
        for i=1,3 do
            if type == string.lower(Names[i]) then return type end
        end

        -- no pref, default to the first name in the list.
        return string.lower(Names[1])
end

function GetRateMods()
    return { "1.0x", "1.1x", "1.2x", "1.3x", "1.4x", "1.5x", "1.6x", "1.7x", "2.0x"}
end

function GetBaseSpeeds()
    if GetSpeedModRowType() == "pro" then
        return { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16" }
    end
        
    if GetSpeedModRowType() == "advanced" then
        if OPENITG then return { "0.25x", "0.5x", "0.75x", "1x", "1.25x", "1.5x", "1.75x", "2x", "2.25x", "2.5x", "2.75x", "3x", "3.25x", "3.5x", "3.75x", "4x", "4.25x", "4.5x", "4.75x", "5x", "5.25x", "5.5x", "5.75x", "6x", "6.25x", "6.5x", "6.75x", "7x", "c400", "c425", "c450", "c475", "c500", "c525", "c550", "c575", "c600", "c625", "c650", "c675", "c700", "c725", "c750", "c775", "c800", "c825", "c850", "c875", "c900", "c925", "c950", "c975", "c1000", "m400", "m425", "m450", "m475", "m500", "m525", "m550", "m575", "m600", "m625", "m650", "m675", "m700", "m725", "m750", "m775", "m800", "m825", "m850", "m875", "m900", "m925", "m950", "m975", "m1000" }
        else return { "0.25x", "0.5x", "0.75x", "1x", "1.25x", "1.5x", "1.75x", "2x", "2.25x", "2.5x", "2.75x", "3x", "3.25x", "3.5x", "3.75x", "4x", "4.25x", "4.5x", "4.75x", "5x", "5.25x", "5.5x", "5.75x", "6x", "6.25x", "6.5x", "6.75x", "7x", "c400", "c425", "c450", "c475", "c500", "c525", "c550", "c575", "c600", "c625", "c650", "c675", "c700", "c725", "c750", "c775", "c800", "c825", "c850", "c875", "c900", "c925", "c950", "c975", "c1000" }
        end
    end

    if GetSpeedModRowType() == "basic" then
        if OPENITG then return { "1x", "1.5x", "2x", "2.5x", "3x", "3.5x", "4x", "4.5x", "5x", "6x", "c450", "m450" }
        else return { "1x", "1.5x", "2x", "2.5x", "3x", "3.5x", "4x", "4.5x", "5x", "5.5x", "6x", "c450" }
        end
    end
end   

function GetExtraSpeeds()
    if GetSpeedModRowType() == "pro" then 
        return { "0", "+0.25", "+0.5", "+0.75", "+0.1", "+0.2", "+0.3", "+0.4", "+0.6", "+0.7", "+0.8", "+0.9" }
    end

    if GetSpeedModRowType() == "advanced" then
        return { "0" }
    end

    if GetSpeedModRowType() == "basic" then
        return { "0" }
    end
end

function GetSpeedModTypes() 
    if OPENITG then
        return { "x-mod", "c-mod", "m-mod" }
    else
        return { "x-mod", "c-mod" }
    end
end

function GetRateMod()
    local RateMods = GetRateMods()
    for n = 1, table.getn(RateMods) do
        if GAMESTATE:PlayerIsUsingModifier(0, RateMods[n] .. 'music') or GAMESTATE:PlayerIsUsingModifier(1, RateMods[n] .. 'music') then
            return RateMods[n]
        end
    end

    return nil
end

function RateMods()
    local modList = GetRateMods();

    local function Load(self, list, pn)
        for n = 1, table.getn(modList) do
            if GAMESTATE:PlayerIsUsingModifier(pn,modList[n]..'music') then list[n] = true else list[n] = false end
        end
    end

    local function Save(self, list, pn)
        for n = 1, table.getn(modList) do
            if list[n] then
                GAMESTATE:ApplyGameCommand('mod,'..modList[n]..'music',pn)
                MESSAGEMAN:Broadcast('RateModChanged')
            end
        end
    end

    local Params = { Name = "Rate" }
    return CreateOptionRow( Params, modList, Load, Save )
end

function GetSpeedMod(pn)
	local BaseSpeeds = GetBaseSpeeds()
	local ExtraSpeeds = GetExtraSpeeds()
	local SpeedModRowType = GetSpeedModRowType()
	for n = 1, table.getn(BaseSpeeds) do
		if SpeedModRowType == "basic" or SpeedModRowType == "advanced" then
			if GAMESTATE:PlayerIsUsingModifier(pn, BaseSpeeds[n]) then return BaseSpeeds[n] end
		end

		if SpeedModRowType == "pro" then
			for m = 1, table.getn(ExtraSpeeds) do
				local CombinedSpeeds = BaseSpeeds[n] + string.gsub(ExtraSpeeds[m], 'x', '') --combines the speeds in to things like 4.50

				--check x-mods
				if GAMESTATE:PlayerIsUsingModifier(pn, CombinedSpeeds .. 'x') then return CombinedSpeeds .. 'x' end
	
				--check c-mods
				if GAMESTATE:PlayerIsUsingModifier(pn, 'c' .. CombinedSpeeds*100) then return 'c' .. CombinedSpeeds*100 end
				
				--check m-mods (for some reason m0 is always applied so it has to be skipped)
				if GAMESTATE:PlayerIsUsingModifier(pn, 'm' .. CombinedSpeeds*100) and CombinedSpeeds ~= 0 then return 'm' .. CombinedSpeeds*100 end
			end
		end
	end
	
	-- If we get here, chances are that m0 was applied.
	return "m0"
end

function GetSpeedModBase(pn)
    local SpeedMod = GetSpeedMod(pn)
	
    SpeedMod = string.gsub(SpeedMod, 'c', '')
    SpeedMod = string.gsub(SpeedMod, 'm', '')
    SpeedMod = string.gsub(SpeedMod, 'x', '')
	
    if GetSpeedModType(pn) == 'c-mod' or GetSpeedModType(pn) == 'm-mod' then SpeedMod = SpeedMod/100 end
	
    return tostring(math.floor(SpeedMod)) -- Consistency: all the others return a string due to concatenation or w/e
end

function GetSpeedModExtra(pn)
    local SpeedMod = GetSpeedMod(pn)
    SpeedMod = string.gsub(SpeedMod, 'c', '')
    SpeedMod = string.gsub(SpeedMod, 'm', '')
    SpeedMod = string.gsub(SpeedMod, 'x', '')
	
    if GetSpeedModType(pn) == 'c-mod' or GetSpeedModType(pn) == 'm-mod' then SpeedMod = SpeedMod/100 end

    return '+' .. SpeedMod - math.floor(SpeedMod)
end

function GetSpeedModType(pn)
    local SpeedMod = GetSpeedMod(pn)

    if string.find(SpeedMod, "x") ~= nil then return 'x-mod' end
    if string.find(SpeedMod, "c") ~= nil then return 'c-mod' end
    if string.find(SpeedMod, "m") ~= nil then return 'm-mod' end
end

function SpeedMods(name)
    local modList = GetBaseSpeeds()
    local s = "Speed"

    if name == "Extra" then modList = GetExtraSpeeds() s = "Extra " .. s end
    if name == "Type" then modList = GetSpeedModTypes() s = s .. " Type" end

    local Params = { Name = s, OneChoiceForAllPlayers = false }   

    local function Load(self, list, pn)
        -- default to the first item in the list
        list[1] = true

        -- now loop through everything else in the list and see if it is set to true
        for i=2, table.getn(modList) do
            if name == "Base" then
                if modList[i] == GetSpeedModBase(pn) then list[i] = true; list[1] = false else list[i] = false end
            end

            if name == "Extra" then
                if string.gsub(modList[i], 'x', '') == GetSpeedModExtra(pn) then list[i] = true; list[1] = false else list[i] = false end
            end

            if name == "Type" then				
                if modList[i] == GetSpeedModType(pn) then list[i] = true; list[1] = false else list[i] = false end
            end
        end
    end

    local function Save(self, list, pn)
        local SpeedMod = GetSpeedMod(pn)
        local ModBase = GetSpeedModBase(pn)
        local ModExtra = GetSpeedModExtra(pn)
        local ModType = GetSpeedModType(pn)

        for i = 1, table.getn(modList) do
            if list[i] then
                if name == "Base" then ModBase = modList[i] end
                if name == "Extra" then ModExtra = modList[i] end
                if name == "Type" then ModType = modList[i] end
            end
        end
			
        if GetSpeedModRowType() ~= "pro" then
            GAMESTATE:ApplyGameCommand('mod,' .. ModBase, pn+1)
            MESSAGEMAN:Broadcast('SpeedModChangedP' .. pn+1)
        else
            SpeedMod = ModBase + ModExtra
		
            if ModType == 'c-mod' then SpeedMod = 'c' .. SpeedMod*100 end
            if ModType == 'm-mod' then SpeedMod = 'm' .. SpeedMod*100 end
            if ModType == 'x-mod' then SpeedMod = SpeedMod .. 'x' end      

            --[[ This is the most retarded thing. For some reason when you apply an M-Mod or an X-Mod you can
            get these weird situations where GAMESTATE:PlayerIsUsingModifier will tell you that there is an M and
            an X mod in use. Therefore GetSpeedMod often returns the wrong speed mod (this seems to happen most when
            you choose 0x or m0 and then try change the mod type). This is a silly fix that checks what the mod being
            set is, then set the other one (IE if we're setting X, then change M) to a value outside of where GetSpeedMod
            will ever look ]]--
            if ModType == 'm-mod' then GAMESTATE:ApplyGameCommand('mod,9999x',pn+1) end
            if ModType == 'x-mod' then GAMESTATE:ApplyGameCommand('mod,m9999',pn+1) end
            GAMESTATE:ApplyGameCommand('mod,'..SpeedMod,pn+1) --this is so annoying, the player number has to be 1 or 2 for ApplyGameCommand
            MESSAGEMAN:Broadcast('SpeedModChangedP' .. pn+1)
        end
    end

    return CreateOptionRow( Params, modList, Load, Save )
end