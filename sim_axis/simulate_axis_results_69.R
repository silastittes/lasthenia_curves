run_x <-
structure(list(lm_df = structure(list(term = c("maxima_sc", "stretch_sc", 
"x_max_sc", "x_min_sc"), coef = c(0.0796473813104256, 0.0267335382288409, 
-0.0193482898386555, -0.0388615628129888), p_value = c(0.184528362659943, 
0.0484713605726541, 0.247700512731672, 0.0295052341742792), rand_var = c(2.75115529379526, 
2.75115529379526, 2.75115529379526, 2.75115529379526), mean_rand = c(0.224579339110666, 
0.224579339110666, 0.224579339110666, 0.224579339110666), sim_n = c(69L, 
69L, 69L, 69L)), .Names = c("term", "coef", "p_value", "rand_var", 
"mean_rand", "sim_n"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -4L)), lasso_df = structure(list(var = c("maxima", 
"stretch", "x_max", "x_min"), mean = c(0.8344377764172, 0.135526642969264, 
-0.330335615965936, -0.237229546820578), prop = c(0.1325, 0.1825, 
0.0275, 0.0125), rand_var = c(2.75115529379526, 2.75115529379526, 
2.75115529379526, 2.75115529379526), mean_rand = c(0.224579339110666, 
0.224579339110666, 0.224579339110666, 0.224579339110666), sim_n = c(69L, 
69L, 69L, 69L)), .Names = c("var", "mean", "prop", "rand_var", 
"mean_rand", "sim_n"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -4L)), summ_stan_df = structure(list(shape1 = 4.32364952886681, 
    shape2 = 3.56622189889517, stretch = 3.2388706854333, x_min = -1.00154250322784, 
    x_max = 4.26674575540484, maxima = 2.75317168280213, rep = 69L), .Names = c("shape1", 
"shape2", "stretch", "x_min", "x_max", "maxima", "rep"), class = c("tbl_df", 
"tbl", "data.frame"), row.names = c(NA, -1L))), .Names = c("lm_df", 
"lasso_df", "summ_stan_df"))
