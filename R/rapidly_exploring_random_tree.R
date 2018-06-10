#' Rapidly-exploring random tree
#'
#' Generates data for plotting a rapidly exploring random tree (rrt). Refer to the \href{https://en.wikipedia.org/wiki/Rapidly-exploring_random_tree}{Wikipedia article} for details.
#' 
#' @param n Number of points to generate
#' @param X Square canvas dimension
#' @param delta Maximum edge length
#' @keywords rapidly exploring random tree
#' @export
#' @examples
#' rapidly_exploring_random_tree()

rapidly_exploring_random_tree <- function(n = 10000, X = 1000, delta = 2.5) {
  # Set up data frames for points and edges
  points <- data.frame(x = numeric(n), y = numeric(n))
  points[1, ] <- runif(2, 0, X)
  edges <- data.frame(x = numeric(n), y = numeric(n), xend = numeric(n), yend = numeric(n))
  edges[1, ] <- c(as.numeric(points[1, ]), as.numeric(points[1, ]))
  
  # Main loop
  i <- 2
  while(i <= n) {
    valid <- FALSE
    while(!valid) {
      # Sample a random point
      rp <- runif(2, 0, X)
      # Find the nearest neighbour to rp
      temp <- points[1:(i-1), ] %>%
        mutate(dist = sqrt((rp[1] - x)^2 + (rp[2] - y)^2)) %>%
        arrange(dist)
      np <- as.numeric(temp[1, c("x", "y")])
      # Limit the maximum edge length
      if(temp$dist[1] > delta) {
        rp2 <- np + (rp - np) / temp$dist[1] * delta
        rp <- rp2
      }
      # Check if the line segment between rp and np intersects an existing edge
      temp2 <- edges[1:(i-1), ] %>%
        mutate(intersects = does_intersect(rp, np, c(x, y), c(xend, yend)))
      if(sum(temp2$intersects) <= 0) {
        points[i, ] <- rp
        edges[i, ] <- c(np, rp)
        valid <- TRUE
      }
    }
    i <- i + 1
    print(paste0("Iteration: ", i, " of ", n))
  }
  edges
}