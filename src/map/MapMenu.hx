package map;

import flash.display.BitmapData;
import flash.geom.Point;

import com.haxepunk.Entity;
import com.haxepunk.HXP;
import com.haxepunk.Graphic;
import com.haxepunk.graphics.Graphiclist;
import com.haxepunk.graphics.Image;
import com.haxepunk.graphics.Text;

import ressources.Globales;
import ui.ConstructMenu;

class MapMenu extends Entity
{
	public static var _width(default, null):Int = 640;
	public static var _height(default, null):Int = 70;
	
	private var _menuDisplay:MapMenuDisplay;
	
	private var _constructMenu:ConstructMenu;
	
	public function new(x:Int, y:Int)
	{
		super(x,y);
		_menuDisplay = new MapMenuDisplay([0,0],0,0);//new Image("gfx/menuBar.png");
		graphic = _menuDisplay;
		
		type = "menuBar";
		
		_constructMenu = new ConstructMenu([["TownCenter"]],200,y+20);
		setHitbox(0,0,MapMenu._width,MapMenu._height);
		
		
		layer = 3;
	}
	
	override public function update()
	{
		// remove hardcoded
		_menuDisplay.setRessources(Globales.clientPlayer._ressources);
		_menuDisplay.setPopulation(Globales.clientPlayer._curPopulation,Globales.clientPlayer._maxPopulation);
		super.update();
	}
	
}

class MapMenuDisplay extends Graphiclist
{	
	private var _ressourcesDisplay:Array<Text>;
	
	private var _background:Image;
	
	public function new(ressources:Array<Int>, pop:Int, popMax:Int) 
	{		
		_background = new Image("gfx/menuBar.png");
		
		_ressourcesDisplay = new Array<Text>();
		
		var ys = [18,38];
		for (i in 0...ressources.length)
		{
			_ressourcesDisplay.push(new Text(Std.string(ressources[i]), 575, ys[i], {color:0}));
			_ressourcesDisplay[i].x = 575;
		}
		
		_ressourcesDisplay.push(new Text(Std.string(pop) + "/" + Std.string(popMax), 575, 56, {color:0}));
		super(_ressourcesDisplay);
		add(_background);
		
	}
	
	public function setRessources(ressources:Array<Int>)
	{
		for (i in 0...ressources.length)
		{
			_ressourcesDisplay[i].text = Std.string(ressources[i]);
		}
	}
	
	public function setPopulation(pop:Int, popMax:Int)
	{
		_ressourcesDisplay[_ressourcesDisplay.length - 1].text = Std.string(pop) + "/" + Std.string(popMax);
	}
}
