run_x <-
structure(list(lm_df = structure(list(term = c("maxima_sc", "stretch_sc", 
"x_max_sc", "x_min_sc"), coef = c(0.0285471846399866, 0.0574941293394643, 
-0.009465451510292, -0.0159105381889961), p_value = c(0.116463142406518, 
0.0118281671571498, 0.331828053322704, 0.103233788992235), rand_var = c(1.13314458631044, 
1.13314458631044, 1.13314458631044, 1.13314458631044), mean_rand = c(0.499069924779007, 
0.499069924779007, 0.499069924779007, 0.499069924779007), sim_n = c(29L, 
29L, 29L, 29L)), .Names = c("term", "coef", "p_value", "rand_var", 
"mean_rand", "sim_n"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -4L)), lasso_df = structure(list(var = c("maxima", 
"stretch", "x_max", "x_min"), mean = c(0.00482708650380505, 0.069271599434294, 
-0.00997387303921094, 0.000268491816730439), prop = c(0.01, 0.0675, 
0.0175, 0.03), rand_var = c(1.13314458631044, 1.13314458631044, 
1.13314458631044, 1.13314458631044), mean_rand = c(0.499069924779007, 
0.499069924779007, 0.499069924779007, 0.499069924779007), sim_n = c(29L, 
29L, 29L, 29L)), .Names = c("var", "mean", "prop", "rand_var", 
"mean_rand", "sim_n"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -4L)), summ_stan_df = structure(list(shape1 = 3.44803924505968, 
    shape2 = 2.77794943069902, stretch = 0.951072779550623, x_min = -0.914272121741007, 
    x_max = 4.95046065136582, maxima = 3.15577051279965, rep = 29L), .Names = c("shape1", 
"shape2", "stretch", "x_min", "x_max", "maxima", "rep"), class = c("tbl_df", 
"tbl", "data.frame"), row.names = c(NA, -1L))), .Names = c("lm_df", 
"lasso_df", "summ_stan_df"))
