#' Generate millipede data
#'
#' Generates data for plotting a millipede and stores it in a data frame with (x, y) coordinates and radius r
#' @param n The number of points to generate
#' @keywords millipede
#' @export
#' @examples
#' millipede()

millipede <- function(n = 3000) {
  data.frame(t = seq(0, pi, pi/n)) %>%
    dplyr::mutate(
      x = cos(2*t)+(1/17)*(sin(906*t))^2+(1/6)*(cos(t)*cos(6*t)*cos(18*t))^14*(cos(81*t))^10,
      y = (1/10)*(cos(3*t))^2+(1/18)*(2+(sin(2*t))^2)*(cos(151*t))^9,
      r = (1/300)+(4/185)*(sin(151*t))^10*(3+2*(sin(2*t))^2)
    ) %>%
    dplyr::select(-t)
}
