#' Generate palm_branch data
#'
#' Generates data for plotting a palm branch and stores it in a data frame with (x, y) coordinates and radius r
#' @param n The number of points to generate
#' @keywords plant palm branch
#' @export
#' @examples
#' palm_branch()

palm_branch <- function(n = 12000) {
  data.frame(k = 1:n) %>%
    dplyr::mutate(
      x = (2*k/12000)+(1/7)*(sin(91*pi*k/12000))^8*(1-(cos(pi*k/24000)*cos(3*pi*k/24000))^10)+(1/4)*(sin(91*pi*k/12000))^6*sin((2*pi/5)*(k/12000)^12),
      y = (1/3)*sin(pi*k/24000)+(1/4)*(sin(91*pi*k/12000))^5*cos((pi/2)*(k/12000)^12)*(1-(cos(pi*k/24000)*cos(3*pi*k/24000))^10),
      r = (1/270)+(1/140)*(sin(182*pi*k/12000))^2*(1-(cos(91*pi*k/12000))^4)+(1/80)*(cos(91*pi*k/12000))^6
    ) %>%
    dplyr::select(-k)
}
