package player.buildings;

import player.Player;
import com.haxepunk.Entity;
import flash.geom.Rectangle;

class Building extends Entity
{
	private var _owner:Player;
	
	//~ public var _posX(default,null):Int;
	//~ public var _posY(default,null):Int;
	
	private var _imageRect:Rectangle;
	private var _imagePath:String = "gfx/";
	
	public function new(owner:Player, posX:Int, posY:Int)
	{
		super(posX,posY);
		_owner = owner;
		//~ x = posX;
		//~ y = posY;
		
		switch(owner._race)
		{
			case Human:
				_imagePath += "human/";
			case Orc:
				_imagePath += "orc/";
		}
		_imagePath += "building.png";
		
		layer = 5;
		type = "building";
	}
}
