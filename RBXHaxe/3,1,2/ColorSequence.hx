import haxe.extern.Rest;
import haxe.extern.EitherType;
import lua.Table;

extern class ColorSequence
{	
	public var Keypoints:AnyTable;

	function new(args:Rest<EitherType<Color3,AnyTable>>);
}