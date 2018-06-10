#' Henon attractor
#'
#' Generates data for plotting a Henon attractor and stores it in a data frame. The Rcpp implementation is from the blog post \href{https://fronkonstin.com/2017/11/07/drawing-10-million-points-with-ggplot-clifford-attractors/}{Drawing 10 Million Points With ggplot} by Antonio Sanchez Chinchon.
#' @param a,b Parameters
#' @param x0,x1 Initial point coordinates
#' @param n Number of points to generate
#' @keywords Henon attractor
#' @export
#' @examples
#' henon_attractor()
henon_attractor <- function(a=1.027, b=0.3, x0=0.1, x1=0.1, n=10000) {
  cppFunction('DataFrame createTrajectory(double a, double b,
                       double x0, double x1, int n) {
              // Create columns
              NumericVector x(n);
              x[0]=x0;
              x[1]=x1;
              for(int i = 2; i < n; ++i) {
              x[i] = b*x[i-2]+1-a*x[i-1]*x[i-1];
              }
              // Return a new data frame
              return DataFrame::create(_["x"]= x);
              }
              ')
  result <- createTrajectory(a, b, x0, x1, n)
  result
}