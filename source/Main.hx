package;

import flixel.FlxG;
import flixel.FlxGame;
import openfl.display.FPS;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();
		addChild(new FlxGame(0, 0, MenuState, 1, 1000, 1000, true));
		addChild(new FPS(10, 10, 0xffffff));
	}
}
