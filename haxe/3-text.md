---
layout: page
imgdir: img/text
slug: text
has_code: yes
last_modified_at: 2018-08-13
---

# Haxe: Text

## Problem

How do I display text?

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
{% include_relative code/{{page.slug}}/Source/Main.hx %}
```


When I run the example on my mac, I get this:

```bash
cd AddingText
openfl test neko
```

<a href="{{page.imgdir}}/text1-initial.png" target="_blank"><img src="{{page.imgdir}}/text1-initial.png" /></a>


