#' Olive branch
#'
#' Generates 'Olive branch' data from parametric formulas and stores it in a data frame
#' @param n The number of points to generate
#' @keywords plant olive branch
#' @export
#' @examples
#' olive_branch()

olive_branch <- function(n = 4000) {
  data.frame(k = 1:n) %>%
    mutate(
      x = (2*k/4000)+(1/28)*sin(42*pi*k/4000)+(1/9)*(sin(21*pi*k/4000))^8+(1/4)*(sin(21*pi*k/4000))^6*sin((2*pi/5)*(k/4000)^12),
      y = (1/4)*(k/4000)^2+(1/4)*((sin(21*pi*k/4000))^5+(1/28)*sin(42*pi*k/4000))*cos((pi/2)*(k/4000)^12),
      r = (1/170)+(1/67)*(sin(42*pi*k/4000))^2*(1-(cos(21*pi*k/4000))^4)
    )
}

library(ggart)
library(ggforce)
library(tidyverse)

df <- olive_branch()

ggplot() +
  geom_circle(aes(x0 = x, y0 = y, r = r), df) +
  coord_equal() +
  theme_blankcanvas(margin_cm = 0)