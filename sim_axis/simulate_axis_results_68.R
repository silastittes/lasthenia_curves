run_x <-
structure(list(lm_df = structure(list(term = c("maxima_sc", "stretch_sc", 
"x_max_sc", "x_min_sc"), coef = c(-0.0225513187211804, 0.0319947782336332, 
0.0446431694938899, -0.0376413825922159), p_value = c(0.0989800590742133, 
0.00101302429840924, 0.263542784315849, 0.0088089519777298), 
    rand_var = c(2.7092890668248, 2.7092890668248, 2.7092890668248, 
    2.7092890668248), mean_rand = c(0.367257480702501, 0.367257480702501, 
    0.367257480702501, 0.367257480702501), sim_n = c(68L, 68L, 
    68L, 68L)), .Names = c("term", "coef", "p_value", "rand_var", 
"mean_rand", "sim_n"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -4L)), lasso_df = structure(list(var = c("maxima", 
"stretch", "x_max", "x_min"), mean = c(0.41362025236724, 0.262665222441946, 
-0.00436441865295996, -0.19157686774144), prop = c(0.1925, 0.255, 
0.065, 0.0075), rand_var = c(2.7092890668248, 2.7092890668248, 
2.7092890668248, 2.7092890668248), mean_rand = c(0.367257480702501, 
0.367257480702501, 0.367257480702501, 0.367257480702501), sim_n = c(68L, 
68L, 68L, 68L)), .Names = c("var", "mean", "prop", "rand_var", 
"mean_rand", "sim_n"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -4L)), summ_stan_df = structure(list(shape1 = 3.52539066531049, 
    shape2 = 3.4629229379602, stretch = 2.69564560736706, x_min = -0.436967404960844, 
    x_max = 4.44197095048867, maxima = 2.76068672374057, rep = 68L), .Names = c("shape1", 
"shape2", "stretch", "x_min", "x_max", "maxima", "rep"), class = c("tbl_df", 
"tbl", "data.frame"), row.names = c(NA, -1L))), .Names = c("lm_df", 
"lasso_df", "summ_stan_df"))
