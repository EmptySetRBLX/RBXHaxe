import haxe.extern.Rest;
import haxe.extern.EitherType;
import lua.Table;
extern class NumberSequence
{	
    public var Keypoints:AnyTable;
    
	function new(args:Rest<EitherType<Float, AnyTable>>);
}