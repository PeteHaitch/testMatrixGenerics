#' Toy implementation of rowMedians for data.frame input
#'
#' Toy implementation of rowMedians for data.frame input.
#'
#' @param x An NxK \code{\link[base]{data.frame}} object.
#'
#' @param rows,cols Not yet implemented.
#'
#' @param na.rm If \code{\link[base:logical]{TRUE}}, \code{\link[base]{NA}}s
#' are excluded first, otherwise not.
#'
#' @param dim. Not yet implemented.
#'
#' @return Returns a \code{\link[base]{numeric}} \code{\link[base]{vector}} of
#' length N (K).
#'
#' @seealso
#' \itemize{
#' \item \code{matrixStats::\link[matrixStats]{rowMedians}()}
#' }
#'
#' @importFrom MatrixGenerics rowMedians
#' @importFrom stats median
#' @export
setMethod(
  "rowMedians",
  "data.frame",
  function(x, rows = NULL, cols = NULL, na.rm = FALSE, dim. = dim(x)) {
    if (!is.null(rows) || !is.null(cols)) {
      stop("Sorry, 'rows' and 'cols' aren't yet supported.")
    }
    apply(x, 1, median, na.rm = na.rm)
  }
)
