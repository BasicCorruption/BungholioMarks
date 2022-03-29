package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class MenuState extends FlxState
{
	public static var title:FlxText;
	public static var info:FlxText;
	public static var start:FlxButton;
	public static var startf:FlxButton;

	public override function create()
	{
		super.create();

		FlxG.mouse.visible = true;

		FlxG.autoPause = false;

		title = new FlxText(0, 0, 0, "Bungholio Marks 2D CPU & GPU Tester", 32);
		title.screenCenter(X);
		add(title);

		#if hard
		info = new FlxText(0, 0, 0, "Testing GPU", 16);
		info.screenCenter(XY);
		info.x -= FlxG.height / 2;
		add(info);
		#else
		info = new FlxText(0, 0, 0, "Testing CPU", 16);
		info.screenCenter(XY);
		info.x -= FlxG.height / 2;
		add(info);
		#end

		start = new FlxButton(0, 0, "Lite Mode", function()
		{
			FlxG.switchState(new LiteMode());
		});
		start.screenCenter(XY);
		add(start);

		startf = new FlxButton(0, 0, "Full Mode", function()
		{
			FlxG.switchState(new FullMode());
		});
		startf.screenCenter(Y);
		startf.x = (FlxG.width / 4) * 3;
		add(startf);
	}

	public override function update(dt:Float)
	{
		super.update(dt);

		if (FlxG.keys.justPressed.F11)
		{
			FlxG.fullscreen = !FlxG.fullscreen;
		}
	}
}
