package player;

import flash.geom.Rectangle;

import com.haxepunk.Entity;

class UserEntity extends Entity
{
	private var _owner:Player;
	
	private var _width(default,null):Int;
	private var _height(default,null):Int;
	
	private var _imageRect:Rectangle;
	private var _imagePath:String = "gfx/";
	
	public function new(owner:Player, posX:Int, posY:Int)
	{
		super(posX,posY);
		_owner = owner;
		
		switch(owner._race)
		{
			case Human:
				_imagePath += "human/";
			case Orc:
				_imagePath += "orc/";
		}
	}
	
	public function goTo(toX:Int, toY:Int)
	{
	}
	
	public function onSelect()
	{
		trace(_imagePath);
	}
}
