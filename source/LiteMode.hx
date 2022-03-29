package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.system.debug.stats.Stats;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import haxe.io.Bytes;
import haxe.io.Path;
import lime.system.System;
import openfl.display.FPS;

class LiteMode extends FlxState
{
	public static var title:FlxText;

	public static var frames:Int;
	public static var time:Float;
	public static var renders:Int;

	public static var px:Int = 0;
	public static var py:Int = 0;

	public static var pixels:{data:Bytes, width:Int, height:Int};

	public static var images = [
		Path.join([System.applicationDirectory, "assets/", "img1.png"]),
		Path.join([System.applicationDirectory, "assets/", "img2.png"]),
		Path.join([System.applicationDirectory, "assets/", "img3.png"]),
		Path.join([System.applicationDirectory, "assets/", "img4.png"]),
		Path.join([System.applicationDirectory, "assets/", "img5.png"]),
	];

	override public function create()
	{
		super.create();

		FlxG.mouse.visible = false;

		var filename = Random.fromArray(images);
		pixels = readPixels(filename);
	}

	function readPixels(file:String):{data:Bytes, width:Int, height:Int}
	{
		#if sys
		var handle = sys.io.File.read(file, true);
		var d = new format.png.Reader(handle).read();
		var hdr = format.png.Tools.getHeader(d);
		var ret = {
			data: format.png.Tools.extract32(d),
			width: hdr.width,
			height: hdr.height
		};
		handle.close();
		return ret;
		#else
		return {data: null, width: 0, height: 0};
		#end
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.justPressed.F11)
		{
			FlxG.fullscreen = !FlxG.fullscreen;
		}

		var p = pixels.data.getInt32(4 * (px + py * pixels.width));
		// ARGB, each 0-255
		var a:Int = p >>> 24;
		var r:Int = (p >>> 16) & 0xff;
		var g:Int = (p >>> 8) & 0xff;
		var b:Int = (p) & 0xff;
		// Or, AARRGGBB in hex:
		var hex:String = StringTools.hex(p, 8);

		time += elapsed;

		var s = new FlxSprite();
		s.makeGraphic(1, 1, FlxColor.fromRGB(r, g, b, a));
		s.x = px;
		s.y = py;
		add(s);

		renders++;

		px++;

		if (px > FlxG.width)
		{
			px = 0;
			py++;
		}

		if (py > FlxG.height)
		{
			FlxG.switchState(new ResultState(renders, time));
		}
	}
}
