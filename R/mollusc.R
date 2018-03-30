#' Generate mollusc data
#'
#' Generates data for plotting mollusc shells and stores it in a data frame with (x, y, z) coordinates
#' @param alpha A parameter
#' @param beta A parameter
#' @param phi A parameter
#' @param mu A parameter
#' @param Omega A parameter
#' @param s_min A parameter
#' @param s_max A parameter
#' @param A A parameter
#' @param a A parameter
#' @param b A parameter
#' @param P A parameter
#' @param W_1 A parameter
#' @param W_2 A parameter
#' @param N A parameter
#' @param L A parameter
#' @param D A parameter
#' @param theta_start A parameter
#' @param theta_end A parameter
#' @keywords mollusc
#' @export
#' @examples
#' mollusc()

mollusc <- function(alpha = 80, beta = 40, phi = 55, mu = 10, Omega = 30, s_min = -270, s_max = 62,
                A = 25, a = 12, b = 16, P = 2, W_1 = 1, W_2 = 1, N = 1, L = 0, D = 1,
                theta_start = 0, theta_end = 10*pi) {
  data.frame(expand.grid(seq(s_min, s_max, 1),
                         seq(theta_start, theta_end, (theta_end-theta_start)/1000)) %>%
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
