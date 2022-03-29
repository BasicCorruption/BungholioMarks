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

		var temp2 = new FlxSprite();
		temp2.makeGraphic(10, 10, 0xFFFFFFFF);
		temp2.x = Random.int(0, FlxG.width);
		temp2.y = Random.int(0, FlxG.height);
		temp2.color = FlxColor.fromRGB(Random.int(0, 255), Random.int(0, 255), Random.int(0, 255), Random.int(0, 255));
		add(temp2);
		temp2.loadGraphic(AssetPaths.img1__png);
		temp2.scale.x = Random.float(0.5, 2);
		temp2.scale.y = Random.float(0.5, 2);
		renders++;

		var temp3 = new FlxSprite();
		temp3.makeGraphic(10, 10, 0xFFFFFFFF);
		temp3.x = Random.int(0, FlxG.width);
		temp3.y = Random.int(0, FlxG.height);
		temp3.color = FlxColor.fromRGB(Random.int(0, 255), Random.int(0, 255), Random.int(0, 255), Random.int(0, 255));
		add(temp3);
		temp3.loadGraphic(AssetPaths.img2__png);
		temp3.scale.x = Random.float(0.5, 2);
		temp3.scale.y = Random.float(0.5, 2);
		renders++;

		var temp4 = new FlxSprite();
		temp4.makeGraphic(10, 10, 0xFFFFFFFF);
		temp4.x = Random.int(0, FlxG.width);
		temp4.y = Random.int(0, FlxG.height);
		temp4.color = FlxColor.fromRGB(Random.int(0, 255), Random.int(0, 255), Random.int(0, 255), Random.int(0, 255));
		add(temp4);
		temp4.loadGraphic(AssetPaths.img2__png);
		temp4.scale.x = Random.float(0.5, 2);
		temp4.scale.y = Random.float(0.5, 2);
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

		if (time > 5)
		{
			FlxG.switchState(new ResultState(renders, frames));
		}
	}
}