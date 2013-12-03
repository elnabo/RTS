package map.terrain;

import flash.geom.Rectangle;

import com.haxepunk.Entity;
import com.haxepunk.HXP;
import com.haxepunk.graphics.Image;
import com.haxepunk.graphics.Tilemap;

import player.units.Peon;
import player.Player;

/**
 * Represent a tree.
 */
class Tree extends Entity
{
	/** Tile number of the tree. */
	private var _treeType:Int;
	
	/** Hardcoded number of cols in the tileset. */
	private var _cols:Int=19;
	/** Hardcoded number of rows in the tileset. */
	private var _rows:Int=20;
	
	/** Wood quantity of the tree. */
	public var quantity:Int = 100;
	
	/**
	 * Create a new tree.
	 * 
	 * @param x The position of the tree.
	 * @param y The position of the tree.
	 * @param treeType The tile id.
	 * @param imagePath The tileset path.
	 * @param tilemap The tilemap.
	 */
	public function new(x:Int, y:Int, treeType:Int, imagePath:String, tilemap:Tilemap)
	{
		super(x,y);
		_treeType = treeType;
		
		var width = tilemap.tileWidth + tilemap._tileSpacingWidth;
		var height = tilemap.tileHeight + tilemap._tileSpacingHeight;
		
		var x = (treeType % _cols) * width;
		var y = Math.floor(treeType/_cols) * height;
		
		graphic = new Image(imagePath,new Rectangle(x,y,width,height));
		
		layer = 9;
		type = "tree";
		
		setHitbox(32,32);
	}
	
	/**
	 * When harvested by a peon. Reduce the quantity of wood on the tree.
	 * Destroy the tree and update neighboor when there is no more wood.
	 * 
	 * @param peon The peon who harvest.
	 */
	public function beHarvested(peon:Peon)
	{
		var peonStoreCapacity = peon.getStorageCapacity(1);
		var peonHarvestSpeed = peon.woodHarvestSpeed;
		
		var harvested:Int = (peonStoreCapacity >= peonHarvestSpeed) ? Std.int(Math.min(peonHarvestSpeed, quantity)) : Std.int(Math.min(peonStoreCapacity, quantity)) ;
		quantity -= harvested;		
		peon.store(1, harvested);
		
		if (quantity <= 0)
		{
			destroy();
		}
	}
	
	/**
	 * Destroy the tree.
	 */
	private function destroy()
	{
		HXP.scene.remove(this);
	}
	
}
