import haxe.extern.Rest;
import lua.Table;

extern class Color3
{	
	public var r:Float;
	public var g:Float;
	public var b:Float;

	function new(args:Rest<Float>);
	public static function fromRGB(r:Float, g:Float, b:Float):Color3;
	public static function fromHSV(h:Float, s:Float, v:Float):Color3;
	public static function toHSV(color:Color3):HSV;

	public function lerp(color:Color3, alpha:Float):Color3;
}

@:multiReturn extern class HSV {
	var H:Float;
	var S:Float;
	var V:Float;
}