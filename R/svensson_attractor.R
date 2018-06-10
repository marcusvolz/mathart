#' Svensson attractor
#'
#' Generates data for plotting a Svensson attractor and stores it in a data frame. The Rcpp implementation is from the blog post \href{https://fronkonstin.com/2017/11/07/drawing-10-million-points-with-ggplot-clifford-attractors/}{Drawing 10 Million Points With ggplot} by Antonio Sanchez Chinchon.
#' 
#' @param a,b,c,d Parameters
#' @param x0,y0 Initial point coordinates
#' @param n Number of points to generate
#' @keywords Svensson attractor
#' @export
#' @examples
#' svensson_attractor()
svensson_attractor <- function(a=1.4, b=1.6, c=-1.4, d=1.5, x0=0.1, y0=0.1, n=1000000) {
  cppFunction('DataFrame createTrajectory(double a, double b, double c, double d,
                       double x0, double y0, int n) {
              // Create columns
              NumericVector x(n);
              NumericVector y(n);
              x[0]=x0;
              y[0]=y0;
              for(int i = 1; i < n; ++i) {
              x[i] = d*sin(a*x[i-1])-sin(b*y[i-1]);
              y[i] = c*cos(a*x[i-1])+cos(b*y[i-1]);
              }
              // Return a new data frame
              return DataFrame::create(_["x"]= x, _["y"]= y);
              }
              ')
  result <- createTrajectory(a, b, c, d, x0, y0, n)
  result
}