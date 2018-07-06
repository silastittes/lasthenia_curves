run_x <-
structure(list(lm_df = structure(list(term = c("maxima_sc", "stretch_sc", 
"x_max_sc", "x_min_sc"), coef = c(0.0491234483082412, 0.0469592531745035, 
0.0118223412561505, -0.0483219173342354), p_value = c(0.0874097807152222, 
0.00334443654481382, 0.0363357444899896, 0.0168762992000119), 
    rand_var = c(1.29515607390426, 1.29515607390426, 1.29515607390426, 
    1.29515607390426), mean_rand = c(0.095720818898839, 0.095720818898839, 
    0.095720818898839, 0.095720818898839), sim_n = c(33L, 33L, 
    33L, 33L)), .Names = c("term", "coef", "p_value", "rand_var", 
"mean_rand", "sim_n"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -4L)), lasso_df = structure(list(var = c("maxima", 
"stretch", "x_max", "x_min"), mean = c(0.315201579249887, 0.342861733898977, 
-0.27256014930038, -0.361514149879681), prop = c(0.1525, 0.365, 
0.0275, 0.0025), rand_var = c(1.29515607390426, 1.29515607390426, 
1.29515607390426, 1.29515607390426), mean_rand = c(0.095720818898839, 
0.095720818898839, 0.095720818898839, 0.095720818898839), sim_n = c(33L, 
33L, 33L, 33L)), .Names = c("var", "mean", "prop", "rand_var", 
"mean_rand", "sim_n"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -4L)), summ_stan_df = structure(list(shape1 = 4.28967015720676, 
    shape2 = 3.53428413217491, stretch = 2.66679910383185, x_min = -0.664275937606946, 
    x_max = 3.91953952209504, maxima = 2.58016948150425, rep = 33L), .Names = c("shape1", 
"shape2", "stretch", "x_min", "x_max", "maxima", "rep"), class = c("tbl_df", 
"tbl", "data.frame"), row.names = c(NA, -1L))), .Names = c("lm_df", 
"lasso_df", "summ_stan_df"))
