import flixel.group.FlxSpriteGroup;
import flixel.FlxSprite;

function onCreate() {
    var sky = new FlxSprite(-300, -60);
    setSpriteImage(sky, "BG1");
    sky.scrollFactor.set(0.5,0.5);
    sky.scale.set(0.5, 0.5);

    add(sky);

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

    var newPos:Int = game.members.indexOf(game.boyfriendGroup);
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