#' Generate heart3 data
#'
#' Generates data for plotting a heart and stores it in a data frame with (x, y) coordinates and radius r
#' 
#' The equations were discovered by the mathematical artist \href{https://mathematics.culturalspot.org/home}{Hamid Naderi Yeganeh}. \cr
#' 
#' Hamid's equations can be found \href{https://www.huffingtonpost.com/entry/mathematical-formulas-for-the-symbol-of-love_b_8848264.html}{here}.
#' 
#' @param n The number of points to generate
#' @keywords heart
#' @export
#' @examples
#' heart3()

heart3 <- function(n = 1000000) {
  data.frame(t = seq(0, pi, pi/n)) %>%
    dplyr::mutate(
      x = 1/6*sin(2*t)*(1 + cos(80*t))*(1 - 1/12*(sin(2*t))^8),
      y = -1/2*(2*t/pi - 1)^2 +  1/7*sin(2*t)*(sin(80*t))^8
    ) %>%
    dplyr::select(-t)
}
