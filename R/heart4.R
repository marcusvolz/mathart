#' Generate heart4 data
#'
#' Generates data for plotting a heart and stores it in a data frame with (x, y) coordinates and radius r
#' @param n The number of points to generate
#' @keywords heart
#' @export
#' @examples
#' heart4()

heart4 <- function(n = 1000000) {
  data.frame(t = seq(0, pi, pi/n)) %>%
    dplyr::mutate(
      x = -3/2*(sin(2*t))^3 + 3/10*(sin(2*t))^7 + 1/3*sin(400*t)*(sin(2*t))^2*(cos(6/5*t))^4,
      y = sin(8/3*t + pi/6) + 1/4*(sin(8/3*t + pi/6))^3 + 1/3*cos(400*t)*sin(2*t)*(cos(6/5*t))^4
    ) %>%
    dplyr::select(-t)
}
