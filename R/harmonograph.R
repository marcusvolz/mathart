#' Generate harmonograph data
#'
#' Generates data for plotting a harmonograph and stores it in a data frame with (x, y) coordinates. Refer to the \href{https://en.wikipedia.org/wiki/Harmonograph}{Wikipedia article} for details.
#' @param n The number of points to generate
#' @param A1 A parameter
#' @param A2 A parameter
#' @param A3 A parameter
#' @param A4 A parameter
#' @param d1 A parameter
#' @param d2 A parameter
#' @param d3 A parameter
#' @param d4 A parameter
#' @param f1 A parameter
#' @param f2 A parameter
#' @param f3 A parameter
#' @param f4 A parameter
#' @param p1 A parameter
#' @param p2 A parameter
#' @param p3 A parameter
#' @param p4 A parameter
#' @keywords harmonograph
#' @export
#' @examples
#' harmonograph()

harmonograph <- function(n = 1000000,
                         A1 = 1, A2 = 1, A3 = 1, A4 = 1,
                         d1 = 0.039, d2 = 0.006, d3 = 0, d4 = 0.0045,
                         f1 = 10, f2 = 3, f3 = 1, f4 = 2,
                         p1 = 0, p2 = 0, p3 = pi/2, p4 = 0) {
  data.frame(t = seq(0, 200*pi, 200*pi/n)) %>%
    dplyr::mutate(
      x = A1*sin(t*f1+p1)*exp(-d1*t) + A2*sin(t*f2+p2)*exp(-d2*t),
      y = A3*sin(t*f3+p3)*exp(-d3*t) + A4*sin(t*f4+p4)*exp(-d4*t)
    ) %>%
    dplyr::select(-t)
}