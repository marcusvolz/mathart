#' Mollusc
#'
#' Generates 'Mollusc' data from parametric formulas and stores it in a data frame
#' @param dt Time step
#' @keywords ant
#' @export
#' @examples
#' ant()



mollusc <- function(alpha = 80, beta = 40, phi = 55, mu = 10, Omega = 30, s_min = -270, s_max = 62,
                A = 25, a = 12, b = 16, P = 2, W_1 = 1, W_2 = 1, N = 1, L = 0, D = 1,
                theta_start = -100*0, theta_end = 10*pi) {
  data.frame(expand.grid(seq(s_min, s_max, 1),
                         seq(theta_start, theta_end, (theta_end-theta_start)/1000)) %>% rename(s = Var1, theta = Var2)) %>%
    mutate(
      f_theta = ifelse(N == 0, Inf, 360/N*(theta*N/360-round(theta*N/360, 0))),
      R_e = (a^(-2)*(cos(s))^2+b^(-2)*(sin(s))^2)^(-0.5),
      k = L*exp(-(2*(s-P)/W_1)^2)*exp(-(2*f_theta/W_2)^2),
      R = R_e + k,
      x = D*(A*sin(beta)+R*cos(s+phi)*cos(theta+Omega)-R*sin(mu)*sin(s+phi)*sin(theta))*exp(theta/tan(alpha)),
      y =  (-A*sin(beta)-R*cos(s+phi)*sin(theta+Omega)-R*sin(mu)*sin(s+phi)*cos(theta))*exp(theta/tan(alpha)),
      z =  (-A*cos(beta)+R*sin(s+phi)*cos(mu))*exp(theta/tan(alpha))
    )
}
