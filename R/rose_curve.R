#' Generate rose curve
#'
#' Generates data for plotting a rose curve and stores it in a data frame with (x, y) coordinates. Refer to the \href{https://en.wikipedia.org/wiki/Rose_(mathematics)}{Wikipedia article} for details.
#' @param n Curve parameter
#' @param d Curve parameter
#' @param delta Timestep
#' @param N Determines the extent of the curve
#' @keywords rose curve
#' @export
#' @examples
#' rose_curve()

rose_curve <- function(n, d, delta = pi/180, N = 32) {
  data.frame(theta = seq(0, N*pi, delta)) %>%
    mutate(x = cos(n/d*theta)*cos(theta),
           y = cos(n/d*theta)*sin(theta)) %>%
    select(x, y)
}