package player;

import com.haxepunk.Graphic;
import com.haxepunk.HXP;
import com.haxepunk.graphics.Graphiclist;
import com.haxepunk.graphics.Image;
import com.haxepunk.graphics.Text;

class UserEntityGraphics extends Graphiclist
{
	private var _maxHealth:Float;
	private var _healthBar:Graphiclist;
	private var _imageWidth:Int;
	
	public function new(image:Image, health:Int=100)
	{
		_maxHealth = health;
		_imageWidth = image.width;
		
		_healthBar = new Graphiclist([Image.createRect(image.width, 3,0)]);
		_healthBar.y = -6;
		_healthBar.visible = false;
		
		
		var greenPart = Image.createRect(image.width-2, 2, 0x26FF00);
		greenPart.x = greenPart.y = 1;
		_healthBar.add(greenPart);

		super([image,_healthBar]);
	}
	
	public function updateHealth(health:Int)
	{
		var redPart = Image.createRect(Std.int((_imageWidth-2)*(_maxHealth-health)/_maxHealth), 2, 0xFF0C00);
		redPart.x = redPart.y = 1;
		
		if (_healthBar.children.length == 3)
		{
			_healthBar.removeAt(2);
		}
		
		_healthBar.add(redPart);
		
	}
	
	public function showHealthBar()
	{
		_healthBar.visible = true;
	}
	public function hideHealthBar()
	{
		_healthBar.visible = false;
	}
	
}
