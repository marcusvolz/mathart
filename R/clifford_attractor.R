#' Clifford attractor
#'
#' Generates data for plotting a Clifford attractor and stores it in a data frame. The Rcpp implementation is from the blog post \href{https://fronkonstin.com/2017/11/07/drawing-10-million-points-with-ggplot-clifford-attractors/}{Drawing 10 Million Points With ggplot} by Antonio Sanchez Chinchon.
#' @param a,b,c,d Parameters
#' @param n The number of points to generate
#' @keywords Clifford attractor
#' @export
#' @examples
#' clifford_attractor()

clifford_attractor <- function(a = 1.5, b = -1.8, c = 1.6, d = 2, n = 10000000) {
  cppFunction('DataFrame createTrajectory(int n, double x0, double y0, 
              double a, double b, double c, double d) {
              // create the columns
              NumericVector x(n);
              NumericVector y(n);
              x[0]=x0;
              y[0]=y0;
              for(int i = 1; i < n; ++i) {
              x[i] = sin(a*y[i-1])+c*cos(a*x[i-1]);
              y[i] = sin(b*x[i-1])+d*cos(b*y[i-1]);
              }
              // return a new data frame
              return DataFrame::create(_["x"]= x, _["y"]= y);
              }
              ')
  result <- createTrajectory(n, 0, 0, a, b, c, d)
  result
}