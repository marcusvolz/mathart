#' Generate leaves data
#'
#' Generates data for plotting leaves and stores it in a data frame with (x, y) coordinates and radius r
#' @param n The number of points to generate
#' @keywords plant leaves
#' @export
#' @examples
#' leaves()

leaves <- function(n = 30000) {
  data.frame(k = 1:n) %>%
    dplyr::mutate(
      x = (3/2)*(sin((2*pi*k/30000)+(pi/3)))^7,
      y = (1/4)*(cos(6*pi*k/30000))^2*(2-(sin((2*pi*k/30000)+(pi/3)))^4-2*(cos(pi*k/30))^2)-(1/2)*(cos((2*pi*k/30000)+(pi/3)))^2,
      r = (1/140)+(1/70)*(cos((2*pi*k/30000)+(pi/3)))^10
    ) %>%
    dplyr::select(-k)
}
