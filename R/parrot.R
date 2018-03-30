#' Generate parrot data
#'
#' Generates data for plotting a parrot and stores it in a data frame with (x, y) coordinates and radius r
#' @param n The number of points to generate
#' @keywords parrot
#' @export
#' @examples
#' parrot()

parrot <- function(n = 200000) {
  data.frame(k = seq(-10000, 10000, 20000/n)) %>%
    dplyr::mutate(
      x = (3*k/20000)+(cos(37*pi*k/10000))^6*sin((k/10000)^7*(3*pi/5))+(9/7)*(cos(37*pi*k/10000))^16*(cos(pi*k/20000))^12*sin(pi*k/10000),
      y = (-5/4)*(cos(37*pi*k/10000))^6*cos((k/10000)^7*(3*pi/5))*(1+3*(cos(pi*k/20000)*cos(3*pi*k/20000))^8)+(2/3)*(cos(3*pi*k/200000)*cos(9*pi*k/200000)*cos(9*pi*k/100000))^12,
      r = (1/32)+(1/15)*(sin(37*pi*k/10000))^2*((sin(pi*k/10000))^2+(3/2)*(cos(pi*k/20000))^18)
    ) %>%
    dplyr::select(-k)
}
