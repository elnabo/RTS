package map;

import com.haxepunk.Entity;
import com.haxepunk.HXP;
import com.haxepunk.Scene;
import com.haxepunk.graphics.Tilemap;

import map.GameMap;
import map.terrain.Tree;
import player.Player;
import ui.MapMenu;
import utils.Select;

/**
 * Contains all information about the game. 
 */
class Map extends Scene
{
	/** The map of the game. */
	public var _gameMap:GameMap;
	/** The menu of the game. */
	public var _menu:MapMenu;
	
	/**
	 * Create a new map of the game.
	 * 
	 * @param fileName The path of the TMX file of the level.
	 */ 
	public function new(fileName:String)
	{		
		super();
		
		_gameMap = new GameMap(fileName);
		add(_gameMap);
		
		_menu = new MapMenu(HXP.windowWidth - MapMenu._width, HXP.windowHeight - MapMenu._height);
		add(_menu);
	}
	
	/**
	 * On start add the woods to the game.
	 */
	override public function begin()
	{
		drawWoods();
		
		var p1 = new Player(_gameMap);
		p1.buildTownCenter(150,150);
		p1.buildPeon(300,200);
	}
	
	/**
	 * Add the woods entities.
	 */
	private function drawWoods()
	{
		var map = _gameMap.map;
		var woods = map.layers.get("wood");
		
		var spacing = map.getTileMapSpacing("wood");
		var tilemap = new Tilemap(_gameMap._graphism, map.fullWidth, map.fullHeight, map.tileWidth, map.tileHeight,spacing, spacing);
		
		var gid;
		
		for (row in 0...woods.height)
			{
				for (col in 0...woods.width)
				{
					gid = woods.tileGIDs[row][col] - 1;
					// Wood tiles hardcoded need to be done elseway.
					if (gid < 102 || gid > 141 || gid == 126) continue;
					add(new Tree(col * tilemap.tileWidth, row * tilemap.tileHeight ,gid,_gameMap._graphism,tilemap));
				}
			}
	}
}
