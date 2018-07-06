run_x <-
structure(list(lm_df = structure(list(term = c("maxima_sc", "stretch_sc", 
"x_max_sc", "x_min_sc"), coef = c(-0.0158469651411336, 0.0529607983777546, 
0.00451241289803788, -0.0276862666623483), p_value = c(0.131350542968512, 
0.00399532868450756, 0.231859941248926, 0.096585639216678), rand_var = c(0.567943430090329, 
0.567943430090329, 0.567943430090329, 0.567943430090329), mean_rand = c(-0.419006742326367, 
-0.419006742326367, -0.419006742326367, -0.419006742326367), 
    sim_n = c(15L, 15L, 15L, 15L)), .Names = c("term", "coef", 
"p_value", "rand_var", "mean_rand", "sim_n"), class = c("tbl_df", 
"tbl", "data.frame"), row.names = c(NA, -4L)), lasso_df = structure(list(
    var = c("maxima", "stretch", "x_max", "x_min"), mean = c(-0.018831084440601, 
    0.0759657365251179, -0.0880174935629714, -0.105348906405691
    ), prop = c(0.04, 0.1125, 0.0075, 0.0025), rand_var = c(0.567943430090329, 
    0.567943430090329, 0.567943430090329, 0.567943430090329), 
    mean_rand = c(-0.419006742326367, -0.419006742326367, -0.419006742326367, 
    -0.419006742326367), sim_n = c(15L, 15L, 15L, 15L)), .Names = c("var", 
"mean", "prop", "rand_var", "mean_rand", "sim_n"), class = c("tbl_df", 
"tbl", "data.frame"), row.names = c(NA, -4L)), summ_stan_df = structure(list(
    shape1 = 3.32781564259207, shape2 = 4.427505546997, stretch = 1.28134173601248, 
    x_min = -0.237063326218842, x_max = 4.4618859491174, maxima = 2.47207297547712, 
    rep = 15L), .Names = c("shape1", "shape2", "stretch", "x_min", 
"x_max", "maxima", "rep"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -1L))), .Names = c("lm_df", "lasso_df", 
"summ_stan_df"))
