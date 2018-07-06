run_x <-
structure(list(lm_df = structure(list(term = c("maxima_sc", "stretch_sc", 
"x_max_sc", "x_min_sc"), coef = c(0.034693490133426, 0.057345400928966, 
-0.0149244945986253, -0.0293557892294848), p_value = c(0.0303765186192226, 
0.00376041160965769, 0.100759249183293, 0.0542687836960507), 
    rand_var = c(0.729410705048873, 0.729410705048873, 0.729410705048873, 
    0.729410705048873), mean_rand = c(-0.244088364662764, -0.244088364662764, 
    -0.244088364662764, -0.244088364662764), sim_n = c(19L, 19L, 
    19L, 19L)), .Names = c("term", "coef", "p_value", "rand_var", 
"mean_rand", "sim_n"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -4L)), lasso_df = structure(list(var = c("maxima", 
"stretch", "x_max", "x_min"), mean = c(0.225252380263272, 0.122370118963015, 
-0.00443006016777057, -0.204738362430189), prop = c(0.14, 0.085, 
0.0675, 0.0075), rand_var = c(0.729410705048873, 0.729410705048873, 
0.729410705048873, 0.729410705048873), mean_rand = c(-0.244088364662764, 
-0.244088364662764, -0.244088364662764, -0.244088364662764), 
    sim_n = c(19L, 19L, 19L, 19L)), .Names = c("var", "mean", 
"prop", "rand_var", "mean_rand", "sim_n"), class = c("tbl_df", 
"tbl", "data.frame"), row.names = c(NA, -4L)), summ_stan_df = structure(list(
    shape1 = 3.42293932624954, shape2 = 3.84484237020213, stretch = 0.875102988889356, 
    x_min = -0.290537354565167, x_max = 4.21840337735747, maxima = 2.42722456260872, 
    rep = 19L), .Names = c("shape1", "shape2", "stretch", "x_min", 
"x_max", "maxima", "rep"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -1L))), .Names = c("lm_df", "lasso_df", 
"summ_stan_df"))
