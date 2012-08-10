package org.ivar.leveltools.demo;
import org.flixel.FlxGroup;
import org.flixel.FlxState;
import org.flixel.FlxSprite;
import org.flixel.FlxCamera;
import org.flixel.FlxG;
import org.flixel.FlxRect;
import nme.Assets;
import org.flixel.FlxTilemap;
import org.ivar.leveltools.DameLevel;
import org.ivar.leveltools.Properties;
import org.ivar.leveltools.TilemapIterator;
using org.ivar.leveltools.LevelTools;
/**
 * ...
 * @author Nemanja Stojanovic
 */

class Level extends FlxState
{
	private var level:DameLevel;
	private var viewer:FlxSprite;
	
	public function new() 
	{
		super();
	}
	
	override public function create():Void 
	{
		super.create();
		level = DameLevel.loadLevel(
			Assets.getText("assets/DameProject/Level_DemoLevel.xml"), 
			"assets/", 
			true,
			null,
			onObjectAdd
			);

		viewer = new FlxSprite(0, 0, "assets/cursor.png");
		add(viewer);

		FlxG.worldBounds = new FlxRect(0, 0, 40*16, 30*16);
		FlxG.camera.setBounds(0, 0, 40*16, 30*16, true);
		FlxG.camera.follow(viewer);
	}

	public function onObjectAdd(obj:FlxSprite, properties:Properties):Void
	{
		obj.loadGraphic("assets/gfx/" + properties.get("background"), false, false);
	}

	public override function update()
	{
		super.update();
		var px = FlxG.mouse.screenX / FlxG.width;
		var py = FlxG.mouse.screenY / FlxG.height;
		viewer.x = FlxG.worldBounds.width * px;
		viewer.y = FlxG.worldBounds.height * py;
		#if (neko || cpp)
		if(FlxG.keys.pressed("ESCAPE"))
			Sys.exit(0);
		#end
	}


}