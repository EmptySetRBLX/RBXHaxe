import lua.Table;

extern class UDim{
    public var Scale:Float;
    public var Offset:Int;

    function new(scale:Float, Offset:Float);

    inline function add(b:UDim):UDim {
        return untyped __lua__("{0} + {1}", this, b);
    }

	inline function sub(b:UDim):UDim {
        return untyped __lua__("{0} - {1}", this, b);
    }
}