#' Generate fractal fern data
#'
#' Generates data for plotting a fractal fern and stores it in a data frame with (x, y) coordinates
#' @param n The number of points to generate
#' @param a Coefficient vector of length 4
#' @param b Coefficient vector of length 4
#' @param c Coefficient vector of length 4
#' @param d Coefficient vector of length 4
#' @param e Coefficient vector of length 4
#' @param f Coefficient vector of length 4
#' @param p Probability vector of length 4
#' @keywords fractal fern
#' @export
#' @examples
#' fractal_fern()

fractal_fern <- function(n = 10000,
                         a = c(0, 0.85, 0.20, -0.15),
                         b = c(0, 0.04, -0.26, 0.28),
                         c_ = c(0, -0.04, 0.23, 0.26),
                         d = c(0.16, 0.85, 0.22, 0.24),
                         e = c(0, 0, 0, 0),
                         f = c(0, 1.60, 1.60, 0.44),
                         p = c(0.01, 0.85, 0.07, 0.07)) {

  result <- data.frame(x = numeric(n), y = numeric(n))

  for(i in 2:n) {
    r <- runif(1)
    x <- result[i-1, "x"]
    y <- result[i-1, "y"]
    if(r <= p[1]) {
      result[i, "x"] =  a[1]*x + b[1]*y + e[1]
      result[i, "y"] =  c_[1]*x + d[1]*y + f[1]
    } else if(r <= p[1]+p[2]) {
      result[i, "x"] =  a[2]*x + b[2]*y + e[2]
      result[i, "y"] =  c_[2]*x + d[2]*y + f[2]
    } else if(r <= p[1]+p[2]+p[3]) {
      result[i, "x"] =  a[3]*x + b[3]*y + e[3]
      result[i, "y"] =  c_[3]*x + d[3]*y + f[3]
    } else {
      result[i, "x"] =  a[4]*x + b[4]*y + e[4]
      result[i, "y"] =  c_[4]*x + d[4]*y + f[4]
    }
  }
  result
}
