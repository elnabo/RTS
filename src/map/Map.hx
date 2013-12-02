package map;

import com.haxepunk.Entity;
import com.haxepunk.HXP;
import com.haxepunk.Scene;
import com.haxepunk.graphics.Tilemap;

import map.PlayableMap;
import map.terrain.Wood;
import player.Player;
import ui.MapMenu;
import utils.Select;

class Map extends Scene
{
	public var _background:PlayableMap;
	public var _menu:MapMenu;
	
	public function new(fileName:String)
	{		
		super();
		
		_background = new PlayableMap(fileName);
		add(_background);
		
		_menu = new MapMenu(HXP.windowWidth - MapMenu._width, HXP.windowHeight - MapMenu._height);
		add(_menu);
	}
	
	override public function begin()
	{
		drawWoods();
		
		var p1 = new Player(_background);
		p1.buildTownCenter(150,150);
		p1.buildPeon(300,200);
	}
	
	private function drawWoods()
	{
		var map = _background.map;
		var woods = map.layers.get("wood");
		
		var spacing = map.getTileMapSpacing("wood");
		var tilemap = new Tilemap(_background._graphism, map.fullWidth, map.fullHeight, map.tileWidth, map.tileHeight,spacing, spacing);
		
		var gid;
		
		for (row in 0...woods.height)
			{
				for (col in 0...woods.width)
				{
					gid = woods.tileGIDs[row][col] - 1;
					if (gid < 102 || gid > 141 || gid == 126) continue;
					add(new Wood(col * tilemap.tileWidth, row * tilemap.tileHeight ,gid,_background._graphism,tilemap));
				}
			}
	}
	
	override public function update() 
	{
		super.update();
	}
}
