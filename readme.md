# Singularity.gs [![Gem Version](https://badge.fury.io/rb/singularitygs.svg)](http://badge.fury.io/rb/singularitygs) [![Build Status](https://travis-ci.org/at-import/Singularity.svg?branch=1.x.x)](https://travis-ci.org/at-import/Singularity)

**Grids Without Limits**

Singularity is a next generation grid framework built from the ground up to be responsive. What makes Singularity different? Well, a lot of things. Singularity is based on internal ratios instead of context based which allows for better gutter consistency across breakpoints. Ratio based math also allows for non-uniform grids in *any* unit you want to use.

## Getting Help with Singularity

* For help with Singularity, please ask a question on [Stack Overflow](http://stackoverflow.com/questions/ask) tagged with `singularitygs`.
* To file an issue with Singularity, be it a feature request or a bug report, please use our [Issue Queue](https://github.com/at-import/Singularity/issues).
* If you are in IRC, the maintainers and many fellow users tend to hang out in the `#sass` and `#compass` rooms on `irc.freenode.net`. Asking in there may get you a quick answer to your question, but we still encourage you to file your inquiry in the appropriate place above to 

## Singularity Quickstart

**Full documentation is available on the [Singularity Wiki](https://github.com/at-import/Singularity/wiki)**

*If you are upgrading to Singularity 1.2.0 or greater, please read the [Changelog](https://github.com/at-import/Singularity/blob/1.x.x/CHANGELOG.md) for important changes made to Singularity!*

### Installation

* Singularity should be [installed and compiled](https://github.com/at-import/Singularity/wiki/Installation#installation) through [Bundler](http://bundler.io/) if compiling with Ruby
* Alternatively, Singularity can be installed with Bower (`bower install singularity --save`)
* It can even be installed as an [Eyeglass](https://github.com/sass-eyeglass/eyeglass) module! (`npm install singularitygs --save-dev`)
* Singularity requires a Sass compiler with full feature parity with the Ruby Sass 3.3 implementation in order to work

### Setting Up a Basic Grid

[Grids](https://github.com/at-import/Singularity/wiki/Creating-Grids) are made of 3 parts, the Grid definition defining columns, Gutter definition defining spacing between columns, Gutter Style defining how gutters are positioned relative to a column. Singularity supports [Symmetric](https://github.com/at-import/Singularity/wiki/Creating-Grids#symmetric-grids) and [Asymmetric](https://github.com/at-import/Singularity/wiki/Creating-Grids#asymmetric-grids) grids, as well as fluid and [fixed](https://github.com/at-import/Singularity/wiki/Creating-Grids#fixed-gutters) gutters. Setting grids up this way puts them into Singularity's **Global Grid Context**.

```scss
// Symmetric grid with fluid gutters, 1/2 gutter on each side of a column
@include add-grid(12);
@include add-gutter(1/3);
@include add-gutter-style('split');
```

```scss
// Asymmetric grid with fixed gutters, 1 full gutter after each column
@include add-grid(1 3 5);
@include add-gutter(1em);
```

You can [visualize your grid](https://github.com/at-import/Singularity/wiki/Creating-Grids#visualizing-your-grids) with a CSS Gradient. To do so, turn on debug mode and include the `background-grid` mixin. Be warned, CSS Gradients aren't 100% reliable visualizations, if there's a discrepancy between the visualization and the actual items on the grid, it's most likely the visualization that's wrong.

```scss
// Be sure to enable debug mode for your grid visualization so show up:
@include sgs-change('debug', true);

.container {
  @include background-grid($color: blue);
}
```` 

### Spanning Your Grid

Singularity doesn't provide grid classes, instead it uses mixins to [attach an item to your grid](https://github.com/at-import/Singularity/wiki/Spanning-The-Grid). The mixin takes your grid definitions and an [output style](https://github.com/at-import/Singularity/wiki/Output-Styles) and writes the CSS for the given combination. The main mixin for this is the `grid-span` mixin which will work with any output style. Most output styles provide [output-specific spans](https://github.com/at-import/Singularity/wiki/Spanning-The-Grid#output-span) to make working with that specific output style easier.

The `grid-span` mixin takes two required arguments, how many columns you would like to span, and from what column you would like to start from. The column you would like to start from is the first column spanned.

```scss
@include add-grid(4);

.foo {
  // Spanning the last 2 columns
  @include grid-span(2, 3);
}

.bar {
  // Spanning the 2nd column
  @include grid-span(1, 2);
}
```

### Responsive Grids

Singularity provides a couple of different ways to have `grid-span` use a different set of grid definitions at different breakpoints. The first is Singularity's [Responsive Grid Context](https://github.com/at-import/Singularity/wiki/Creating-Grids#responsive-grids), which relies upon [Breakpoint](https://github.com/team-sass/breakpoint) (a super powerful and flexible media query system, we recommend using it). This will allow you to use Breakpoint media queries as normal and when `grid-span` is called, it will know what set of grid definitions to use (although it won't automatically change existing `grid-span` calls to put them on a new grid, that's up to you). It does this by allowing for multiple grid definitions in the **Global Grid Context**.

To use, simply call `add-grid` multiple times, each time telling it when you would like to change. **Be Aware** this will *only work with `min-width` media queries!* Sass and Singularity cannot know runtime conditions and provide wiggle room between media queries with anything other than simple `min-width` queries. While a full Breakpoint style media query can be used in these definitions, Singularity will only look for the `min-width` value.

**Responsive grid contexts do not output anything by themsleves**. Singularity's Responsive Grids feature allows you to change the *context of a called `grid-span`*. In order for you to see the context change, you still need to call `grid-span` to apply your grid.

```scss
// Singularity 1.2 Syntax
@include add-grid(3);
@include add-grid(6 at 500px);
@include add-grid(12 at 700px);
@include add-grid(2 8 2 at 900px);
@include add-grid(1 3 5 7 9 at 1100px);

@include add-gutter(1/3);
@include add-gutter(.25 at 900px);
```

The second way to provide responsive grids is with either of the use of the [Context Override](https://github.com/at-import/Singularity/wiki/Spanning-The-Grid#group-context-overrides) mixins. Singularity provides two, `layout` which will override context **Global Grid Context** for any content nested underneath it, and `layout-at`, which will do the same but allows you to define and use a media query at the same time. `layout-at` will accept any Breakpoint media query definition. Both of these options provide more fine-grain control over your **Global Grid Context** overrides as compared to the **Responsive Grid Context**, if you need that.

```scss
@include add-grid(12);
@include add-gutter(1/3);

.foo {
  @include layout(1 3 5, .5) {
    // Everything in here will use a `1 3 5` grid with `.5` gutter.
    // Arguments (in order): $grid, $gutter, $output-style, $gutter-style
  }

  @include layout((
    'grid': 1 3 5,
    'gutter': .5
  )) {
    // Everything in here will use a `1 3 5` grid with `.5` gutter

    // Also available: 'gutter style' and 'output'
  }


  @include layout-at(2 4 6, 500px) {
    // Everything in here will be wrapped in a `min-width: 500px` media query
    //   and use a `2 4 6` grid with the Global Grid Context's `1/3` gutter
  }

  @include layout-at((
    'grid': 1 3 5,
    'gutter': .5
  ), 700px) {
    // Everything in here will be wrapped in a `min-width: 700px` media query
    //   and use a `1 3 5` grid with `.5` gutter

    // Also available: 'gutter style' and 'output'
  }
}
```

## Contributing to Singularity

We love contributors! Yes we do! If you would like to contribute to Singularity, please follow the [Contributing Guidelines](https://github.com/at-import/Singularity/blob/1.x.x/CONTRIBUTING.md)

## Singularity Plugins

Having been designed to be extensible, the ability to create plugins for Singularity is great and we expect to see great things. From new [Output Span](https://github.com/at-import/Singularity/wiki/Spanning-The-Grid#output-span) syntaxes to new [Output Styles](https://github.com/at-import/Singularity/wiki/Output-Styles) to new [Grid Generators](https://github.com/at-import/Singularity/wiki/Grid-Generators), we are excited to see what the community will come up with. Below are a list of Singularity Plugins available. If you would like to add your Plugin to the list, please issue a Pull Request to add it to the list!

* [Singularity Extras](https://github.com/at-import/Singularity-Extras)

## License

Dual license MIT/GPL-3.0
