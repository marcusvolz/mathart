#' Generate heart2 data
#'
#' Generates data for plotting a heart and stores it in a data frame with (x, y) coordinates and radius r
#' @param n The number of points to generate
#' @keywords heart
#' @export
#' @examples
#' heart2()

heart2 <- function(n = 1000000) {
  A <- function(t) {
    1 + 1/2*(cos(36*t))^10*(1 + 1/2*(cos(108*t))^12)
  }
  data.frame(t = seq(0, pi, pi/n)) %>%
    dplyr::mutate(
      x = 2/3*cos(2*t)*(1 - 1/7*(cos(12*t))^4*A(t)) + 1/4*sin(22*t + pi/2),
      y = 2/3*sin(2*t)*(1 - 1/7*(cos(12*t))^4*A(t)) + 1/4*cos(22*t + pi/2)
    ) %>%
    dplyr::select(-t)
}
