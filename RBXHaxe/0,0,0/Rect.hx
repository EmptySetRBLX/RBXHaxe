import haxe.extern.Rest;
import haxe.extern.EitherType;
import lua.Table;
extern class Rect
{	
    public var Width:Float;
    public var Height:Float;
    public var Min:Vector2;
    public var Max:Vector2;
    
	function new(args:Rest<EitherType<Float, Vector2>>);
}