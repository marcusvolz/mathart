#' Create a tessellatation for a given set of points
#'
#' Creates a tessellatation for a given set of points (wrapper for deldir)
#' @param points A data frame with point x and y coordinates
#' @return A data frame with segment x, y, xend and yend coorindates
#' @details A simple wrapper for deldir::deldir()
#' @export
#' @examples data.frame(x = runif(10), y = runif(10)) %>% tessellate()

tessellate <- function(points) {
  deldir(points)$dirsgs %>%
    rename(x = x1, y = y1, xend = x2, yend = y2)
}