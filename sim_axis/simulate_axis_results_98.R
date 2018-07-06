run_x <-
structure(list(lm_df = structure(list(term = c("maxima_sc", "stretch_sc", 
"x_max_sc", "x_min_sc"), coef = c(-0.0553194288811984, 0.040701690324729, 
0.0179033773926178, -0.0215839429391565), p_value = c(0.0822190177764223, 
0.0453581721408923, 0.192598543113007, 0.0889089339215476), rand_var = c(3.99998663917421, 
3.99998663917421, 3.99998663917421, 3.99998663917421), mean_rand = c(-0.999998747417497, 
-0.999998747417497, -0.999998747417497, -0.999998747417497), 
    sim_n = c(98L, 98L, 98L, 98L)), .Names = c("term", "coef", 
"p_value", "rand_var", "mean_rand", "sim_n"), class = c("tbl_df", 
"tbl", "data.frame"), row.names = c(NA, -4L)), lasso_df = structure(list(
    var = c("maxima", "stretch", "x_max", "x_min"), mean = c(-0.227283891750961, 
    0.140772738433673, 0.0483378264984195, -0.277665752909166
    ), prop = c(0.01, 0.16, 0.0375, 0.03), rand_var = c(3.99998663917421, 
    3.99998663917421, 3.99998663917421, 3.99998663917421), mean_rand = c(-0.999998747417497, 
    -0.999998747417497, -0.999998747417497, -0.999998747417497
    ), sim_n = c(98L, 98L, 98L, 98L)), .Names = c("var", "mean", 
"prop", "rand_var", "mean_rand", "sim_n"), class = c("tbl_df", 
"tbl", "data.frame"), row.names = c(NA, -4L)), summ_stan_df = structure(list(
    shape1 = 4.18880105000503, shape2 = 4.51758683207328, stretch = 1.46816354057431, 
    x_min = -1.04289640200548, x_max = 3.74769475438785, maxima = 2.07896508525153, 
    rep = 98L), .Names = c("shape1", "shape2", "stretch", "x_min", 
"x_max", "maxima", "rep"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -1L))), .Names = c("lm_df", "lasso_df", 
"summ_stan_df"))
