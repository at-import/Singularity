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

#### [Learn how to use Singularity here](http://singularity.gs#use)

## Development

Pull requests are more than welcome. Singularity is written in the Sass syntax as it is my personal preference. It may be ported to Sass script and written in Ruby later to increase speed of compilation.

## Licence:

Dual licence MIT/GPL