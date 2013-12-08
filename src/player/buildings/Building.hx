package player.buildings;

import flash.geom.Rectangle;

import player.UserEntity;

/**
 * Abstract class for buildings.
 */
class Building extends UserEntity
{	
	
	public static var cost(default,never):Array<Int> = [100,0];
	
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
	
	/**
	 * Default action when selected.
	 */
	override public function onSelect()
	{
		cast(graphic,UserEntityGraphics).showHealthBar();
		super.onSelect();
	}
	
	/**
	 * Default action when deselected.
	 */
	override public function onDeselect()
	{
		cast(graphic,UserEntityGraphics).hideHealthBar();
		super.onDeselect();
	}
}
