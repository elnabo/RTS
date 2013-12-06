package player.units;

import flash.geom.Rectangle;

import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;

import map.terrain.Tree;
import map.terrain.GoldMine;
import player.buildings.Building;
import player.buildings.TownCenter;

/**
 * Represent a peon.
 */
class Peon extends Unit
{
	/** Max ressource capacity. */
	public var maxCapacity(default,null):Array<Int>;
	//~ public var maxCapacity(default,null):Int = 10;
	/** How much wood harvested per tick. */
	public var woodHarvestSpeed(default,null):Int = 1;
	/** How much wood harvested per tick. */
	public var goldHarvestSpeed(default,null):Int = 2;
	
	private var _harvestTime(default,never):Float = 0.5;
	/** */
	private var _lastHarvest:Float;
	
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
		
		maxCapacity = [10,10];
		storage = [0,0];
		_lastHarvest = _harvestTime;
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
		return maxCapacity[ressource] - storage[ressource];
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
	
	override public function update()
	{
		_lastHarvest -= HXP.elapsed;
		super.update();
	}
	
	/** 
	 * 
	 */
	override private function testCollision()
	{
		if (_lastHarvest <= 0)
		{
			var trees:Array<Tree> = new Array<Tree>();
			collideInto("tree",x,y,trees);
			
			if (trees.length > 0)
			{
				trees[0].beHarvested(this);
				_lastHarvest = _harvestTime;
				
				return ;
			}
			
			if (storage[0] < maxCapacity[0])
			{
				var goldMines:Array<GoldMine> = new Array<GoldMine>();
				collideInto("goldMine",x,y,goldMines);
			
				if (goldMines.length > 0)
				{
					goldMines[0].beHarvested(this);
					_lastHarvest = _harvestTime;
				
					return ;
				}	
			}
		}
		
		var buildings:Array<Building> = new Array<Building>();
		collideInto("building",x,y,buildings);
		
		if (buildings.length > 0)
		{
			if (Std.is(buildings[0], TownCenter) && buildings[0].isMine(this))
			{
				_owner.moreRessource(storage);
				storage = [0,0];
			}
		}
	}
}
