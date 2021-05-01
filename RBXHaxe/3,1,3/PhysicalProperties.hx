import haxe.extern.Rest;
import haxe.extern.EitherType;
import lua.Table;

extern class PhysicalProperties
{	
	public var Density:Float;
	public var Friction:Float;
	public var Elasticity:Float;
	public var FrictionWeight:Float;
	public var ElasticityWeight:Float;

	function new(args:Rest<
		EitherType<EnumItem,Float>
	>);
}