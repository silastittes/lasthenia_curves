run_x <-
structure(list(lm_df = structure(list(term = c("maxima_sc", "stretch_sc", 
"x_max_sc", "x_min_sc"), coef = c(0.00500661186938653, 0.0641084505355289, 
-0.00986066942640054, -0.0146999317774208), p_value = c(0.286778496033728, 
0.00133319386279296, 0.273295156439503, 0.224219096298995), rand_var = c(2.95498638962047, 
2.95498638962047, 2.95498638962047, 2.95498638962047), mean_rand = c(-1.08109466927305, 
-1.08109466927305, -1.08109466927305, -1.08109466927305), sim_n = c(74L, 
74L, 74L, 74L)), .Names = c("term", "coef", "p_value", "rand_var", 
"mean_rand", "sim_n"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -4L)), lasso_df = structure(list(var = c("maxima", 
"stretch", "x_max", "x_min"), mean = c(0.212052624357527, 0.42697875866915, 
-0.328221134755058, -0.0942849907632543), prop = c(0.0975, 0.465, 
0.0075, 0.1225), rand_var = c(2.95498638962047, 2.95498638962047, 
2.95498638962047, 2.95498638962047), mean_rand = c(-1.08109466927305, 
-1.08109466927305, -1.08109466927305, -1.08109466927305), sim_n = c(74L, 
74L, 74L, 74L)), .Names = c("var", "mean", "prop", "rand_var", 
"mean_rand", "sim_n"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -4L)), summ_stan_df = structure(list(shape1 = 3.15028378148115, 
    shape2 = 5.01262020924405, stretch = 0.930202809203054, x_min = 0.301772844893482, 
    x_max = 2.00253378305257, maxima = 1.21611560851878, rep = 74L), .Names = c("shape1", 
"shape2", "stretch", "x_min", "x_max", "maxima", "rep"), class = c("tbl_df", 
"tbl", "data.frame"), row.names = c(NA, -1L))), .Names = c("lm_df", 
"lasso_df", "summ_stan_df"))
