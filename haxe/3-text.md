---
layout: page
imgdir: img/3-text
---

# Haxe: Text

## Displaying Text

I want to display text and text inputs in my app.  After spending a long time Googling, I finally found what I was looking for in one of the standard examples.

```bash
openfl create AddingText
```

This yields the following files:

```
$ tree AddingText/
AddingText/
├── AddingText.hxproj
├── Assets
│   ├── KatamotzIkasi.eot
│   ├── KatamotzIkasi.svg
│   ├── KatamotzIkasi.ttf
│   └── KatamotzIkasi.woff
├── Source
│   └── Main.hx
└── project.xml

2 directories, 7 files
```

Here's `Soruce/Main.hx`

```haxe
{% include_relative code/AddingText/Source/Main.hx %}
```


When I run the example on my mac, I get this:

```bash
cd AddingText
openfl test neko
```

<a href="{{page.imgdir}}/text1-initial.png" target="_blank"><img src="{{page.imgdir}}/text1-initial.png" /></a>

## Fixing Blurry Text

Yay! Text!  But... the text looks pixelated and blurry.  If you click the above image and zoom to full screen, it looks like this:

<figure>
    <img src="{{ page.imgdir }}/text2-initialzoom.png" />
    <figcaption>Blurry, blurry text</figcaption>
</figure>

I'll save you (and my future self) the searching.  The problem is that I'm on a Retina Mac (the screen has a high DPI).  I need to add this magic string to my `project.xml` file:

```xml
    <window allow-high-dpi="true" />
```

Now the font isn't blurry, but it's shrunken:

<a href="{{page.imgdir}}/text3-sharpbutsmall.png" target="_blank"><img src="{{page.imgdir}}/text3-sharpbutsmall.png" /></a>

I add the following to the `Main.new()` function inside `Source/Main.hx` and run it again.

```haxe
        trace('openfl.system.Capabilities.pixelAspectRatio: ${openfl.system.Capabilities.pixelAspectRatio}');
        trace('openfl.system.Capabilities.screenDPI: ${openfl.system.Capabilities.screenDPI}');
        trace('stage.window.scale: ${stage.window.scale}');
        trace('stage.window.width: ${stage.window.width}');
        trace('stage.window.height: ${stage.window.height}');
        trace('stage.scaleX: ${stage.scaleX}');
        trace('stage.scaleY: ${stage.scaleY}');
        trace('stage.stageWidth: ${stage.stageWidth}');
        trace('stage.stageHeight: ${stage.stageHeight}');
```

Output:

```
Main.hx:12: openfl.system.Capabilities.pixelAspectRatio: 1
Main.hx:13: openfl.system.Capabilities.screenDPI: 144
Main.hx:14: stage.window.scale: 2
Main.hx:15: stage.window.width: 800
Main.hx:16: stage.window.height: 600
Main.hx:17: stage.scaleX: 1
Main.hx:18: stage.scaleY: 1
Main.hx:19: stage.stageWidth: 1600
Main.hx:20: stage.stageHeight: 1200
```

Since the `stage.window.scale` is 2, I can make the `textField` scaling match.

```haxe
        textField.scaleX = 2;
        textField.scaleY = 2;
```

Running this results in smooth, correctly-size fonts:

<a href="{{page.imgdir}}/text4-correct.png" target="_blank"><img src="{{page.imgdir}}/text4-correct.png" /></a>

<figure>
    <img src="{{ page.imgdir }}/text5-correctzoom.png" />
    <figcaption>Not blurry!</figcaption>
</figure>

I imagine there's a way to put the `textField` (and other fields) into a container and then scale the container element rather than individually scaling every element.

Here's the final code for `Source/Main.hx` and `project.xml`:

```haxe
{% include_relative code/AddingTextNoBlur/Source/Main.hx %}
```

```xml
{% include_relative code/AddingTextNoBlur/project.xml %}
```

## Resizing Windows

XXX todo: <http://books.openfl.org/openfl-developers-guide/display-programming/working-with-display-objects/setting-stage-properties.html>

## Text Input

