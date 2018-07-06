run_x <-
structure(list(lm_df = structure(list(term = c("maxima_sc", "stretch_sc", 
"x_max_sc", "x_min_sc"), coef = c(0.0589084504779732, 0.0412384585949654, 
0.00867094593534354, -0.0610364664420446), p_value = c(0.0780500577000917, 
0.0233258618838086, 0.16215759244242, 0.0103570170172447), rand_var = c(1.37535101858556, 
1.37535101858556, 1.37535101858556, 1.37535101858556), mean_rand = c(-0.569963627675784, 
-0.569963627675784, -0.569963627675784, -0.569963627675784), 
    sim_n = c(35L, 35L, 35L, 35L)), .Names = c("term", "coef", 
"p_value", "rand_var", "mean_rand", "sim_n"), class = c("tbl_df", 
"tbl", "data.frame"), row.names = c(NA, -4L)), lasso_df = structure(list(
    var = c("maxima", "stretch", "x_max", "x_min"), mean = c(1.50145394120722, 
    0.335974192435978, 0.221050274545182, -0.302304469425937), 
    prop = c(0.355, 0.295, 0.1125, 0.025), rand_var = c(1.37535101858556, 
    1.37535101858556, 1.37535101858556, 1.37535101858556), mean_rand = c(-0.569963627675784, 
    -0.569963627675784, -0.569963627675784, -0.569963627675784
    ), sim_n = c(35L, 35L, 35L, 35L)), .Names = c("var", "mean", 
"prop", "rand_var", "mean_rand", "sim_n"), class = c("tbl_df", 
"tbl", "data.frame"), row.names = c(NA, -4L)), summ_stan_df = structure(list(
    shape1 = 4.19685792113059, shape2 = 3.65871902239738, stretch = 2.71936455564346, 
    x_min = -0.0716855896927432, x_max = 2.6707098664402, maxima = 1.81780410834032, 
    rep = 35L), .Names = c("shape1", "shape2", "stretch", "x_min", 
"x_max", "maxima", "rep"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -1L))), .Names = c("lm_df", "lasso_df", 
"summ_stan_df"))
