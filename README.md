A toy package to demonstrate [**MatrixGenerics**](https://github.com/Bioconductor/MatrixGenerics).

``` r
library(testMatrixGenerics)
showMethods("rowMedians")
#> Function: rowMedians (package MatrixGenerics)
#> x="ANY"
#> x="data.frame"
# testMatrixGenerics defines a rowMedians method for data.frame
selectMethod("rowMedians", "data.frame")
#> Method Definition:
#> 
#> function (x, rows = NULL, cols = NULL, na.rm = FALSE, dim. = dim(x), 
#>     ...) 
#> {
#>     .local <- function (x, rows = NULL, cols = NULL, na.rm = FALSE, 
#>         dim. = dim(x)) 
#>     {
#>         apply(x, 1, median)
#>     }
#>     .local(x, rows, cols, na.rm, dim., ...)
#> }
#> <bytecode: 0x7fa38c378ce8>
#> <environment: namespace:testMatrixGenerics>
#> 
#> Signatures:
#>         x           
#> target  "data.frame"
#> defined "data.frame"
# The ANY method uses matrixStats::rowMedians (conditionally on it being installed)
selectMethod("rowMedians", "ANY")
#> Method Definition (Class "derivedDefaultMethod"):
#> 
#> function (x, rows = NULL, cols = NULL, na.rm = FALSE, dim. = dim(x), 
#>     ...) 
#> {
#>     if (!requireNamespace("matrixStats", quietly = TRUE)) {
#>         stop("'matrixStats' package required for matrix operations", 
#>             call. = FALSE)
#>     }
#>     matrixStats::rowMedians(x, rows = rows, cols = cols, na.rm = na.rm, 
#>         dim. = dim., ...)
#> }
#> <bytecode: 0x7fa38c37c340>
#> <environment: namespace:MatrixGenerics>
#> 
#> Signatures:
#>         x    
#> target  "ANY"
#> defined "ANY"
# testMatrixGenerics doesn't define any colMedians method, so nothing shows up here
showMethods("colMedians")
#> 
#> Function "colMedians":
#>  <not an S4 generic function>
```

Created on 2018-05-21 by the [reprex package](http://reprex.tidyverse.org) (v0.2.0).