import haxe.extern.Rest;
import haxe.extern.EitherType;
import lua.Table;

extern class CFrame
{
	public var X:Float;
	public var Y:Float;
	public var Z:Float;
	public var LookVector:Vector3;
	public var RightVector:Vector3;
	public var UpVector:Vector3;
	public var Position:Vector3;
	
	function new(args:Rest<
		EitherType<Float,Vector3>
	>);

	public static function fromEulerAnglesXYZ(rx: Float, ry: Float, rz:Float):CFrame;
	public static function fromEulerAnglesYXZ(ry: Float, rx: Float, rz:Float):CFrame;
	public static function Angles(rx: Float, ry: Float, rz:Float):CFrame;
	public static function fromOrientation(rx: Float, ry: Float, rz:Float):CFrame;
	public static function fromAxisAngle(v:Vector3, r:Float):CFrame;
	public static function fromMatrix(pos:Vector3, vX:Vector3, vY:Vector3, vZ:Vector3):CFrame;

	public function inverse():CFrame;
	function Lerp(goal:CFrame, alpha:Float):CFrame;
	function ToWorldSpace(cf:CFrame):CFrame;
	function ToObjectSpace(cf:CFrame):CFrame;
	function PointToWorldSpace(v3:Vector3):Vector3;
	function PointToObjectSpace(v3:Vector3):Vector3;
	function VectorToWorldSpace(v3:Vector3):Vector3;
	function VectorToObjectSpace(v3:Vector3):Vector3;
	function GetComponents():Components;
	function ToEulerAnglesXYZ():XYZ;
	function ToEulerAnglesYXZ():YXZ;
	function ToOrientation():YXZ;
	function ToAxisAngle():AxisAngle;

	inline function mul(b:EitherType<CFrame,Vector3>):CFrame {
        return untyped __lua__("{0} * {1}", this, b);
    }

	inline function add(b:Vector3):CFrame {
        return untyped __lua__("{0} + {1}", this, b);
    }

	inline function sub(b:Vector3):CFrame {
        return untyped __lua__("{0} - {1}", this, b);
    }
}

@:multiReturn extern class AxisAngle {
	var axis:Vector3;
	var angle:Float;
}

@:multiReturn extern class YXZ {
	var y:Float;
	var x:Float;
	var z:Float;
}

@:multiReturn extern class XYZ {
	var x:Float;
	var y:Float;
	var z:Float;
}

@:multiReturn extern class Components {
	var x:Float;
	var y:Float;
	var z:Float;
	var R00:Float;
	var R01:Float;
	var R02:Float;
	var R10:Float;
	var R11:Float;
	var R12:Float;
	var R20:Float;
	var R21:Float;
	var R22:Float;
}