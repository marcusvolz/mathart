#' De Jong attractor
#'
#' Generates data for plotting a De Jong attractor and stores it in a data frame. The Rcpp implementation is from the blog post \href{https://fronkonstin.com/2017/11/07/drawing-10-million-points-with-ggplot-clifford-attractors/}{Drawing 10 Million Points With ggplot} by Antonio Sanchez Chinchon.
#' @param a,b Parameters
#' @param x0,y0 Initial point coordinates
#' @param n The number of points to generate
#' @keywords De Jong attractor
#' @export
#' @examples
#' dejong_attractor()

dejong_attractor <- function(a = 0.4, b = 60, c = 10, d = 1.6, x0 = 0.1, y0 = 0.1, n = 10000000) {
  cppFunction('DataFrame createTrajectory(int n, double x0, double y0, 
              double a, double b, double c, double d) {
              // create the columns
              NumericVector x(n);
              NumericVector y(n);
              x[0]=x0;
              y[0]=y0;
              for(int i = 1; i < n; ++i) {
              x[i] = sin(a*y[i-1])-cos(b*x[i-1]);
              y[i] = sin(c*x[i-1])-cos(d*y[i-1]);
              }
              // return a new data frame
              return DataFrame::create(_["x"]= x, _["y"]= y);
              }
              ')
  result <- createTrajectory(n, x0, y0, a, b, c, d)
  result
}