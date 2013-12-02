package player.buildings;

import flash.geom.Rectangle;

import player.UserEntity;

/**
 * Abstract class for buildings.
 */
class Building extends UserEntity
{	
	/**
	 * Create a building.
	 * 
	 * @param owner The owner of the building.
	 * @param x The x coordinate of the building.
	 * @param y The y coordinate of the building.
	 */
	public function new(owner:Player, x:Int, y:Int)
	{
		super(owner,x,y);

		_imagePath += "building.png";
		
		layer = 5;
		type = "building";
	}
}
