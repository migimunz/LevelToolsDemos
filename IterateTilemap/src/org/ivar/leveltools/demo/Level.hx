package org.ivar.leveltools.demo;
import org.flixel.FlxGroup;
import org.flixel.FlxState;
import org.flixel.FlxSprite;
import org.flixel.FlxCamera;
import org.flixel.FlxG;
import org.flixel.FlxRect;
import nme.installer.Assets;
import org.flixel.FlxTilemap;
import org.ivar.leveltools.DameLevel;
import org.ivar.leveltools.Properties;
import org.ivar.leveltools.TilemapIterator;
using org.ivar.leveltools.LevelTools;
/**
 * This class demonstrates tilemap iteration methods.
 * @author Nemanja Stojanovic
 */

class Level extends FlxState
{
	private var level:DameLevel;
	public static inline var grassId = 1;
	public static inline var dirtId = 7;
	
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
			true);

		level.getTilemap("MainTilemap").eachWithId(grassId, callback(randomizeTile, 0.1));
		level.getTilemap("MainTilemap").eachWithId(dirtId, callback(randomizeTile, 0.2));
	}

	public function randomizeTile(probability:Float, data:TileData)
	{
		if(Math.random() < probability)
		{
			var newId = data.tileId + Std.random(3) + 1;
			data.tilemap.setTile(data.x, data.y, newId);
		}
	}

	public override function update():Void
	{
		#if (neko || cpp)
		if(FlxG.keys.pressed("ESCAPE"))
			Sys.exit(0);
		#end
		if(FlxG.keys.pressed("SPACE"))
			FlxG.switchState(new Level());
	}


}