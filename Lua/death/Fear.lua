local fear = {}

-- function fear:Setup()
--     self(1):cmd("stretchto,0,0,SCREEN_WIDTH,SCREEN_HEIGHT;diffuse,1,0,0,0")
--     self(2):cmd("xy,SCREEN_CENTER_X,SCREEN_CENTER_Y;align,.5,.5;scaletofit,SCREEN_CENTER_X*.25,SCREEN_CENTER_Y*.25,SCREEN_CENTER_X*1.75,SCREEN_CENTER_Y*1.75;diffusealpha,0")
-- end

-- function fear:Dead()
--     GAMESTATE:ApplyGameCommand('sound,fear')
--     --self(1):cmd("diffusealpha,.7;linear,.4;diffusealpha,0;")
--     self(2):cmd("diffusealpha,1;linear,1;diffusealpha,0;")
-- end

function fear:Setup()
    self(1):cmd("stretchto,0,0,SCREEN_WIDTH,SCREEN_HEIGHT;diffuse,1,0,0,0;diffusealpha,0")
    self(2):cmd("diffusealpha,0")
end

function fear:Dead()
    -- self(1):cmd("sleep,.1212;diffusealpha,.7;linear,.277;diffusealpha,.5;diffusealpha,0;") --.336
    math.randomseed(math.random() * 1000000 + Second() * Hour() * DayOfYear()) -- this is jank
    self(2):Load(Path('Graphics', '_deathFear/_' .. math.random(1, 7)))
    self(2):cmd("xy,SCREEN_CENTER_X,SCREEN_CENTER_Y;align,.5,.5;scaletofit,SCREEN_CENTER_X*.25,SCREEN_CENTER_Y*.25,SCREEN_CENTER_X*1.75,SCREEN_CENTER_Y*1.75;diffusealpha,0")
    GAMESTATE:ApplyGameCommand('sound,fear')
    self(2):cmd("sleep,.1212;diffusealpha,1;sleep,.277;linear,1;diffusealpha,0;")
    local deathmsg = {
        'yikes, that\'s gotta hurt',
        'cry',
        'run it back bro. cmon',
        'dkjslfglkjsdhgslkjfdhg',
        'i seem to be seriously wounded',
        'the holds went crazy at the end..........',
        'damb',
        'excuse me! i\'m in need of medical attention!',
        'that\'s not freeman, is it?',
        'https://starundrscre.gay/death',
        'https://starundrscre.gay/death',
        'https://starundrscre.gay/death'
    }
    math.randomseed(math.random() * 1000000 + Second() * Hour() * DayOfYear())
    local deat = deathmsg[math.random(1, #deathmsg)]
    SCREENMAN:SystemMessage(deat)
end

return fear