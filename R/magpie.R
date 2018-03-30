#' Generate magpie data
#'
#' Generates data for plotting a magpie and stores it in a data frame with (x, y) coordinates and radius r
#' @param n The number of points to generate
#' @keywords magpie
#' @export
#' @examples
#' magpie()

magpie <- function(n = 200000) {
  data.frame(k = seq(-10000, 10000, 20000/n)) %>%
    dplyr::mutate(
      x = (11*k/100000)+(cos(41*pi*k/10000))^6*sin((k/10000)^7*(pi/2)),
      y = -(cos(41*pi*k/10000))^6*cos((k/10000)^7*(pi/2))*(1+(5/2)*(cos(3*pi*k/100000)*cos(9*pi*k/100000))^8)+(1/2)*(cos(pi*k/40000)*cos(3*pi*k/40000)*cos(3*pi*k/20000))^10,
      r = (1/50)+(1/20)*(sin(41*pi*k/10000)*sin(pi*k/10000))^2
    ) %>%
    dplyr::select(-k)
}
