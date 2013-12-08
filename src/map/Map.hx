package map;

import com.haxepunk.Entity;
import com.haxepunk.HXP;
import com.haxepunk.Scene;
import com.haxepunk.graphics.Tilemap;

import map.GameMap;
import map.MapMenu;
import map.terrain.Tree;
import map.terrain.GoldMine;
import player.Player;
import ressources.Globales;
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
	
	/** List of player. */
	public var _players(default,null):Array<Player>;
	
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
	}
	
	/**
	 * On start add the woods to the game.
	 */
	override public function begin()
	{
		_players = new Array<Player>();
		var p = new Player();
		p.setClient();
		add(p);
		_players.push(p);
		
		
		_menu = new MapMenu(HXP.windowWidth - MapMenu._width, HXP.windowHeight - MapMenu._height);
		add(_menu);
		
		Globales.map = this;	
		Globales.menu = _menu;	
		Globales.clientPlayer = _players[0];
		
		drawWoods();
		
		_players[0].buildTownCenter(150,150);
		_players[0].buildPeon(300,200);
		
		add(new GoldMine(500,0));
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
