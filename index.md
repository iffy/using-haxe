---
layout: page
---

So you want to make a cross-platform application?  So do I.  At least, my 2018 self did.  We'll see how far this goes.  I'm documenting the steps I've taken to get things working for me.  It's part guide (so should be updated) and part journal.

I'm working on macOS.

## Typos and Broken Things

If something doesn't work for you, please make a Pull Request or file an issue.

## The Goal

I want an application that works on:

- [ ] macOS retina
- [ ] macOS non-retina
- [ ] Windows
- [ ] Linux
- [ ] iOS
- [ ] Android

Features I want:

- [ ] Smallish executables
- [ ] Lowish memory use
- [ ] Fast boot-up
- [ ] SQLite support
- [ ] SVG graphics (or any vector graphics, really)
- [ ] Auto-updating from GitHub
  - [ ] macOS
  - [ ] Windows
  - [ ] Linux
- [ ] Unicode input support
- [ ] Accessibility

Features I'm not expecting but would love to have:

- [ ] Embedded browser for Desktop

Things I don't care about

- Matching the look of the host OS.  I'd rather have my app match itself across OSes.
- Sounds/music

## Progress

{% for page in site.pages %}
{%- if page.title -%}
1. <a href="{{page.url}}">{{ page.title }}</a>{% endif %}
{% endfor %}

