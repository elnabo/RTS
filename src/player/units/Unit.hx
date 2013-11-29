package player.units;

import player.Player;
import com.haxepunk.Entity;

class Unit extends Entity
{
	private var _owner:Player;
	
	public function new(owner:Player)
	{
		super();
		_owner = owner;
	}
	
}
