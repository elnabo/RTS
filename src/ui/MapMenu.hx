package ui;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;

class MapMenu extends Entity
{
	public static var _width(default, null):Int = 640;
	public static var _height(default, null):Int = 70;
	
	public function new(x:Int, y:Int)
	{
		super(x,y);
		graphic = new Image("gfx/menuBar.png");
		
		type = "menuBar";
		
		setHitbox(0,0,MapMenu._width,MapMenu._height);
	}
}
