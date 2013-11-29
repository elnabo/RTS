package map;

import com.haxepunk.tmx.TmxEntity;
import com.haxepunk.Scene;

import map.terrain.Terrain;
import player.Player;

class Map extends Scene
{
	
	public function new(fileName:String)
	{		
		super();
		var e = new TmxEntity(fileName);

		// load layers named bottom, main, top with the appropriate tileset
		e.loadGraphic("gfx/tileset.png", ["empty"]);

		// loads a grid layer named collision and sets the entity type to collidable
		e.loadMask("collision", "collidable");
		
		e.layer = 10;

		add(e);
		
		
		var p1 = new Player(this);
		p1.buildTownCenter(50,50);
		

	}

}
