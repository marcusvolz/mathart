#' k-d tree
#'
#' Computes a k-d tree for a given set of points
#' @param points A data frame with columns for x and y coordinates, and each point in a row. Refer to the \href{https://en.wikipedia.org/wiki/K-d_tree}{Wikipedia article} for details.
#' @keywords k-d tree
#' @export
#' @examples
#' kdtree()

kdtree <- function(points, minmax = FALSE) {
  n <- nrow(points)
  df <- data.frame(xmin = numeric(n), xmax = numeric(n), ymin = numeric(n), ymax = numeric(n),
                   dir  = character(n),
                   x    = numeric(n), y    = numeric(n), xend = numeric(n), yend = numeric(n),
                   minmax = character(n)) %>%
    mutate(dir = as.character(dir), minmax = as.character(n))
  
  i <- 1
  k <- 2
  l <- n
  
  df[1, c("xmin", "xmax", "ymin", "ymax")] <- c(min(points$x), max(points$x),
                                                min(points$y), max(points$y))
  df[1, "dir"] <- "v"
  df[1, "minmax"] <- "min"
  
  while(i < l) {
    if(df$dir[i] == "v") {
      temp <- points %>%
        filter(x > df[i, "xmin"], x < df[i, "xmax"], y > df[i, "ymin"], y < df[i, "ymax"])
      if(minmax & df$minmax[i] == "min") {
        temp <- temp %>% summarise(x = min(x) + 1)
      } else if (minmax & df$minmax[i] == "max") {
        temp <- temp %>% summarise(x = max(x) - 1)
      } else {
        temp <- temp %>% summarise(x = median(x))
      }
      df[i, c("x", "xend", "y", "yend")] <- c(temp, temp, df$ymin[i], df$ymax[i])
      df[k, ] <- df[i, ]
      df[k+1, ] <- df[i, ]
      df$xmax[k] <- temp
      df$xmin[k+1] <- temp
      df$dir[k] <- "h"
      df$dir[k+1] <- "h"
      df$minmax[k] <- ifelse(df$minmax[i] == "min", "max", "min")
      df$minmax[k+1] <- ifelse(df$minmax[i] == "min", "min", "max")
      k <- k + 2
      i <- i + 1
      print(i)
    } else {
      temp <- points %>%
        filter(x > df[i, "xmin"], x < df[i, "xmax"], y > df[i, "ymin"], y < df[i, "ymax"])
      if(minmax & df$minmax[i] == "min") {
        temp <- temp %>% summarise(y = min(y) + 1)
      } else if (minmax & df$minmax[i] == "max") {
        temp <- temp %>% summarise(y = max(y) - 1)
      } else {
        temp <- temp %>% summarise(y = median(y))
      }
      df[i, c("x", "xend", "y", "yend")] <- c(df$xmin[i], df$xmax[i], temp, temp)
      df[k, ] <- df[i, ]
      df[k+1, ] <- df[i, ]
      df$ymax[k] <- temp
      df$ymin[k+1] <- temp
      df$dir[k] <- "v"
      df$dir[k+1] <- "v"
      df$minmax[k] <- ifelse(df$minmax[i] == "min", "max", "min")
      df$minmax[k+1] <- ifelse(df$minmax[i] == "min", "min", "max")
      k <- k + 2
      i <- i + 1
      print(i)
    }
  }
  df
}