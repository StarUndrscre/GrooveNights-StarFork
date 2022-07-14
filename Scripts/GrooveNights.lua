--------------------------------------------------------------------
--------------------------------------------------------------------
--   _____                          _   _ _       _     _         --
--  / ____|                        | \ | (_)     | |   | |        --
-- | |  __ _ __ ___   _____   _____|  \| |_  __ _| |__ | |_ ___   --
-- | | |_ | '__/ _ \ / _ \ \ / / _ \ . ` | |/ _` | '_ \| __/ __|  --
-- | |__| | | | (_) | (_) \ V /  __/ |\  | | (_| | | | | |_\__ \  --
--  \_____|_|  \___/ \___/ \_/ \___|_| \_|_|\__, |_| |_|\__|___/  --
--                                           __/ |                --
--                                          |___/         	      --
--------------------------------------------------------------------
--------------------------------------------------------------------

-- ===TABLE OF CONTENTS===
-- COPY THE BELOW TERMS AND DO A WORD FIND FOR IT SO THAT YOU CAN EDIT DIFFERENT SETTINGS

-- CHANGE FREQUENCY OF USB STAT LOADS
-- CHANGE MACHINE LOCATION TEXT
-- CHANGE THE RATE MODS
-- SHOW/HIDE ARROW SPEED INDICATORS
-- SHOW/HIDE "WINNING PLAYER" CROWNS
-- SHOW/HIDE TOTAL PLAYTIME
-- ALLOW MENU BUTTON TO RESTART SONG

--> COMBO STUFF
-- -- DEFAULT COMBO SIZE
-- -- TOGGLE COMBO SIZE INCREASES
-- -- TOGGLE COMBO BOUNCE ANIMATION

--> JUDGMENT STUFF
-- -- DEFAULT JUDGMENT SIZE
-- -- DEFAULT JUDGMENT OPACITY
-- -- TOGGLE JUDGMENT BOUNCE ANIMATION


-- MAKE IT KNOWN THAT THE GAME IS USING GROOVENIGHTS
-- MENU AND SYSTEM NAMES
-- PLAYER HAS A SPECIAL USB NAME?
-- ADD FROM CENTER
-- CUSTOM RESULT SCREENS
-- CUSTOM AVATARS



-- ===CHANGE FREQUENCY OF USB STAT LOADS===
-- This means by default USB stats load once and then don't load again for 10 songs, change that value here.
function getMaxStatFrequency()
	return 8
end

function evalHeader()
	ScreenEvaluationStageHeaderTexts = {
	  'you suck',
	  '#score-share time',
	  'press PRTSCR to kill a family',
	  'sonic the hedghehog',
	  'penis!!!',
	  'HOW',
	  'YOU ROCK!',
	  'm',
	  'h',
	  ',',
	  'Cocke and Balls',
	  'haha your sync is broken', 'gaming!!',
	  'good job, She is proud of you',
	  'hacking hacker.....',
	  'wooow... not even an FC?? you suck',
	  'PENIS',
	  '',
	  'wii phone',
	  'xbox 720',
	  'cant believe',
	  'pain',
	  'man',
	  'horse',
	  'cant believe they made taiko in nitg.....',
	  'COCK',
	  'pussy',
	  'go post this on twitter. go brag about your score',
	  'wouldnt it be a shame if... AV',
	  'good job! the game will now AV',
	  'music do be banging doe',
	  'soulja boy tell em',
	  'Polish toilet spin',
	  'SCREENMAN:GetTopScreen():vibrate()',
	  'h.how',
	  'ronaldinho soccer!!!',
	  'wow youre terrible',
	  'keyboard moment',
	  'glitch2.frag moment',
	  'it wasnt fault my game lagged',
	  'skewllex',
	  'what the Fuck',
	  'benis',
	  'weewee',
	  'wenis!!!!!',
	  'oatmealine is gay',
	  'tung tiied gaming',
	  'kfc gaming',
	  'Denis',
	  'bussy',
	  '666 is a 14',
	  'bye-bye',
	  'skye is cute',
	  'wahoo',
	  'caulk',
	  'nice cock',
	  'thabks',
	  'i love video james',
	  'whats wrong, honey? you haven\'t even touched your jinner. did i overcook your jurger?',
	  'beep',
	  'skill issue',
	  '#score-share be like',
	  'ONYON did nothing wrong',
	  'if you can read this, you\'re cute',
	  'liver',
	  ':clueless:',
	  ':heeeh:',
	  'are you a player? or are you a GAMER',
	  'congratulations! it\'s a boy!',
	  'MURD will win OISRT',
	  'this is a 14, actually',
	  'eat ass',
	  'go touch grass',
	  'slaps own ass',
	  'Wordle 202',
	  'https://www.google.com',
	  'bd9b2458e8f46511cdca1c6a04aeabdc65e6cd32',
	}
	local t = ScreenEvaluationStageHeaderTexts[math.random(1, #ScreenEvaluationStageHeaderTexts)]
	return t
end

function musicHeader()
	ScreenSelectMusicHeaderTexts = {
	  'oatmealine is the only folder that matters',
	  'go on. select chance',
	  'Are You In The Groove?',
	  'you have 3 seconds to get in the groove',
	  'penis music.',
	  'Barack Obama',
	  'insert funy here',
	  'Cock',
	  'oatmealine',
	  'Open the !wips. Now',
	  ':pensive:',
	  'huge nintendo ds',
	  'the burger',
	  'h',
	  '             e',
	  '',
	  'HOW',
	  'play forbidden. now',
	  ':sunglasses:',
	  'WEED',
	  'sussy baka',
	  'sambai ice cream',
	  'somebody scream',
	  'WE ARE BACK',
	  '1 2 3 4 5 6 do it!',
	  'you wanna hear a joke?',
	  'What wof you do if we acidebtal kiss..',
	  'NEVER FUCK ALWAYS PISS',
	  'born to shit forced to wipe',
	  'slow star kanade',
	  '??????????????? okay',
	  'cool! your point?',
	  'https://streamable.com/noooo',
	  'conflict歌います。ズォールヒ～～↑wwwwヴィヤーンタースwwwwwワース フェスツwwwwwwwルオルwwwwwプローイユクwwwwwwwダルフェ スォーイヴォーwwwwwスウェン ネwwwwヤットゥ ヴ ヒェンヴガｒジョｊゴアｊガオガオッガwwwじゃｇｊｊ',
	  'BEST BY 07 SEP 18 043 / 40',
	  'me when the uhhhhh.... me when the when',
	  'les gooo',
	  'subo',
	  'do a subo hop if u also think player cute',
	  'what the dog doin',
	  'hey check this out\n\n\n\n\n\n\n\nj',
	  'the j',
	  'why can\'t eggs have love',
	  'yop',
	}
	local t = ScreenSelectMusicHeaderTexts[math.random(1, #ScreenSelectMusicHeaderTexts)]
	return t
end

-- ===SHOW/HIDE ARROW SPEED INDICATORS===
-- If you want the Arrow Speed Indicators to appear in the options menu you can switch them on here.
-- It has been reported that they can sometimes cause lag during 2-Player mode so I opted to disable it by default.
function ShowArrowIndicators()
	return true;
end


-- ===SHOW/HIDE "WINNING PLAYER" CROWNS===
-- If you find the Crowns to be too annoying then change it from true to false here.
-- That is, if they even appear at all, if they don't you'll need to add "CompareScores=1" to your Stepmania.ini
-- or Static.ini files in the \Data\ folder.
function TournamentCrownEnabled()
	return true
end


-- ===SHOW/HIDE TOTAL PLAYTIME===
-- If you want to show and record the total playtime of each session you can do so here.
-- You can also toggle whether or not it should only appear in event mode or not.
function PlayTimeEnabled()
	if GAMESTATE:IsEventMode() then
-- Event Mode
		return true
	else
-- Regular Mode
		return false
	end
end


-- ===ALLOW MENU BUTTON TO RESTART SONG===
-- By pressing the menu button when the song has progressed beyond the lowest percentage indicated below
-- You can restart the song so that you don't have to keep reloading the song menu and starting again.
function MenuButtonGiveUp()
-- Set a percentage window of opportunity for the button to restart the song
	gnLowestRestartPercent = 0.05;
	gnHighestRestartPercent = 99.8;

	if gnSongElapsedPercent == nil then gnSongElapsedPercent = 0; end

-- Set to true to enable this feature
	return false
end


-- ===DEFAULT COMBO SIZE===
-- The combo size is set to "1" by default as this is the normal size, if you want it 10%
-- bigger then change it to "1.1", just note this only works if ToggleComboSize() below is false.
function DefaultComboSize()
	return 1
end


-- ===TOGGLE COMBO SIZE INCREASES===
-- By default the combo on the gameplay screen will increase in size as it has always done.
-- If you don't like that you can switch it off here.
function ToggleComboSizeIncrease()
	return true
end


-- ===TOGGLE COMBO BOUNCE ANIMATION===
-- The combo bounces a bit every time you step, if that's distracting you can turn it off here.
function ToggleComboBounce()
	return true
end


-- ===TOGGLE COMBO EXPLOSION ANIMATION===
-- When you reach a certain combo an explosion animation appears, you can switch it off here.
function ToggleComboExplosion()
	return true
end


-- ===DEFAULT JUDGMENT SIZE===
-- The judgment size is set to "1" by default as this is the normal size, if you want it 10%
-- bigger then change it to "1.1".
function DefaultJudgmentSize()
	return 1
end


-- ===DEFAULT JUDGMENT OPACITY===
-- The judgment opacity is set to "1" by default to indicate it is 100% Opaque, if you want it 70%
-- Opaque then change it to "0.7".
function DefaultJudgmentOpacity()
	return 1
end


-- ===TOGGLE JUDGMENT BOUNCE ANIMATION===
-- The judgment bounces a bit every time you step, if that's distracting you can turn it off here.
function ToggleJudgmentBounce()
	return true
end


-- ===MAKE IT KNOWN THAT THE GAME IS USING GROOVENIGHTS===
-- If you wish for your simfiles to make use of GrooveNights functions from this and other LUA files, do a variable check.
-- Within your simfile's foreground animation you just need to do the following:
--
--		if GrooveNightsIsCurrentTheme then
--		>> Do Stuff Here
--		end
--
-- If the variable is nil then nothing will happen, and if it's not you get to make use of any of the features in this (and the other) lua files.
function MachineIsUsingGrooveNights()
	GrooveNightsIsCurrentTheme = true
	return true
end


-- ===WIDESCREEN STUFF===
gnZoomRatio = (SCREEN_WIDTH/640);
gnAspectRatio = (SCREEN_WIDTH/SCREEN_HEIGHT);
gnScaleWidth = (SCREEN_WIDTH / 640)
gnScaleHeight = (SCREEN_HEIGHT/ 480)

function gnScaleFOV(fov) 
	return 360 / math.pi * math.atan(math.tan(math.pi * (1 / (360 / fov))) * SCREEN_WIDTH / SCREEN_HEIGHT * 0.75) 
end

-- ===MENU AND SYSTEM NAMES===
-- The following are elements of the game that you can change to
-- give it your own custom feel, you can also add conditions so
-- that words change based on the name of a user's memory card,
-- current level, etc.
-- Enjoy!

-- Protip: When placing a lot of text, putting :: makes it go to the next line.
-- Yo::What's Up?

-- Yo
-- What's Up?


-- [PLAYER DIFFICULTIES]
-- Novice
function getTextNovice()
	if CheckPlayerName('REEN')  or CheckPlayerName('SteveReen') then
		return 'Based'
	end
	if CheckPlayerName('TARO') or CheckPlayerName('TaroNuke') then
		return "no"
	end
	if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
		return 'expert'
	end

	return 'Novice'
end
		
-- Easy
function getTextEasy()
	if CheckPlayerName('REEN')  or CheckPlayerName('SteveReen') then
		return 'Based'
	end
	if CheckPlayerName('TARO') or CheckPlayerName('TaroNuke') then
		return "haha"
	end
	if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
		return 'hard'
	end

	return 'Easy'
end
	
-- Medium
function getTextMedium()
	if CheckPlayerName('REEN')  or CheckPlayerName('SteveReen') then
		return 'Based'
	end
	if CheckPlayerName('TARO') or CheckPlayerName('TaroNuke') then
		return "banana"
	end
	if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
		return 'medium'
	end

	return 'Medium'
end

-- Hard
function getTextHard()
	if CheckPlayerName('REEN')  or CheckPlayerName('SteveReen') then
		return 'Based'
	end
	if CheckPlayerName('TARO') or CheckPlayerName('TaroNuke') then
		return "yes"
	end
	if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
		return 'easy'
	end
		return 'Hard'
	end
		
-- Expert
function getTextExpert()
	if CheckPlayerName('REEN')  or CheckPlayerName('SteveReen') then
		return 'Based'
	end
	if CheckPlayerName('TARO') or CheckPlayerName('TaroNuke') then
		return "WinDEU"
	end
	if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
		return 'novice'
	end

	return 'Expert'
end

-- Slumpage
function getTextSlumpage()
	if CheckPlayerName('REEN')  or CheckPlayerName('SteveReen') then
		return 'Based'
	end
	if CheckPlayerName('TARO') or CheckPlayerName('TaroNuke') then
		return 'do you like it?'
	end
	if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
		return 'baby'
	end

	return 'Slumpage'
end	


-- [SERVICE OPTIONS SCREEN]
-- Menu Title
function getTextServiceOptionsTitle()
	return 'SERVICE OPTIONS'
end
		

-- [ARCADE OPTIONS SCREEN]
-- Menu Title
function getTextArcadeOptionsTitle()
	return 'SELECT OPTIONS'
end
		
		
-- [PLAY MODE SELECT SCREEN]
-- Menu Title
function getTextPlayModeTitle()
	if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
		return 'play'
	end

	return 'SELECT PLAY MODE'
end	

-- DANCE Description
function getTextDANCEDescription()
	if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
		return 'dance on machine perfect'
	end

	return 'Good clean dancing fun for all players'
end	

-- MARATHON Description
function getTextMARATHONDescription()
	if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
		return 'mod attack SRT courses'
	end

	return 'Play longer, but look out for scripted modifiers'
end	
	
-- SURVIVAL Description
function getTextSURVIVALDescription()
	if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
		return 'SRT clocks'
	end

	return 'Beat the clock by stepping accurately with modifiers'
end			
		
		
-- [PLAYER SELECT SCREEN]
-- Menu Title
function getTextPlayersTitle()
	if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
		return 'players'
	end

	return 'SELECT PLAYERS'
end
		
-- 1 Player Description
function getTextOnePlayerDescription()
	if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
		return 'play once'
	end
		return 'One Player uses 4 Panels'
	end	

-- 2 Player Description
function getTextTwoPlayerDescription()
	if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
		return 'play twice'
	end

	return 'Two Players, each uses 4 Panels'
end	
		
-- Doubles Description
function getTextDoubleDescription()
	if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
		return 'play once then twice'
	end

	return 'One Player uses all 8 Panels'
end			
		
		
-- [SONG SELECT SCREEN]
-- Menu Title
function getTextSongSelectTitle()
	if CheckPlayerName('REEN')  or CheckPlayerName('SteveReen') then
		return "SONG"
	end
	if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
		return 'song'
	end

	return 'CHOOSE A SONG'
end
		
		
-- [COURSE SELECT SCREEN]
-- Menu Title
function getTextCourseSelectTitle()
	if CheckPlayerName('REEN')  or CheckPlayerName('SteveReen') then
		return "COURSE"
	end
	if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
		return 'SRT'
	end

	return 'CHOOSE A COURSE'
end
		

-- [PLAYER OPTIONS SCREEN]
-- Menu Title
function getTextPlayerOptionsTitle()
	if CheckPlayerName('REEN')  or CheckPlayerName('SteveReen') then
		return "MODS"
	end
	if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
		return 'mods'
	end

	return 'SELECT MODIFIERS'
end
		

-- [RESULTS SCREEN]
-- Menu Title
function getTextResultsTitle()
	if CheckPlayerName('REEN')  or CheckPlayerName('SteveReen') or CheckPlayerName('PHIL') or CheckPlayerName('Zetorux') then
		return "THERE'S THE BOYS"
	end
	if CheckPlayerName('TARO') or CheckPlayerName('TaroNuke') then
		return "good score, I liked"
	end
	if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
		return 'quinstar firework'
	end

	return 'CHECK YOUR STATS'
end
		
		
-- REPLACE THE STARS
-- For a Quad it'll reference the image GradeTier0001, so likewise it would reference CustomImage0001 if you keep ..tier on the end
function getResultStars( tier )
	if CheckPlayerName('Mario') or CheckPlayerName('Super Mario') or CheckPlayerName('Luigi',pn) or CheckPlayerName('Super Luigi',pn) then
		return "MarioTier"..tier
	end
	if CheckPlayerName('Yoshi') or CheckPlayerName('Yoshi the Dinosaur',pn) then
		return "YoshiTier"..tier
	end
	if CheckPlayerName('Bowser') or CheckPlayerName('King Koopa') then
		return "BowserTier"
	end
	if CheckPlayerName('Sonic') or CheckPlayerName('Sonic the Hedgehog') or CheckPlayerName('Tails') or CheckPlayerName('Tails Prower') or CheckPlayerName('Knuckles') or CheckPlayerName('Knuckles the Echidna') or CheckPlayerName('Eggman') or CheckPlayerName('Dr Eggman') or CheckPlayerName('Robotnik') or CheckPlayerName('Dr Robotnik') then
		return "SonicTier"
	end
	if CheckPlayerName('DK') or CheckPlayerName('Donkey Kong') or CheckPlayerName('Diddy') or CheckPlayerName('Diddy Kong') or CheckPlayerName('Dixie') or CheckPlayerName('Dixie Kong') or CheckPlayerName('Zinger') or CheckPlayerName('Wasp') or CheckPlayerName('Bee') then
		return "DKTier"
	end
	if CheckPlayerName('K Rool') or CheckPlayerName('King K Rool') or CheckPlayerName('Kaptain K Rool') then
		return "KRoolTier"
	end
	if CheckPlayerName('Enguarde') or CheckPlayerName('Enguarde the Swordfish') or CheckPlayerName('Swordfish') then
		return "EnguardeTier"
	end
	if CheckPlayerName('Rambi') or CheckPlayerName('Rambi the Rhino') or CheckPlayerName('Rhino') then
		return "RambiTier"
	end
	if CheckPlayerName('Winky') or CheckPlayerName('Winky the Frog') or CheckPlayerName('Frog') then
		return "WinkyTier"
	end
	if CheckPlayerName('Expresso') or CheckPlayerName('Expresso the Ostrich') or CheckPlayerName('Ostrich') then
		return "ExpressoTier"
	end
	if CheckPlayerName('Bomberman') or CheckPlayerName('Bomb') or CheckPlayerName('Hudson') then
		return "BombermanTier"
	end
	if CheckPlayerName('Megaman') or CheckPlayerName('X') or CheckPlayerName('Zero') or CheckPlayerName('0') then
		return "MegamanTier"..tier
	end
	if CheckPlayerName('TARO') or CheckPlayerName('TaroNuke') then
		return "TaroNukeTier"..tier
	end

	return 'GradeTier'..tier
end
		

-- Just Barely Text
function getTextBarely()
	if CheckPlayerName('REEN') or CheckPlayerName('SteveReen') then
		return "YOLO"
	end
	if CheckPlayerName('TARO') or CheckPlayerName('TaroNuke') then
		return "kill taro4012"
	end
	if CheckPlayerName('PHIL') or CheckPlayerName('Zetorux') then
		return "SWAG!"
	end	
	if CheckPlayerName('ALEX') or CheckPlayerName('ITGAlex') then
		return "BEAST!"
	end	
	if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
		return 'goooooo'
	end
	return 'Barely!'
end


-- Full Fantastic Text
function getTextFullFantastic()
	if CheckPlayerName('REEN') or CheckPlayerName('SteveReen') then
		return 'YOLO SWAG SWAG SWAG'
	end
	if CheckPlayerName('CAM') or CheckPlayerName('Cameron') or CheckPlayerName('JCE') or CheckPlayerName('(-[Jayce]-)') then
		return 'First in the World!'
	end
	if CheckPlayerName('TARO') or CheckPlayerName('TaroNuke') then
		return "angry grandpa"
	end
	if CheckPlayerName('PHIL') or CheckPlayerName('Zetorux') then
		return "I think they call that chubs"
	end	
	if CheckPlayerName('ALEX') or CheckPlayerName('ITGAlex') then
		return "YOU CHEATED!"
	end	
	if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
		return 'perfect or not perfect'
	end

	return 'Flawless Performance!'
end
	
	
-- Full Excellent Text
function getTextFullExcellent()
	if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
		return 'good'
	end

	return 'No Greats!'
end


-- Single Digit Excellents Text
function getTextSDE()
	if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
		return '10'
	end

	return 'Fewer than 10 Excellents!'
end


-- 1 Excellent Text
function getTextOneExcellent()
	if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
		return '1'
	end

	return '1 Excellent'
end


-- 100% Greats Text
function getTextFullGreats()
	if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
		return 'greenstar'
	end

	return 'Green Quad!'
end


-- 90% Greats Text
function getTextNinetyGreats()
	if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
		return '90'
	end

	return '90% Greats'
end


-- 80% Greats Text
function getTextEightyGreats()
	if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
		return '80'
	end

	return '80% Greats'
end

	
-- Single Digit Greats Text
function getTextSDG()
	if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
		return 'some green'
	end

	return 'Fewer than 10 Greats!'
end


-- Full Combo Text
function getTextFullCombo()
	if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
		return 'combo'
	end

	return 'Full Great Combo'
end
		
-- 1 Great Text
function getTextOneGreat()
	if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
		return '1 green'
	end

	return '1 Great'
end


-- Peak Combo Text
function getTextPeakCombo( cmb )
	if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
		return cmb..' steps'
	end

	return cmb..' Peak Combo!'
end


-- Machine Record #
function getTextMachineRecord( rec )
	if CheckPlayerName('TARO') or CheckPlayerName('TaroNuke') then
		return "good #"..rec
	end
	if CheckPlayerName('PHIL') or CheckPlayerName('Zetorux') then
		return "I don't give a shit Shit SHIT"
	end
	if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
		return rec..' scores'
	end

	return 'Machine Record #'..rec
end
		

-- Personal Record # (It's hidden in the metrics by default but it's here if you want it)
function getTextPersonalRecord( rec )
	if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
		return rec..' scores'
	end

	return 'Personal Record #'..rec
end

	
-- [NAME ENTRY SCREEN]
-- Menu Title
function getTextNameEntryTitle()
	if CheckPlayerName('REEN')  or CheckPlayerName('SteveReen') then
		return "NAME"
	end
	if GAMESTATE:GetEnv('AngryGrandpa') == 'On' then
		return 'name'
	end

	return "HERE ARE YOUR RESULTS"
end
		


-- ===SYSTEM STUFF===
-- Details from here onwards are system related, but you can change some things here too...
-- Details from here onwards are system related, but you can change some things here too...
-- Details from here onwards are system related, but you can change some things here too...
-- Details from here onwards are system related, but you can change some things here too...
-- Details from here onwards are system related, but you can change some things here too...
-- Details from here onwards are system related, but you can change some things here too...
-- Details from here onwards are system related, but you can change some things here too...
-- Details from here onwards are system related, but you can change some things here too...

-- Stop the DEMO screen from showing during Event Mode (Pretty sure it does this anyway, but just in case)
function EventTitle()
	if GAMESTATE:IsEventMode() then
		return -1;
	else
		return 60;
	end
end


-- This controls the 'Go Back' button... You should probably just leave it alone.
function BackButton()
    local function Load(self, list, pn) end
    local function Save(self, list, pn)
        if list[1] and (gnScreenSelectMusicTimer > 5) and (gnScreenPlayerOptionsTimer > 5) then
            SCREENMAN:SetNewScreen('ScreenSelectMusic') 
        elseif list[1] then
            SCREENMAN:SystemMessage('Not Enough Time Left to Go Back!') 
        end
    end

    local Names = {'Return to Music Selection'}
    local Params = { Name = "BackButton", SelectType = "SelectMultiple", OneChoiceForAllPlayers = GAMESTATE:IsPlayerEnabled(PLAYER_1) }
    
    return CreateOptionRow(Params, Names, Load, Save)
end

-- This sets the menu timer to its last recorded value so that you can't cheat the menus
function GetTimer( scr )
	if gnScreenSelectMusicTimer == nil then
		gnScreenSelectMusicTimer = gnDefaultSSM;
	end
	
	if gnScreenPlayerOptionsTimer == nil then
		gnScreenPlayerOptionsTimer = gnDefaultSPO;
	end
	
	if scr == 'ScreenEvaluation' then
		gnScreenSelectMusicTimer = gnDefaultSSM;			--	If you're looking to change this, you also need to change it in Branches.lua (very top)
		gnScreenPlayerOptionsTimer = gnDefaultSPO;			--	If you're looking to change this, you also need to change it in Branches.lua (very top)
		gnScreenEvaluationTimer = 30;
		return math.ceil(gnScreenEvaluationTimer)
	end
	
	if scr == 'ScreenSelectMusic' then
		if gnScreenSelectMusicTimer == nil then
			gnScreenSelectMusicTimer = gnDefaultSSM;		
		end
		return math.ceil(gnScreenSelectMusicTimer)
	end
	
	if scr == 'ScreenPlayerOptions' then
		if gnScreenPlayerOptionsTimer == nil then
			gnScreenPlayerOptionsTimer = gnDefaultSPO;	
		end
		return math.ceil(gnScreenPlayerOptionsTimer)
	end
	
	return 0;
end

bpm = { "1", "2", "3" }

-- Stamina Mod
StaminaMods = { 0, 0.01, 0.02, 0.03, 0.04, 0.05 }
Stamina = { "None", "Aoreo", "Jayce", "SteveReen", "WinDEU", "Zetorux" }

function StaminaMod()
	local ModList = Stamina
	local t = {
		Name = "Stamina",
		LayoutType = "ShowAllInRow",
		SelectType = "SelectOne",
		OneChoiceForAllPlayers = true,
		ExportOnChange = false,
		Choices = ModList,

		LoadSelections = function(self, list, pn)
			for n = 1, table.getn(ModList) do
				if StaminaMods[n] == 0 then
					s = "no"
				else
					s = StaminaMods[n].."%"
				end
				if GAMESTATE:PlayerIsUsingModifier(pn,s..' flip') then
					list[n] = true; 
				else 
					list[n] = false ;
				end
			end
		end,

		SaveSelections = function(self, list, pn)
			p = pn + 1;
			for n = 1, table.getn(ModList) do
				if list[n] then
					s = n;
					end
			end
		
		ModStamina = StaminaMods[s];
			if ModStamina == 0 then
				ModStamina = "no"
			else
				ModStamina = ModStamina.."%"
			end
			
		GAMESTATE:ApplyGameCommand('mod, no flip',p);
		GAMESTATE:ApplyGameCommand('mod,'..ModStamina..' flip',p);
		if ModStamina ~= 'no' then
			gnStamina = Stamina[s]
		else
			gnStamina = '';
		end
		GAMESTATE:SetEnv('StaminaMod','1');
		end
	}
	setmetatable(t, t)
	return t
end

-- Difficulty Value
function GetCurrentSongDifficulty( pn )
	local gnDifficulty = 
	{
		[0] = 'Novice',
		'Easy',
		'Medium',
		'Hard',
		'Expert',
		'Edit'
	}
	if not GAMESTATE:IsCourseMode() then 
		local step = GAMESTATE:GetCurrentSteps(pn)
		if step == nil then
			return ''
		elseif gnDifficulty[ step:GetDifficulty() ] == nil then 
			return ''
		else
			return gnDifficulty[ step:GetDifficulty() ]
		end
	end
end

-- Difficulty Meter
function GetCurrentSongMeter( pn )
	local steps = GAMESTATE:GetCurrentSteps(pn)
	if steps == nil then 
		return ""
	elseif steps:GetDifficulty() == DIFFICULTY_EDIT then 
		gnNewDifficulty = steps:GetDescription()
	elseif steps:GetDifficulty() == DIFFICULTY_HARD then 
		gnNewDifficulty = getTextNovice()
	elseif steps:GetDifficulty() == DIFFICULTY_EASY then 
		gnNewDifficulty = getTextEasy()
	elseif steps:GetDifficulty() == DIFFICULTY_MEDIUM then 
		gnNewDifficulty = getTextMedium()
	elseif steps:GetDifficulty() == DIFFICULTY_EDIT then 
		gnNewDifficulty = getTextHard()
	elseif steps:GetDifficulty() == DIFFICULTY_CHALLENGE then 
		gnNewDifficulty = getTextExpert()
	end

	return steps:GetMeter();
end


-- Song Directory
function SSMSongLocText( actor )
-- Trace( "SSMSongLocText" )
	local song = GAMESTATE:GetCurrentSong();
	local text = ""
	if song then
		local fulldir = song:GetSongDir();
		local short = string.sub(fulldir, 8, -2);
		local shorter = string.sub(short,1,5);

		if shorter == "n The" then
			short = "Memory Card"..string.sub(fulldir, 22, -2);
		end
		text = short
	end

	if actor then
		actor:settext( text )
	end
end


-- Custom More/Exit
function GetPlayersDone()
	gnTotalDone = gnTotalDone + 1;
	
	if (GAMESTATE:IsHumanPlayer(PLAYER_1) and GAMESTATE:IsHumanPlayer(PLAYER_2)) then
		if gnTotalDone == 0 then
			return "#BD5E5E"
		elseif gnTotalDone == 2 then
			return "#89B7D7"

		elseif gnTotalDone == 1 then
			return "#BD5E5E"
		end
	elseif gnTotalDone == 1 then
		return "#89B7D7"
	else
		return "#BD5E5E"
	end

	gnTotalDone = 0;	
	return "#BD5E5E"
end

function GetPlayersUndone()
	gnTotalDone = gnTotalDone + 1;
	
	if (GAMESTATE:IsHumanPlayer(PLAYER_1) and GAMESTATE:IsHumanPlayer(PLAYER_2)) then
		if gnTotalDone == 0 then
			return "#FFFFFF"
		elseif gnTotalDone == 2 then
			return "#89B7D7"
		elseif gnTotalDone == 1 then
			return "#BD5E5E"
		end
	elseif gnTotalDone == 1 then
		return "#89B7D7"
	else
		return "#FFFFFF"
	end

	gnTotalDone = 0;	
	return "#FFFFFF"
end


-- Step Artist P1
function GetStepsDescriptionText1( actor )
	-- Trace( "GetStepsDescriptionText1" )
	gnStepArtist = GAMESTATE:GetCurrentSteps(PLAYER_1)
	if gnStepArtist then
		gnStepArtist = GAMESTATE:GetCurrentSteps(PLAYER_1):GetDescription()
		if gnStepArtist == nil then
			actor:settext( '' )
		else
			if gnStepArtist == '' or gnStepArtist == '.' or gnStepArtist == 'Blank' then
				actor:settext('Unknown');
			else		
				actor:settext( gnStepArtist )
			end
		end
	else
		actor:settext('');
	end
end


-- Step Artist P2
function GetStepsDescriptionText2( actor )
	-- Trace( "GetStepsDescriptionText2" )
	gnStepArtist = GAMESTATE:GetCurrentSteps(PLAYER_2)
	if gnStepArtist then
		gnStepArtist = gnStepArtist:GetDescription()
		if gnStepArtist == nil then
			actor:settext( '' )
		else
			if gnStepArtist == '' or gnStepArtist == '.' or gnStepArtist == 'Blank' then
				actor:settext('Unknown');
			else
				actor:settext( gnStepArtist )
			end
		end
	else
		actor:settext('');
	end
end

-- TODO Clean Up and p2 only doesnt work
function IsPlayerProfileAvailable( pn )
	local statstype = PROFILEMAN:GetMachineProfile():GetSaved().gnPlayerStatsType
	if statstype == 0 or statstype == nil then
		if IsUsingMemoryCard( pn ) then 
			return true
		end
	elseif statstype == 1 then
		return true
	elseif statstype == 2 and pn == 0 then
		return true
	elseif statstype == 3 and pn == 1 then 
		return true
	elseif IsUsingMemoryCard ( pn ) then
		return true
	end
	return false
end

function gnGetProfile( pn )
	local statstype = PROFILEMAN:GetMachineProfile():GetSaved().gnPlayerStatsType 
	if statstype == 0 or statstype == nil or IsUsingMemoryCard( pn ) == true then
		return PROFILEMAN:GetProfile( pn )
	else
		return PROFILEMAN:GetMachineProfile()
	end
	return 0
end

-- All Stats Bundled into ONE because Arcade Machines HATE ME!!!
function GetPlayerStatsAndAwards( pn )
	local multi = { [0] = 10,8,7.5,7,6.5,6,5.5,5,4.5,4,3.5,3,2.5,2,1.5,1,1}
	gnLoadedP1 = false;
	gnLoadedP2 = false;

--Player 1
	if pn == PLAYER_1 then
		if gnScreenEvaluationFlag then
			gnScreenEvaluationFlag = false;
			return gnTotalP1
		end		
		gnStatFrequencyP1 = gnStatFrequencyP1 + 1;
		if gnStatFrequencyP1 >= getMaxStatFrequency() then
			gnStatFrequencyP1 = 0;
			gnSongsP1 = 0;
			gnSongsP1Total = 0;
			gnTotalP1 = 0;
			gnStarsTotalP1 = 0;
			gnSinglesSingleP1 = 0;
			gnDoublesSingleP1 = 0;
			gnTrisSingleP1 = 0;
			gnQuadsSingleP1 = 0;
			gnSinglesDoubleP1 = 0;
			gnDoublesDoubleP1 = 0;
			gnTrisDoubleP1 = 0;
			gnQuadsDoubleP1 = 0;

	-- PLAYER 1 SINGLE
			if not GAMESTATE:PlayerUsingBothSides(PLAYER_1) then
				for diff=0,5 do

					gnMultiplierP1 = 1+diff

					gnQuadsSingleP1 = gnQuadsSingleP1 + gnGetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,diff,GRADE_TIER01);
					gnTrisSingleP1 = gnTrisSingleP1 + gnGetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,diff,GRADE_TIER02);
					gnDoublesSingleP1 = gnDoublesSingleP1 + gnGetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,diff,GRADE_TIER03);
					gnSinglesSingleP1 = gnSinglesSingleP1 + gnGetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,diff,GRADE_TIER04);
								
					for i=0,16 do 
						gnSongsP1 = gnGetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,diff,i);
						gnTotalP1 = gnTotalP1 + gnMultiplierP1 * multi[i] * gnSongsP1
						gnSongsP1Total = gnSongsP1Total + gnSongsP1;
					end
				end
			end 

	-- PLAYER 1 DOUBLES
			if GAMESTATE:PlayerUsingBothSides(PLAYER_1) then			
				for diff=0,5 do

					gnMultiplierP1= 1+diff

					gnQuadsDoubleP1 = gnQuadsDoubleP1 + gnGetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,diff,GRADE_TIER01);
					gnTrisDoubleP1 = gnTrisDoubleP1 + gnGetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,diff,GRADE_TIER02);
					gnDoublesDoubleP1 = gnDoublesDoubleP1 + gnGetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,diff,GRADE_TIER03);
					gnSinglesDoubleP1 = gnSinglesDoubleP1 + gnGetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,diff,GRADE_TIER04);

					for i=0,16 do 
						gnSongsP1 = gnGetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,diff,i);
						gnTotalP1 = gnTotalP1 + gnMultiplierP1 * multi[i] * gnSongsP1
						gnSongsP1Total = gnSongsP1Total + gnSongsP1;
					end
				end
			end

			gnEXPMultiplier = 1;
                
    -- Songs Played Award
            gnSongsP1Total = gnSongsP1Total + gnSongsP1;
            if gnSongsP1Total >= 100 then
                gnEXPMultiplier = gnEXPMultiplier + 0.1;
            elseif gnSongsP1Total >= 500 then
                gnEXPMultiplier = gnEXPMultiplier + 0.2;
            elseif gnSongsP1Total >= 1000 then
                gnEXPMultiplier = gnEXPMultiplier + 0.3;
            end
            
    -- Star Award
            gnStarsTotalP1 = gnSinglesSingleP1 + (2*gnDoublesSingleP1) + (3*gnTrisSingleP1) + (4*gnQuadsSingleP1) + gnSinglesDoubleP1 + (2*gnDoublesDoubleP1) + (3*gnTrisDoubleP1) + (4*gnQuadsDoubleP1);
            if gnStarsTotalP1 >= 100 then
                gnEXPMultiplier = gnEXPMultiplier + 0.1;
            elseif gnStarsTotalP1 >= 500 then
                gnEXPMultiplier = gnEXPMultiplier + 0.2;
			elseif gnStarsTotalP1 >= 1000 then
                gnEXPMultiplier = gnEXPMultiplier + 0.3;
            end

    -- Death Award
            gnDeathsP1 = gnGetProfile(pn):GetTotalNumSongsPlayed();
            gnDeathsP1 = gnDeathsP1 - gnSongsP1Total
            
    -- Experience Points
            gnExpCurveP1 = 75;
            gnLevelP1 = 1;
            gnExperienceP1 = 0;
            gnCount = 0;
            gnTotalP1 = gnTotalP1 * gnEXPMultiplier;
    
            for gnCount = 1, 999, 1 do
                gnNewCurve = gnExperienceP1;
                gnExperienceP1 = gnExperienceP1 + (gnExpCurveP1 * math.pow(1.5,gnCount))
                if gnExperienceP1 <= gnTotalP1 then
                    gnLevelP1 = gnLevelP1 + 1;
                else
                    gnTotalP1 = gnTotalP1 - gnNewCurve;
                    gnNewCurve = gnExperienceP1 - gnNewCurve;
                    gnPercentageP1 = (gnTotalP1/gnNewCurve)*93
                    break
                end
            end
            gnLoadedP1 = false;
            return gnTotalP1
            end
        end


-- Player 2
	if pn == PLAYER_2 then
		if gnScreenEvaluationFlag then
			gnScreenEvaluationFlag = false;
			return gnTotalP2
		end
		gnStatFrequencyP2 = gnStatFrequencyP2 + 1;
		if gnStatFrequencyP2 >= getMaxStatFrequency() then
			gnStatFrequencyP2 = 0;
			gnSongsP2 = 0;
			gnSongsP2Total = 0;
			gnTotalP2 = 0;
			gnStarsTotalP2 = 0;
			gnSinglesSingleP2 = 0;
			gnDoublesSingleP2 = 0;
			gnTrisSingleP2 = 0;
			gnQuadsSingleP2 = 0;
			gnSinglesDoubleP2 = 0;
			gnDoublesDoubleP2 = 0;
			gnTrisDoubleP2 = 0;
			gnQuadsDoubleP2 = 0;

	-- Player 2 Singles
			if not GAMESTATE:PlayerUsingBothSides(PLAYER_2) then
				for diff=0,5 do

					gnMultiplierP2 = 1+diff

					gnQuadsSingleP2 = gnQuadsSingleP2 + gnGetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,diff,GRADE_TIER01);
					gnTrisSingleP2 = gnTrisSingleP2 + gnGetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,diff,GRADE_TIER02);
					gnDoublesSingleP2 = gnDoublesSingleP2 + gnGetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,diff,GRADE_TIER03);
					gnSinglesSingleP2 = gnSinglesSingleP2 + gnGetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,diff,GRADE_TIER04);

					for i=0,16 do 
						gnSongsP2 = gnGetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_SINGLE,diff,i);
						gnTotalP2 = gnTotalP2 + gnMultiplierP2 * multi[i] * gnSongsP2
						gnSongsP2Total = gnSongsP2Total + gnSongsP2;
					end
				end
			end

	-- PLAYER 2 DOUBLES
			if GAMESTATE:PlayerUsingBothSides(PLAYER_2) then
				for diff=0,5 do

					gnMultiplierP2 = 1+diff

					gnQuadsDoubleP2 = gnQuadsDoubleP2 + gnGetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,diff,GRADE_TIER01);
					gnTrisDoubleP2 = gnTrisDoubleP2 + gnGetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,diff,GRADE_TIER02);
					gnDoublesDoubleP2 = gnDoublesDoubleP2 + gnGetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,diff,GRADE_TIER03);
					gnSinglesDoubleP2 = gnSinglesDoubleP2 + gnGetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,diff,GRADE_TIER04);
								
					for i=0,16 do 
						gnSongsP2 = gnGetProfile(pn):GetTotalStepsWithTopGrade(STEPS_TYPE_DANCE_DOUBLE,diff,i);
						gnTotalP2 = gnTotalP2 + gnMultiplierP2 * multi[i] * gnSongsP2
						gnSongsP2Total = gnSongsP2Total + gnSongsP2;
					end
				end
			end

			gnEXPMultiplier = 1;
				
	-- Songs Played Award
			gnSongsP2Total = gnSongsP2Total + gnSongsP2;
			if gnSongsP2Total >= 100 then
				gnEXPMultiplier = gnEXPMultiplier + 0.1;
			elseif gnSongsP2Total >= 500 then
				gnEXPMultiplier = gnEXPMultiplier + 0.2;
			elseif gnSongsP2Total >= 1000 then
				gnEXPMultiplier = gnEXPMultiplier + 0.3;
			end
			
	-- Star Award
			gnStarsTotalP2 = gnSinglesSingleP2 + (2*gnDoublesSingleP2) + (3*gnTrisSingleP2) + (4*gnQuadsSingleP2) + gnSinglesDoubleP2 + (2*gnDoublesDoubleP2) + (3*gnTrisDoubleP2) + (4*gnQuadsDoubleP2);
			if gnStarsTotalP2 >= 100 then
				gnEXPMultiplier = gnEXPMultiplier + 0.1;
			elseif gnStarsTotalP2 >= 500 then
				gnEXPMultiplier = gnEXPMultiplier + 0.2;
			elseif gnStarsTotalP2 >= 1000 then
				gnEXPMultiplier = gnEXPMultiplier + 0.3;
			end
			
	-- Death Award
			gnDeathsP2 = gnGetProfile(pn):GetTotalNumSongsPlayed();
			gnDeathsP2 = gnDeathsP2 - gnSongsP2Total
			
	-- Experience Points
			gnExpCurveP2 = 75;
			gnLevelP2 = 1;
			gnExperienceP2 = 0;
			gnCount = 0;
			gnTotalP2 = gnTotalP2 * gnEXPMultiplier;
	
			for gnCount = 1, 999, 1 do
				gnNewCurve = gnExperienceP2;
				gnExperienceP2 = gnExperienceP2 + (gnExpCurveP2 * math.pow(1.5,gnCount))
				if gnExperienceP2 <= gnTotalP2 then
					gnLevelP2 = gnLevelP2 + 1;
				else
					gnTotalP2 = gnTotalP2 - gnNewCurve;
					gnNewCurve = gnExperienceP2 - gnNewCurve;
					gnPercentageP2 = (gnTotalP2/gnNewCurve)*93
					break
				end
			end
			gnLoadedP2 = false;
			return gnTotalP2
		end	
	end	
	return 'error'
end
	

-- ===CUSTOM AVATARS===
-- If the avatar script doesn't work for your game (or if it hasn't been released), you can add them manually here, you can also change the default
-- 'noavatar' image to reference something else (or you can just overwrite the image in the Graphics/NoAvatar/ folder.
-- Since you're here you can take a look at some of the custom name easter eggs I've added too...
function getNoAvatar( pn )
	if gnCustomBG == nil then gnCustomBG = 'No';

	elseif (pn+1) == 1 then
		gnP1ShowName = 0;
	elseif (pn+1) == 2 then
		gnP2ShowName = 0;
	elseif CheckSinglePlayerName('Mario',pn) or CheckSinglePlayerName('Super Mario',pn) then
		gnCustomBG = 'Mario';
		return 'MarioAvatar.png'
	elseif CheckSinglePlayerName('Luigi',pn) or CheckSinglePlayerName('Super Luigi',pn) then
		gnCustomBG = 'Luigi';
		return 'LuigiAvatar.png'
	elseif CheckSinglePlayerName('Yoshi',pn) or CheckSinglePlayerName('Yoshi the Dinosaur',pn) then
		gnCustomBG = 'Yoshi';
		return 'YoshiAvatar.png'
	elseif CheckSinglePlayerName('Bowser',pn) or CheckSinglePlayerName('King Koopa',pn) then
		gnCustomBG = 'No';
		return 'BowserAvatar.png'
	elseif CheckSinglePlayerName('Sonic',pn) or CheckSinglePlayerName('Sonic the Hedgehog',pn) then
		gnCustomBG = 'Sonic';
		return 'SonicAvatar.png'
	elseif CheckSinglePlayerName('Tails',pn) or CheckSinglePlayerName('Tails Prower',pn) then
		gnCustomBG = 'Tails';
		return 'TailsAvatar.png'
	elseif CheckSinglePlayerName('Knuckles',pn) or CheckSinglePlayerName('Knuckles the Echidna',pn) then
		gnCustomBG = 'Knuckles';
		return 'KnucklesAvatar.png'
	elseif CheckSinglePlayerName('Eggman',pn) or CheckSinglePlayerName('Dr Eggman',pn) or CheckSinglePlayerName('Robotnik',pn) or CheckSinglePlayerName('Dr Robotnik',pn) then
		gnCustomBG = 'No';
		return 'EggmanAvatar.png'
	elseif CheckSinglePlayerName('DK',pn) or CheckSinglePlayerName('Donkey Kong',pn) then
		gnCustomBG = 'DK';
		return 'DKAvatar.png'
	elseif CheckSinglePlayerName('Diddy',pn) or CheckSinglePlayerName('Diddy Kong',pn) then
		gnCustomBG = 'Diddy';
		return 'DiddyAvatar.png'
	elseif CheckSinglePlayerName('Dixie',pn) or CheckSinglePlayerName('Dixie Kong',pn) then
		gnCustomBG = 'Dixie';
		return 'DixieAvatar.png'
	elseif CheckSinglePlayerName('K Rool',pn) or CheckSinglePlayerName('King K Rool',pn) or CheckSinglePlayerName('Kaptain K Rool',pn) then
		gnCustomBG = 'No';
		return 'KRoolAvatar.png'
	elseif CheckSinglePlayerName('Enguarde',pn) or CheckSinglePlayerName('Enguarde the Swordfish',pn) or CheckSinglePlayerName('Swordfish',pn) then
		gnCustomBG = 'No';
		return 'EnguardeAvatar.png'
	elseif CheckSinglePlayerName('Rambi',pn) or CheckSinglePlayerName('Rambi the Rhino',pn) or CheckSinglePlayerName('Rhino',pn) then
		gnCustomBG = 'No';
		return 'RambiAvatar.png'
	elseif CheckSinglePlayerName('Winky',pn) or CheckSinglePlayerName('Winky the Frog',pn) or CheckSinglePlayerName('Frog',pn) then
		gnCustomBG = 'No';
		return 'WinkyAvatar.png'
	elseif CheckSinglePlayerName('Expresso',pn) or CheckSinglePlayerName('Expresso the Ostrich',pn) or CheckSinglePlayerName('Ostrich',pn) then
		gnCustomBG = 'No';
		return 'ExpressoAvatar.png'
	elseif CheckSinglePlayerName('Zinger',pn) or CheckSinglePlayerName('Wasp',pn) or CheckSinglePlayerName('Bee',pn) then
		gnCustomBG = 'No';
		return 'ZingerAvatar.png'
	elseif CheckSinglePlayerName('Bomberman',pn) or CheckSinglePlayerName('Bomb',pn) or CheckSinglePlayerName('Hudson',pn) then
		gnCustomBG = 'No';
		return 'BombermanAvatar.png'
	elseif CheckSinglePlayerName('Kirby',pn) or CheckSinglePlayerName('Pink',pn) or CheckSinglePlayerName('Ball',pn) then
		gnCustomBG = 'Kirby';
		return 'KirbyAvatar.png'
	elseif CheckSinglePlayerName('Metaknight',pn) or CheckSinglePlayerName('Blue',pn) or CheckSinglePlayerName('Wing',pn) then
		gnCustomBG = 'Metaknight';
		return 'MetaknightAvatar.png'
	elseif CheckSinglePlayerName('Dedede',pn) or CheckSinglePlayerName('King Dedede',pn) or CheckSinglePlayerName('Penguin',pn) then
		gnCustomBG = 'No';
		return 'DededeAvatar.png'
	elseif CheckSinglePlayerName('Poppy Bros',pn) or CheckSinglePlayerName('Poppy Bros Jr',pn) or CheckSinglePlayerName('Banana',pn) then
		gnCustomBG = 'No';
		return 'PoppyBrosAvatar.png'
	elseif CheckSinglePlayerName('Megaman',pn) or CheckSinglePlayerName('X',pn) then
		gnCustomBG = 'Megaman';
		return 'MegamanAvatar.png'
	elseif CheckSinglePlayerName('Zero',pn) or CheckSinglePlayerName('0',pn) then
		gnCustomBG = 'Zero';
		return 'ZeroAvatar.png'
	elseif CheckSinglePlayerName('Twilight',pn) or CheckSinglePlayerName('Twilight Sparkle',pn) or CheckSinglePlayerName('Magic',pn)  then
		gnCustomBG = 'Twilight';
		return 'TwilightAvatar.png'
	elseif CheckSinglePlayerName('Rainbow',pn) or CheckSinglePlayerName('Rainbow Dash',pn) or CheckSinglePlayerName('Dashie',pn) then
		gnCustomBG = 'Rainbow';
		return 'RainbowAvatar.png'
	elseif CheckSinglePlayerName('Pinkie',pn) or CheckSinglePlayerName('Pinkie Pie',pn) or CheckSinglePlayerName('Pinkamena',pn) or CheckSinglePlayerName('Balloons',pn) then
		gnCustomBG = 'Pinkie';
		return 'PinkieAvatar.png'
	elseif CheckSinglePlayerName('Applejack',pn) or CheckSinglePlayerName('AJ',pn) or CheckSinglePlayerName('Apples',pn) then
		gnCustomBG = 'Applejack';
		return 'ApplejackAvatar.png'
	elseif CheckSinglePlayerName('Rarity',pn) or CheckSinglePlayerName('Spikey Wikey',pn) then
		gnCustomBG = 'Rarity';
		return 'RarityAvatar.png'
	elseif CheckSinglePlayerName('Fluttershy',pn) or CheckSinglePlayerName('Flooter Shy',pn) or CheckSinglePlayerName('Butterflies',pn) then
		gnCustomBG = 'Fluttershy';
		return 'FluttershyAvatar.png'
	elseif CheckSinglePlayerName('Daring Do',pn) or CheckSinglePlayerName('Indiana Jones',pn) or CheckSinglePlayerName('Dungeon',pn) then
		gnCustomBG = 'No';
		return 'DaringDoAvatar.png'
	elseif CheckSinglePlayerName('Octavia',pn) or CheckSinglePlayerName('Cello',pn) or CheckSinglePlayerName('Classical',pn) then
		gnCustomBG = 'No';
		return 'OctaviaAvatar.png'
	elseif CheckSinglePlayerName('Vinyl Scratch',pn) or CheckSinglePlayerName('DJ Pon-3',pn) or CheckSinglePlayerName('DJ',pn) then
		gnCustomBG = 'No';
		return 'ScratchAvatar.png'
	elseif CheckSinglePlayerName('Gummy',pn) or CheckSinglePlayerName('No Teeth',pn) or CheckSinglePlayerName('Alligator',pn) then
		gnCustomBG = 'No';
		return 'GummyAvatar.png'
	elseif CheckSinglePlayerName('Spike',pn) or CheckSinglePlayerName('<3 Rarity',pn) or CheckSinglePlayerName('Gems',pn) then
		gnCustomBG = 'No';
		return 'SpikeAvatar.png'
	elseif CheckSinglePlayerName('Celestia',pn) or CheckSinglePlayerName('Sun',pn) or CheckSinglePlayerName('Cake',pn) then
		gnCustomBG = 'No';
		return 'CelestiaAvatar.png'
	elseif CheckSinglePlayerName('Luna',pn) or CheckSinglePlayerName('Moon',pn) or CheckSinglePlayerName('Nightmare Moon',pn) then
		gnCustomBG = 'No';
		return 'LunaAvatar.png'
	elseif CheckSinglePlayerName('Derpy',pn) or CheckSinglePlayerName('Ditzy',pn) or CheckSinglePlayerName('Muffin',pn) then
		gnCustomBG = 'No';
		return 'DerpyAvatar.png'
	elseif CheckSinglePlayerName('(-[Jayce]-)',pn) or CheckSinglePlayerName('JCE',pn) then
		gnCustomBG = 'No';
		return 'JayceAvatar.png'
	elseif CheckSinglePlayerName('ROFLSTOMPZ',pn) or CheckSinglePlayerName('ROFL',pn) then
		gnCustomBG = 'No';
		return 'ROFLAvatar.png'
	elseif CheckSinglePlayerName('Cameron',pn) or CheckSinglePlayerName('CAM',pn) then
		gnCustomBG = 'No';
		return 'CameronAvatar.png'
	elseif CheckSinglePlayerName('Brendan',pn) or CheckSinglePlayerName('*~falkieee~*',pn) then
		gnCustomBG = 'No';
		return 'BrendanAvatar.png'
	elseif CheckSinglePlayerName('COW9',pn) or CheckSinglePlayerName('ACOW',pn) then
		gnCustomBG = 'No';
		return 'JamesAvatar.png'
	elseif CheckSinglePlayerName('StarUndrscre',pn) then
		gnCustomBG = 'No';
		return 'StarUndrscreAvatar.png'
	elseif GAMESTATE:GetEnv('Konami') == 'On' then
		gnCustomBG = 'KonamiCode';
		return 'KonamiAvatar.png'
	elseif (pn+1) == 1 then
		gnP1ShowName = 1;
	elseif (pn+1) == 2 then
		gnP2ShowName = 1;
	end

	return 'p'..(pn+1)..'noavatar.png'				-- This is the default 'noavatar' graphic for each player
end


-- ===CUSTOM BACKGROUNDS===
-- This scripts works with the custom avatar script above, you can set a background that will appear above the song
-- background but under the hide background mod.
function getNoBackground()
	if gnCustomBG == nil then gnCustomBG = 'No'; end
	return gnCustomBG
end


-- More Easter Eggs, I thought they'd be fun or something
function EasterEggSanta()
	if GAMESTATE:GetEnv('Santa') == 'On' or CheckPlayerName('Santa') or CheckPlayerName('Santa Claus') or CheckPlayerName('Christmas') or CheckPlayerName('Xmas') then
		return true
	end
	return false
end

function EasterEggFrost()
	if GAMESTATE:GetEnv('Frost') == 'On' or CheckPlayerName('Frost') or CheckPlayerName('Frozen') or CheckPlayerName('Ice') or CheckPlayerName('Glacier') then
		return true
	end
	return false
end

function EasterEggBlizzard()
	if GAMESTATE:GetEnv('Blizzard') == 'On' or CheckPlayerName('Blizzard') or CheckPlayerName('Snow') then
		return true
	end
	return false
end

function EasterEggSummerRain()
	if GAMESTATE:GetEnv('Rain') == 'On' or CheckPlayerName('Summer') or CheckPlayerName('Rain') or CheckPlayerName('Summer Rain') then
		return true
	end
	return false
end
