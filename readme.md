# Singularity.gs β

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

Import Compass and Singularity into your project

```
@import "compass"
@import "singularity"
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

## To be continued …

## Licence:

Dual licence MIT/GPL