#' Branch
#'
#' Generates 'Branch' data from parametric formulas and stores it in a data frame
#' @param n The number of points to generate
#' @keywords plant leaves
#' @export
#' @examples
#' branch()

branch <- function(n = 3000) {
  data.frame(k = 1:n) %>%
    mutate(
      x = (2*k/3000)+(1/17)*sin(pi*k/100)+(1/9)*(sin(pi*k/200))^8,
      y = (1/4)*(k/3000)^2+(1/4)*(sin(pi*k/200))^5+(1/112)*sin(pi*k/100),
      r = (1/170)+(1/24)*(sin(pi*k/100))^2*(1-(cos(pi*k/200))^4)
    )
}