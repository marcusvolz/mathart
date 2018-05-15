#' Generate bird_in_flight data
#'
#' Generates data for plotting a bird in flight and stores it in a data frame with (x, y, xend, yend) coordinates
#' 
#' The equations were discovered by the mathematical artist \href{https://mathematics.culturalspot.org/home}{Hamid Naderi Yeganeh}. \cr
#' 
#' Hamid's equations can be found \href{https://www.huffingtonpost.com/entry/importing-things-from-the_b_8111912.html}{here}.
#' 
#' @param n The number of points to generate
#' @keywords bird flight
#' @export
#' @examples
#' bird_in_flight()

bird_in_flight <- function(n = 20000) {
  data.frame(i = seq(1, 2000, 2000/n)) %>%
    dplyr::mutate(
      x = 3*(sin(2*pi*i/2000)^3),
      y = cos(8*pi*i/2000),
      xend = (3/2)*(sin(2*pi*i/2000)^3),
      yend = (-1/2)*cos(6*pi*i/2000)
    ) %>%
    dplyr::select(-i)
}
