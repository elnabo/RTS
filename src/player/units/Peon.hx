package player.units;

import flash.geom.Rectangle;

import com.haxepunk.graphics.Image;

import player.Player;

class Peon extends Unit
{
	public function new(owner:Player, posX:Int, posY:Int)
	{
		super(owner, posX, posY);
		
		_width = _height = 33;
		
		_imagePath += "peon.png";
		_imageRect = new Rectangle(12, 2, 12+_width, 2+_height);
		graphic = new Image(_imagePath, _imageRect);
		setHitbox(_width,_height);
	}
}
