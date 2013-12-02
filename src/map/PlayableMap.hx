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

class PlayableMap extends TmxEntity
{
	public var _graphism(default,null):String = "gfx/tileset.png";
	
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
				getSelected();
			}
			_select = new Select(Input.mouseX, Input.mouseY);
			HXP.scene.add(_select);
		}
		
		if ( Input.mouseDown )
		{
			_select.updatePos(Input.mouseX, Input.mouseY);
		}
		
		if ( Input.mouseReleased && _select != null )
		{
			getSelected();
		}
		
		if ( Input.rightMouseReleased && (_selected.length > 0) )
		{
			for ( e in _selected.iterator())
		{
			e.goTo(Input.mouseX, Input.mouseY);
		}
		}
	}
	
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
	
	public function add<E:Entity>(e:E):E
	{
		HXP.scene.add(e);
		return e;
	}
	
	public function remove<E:Entity>(e:E):E
	{
		HXP.scene.remove(e);
		return e;
	}
	
	private var _select:Select = null;
	private var _selected:Array<UserEntity>;

}
