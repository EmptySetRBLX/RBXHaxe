import haxe.extern.Rest;
extern class NumberRange
{	
    public var Min:Float;
    public var Max:Float;
    
	function new(args:Rest<Float>);
}