package utils;

import com.haxepunk.Entity;
import com.haxepunk.utils.Draw;

class Select extends Entity
{
	public var _startX:Int;
	public var _startY:Int;
	public var _bottomX:Int;
	public var _bottomY:Int;
	
	private var _alpha:Float;
	private var _color:Int;
	
	public var _selected(default,null):Array<Entity>;
	
	private static var _collidable(default,never):Array<String> = ["unit","building"];
	
	public function new(newX:Int, newY:Int, ?color:Int=0xFF0000, ?alpha:Float=0.4)
	{
		super(newX,newY);
		
		_startX = newX;
		_startY = newY;
		
		_bottomX = newX;
		_bottomY = newY;
		
		
		setHitbox(0,0,newX,newY);
		
		_color = color;
		_alpha = alpha;
		
		type = "select";
		layer = 1;
	}
	
	public function updatePos(x:Int, y:Int)
	{
		_bottomX = x;
		_bottomY = y;
		
		var hbOrigX = Std.int(Math.min(_bottomX,_startX));
		var hbOrigY = Std.int(Math.min(_bottomY,_startY));
		var hbWidth = Std.int(Math.abs(_startX - _bottomX));
		var hbHeight = Std.int(Math.abs(_startY - _bottomY));
		
		this.x = this._x = hbOrigX;
		this.y = this._y = hbOrigY;
		
		setHitbox(hbWidth,hbHeight);
		updateSelected();
	}
	
	private function updateSelected()
	{
		_selected = new Array<Entity>();
		for ( collideType in Select._collidable.iterator())
		{
			collideInto(collideType,x,y,_selected);
			if (_selected.length > 0)
			{
				break;
			}
		}
	}
	
	override public function render():Void
	{
		super.render();
		
		Draw.hitbox(this,false,0x000000,_alpha);
		
		Draw.line(_startX,_startY,_startX,_bottomY,_color);
		Draw.line(_startX,_startY,_bottomX,_startY,_color);
		Draw.line(_bottomX,_startY,_bottomX,_bottomY,_color);
		Draw.line(_startX,_bottomY,_bottomX,_bottomY,_color);
	}
	
}
