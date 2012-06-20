# Singularity • ALPHA

### Singularity is a powerful and intelegent grid framework for Sass that not only allows you to create responsive websites on any uniform columnar grid, but has the tools for asymmetric and compound grids built in.

## Using Singularity

First, you might want to set up your column and gutter defaults. Columns can exist as a single number of uniform columns, or a list of varying asymmetric grid widths.

  $columns: 12;
  // or write a list with varying width columns
  $columns: 3, 2, 2, 3;

For columns, just write how wide you want them to be.

  $gutter: 2%;

Now just write either a mixin or function.

  @include grid-span($span, $location, $columns, $gutter);
  
or the function if you want to use grid values anywhere.

  grid-span($span, $location, $columns, $gutter);

## Licence:

Dual licence MIT/GPL