package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.system.debug.stats.Stats;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import openfl.display.FPS;

class FullMode extends FlxState
{
	public static var title:FlxText;

	public static var frames:Int;
	public static var time:Float;
	public static var renders:Int;

	public static var px:Int = 0;
	public static var py:Int = 0;

	override public function create()
	{
		super.create();

		FlxG.mouse.visible = false;

		title = new FlxText(0, 0, 0, "Bungholio Marks", 128);
		title.screenCenter(X);
		add(title);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.justPressed.F11)
		{
			FlxG.fullscreen = !FlxG.fullscreen;
		}

		var temp = new FlxSprite();
		temp.makeGraphic(10, 10, 0xFFFFFFFF);
		temp.x = Random.int(0, FlxG.width);
		temp.y = Random.int(0, FlxG.height);
		temp.color = FlxColor.fromRGB(Random.int(0, 255), Random.int(0, 255), Random.int(0, 255), Random.int(0, 255));
		add(temp);
		temp.loadGraphic(AssetPaths.img1__png);
		temp.scale.x = Random.float(0.5, 2);
		temp.scale.y = Random.float(0.5, 2);
		renders++;

		frames++;
		time += elapsed;

		#if tf
		trace(frames);
		#end

		#if tt
		trace(time);
		#end

		#if ttf
		trace(time);
		trace(frames);
		#end

		if (renders == 100)
		{
			FlxG.switchState(new ResultState(renders, frames));
		}
	}
}
