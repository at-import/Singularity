# Singularity.gs

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

#### [Learn how to use Singularity here](http://singularity.gs#use)

## Development

Pull requests are more than welcome. Singularity is written in the Sass syntax as it is my personal preference. It may be ported to Sass script and written in Ruby later to increase speed of compilation.

## Licence:

Dual licence MIT/GPL