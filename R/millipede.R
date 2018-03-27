#' Millipede
#'
#' Generates 'Millipede' data from parametric formulas and stores it in a data frame
#' @param dt Time step
#' @keywords millipede
#' @export
#' @examples
#' millipede()

millipede <- function(dt = 0.001) {
  data.frame(t = seq(0, pi, dt)) %>%
    mutate(
      x = cos(2*t)+(1/17)*(sin(906*t))^2+(1/6)*(cos(t)*cos(6*t)*cos(18*t))^14*(cos(81*t))^10,
      y = (1/10)*(cos(3*t))^2+(1/18)*(2+(sin(2*t))^2)*(cos(151*t))^9,
      r = (1/300)+(4/185)*(sin(151*t))^10*(3+2*(sin(2*t))^2)
    )
}
