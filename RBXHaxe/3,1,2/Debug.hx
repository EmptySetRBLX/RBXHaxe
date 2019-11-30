import haxe.extern.Rest;
import haxe.extern.EitherType;
import lua.Table;

@:native("debug")
extern class Debug
{

	public static function traceback():Void;
	public static function profilebegin(label:String):Void;
	public static function profileend():Void;

}