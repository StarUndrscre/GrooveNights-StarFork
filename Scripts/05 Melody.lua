CONSTMELODY = {}
local melody = CONSTMELODY

-- Variables / Global Functions

    MELODY_THEME = true

    local _themename = string.sub(THEME:GetPath(2,'','_blank.png'),9)
    melody.ThemeName = string.sub(_themename,1,string.find(_themename,'/')-1)

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

-- Get Functions

    melody.Get = {}
    melody.Get.Judgments = function()

        if not FUCK_EXE then
            -- Manually insert stuffs here
            local t = {
                'Default',
                'Chromatic',
                'Deco',
                'Droidiga',
                'FP',
                'Gameplay',
                'Glow ITG',
                'GrooveNights HD',
                'Groovy',
                'ITG2',
                'Konigsberg',
                'Love',
                'Mariokart',
                'Negative ITG',
                'Neon',
                'Nulshock',
                'Outer Limits',
                'OutFox',
                'Quantify',
                'Shooters',
                'sm-ssc',
                'Tatics',
                'Technique',
                'VCR',
                'Voltex',
                'Wellbut',
                'Wonder Parade'
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
