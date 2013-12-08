package ui;

import com.haxepunk.Entity;
import com.haxepunk.Graphic;
import com.haxepunk.HXP;
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
	
	private var origX:Float;
	private var origY:Float;
	
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
	public function new (x:Float, y:Float, name:String, graph:Graphic)
	{
		super(x, y);
		origX = x;
		origY = y;
		_buttonName = name;
		
		graphic = graph;
		setHitboxTo(this);
		type = "button";
		
		layer = 2;
	}
	
	public function updatePos()
	{
		moveTo(HXP.camera.x + origX,HXP.camera.y + origY);
	}
	
	/**
	 * Detect click on self.
	 * Call interact function on click.
	 */
	override public function update()
	{
		if (Input.mousePressed)
		{
			if ((x <= HXP.camera.x + Input.mouseX) && (HXP.camera.x + Input.mouseX <= (x+_width)) &&  (y <= HXP.camera.y + Input.mouseY) && (HXP.camera.y + Input.mouseY <= (y+_height)))
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
