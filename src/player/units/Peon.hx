package player.units;

import flash.geom.Rectangle;

import com.haxepunk.graphics.Image;

import map.terrain.Tree;

/**
 * Represent a peon.
 */
class Peon extends Unit
{
	/** Max ressource capacity. */
	public var maxCapacity(default,null):Int = 200;
	//~ public var maxCapacity(default,null):Int = 10;
	/** How much wood harvested per tick. */
	public var woodHarvestSpeed(default,null):Int = 1;

	// Gold, Wood
	/** How much ressource does he hold. */
	public var storage:Array<Int>;
	
	/**
	 * Create a peon.
	 * 
	 * @param owner The owner of the unit.
	 * @param x The x coordinate of the unit.
	 * @param y The y coordinate of the building.
	 */
	public function new(owner:Player, x:Int, y:Int)
	{
		super(owner, x, y);
		
		_width = _height = 33;
		
		_imagePath += "peon.png";
		_imageRect = new Rectangle(12, 2, 12+_width, 2+_height);
		graphic = new Image(_imagePath, _imageRect);
		setHitbox(_width,_height);
		
		storage = [0,0];
	}
	
	/**
	 * Return how much the peon can store of a given ressource.
	 * 
	 * @param ressource The ressource id.
	 * 
	 * @return The storage capacity of that ressource.
	 */
	public function getStorageCapacity(ressource:Int):Int
	{
		return maxCapacity - storage[ressource];
	}
	
	/**
	 * Store a ressource. Drop other ressources.
	 * 
	 * @param ressource The ressource id.
	 * @param quantity The quantity stored.
	 */
	public function store(ressource:Int, quantity:Int)
	{
		if (storage[ressource] == 0)
		{
			storage = [0,0];
		}
		storage[ressource] += quantity;
	}
	
	/** 
	 * 
	 */
	override private function testCollision()
	{
		var trees:Array<Tree> = new Array<Tree>();
		collideInto("tree",x,y,trees);
		
		if (trees.length > 0)
		{
			trees[0].beHarvested(this);
			trace(storage);
		}
	}
}
