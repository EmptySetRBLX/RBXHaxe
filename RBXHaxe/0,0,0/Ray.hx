import haxe.extern.Rest;
import haxe.extern.EitherType;

extern class Ray
{
	public var Unit:Ray;
    public var Origin:Vector3;
    public var Direction:Vector3;
	
	function new(Origin:Vector3, Direction:Vector3);

    function ClosestPoint(point:Vector3):Vector3;
    function Distance(point:Vector3):Float;
}