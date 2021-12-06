function create() {
    var bfSprite = "Week 7:bf-holding-gf";
    var tex = Paths.getCharacter(bfSprite);
    character.frames = tex;
    character.animation.addByPrefix('idle', 'BF idle dance', 24, false);
    character.animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
    character.animation.addByPrefix('singLEFT', 'BF NOTE RIGHT0', 24, false);
    character.animation.addByPrefix('singRIGHT', 'BF NOTE LEFT0', 24, false);
    character.animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
    character.animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
    character.animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
    character.animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
    character.animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
    character.animation.addByPrefix('hey', 'BF HEY', 24, false);
    character.animation.addByPrefix('singDODGE', 'boyfriend dodge', 24, false);
    character.animation.addByPrefix('hit', 'BF hit', 24, false);

    character.animation.addByPrefix('firstDeath', "BF dies", 24, false);
    character.animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
    character.animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);

    character.animation.addByPrefix('scared', 'BF idle shaking', 24);

    character.addOffset('idle', -5);
    character.addOffset("singUP", -29, 10);
    character.addOffset("singRIGHT", -41, 23);
    character.addOffset("singLEFT", 12, 7);
    character.addOffset("singDOWN", -10, -10);
    character.addOffset("singUPmiss", -29, 10);
    character.addOffset("singRIGHTmiss", -41, 23);
    character.addOffset("singLEFTmiss", 12, 7);
    character.addOffset("singDOWNmiss", -10, -10);
    character.addOffset("hey", 7, 4);
    character.addOffset('firstDeath', 37, 11);
    character.addOffset('deathLoop', 37, 5);
    character.addOffset('deathConfirm', 37, 69);
    character.addOffset('scared', -4);

    character.playAnim('idle');
    character.charGlobalOffset.y = 350;
    character.flipX = true;
}

function dance() {
    if (character.lastHit <= Conductor.songPosition - 500 || character.lastHit == 0) {
        character.playAnim('idle');
    }
}