package player.units;

import com.haxepunk.HXP;

import flash.geom.Rectangle;

import player.UserEntity;

class Unit extends UserEntity
{
	private var _speed:Float = 10.0;
	
	public function new(owner:Player, posX:Int, posY:Int)
	{
		super(owner,posX,posY);

		layer = 4;
		type = "unit";
		
	}
	
	override public function goTo(toX:Int, toY:Int)
	{
		x = toX - Std.int(_width / 2);
		y = toY - Std.int(_height / 2);
	}
}
