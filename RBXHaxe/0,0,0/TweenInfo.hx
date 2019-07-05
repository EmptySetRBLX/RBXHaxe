extern class TweenInfo
{
    public var EasingDirection:EnumItem;
    public var Time:Float;
    public var DelayTime:Float;
    public var RepeatCount:Float;
    public var EasingStyle:EnumItem;
    public var Reverses:Bool;

    function new(?time:Float, ?easingStyle:EnumItem, ?easingDirection:EnumItem,
    ?repeatCount:Float, ?reverses:Bool, ?delayTime:Float);
}
