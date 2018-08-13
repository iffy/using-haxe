---
layout: page
---

# Introduction

So you want to make a cross-platform application?  Me, too.

I've created a successful Electron-based budgeting app called <a href="https://www.budgetwithbuckets.com" target="_blank">Buckets</a>.  The process of making a mobile app, however, has been no fun.  As of this writing, I'm still working with Expo and ReactNative, but while I wait for patches to get merged I'm exploring other options.

I want a place to document my findings (mostly so I don't keep going around in circles), so that's why this site exists.  I'm working on macOS.

## Format

The format for these notes is a set of bite-sized problems.  Each page presents a problem and how/if I solved the problem.

## Contributing

If something doesn't work for you, please make a Pull Request (see the Edit This Page link above) or [file an issue](https://github.com/iffy/using-haxe/issues/new).

## The Goal

I want an application that works on all platforms.  The UI doesn't have to be identical between mobile and desktop, but sharing core code is a must.

- [ ] macOS retina
- [ ] macOS non-retina
- [ ] Windows
- [ ] Linux
- [ ] iOS
- [ ] Android

Other features I want:

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

# Platforms

## Haxe

{% for page in site.pages %}
{%- assign subdir = page.dir|split:'/' -%}
{%- assign subdir = subdir[1] -%}
{%- if page.title and subdir == "haxe" -%}
1. <a href="{{site.baseurl}}{{page.url}}">{{ page.title }}</a>{% endif %}
{% endfor %}

