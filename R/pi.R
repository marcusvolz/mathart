#' Generate pi data
#'
#' Generates data for plotting the pi symbol and stores it in a data frame with (x, y) coordinates and radius r
#' @param n The number of points to generate
#' @keywords pi
#' @export
#' @examples
#' pi1()

pi1 <- function(n = 2000) {
  data.frame(k = 1:n) %>%
    dplyr::mutate(
      x = (19*k/30000)+(cos((pi*k/1000)+(3*pi/10)))^10*(cos((3*pi*k/1000)+(9*pi/10)))^10*sin((pi*k/21000)-(17*pi/140)),
      y = -(cos((pi*k/1000)+(3*pi/10)))^10*(cos((3*pi*k/1000)+(9*pi/10)))^10-(1/6)*(cos(pi*k/6000))^14*(cos(pi*k/2000))^14,
      r = (1/20)*(cos((pi*k/1000)+(3*pi/10)))^14*(cos((3*pi*k/1000)+(9*pi/10)))^14+(1/14)*(1-(cos(pi*k/6000))^8*(cos(pi*k/2000))^8)
    ) %>%
    dplyr::select(-k)
}
