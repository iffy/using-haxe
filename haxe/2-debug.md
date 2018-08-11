---
layout: page
imgdir: img/2-text
---

# Haxe: Debugging

## trace()

Use `trace()` to log to the console as shown here:

```haxe
{% include_relative code/2-debug/Source/Main.hx %}
```

Running `openfl test neko` will open a blank white window but will write the following to the terminal:

```
Main.hx:9: Starting.  somevar=1
Main.hx:10: end of new()
```

## Interpolation

Note from above that Haxe lets you do string interpolation by using **single quotes** and the `${varname}` syntax.
