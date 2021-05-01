import haxe.extern.Rest;
import haxe.extern.EitherType;
import lua.Table;

extern class RaycastParams
{
	public var FilterDescendantsInstances:AnyTable;
	public var FilterType:RaycastFilterType;
	public var IgnoreWater:Bool;
	public var CollisionGroup:String;
	
	function new();
}