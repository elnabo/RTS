package player.buildings;

import player.Player;
import flash.geom.Rectangle;
import com.haxepunk.graphics.Image;

class TownCenter extends Building
{	
	public function new(owner:Player, posX:Int, posY:Int)
	{
		super(owner, posX, posY);
		
		_imageRect = new Rectangle(12, 10, 12+128, 10+128);
		graphic = new Image(_imagePath, _imageRect);
	}
}
