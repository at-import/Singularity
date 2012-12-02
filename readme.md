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

First lets get started with how you are going to use Singularity. It uses mixins and focuses on non-uniform grids. Unlike uniform grids where all the columns are the same, Singularity needs to not only know how many columns your element spans, but also where it is located.

```scss
@include grid-span($span, $location);
```

So lets say you want an element to span two columns starting at the third column

```scss
@include grid-span(2, 3);
```

### Setting up your grid

Singularitys syntax is ratio based which helps define non-uniform grids. Lets get started with a single grid and see how this works.

The `$columns` variable is where you put, well, your columns for a single grid. Lets do 4 even columns to start:

```scss
$columns: 4;
```

Great! that easy for uniform grids but the real power Singularity has is in non-uniform grids. Lets start to define relationships between 4 equal columns. We know each of those columns is 25% wide, so lets try expressing our grid that way:

```scss
$columns: 25% 25% 25% 25%;
```

Because Singularity deals with the relationships between numbers, these values can all be tweaked. In fact, we don’t even need a unit on there. Lets make the second column a little bigger and the third column a little smaller:

```scss
$columns: 25 30 20 25;
```

Now, lets say you have a mock in Photoshop and all the values are pixels? Just pass the values through:

```scss
$columns: 20px 500px 220px 220px;
```

See the ratios yet? If you write `1 2 3` then the second column will be twice the width of the first, and the third column will be three times that of the first, and because the sum of the first two is three it will also be half of the width of the wrapping element.

Using this methidology you can even write Sass functions that create patterns. (refrence)

### Gutters

Gutters are treated like a column and use the same ratios in the columns. Here is an example of a five column grid where the gutter is 20% of the column width.

```scss
$columns: 1 1 1 1 1;
$gutter: .2;
```

If you like percents, they will be converted for you and you can write a 2% gutter like this:

```scss
$columns: 1 1 1 1 1;
$gutter: 2%;
```

That said, there are a few advantages to a ratio-based gutters instead of percent based gutters:

* They scale automatically when nesting columns as their relationship remains based on the columns around them, not the container.
* As you add more columns the gutters will shrink in proportion to the columns shrinking.

### Working with multiple grids

Chances are, your site is responsive. Singularity leverages Breakpoint to keep track of your context and the current grid you are using. Lets work mobile first and start with a three column grid.

```scss
$grids: (1 3 1);
```

This won’t work yet untill we add another breakpoint. Lets add a five column grid at 600px:

```scss
$grids: (1 3 1), (1 4 2 2 1) 600px;
```

Now, when you apply somthing to a grid, Singularity will know what context you are in and use the appropriate grid.

```scss
.column-foo {
  @include grid-span(2, 1);
  @include breakpoint(600px) {
    @include grid-span(2, 2);
  }
}
```

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