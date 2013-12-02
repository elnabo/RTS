package utils;

import player.UserEntity;

import com.haxepunk.Entity;
import com.haxepunk.utils.Draw;

/**
 * Simple entities selector.
 */
class Select extends Entity
{
	/** Origin x of the selector. */
	public var _startX:Int;
	/** Origin y of the selector. */
	public var _startY:Int;
	/** Other x extremity of the selector. */
	public var _bottomX:Int;
	/** Other y extremity of the selector. */
	public var _bottomY:Int;
	
	/** Alpha value of the inside of the selector. */
	private var _alpha:Float;
	/** RGB color of the border of the selector. */
	private var _color:Int;
	
	/** Selected entities. */
	public var _selected(default,null):Array<UserEntity>;
	
	/** Type of entities catchable by the selector. */
	private static var _collidable(default,never):Array<String> = ["unit","building"];
	
	/**
	 * Create a new selector.
	 * 
	 * @param newX Start x position of the selector.
	 * @param newY Start y position of the selector.
	 * @param color RGB color of the border.
	 * @param alpha Alpha value of the inside of the selector.
	 */
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
	
	/**
	 * Update the selector and its selection.
	 * 
	 * @param x The new extremity. 
	 * @param y The new extremity. 
	 */
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
	
	/**
	 * Update the selection.
	 */
	private function updateSelected()
	{
		_selected = new Array<UserEntity>();
		for ( collideType in Select._collidable.iterator())
		{
			collideInto(collideType,x,y,_selected);
			if (_selected.length > 0)
			{
				break;
			}
		}
	}
	
	/**
	 * Render the selector.
	 */	
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
