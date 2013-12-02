package player.buildings;

import flash.geom.Rectangle;

import com.haxepunk.graphics.Image;

import player.Player;

class TownCenter extends Building
{	
	public function new(owner:Player, posX:Int, posY:Int)
	{
		super(owner, posX, posY);
		
		_width = _height = 128;
		_imageRect = new Rectangle(12, 10, 12 + _width, 10 + _height);
		graphic = new Image(_imagePath, _imageRect);
		setHitbox(_width,_height);
	}
}
