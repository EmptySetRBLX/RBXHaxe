extern class DockWidgetPluginGuiInfo
{	
	public var InitialEnabled:Bool;
	public var InitialEnabledShouldOverrideRestore:Bool;
	public var FloatingXSize:Int;
	public var FloatingYSize:Int;
	public var MinWidth:Int;
	public var MinHeight:Int;


	function new(initDockState:EnumItem, initEnabled:Bool, 
	overrideEnabledRestore:Bool, floatXSize:Int, floatYSize:Int, mindWidth:Int, minHeight:Int);


}