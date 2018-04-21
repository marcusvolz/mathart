#' Segment noise
#'
#' Adds noise to a collection of line segments
#' @param segmments A data frame with segment endpoint coordinates x, y, xend and yend
#' @param eps aximum endpoint perturbation as a percentage of edge length
#' @param N Number of edge replications
#' @param nframes Number of tween iterations
#' @keywords segment noise
#' @export
#' @examples
#' segment_noise()

segment_noise <- function(segments, eps, N, nframes) {
  n <- nrow(segments)
  jitter_segments <- function() {
    segments %>%
      dplyr::mutate(
        length = sqrt((xend-x)^2+(yend-y)^2),
        r1 = runif(n, 0, eps)*length,
        r2 = runif(n, 0, eps)*length,
        theta1 = runif(n, 0, 2*pi)*length,
        theta2 = runif(n, 0, 2*pi)*length,
        x = x + r1*cos(theta1),
        y = y + r1*sin(theta1),
        xend = xend + r2*cos(theta2),
        yend = yend + r2*sin(theta2)) %>%
      dplyr::select(x, y, xend, yend)
  }
  ls <- 1:N %>% map(~jitter_segments())
  
  tween_states(ls, tweenlength = 1, statelength = 0, ease = "linear", nframes = nframes)
}