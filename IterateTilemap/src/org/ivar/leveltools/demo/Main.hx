package org.ivar.leveltools.demo;
import nme.Lib;
import org.flixel.FlxGame;

class Main extends FlxGame
{
	public function new() 
	{
		super(400, 400, Level, 1, 60, 60);
	}
	
	static public function main()
	{
		var stage = Lib.current.stage;
		stage.scaleMode = nme.display.StageScaleMode.NO_SCALE;
		stage.align = nme.display.StageAlign.TOP_LEFT;
		
		Lib.current.addChild(new Main());
	}
}
