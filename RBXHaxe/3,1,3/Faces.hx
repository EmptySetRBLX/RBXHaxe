import haxe.extern.Rest;
import lua.Table;

extern class Faces
{	
	public var Top:Float;
	public var Bottom:Float;
	public var Left:Float;
	public var Right:Float;
	public var Back:Float;
	public var Front:Float;

	function new(args:Rest<Dynamic>);
}