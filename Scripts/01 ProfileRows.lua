--[[
Simple persisten row API and PrefsRows API for 3.95/OpenITG, version 1.2
Licensed under Creative Commons Attribution-Share Alike 3.0 Unported
(http://creativecommons.org/licenses/by-sa/3.0/)

This script is based on PrefsRows originally writeen by Marc Cannon ("Vyhd")

Base definitions and templates for StepMania LUA options lists to save to machine profile.
Written by Cameron Ball for OpenITG (http://www.boxorroxors.net/).
All I ask is that you keep this notice intact and don't redistribute in bytecode.
--]]


--[[
Callable functions:

CreateOptionRow( Params, Names, LoadFctn, SaveFctn )
[creates a generic OptionRow with the given data]
        - Params: table with OptionRow data. "Name" is required, others are optional.
        - Names: table with the names of the objects to be used
        - LoadFctn(self, list, pn): called on list load, sets an initial toggle
        - SaveFctn(self, list, pn): called on list exit, uses a toggle to set a value

CreateProfileRow( Params, Values )
[creates a Profile-modifying OptionRow with this data]
        - Params: a table of parameters to use (generally you would just set Params.Name)
        - Values: table with the values to be used

CreateProfileRowBool( Params )
[generates an OptionsRow that toggles a boolean Preference]

GetProfilePref( Name )
[returns the value of Name in the machine profile table, if it exists]

ToggleBooleanPref( Name )
[toggles a boolean preference in the profile table, but does not save it]

CreatePrefsRow( Params, Names, Values, prefname )
[creates a Preference-modifying OptionRow with this data]
	- Values: table with the values to be used (1:1 map to Names)
	- prefname: string with the name of the Preference to modify

CreatePrefsRowRange( Params, Names, prefname, start, delta )
[generates an OptionsRow with a value range, set to the length of Names]
	- start: starting value, from which the value generation starts
	- delta: difference between each value in the list

CreatePrefsRowEnum( Params, Names, prefname )
[generates an OptionsRow that uses enumeration values]

CreatePrefsRowBool( Params, prefname )
[generates an OptionsRow that toggles a boolean Preference]

CreateSimplePrefsRowBool( prefname )
[same as above, except sets the OptionRow name to prefname, too]

--]]

-- This is purely for convenience
local ProfileTable

-- Without this check, when StepMania starts it will report a lua runtime error as PROFILEMAN apparently doesn't exist yet.
if PROFILEMAN ~= nil then
    ProfileTable = PROFILEMAN:GetMachineProfile():GetSaved()
end

-- This function written by Marc Cannon ("Vyhd")
function CreateOptionRow( Params, Names, LoadFctn, SaveFctn )
        if not Params.Name then return nil end

        -- this needs to be used because Lua evaluates 'false' as 'nil', so
        -- we can't use an OR operator to assign the value properly.
        local function setbool( value, default )
                if value ~= nil then return value else return default end
        end

        -- fill in with passed params or default values. only Name is required.
        local t =
        {
                Name = Params.Name,

                LayoutType = Params.LayoutType or "ShowAllInRow",
                SelectType = Params.SelectType or "SelectOne",

                OneChoiceForAllPlayers = setbool(Params.OneChoiceForAllPlayers, true),
                EnabledForPlayers = Params.EnabledForPlayers or {PLAYER_1, PLAYER_2},

                ExportOnChange = setbool(Params.ExportOnChange, false),
                ReloadRowMessages= Params.ReloadRowMessages or {},

                Choices = Names,
                LoadSelections = LoadFctn,
                SaveSelections = SaveFctn,
        }

        setmetatable( t, t )
        return t
end

function CreateGenericOptionRow( Params, Choices, Values )
        local function Load(self, list, pn)                
            for i=1,table.getn(Choices) do
                list[i] = Params.LoadCallback(list[i], Values[i], pn)

				if list[i] == nil and Params.EnabledByDefault and Params.SelectType == "SelectMultiple" then list[i] = true end
				
                if Params.SelectType ~= "SelectMultiple" and list[i] then return end
            end

            if Params.SelectType ~= "SelectMultiple" then
				if Params.Default then list[Params.Default] = true else list[1] = true end
			end
        end

        local function Save(self, list, pn)
                for i=1,table.getn(Choices) do
                    Params.SaveCallback(list[i], Values[i], pn)
                end
        end

        return CreateOptionRow( Params, Choices, Load, Save )
end

-- creates a row list given a list of names and values
function CreateProfileRow( Params, Choices, Values )
        local pref = ProfileTable[Params.Name]
        if type(pref) ~= "table" and Params.SelectType == "SelectMultiple" then pref = {} pref[Params.Name] = {} end
							
        Params.LoadCallback = function(List, Value) if Params.SelectType ~= "SelectMultiple" then return Value == pref else return pref[Value] end end
        Params.SaveCallback = function(List, Value)
                                if Params.SelectType ~= "SelectMultiple" and List then ProfileTable[Params.Name] = Value PROFILEMAN:SaveMachineProfile() return end
								-- TODO this is pretty inefficient, it saves the profile once for every item in the list, instead it should be clever and wait till the end or something. Edit: I think I made it a bit better lol
                                if Params.SelectType == "SelectMultiple" then if type(ProfileTable[Params.Name]) ~= "table" then ProfileTable[Params.Name] = {} ProfileTable[Params.Name][Value] = {} end ProfileTable[Params.Name][Value] = List PROFILEMAN:SaveMachineProfile() end
                              end

        return CreateGenericOptionRow( Params, Choices, Values )
end

function CreateProfileRowBool( Params )
    local Choices = {"OFF", "ON"}
    local Values = {false, true}
    return CreateProfileRow( Params, Choices, Values )
end

function GetProfilePref(Name)
    return ProfileTable[Name]
end

function ToggleBooleanPref(Name)
    if type(ProfileTable[name]) == "boolean" then ProfileTable[Name] = not ProfileTable[Name] end
end

-- creates a row list given a list of names and values
function CreatePrefsRow( Params, Names, Values, prefname )
	local amt = table.getn(Names)
	local val = PREFSMAN:GetPreference(prefname)

	local function Load(self, list, pn)
		for i = 1, amt do
			if Values[i] == val then
				list[i] = true
				return
			end
		end
		list[1] = true	-- fall back to first value
	end

	local function Save(self, list, pn)
		for i = 1, amt do
			if list[i] then
				PREFSMAN:SetPreference(prefname, Values[i])
				return
			end
		end
	end

	return CreateOptionRow( Params, Names, Load, Save )
end

-- creates a ranged list, given an offset and delta between values
function CreatePrefsRowRange( Params, Names, prefname, start, delta )
	local amt = table.getn(Names)
	local val = PREFSMAN:GetPreference(prefname)

	local function IndexToValue(i)
		return start+(delta*(i-1))
	end

	local function Load(self, list, pn)
		for i = 1, amt do
			if IndexToValue(i) == val then
				list[i] = true
				return
			end
		end
		list[1] = true	-- fall back to first value
	end

	local function Save(self, list, pn)
		for i = 1,amt do
			if list[i] then
				PREFSMAN:SetPreference(prefname, IndexToValue(i))
			end
		end
	end

	return CreateOptionRow( Params, Names, Load, Save )
end

-- creates an enumerated toggle for a preference
function CreatePrefsRowEnum( Params, Names, prefname )
	local amt = table.getn(Names)
	local val = PREFSMAN:GetPreference(prefname)

	return CreateOptionRowRange( Params, Names, prefname, 0, 1 )
end 

-- creates a boolean toggle for a preference
function CreatePrefsRowBool( Params, prefname )
	local OptionValues = { false, true }
	local OptionNames = { "OFF", "ON" }

	local val = PREFSMAN:GetPreference(prefname)

	local function Load(self, list, pn)
		if PREFSMAN:GetPreference(prefname) == true then
			list[2] = true
		else
			list[1] = true
		end
	end

	-- set 0 if "OFF" (index 1), 1 if "ON" (index 2)
	local function Save(self, list, pn)
		for i = 1,2 do
			if list[i] then
				PREFSMAN:SetPreference(prefname, OptionValues[i] )
				return
			end
		end
	end

	return CreateOptionRow( Params, OptionNames, Load, Save )
end

-- very simple boolean toggle for a preference
function CreateSimplePrefsRowBool( prefname )
	local Params = {}
	Params.Name = prefname

	return CreatePrefsRowBool( Params, prefname )
end