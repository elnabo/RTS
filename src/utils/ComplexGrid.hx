package utils;

import com.haxepunk.Entity;
import com.haxepunk.HXP;
import com.haxepunk.masks.Grid;

class ComplexGrid
{
	public static function getComplexGrid(background:String, collidables:Array<String>, tileWidth:Int, tileHeight:Int, filter:Entity->Bool=null):Grid
	{
		var grid:Grid;
		
		var bgEntity = HXP.scene.typeFirst(background);
		if (bgEntity != null)
		{
			grid = cast(bgEntity.mask, Grid).clone();
		}
		
		var entities = new Array<Entity>();
		HXP.scene.getAll(entities);
		
		var collidablesEntities  = Lambda.filter(entities, function(e) 
										{ 
											return Lambda.indexOf(collidables,e.type) != -1; 
										});
										
		if (filter != null)
		{
			collidablesEntities = Lambda.filter(collidablesEntities ,filter);
		}
										
		for (e in collidablesEntities.iterator())
		{
			var minX = Std.int(Math.floor(e.x / tileWidth));
			var maxX = Std.int(Math.ceil((e.x + e.width) / tileWidth));
			
			var minY = Std.int(Math.floor(e.y / tileHeight));
			var maxY = Std.int(Math.ceil((e.y + e.height) / tileHeight));
			
			for (col in minX...maxX)
			{
				for (row in minY...maxY)
				{
					grid.setTile(col,row,true);
				}
			}
		}
		
		return grid;
	}
	
}
