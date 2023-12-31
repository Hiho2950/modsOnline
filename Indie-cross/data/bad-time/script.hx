import flixel.ui.FlxBar;
import flixel.ui.FlxBar.FlxBarFillDirection;

function onSpawnNote(note) {
    if (note.noteType == "BlueBoneNote") {
        note.ignoreNote = true;
        note.rgbShader.r = 0xFF000000;
        note.rgbShader.g = 0xFF0000FF;
        note.rgbShader.b = 0xFF0000FF;
    }
    if (note.noteType == "OrangeBoneNote") {
        note.ignoreNote = false;
        note.rgbShader.r = 0xFF000000;
        note.rgbShader.g = 0xFFFFA500;
        note.rgbShader.b = 0xFFFFA500;
    }
}

function goodNoteHit(note) {
    if (note.noteType == "BlueBoneNote") game.health -= 0.4;
}

function noteMiss(note) {
    if (note.noteType == "OrangeBoneNote") game.health -= 0.4;
}

function opponentNoteHit() {
    game.camGame.shake(0.015,0.1);
    game.camHUD.shake(0.005,0.1);
}

function goodNoteHit(i){
    game.playerStrums.members[i.noteData].rgbShader.r = i.rgbShader.r;
    game.playerStrums.members[i.noteData].rgbShader.b = i.rgbShader.b;
}

function opponentNoteHit(i){
    game.opponentStrums.members[i.noteData].rgbShader.r = i.rgbShader.r;
    game.opponentStrums.members[i.noteData].rgbShader.b = i.rgbShader.b;
}

function onUpdate(elapsed) {
    if (curStep == 520 || curStep == 928 || curStep == 1440) {
        game.modchartSprites.get("BGSans").animation.play("bg2");
    }
    if (curStep == 768 || curStep == 1184) {
        game.modchartSprites.get("BGSans").animation.play("bg1");
    }
}
importLibrary("flixel.ui.FlxBar");
importLibrary("flixel.ui.FlxBar.FlxBarFillDirection");
var bar = new FlxBar(100, 100, null, 720, 50, null, "", 0, 2, false);
function onCreatePost() {
    bar.cameras = [game.camHUD];
    bar.createFilledBar(0xFFFF0000, 0xFFFFFF00);
    insert(4, bar);
}
function onUpdate() {
    bar.value = game.health;
    game.iconP1.alpha = 0;
    game.iconP2.alpha = 0;
    game.healthBar.alpha = 0;
}
