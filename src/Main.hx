import com.haxepunk.Engine;
import com.haxepunk.HXP;

import map.Map;

class Main extends Engine
{

	override public function init()
	{
//#if debug
		HXP.console.enable();
//#end
		HXP.scene = new Map("tiled/init.tmx");
		//~ HXP.scene.init();
	}

	public static function main() { new Main(); }

}
