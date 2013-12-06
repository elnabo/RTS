package map.terrain;

import flash.geom.Rectangle;

import com.haxepunk.Entity;
import com.haxepunk.HXP;
import com.haxepunk.graphics.Image;
import com.haxepunk.graphics.Tilemap;

import player.UserEntity;
import player.units.Peon;
import player.Player;


class GoldMine extends UserEntity
{
	private var _goldRemaining:Int;
	
	private var _unitsIn:Array<Peon>;
	private var _maxUnitsIn:Int = 5;
	
	private var _emptyImage:Image;
	private var _notEmptyImage:Image;
	
	/**
	 * Create a new gold mine.
	 * 
	 * @param x The position of the tree.
	 * @param y The position of the tree.
	 */
	public function new(x:Int, y:Int, quantity:Int=10000)
	{
		super(null,x,y);
		
		var width = 99;
		var height = 93;
		_imagePath += "tilesetMisc.png";
		
		_emptyImage = new Image(_imagePath,new Rectangle(11,9,width,height));
		_notEmptyImage = new Image(_imagePath,new Rectangle(11,9+height,width,height));
		
		graphic = _emptyImage;
		setHitbox(width,height);
		
		_goldRemaining = 19;
		_unitsIn = new Array<Peon>();
		
		layer = 9;
		type = "goldMine";
	}
	
	public function beHarvested(peon:Peon)
	{
		if (Lambda.indexOf(_unitsIn, peon) != -1)
		{
			var peonStoreCapacity = peon.getStorageCapacity(0);
			var peonHarvestSpeed = peon.goldHarvestSpeed;
			
			var harvested:Int = (peonStoreCapacity >= peonHarvestSpeed) ? Std.int(Math.min(peonHarvestSpeed, _goldRemaining)) : Std.int(Math.min(peonStoreCapacity, _goldRemaining)) ;
			_goldRemaining -= harvested;		
			peon.store(0, harvested);
			
			
			if (peon.getStorageCapacity(0) == 0)
			{
				peon.visible = true;
				_unitsIn.remove(peon);
			}
			
			if (_goldRemaining <= 0)
			{
				destroy();
			}
		}
		else if (_unitsIn.length < _maxUnitsIn)
		{
			_unitsIn.push(peon);
			peon.visible = false;
		}
	}
	
	/**
	 * Destroy the goldMine.
	 */
	private function destroy()
	{
		for (peon in _unitsIn)
		{
			peon.visible = true;
			_unitsIn.remove(peon);
		}
		HXP.scene.remove(this);
	}
	
	override public function update()
	{
		graphic = (_unitsIn.length == 0) ? _emptyImage : _notEmptyImage;
		super.update();
	}
}
