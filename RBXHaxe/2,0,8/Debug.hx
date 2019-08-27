import haxe.extern.Rest;
import haxe.extern.EitherType;

extern class Debug
{

	public function traceback():Void;
	public function profilebegin(label:String):Void;
	public function profileend ():Void;

}