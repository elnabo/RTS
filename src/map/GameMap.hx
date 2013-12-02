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
	 * Updates the Entity.
	 */
	override public function update() 
	{
		super.update();
		handleMouse();
	}
	
	/**
	 * Handle mouse activity on the game map.
	 */
	private function handleMouse()
	{
		// On left click start a selection
		if ( Input.mousePressed )
		{
			if (_select != null)
			{
				getSelected();
			}
			_select = new Select(Input.mouseX, Input.mouseY);
			HXP.scene.add(_select);
		}
		
		// Update the selection while the left button is down.
		if ( Input.mouseDown )
		{
			_select.updatePos(Input.mouseX, Input.mouseY);
		}
		
		// Set the selection on release
		if ( Input.mouseReleased && _select != null )
		{
			getSelected();
		}
		
		// Right click mean movement
		if ( Input.rightMouseReleased && (_selected.length > 0) )
		{
			for ( e in _selected.iterator())
		{
			e.goTo(Input.mouseX, Input.mouseY);
		}
		}
	}
	
	/**
	 * Get the selected entities.
	 */
	private function getSelected()
	{
		_selected = _select._selected;
		HXP.scene.remove(_select);
		_select = null;
		for ( e in _selected.iterator())
		{
			e.onSelect();
		}
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
	
	/** The selector */
	private var _select:Select = null;
	
	/** The selected entities */
	private var _selected:Array<UserEntity>;

}
