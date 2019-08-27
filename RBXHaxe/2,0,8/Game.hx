import haxe.Int64;
import haxe.Constraints.Function;

@:native("game")
extern class Game extends Instance
{
    public static var CreatorId:Int64;
    public static var CreatorType:EnumItem;
    public static var GameId:Int64;
    public static var JobId:String;
    public static var PlaceId:Int64;
    public static var PlaceVersion:Int;
    public static var PrivateServerId:String;
    public static var PrivateServerOwnerId:Int64;
    public static var Workspace:Workspace;
    public static var GraphicsQualityChangeRequest:RBXScriptSignal;
    public static var Loaded:RBXScriptSignal;

	public function GetService(serviceName:String):Dynamic;
    public function BindToClose(func:Function):Void;
    public function GetJobIntervalPeakFraction(jobName:String, greaterThan:Float):Float;
    public function GetJobTimePeakFraction(jobName:String, greaterThan:Float):Float;
    public function GetJobExtendedStats():Map<Int, Dynamic>;
    public function GetJobsInfo():Map<Int, Dynamic>;
    public function GetObjects(url:String):Map<Int, Instance>;
    public function IsGearTypeAllowed(gearType:EnumItem):Bool;
    public function IsLoaded():Bool;
    public function Load(url:String):Void;
    public function SetPlaceId(PlaceId:Int64):Void;
    public function SetUniverseId(universeId:Int64):Void;
    public function Shutdown():Void;
}
