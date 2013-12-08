package ui;

import com.haxepunk.Entity;
import com.haxepunk.Graphic;
import com.haxepunk.graphics.Image;
import com.haxepunk.utils.Input;

/**
 * A button for the menu.
 * 
 * @author Guillaume <elnabo> Desquesnes <g.desquesnes@gmail.com>
 */
class Button extends Entity
{
	/**
	 * The width of the button.
	 */
	private static var _width:Int = 25;
	
	/**
	 * The height of the button.
	 */
	private static var _height:Int = 25;
	
	/**
	 * The name of the button.
	 */
	private var _buttonName:String;
	
	/**
	 * Create a button.
	 * 
	 * @param	x The x position.
	 * @param	y The y position.
	 * @param	width The width.
	 * @param	height The height.
	 * @param	graph The graphic.
	 */
	public function new (x:Int, y:Int, name:String, graph:Graphic)
	{
		super(x, y);
		_buttonName = name;
		
		graphic = graph;
		setHitboxTo(this);
		type = "button";
		
		layer = 2;
	}
	
	/**
	 * Detect click on self.
	 * Call interact function on click.
	 */
	override public function update()
	{
		if (Input.mousePressed)
		{
			if ((x <= Input.mouseX) && (Input.mouseX <= (x+_width)) &&  (y <= Input.mouseY) && (Input.mouseY <= (y+_height)))
				interact();
		}
	}
	
	/**
	 * Called on click.
	 */
	private function interact() 
	{ 
		return;
	};
}
