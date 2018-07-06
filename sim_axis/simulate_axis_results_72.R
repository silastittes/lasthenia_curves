run_x <-
structure(list(lm_df = structure(list(term = c("maxima_sc", "stretch_sc", 
"x_max_sc", "x_min_sc"), coef = c(-0.0488415316367484, 0.0345273919703145, 
0.0468151444109777, -0.0401684462080895), p_value = c(0.246417780601266, 
0.0369000517049923, 0.243603805317608, 0.102987467690769), rand_var = c(2.87932167957004, 
2.87932167957004, 2.87932167957004, 2.87932167957004), mean_rand = c(-0.376435224709928, 
-0.376435224709928, -0.376435224709928, -0.376435224709928), 
    sim_n = c(72L, 72L, 72L, 72L)), .Names = c("term", "coef", 
"p_value", "rand_var", "mean_rand", "sim_n"), class = c("tbl_df", 
"tbl", "data.frame"), row.names = c(NA, -4L)), lasso_df = structure(list(
    var = c("maxima", "stretch", "x_max", "x_min"), mean = c(-0.0752598057591735, 
    0.275630381382592, 1.01366521118955, 0.0731575703354583), 
    prop = c(0.1075, 0.275, 0.4825, 0.095), rand_var = c(2.87932167957004, 
    2.87932167957004, 2.87932167957004, 2.87932167957004), mean_rand = c(-0.376435224709928, 
    -0.376435224709928, -0.376435224709928, -0.376435224709928
    ), sim_n = c(72L, 72L, 72L, 72L)), .Names = c("var", "mean", 
"prop", "rand_var", "mean_rand", "sim_n"), class = c("tbl_df", 
"tbl", "data.frame"), row.names = c(NA, -4L)), summ_stan_df = structure(list(
    shape1 = 3.45655850866298, shape2 = 3.04811032883248, stretch = 4.57327410982429, 
    x_min = -0.101306721774553, x_max = 4.21745384511148, maxima = 2.8244307424518, 
    rep = 72L), .Names = c("shape1", "shape2", "stretch", "x_min", 
"x_max", "maxima", "rep"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -1L))), .Names = c("lm_df", "lasso_df", 
"summ_stan_df"))
