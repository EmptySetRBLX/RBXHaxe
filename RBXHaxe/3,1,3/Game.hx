import haxe.Constraints.Function;
import lua.Table;

@:native("game")
extern class Game extends Instance
{
    public static var CreatorId:Int;
    public static var CreatorType:EnumItem;
    public static var GameId:Int;
    public static var JobId:String;
    public static var PlaceId:Int;
    public static var PlaceVersion:Int;
    public static var PrivateServerId:String;
    public static var PrivateServerOwnerId:Int;
    public static var Workspace:Workspace;
    public static var GraphicsQualityChangeRequest:RBXScriptSignal;
    public static var Loaded:RBXScriptSignal;

	public function GetService(serviceName:String):Dynamic;
    public function BindToClose(func:Function):Void;
    public function GetJobIntervalPeakFraction(jobName:String, greaterThan:Float):Float;
    public function GetJobTimePeakFraction(jobName:String, greaterThan:Float):Float;
    public function GetJobExtendedStats():AnyTable;
    public function GetJobsInfo():AnyTable;
    public function GetObjects(url:String):AnyTable;
    public function IsGearTypeAllowed(gearType:EnumItem):Bool;
    public function IsLoaded():Bool;
    public function Load(url:String):Void;
    public function SetPlaceId(PlaceId:Int):Void;
    public function SetUniverseId(universeId:Int):Void;
    public function Shutdown():Void;
}
