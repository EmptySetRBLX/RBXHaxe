import haxe.extern.EitherType;
import lua.Table;

extern class Vector2
{
    public var X:Float;
    public var Y:Float;
    public var Magnitude:Float;
    public var Unit:Vector2;

	function new(x:Float, y:Float);

    inline function add(b:Vector2):Vector2 {
        return untyped __lua__("{0} + {1}", this, b);
    }

	inline function sub(b:Vector2):Vector2 {
        return untyped __lua__("{0} - {1}", this, b);
    }

	inline function mul(b:EitherType<Float,Vector2>):Vector2 {
        return untyped __lua__("{0} * {1}", this, b);
    }

	inline function div(b:EitherType<Float,Vector2>):Vector2 {
        return untyped __lua__("{0} / {1}", this, b);
    }

	function Lerp(goal:Vector2, alpha:Float):Vector2;
	function Dot(other:Vector2):Float;
	function Cross(other:Vector2):Vector2;
}
