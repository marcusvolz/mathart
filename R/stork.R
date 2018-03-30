#' Generate stork data
#'
#' Generates data for plotting a stork and stores it in a data frame with (x, y) coordinates and radius r
#' @param n The number of points to generate
#' @keywords stork
#' @export
#' @examples
#' stork()

stork <- function(n = 80000) {
  data.frame(k = seq(-4000, 4000, 8000/n)) %>%
    dplyr::mutate(
      x = (3*k/4000)+(cos(32*pi*k/4000))^6*sin((k/4000)^7*(pi/2)),
      y = -(cos(32*pi*k/4000))^6*cos((k/4000)^7*(pi/2))*(1+(cos(pi*k/8000)*cos(3*pi*k/8000))^4)+3*(cos(pi*k/8000)*cos(3*pi*k/8000))^16*(cos(16*pi*k/4000))^9,
      r = (1/30)+(1/15)*(cos(pi*k/8000)*cos(5*pi*k/8000))^10*(1-(1/2)*(cos(32*pi*k/4000))^12)+(1/7)*(sin(32*pi*k/4000))^4*(sin(pi*k/4000))^2
    ) %>%
    dplyr::select(-k)
}
