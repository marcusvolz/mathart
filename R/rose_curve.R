#' Generate rose curve
#'
#' Generates data for plotting a rose curve and stores it in a data frame with (x, y) coordinates. Refer to the \href{https://en.wikipedia.org/wiki/Rose_(mathematics)}{Wikipedia article} for details.
#' @param n Curve parameter
#' @param d Curve parameter
#' @param delta Timestep
#' @keywords rose curve
#' @export
#' @examples
#' rose_curve()

rose_curve <- function(n, d, delta = pi/180) {
  k <- n / d
  data.frame(theta = seq(0, 32*pi, delta)) %>%
    mutate(x = cos(k*theta)*cos(theta),
           y = cos(k*theta)*sin(theta))
}