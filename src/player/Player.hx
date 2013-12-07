package player;

import map.GameMap;
import map.Map;
import player.buildings.Building;
import player.buildings.TownCenter;
import player.units.Peon;
import player.units.Unit;
import utils.Select;
import utils.Builder;

import com.haxepunk.Entity;
import com.haxepunk.HXP;
import com.haxepunk.utils.Input;

/**
 * Available Race.
 */
enum Race
{
	Human;
	Orc;
}

/**
 * Represent a player.
 */
class Player extends Entity
{
	/** Count the number of existing player. */
	private static var count(null, null):Int = 0;
	
	/** Id of the player. */
	public var id(default,null):Int;

	/** Name of the player. */
	public var _playerName(default,null):String;
	/** Race of the player. */
	public var _race(default,null):Race;
	/** Team of the player. */
	public var _team(default, null):Int;
	/** Color of the player. */
	public var _color(default,null):Array<Int>;
	
	private var _client(default,null):Bool;
	
	// [Gold, Wood]
	/** Ressources of the player. */
	public var _ressources(default,null):Array<Int>;
	/** Population max */
	public var _maxPopulation(default,null):Int = 100;
	/** Current population */
	public var _curPopulation(default,null):Int;
	/** Buildings of the player. */
	private var _buildings:Array<Building>;
	/** Units of the player. */
	private var _units:Array<Unit>;
	
	/** The selector */
	private var _select:Select = null;
	
	/** The selected entities */
	private var _selected:Array<UserEntity>;
	
	/** The builder */
	private var _builder:Builder = null;
	
	/**
	 * Create a new player.
	 * 
	 * @param name The name of the player.
	 * @param race The race of the player.
	 * @param team The team of the player.
	 * @param color The color of the player.
	 */
	public function new(?name:String, ?race:Race, ?team:Int, ?color:Array<Int>, ?isClient:Bool = false)
	{
		super();
		id = count;
		count++;
		
		_playerName = (name != null) ? name : "Player " + id;
		_race = (race != null) ? race : Race.Human;
		_team = (team != null) ? team : id;
		_client = isClient;
		
		_ressources = [0,0];
		_buildings = new Array<Building>();
		_units = new Array<Unit>();
		_curPopulation = 0;
		
	}
	
	public function setClient(val:Bool=true)
	{
		_client = val;
	}
	
	/**
	 * Build a town center at the given position (temporary)
	 */
	public function buildTownCenter(posX:Int, posY:Int)
	{
		_buildings.push(new TownCenter(this,posX,posY));
		HXP.scene.add(_buildings[_buildings.length - 1]);
	}
	
	/**
	 * Create a peon at the given position (temporary)
	 */
	public function buildPeon(posX:Int, posY:Int)
	{
		_units.push(new Peon(this,posX,posY));
		HXP.scene.add(_units[_units.length - 1]);
	}
	
	/**
	 * 
	 */
	public function build(buildable:Class<Dynamic>, x:Int, y:Int)
	{
		_buildings.push(Type.createInstance(buildable,[this,x,y]));
		HXP.scene.add(_buildings[_buildings.length - 1]);
		
		HXP.scene.remove(_builder);
		_builder = null;
	}
	
	/**
	 * 
	 */
	public function addBuilder(width:Int, height:Int, building:Class<Dynamic>)
	{
		if (_builder != null)
		{
			HXP.scene.remove(_builder);
		}
		_builder = new Builder(width, height, building);
		HXP.scene.add(_builder);
	}
	
	/**
	 * 
	 */
	public function moreRessource(ressources:Array<Int>)
	{
		if (ressources.length != 2)
		{
			return;
		}
		for ( i in 0...ressources.length )
		{
			_ressources[i] += ressources[i];
		}
	}
	
	/**
	 * Updates the Entity.
	 */
	override public function update() 
	{
		super.update();
		if (_client)
		{
			handleMouse();
		}
	}
	
	/**
	 * Handle mouse activity on the game map.
	 */
	private function handleMouse()
	{
		// Do nothing if not on the game map.
		if (Input.mouseY >= cast(HXP.scene,Map)._menu.y)
		{
			return;
		}
		
		if (_builder != null)
		{
			_builder.setTo(Input.mouseX, Input.mouseY);
		}
		
		// On left click start a selection
		if ( Input.mousePressed )
		{
			if (_builder != null)
			{
				_builder.build(this);
				return;
			}
			
			unselectAll();
			if (_select != null)
			{
				getSelected();
			}
			_select = new Select(Input.mouseX, Input.mouseY);
			HXP.scene.add(_select);
			//~ constructBuildable(TownCenter, Input.mouseX, Input.mouseY);
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
	 * Unselect the selected entities.
	 */
	private function unselectAll()
	{
		if (_selected == null)
		{
			return;
		}
		for ( e in _selected.iterator())
		{
			e.onDeselect();
		}
	}
	
	/**
	 * Unselect the entity.
	 */
	public function unselect(e:UserEntity)
	{
		if (_selected == null)
		{
			return;
		}
		if (_selected.remove(e))
		{
			e.onDeselect();
		}
	}
	
}
