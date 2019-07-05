import haxe.extern.Rest;
import haxe.extern.EitherType;
extern class UDim2{
    public var X:UDim;
    public var Y:UDim;
    public var Width:UDim;
    public var Height:UDim;

    function new(cooridinates:Rest<EitherType<Float, UDim>>);

    function lerp(goal:UDim2, alpha:Float):UDim2;

    inline function add(b:UDim2):UDim2 {
        return untyped __lua__("{0} + {1}", this, b);
    }

	inline function sub(b:UDim2):UDim2 {
        return untyped __lua__("{0} - {1}", this, b);
    }
}