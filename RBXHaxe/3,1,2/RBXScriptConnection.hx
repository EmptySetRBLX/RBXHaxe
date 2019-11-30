import haxe.Constraints.Function;
import lua.Table;

extern class RBXScriptConnection
{
    public function Disconnect():Void;

    public var Connected:Bool;
}