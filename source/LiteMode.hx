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

		var p5 = pixels.data.getInt32(4 * (px + py * pixels.width));
		var a5:Int = p >>> 24;
		var r5:Int = (p >>> 16) & 0xff;
		var g5:Int = (p >>> 8) & 0xff;
		var b5:Int = (p) & 0xff;
		var hex5:String = StringTools.hex(p5, 8);

		if (r5 > 5 && g5 > 5 && b5 > 5)
		{
			var s5 = new FlxSprite();
			s5.makeGraphic(1, 1, FlxColor.fromRGB(r5, g5, b5, a5));
			s5.x = px;
			s5.y = py;
			add(s5);
			renders++;
		}

		px++;

		var p6 = pixels.data.getInt32(4 * (px + py * pixels.width));
		var a6:Int = p >>> 24;
		var r6:Int = (p >>> 16) & 0xff;
		var g6:Int = (p >>> 8) & 0xff;
		var b6:Int = (p) & 0xff;
		var hex6:String = StringTools.hex(p6, 8);

		if (r6 > 5 && g6 > 5 && b6 > 5)
		{
			var s6 = new FlxSprite();
			s6.makeGraphic(1, 1, FlxColor.fromRGB(r6, g6, b6, a6));
			s6.x = px;
			s6.y = py;
			add(s6);
			renders++;
		}

		px++;

		var p7 = pixels.data.getInt32(4 * (px + py * pixels.width));
		var a7:Int = p >>> 24;
		var r7:Int = (p >>> 16) & 0xff;
		var g7:Int = (p >>> 8) & 0xff;
		var b7:Int = (p) & 0xff;
		var hex7:String = StringTools.hex(p7, 8);

		if (r7 > 5 && g7 > 5 && b7 > 5)
		{
			var s7 = new FlxSprite();
			s7.makeGraphic(1, 1, FlxColor.fromRGB(r7, g7, b7, a7));
			s7.x = px;
			s7.y = py;
			add(s7);
			renders++;
		}

		px++;

		var p8 = pixels.data.getInt32(4 * (px + py * pixels.width));
		var a8:Int = p >>> 24;
		var r8:Int = (p >>> 16) & 0xff;
		var g8:Int = (p >>> 8) & 0xff;
		var b8:Int = (p) & 0xff;
		var hex8:String = StringTools.hex(p8, 8);

		if (r8 > 5 && g8 > 5 && b8 > 5)
		{
			var s8 = new FlxSprite();
			s8.makeGraphic(1, 1, FlxColor.fromRGB(r8, g8, b8, a8));
			s8.x = px;
			s8.y = py;
			add(s8);
			renders++;
		}

		px++;

		var p9 = pixels.data.getInt32(4 * (px + py * pixels.width));
		var a9:Int = p >>> 24;
		var r9:Int = (p >>> 16) & 0xff;
		var g9:Int = (p >>> 8) & 0xff;
		var b9:Int = (p) & 0xff;
		var hex9:String = StringTools.hex(p9, 8);

		if (r9 > 5 && g9 > 5 && b9 > 5)
		{
			var s9 = new FlxSprite();
			s9.makeGraphic(1, 1, FlxColor.fromRGB(r9, g9, b9, a9));
			s9.x = px;
			s9.y = py;
			add(s9);
			renders++;
		}

		px++;

		var p10 = pixels.data.getInt32(4 * (px + py * pixels.width));
		var a10:Int = p >>> 24;
		var r10:Int = (p >>> 16) & 0xff;
		var g10:Int = (p >>> 8) & 0xff;
		var b10:Int = (p) & 0xff;
		var hex10:String = StringTools.hex(p10, 8);

		if (r10 > 5 && g10 > 5 && b10 > 5)
		{
			var s10 = new FlxSprite();
			s10.makeGraphic(1, 1, FlxColor.fromRGB(r10, g10, b10, a10));
			s10.x = px;
			s10.y = py;
			add(s10);
			renders++;
		}

		px++;

		var p11 = pixels.data.getInt32(4 * (px + py * pixels.width));
		var a11:Int = p >>> 24;
		var r11:Int = (p >>> 16) & 0xff;
		var g11:Int = (p >>> 8) & 0xff;
		var b11:Int = (p) & 0xff;
		var hex11:String = StringTools.hex(p11, 8);

		if (r11 > 5 && g11 > 5 && b11 > 5)
		{
			var s11 = new FlxSprite();
			s11.makeGraphic(1, 1, FlxColor.fromRGB(r11, g11, b11, a11));
			s11.x = px;
			s11.y = py;
			add(s11);
			renders++;
		}

		px++;

		var p12 = pixels.data.getInt32(4 * (px + py * pixels.width));
		var a12:Int = p >>> 24;
		var r12:Int = (p >>> 16) & 0xff;
		var g12:Int = (p >>> 8) & 0xff;
		var b12:Int = (p) & 0xff;
		var hex12:String = StringTools.hex(p12, 8);

		if (r12 > 5 && g12 > 5 && b12 > 5)
		{
			var s12 = new FlxSprite();
			s12.makeGraphic(1, 1, FlxColor.fromRGB(r12, g12, b12, a12));
			s12.x = px;
			s12.y = py;
			add(s12);
			renders++;
		}

		px++;

		var p13 = pixels.data.getInt32(4 * (px + py * pixels.width));
		var a13:Int = p >>> 24;
		var r13:Int = (p >>> 16) & 0xff;
		var g13:Int = (p >>> 8) & 0xff;
		var b13:Int = (p) & 0xff;
		var hex13:String = StringTools.hex(p13, 8);

		if (r13 > 5 && g13 > 5 && b13 > 5)
		{
			var s13 = new FlxSprite();
			s13.makeGraphic(1, 1, FlxColor.fromRGB(r13, g13, b13, a13));
			s13.x = px;
			s13.y = py;
			add(s13);
			renders++;
		}

		px++;

		var p14 = pixels.data.getInt32(4 * (px + py * pixels.width));
		var a14:Int = p >>> 24;
		var r14:Int = (p >>> 16) & 0xff;
		var g14:Int = (p >>> 8) & 0xff;
		var b14:Int = (p) & 0xff;
		var hex14:String = StringTools.hex(p14, 8);

		if (r14 > 5 && g14 > 5 && b14 > 5)
		{
			var s14 = new FlxSprite();
			s14.makeGraphic(1, 1, FlxColor.fromRGB(r14, g14, b14, a14));
			s14.x = px;
			s14.y = py;
			add(s14);
			renders++;
		}

		px++;

		var p15 = pixels.data.getInt32(4 * (px + py * pixels.width));
		var a15:Int = p >>> 24;
		var r15:Int = (p >>> 16) & 0xff;
		var g15:Int = (p >>> 8) & 0xff;
		var b15:Int = (p) & 0xff;
		var hex15:String = StringTools.hex(p15, 8);

		if (r15 > 5 && g15 > 5 && b15 > 5)
		{
			var s15 = new FlxSprite();
			s15.makeGraphic(1, 1, FlxColor.fromRGB(r15, g15, b15, a15));
			s15.x = px;
			s15.y = py;
			add(s15);
			renders++;
		}

		px++;

		var p16 = pixels.data.getInt32(4 * (px + py * pixels.width));
		var a16:Int = p >>> 24;
		var r16:Int = (p >>> 16) & 0xff;
		var g16:Int = (p >>> 8) & 0xff;
		var b16:Int = (p) & 0xff;
		var hex16:String = StringTools.hex(p16, 8);

		if (r16 > 5 && g16 > 5 && b16 > 5)
		{
			var s16 = new FlxSprite();
			s16.makeGraphic(1, 1, FlxColor.fromRGB(r16, g16, b16, a16));
			s16.x = px;
			s16.y = py;
			add(s16);
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
