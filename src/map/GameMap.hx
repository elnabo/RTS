package map;

import com.haxepunk.Entity;
import com.haxepunk.HXP;
import com.haxepunk.tmx.TmxEntity;
import com.haxepunk.utils.Draw;
import com.haxepunk.utils.Input;

import map.terrain.Terrain;
import player.Player;
import player.UserEntity;
import utils.Select;

/**
 * The map of the game.
 * 
 */
class GameMap extends TmxEntity
{
	/** File containing the tiles. */
	public var _graphism(default,null):String = "gfx/tileset.png";
	
	/**
	 * Intialize a new game map.
	 * 
	 * @param fileName String containing the path of the tileset
	 */
	public function new(fileName:String)
	{		
		super(fileName);

		// load layers named bottom, main, top with the appropriate tileset
		loadGraphic(_graphism, ["empty"]);

		// loads a grid layer named collision and sets the entity type to collidable
		loadMask("collision", "collidable");
		
		layer = 10;
		
		Draw.resetTarget();
	}
	
	/**
	 * Add the entity to the map.
	 * 
	 * @param e The entity.
	 * 
	 * @return The entity.
	 */
	public function add<E:Entity>(e:E):E
	{
		HXP.scene.add(e);
		return e;
	}
	
	/**
	 * Remove the entity from the map.
	 * 
	 * @param e The entity.
	 * 
	 * @return The entity.
	 */
	public function remove<E:Entity>(e:E):E
	{
		HXP.scene.remove(e);
		return e;
	}
	
	//~ /** The selector */
	//~ private var _select:Select = null;
	//~ 
	//~ /** The selected entities */
	//~ private var _selected:Array<UserEntity>;

}
