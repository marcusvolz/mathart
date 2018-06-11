#' Weiszfeld
#'
#' Finds the geometric median for a given set of points using Weiszfeld's algorithm. Refer to the \href{https://en.wikipedia.org/wiki/Geometric_median}{Wikipedia article} for details.
#' @param points A data frame with columns for x and y coordinates
#' @param p0 A vector with the (x, y) co-ordinates of the initial point
#' @keywords weiszfeld
#' @export
#' @examples
#' weiszfeld()

weiszfeld <- function(points, p0) {
  # Parameters
  n <- nrow(points) # number of terminals
  e <- 0.01 * (max(points$x) - min(points$x))
  delta <- 1000000
  
  # Data frames
  temp <- data.frame(x = numeric(0), y = numeric(0))
  temp2 <- data.frame(x = numeric(0), y = numeric(0))
  data <- data.frame(x = numeric(0), y = numeric(0), group = integer(0))
  
  # Main loop
  xk <- p0[1]
  yk <- p0[2]
  df <- data.frame(x = xk, y = yk)
  while (delta > e) {
    for (i in 1:n) {
      xj <- points$x[i]
      yj <- points$y[i]
      temp[i, ] <- points[i, ] / sqrt((xk - xj)^2 + (yk - yj)^2)
      temp2[i, ] <- 1 / sqrt((xk - xj)^2 + (yk - yj)^2)
    }
    df <- df %>%
      rbind(c(sum(temp$x) / sum(temp2$x), sum(temp$y) / sum(temp2$y)))
    xk <- df$x[nrow(df)]
    yk <- df$y[nrow(df)]
    k <- nrow(df)
    delta <- ifelse(k > 1, sqrt((df$x[k] - df$x[k-1])^2 + (df$y[k] - df$y[k-1])^2), 100000)
  }
  data %>% rbind(df)
}
