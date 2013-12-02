package player.units;

import com.haxepunk.HXP;

import flash.geom.Rectangle;

import player.UserEntity;

/**
 * Abstract class representing units.
 */
class Unit extends UserEntity
{
	/** Speed of the unit. */
	private var _speed:Float = 10.0;
	
	/**
	 * Create an unit.
	 * 
	 * @param owner The owner of the unit.
	 * @param x The x coordinate of the unit.
	 * @param y The y coordinate of the building.
	 */
	public function new(owner:Player, x:Int, y:Int)
	{
		super(owner,x,y);

		layer = 4;
		type = "unit";
		
	}
	
	/**
	 * Movement function.
	 * 
	 * @param toX Destination x.
	 * @param toY Destination y.
	 */
	override public function goTo(toX:Int, toY:Int)
	{
		x = toX - Std.int(_width / 2);
		y = toY - Std.int(_height / 2);
	}
	
	/**
	 * Update unit and test collision.
	 */
	override public function update()
	{
		super.update();
		testCollision();
	}
	
	/** To be redefined by subclass **/
	private function testCollision()
	{
	}
}
