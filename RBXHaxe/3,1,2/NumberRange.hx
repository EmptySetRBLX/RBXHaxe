import haxe.extern.Rest;
import lua.Table;

extern class NumberRange
{	
    public var Min:Float;
    public var Max:Float;
    
	function new(args:Rest<Float>);
}