#' Generate flower7 data
#'
#' Generates data for plotting a flower and stores it in a data frame with (x, y) coordinates and radius r
#' @param n The number of points to generate
#' @keywords flower
#' @export
#' @examples
#' flower7()

flower7 <- function(n = 9000) {
  data.frame(k = 1:n) %>%
    dplyr::mutate(
      x = cos(14*pi*k/9000)*(1-(3/4)*(sin(20*pi*k/9000))^4-(1/4)*(cos(60*pi*k/9000))^3),
      y = sin(14*pi*k/9000)*(1-(3/4)*(sin(20*pi*k/9000))^4-(1/4)*(cos(60*pi*k/9000))^3),
      r = (1/120)+(1/18)*(sin(60*pi*k/9000))^4+(1/18)*(sin(160*pi*k/9000))^4
    ) %>%
    dplyr::select(-k)
}
