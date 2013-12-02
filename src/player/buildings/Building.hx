package player.buildings;

import flash.geom.Rectangle;

import player.UserEntity;

class Building extends UserEntity
{	
	public function new(owner:Player, posX:Int, posY:Int)
	{
		super(owner,posX,posY);

		_imagePath += "building.png";
		
		layer = 5;
		type = "building";
	}
}
