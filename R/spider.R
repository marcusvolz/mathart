#' Spider
#'
#' Generates 'Spider' data from parametric formulas and stores it in a data frame
#' @param dt Time step
#' @keywords spider
#' @export
#' @examples
#' spider()

spider <- function(dt = 0.001) {
  data.frame(t = seq(0, pi, dt)) %>%
    mutate(
      x = (cos(7*t))^9*(cos(21*t))^10*(cos(70*t))^8*(1+(1/3)*(sin(5*t))^2),
      y = (1/4)*cos(2*t)+(cos(210*t))^3*(cos(7*t)*cos(21*t))^10*cos((8/5)*t+(pi/5))-(1/2)*(sin(t)*sin(5*t))^10,
      r = (1/32)+(1/6)*(sin(7*t))^4+(1/6)*(sin(t))^8*(sin(5*t)*sin(15*t))^10-(1/40)*(cos(1260*t))^6
    )
}
