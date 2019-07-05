import haxe.extern.EitherType;
import haxe.extern.Rest;
extern class Random{

    function new(seed:EitherType<Float, Void>);

    public function NextInteger(min:Float, max:Float):Int;
    public function NextNumber(minMax:Rest<Float>):Float;
    public function Clone():Random;
}