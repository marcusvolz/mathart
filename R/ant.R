#' Generate ant data
#'
#' Generates data for plotting an ant and stores it in a data frame with (x, y) coordinates and radius r. \cr
#' 
#' The equations were discovered by the mathematical artist \href{https://mathematics.culturalspot.org/home}{Hamid Naderi Yeganeh}. \cr
#' 
#' Hamid's equations can be found \href{https://www.huffingtonpost.com/entry/ant-spider-and-millipede-_b_8583338.html}{here}.
#' 
#' @param n The number of points to generate
#' @keywords ant
#' @export
#' @examples
#' ant()

ant <- function(n = 3000) {
  data.frame(t = seq(0, pi, pi/n)) %>%
    dplyr::mutate(
      x = (cos(7*t))^9*(cos(21*t))^10*(cos(70*t))^8,
      y = cos(2*t)+(cos(80*t))^2*(cos(10*t)*cos(t))^10+(1/3)*(sin(420*t))^4-(2/3)*(sin(t)*sin(5*t))^10,
      r = (1/150)+(1/30)*(sin(840*t))^2+(1/3)*(sin(7*t))^8
    ) %>%
    dplyr::select(-t)
}
