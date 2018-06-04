#' k-nearest neighbour graph
#'
#' Computes a k-nearest neighbour graph for a given set of points. Refer to the \href{https://en.wikipedia.org/wiki/Nearest_neighbor_graph}{Wikipedia article} for details.
#' @param points A data frame with x, y coordinates for the points
#' @param k Number of neighbours
#' @keywords nearest neightbour graph
#' @export
#' @examples
#' k_nearest_neighbour_graph()

k_nearest_neighbour_graph <- function(points, k=8) {
  get_k_nearest <- function(points, ptnum, k) {
    xi <- points$x[ptnum]
    yi <- points$y[ptnum]
    points %>%
      dplyr::mutate(dist = sqrt((x - xi)^2 + (y - yi)^2)) %>%
      dplyr::arrange(dist) %>%
      dplyr::filter(row_number() %in% seq(2, k+1)) %>%
      dplyr::mutate(xend = xi, yend = yi)
  }
  
  1:nrow(points) %>%
    purrr::map_df(~get_k_nearest(points, ., k))
}