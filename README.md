
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rSpliteExcel

<!-- badges: start -->

[![R-CMD-check](https://github.com/ChevyXu/rSpliteExcel/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/ChevyXu/rSpliteExcel/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/ChevyXu/rSpliteExcel/branch/main/graph/badge.svg)](https://app.codecov.io/gh/ChevyXu/rSpliteExcel?branch=main)
<!-- badges: end -->

The goal of rSpliteExcel is to split excel files to separate excel, or
gather sheets with same form.

## Installation

You can install the development version of rSpliteExcel from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("ChevyXu/rSpliteExcel")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
# library(rSpliteExcel)
## basic example code
rSpliteExcel::multiplesheets(fname = "example/test.xlsx")
#> [[1]]
#> [1] "column1" "column2" "column3"
#> 
#> [[2]]
#> [1] "column1"
#> 
#> [[3]]
#> [1] "column2"
#> 
#> [[4]]
#> [1] "column2"
#> 
#> [[5]]
#> [1] "column1" "column2" "column3"
```

``` r
# library(rSpliteExcel)
## basic example code
# wirte sheets with same form.
# rSpliteExcel::multiplesheets_write(fname = "example/test.xlsx")
```
