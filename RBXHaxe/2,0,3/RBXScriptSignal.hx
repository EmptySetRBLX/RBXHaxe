import haxe.Constraints.Function;
extern class RBXScriptSignal
{
    public function Connect(f:Function):RBXScriptConnection;
    public function Wait():Dynamic;
}