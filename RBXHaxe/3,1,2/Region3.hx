import lua.Table;

extern class Region3
{
    public var CFrame:CFrame;
    public var Size:Vector3;
    
	function new(min:Vector3, max:Vector3);

    function ExpandToGrid(Region:Int):Region3;
}
