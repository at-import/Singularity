# Singularity Changelog

## v1.6.2
### February 26, 2015
* **Fix** First gutter in a split gutter grid now displays properly in SVG backgrounds

## v1.6.1
### February 25, 2015
* **Change** Moved from Linear Gradient backgrounds to SVG backgrounds based on the awesome work done over in [Susy](https://github.com/ericam/susy/issues/436)
* **Fix** `@error` issue with current version of Libsass

## v1.5.0
### January 17, 2015
* **New** Moved [Calc Output Style](http://snugug.com/musings/bulletproof-combo-fixed-and-fluid-grids-css3-calc) from [Singularity Extras](https://github.com/at-import/singularity-extras) into Core
* **New** Added `sgs-set()` mixin to mirror `sgs-change()` mixin (getters and setters FTW)
* **New** `background-grid` mixin now throws a warning instead of a unit error if it's unable to generate a CSS Gradient for the given grid

## v1.4.0
### August 23, 2014
* **New** Allow for a map of options to be passed to the `layout` mixin in the same way that you can for `layout-at`
* **New** Allow `output` keyword in `layout-at` mixin map

## v1.3.0
#### August 11, 2014
* **New** Sass 3.4 support
* **New** `layout-at` mixin for defining a layout override and writing a media query at the same time
* **New** `sgs-reset()` mixin and function now allow for comma-separated list of settings to reset
* **Change** Deprecation warning is now deprecated as Sass 3.4 will ensure this is no longer an issue
* **Fix** Grid Visualization now doesn't explode with fixed width gutters
* **New** Quickstart in the README
* **Fix** Quotes in `isolation-span` clear now unquote correctly
* **Removed** Singularity demo installs and box sizing polyfill as they are available in other, more useful means
* **Fix** `SASS_PATH` issues to make Singularity usable w/o Compass and as a Ruby gem

## v1.2.0.rc.6
#### February 11, 2014

* **Fix** Sass 3.3.0.rc.3 updated how some core functions work; updates for that.
* **New** Added an `asymmetric-span` mixin for the common use case of only needing to change location in an asymmetric span.
* **New** Global setting `'asymetric output'` (defaults to `'isolation'`)
* **Change** Moved Background Grid settings to global settings.
  * `$background-grid-color` is now `'background grid color'` (defaults to `'chocolate'`)
  * `$show-grid-background` is now `'debug'` (defaults to `false`)
* **New** If setting `'debug'` is set to `true`, full settings map passed to output function will be output to the `-sgs-span-settings` property. Inspired by [Susy Issue 293](https://github.com/ericam/susy/issues/293)

## v1.2.0.rc.4
#### January 31, 2014

* **Fix** Years in the Changelog were 2013, but was actually done in 2014
* **Fix** Breakpoint dependency should be >= 2.4.0 and < 3.0.0, which is accomplished with `~>2.4`

## v1.2.0.rc.3
#### January 17, 2014

* **Change** Better warning error for `sgs-set` so settings can contain dashes as long as words are set with spaces. Added errors for underscores as well.

## v1.2.0.rc.2
#### January 17, 2014

* **New** **Change** Output functions can now set the value of a property to a map to have multiple properties printed with different values. The primary two use cases for this is to provide fallbacks for the same property or to provide a way to have experimental values for properties. The map should have a descriptive key (for experimental properties, the prefix plus `standard` for the standard property, or for fallbacks a `fallback` and `standard` key) and the value should be the value to be printed.

## v1.2.0.rc.1
#### January 12, 2014

* **New** Sass 3.3.0 and Compass 1.0.0 compatibility
	* Sass 3.3.0 minimum required version
	* Compass no longer required to run (no custom Ruby dependencies)
* **New** Installable through Bower
* **New** [Breakpoint](http://github.com/team-sass/breakpoint) variables can now be used in `add-*`
* **New** Items added in `add-*` no longer need to be in order! They'll be sorted for you!
* **New** **Change** `grid-span` now takes an optional parameter `$gutter-style` (after `$output-style`, before `$options`) to allow you to specify gutter style/
* **New** `grid-span` options now can include a `from` key (left, right, or opposite) to specify the direction that should be used. If specifying a `from` direction, the `[dir="rtl"]` will not be printed. If your global direction is `rtl` or `both`, the selector will still be printed.
* **New** `isolation-span` and `float-span` both now have `$gutter-style` and `$from` parameters to pass them (respectively) to `grid-span`
* **New** **Change** When writing both `ltr` and `rtl` styles at the same time, styles whose properties are identical between `ltr` and `rtl` will not print out in the `rtl` style.
* **Change** **DEPRECATION** Removed `grid-overlay` as it was an even worse representation than `background-grid` and was undocumented.
* **Change** **DEPRECATION** Removed `grid-toggle` as the JavaScript needed was annoying to maintain and explain how it worked.
* **New** **DEPRECATION** Global variables for settings have been deprecated due to global namespacing issues that had to be changed. Instead, use `@include sgs-change($setting, $value)` to change a setting. Any setting that previously had dashes in their variable name (`$include-border-box` for instance) becomes a string of the variable name with spaces instead of dashes. Use `@include sgs-reset($setting)` to reset a setting.
* **DEPRECATION** `add-*` functions changed to `add-*` mixins to resolve global namespacing issues that had to be changed. Example: update `$grids: 12` to `@include add-grid(12)` and `$gutters: add-gutter(.5 at 500px)` to `@include add-gutter(.5 at 500px)`
* **DEPRECATION** push/pull/isolation mixins have been deprecated as they were always undocumented and untested and there doesn't appear to be many users using them as it was really only useful for `float`. Most users have migrated to `isolation` if push/pull/isolation was needed
