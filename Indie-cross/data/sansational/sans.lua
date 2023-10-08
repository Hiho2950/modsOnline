local DodgedOrange = false;
local canDodgeOrange = false;
local Dodged = false;
local canDodge = false;
local mecha = true
function onCreate()

    makeAnimatedLuaSprite('woo', 'characters/Sans', getProperty('dad.x'),getProperty('dad.y'));
    luaSpriteAddAnimationByPrefix('woo','yeet','Switch to UT mode instance 1',24,false)
    addLuaSprite('woo', true); 

    addCharacterToList('sans-21','dad')
    addCharacterToList('bf-sans-2','boyfriend')
	precacheImage('sansa/DodgeMechs');
    makeAnimatedLuaSprite('dodgebutton', 'sansa/Notmobilegameanymore',  -30, 300);
	setProperty('dodgebutton.scale.x', 0.4)
	setProperty('dodgebutton.scale.y', 0.4)
	setObjectCamera('dodgebutton', 'hud')
	addAnimationByPrefix('dodgebutton', 'dodge', 'Dodge instance 1', 24, false);
	addAnimationByPrefix('dodgebutton', 'dodgeclick', 'Dodge click instance 1', 24, false);
	addLuaSprite('dodgebutton', true)

	makeAnimatedLuaSprite('attackbutton', 'sansa/Notmobilegameanymore',  -30, getProperty('dodgebutton.y') - 50);
	setProperty('attackbutton.scale.x', 0.4)
	setProperty('attackbutton.scale.y', 0.4)
	setObjectCamera('attackbutton', 'hud')
	addAnimationByPrefix('attackbutton', 'attack', 'Attack instance 1', 24, false);
	addAnimationByPrefix('attackbutton', 'attackclick', 'Attack Click instance 1', 24, false);
    addAnimationByPrefix('attackbutton', 'attackcool', 'AttackNA instance', 24, false);
	objectPlayAnimation('attackbutton', 'attack')
	addLuaSprite('attackbutton', false)

	setProperty('attackbutton.alpha', 0)
	setProperty('dodgebutton.alpha', 0.5)
    makeAnimatedLuaSprite('bfattack','characters/BoyFriend_CRshader',540,300)
    luaSpriteAddAnimationByPrefix('bfattack','attack','0BF attack instance',24,false)
    addLuaSprite('bfattack',false)
    setProperty('bfattack.alpha',0)
    objectPlayAnimation('bfattack','attack',false)
end
function onCreatePost()
    setProperty('woo.offset.x',16)
    setProperty('woo.offset.y',-239)
	setProperty('healthBar.flipX',true)
    setProperty('woo.alpha',0)
end
local canattack = true
local attacked = false
function heh()
    makeAnimatedLuaSprite('bones','characters/Sans',getProperty('dad.x')-80,getProperty('dad.y')+190)
    luaSpriteAddAnimationByPrefix('bones','dodge','SansDodge instance',20,false)
    addLuaSprite('bones',true)
    setProperty('bones.alpha',0)
    setProperty('dad.alpha',0)
end
function shit()
    makeAnimatedLuaSprite('Dodge Mechanics NM', 'sansa/DodgeMechs', 450, 200);
    makeAnimatedLuaSprite('bfbone','sansa/DodgeMechs',540,300)
    luaSpriteAddAnimationByPrefix('bfbone','dodge','Dodge instance 1',20,false)
    luaSpriteAddAnimationByPrefix('Dodge Mechanics NM', 'Warning', 'Alarm instance 1', 20, false);
    luaSpriteAddAnimationByPrefix('Dodge Mechanics NM', 'Attack', 'Bones boi instance 1', 20, false);
    addLuaSprite('Dodge Mechanics NM', true); 
    addLuaSprite('bfbone',true)
    setProperty('bfbone.alpha',0)
    objectPlayAnimation('Dodge Mechanics NM','Warning',true)
end
local attacktime = 0
local genocide = false
local theman = false
real = 0
function onUpdate(elapsed)
    real = real + elapsed
if theman then
    setProperty('boyfriend.x',180)
    setProperty('boyfriend.y',180 + math.cos(real*1.5) * 30)
end
end
function onUpdatePost()
    if not genocide then
        for i=0, getProperty('notes.length')-1 do
            if getPropertyFromGroup('notes', i, 'noteType') == 'blue' then
                setPropertyFromGroup('notes', i, 'x', 99999)
            end
            if getPropertyFromGroup('notes', i, 'noteType') == 'orange' then
                setPropertyFromGroup('notes', i, 'texture', 'NOTE_assets')
                setPropertyFromGroup('notes', i, 'ignoreNote', true)
            end
        end
    end
    if attacktime == 0 then
        attacktime = 69
       genocide = true
       playSound('genocide',0)
    end
    bla = getRandomInt(1,3)
    if canattack == true and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SHIFT') then  
        if mecha then
		attacked = true;
        canattack = false
        attacktime = attacktime + 1
		playSound('Throw'..bla, 1)
        playSound('dodge', 1)
		objectPlayAnimation('bfattack','attack',true)
        setProperty('boyfriend.alpha',0)
        setProperty('bfattack.alpha',1)
		objectPlayAnimation('attackbutton', 'attackclick')
        setProperty('bfattack.offset.x',1070)
        setProperty('bfattack.offset.y',-20)
        heh()
        setProperty('bones.alpha',1)
        objectPlayAnimation('attackbutton', 'attackcool')
        end
    end
	if canDodge == true and keyJustPressed('space') then
        if mecha then
        Dodged = true;
        canDodge = false
        setProperty('bfbone.alpha',1)
        setProperty('boyfriend.visible',false)
        objectPlayAnimation('bfbone','dodge',true)
        --doTweenY('bfbonee','bfbone',320,1,'sineOut')
        end
    end

    if getProperty('bfbone.animation.curAnim.name') == 'dodge' then
        if getProperty('bfbone.animation.curAnim.finished') then
            setProperty('boyfriend.visible',true)        
            setProperty('bfbone.alpha',0)
        end
    end

    if getProperty('bones.animation.curAnim.name') == 'dodge' then
        if getProperty('bones.animation.curAnim.finished') then
            setProperty('bones.alpha',0)
            setProperty('dad.alpha',1)
        end
    end
    if getProperty('bfattack.animation.curAnim.name') == 'attack' then
        if getProperty('bfattack.animation.curAnim.finished') then
            setProperty('bfattack.alpha',0)
            setProperty('boyfriend.alpha',1)
        end
    end
    if getProperty('Dodge Mechanics NM.animation.curAnim.name') == 'Warning' then
        if getProperty('Dodge Mechanics NM.animation.curAnim.finished') then
            playSound('sansattack', 1);
            objectPlayAnimation('Dodge Mechanics NM','Attack',true)
            runTimer('lol',0.3)
        end
    end
    if getProperty('Dodge Mechanics NM.animation.curAnim.name') == 'Attack' then
        if getProperty('Dodge Mechanics NM.animation.curAnim.finished') then
            removeLuaSprite('Dodge Mechanics NM',false)
        end
    end
    
    if getProperty('attackbutton.animation.curAnim.name') == 'attackclick' then
        if getProperty('attackbutton.animation.curAnim.finished') then
        objectPlayAnimation('attackbutton', 'attack')
        end
    end

    if getProperty('attackbutton.animation.curAnim.name') == 'attackcool' then
        if getProperty('attackbutton.animation.curAnim.finished') then
        canattack = true
        objectPlayAnimation('attackbutton', 'attack')
        end
    end

	if getProperty('dodgebutton.animation.curAnim.name') == 'dodgeclick' then
        if getProperty('dodgebutton.animation.curAnim.finished') then
        objectPlayAnimation('dodgebutton', 'dodge')
        end
    end
    
end

function onEvent(name, value1, value2)
    if name == 'are you gay' then
        shit()
        canDodge = true;
        playSound('notice',0.6)
        runTimer('di',1)
    end
        if name == 'Play Animation' then 
            if value1 == '2' then
                if genocide == true then
                    runTimer('sike',1)
                    setProperty('dad.visible',false)
                    setProperty('woo.alpha',1)
                    objectPlayAnimation('woo','yeet',true)
            else
                mecha = false
                setProperty('attackbutton.alpha',0)
                setProperty('dodgebutton.alpha',0)
            end
        end
            if value1 == '1' then
                setProperty('stage.visible', true);
                setProperty('stage2.visible', false);
            end
        end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'sike' then
        theman = true
        setProperty('dad.visible',true)
        setProperty('woo.alpha',0)
        setProperty('stage.visible', false);
        setProperty('stage2.visible', true);
        triggerEvent('Change Character','dad','sans-21')
        triggerEvent('Change Character','BF','bf-sans-2')
        setProperty("defaultCamZoom",0.34)
    end
    if tag == 'di' then
        if not Dodged then
            setProperty('health',0)
        end
    end
    if tag == 'lol' then
        objectPlayAnimation('dodgebutton', 'dodgeclick')
    end
end

