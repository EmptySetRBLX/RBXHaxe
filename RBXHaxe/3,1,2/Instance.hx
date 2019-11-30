import lua.Table;

extern class Instance
{
	public var Archivable:Bool; 
	public var ClassName(default, null):String;
	public var DataCost(default, null):Int;
	public var Name:String;
	public var Parent:Instance;
	public var RobloxLocked:Bool;

	static inline function newInstance(name:String):Dynamic {
		return untyped __lua__("Instance.new({0})", name);
	}

	function new(name:String);
	function ClearAllChildren():Void;
	function Clone():Dynamic;
	function Destroy():Void;
	function FindFirstAncestor(name:String):Dynamic;
	function FindFirstAncestorOfClass(className:String):Dynamic;
	function FindFirstAncestorWhichIsA(className:String):Dynamic;
	function FindFirstChild(name:String, ?recursive:Bool):Dynamic;
	function FindFirstChildOfClass(name:String):Dynamic;
	function FindFirstChildWhichIsA(className:String, ?recursive:Bool):Dynamic;
	function GetChildren():AnyTable;
	function GetDescendants():AnyTable;
	function GetFullName():String;
	function GetPropertyChangedSignal(property:String):RBXScriptSignal;
	function IsA(className:String):Bool;
	function IsAncestorOf(descendant:Instance):Bool;
	function IsDescendantOf(ancestor:Instance):Bool;
	function WaitForChild(childName:String, ?timeOut:Float):Dynamic;

	public var AncestoryChanged:RBXScriptSignal;
	public var Changed:RBXScriptSignal;
	public var ChildAdded:RBXScriptSignal;
	public var ChildRemoved:RBXScriptSignal;
	public var DescendantAdded:RBXScriptSignal;
	public var DescendantRemoving:RBXScriptSignal;
}