import flixel.group.FlxSpriteGroup;
import flixel.FlxSprite;

function onCreate() {
    var sky = new FlxSprite(-300, -60);
    setSpriteImage(sky, "BG1");
    sky.scrollFactor.set(0.5,0.5);
    sky.scale.set(0.5, 0.5);

    var floor2 = new FlxSprite(-300, -120);
    setSpriteImage(floor2, "BG2");
    floor2.scrollFactor.set(0.75,0.75);
    floor2.scale.set(0.5, 0.5);

    var mini = new FlxSprite(860,220);
    setAnimatedSpriteImage(mini, "mini");
    mini.animation.addByPrefix("sit", "mini", 24, true);
    mini.playAnim("sit");
    mini.scrollFactor.set(0.75,0.75);
    mini.scale.set(0.5, 0.5);

    var blu = new FlxSprite(60,240);
    setAnimatedSpriteImage(blu, "bluskystv");
    blu.animation.addByPrefix("walk", "bluskystv", 24, true);
    blu.playAnim("walk");
    blu.scrollFactor.set(0.75,0.75);
    blu.scale.set(0.5, 0.5);

    var floor1 = new FlxSprite(60,240);
    setSpriteImage(floor1, "BGNight");
    floor1.scrollFactor.set(0.75,0.75);
    floor1.scale.set(0.5, 0.5);

    add(sky);
    add(floor2);
    add(blu);
    add(mini);
    add(floor1);
}
function onSongStart() {
    boyfriend.x = 950;
    boyfriend.y = 270;
    gf.x = 990;
    gf.y = 240;
    dad.x = 150;
    dad.y = 189;
    remove(gf);
}

function getLowestCharacterGroup()
{
    var group:FlxSpriteGroup = game.gfGroup;
    var pos:Int = game.members.indexOf(group);

    var newPos:Int = game.members.indexOf(PlayState.instance.boyfriendGroup);
    if(newPos < pos)
    {
        group = game.boyfriendGroup;
        pos = newPos;
    }
    
    newPos = game.members.indexOf(game.dadGroup);
    if(newPos < pos)
    {
        group = game.dadGroup;
        pos = newPos;
    }
    return group;
}