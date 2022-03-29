package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;

class ResultState extends FlxState
{
	public static var title:FlxText;
	public static var score:FlxText;

	public static var calcr:Int;

	public function new(frames:Int, time:Float)
	{
		super();

		var x = frames / time;
		var y = x * FlxG.width * FlxG.height * FlxG.drawFramerate;
		calcr = Math.round(y / 1000000);
	}

	public override function create()
	{
		super.create();

		title = new FlxText(0, 0, 0, "Bungholio Marks 2D CPU & GPU Tester", 32);
		title.screenCenter(X);
		add(title);

		score = new FlxText(0, 0, 0, "temp", 64);
		score.screenCenter(Y);
		add(score);
	}

	public override function update(dt:Float)
	{
		super.update(dt);

		#if soft
		score.text = "Your CPU has recieved " + calcr + " bungholio marks!";
		#end

		#if hard
		score.text = "Your GPU has recieved " + calcr + " bungholio marks!";
		#end
	}
}
