package;

import openfl.display.Sprite;
import openfl.geom.Rectangle;
import openfl.Lib;

class Main extends Sprite {	
	public function new () {
		super ();
		var grid = new Grid();
		grid.backgroundColor = 0xff0000;
		grid.alpha = 0.5;
		grid.addRow(20, DistanceUnit.Pixel);
		grid.addRow(1, DistanceUnit.Part);
		grid.addCol(1, DistanceUnit.Part);
		grid.addCol(4, DistanceUnit.Part);
		addChild(grid);

		var widget1 = new Widget();
		widget1.backgroundColor = 0x00ff00;
		widget1.alpha = 0.5;
		grid.addAt(widget1, 0, 0, 1, 1);

		var widget2 = new Widget();
		widget2.backgroundColor = 0x0000ff;
		widget2.alpha = 0.5;
		grid.addAt(widget2, 1, 1, 2, 2);

		grid.draw();
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
		trace("Drawing widget ", this.name);
		
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
			trace("top-most");
			rect.width = Lib.current.stage.stageWidth;
			rect.height = Lib.current.stage.stageHeight;
			return rect;
		} else {
			// Has a parent; ask the parent how big I should be
			trace("has parent");
			rect = parentWidget.getChildDimensions(this);
		}
		return rect;
	}

	public function getChildDimensions(child: Widget):Rectangle {
		// Default widget, children are full size of parent
		return getMyDimensions();
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
		trace("Grid.draw()");
		super.draw();
		trace("children ", children.length);
		for (child in this.children) {
			trace("Drawing grid child");
			child.widget.draw();
		}
	}
	override public function getChildDimensions(child: Widget):Rectangle {
		trace("Calling getChildDimensions");
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
					if (i == o.grid_x) {
						y = r_cursor;
					}
					r_cursor += rowHeights[i];
					if (i == o.grid_x2) {
						h = r_cursor - y;
					}
				}
				var c_cursor = 0.0;
				for (i in 0...colWidths.length) {
					if (i == o.grid_x) {
						x = c_cursor;
					}
					c_cursor += colWidths[i];
					if (i == o.grid_x2) {
						w = c_cursor - x;
					}	
				}
				trace("dims", x, y, w, h);
				return new Rectangle(x, y, w, h);
				// return new Rectangle(
				// 	o.grid_x
				// );
			}
		}
		return new Rectangle(0, 0, 0, 0);
	}
	public function addAt(child: Widget, x:Int = 0, y:Int = 0, x2:Int = 1, y2:Int = 1) {
		child.parentWidget = this;
		var member = new GridMember(child, x, y, x2, y2);
		this.children.push(member);
		addChild(child);
		trace("Added child to grid", this.children.length);
	}
}
