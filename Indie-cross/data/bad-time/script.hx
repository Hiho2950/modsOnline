function onCreate() {
    for (note in game.unspawnNotes) {
        if (note.noteType == "BlueBoneNote") {
            note.ignoreNote = true;
            note.r = 0xFFFFFFFF;
            note.g = 0xFF0000FF;
            note.b = 0xFF0000FF;
        }
        if (note.noteType == "OrangeBoneNote") {
            note.ignoreNote = false;
            note.r = 0xFFFFFFFF;
            note.g = 0xFFFFA500;
            note.b = 0xFFFFA500;
        }
    }
}

function goodNoteHit(note) {
    if (note.noteType == "BlueBoneNote") geme.health -= 0.4;
}

function noteMiss(note) {
    if (note.noteType == "OrangeBoneNote") geme.health -= 0.4;
}