#' Generate Lissajous data
#'
#' Generates data for plotting Lissajous curves and stores it in a data frame with (x, y) coordinates. Refer to the \href{https://en.wikipedia.org/wiki/Lissajous_curve}{Wikipedia article} for details.
#' @param n The number of points to generate
#' @param a <- Parameter
#' @param b <- Parameter
#' @param A <- Parameter
#' @param B <- Parameter
#' @param d <- Parameter
#' @param delta <- Timestep
#' @keywords lissajous
#' @export
#' @examples
#' lissajous()

lissajous <- function(a = 1, b = 1, A = 1, B = 1, d = 200, delta = 0.01*pi) {
  result <- data.frame(t = seq(0, 10*pi, delta)) %>%
    mutate(x = A*sin(a*t + d),
           y = B*sin(b*t))
  result
}