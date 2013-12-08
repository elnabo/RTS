package ressources;


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
	
	// TownCenter info.
	public static var townCenterWidth:Array<Int> = [122,128,128];
	public static var townCenterHeight:Array<Int> = [118,128,128];
	// townCenterImageStartPos[version] = [ x, y ]
	public static var townCenterImageStartPos:Array<Array<Int>> = [[5,5],[135,4]];
	
	
	public static var collidable:Array<String> = ["collidable", "goldMine", "tree", "unit", "building"];
}
