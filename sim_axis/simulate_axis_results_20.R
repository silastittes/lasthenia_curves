run_x <-
structure(list(lm_df = structure(list(term = c("maxima_sc", "stretch_sc", 
"x_max_sc", "x_min_sc"), coef = c(0.0351233581842492, 0.0644837806591465, 
-0.023900816639722, -0.0201410634923268), p_value = c(0.0275101802616527, 
0.00386802785440238, 0.0965949854301901, 0.138343302586917), 
    rand_var = c(0.770239719714556, 0.770239719714556, 0.770239719714556, 
    0.770239719714556), mean_rand = c(-0.248753817084539, -0.248753817084539, 
    -0.248753817084539, -0.248753817084539), sim_n = c(20L, 20L, 
    20L, 20L)), .Names = c("term", "coef", "p_value", "rand_var", 
"mean_rand", "sim_n"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -4L)), lasso_df = structure(list(var = c("maxima", 
"stretch", "x_max", "x_min"), mean = c(0.279288262141375, 0.177313166546444, 
-0.175774412513057, -0.266868171428083), prop = c(0.13, 0.1475, 
0.0175, 0.0025), rand_var = c(0.770239719714556, 0.770239719714556, 
0.770239719714556, 0.770239719714556), mean_rand = c(-0.248753817084539, 
-0.248753817084539, -0.248753817084539, -0.248753817084539), 
    sim_n = c(20L, 20L, 20L, 20L)), .Names = c("var", "mean", 
"prop", "rand_var", "mean_rand", "sim_n"), class = c("tbl_df", 
"tbl", "data.frame"), row.names = c(NA, -4L)), summ_stan_df = structure(list(
    shape1 = 3.49775317953741, shape2 = 3.81739292327938, stretch = 0.832286216906053, 
    x_min = -0.290789436960442, x_max = 4.05484972782516, maxima = 2.36809834534384, 
    rep = 20L), .Names = c("shape1", "shape2", "stretch", "x_min", 
"x_max", "maxima", "rep"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -1L))), .Names = c("lm_df", "lasso_df", 
"summ_stan_df"))
