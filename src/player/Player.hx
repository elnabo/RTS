package player;

import player.buildings.Building;
import player.buildings.TownCenter;

import player.units.Peon;
import player.units.Unit;

import com.haxepunk.HXP;

import map.PlayableMap;

enum Race
{
	Human;
	Orc;
}

class Player
{
	private static var count(null, null):Int = 0;
	
	private var id(null,null):Int;

	public var _scene:PlayableMap;

	public var _name(default,null):String;
	public var _race(default,null):Race;
	public var _team(default, null):Int;
	public var _color(default,null):Array<Int>;
	
	// [Gold, Wood, Food]
	private var _ressources:Array<Int>;
	private var _buildings:Array<Building>;
	private var _units:Array<Unit>;
	
	public function new(scene:PlayableMap, ?name:String, ?race:Race, ?team:Int, ?color:Array<Int>)
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
	
	public function buildTownCenter(posX:Int, posY:Int)
	{
		_buildings.push(new TownCenter(this,posX,posY));
		_scene.add(_buildings[_buildings.length - 1]);
	}
	
	public function buildPeon(posX:Int, posY:Int)
	{
		_units.push(new Peon(this,posX,posY));
		_scene.add(_units[_units.length - 1]);
	}
	
}
