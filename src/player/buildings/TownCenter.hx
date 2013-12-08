package player.buildings;

import flash.geom.Rectangle;

import com.haxepunk.graphics.Image;

import player.Player;
import player.UserEntityGraphics;
import player.units.Peon;
import ressources.Configs;

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
		
		_width = Configs.townCenterWidth[1];
		_height = Configs.townCenterHeight[1];
		
		var startX = Configs.townCenterImageStartPos[0][0];
		var startY = Configs.townCenterImageStartPos[0][1];
		_imageRect = new Rectangle(startX, startY, startX + Configs.townCenterWidth[0], startY + Configs.townCenterHeight[0]);
		
		graphic = new UserEntityGraphics(new Image(_imagePath, _imageRect),100);
		setHitbox(_width,_height);
	}
	
	public function storeRessources(e:Peon)
	{
	}
}
