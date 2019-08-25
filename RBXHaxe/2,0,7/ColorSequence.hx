import haxe.extern.Rest;
import haxe.extern.EitherType;

extern class ColorSequence
{	
	public var Keypoints:Map<Int, Dynamic>;

	function new(args:Rest<EitherType<Color3,Map<Int, Dynamic>>>);
}