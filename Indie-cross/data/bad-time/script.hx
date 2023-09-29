function opponentNoteHit() {
    for (i in game.unspawnNotes.length -1) {
        if (game.unspawnNotes[i].noteType == "BlueBoneNote") {
            game.unspawnNotes[i].unspawnNotes[i].ignoreNote = true;
            game.unspawnNotes[i].r = 0xFFFFFFFF;
            game.unspawnNotes[i].g = 0xFF0000FF;
            game.unspawnNotes[i].b = 0xFF0000FF;
        }
        if (game.unspawnNotes[i].noteType == "OrangeBoneNote") {
            game.unspawnNotes[i].ignoreNote = false;
            game.unspawnNotes[i].r = 0xFFFFFFFF;
            game.unspawnNotes[i].g = 0xFFFFA500;
            game.unspawnNotes[i].b = 0xFFFFA500;
        }
    }
}

function goodNoteHit(note) {
    if (note.noteType == "BlueBoneNote") game.health -= 0.4;
}

function noteMiss(note) {
    if (note.noteType == "OrangeBoneNote") game.health -= 0.4;
}