---
layout: page
slug: blurry
has_code: yes
last_modified_at: 2018-08-13
---

# Haxe: Blurry Text/Graphics

## Problem

How do I make text not blurry?

## Fixing Blurry Things

On my retina Mac, things looks pixelated and blurry by default.  For instance, from the [Text](./3-text.html) tutorial, if you zoom in the text looks like this:

<figure>
    <img src="img/{{page.slug}}/initialzoom.png" />
    <figcaption>Blurry, blurry text</figcaption>
</figure>

I'll save you (and my future self) the searching.  The problem is that I'm on a Retina Mac (the screen has a high DPI).  I need to add this magic string to my `project.xml` file:

```xml
    <window allow-high-dpi="true" />
```

Now the font isn't blurry, but it's shrunken:

<a href="img/{{page.slug}}/text3-sharpbutsmall.png" target="_blank"><img src="img/{{page.slug}}/text3-sharpbutsmall.png" /></a>

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

<a href="img/{{page.slug}}/text4-correct.png" target="_blank"><img src="img/{{page.slug}}/text4-correct.png" /></a>

<figure>
    <img src="img/{{page.slug}}/text5-correctzoom.png" />
    <figcaption>Not blurry!</figcaption>
</figure>

I imagine there's a way to put the `textField` (and other fields) into a container and then scale the container element rather than individually scaling every element.

Here's the final code for `Source/Main.hx` and `project.xml`:

```haxe
{% include_relative code/{{page.slug}}/Source/Main.hx %}
```

```xml
{% include_relative code/{{page.slug}}/project.xml %}
```

