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
	//~ private static var _width = Configs.townCenterWidth[Configs.townCenterWidth.length -1];
	//~ private static var _height = Configs.townCenterHeight[Configs.townCenterWidth.length -1];
	/**
	 * Create a towncenter.
	 * 
	 * @param owner The owner of the towncenter.
	 * @param x The x coordinate of the towncenter.
	 * @param y The y coordinate of the towncenter.
	 */
	public function new(owner:Player, x:Int, y:Int)
	{
		_version = 1;
	
		super(owner, x, y,"TownCenter");
		
		
		//~ _width = Configs.buildingsWidth["TownCenter"]townCenterWidth[Configs.townCenterWidth.length -1];
		//~ _height = Configs.townCenterHeight[Configs.townCenterWidth.length -1];
		
		//~ var startX = Configs.townCenterImageStartPos[_version][0];
		//~ var startY = Configs.townCenterImageStartPos[_version][1];
		//~ _imageRect = new Rectangle(startX, startY, Configs.townCenterWidth[_version],Configs.townCenterHeight[_version]);
		//~ 
		//~ graphic = new UserEntityGraphics(new Image(_imagePath, _imageRect),100);
		//~ setHitbox(_width,_height);
	}
	
	public function storeRessources(e:Peon)
	{
	}
}
