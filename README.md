brewdogr
=======

## A simple R wrapper around the Punk API

The Punk API itself provides Brewdog beer recipe data in a programmatically accessible format.

The Punk API can be found at: [https://punkapi.com](https://punkapi.com)

The Brewdog DIY Dog recipes as a PDF download can be found at: [https://www.brewdog.com/uk/community/diy-dog](https://www.brewdog.com/uk/community/diy-dog)

## Install

```r
# install.packages("devtools")
devtools::install_github("phillc73/brewdogr")
library("brewdogr")
```
This package depends on:  
RCurl >= 1.98-1.1  
jsonlite >= 1.6.1  

## Usage

The following call to the function `get_beer` returns all recipes where the expected ABV is equal to or greater than eight, it was first brewed by Brewdog after September 2013 and it uses the hop known as Fuggle.

```r
get_beers(abv_gt = 8,
          yeast = "Wyeast",
          brewed_after = "09/2013",
          hops = "Fuggle")
```

## Issues

Problems? Something just doesn't work?

[Submit issues here](https://github.com/phillc73/brewdogr/issues)

Currently, there is an issue that API results are limited to an apparent maximum of 80. Greater than this are returned, on subsequent pages, but there's no way to know how many pages are returned. See this upstream [issue report](https://github.com/samjbmason/punkapi/issues/55).

