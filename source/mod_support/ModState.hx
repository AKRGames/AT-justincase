package mod_support;

import flixel.FlxBasic;
import flixel.FlxG;
import EngineSettings.Settings;
import Script.HScript;

class ModState extends MusicBeatState {
    public var _mod:String = Settings.engineSettings.data.selectedMod;
    public var _scriptName:String = "main";
    public var script:Script = null;

    // WILL NEED TO BE IN "Your Mod/states/"
    public override function new(name:String, mod:String) {
        super();
        if (name != null) _scriptName = name;
        if (mod != null) _mod = mod;

        var path = '${Paths.modsPath}/$_mod/states/$_scriptName';

        script = Script.create(path);
        if (script != null) script = new HScript();
        ModSupport.setScriptDefaultVars(script, _mod, {});

        
        script.setVariable("new", function() {});
        script.setVariable("create", function() {});
        script.setVariable("beatHit", function(curBeat:Int) {});
        script.setVariable("stepHit", function(curStep:Int) {});
        script.setVariable("destroy", function() {});
        script.setVariable("add", function(obj:FlxBasic) {add(obj);});
        script.setVariable("remove", function(obj:FlxBasic) {remove(obj);});
        script.setVariable("insert", function(i:Int, obj:FlxBasic) {insert(i, obj);});

        script.loadFile(path);

        script.executeFunc("new");
    }

    public override function create() {
        super.create();
        script.executeFunc("create");
    }

    public override function beatHit() {
        script.executeFunc("beatHit", [curBeat]);
        super.beatHit();
    }

    public override function stepHit() {
        script.executeFunc("stepHit", [curStep]);
        super.stepHit();
    }

    public override function update(elapsed:Float) {
        if (Settings.engineSettings.data.developerMode) {
            if (FlxG.keys.justPressed.F5) {
                // F5 to reload in dev mode
                FlxG.switchState(new ModState(_scriptName, _mod));
            } else if (FlxG.keys.justPressed.F6) {
                // F6 to open logs
                if (subState == null) {
                    openSubState(new LogSubState());
                }
            }
        }
        script.executeFunc("update", [elapsed]);
        super.update(elapsed);
    }

    public override function destroy() {
        script.executeFunc("destroy");
        super.destroy();
    }
}