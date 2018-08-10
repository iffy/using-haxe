---
title: "Hello, World!"
layout: page
---

# The Layers

Using Haxe to make an app involves a lot of layers.  Here's some definitions and links.

1. Haxe is a programming language.
1. Haxe can be compiled to a variety of languages, including C, C++ and JavaScript (and others).
1. `haxelib` is a package manager for Haxe.  You use it to install Haxe libraries.
1. OpenFL is an open source implementation of Flash (see [Wikipedia](https://en.wikipedia.org/wiki/OpenFL)).  It's probably more than that, too.
1. Lime is a low-level graphics library, which OpenFL uses.

Command line tools:

1. OpenFL has a command line tool named `openfl`
1. Lime has a command line tool named `lime`
1. Haxelib's command line tool is named `haxelib`

# Install Everything

1. Install [Haxe](https://haxe.org/download/)
1. Install the `haxelib` version of [OpenFL](http://www.openfl.org/download/) with something like:
    ```
haxelib install openfl
haxelib run openfl setup
    ```

# Hello World

You can create a sample application using something like:

```bash
openfl create NyanCat
cd NyanCat
openfl test neko
```

And it can be built as a macOS application like this:

```bash
openfl build mac
open Export/mac/bin/NyanCat
```

I want to make a text-heavy application, so 