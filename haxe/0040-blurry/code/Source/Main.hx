package;

import openfl.display.Sprite;
import openfl.text.Font;
import openfl.text.TextField;
import openfl.text.TextFormat;

class Main extends Sprite {
	public function new () {		
		super ();

		trace('openfl.system.Capabilities.pixelAspectRatio: ${openfl.system.Capabilities.pixelAspectRatio}');
		trace('openfl.system.Capabilities.screenDPI: ${openfl.system.Capabilities.screenDPI}');
		trace('stage.window.scale: ${stage.window.scale}');
		trace('stage.window.width: ${stage.window.width}');
		trace('stage.window.height: ${stage.window.height}');
		trace('stage.scaleX: ${stage.scaleX}');
		trace('stage.scaleY: ${stage.scaleY}');
		trace('stage.stageWidth: ${stage.stageWidth}');
		trace('stage.stageHeight: ${stage.stageHeight}');
		
		var format = new TextFormat ("Katamotz Ikasi", 30, 0x7A0026);
		var textField = new TextField ();
		
		textField.defaultTextFormat = format;
		textField.embedFonts = true;
		textField.selectable = false;
		
		textField.x = 50;
		textField.y = 50;
		textField.width = 200;
		
		textField.text = "Hello World";

		textField.scaleX = 2;
		textField.scaleY = 2;
		
		addChild (textField);
	}
}