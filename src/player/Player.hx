package player;

import player.buildings.Building;
import player.buildings.TownCenter;

import player.units.Peon;
import player.units.Unit;

import com.haxepunk.HXP;

import map.GameMap;

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
class Player
{
	/** Count the number of existing player. */
	private static var count(null, null):Int = 0;
	
	/** Id of the player. */
	private var id(null,null):Int;

	/** Scene where the player is. */
	public var _scene:GameMap;

	/** Name of the player. */
	public var _name(default,null):String;
	/** Race of the player. */
	public var _race(default,null):Race;
	/** Team of the player. */
	public var _team(default, null):Int;
	/** Color of the player. */
	public var _color(default,null):Array<Int>;
	
	// [Gold, Wood, Food]
	/** Ressources of the player. */
	private var _ressources:Array<Int>;
	/** Buildings of the player. */
	private var _buildings:Array<Building>;
	/** Units of the player. */
	private var _units:Array<Unit>;
	
	/**
	 * Create a new player.
	 * 
	 * @param scene The scene where the player is.
	 * @param name The name of the player.
	 * @param race The race of the player.
	 * @param team The team of the player.
	 * @param color The color of the player.
	 */
	public function new(scene:GameMap, ?name:String, ?race:Race, ?team:Int, ?color:Array<Int>)
	{
		id = count;
		count++;
		
		_scene = scene;
		
		_name = (name != null) ? name : "Player " + id;
		_race = (race != null) ? race : Race.Human;
		_team = (team != null) ? team : id;
		
		_ressources = [0,0,0];
		_buildings = new Array<Building>();
		_units = new Array<Unit>();
		
	}
	
	/**
	 * Build a town center at the given position (temporary)
	 */
	public function buildTownCenter(posX:Int, posY:Int)
	{
		_buildings.push(new TownCenter(this,posX,posY));
		_scene.add(_buildings[_buildings.length - 1]);
	}
	
	/**
	 * Create a peon at the given position (temporary)
	 */
	public function buildPeon(posX:Int, posY:Int)
	{
		_units.push(new Peon(this,posX,posY));
		_scene.add(_units[_units.length - 1]);
	}
	
}
