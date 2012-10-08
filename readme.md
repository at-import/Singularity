# Singularity.gs

### Singularity is a powerful and intelligent grid framework for Sass and Compass that not only allows you to create responsive websites on any uniform columnar grid, but has the tools for asymmetric and compound grids built in.

## Installing Singularity

Make sure you have Compass and the Sass 3.2 alpha installed

Install Singularity

```
$ gem install singularitygs
```

Require Compass and Singularity into your Compass config.rb

```ruby
require 'singularitygs'
```

Import them in your stylesheets

```scss
@import "singularitygs";
```

Once you've created your project, install the Singularity behaviors so you can use Box Sizing in IE<8! This will install [Christian Schaefer's Box Sizing Polyfill](https://github.com/Schepp/box-sizing-polyfill) with [Suzi Arnold's PHP Wrapper](https://github.com/suzi).

```
$ compass install -r singularitygs -f singularitygs
```

Make sure the installed `behaviors` folder is at the same level as your CSS folder so that it can be accessed by your stylesheet via `../behaviors/*`.

## Using Singularity

### Basic Usage

There are two basic ways to use Singularity; either with a single grid or with multiple grids.

#### Single Grid

Singularity with a single grid is the easiest way to use Singularity. Simply set your columns, gutter, and padding, and call the `grid-span` mixin.

```scss
// $columns can be set to just about anything you'd like, from a given number of equal columns
//  as per the default, a list of different sizes for an asymmetric grid (such as 8, 4, 2 for 
//  three columns, the first columns twice the size of the second which is twice the size of 
//  the third), or utalizing one of the built in generating functions, such as repeat() for 
//  repeating columns or ratio() for ratio based columns. See the Full Documentation for all 
//  of your options. Columns are written in unitless numbers.
$columns: 1, 2, 3, 3, 5;

// $gutter will add a percentage gutter to each column. The gutter must be specified in the 
//  same units as the $columns.
$gutter: .25;

// $padding will add a given padding to each column. This can be any unit-based number you 
//  choose. All columns get box-sizing: border-box, so any padding you add will be placed 
//  inside the column itself. It is possible to add padding to individual columns, see the 
//  Full Documentation for how.
$padding: 0px;

// Basic usage of the Grid Span mixin requires you to tell the mixin how many columns you 
//  would like to span and from what column you are starting. While this may not seem 
//  intuative for symmetric grids, it is essential for assymetric grids as, well, they are 
//  different sizes. The below example will span two columns, starting at the third column, 
//  which in the end will span a total of 6/17 of our columns.
#foo {
  @include grid-span(2, 3);
}
```

#### Multiple Grids

Singularity includes the ability for you to define multiple grids to be used at specified breakpoints and, with integration with the [Breakpoint Compass Extension](http://github.com/canarymason/breakpoint), makes is a snap to use those grids. It is important to note that you still need to write the selectors for the change of grid spans when you want to use them as Sass produces precompiled code, not runtime code.

```scss
// Instead of defining $columns, you are going to be defining $grids. Each grid in $grids 
//  includes two parts, the columns for that breakpoint, and the min or max width for which it 
//  applies. The first grid you write in $grids will not include a breakpoint, as it's the 
//  default. The default is small-to-large.
$grids: 3, (3, 5, 7, 5) 500px, ratio(1.75, 7) 900px;

// If you would like to change from a small-to-large approach to a large-to-small approach, 
//  change $grids-mobile-first to false;
$grids-mobile-first: true;

// You may specify different gutters for each grid if you so choose. Simply comma seperate 
//  each gutter. If you have fewer items in $gutters than you have in $grids, the last item in 
//  $gutters will be used for the remaining items in $grids.
gutters: .25, .3, .4;

// Just like $gutters, you may set multiple paddings for each grid if you choose. Again, 
//  simply comma separate each padding. If you have fewer items in $paddings than you have in 
//  $grids, the last item in $paddings will be used for the remaining items in $grids;
$paddings: 0, .5em;

// Using grid-span is just as easy as it was before! Now, simply write your media queries 
//  using the Breakpoint compass extension, and Singularity will know what grid you're looking 
//  to use, and use it! It's that easy! This example will span 2 columns starting at the 2nd 
//  column for our initial 3 symmetric column layout, then span 2 columns starting at the 3rd 
//  column for our secondary 3, 5, 7, 5 asymmetric column layout, then span 4 columns starting 
//  at the 1st column for our ratio based final asymettric column layout.
#bar {
  @include grid-span(2, 2);
  
  @include breakpoint(500px) {
    @include grid-span(2, 3);
  }
  
  @include breakpoint(900px) {
    @include grid-span(4, 1);
  }
}
```
### Full Singularity Documentation

There's much more that Singularity can do! Check out the [Full Singularity Documentation](http://singularity.gs#use) to see it all!

## Development

Pull requests are more than welcome. It may be ported to Sass script and written in Ruby later to increase speed of compilation.

## Licence:

Dual licence MIT/GPL