# Singularity.gs α

### Singularity is a powerful and intelligent grid framework for Sass and Compass that not only allows you to create responsive websites on any uniform columnar grid, but has the tools for asymmetric and compound grids built in.

## Installing Singularity

Make sure you have Compass and the Sass 3.2 alpha installed

```
$ gem install compass
$ gem install sass --pre
```

Next, install Singularity

```
$ gem install singularitygs
```

Require Compass and Singularity into your config.rb

```ruby
require 'compass'
require 'singularity'
```

Import them in your stylesheets

```scss
@import "compass";
@import "singularity";
```

## Using Singularity

Unlike most other grid systems Singularity supports non-uniform column widths. Because of this the location of the initial column is just as important as how many columns an element spans. There is a built in counter to help keep track of this for you but location of columns is something to keep in mind.

#### Setting up columns

There are two ways to set up columns, with a single value that creates equal column widths or a list that creates asymmetric grids.

###### 12 equal columns:

```scss
$columns: 12;
```

###### 6 columns where the second column is twice the first, the third column is three times the first, and so on:

```scss
$columns: 1, 2, 3, 1, 2, 3;
```

As long as the values are consistent, you can use any value here like pixels, ems and percents. Note that gutters are subtracted from columns so regardless of the gutter width so `$column: 100px, 100px;` will always be a context of `200px`.

Compound grids are two uniform column grids that overlap and create more complex non-uniform grids. Using the function `compound()` you can list different uniform grids (up to 6) to compound. *note* compounding more than two grids may be buggy at the moment.

###### A compound of a 3 and 4 column grid:

```scss
$columns: compound(3, 4);
```

#### Gutters

Gutters are the space between columns and always a percent.

###### 2% gutters:

```scss
$gutter: 2%;
```

#### Padding

You may have a column with text that you don’t want touching the edge. You can pad the contents of your column by adding padding. This can be written in any unit of measurement.

###### padding of 1em:

```scss
$padding: 1em;
```

Padding, like columns, can change depending on location. You can set padding overrides within the `$column` list.

###### 3 equal columns with 12px of padding on the center column:

```scss
$columns: 1, 1 12px, 1;
```

### Functions and mixins

###### grid function

The grid function can be used anywhere like borders, padding, margins, or anywhere you might need a grid-based value.

```scss
grid-span($span, $location, $columns, $gutter)
```

###### grid mixin

Like the grid function only this writes preset styles to any element. It writes the width, float, margin, and padding.

```scss
@include grid-span($span, $location, $columns, $gutter, $padding);
```

If no location is set this mixin will count through the columns for you. So if you have a 9 column grid and three mixins spanning 3 columns, the mixin will know what columns you are as well as know you reached the end of a row.

###### gutter context

If you are nesting grids you may want a consistent gutter width. You can easily calculate gutters for the context by writing the gutter width you want followed by its context, like a context of `grid-span(3, 3)`.

```scss
gutter-context($gutter, $context)
```

###### Writing grid objects

You may prefer using extends or working with classes. You can write every location on the grid using this mixin:

```scss
@include grid-objects($prefix, $columns, $gutter, $padding, $selector);
```

By default, this writes placeholder selectors that do not show up in your CSS file. You can always write `$selector: "."` in the mixin to write classes instead.

The prefix is a name or letter associated with the grid. You can write the mixin within a media query and name the prefix after your breakpoint.

###### Testing your grid

Visualizing grids can be one of the more difficult parts of using grid systems. Using this mixn and the [HTML markup here](https://github.com/scottkellum/Singularity/blob/master/stylesheets/singularity/_grid-test.sass#L18) you can see how the grid you are building looks.

```scss
@include test-grid($columns, $gutter, $padding, $prefix, $opacity);
```

## Development

Pull requests are more than welcome. Singularity is written in the Sass syntax as it is my personal preference. It may be ported to Sass script and written in Ruby later to increase speed of compilation.

## Licence:

Dual licence MIT/GPL