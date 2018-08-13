package;

import openfl.display.CapsStyle;
import openfl.display.Graphics;
import openfl.display.Sprite;
import openfl.display.StageAlign;
import openfl.display.StageScaleMode;
import openfl.events.Event;

class Main extends Sprite {
	
	var topbar : Sprite;
	var leftbar : Sprite;

	function resized(e) {
		trace('resized: ${stage.stageWidth} x ${stage.stageHeight}');
		// trace('topbar: ${topbar.x}');

		var leftbarwidth = stage.stageWidth / 4;
		leftbar.width = leftbarwidth;
		leftbar.height = stage.stageHeight;

		topbar.width = stage.stageWidth - leftbarwidth;
		topbar.height = 20;
		topbar.x = leftbarwidth;
	}
	
	public function new () {
		
		super ();

		stage.scaleMode = StageScaleMode.NO_SCALE;
		stage.align = StageAlign.TOP_LEFT;
		stage.addEventListener (Event.RESIZE, resized);
		
		leftbar = new Sprite ();
		leftbar.graphics.beginFill (0xff0000);
		leftbar.graphics.drawRect (0, 0, 10, 10);
		leftbar.x = 0;
		leftbar.y = 0;
		leftbar.alpha = 0.5;
		addChild (leftbar);

		topbar = new Sprite ();
		topbar.graphics.beginFill(0x0000ff);
		topbar.graphics.drawRect(0, 0, 10, 10);
		topbar.x = 100;
		topbar.y = 0;
		topbar.alpha = 0.5;
		addChild (topbar);	
	}
}