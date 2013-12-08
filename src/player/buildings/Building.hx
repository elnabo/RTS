package player.buildings;

import flash.geom.Rectangle;

import com.haxepunk.graphics.Image;

import player.UserEntity;
import ressources.Configs;

/**
 * Abstract class for buildings.
 */
class Building extends UserEntity
{	
	
	public static var cost(default,never):Array<Int> = [100,0];
	
	/**
	 * Create a building.
	 * 
	 * @param owner The owner of the building.
	 * @param x The x coordinate of the building.
	 * @param y The y coordinate of the building.
	 */
	public function new(owner:Player, x:Int, y:Int, name:String)
	{
		super(owner,x,y);
		_name = name;

		_imagePath += "building.png";
		
		_width = Configs.buildingsWidth.get(name)[Configs.buildingsWidth.get(name).length -1];
		_height = Configs.buildingsHeight.get(name)[Configs.buildingsHeight.get(name).length -1];
		
		var startX = Configs.buildingsImageStartPos.get(name)[_version][0];
		var startY = Configs.buildingsImageStartPos.get(name)[_version][1];
		_imageRect = new Rectangle(startX, startY, Configs.buildingsWidth.get(name)[_version],Configs.buildingsHeight.get(name)[_version]);
		
		graphic = new UserEntityGraphics(new Image(_imagePath, _imageRect),100);
		setHitbox(_width,_height);
		
		layer = 5;
		type = "building";
	}
	
	/**
	 * Default action when selected.
	 */
	override public function onSelect()
	{
		cast(graphic,UserEntityGraphics).showHealthBar();
		super.onSelect();
	}
	
	/**
	 * Default action when deselected.
	 */
	override public function onDeselect()
	{
		cast(graphic,UserEntityGraphics).hideHealthBar();
		super.onDeselect();
	}
}
