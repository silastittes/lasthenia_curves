run_x <-
structure(list(lm_df = structure(list(term = c("maxima_sc", "stretch_sc", 
"x_max_sc", "x_min_sc"), coef = c(0.00645807341607933, 0.0437129657744802, 
-0.0110809807056322, -0.0293778472424695), p_value = c(0.301842880105056, 
0.0443453701264162, 0.208458226044185, 0.0260536738380804), rand_var = c(0.487250480036243, 
0.487250480036243, 0.487250480036243, 0.487250480036243), mean_rand = c(0.00143829083966462, 
0.00143829083966462, 0.00143829083966462, 0.00143829083966462
), sim_n = c(13L, 13L, 13L, 13L)), .Names = c("term", "coef", 
"p_value", "rand_var", "mean_rand", "sim_n"), class = c("tbl_df", 
"tbl", "data.frame"), row.names = c(NA, -4L)), lasso_df = structure(list(
    var = c("maxima", "stretch", "x_max", "x_min"), mean = c(0.00125801096590526, 
    0.0197441315431971, -0.056985258696146, -0.121632330584534
    ), prop = c(0.0325, 0.0375, 0.0025, 0.005), rand_var = c(0.487250480036243, 
    0.487250480036243, 0.487250480036243, 0.487250480036243), 
    mean_rand = c(0.00143829083966462, 0.00143829083966462, 0.00143829083966462, 
    0.00143829083966462), sim_n = c(13L, 13L, 13L, 13L)), .Names = c("var", 
"mean", "prop", "rand_var", "mean_rand", "sim_n"), class = c("tbl_df", 
"tbl", "data.frame"), row.names = c(NA, -4L)), summ_stan_df = structure(list(
    shape1 = 3.15306535921407, shape2 = 3.63010213038132, stretch = 0.943083200016282, 
    x_min = -0.335339955868801, x_max = 4.62388412373711, maxima = 2.63911894100815, 
    rep = 13L), .Names = c("shape1", "shape2", "stretch", "x_min", 
"x_max", "maxima", "rep"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -1L))), .Names = c("lm_df", "lasso_df", 
"summ_stan_df"))
