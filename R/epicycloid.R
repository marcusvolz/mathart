#' Epicycloid curve
#'
#' Generates data for plotting an epicycloid curve and stores it in a data frame with (x, y) coordinates. Refer to the \href{https://en.wikipedia.org/wiki/Epicycloid}{Wikipedia article} for details.
#' @param a Curve parameter
#' @param b Curve parameter
#' @param delta Timestep
#' @keywords epicycloid
#' @export
#' @examples
#' epicycloid_curve()

epicycloid_curve <- function(a = 1, b = 1, delta = 0.1*pi) {
  data.frame(t = seq(0, 96*pi, delta)) %>%
    mutate(x = (a + b)*cos(t) - b*cos((a/b + 1)*t),
           y = (a + b)*sin(t) - b*sin((a/b + 1)*t))
}
