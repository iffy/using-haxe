package;

import openfl.display.Sprite;
import openfl.geom.Rectangle;
import openfl.display.StageAlign;
import openfl.display.StageScaleMode;
import openfl.events.Event;
import openfl.text.Font;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.Lib;

class Main extends Sprite {

	var rootWidget: Widget;

	public function new () {
		super ();

		stage.scaleMode = StageScaleMode.NO_SCALE;
		stage.align = StageAlign.TOP_LEFT;
		stage.addEventListener (Event.RESIZE, resized);

		var grid = new Grid();
		this.rootWidget = grid;
		grid.backgroundColor = 0xff0000;
		grid.addRow(40, DistanceUnit.Pixel);
		grid.addRow(1, DistanceUnit.Part);
		grid.addCol(1, DistanceUnit.Part);
		grid.addCol(4, DistanceUnit.Part);
		addChild(grid);

		var navbar = new VBox();
		navbar.backgroundColor = 0x000000;
		grid.addAt(navbar, 0, 0, 1, 2);

		var label = new Label();
		label.textField.text = "Hello, Sonny";
		label.backgroundColor = 0xffffff;
		navbar.add(label);

		var topbar = new Widget();
		topbar.backgroundColor = 0x0000ff;
		grid.addAt(topbar, 1, 1, 2, 2);
	}
	function resized(e) {
		trace('resized: ${stage.stageWidth} x ${stage.stageHeight}');
		this.rootWidget.draw();
	}
}


class Widget extends Sprite {
	public var min_width: LinearDistance = null;
	public var min_height: LinearDistance = null;
	public var max_width: LinearDistance = null;
	public var max_height: LinearDistance = null;

	public var backgroundColor: Int = 0x00ff00;
	public var parentWidget: Widget = null;

	public function draw() {
		trace("drawing", this.name);
		var dims = getMyDimensions();
		
		// Draw a rectangle
		this.graphics.clear();
		this.graphics.beginFill(this.backgroundColor);
		this.graphics.drawRect(dims.x, dims.y, dims.width, dims.height);	
	}

	function getMyDimensions():Rectangle {
		var rect = new Rectangle();

		if (parentWidget == null) {
			// Top-most widget
			rect.width = Lib.current.stage.stageWidth;
			rect.height = Lib.current.stage.stageHeight;
			return rect;
		} else {
			// Has a parent; ask the parent how big I should be
			rect = parentWidget.getChildDimensions(this);
		}
		return rect;
	}

	public function getChildDimensions(child: Widget):Rectangle {
		// Default widget, children are full size of parent
		return getMyDimensions();
	}

	public function whatsYourHeightFor(width: Float):Float {
		return null;
	}
}

enum DistanceUnit {
	Pixel;
	Part;
}

class LinearDistance {
	public var amount: Float = 0;
	public var unit: DistanceUnit;
	
	public function new(amount: Float, unit: DistanceUnit) {
		this.amount = amount;
		this.unit = unit;
	}
}

class GridMember {
	public var grid_x: Int = 0;
	public var grid_y: Int = 0;
	public var grid_x2: Int = 1;
	public var grid_y2: Int = 1;
	public var widget: Widget;
	public function new(widget: Widget, x:Int = 0, y:Int = 0, x2:Int = 0, y2:Int = 0) {
		this.widget = widget;
		this.grid_x = x;
		this.grid_y = y;
		this.grid_x2 = x2;
		this.grid_y2 = y2;
	}
}

class Grid extends Widget {
	var colWidths: Array<LinearDistance>;
	var rowHeights: Array<LinearDistance>;
	
	var children: Array<GridMember>;

	public function new() {
		super();
		children = new Array();
		rowHeights = new Array();
		colWidths = new Array();
	}
	public function addRow(amount:Float, unit:DistanceUnit) {
		this.rowHeights.push(new LinearDistance(amount, unit));
	}
	public function addCol(amount:Float, unit:DistanceUnit) {
		this.colWidths.push(new LinearDistance(amount, unit));
	}
	function getLinearDimensions(array:Array<LinearDistance>, pixels:Float):Array<Float> {
		var left = pixels;
		var ret = new Array<Float>();
		
		// First pass, the absolute pixel values
		var total_parts = 0.0;
		for (segment in array) {
			ret.push(0);
			if (segment.unit == DistanceUnit.Pixel) {
				ret[ret.length-1] = segment.amount; 
				left -= segment.amount;
			} else {
				total_parts += segment.amount;
			}
		}

		// Second pass, parts
		for (i in 0...array.length) {
			if (array[i].unit == DistanceUnit.Part) {
				ret[i] = (left / total_parts) * array[i].amount;
			}
		}
		return ret;
	}
	public function getRowHeights(dims:Rectangle):Array<Float> {
		return getLinearDimensions(rowHeights, dims.height);
	}
	public function getColWidths(dims:Rectangle):Array<Float> {
		return getLinearDimensions(colWidths, dims.width);
	}

	override public function draw() {
		super.draw();
		for (child in this.children) {
			child.widget.draw();
		}
	}
	override public function getChildDimensions(child: Widget):Rectangle {
		var mine = this.getMyDimensions();
		var rowHeights = getRowHeights(mine);
		var colWidths = getColWidths(mine);
		
		// XXX Inefficient finding of child
		for (o in this.children) {
			if (o.widget == child) {
				// found it
				var x = 0.0;
				var y = 0.0;
				var w = 0.0;
				var h = 0.0;
				var r_cursor = 0.0;
				for (i in 0...rowHeights.length) {
					if (i == o.grid_y) {
						y = r_cursor;
					}
					r_cursor += rowHeights[i];
					if (i == o.grid_y2-1) {
						h = r_cursor - y;
					}
				}
				var c_cursor = 0.0;
				for (i in 0...colWidths.length) {
					if (i == o.grid_x) {
						x = c_cursor;
					}
					c_cursor += colWidths[i];
					if (i == o.grid_x2-1) {
						w = c_cursor - x;
					}	
				}
				return new Rectangle(x, y, w, h);
			}
		}
		return new Rectangle(0, 0, 0, 0);
	}
	public function addAt(child: Widget, x:Int = 0, y:Int = 0, x2:Int = 1, y2:Int = 1) {
		child.parentWidget = this;
		var member = new GridMember(child, x, y, x2, y2);
		this.children.push(member);
		addChild(child);
	}
}

class VBox extends Widget {
	var children: Array<Widget>;

	public function new() {
		super();
		children = new Array();
	}
	override public function draw() {
		super.draw();
		trace("VBox draw");
		for (child in children) {
			child.draw();
		}
	}
	public function add(child: Widget) {
		child.parentWidget = this;
		children.push(child);
		addChild(child);
	}
	override public function getChildDimensions(child: Widget):Rectangle {
		// Default mode is to lay them out according to their heights
		var mine = getMyDimensions();
		var rect = new Rectangle(0,0,0,0);
		rect.width = mine.width;
		var y_cursor = 0.0;
		for (child in children) {
			rect.y = y_cursor;
			var height = child.whatsYourHeightFor(mine.width);
			rect.height = height;
			y_cursor += height;
		}
		return rect;
	}
}


class Label extends Widget {
	public var textField: TextField;
	
	public function new() {
		super();
		var format = new TextFormat("Arial", 20, 0x00ff00);

		textField = new TextField();
		textField.defaultTextFormat = format;
		textField.embedFonts = true;
		// textField.scaleY = Lib.current.stage.window.scale;
		// textField.scaleX = textField.scaleY;
		this.scaleX = Lib.current.stage.window.scale;
		this.scaleY = this.scaleX;
		addChild(textField);
	}
	override public function whatsYourHeightFor(width:Float):Float {
		textField.width = width;
		return textField.textHeight;
	}
	override public function draw() {
		super.draw();
		trace("Label draw");
		trace('text dim: ${textField.textWidth} x ${textField.textHeight}');
	}
}