#' Concave hull
#'
#' Computes the concave hull for a set of points (wrapper for concaveman::concaveman)
#' @param points A data frame of points.
#' @param concavity A value that determines the concavity (1 = detailed shape, Inf = convex hull).
#' @param length_threshold Segment lengths less than this threshold are not considered; higher values give simpler shapes.
#' @keywords concave hull
#' @export
#' @examples
#' concave_hull()

concave_hull <- function(points, concavity = 1, length_threshold = 0) {
  as.matrix(points) %>%
    concaveman::concaveman(concavity, length_threshold) %>%
    as.data.frame() %>%
    dplyr::rename(x = V1, y = V2)
}