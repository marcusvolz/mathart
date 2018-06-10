#' Does intersect
#'
#' Determine if two line segments, ab and cd, intersect
#' @param a Numeric vector of length 2 containin Point a (x, y) co-ordinates
#' @param b Numeric vector of length 2 containin Point b (x, y) co-ordinates
#' @param c Numeric vector of length 2 containin Point c (x, y) co-ordinates
#' @param d Numeric vector of length 2 containin Point d (x, y) co-ordinates
#' @param smidgin Tolerance parameter used when checking if the intersection is in the interior of both line segments
#' @keywords euclidean line segment intersect
#' @export
#' @examples
#' does_intersect()

does_intersect <- function(a, b, c, d, smidgin = 1e-6) {
  if(identical(a, b) |
     identical(a, c) |
     identical(a, d) |
     identical(b, c) |
     identical(b, d) |
     identical(c, d)) {
    return(FALSE)
  }
  
  x1 <- a[1]
  y1 <- a[2]
  x2 <- b[1]
  y2 <- b[2]
  x3 <- c[1]
  y3 <- c[2]
  x4 <- d[1]
  y4 <- d[2]
  
  i <- c(((x1 * y2 - y1 * x2) * (x3 - x4) - (x1 - x2) * (x3 * y4 - y3 * x4)) /
           ((x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4)),
         ((x1 * y2 - y1 * x2) * (y3 - y4) - (y1 - y2) * (x3 * y4 - y3 * x4)) /
           ((x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4)))
  
  ifelse(sum(is.na(i)) <= 0 &
           (i[1] > (min(a[1], b[1]) + smidgin) & i[1] < (max(a[1], b[1]) - smidgin)) & (i[1] > (min(a[1], b[1]) + smidgin) & i[1] < (max(a[1], b[1]) - smidgin)) &
           (i[2] > (min(a[2], b[2]) + smidgin) & i[2] < (max(a[2], b[2]) - smidgin)) & (i[2] > (min(a[2], b[2]) + smidgin) & i[2] < (max(a[2], b[2]) - smidgin)) &
           (i[1] > (min(c[1], d[1]) + smidgin) & i[1] < (max(c[1], d[1]) - smidgin)) & (i[1] > (min(c[1], d[1]) + smidgin) & i[1] < (max(c[1], d[1]) - smidgin)) &
           (i[2] > (min(c[2], d[2]) + smidgin) & i[2] < (max(c[2], d[2]) - smidgin)), TRUE, FALSE)
}