package player;

import flash.geom.Rectangle;

import com.haxepunk.Entity;

/**
 * Abstract class for building or units.
 */
class UserEntity extends Entity
{
	/** The owner of the entity. */
	private var _owner(default,null):Player;
	
	/** Width of the entity. */
	private var _width(default,null):Int;
	/** Height of the entity. */
	private var _height(default,null):Int;
	
	/** Position of the tile on the tileset. */
	private var _imageRect:Rectangle;
	/** Path to the tileset. */
	private var _imagePath:String = "gfx/";
	
	/**
	 * Create a new entity.
	 * 
	 * @param owner The owner of the entity.
	 * @param x The position of the entity.
	 * @param y The position of the entity.
	 */
	public function new(owner:Player, x:Int, y:Int)
	{
		super(x,y);
		_owner = owner;
		
		switch(owner._race)
		{
			case Human:
				_imagePath += "human/";
			case Orc:
				_imagePath += "orc/";
		}
	}
	
	/**
	 * 
	 */
	public function goTo(toX:Int, toY:Int)
	{
	}
	
	/**
	 * Default action when selected.
	 */
	public function onSelect()
	{
		trace(_imagePath);
	}
	
	public function isMine(e:UserEntity):Bool
	{
		return _owner.id == e._owner.id;
	}
	
	public function isFriendly(e:UserEntity):Bool
	{
		return _owner._team == e._owner._team;
	}
	
}