package map;

import com.haxepunk.tmx.TmxEntity;
import com.haxepunk.Scene;

import map.terrain.Terrain;

class Map extends Scene
{
	private var _map(default, null):Array<Array<Int>>;
	
	private var _sizeX(default, null):Int;
	private var _sizeY(default, null): Int;
	
	//~ public function new(sizeX:Int, sizeY:Int, ?random:Bool=true)
	public function new(fileName:String)
	{		
		super();
		var e = new TmxEntity(fileName);

		// load layers named bottom, main, top with the appropriate tileset
		e.loadGraphic("gfx/tileset.png", ["empty"]);

		// loads a grid layer named collision and sets the entity type to collidable
		e.loadMask("collision", "collidable");

		add(e);

	}
	
	public function loadFromTmx(fileName:String)
	{
		
	}
	
	private function setMap(map:Array<Array<Int>>)
	{
		_map = map;
	}

}
