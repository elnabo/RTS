package utils;

import com.haxepunk.Entity;
import com.haxepunk.HXP;
import com.haxepunk.graphics.Image;

import map.Map;
import player.Player;
import player.buildings.Building;
import ressources.Configs;

class Builder extends Entity
{
	private var _green:Image;
	private var _red:Image;
	private var _building:Class<Dynamic>;
	
	private var _halfWidth:Int;
	
	private var _buildable:Bool = false;
	
	public function new(width:Int, height:Int, building:Class<Dynamic>)
	{
		super(-1*width,-1*height);
		
		_green = Image.createRect(width, height,0x61FF23,0.5);
		_red = Image.createRect(width, height,0xFF0C00,0.5);
		
		_building = building;
		
		_halfWidth = Std.int(width/2);
		
		graphic = _green;
		setHitbox(width,height);
		type = "builder";
		
		layer = 4;
	}
	
	public function setTo(x:Int, y:Int)
	{
		var tw = Configs.tileWidth;
		var th = Configs.tileHeight;
		moveTo(Math.floor(x/tw)*tw, Math.floor(y/th)*th);
		
		if (collideTypes(["building","unit","collidable","tree","goldMine"],this.x,this.y) == null)
		{
			graphic = _green;
			_buildable = true;
		}
		else
		{
			graphic = _red;
			_buildable = false;
		}
	}
	
	public function build(player:Player)
	{
		if (_buildable)
		{
			player.build(_building,Std.int(x),Std.int(y));
		}
	}
}
