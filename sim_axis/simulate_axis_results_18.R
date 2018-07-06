run_x <-
structure(list(lm_df = structure(list(term = c("maxima_sc", "stretch_sc", 
"x_max_sc", "x_min_sc"), coef = c(0.0270567444034479, 0.0621797288011085, 
0.0145093213854626, -0.00273264405691108), p_value = c(0.115336392077464, 
0.00217047960990463, 0.2088990632085, 0.337243416078824), rand_var = c(0.689245125722994, 
0.689245125722994, 0.689245125722994, 0.689245125722994), mean_rand = c(-0.346968199533407, 
-0.346968199533407, -0.346968199533407, -0.346968199533407), 
    sim_n = c(18L, 18L, 18L, 18L)), .Names = c("term", "coef", 
"p_value", "rand_var", "mean_rand", "sim_n"), class = c("tbl_df", 
"tbl", "data.frame"), row.names = c(NA, -4L)), lasso_df = structure(list(
    var = c("maxima", "stretch", "x_max", "x_min"), mean = c(0.140082479695132, 
    0.601480243780681, -0.0422232232004049, 0.0144420453817493
    ), prop = c(0.105, 0.5775, 0.01, 0.06), rand_var = c(0.689245125722994, 
    0.689245125722994, 0.689245125722994, 0.689245125722994), 
    mean_rand = c(-0.346968199533407, -0.346968199533407, -0.346968199533407, 
    -0.346968199533407), sim_n = c(18L, 18L, 18L, 18L)), .Names = c("var", 
"mean", "prop", "rand_var", "mean_rand", "sim_n"), class = c("tbl_df", 
"tbl", "data.frame"), row.names = c(NA, -4L)), summ_stan_df = structure(list(
    shape1 = 2.75644869071813, shape2 = 5.67480982543141, stretch = 1.39083320702559, 
    x_min = 0.179665505630752, x_max = 4.44921381099197, maxima = 2.14281946433971, 
    rep = 18L), .Names = c("shape1", "shape2", "stretch", "x_min", 
"x_max", "maxima", "rep"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -1L))), .Names = c("lm_df", "lasso_df", 
"summ_stan_df"))
