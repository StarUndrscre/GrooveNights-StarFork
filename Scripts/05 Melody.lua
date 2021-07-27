CONSTMELODY = {}
local melody = CONSTMELODY

-- Variables / Global Functions

    MELODY_THEME = true

    local _themename = string.sub(THEME:GetPath(2,'','_blank.png'),9)
    melody.ThemeName = string.sub(_themename,1,string.find(_themename,'/')-1)
    melody.GetWindowTitle = function()
        if FUCK_EXE then
            local ver_str,ver_num = melody.GetBuildVersion()
            return "Constant Melody X - NotITG " .. ver_str ..' ('.. GAMESTATE:GetVersionDate() ..')'
        else
            return "Constant Melody X - OpenITG"
        end
    end

    melody.RandomBG = 1

    local Modulo = function(a,b) return (a - math.floor(a/b)*b) end
    local Moduloop = function(a,min,max)
        local v = a
        local diff = math.abs(max-min)
        while v > max do v=v-diff end
        while v < min do v=v+diff end
        return v
    end
    local SplitByNumber = function(str,num)
        local nt = {}; local s = "";
        --
        for i=1,string.len(str) do
            if (Modulo(i,num)) == 0 then
                table.insert(nt,s)
                s = ""
            end
            local l = string.sub(str,i,i);
            s = s .. l
        end
        if s ~= "" then table.insert(nt,s); s = "" end
        --
        return nt
    end
    local Join = function(a,b)
        if not b then b = '' end
        local c = ""
        for i,v in pairs(a) do
            if i == table.getn(a) then c = c .. v
            else c = c .. v .. b
            end
        end
        return c
    end
    local TrimEnd = function(str,let)
        local s = ""; local c = string.len(str)
        for i=string.len(str),1,-1 do
            local l = string.sub(str,i,i)
            if l == let then c = c - 1; else s = string.sub(str,1,c); break end 
        end
        return s
    end
    local TrimStart = function(str,let)
        local s = ""; local c = 1;
        for i=1,string.len(str) do
            local l = string.sub(str,i,i)
            if l == let then c = c + 1; else s = string.sub(str,c,string.len(str)); break end
        end
        return s;
    end
    local ContainsLetter = function(str,let)
        for i=1,string.len(str) do
            if string.sub(str,i,i) == let then return true end
        end
        return false
    end
    melody.Split = function(str,sep)
        local t = {}; local c = 1; local s = "";
        -- woa
        if not ContainsLetter(str,sep) then return {str} end
        -- tell me how to split strings easily :(
        for i=1,string.len(str) do
            local l = string.sub(str,i,i);
            if l ~= sep then s = s..l -- If not encountered split, add to local string
            elseif i == string.len(str) and s ~= "" then t[c] = s; -- If end and s is not empty, insert to local table
            else t[c] = s; c = c + 1; s = ""; -- If encountered split, add to table
            end
        end
        if s ~= "" then table.insert(t,s) end
        --
        return t
    end
    melody.Moo = function()
        SCREENMAN:SystemMessage('Moo!')
    end
    melody.DiffuseActor = function(actor,alpha)
        local r,g,b,a = ColorRGB()
        if r + g + b == 3 then -- empty
            r,g,b,a = ColorRGB(math.random(1,12),true)
        end
        if alpha then a = alpha; end
        actor:diffuse(r,g,b,a)
    end
    local Round = function(a)
        return math.floor(a+0.5)
    end
    local FunctionFilter = function(a,b)
        local t = {}
        for i,v in pairs(a) do
            if b(v) then table.insert(t,v) end
        end
        return t
    end
    melody.SecToHHMMSS = function(t)
        local seconds = t
        if seconds <= 0 then
            return "00:00:00";
        else
            local hours = string.format("%02.f", math.floor(seconds/3600));
            local mins = string.format("%02.f", math.floor(seconds/60 - (hours*60)));
            local secs = string.format("%02.f", math.floor(seconds - hours*3600 - mins *60));
            return hours..":"..mins..":"..secs
        end
    end

-- Versions

    melody.BuildVersions = {
        ['V1']     = 20161226,
        ['V2']     = 20170405,
        ['V3']     = 20180617,
        ['V3.1']   = 20180827,
        ['V4']     = 20200112,
        ['V4.0.1'] = 20200126,
        ['V4.1']   = 20200402, -- All versions are welcome, except do_not
		['4.2']    = 20210420, -- nice
    }
    melody.GetBuildVersion = function()
        if not FUCK_EXE then return nil end

        local version_string = 'V1'
        local version_date = melody.BuildVersions[ version_string ]

		for k,v in pairs(melody.BuildVersions) do
            if tonumber(GAMESTATE:GetVersionDate()) >= v  then
                
                version_string = k
                version_date = v

            end
        end

        return version_string, version_date
    end
    melody.MinimumVersion = function(build) -- OpenITG|V1|V2|V3|V3.1|V4
        if build ~= 'OpenITG' and not FUCK_EXE then return false end
        if build == 'OpenITG' then return true end -- Only one check for OpenITG

        local v_str,v_num = melody.GetBuildVersion()

        return v_num >= melody.BuildVersions[build]
    end

-- Profile

    melody.Profile = {}
    melody.Profile.Profile = function(pn)
        if not PROFILEMAN then return {} end
        if pn == 0 then return PROFILEMAN:GetMachineProfile():GetSaved()
        else return PROFILEMAN:GetProfile(pn-1):GetSaved() end
    end
    melody.Profile.Get = function()
        if not melody.Profile.Profile(0) then return {} end
        if not melody.Profile.Profile(0).Melody then
            melody.Profile.Profile(0).Melody = {
                -- Defaults
                Options_ScreenStageOptions=false,
                Options_EvaluationMusic=true,
                Options_SelectMusicPony=true,
                Options_ProgressBar=false,

                -- Private
                BorderlessWindowed=false,
            }
        end
        return melody.Profile.Profile(0).Melody
    end
    melody.Profile.Set = function(t)
        if t then melody.Profile.Profile(0).Melody = t; end
        PROFILEMAN:SaveMachineProfile()
    end
    melody.Profile.__call = function(s,...)
        return melody.Profile.Profile(arg[1])
    end
    setmetatable(melody.Profile,melody.Profile)

-- Gameplay

    melody.Gameplay = {}
    melody.Gameplay.ComboTween = function(self)
        if melody.Profile.Get().Options_DefaultComboTween then
            local combo=self:GetZoom(); 
            local newZoom=scale(combo,50,3000,0.8,1.8);
            self:zoom(0.7*newZoom);
            self:linear(0.05); 
            self:zoom(0.7*newZoom);
        else
            self:zoom(0.5);
            self:zoomx(1.3);
            self:decelerate(0.25/GAMESTATE:GetCurBPS());
            self:zoomx(0.5);
        end
    end
    melody.Gameplay.Failed = {0,0}
    melody.Gameplay.BongoCat = false
    melody.Gameplay.BongoCatInput = {{0,0,0,0},{0,0,0,0}}


-- Get Functions

    melody.Get = {}
    melody.Get.Judgments = function()

        if not FUCK_EXE then
            -- Manually insert stuffs here
            local t = {
                'Default',
                'itg2hd',
                'splatoon2',
                'njsrt',
                'tmday',
                'tmnight',
                'wp',
                'groovenights',
                'thatquestionsucks',
                'japanese'
            }
            return t
        end

        local t = { GAMESTATE:GetFileStructure('Themes/'.. melody.ThemeName ..'/Graphics/_Judgements/') }
        local j = { 'Default' }

        -- [[ NAMES WITH SPACE SUPPORT ]] --
            -- Fun little thing,
            -- regardless of the type, the 2x6 or 1x6 always comes first before (doubleres) or (res %dx%d)
            -- so we can just get ALL the words before that!

        for i,v in pairs(t) do
            local temp = {}
            for k2,v2 in pairs(melody.Split(v,' ')) do
                if string.find(v2,'%dx%d') then
                    break
                end
                table.insert(temp,v2)
            end
            local a = string.gsub(Join(temp,' '),"%.png","")
            table.insert(j, a )
        end
        
        return j
    end
    melody.Get.NoteSkins = function()
        -- These are usually the old itg-control skins
        local blacklisted = {
            '_scalableBACK',
            'arrowkun',
            'arrowkun-notweens',
            'cel-cmd',
            'cel-cmd-notweens',
            'cel-glow2',
            'cel-yuno',
            'coin',
            'combination',
            'controlcel',
            'controlmetal',
            'controlmetal2',
            'couplesbw',
            'couples-cmd',
            'couplescontrol',
            'de-default',
            'dunno',
            'flat',
            'justholds',
            'latem',
            'metal2_dpad',
            'metal-cmd',
            'metal-cmdholds',
            'metal-cmd-notweens',
            'mindCode',
            'mindError',
            'mindGalaxyKiss',
            'mindKickMetal',
            'mindNoShow',
            'mindPressure',
            'mindRockSTARmetal',
            'mindStarsMetal',
            'mindTechMetal',
            'proxynotes',
            'randomhex',
            'spikes2',
            'splitter',
            'spt',
            'Touhou',
        }
        local n = {}
        --for i,v in pairs({GAMESTATE:GetFileStructure('NoteSkins/dance/')}) do
        for i,v in pairs(NOTESKIN:GetNoteSkinNames()) do
            local cont = false
            for k1,v1 in pairs(blacklisted) do
                if v == v1 then
                    cont = true
                    break
                end
            end
            if not cont then table.insert(n,v) end
        end
        return n
    end

-- Extra Options
    melody.ExtraOptions = {
        EnableScreenStageOptions = function()
            local t = OptionRowBase('ScreenStageOptions')
            t.OneChoiceForAllPlayers = true
            t.Choices = { "Enable", "Disable" }
            t.LoadSelections = function(self, list) if melody.Profile.Get().Options_ScreenStageOptions then list[1] = true else list[2] = true end end
            t.SaveSelections = function(self, list)
                melody.Profile.Get().Options_ScreenStageOptions = list[1];
            end
            return t
        end,
        EnableDefaultFail = function()
            local t = OptionRowBase('DefaultFail')
            t.OneChoiceForAllPlayers = true
            t.Choices = { "Enable", "Disable" }
            t.LoadSelections = function(self, list) if melody.Profile.Get().Options_DefaultFail then list[1] = true else list[2] = true end end
            t.SaveSelections = function(self, list)
                if not CONSTMELODY.MinimumVersion('V3.1') then
                    SCREENMAN:SystemMessage('V3 below detected! Disabling DefaultFail')
                    list[1] = false
                    list[2] = true
                end
                melody.Profile.Get().Options_DefaultFail = list[1];
            end
            return t
        end,
        FailOption_Choices = {'Off','Random'},
        FailOption = function()
            local t = OptionRowBase('FailOption')
            t.OneChoiceForAllPlayers = true
            t.Choices = melody.ExtraOptions.FailOption_Choices
            t.LoadSelections = function(self, list)
                if not CONSTMELODY.MinimumVersion('V3.1') or not FUCK_EXE then
                    list[1] = true
                else
                    if not melody.Profile.Get().Options_FailOption then list[1]=true; return end
                    for i=1, table.getn(self.Choices) do
                        if melody.Profile.Get().Options_FailOption == i then
                            list[i] = true
                            return
                        end
                    end
                end
            end
            t.SaveSelections = function(self, list)
                for i=1, table.getn(self.Choices) do
                    if list[i] then melody.Profile.Get().Options_FailOption = i; break end
                end
                stitch('lua.death').Switch( melody.Profile.Get().Options_FailOption )
            end
            return t
        end,
        ColorfulEvaluation = function()
            local t = OptionRowBase('ColorfulEvaluation')
            t.OneChoiceForAllPlayers = true
            t.Choices = { "Enable", "Disable" }
            t.LoadSelections = function(self, list) if melody.Profile.Get().Options_ColorfulEvaluation then list[1] = true else list[2] = true end end
            t.SaveSelections = function(self, list)
                melody.Profile.Get().Options_ColorfulEvaluation = list[1];
            end
            return t
        end,
        EvaluationMusic = function()
            local t = OptionRowBase('EvaluationMusic')
            t.OneChoiceForAllPlayers = true
            t.Choices = { "Enable", "Disable" }
            t.LoadSelections = function(self, list) if melody.Profile.Get().Options_EvaluationMusic then list[1] = true else list[2] = true end end
            t.SaveSelections = function(self, list)
                melody.Profile.Get().Options_EvaluationMusic = list[1];
            end
            return t
        end,
        DefaultComboTween = function()
            local t = OptionRowBase('DefaultComboTween')
            t.OneChoiceForAllPlayers = true
            t.Choices = { "Enable", "Disable" }
            t.LoadSelections = function(self, list) if melody.Profile.Get().Options_DefaultComboTween then list[1] = true else list[2] = true end end
            t.SaveSelections = function(self, list)
                melody.Profile.Get().Options_DefaultComboTween = list[1];
            end
            return t
        end,
        SelectMusicPony = function()
            local t = OptionRowBase('SelectMusicPony')
            t.OneChoiceForAllPlayers = true
            t.Choices = { "Enable", "Disable" }
            t.LoadSelections = function(self, list) if melody.Profile.Get().Options_SelectMusicPony then list[1] = true else list[2] = true end end
            t.SaveSelections = function(self, list)
                melody.Profile.Get().Options_SelectMusicPony = list[1];
            end
            return t
        end,
        ProgressBar = function()
            local t = OptionRowBase('ProgressBar')
            t.OneChoiceForAllPlayers = true
            t.Choices = { "Enable", "Disable" }
            t.LoadSelections = function(self, list) if melody.Profile.Get().Options_ProgressBar then list[1] = true else list[2] = true end end
            t.SaveSelections = function(self, list)
                melody.Profile.Get().Options_ProgressBar = list[1];
            end
            return t
        end
    }
-- Break Time
    melody.BreakTime = {}
    melody.BreakTime.Songs = {}
    melody.BreakTime.Choice_Index = 1
    melody.BreakTime.Playing_Index = 1

    melody.BreakTime.Paused = false
-- Overlay
    melody.Overlay = {}
    melody.Overlay.Last_Seen_Screen = ''
-- Discord RPC
    melody.RPC = {}
    melody.RPC.Connected = false
    melody.RPC.UpdateScreen = function(ns)
        if ns == 'ScreenTitleMenu' then
            External:add_buffer(1,{1,1})
        elseif ns == 'ScreenSelectMusic' then
            External:add_buffer(1,{1,2})
        elseif ns == 'ScreenGameplay' then
            External:add_buffer(1,{1,3})
            local song_name = External.encode( GAMESTATE:GetCurrentSong():GetDisplayMainTitle() )
            table.insert(song_name,1,1)
            table.insert(song_name,1,2)
            local song_folder = External.encode( GAMESTATE:GetCurrentSong():GetGroupName() )
            table.insert(song_folder,1,2)
            table.insert(song_folder,1,2)
            local song_length = {2,3,GAMESTATE:GetCurrentSong():MusicLengthSeconds()}
            External:add_buffer(1,song_name)
            External:add_buffer(1,song_folder)
            External:add_buffer(1,song_length)
            External:add_buffer(1,{2,4}) -- push
        elseif string.find(ns,'ScreenEvaluation') then
            External:add_buffer(1,{1,4})
        elseif ns == 'ScreenMelodyBreakTime' then
            External:add_buffer(1,{1,5})
        elseif ns == 'ScreenEdit' then
            External:add_buffer(1,{1,6})
        end
    end
-- Card Display
    melody.Card = {}
    melody.Card[1] = {}
    melody.Card[1].Icon = nil
    melody.Card[1].Text = nil
    melody.Card[1].Position = { SCREEN_CENTER_X-(SCREEN_WIDTH*160/640) , SCREEN_BOTTOM - 13 }
    melody.Card[2] = {}
    melody.Card[2].Icon = nil
    melody.Card[2].Text = nil
    melody.Card[2].Position = { SCREEN_CENTER_X+(SCREEN_WIDTH*160/640) , SCREEN_BOTTOM - 13 }
    -- it was too long
    melody.Card.Initialize_Text = function(self,pn)
        -- shadowlength,0;horizalign,left;vertalign,bottom;zoom,0.4;ztest,1
        self:shadowlength(0)
        self:horizalign(pn==1 and 'left' or 'right')
        self:vertalign('bottom')
        self:zoom(0.4)
        self:ztest(1)

        -- Might consider removing card display at all??????

        -- useless, any screensystemlayer actors can't be grabbed.
        -- melody.Card[pn].Text = self
    end
    melody.Card.Initialize_Icon = function(self,pn)
        -- DrawOrder,311;zoom,0.8
        self:draworder(311)
        self:zoom(0.8)

        melody.Card[pn].Icon = self
    end
-- MISC
    melody.ScreenSelectPlayModeNITG = {}
    melody.ScreenSelectPlayModeNITG.Choice = 1
    melody.ScreenTitleMenu = {}
    melody.ScreenTitleMenu.Choice = 1
    melody.Chegg = false
    melody.IsEditPlaying = false
    melody.Garbage = {} -- Incase I got too lazy
-- 