import haxe.extern.Rest;
extern class NumberSequenceKeypoint
{	
    public var Envelope:Float;
    public var Time:Float;
    public var Value:Float;
        
    function new(args:Rest<Float>);
}