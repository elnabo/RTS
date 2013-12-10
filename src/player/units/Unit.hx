package player.units;

//~ import com.haxepunk.Entity;
import com.haxepunk.HXP;
import com.haxepunk.Tween;
import com.haxepunk.masks.Grid;
import com.haxepunk.tweens.motion.LinearMotion;
import com.haxepunk.tweens.TweenEvent;
import com.haxepunk.ai.GridPath;
import com.haxepunk.ai.PathNode;

import flash.geom.Rectangle;

import player.UserEntity;
import utils.ComplexGrid;

/**
 * Abstract class representing units.
 */
class Unit extends UserEntity
{
	/** Speed of the unit. */
	private var _speed:Float = 200;
	
	private var pathTween:LinearMotion;
	private var targetNode:PathNode;
	private var path:Array<PathNode>;
	
	/**
	 * Create an unit.
	 * 
	 * @param owner The owner of the unit.
	 * @param x The x coordinate of the unit.
	 * @param y The y coordinate of the building.
	 */
	public function new(owner:Player, x:Int, y:Int)
	{
		super(owner,x,y);

		layer = 4;
		type = "unit";
		
		 // tween to handle path movement
        pathTween = new LinearMotion(moveToNextNode, TweenType.Persist);
        pathTween.addEventListener(TweenEvent.UPDATE, function(_) {
            this.x = pathTween.x;
            this.y = pathTween.y;
        });
        addTween(pathTween);
		
	}
	
	/**
	 * Movement function.
	 * 
	 * @param toX Destination x.
	 * @param toY Destination y.
	 */
	override public function goTo(toX:Float, toY:Float)
	{
		var graph = new GridPath(ComplexGrid.getComplexGrid("collidable",["tree"],32,32), {
			walkDiagonal: true,
			optimize: LineOfSight
		});
		
        path = graph.search(Std.int(x/32), Std.int(y/32), Std.int(toX/32), Std.int(toY/32));
  
	}
	
	public function moveToNextNode(?p:Dynamic)
    {
        if (path != null && path.length > 0 && !pathTween.active)
        {
            targetNode = path.shift();
            pathTween.setMotionSpeed(x, y, targetNode.worldX, targetNode.worldY, _speed);

        }
    }
	
	/**
	 * Update unit and test collision.
	 */
	override public function update()
	{
		super.update();
		moveToNextNode();
		testCollision();
	}
	
	/** To be redefined by subclass **/
	private function testCollision()
	{
	}
	
	/**
	 * Default action when selected.
	 */
	override public function onSelect()
	{
		cast(graphic,UserEntityGraphics).showHealthBar();
		super.onSelect();
	}
	
	/**
	 * Default action when deselected.
	 */
	override public function onDeselect()
	{
		cast(graphic,UserEntityGraphics).hideHealthBar();
		super.onDeselect();
	}
	
}
