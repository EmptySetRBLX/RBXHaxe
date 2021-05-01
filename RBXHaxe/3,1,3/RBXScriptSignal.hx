import haxe.Constraints.Function;
import lua.Table;

extern class RBXScriptSignal
{
    public function Connect(f:Function):RBXScriptConnection;
    public function Wait():Dynamic;
}