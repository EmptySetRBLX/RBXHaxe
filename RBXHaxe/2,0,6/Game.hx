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

	public static function GetService(serviceName:String):Dynamic;
    public static function BindToClose(func:Function):Void;
    public static function GetJobIntervalPeakFraction(jobName:String, greaterThan:Float):Float;
    public static function GetJobTimePeakFraction(jobName:String, greaterThan:Float):Float;
    public static function GetJobExtendedStats():Map<Int, Dynamic>;
    public static function GetJobsInfo():Map<Int, Dynamic>;
    public static function GetObjects(url:String):Map<Int, Instance>;
    public static function IsGearTypeAllowed(gearType:EnumItem):Bool;
    public static function IsLoaded():Bool;
    public static function Load(url:String):Void;
    public static function SetPlaceId(PlaceId:Int64):Void;
    public static function SetUniverseId(universeId:Int64):Void;
    public static function Shutdown():Void;
}
