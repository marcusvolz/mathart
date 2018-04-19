#' Generate mollusc data
#'
#' Generates data for plotting mollusc shells and stores it in a data frame with (x, y, z) coordinates. The shell model is described in the paper "Models for mollusc shell shape" by M.B. Cortie (1989).
#' @param n Number of points to generate
#' @param alpha Equiangular angle of spiral
#' @param beta Angle between z-axis and line from aperture local origin to xyz origin
#' @param phi Tilt of ellipse major axis from horizontal plane
#' @param mu Amount of "leaning over" of aperture
#' @param Omega Amount of azimuthal rotation of aperture
#' @param s_min Angle at which aperture-generating curve begins
#' @param s_max Angle at which aperture-generating curve ends
#' @param A Distance from main origin to local origin of aperture at theta=0
#' @param a Major radius of ellipse at theta=0
#' @param b Minor radius of ellipse at theta=0
#' @param P Position of nodule in terms of the angle, s
#' @param W_1 Width of nodule in s-direction
#' @param W_2 Width of nodule in theta-direction
#' @param N Number of nodules per whorl
#' @param L Height of nodule at theta=0
#' @param D Sense of coiling; 1=dextral, -1=sinistral
#' @param theta_start Required for shells such as Dentalium or Diodora, which grow at one end while dissolving at the other. In all other cases set to -Inf
#' @param theta_end Not important for self-similar shells, except very small or large values can cause computational problems
#' @keywords mollusc
#' @export
#' @examples
#' mollusc()

mollusc <- function(n = 1000, alpha = 80, beta = 40, phi = 55, mu = 10, Omega = 30, s_min = -270, s_max = 62,
                A = 25, a = 12, b = 16, P = 2, W_1 = 1, W_2 = 1, N = 1, L = 0, D = 1,
                theta_start = 0, theta_end = 10*pi) {
  data.frame(expand.grid(seq(s_min, s_max, (s_max-s_min)/10000),
                         seq(theta_start, theta_end, (theta_end-theta_start)/n)) %>%
               dplyr::rename(s = Var1, theta = Var2)) %>%
    dplyr::mutate(
      f_theta = ifelse(N == 0, Inf, 360/N*(theta*N/360-round(theta*N/360, 0))),
      R_e = (a^(-2)*(cos(s))^2+b^(-2)*(sin(s))^2)^(-0.5),
      k = L*exp(-(2*(s-P)/W_1)^2)*exp(-(2*f_theta/W_2)^2),
      R = R_e + k,
      x = D*(A*sin(beta)+R*cos(s+phi)*cos(theta+Omega)-R*sin(mu)*sin(s+phi)*sin(theta))*exp(theta/tan(alpha)),
      y =  (-A*sin(beta)-R*cos(s+phi)*sin(theta+Omega)-R*sin(mu)*sin(s+phi)*cos(theta))*exp(theta/tan(alpha)),
      z =  (-A*cos(beta)+R*sin(s+phi)*cos(mu))*exp(theta/tan(alpha))
    ) %>%
    dplyr::select(x, y, z)
}
