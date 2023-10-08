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
    if (note.noteType == "blue") game.health -= 0.4;
}

function noteMiss(note) {
    if (note.noteType == "orange") game.health -= 0.4;
}

function onEvent(name,value1,value2) {
    if (name == "Smooth cam zoom") {
        if (value2 == "") game.defaultCamZoom = value1;
        else {
            FlxTween.tween(game.camGame, {zoom: value1}, value2, {ease: FlxEase.sineInOut,
				onComplete: function(twn:FlxTween) {
					game.defaultCamZoom = game.camGame.zoom;
				}
			});
        }
    }
}