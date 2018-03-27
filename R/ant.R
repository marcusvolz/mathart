#' Ant
#'
#' Generates 'Ant' data from parametric formulas and stores it in a data frame
#' @param dt Time step
#' @keywords ant
#' @export
#' @examples
#' ant()

ant <- function(dt = 0.001) {
  data.frame(t = seq(0, pi, dt)) %>%
    mutate(
      x = (cos(7*t))^9*(cos(21*t))^10*(cos(70*t))^8,
      y = cos(2*t)+(cos(80*t))^2*(cos(10*t)*cos(t))^10+(1/3)*(sin(420*t))^4-(2/3)*(sin(t)*sin(5*t))^10,
      r = (1/150)+(1/30)*(sin(840*t))^2+(1/3)*(sin(7*t))^8
    )
}
