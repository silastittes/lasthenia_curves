run_x <-
structure(list(lm_df = structure(list(term = c("maxima_sc", "stretch_sc", 
"x_max_sc", "x_min_sc"), coef = c(0.136511072411504, 0.0436608738286414, 
0.0472064029860727, -0.0228208106906749), p_value = c(0.0219427081575217, 
0.00564131658183657, 0.0963969934136946, 0.155235222310179), 
    rand_var = c(2.46450069220663, 2.46450069220663, 2.46450069220663, 
    2.46450069220663), mean_rand = c(0.285674650515662, 0.285674650515662, 
    0.285674650515662, 0.285674650515662), sim_n = c(62L, 62L, 
    62L, 62L)), .Names = c("term", "coef", "p_value", "rand_var", 
"mean_rand", "sim_n"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -4L)), lasso_df = structure(list(var = c("maxima", 
"stretch", "x_max", "x_min"), mean = c(1.09189647639919, 0.375809808608621, 
0.119390343459884, -0.103975769826299), prop = c(0.1775, 0.2, 
0.06, 0.035), rand_var = c(2.46450069220663, 2.46450069220663, 
2.46450069220663, 2.46450069220663), mean_rand = c(0.285674650515662, 
0.285674650515662, 0.285674650515662, 0.285674650515662), sim_n = c(62L, 
62L, 62L, 62L)), .Names = c("var", "mean", "prop", "rand_var", 
"mean_rand", "sim_n"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -4L)), summ_stan_df = structure(list(shape1 = 3.28067345612607, 
    shape2 = 4.80054567994603, stretch = 1.71208445993983, x_min = -0.481979734469401, 
    x_max = 5.02859979628651, maxima = 2.47774308036591, rep = 62L), .Names = c("shape1", 
"shape2", "stretch", "x_min", "x_max", "maxima", "rep"), class = c("tbl_df", 
"tbl", "data.frame"), row.names = c(NA, -1L))), .Names = c("lm_df", 
"lasso_df", "summ_stan_df"))
