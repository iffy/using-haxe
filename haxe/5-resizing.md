---
layout: page
imgdir: img/resizing
last_modified_at: 2018-08-11
---

# Haxe: Window Resizing

## Scaling Content to New Size

When the window is resized, I'd like the content to also be resized.  
Following bits of this [tutorial](http://books.openfl.org/openfl-developers-guide/display-programming/working-with-display-objects/setting-stage-properties.html) I created an app that has 2 rectangles in it (a top and a left).  The left bar is always the full height of the window and 1/4 of the window width.  The top bar is always 20 pixels tall and spans the right 3/4 of the screen.

<figure>
    <img src="{{page.imgdir}}/resizablerects-1.png" />
    <figcaption>Initial size</figcaption>
</figure>

<figure>
    <img src="{{page.imgdir}}/resizablerects-2.png" />
    <figcaption>After shrinking the window</figcaption>
</figure>

`Source/Main.hx`

```haxe
{% include_relative code/resizing/sticky/Source/Main.hx %}
```

## Scaling Without Distorting

That's all fine... until I put text or an image inside the rectangles.  Then, everything gets distorted.

<figure>
    <img src="{{page.imgdir}}/distorted.png" />
    <figcaption>Distorted text</figcaption>
</figure>

XXX I still have to figure out how to nest components (like I imagine HaxeUI lets you do) without distortion.

## Avoiding Black Window

Another annoying thing is that during resizing, the window goes black:

![Black resizing window]({{page.imgdir}}/blackwindow.gif)

XXX I don't know how to fix this yet.
