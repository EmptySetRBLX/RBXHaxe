import haxe.extern.Rest;
import haxe.extern.EitherType;
import lua.Table;

extern class BrickColor
{	
	public var Number:Float;
	public var r:Float;
	public var g:Float;
	public var b:Float;
	public var Name:String;
	public var Color:Color3;

	function new(args:Rest<
		EitherType<Float,EitherType<String, Color3>>
	>);

	public static function palette(paletteValue:Float):BrickColor;
	public static function random():BrickColor;
	public static function White():BrickColor;
	public static function Gray():BrickColor;
	public static function DarkGray():BrickColor;
	public static function Black():BrickColor;
	public static function Red():BrickColor;
	public static function Yellow():BrickColor;
	public static function Green():BrickColor;
	public static function Blue():BrickColor;
}