import haxe.extern.EitherType;
extern class Vector3
{
	function new(x:Float, y:Float, z:Float);

    inline function add(b:Vector3):Vector3 {
        return untyped __lua__("{0} + {1}", this, b);
    }

	inline function sub(b:Vector3):Vector3 {
        return untyped __lua__("{0} - {1}", this, b);
    }

	inline function mul(b:EitherType<Float,Vector3>):Vector3 {
        return untyped __lua__("{0} * {1}", this, b);
    }

	inline function div(b:EitherType<Float,Vector3>):Vector3 {
        return untyped __lua__("{0} / {1}", this, b);
    }

	function Lerp(goal:Vector3, alpha:Float):Vector3;
	function Dot(other:Vector3):Float;
	function Cross(other:Vector3):Vector3;
	function isClose(other:Vector3, epsilon:Float):Bool;
}
