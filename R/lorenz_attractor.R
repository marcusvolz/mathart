#' Lorenz attractor
#'
#' Generates data for plotting a Lorenz attractor and stores it in a data frame. The Rcpp implementation is from the blog post \href{https://fronkonstin.com/2017/11/07/drawing-10-million-points-with-ggplot-clifford-attractors/}{Drawing 10 Million Points With ggplot} by Antonio Sanchez Chinchon.
#' @param a,b,c Parameters
#' @param x0,y0,z0 Initial point coordinates
#' @param dt Time step
#' @param n Number of points to generate
#' @keywords Lorenz attractor
#' @export
#' @examples
#' lorenz_attractor()
lorenz_attractor <- function(a=2, b=0.7, c=26, x0=-1, y0=1, z0=-1, dt=0.01, n=10000) {
  cppFunction('DataFrame createTrajectory(double a, double b, double c,
                       double x0, double y0, double z0, double dt, int n) {
              // Create columns
              NumericVector x(n);
              NumericVector y(n);
              NumericVector z(n);
              x[0]=x0;
              y[0]=y0;
              z[0]=z0;
              for(int i = 1; i < n; ++i) {
              x[i] = x[i-1] + (a*(y[i-1]-x[i-1]))*dt;
              y[i] = y[i-1] + (x[i-1]*(c-z[i-1])-y[i-1])*dt;
              z[i] = z[i-1] + (x[i-1]*y[i-1]-b*z[i-1])*dt;
              }
              // Return a new data frame
              return DataFrame::create(_["x"]= x, _["y"]= y, _["z"]= z);
              }
              ')
  result <- createTrajectory(a, b, c, x0, y0, z0, dt, n)
  result
}