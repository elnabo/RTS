package ressources;

import haxe.ds.StringMap;

//~ enum Race
//~ {
	//~ Human;
	//~ Orc;
//~ }


class Configs
{
		
	public static var tileWidth:Int = 32;
	public static var tileHeight:Int = 32;	
		
	public static var raceImagesPath:Array<String> = ["human","orc"];
	public static var buildingsImage:String = "building.png";
	
	//~ // TownCenter info.
	// Buildings info.
	public static var buildingsName:Array<String> = ["TownCenter"];
	
	public static var buildingsWidth:StringMap<Array<Int>> = 
	{
		var map = new StringMap<Array<Int>>();
		map.set("TownCenter",[122,128,128]);
		map;
	};
	
	public static var buildingsHeight:StringMap<Array<Int>> = 
	{
		var map = new StringMap<Array<Int>>();
		map.set("TownCenter",[118,128,128]);
		map;
	};
	
	public static var buildingsImageStartPos:StringMap<Array<Array<Int>>> = 
	{
		var map = new StringMap<Array<Array<Int>>>();
		map.set("TownCenter",[[5,5],[135,4]]);
		map;
	};
	
	//~ public static var townCenterWidth:Array<Int> = [122,128,128];
	//~ public static var townCenterHeight:Array<Int> = [118,128,128];
	//~ // townCenterImageStartPos[version] = [ x, y ]
	//~ public static var townCenterImageStartPos:Array<Array<Int>> = [[5,5],[135,4]];
	
	
	public static var collidable:Array<String> = ["collidable", "goldMine", "tree", "unit", "building"];
}
