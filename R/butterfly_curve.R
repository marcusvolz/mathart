#' Butterfly curve
#'
#' Generates data for plotting a generalised butterfly curve (Fay, 1989) and stores it in a data frame with (x, y) coordinates. Refer to the \href{https://en.wikipedia.org/wiki/Butterfly_curve_(transcendental)}{Wikipedia article} for details.
#' @param n The number of points to generate
#' @param a A parameter
#' @param b A parameter
#' @param c A parameter
#' @param d A parameter
#' @param e A parameter
#' @param f A parameter
#' @param g A parameter
#' @param h A parameter
#' @param i A parameter
#' @param j A parameter
#' @keywords butterfly curve
#' @export
#' @examples
#' butterfly_curve()

butterfly_curve <- function(n = 1000, a = 12, b = 12, c = 2, d = 2,
                            e = 4, f = 4, g = 5, h = 5, i = 12, j = 12) {
  result <- data.frame(t = seq(0, a*pi, b*pi/n)) %>%
    dplyr::mutate(x = sin(t) * (exp(cos(t)) - c*cos(e*t) - (sin(t/i))^g),
                  y = cos(t) * (exp(cos(t)) - d*cos(f*t) - (sin(t/j))^h)) %>%
    dplyr::select(-t)
  result
}