function onSongStart() {
    for (note in game.unspawnNotes) {
        if (note.noteType == "BlueBoneNote") {
            note.ignoreNote = true;
            note.r = FlxColor.fromString('#FFFFFF');
            note.g = FlxColor.fromString('#0000FF');
            note.b = FlxColor.fromString('#0000FF');
        }
        if (note.noteType == "OrangeBoneNote") {
            note.ignoreNote = false;
            note.r = FlxColor.fromString('#FFFFFF');
            note.g = FlxColor.fromString('#FFA500');
            note.b = FlxColor.fromString('#FFA500');
        }
    }
}

function goodNoteHit(note) {
    if (note.noteType == "BlueBoneNote") game.health -= 0.4;
}

function noteMiss(note) {
    if (note.noteType == "OrangeBoneNote") game.health -= 0.4;
}