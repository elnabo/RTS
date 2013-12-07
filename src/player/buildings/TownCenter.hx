package player.buildings;

import flash.geom.Rectangle;

import com.haxepunk.graphics.Image;

import player.Player;
import player.UserEntityGraphics;
import player.units.Peon;

/**
 * Represnt a towncenter.
 */
class TownCenter extends Building
{	
	/**
	 * Create a towncenter.
	 * 
	 * @param owner The owner of the towncenter.
	 * @param x The x coordinate of the towncenter.
	 * @param y The y coordinate of the towncenter.
	 */
	public function new(owner:Player, x:Int, y:Int)
	{
		super(owner, x, y);
		
		_width = _height = 128;
		_imageRect = new Rectangle(12, 10, 12 + _width, 10 + _height);
		graphic = new UserEntityGraphics(new Image(_imagePath, _imageRect),100);
		setHitbox(_width,_height);
	}
	
	public function storeRessources(e:Peon)
	{
	}
}
