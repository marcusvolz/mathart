#' Generate branch data
#'
#' Generates data for plotting a branch and stores it in a data frame with (x, y) coordinates and radius r
#' 
#' The equations were discovered by the mathematical artist \href{https://mathematics.culturalspot.org/home}{Hamid Naderi Yeganeh}. \cr
#' 
#' Hamid's equations can be found \href{https://www.huffingtonpost.com/entry/mathematical-plants_b_9010790.html}{here}.
#' 
#' @param n The number of points to generate
#' @keywords branch
#' @export
#' @examples
#' branch()

branch <- function(n = 3000) {
  data.frame(k = 1:n) %>%
    dplyr::mutate(
      x = (2*k/3000)+(1/17)*sin(pi*k/100)+(1/9)*(sin(pi*k/200))^8,
      y = (1/4)*(k/3000)^2+(1/4)*(sin(pi*k/200))^5+(1/112)*sin(pi*k/100),
      r = (1/170)+(1/24)*(sin(pi*k/100))^2*(1-(cos(pi*k/200))^4)
    ) %>%
    dplyr::select(-k)
}
