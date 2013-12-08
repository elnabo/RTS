package ui;

import com.haxepunk.HXP;
import com.haxepunk.graphics.Image;

import map.Map;
import player.buildings.Building;
import ressources.Configs;
import ressources.Globales;

class ConstructBuildingButton extends Button
{
	private static var _packageName = "player.buildings.";
	
	private var _buildingWidth:Int;
	private var _buildingHeight:Int;
	
	public function new(name:String, x:Int, y:Int)
	{
		super(x,y,name,Image.createRect(Button._width,Button._height,0));
		
		_buildingWidth = Configs.buildingsWidth.get(name)[Configs.buildingsWidth.get(name).length -1];
		_buildingHeight = Configs.buildingsHeight.get(name)[Configs.buildingsHeight.get(name).length -1];
	}
	
	/**
	 * Called on click.
	 */
	override private function interact() 
	{ 
		Globales.clientPlayer.addBuilder(_buildingWidth, _buildingHeight, Type.resolveClass(_packageName + _buttonName));
	};
}
