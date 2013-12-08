package ui;

import com.haxepunk.HXP;

class ConstructMenu
{
	private var _buildings:Array<Array<String>>;
	private var _buttons:Array<Button>;
	
	public function new(buildings:Array<Array<String>>, x:Int, y:Int)
	{
		_buildings = buildings;
		_buttons = new Array<Button>();
		
		for (i in 0..._buildings.length)
		{
			for (buildingName in _buildings[i].iterator())
			{
				_buttons.push(new ConstructBuildingButton("TownCenter",x,y));
				HXP.scene.add(_buttons[_buttons.length-1]);
			}
		}
		
	}
	
	public function updatePos()
	{
		for (b in _buttons.iterator())
		{
			b.updatePos();
		}
	}
}
