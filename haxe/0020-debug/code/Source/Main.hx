package;
import openfl.display.Sprite;
import openfl.Assets;

class Main extends Sprite {
	public function new () {		
		super ();
		var somevar = 1;
		trace('Starting.  somevar=${somevar}');
		trace("end of new()");
	}
}