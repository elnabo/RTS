package map;

import haxe.ds.StringMap;

import com.haxepunk.Entity;
import com.haxepunk.Scene;
import com.haxepunk.tmx.TmxEntity;
import com.haxepunk.utils.Draw;
import com.haxepunk.utils.Input;

import map.terrain.Terrain;

import player.Player;

import utils.Select;

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
		
		Draw.resetTarget();
	}
	
	override public function update() 
	{
		super.update();
		handleMouse();
	}
	
	private function handleMouse()
	{
		if ( Input.mousePressed )
		{
			if (_select != null)
			{
				remove(_select);
			}
			_select = new Select(Input.mouseX, Input.mouseY);
			add(_select);
		}
		
		if ( Input.mouseDown )
		{
			_select.updatePos(Input.mouseX, Input.mouseY);
		}
		
		if ( Input.mouseReleased && _select != null )
		{
			_select._selected;
			remove(_select);
			_select = null;
		}
	}
	
	private var _select:Select = null;
	//~ private var _selected:StringMap<Array<Entity>>;

}
