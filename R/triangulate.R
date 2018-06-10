#' Create a triangulation for a given set of points
#'
#' Creates a triangulation for a given set of points (wrapper for deldir)
#' @param points A data frame with point x and y coordinates
#' @return A data frame with segment x, y, xend and yend coorindates
#' @details A simple wrapper for deldir::deldir()
#' @export
#' @examples data.frame(x = runif(10), y = runif(10)) %>% triangulate()

triangulate <- function(points) {
  deldir(points)$delsgs %>%
    rename(x = x1, y = y1, xend = x2, yend = y2)
}