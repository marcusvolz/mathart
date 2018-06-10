#' Quadtree
#'
#' Compute a quadtree for a given set of points. Refer to the \href{https://en.wikipedia.org/wiki/Quadtree}{Wikipedia article} for details.
#' @param points A data frame with columns for x and y coordinates, and each point in a row.
#' @keywords quadtree
#' @export
#' @examples
#' quadtree()

quadtree <- function(points) {
  n <- nrow(points)
  df <- data.frame(xmin = numeric(10^6), ymin = numeric(10^6), xmax = numeric(10^6), ymax = numeric(10^6))
  df[1, ] <- c(0, 0, 10000, 10000)
  k <- 1 # Row being examined
  m <- 1 # Number of rows so far
  finished <- FALSE
  while(!finished) {
    square <- data.frame(x = c(df$xmin[k], df$xmax[k], df$xmax[k], df$xmin[k]), y = c(df$ymin[k], df$ymin[k], df$ymax[k], df$ymax[k]))
    temp <- points %>% filter(x >= df$xmin[k], x < df$xmax[k], y >= df$ymin[k], y < df$ymax[k])
    if(nrow(temp) > 0) {
      x1 <- df$xmin[k]
      y1 <- df$ymin[k]
      x2 <- df$xmax[k]
      y2 <- df$ymin[k]
      x3 <- df$xmax[k]
      y3 <- df$ymax[k]
      x4 <- df$xmin[k]
      y4 <- df$ymax[k]
      new_rows <- data.frame(xmin = c(x1,        (x2+x1)/2, (x2+x1)/2,  x1),
                             ymin = c(y1,         y1,       (y3+y2)/2, (y3+y2)/2),
                             xmax = c((x2+x1)/2,  x2,        x2,       (x2+x1)/2),
                             ymax = c((y3+y2)/2, (y3+y2)/2,  y3,        y3))
      df[seq(m+1, m+4), ] <- new_rows
      m <- m + 4
    }
    k <- k + 1
    if(k > m) {
      finished <- TRUE
    }
    print(k)
  }
  df2 <- df[1:m, ] %>%
    mutate(id = 1:nrow(.), x1 = xmin, y1 = ymin, x2 = xmax, y2 = ymin, x3 = xmax, y3 = ymax, x4 = xmin, y4 = ymax) %>%
    select(id, x1, y1, x2, y2, x3, y3, x4, y4)
  df3 <- (df2 %>% select(id, x1, y1) %>% rename(x = x1, y = y1)) %>%
    rbind((df2 %>% select(id, x2, y2) %>% rename(x = x2, y = y2))) %>%
    rbind((df2 %>% select(id, x3, y3) %>% rename(x = x3, y = y3))) %>%
    rbind((df2 %>% select(id, x4, y4) %>% rename(x = x4, y = y4)))
  df3
}