package map.terrain;

import flash.geom.Rectangle;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.graphics.Tilemap;

class Wood extends Entity
{
	private var _woodType:Int;
	private var _cols:Int=19;
	private var _rows:Int=20;
	
	public function new(x:Int, y:Int, woodType:Int, imagePath:String, tilemap:Tilemap)
	{
		super(x,y);
		_woodType = woodType;
		
		var width = tilemap.tileWidth + tilemap._tileSpacingWidth;
		var height = tilemap.tileHeight + tilemap._tileSpacingHeight;
		
		var x = (woodType % _cols) * width;
		var y = Math.floor(woodType/_cols) * height;
		
		graphic = new Image(imagePath,new Rectangle(x,y,width,height));
		
		layer = 9;
		type = "wood";
	}
}
