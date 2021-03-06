---
layout: page
last_modified_at: 2018-08-10
---

# Haxe: Debugging

## Problem

How do I emit debug info in OpenFL/Haxe?

## trace()

Use `trace()` to log to the console as shown here:

```haxe
{% include_relative code/Source/Main.hx %}
```

Running `openfl test neko` will open a blank white window but will write the following to the terminal:

```
Main.hx:9: Starting.  somevar=1
Main.hx:10: end of new()
```

## Interpolation

Note from above that Haxe lets you do string interpolation by using **single quotes** and the `${varname}` syntax.
