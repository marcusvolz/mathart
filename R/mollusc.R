#' Generate mollusc data
#'
#' Generates data for plotting mollusc shells and stores it in a data frame with (x, y, z) coordinates. The shell model is described in the paper "Models for mollusc shell shape" by M.B. Cortie (1989).
#' @param n_s Number of points to generate with respect to s
#' @param n_t Number of points to generate with respect to theta
#' @param alpha Equiangular angle of spiral (degrees)
#' @param beta Angle between z-axis and line from aperture local origin to xyz origin (degrees)
#' @param phi Tilt of ellipse major axis from horizontal plane (degrees)
#' @param mu Amount of "leaning over" of aperture (degrees)
#' @param Omega Amount of azimuthal rotation of aperture (degrees)
#' @param s_min Angle at which aperture-generating curve begins (degrees)
#' @param s_max Angle at which aperture-generating curve ends (degrees)
#' @param A Distance from main origin to local origin of aperture at theta=0
#' @param a Major radius of ellipse at theta=0
#' @param b Minor radius of ellipse at theta=0
#' @param P Position of nodule in terms of the angle, s (degrees)
#' @param W_1 Width of nodule in s-direction (degrees)
#' @param W_2 Width of nodule in theta-direction (degrees)
#' @param N Number of nodules per whorl
#' @param L Height of nodule at theta=0
#' @param D Sense of coiling; 1=dextral, -1=sinistral
#' @param theta_start Required for shells such as Dentalium or Diodora, which grow at one end while dissolving at the other. In all other cases set to -Inf
#' @param theta_end Not important for self-similar shells, except very small or large values can cause computational problems
#' @keywords mollusc
#' @export
#' @examples
#' mollusc()

mollusc <- function(n_s = 1000, n_t = 4000,
                    alpha = 80, beta = 40, phi = 55, mu = 30, Omega = 10, s_min = -270, s_max = 62,
                    A = 25, a = 12, b = 16, P = 2, W_1 = 1, W_2 = 1, N = 0, L = 0, D = 1,
                    theta_start = 0, theta_end = 10*pi) {
  alpha <- alpha * pi / 180
  beta <- beta * pi / 180
  phi <- phi * pi / 180
  mu <- mu * pi / 180
  Omega <- Omega * pi / 180
  s_min <- s_min * pi / 180
  s_max <- s_max * pi / 180
  P <- P * pi / 180
  W_1 <- W_1 * pi / 180
  W_2 <- W_2 * pi / 180
  data.frame(expand.grid(seq(s_min, s_max, (s_max-s_min)/(n_s-1)),
                         seq(theta_start, theta_end, (theta_end-theta_start)/(n_t-1))) %>%
               dplyr::rename(s = Var1, theta = Var2)) %>%
    dplyr::mutate(
      f_theta = ifelse(N == 0, Inf, 360/N*(theta*N/360-round(theta*N/360, 0))),
      R_e = (a^(-2)*(cos(s))^2+b^(-2)*(sin(s))^2)^(-0.5),
      k = L*exp(-(2*(s-P)/W_1)^2)*exp(-(2*f_theta/W_2)^2),
      R = R_e + k,
      x = D*(A*sin(beta)*cos(theta)+R*cos(s+phi)*cos(theta+Omega)-R*sin(mu)*sin(s+phi)*sin(theta))*exp(theta/tan(alpha)),
      y =  (-A*sin(beta)*sin(theta)-R*cos(s+phi)*sin(theta+Omega)-R*sin(mu)*sin(s+phi)*cos(theta))*exp(theta/tan(alpha)),
      z =  (-A*cos(beta)+R*sin(s+phi)*cos(mu))*exp(theta/tan(alpha))
    ) %>%
    dplyr::select(x, y, z)
}