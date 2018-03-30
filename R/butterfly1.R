#' Generate butterfly1 data
#'
#' Generates data for plotting a butterfly and stores it in a data frame with (x, y) coordinates and radius r
#' @param n The number of points to generate
#' @keywords butterfly
#' @export
#' @examples
#' butterfly1()

butterfly1 <- function(n = 40000) {
  data.frame(k = 1:n) %>%
    dplyr::mutate(
      x = (6/5)*(cos(141*pi*k/40000))^9*(1-(1/2)*(sin(pi*k/40000))^3)*(1-(1/4)*(cos(2*pi*k/40000))^30*(1+(2/3)*(cos(30*pi*k/40000))^20)-(sin(2*pi*k/40000))^10*(sin(6*pi*k/40000))^10*((1/5)+(4/5)*(cos(24*pi*k/40000))^20)),
      y = cos(2*pi*k/40000)*(cos(141*pi*k/40000))^2*(1+(1/4)*(cos(pi*k/40000))^24*(cos(3*pi*k/40000))^24*(cos(19*pi*k/40000))^24),
      r = (1/100)+(1/40)*((cos(2820*pi*k/40000))^6+(sin(141*pi*k/40000))^2)*(1-(cos(pi*k/40000))^16*(cos(3*pi*k/40000))^16*(cos(12*pi*k/40000))^16)
    ) %>%
    dplyr::select(-k)
}
