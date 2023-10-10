import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

function onSpawnNote(note) {
    if (note.noteType == "blue") {
        note.ignoreNote = true;
        note.rgbShader.r = 0xFF000000;
        note.rgbShader.g = 0xFF0000FF;
        note.rgbShader.b = 0xFF0000FF;
    }
    if (note.noteType == "orange") {
        note.ignoreNote = false;
        note.rgbShader.r = 0xFF000000;
        note.rgbShader.g = 0xFFFFA500;
        note.rgbShader.b = 0xFFFFA500;
    }
}

function goodNoteHit(note) {
    if (note.noteType == "blue" && !note.isSustainNote) game.health -= 0.4;
}

function noteMiss(note) {
    if (note.noteType == "orange" && !note.isSustainNote) game.health -= 0.4;
}

function onEvent(name,valuef,values) {
    if (name == "Smooth cam zoom") {
        if (value2 == "") game.defaultCamZoom = valuef;
        else {
            FlxTween.tween(game.camGame, {zoom: valuef}, values, {ease: FlxEase.sineInOut,
				onComplete: function(twn:FlxTween) {
					game.defaultCamZoom = game.camGame.zoom;
				}
			});
        }
    }
	if (name == 'Blackout') {
		game.camGame.flash(CoolUtil.colorFromString(valuef), values, null,true);
        game.camHUD.flash(CoolUtil.colorFromString(valuef), values, null,true);
    }
}

function onBeatHit() {
    game.camGame.flash(0xFF000000, 0.3, null,true);
    game.camHUD.flash(0xFF000000, 0.1, null,true);
}