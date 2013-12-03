package map;

import flash.display.BitmapData;
import flash.geom.Point;

import com.haxepunk.Entity;
import com.haxepunk.HXP;
import com.haxepunk.Graphic;
import com.haxepunk.graphics.Graphiclist;
import com.haxepunk.graphics.Image;
import com.haxepunk.graphics.Text;

class MapMenu extends Entity
{
	public static var _width(default, null):Int = 640;
	public static var _height(default, null):Int = 70;
	
	private var _menuDisplay:MapMenuDisplay;
	private var _map(default,null):Map;
	
	public function new(x:Int, y:Int)
	{
		super(x,y);
		_menuDisplay = new MapMenuDisplay([0,0], ["Gold", "Wood"]);//new Image("gfx/menuBar.png");
		graphic = _menuDisplay;
		
		type = "menuBar";
		
		setHitbox(0,0,MapMenu._width,MapMenu._height);
	}
	
	override public function added()
	{
		_map = cast(HXP.scene, Map);
	}
	
	override public function update()
	{
		// remove hardcoded
		_menuDisplay.setRessources(_map._players[0]._ressources);
		super.update();
	}
	
}

class MapMenuDisplay extends Graphiclist
{	
	private var _ressourcesDisplay:Array<Text>;
	private var _ressourcesNames:Array<String>;
	
	private var _background:Image;
	
	public function new(ressources:Array<Int>, ressourcesNames:Array<String>) 
	{		
		_background = new Image("gfx/menuBar.png");
		
		_ressourcesNames = ressourcesNames;
		_ressourcesDisplay = new Array<Text>();
		for (i in 0...ressourcesNames.length)
		{
			_ressourcesDisplay.push(new Text(ressourcesNames[i] + ": " + ressources[i], 200 + i*(100), 35));
		}
		super(_ressourcesDisplay);
		add(_background);
	}
	
	public function setRessources(ressources:Array<Int>)
	{
		for (i in 0...ressources.length)
		{
			_ressourcesDisplay[i].text = _ressourcesNames[i] + " : " + ressources[i];
		}
	}
}
