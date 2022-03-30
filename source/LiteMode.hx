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

		time += elapsed;

		var p = pixels.data.getInt32(4 * (px + py * pixels.width));
		var a:Int = p >>> 24;
		var r:Int = (p >>> 16) & 0xff;
		var g:Int = (p >>> 8) & 0xff;
		var b:Int = (p) & 0xff;
		var hex:String = StringTools.hex(p, 8);

		if (r > 5 && g > 5 && b > 5)
		{
			var s = new FlxSprite();
			s.makeGraphic(1, 1, FlxColor.fromRGB(r, g, b, a));
			s.x = px;
			s.y = py;
			add(s);
			renders++;
		}

		px++;

		var p2 = pixels.data.getInt32(4 * (px + py * pixels.width));
		var a2:Int = p >>> 24;
		var r2:Int = (p >>> 16) & 0xff;
		var g2:Int = (p >>> 8) & 0xff;
		var b2:Int = (p) & 0xff;
		var hex2:String = StringTools.hex(p2, 8);

		if (r2 > 5 && g2 > 5 && b2 > 5)
		{
			var s2 = new FlxSprite();
			s2.makeGraphic(1, 1, FlxColor.fromRGB(r2, g2, b2, a2));
			s2.x = px;
			s2.y = py;
			add(s2);
			renders++;
		}

		px++;

		var p3 = pixels.data.getInt32(4 * (px + py * pixels.width));
		var a3:Int = p >>> 24;
		var r3:Int = (p >>> 16) & 0xff;
		var g3:Int = (p >>> 8) & 0xff;
		var b3:Int = (p) & 0xff;
		var hex3:String = StringTools.hex(p3, 8);

		if (r3 > 5 && g3 > 5 && b3 > 5)
		{
			var s3 = new FlxSprite();
			s3.makeGraphic(1, 1, FlxColor.fromRGB(r3, g3, b3, a3));
			s3.x = px;
			s3.y = py;
			add(s3);
			renders++;
		}

		px++;

		var p4 = pixels.data.getInt32(4 * (px + py * pixels.width));
		var a4:Int = p >>> 24;
		var r4:Int = (p >>> 16) & 0xff;
		var g4:Int = (p >>> 8) & 0xff;
		var b4:Int = (p) & 0xff;
		var hex4:String = StringTools.hex(p4, 8);

		if (r4 > 5 && g4 > 5 && b4 > 5)
		{
			var s4 = new FlxSprite();
			s4.makeGraphic(1, 1, FlxColor.fromRGB(r4, g4, b4, a4));
			s4.x = px;
			s4.y = py;
			add(s4);
			renders++;
		}

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
