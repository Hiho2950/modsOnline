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

function onUpdate(elapsed) {
    if (curStep == 520 || curStep == 928 || curStep == 1440) {
        game.modchartSprites.get("BGSans").animation.play("bg2");
    }
    if (curStep == 768 || curStep == 1184) {
        game.modchartSprites.get("BGSans").animation.play("bg1");
    }
}

function onCreatePost() {
    addnullSprite("healthBarP2", game.healthBar.x, game.healthBar.y - 6.6);
    game.modchartSprites.get("healthBarP2").cameras = [game.camHUD];
    game.modchartSprites.get("healthBarP2").makeGraphic(game.healthBar.width,game.healthBar.height, 0xFFFF0000);
    insert(4, game.modchartSprites.get("healthBarP2"));

    addnullSprite("healthBarP1", game.healthBar.x, game.healthBar.y - 6.6);
    game.modchartSprites.get("healthBarP1").cameras = [game.camHUD];
    game.modchartSprites.get("healthBarP1").makeGraphic(game.healthBar.width / 2,game.healthBar.height, 0xFFFFFF00);
    insert(5, game.modchartSprites.get("healthBarP1"));
}

function onUpdate() {
    game.modchartSprites.get("healthBarP2").x = game.healthBar.x;
    game.modchartSprites.get("healthBarP2").y = game.healthBar.y - 6.6;
    game.modchartSprites.get("healthBarP1").x = game.healthBar.x;
    game.modchartSprites.get("healthBarP1").y = game.healthBar.y - 6.6;

    if (game.health <= 2) {
        game.modchartSprites.get("healthBarP2").scale.set(game.health, game.healthBar.scale.y);
        game.modchartSprites.get("healthBarP1").scale.set(game.healthBar.scale.x, game.healthBar.y);
    }

    game.modchartSprites.get("healthBarP2").width = game.healthBar.width;
    game.modchartSprites.get("healthBarP2").height = game.healthBar.height;

    game.iconP1.alpha = 0;
    game.iconP2.alpha = 0;
    game.healthBar.flipX = true;
}