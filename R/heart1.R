#' Generate heart1 data
#'
#' Generates data for plotting a heart and stores it in a data frame with (x, y) coordinates and radius r
#' @param n The number of points to generate
#' @keywords heart
#' @export
#' @examples
#' heart1()

heart1 <- function(n = 1000000) {
  data.frame(t = seq(0, pi, pi/n)) %>%
    dplyr::mutate(
      x = 4/9*sin(2*t) + 1/2*(sin(t))^8*cos(3*t) + 1/8*sin(2*t)*(cos(247*t))^4,
      y =     sin(t)   + 1/3*(sin(t))^8*sin(3*t) + 1/8*sin(2*t)*(sin(247*t))^4
    ) %>%
    dplyr::select(-t)
}
