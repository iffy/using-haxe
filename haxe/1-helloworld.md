---
layout: page
imgdir: img/1-helloworld
---

# Haxe: Hello, World!

## The Layers

Using Haxe to make an app involves a lot of layers.  Here's some definitions and links.

1. [Haxe](https://haxe.org/) is a programming language.
1. Haxe can be compiled to a variety of languages, including C, C++ and JavaScript (and others).
1. `haxelib` is a package manager for Haxe.  You use it to install Haxe libraries.
1. [OpenFL](http://www.openfl.org/) is an open source implementation of Flash (see [Wikipedia](https://en.wikipedia.org/wiki/OpenFL)).  It's probably more than that, too.
1. [Lime](https://github.com/openfl/lime) is a low-level graphics library, which OpenFL uses.

Command line tools:

1. OpenFL has a command line tool named `openfl`
1. Lime has a command line tool named `lime`
1. Haxelib's command line tool is named `haxelib`

## Install Everything

1. Install [Haxe](https://haxe.org/download/)
1. Install the `haxelib` version of [OpenFL](http://www.openfl.org/download/) with something like:
    ```bash
haxelib install openfl
haxelib run openfl setup
    ```

## Hello, World!

You can create a sample application using something like:

```bash
openfl create NyanCat
cd NyanCat
```

Run the program using the Neko backend.  I'm still not quite sure what the Neko backend actually is, but it's much quicker to launch using Neko than the other backends.

```
openfl test neko
```

This is what I see:

<figure>
   <img src="{{page.imgdir}}/nyan.gif" /> 
   <figcaption>The rainbow result</figcaption>
</figure>

To build and run a macOS application, do this:

```bash
openfl build mac
open Export/mac/bin/NyanCat.app
```

Happily, the application it makes is only 16MB.  Not the smallest, but relatively small.

```
$ du -ch Export/macos/bin/NyanCat.app
 16M    Export/macos/bin/NyanCat.app/Contents/MacOS
 12K    Export/macos/bin/NyanCat.app/Contents/Resources/assets
 52K    Export/macos/bin/NyanCat.app/Contents/Resources/lib/library
 56K    Export/macos/bin/NyanCat.app/Contents/Resources/lib
4.0K    Export/macos/bin/NyanCat.app/Contents/Resources/manifest
172K    Export/macos/bin/NyanCat.app/Contents/Resources
 16M    Export/macos/bin/NyanCat.app/Contents
 16M    Export/macos/bin/NyanCat.app
 16M    total
```

## Files and Directories

The application is made up of the following files:

`Source/Main.hx` is the main entrypoint for your application.

```haxe
{% include_relative code/NyanCat/Source/Main.hx %}
```

`project.xml` is where build/project configuation goes:

```xml
{% include_relative code/NyanCat/project.xml %}
```

The `Assets/` directory is included in your application (because of the `<assets path="Assets" rename="assets" />` directive in `project.xml`)

## Other Tutorials

I'm not going to duplicate all the existing excellent tutorials out there.  I'd recommend reading the [HaxeCoder Tutorials](https://keyreal-code.github.io/haxecoder-tutorials/) especially if you're making a game.  The [Pong tutorials](https://keyreal-code.github.io/haxecoder-tutorials/07_how_to_make_a_pong_game_in_haxe_and_openfl_part_1.html) are a great starting point.

However, there are some things not covered in those tutorials (such as displaying text) that I'll cover.
