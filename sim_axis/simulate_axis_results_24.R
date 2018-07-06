run_x <-
structure(list(lm_df = structure(list(term = c("maxima_sc", "stretch_sc", 
"x_max_sc", "x_min_sc"), coef = c(0.0127658230261846, 0.0517075934236073, 
7.07811240069853e-05, -0.00360395846447851), p_value = c(0.352620419114989, 
0.0189764975669652, 0.2301134272689, 0.079327157290793), rand_var = c(0.931343767889988, 
0.931343767889988, 0.931343767889988, 0.931343767889988), mean_rand = c(0.078567186469487, 
0.078567186469487, 0.078567186469487, 0.078567186469487), sim_n = c(24L, 
24L, 24L, 24L)), .Names = c("term", "coef", "p_value", "rand_var", 
"mean_rand", "sim_n"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -4L)), lasso_df = structure(list(var = c("maxima", 
"stretch", "x_max", "x_min"), mean = c(-0.0197096397835135, -0.132364667011242, 
-0.193656871664818, -0.241215700143451), prop = c(0.01, 0.03, 
0.03, 0.01), rand_var = c(0.931343767889988, 0.931343767889988, 
0.931343767889988, 0.931343767889988), mean_rand = c(0.078567186469487, 
0.078567186469487, 0.078567186469487, 0.078567186469487), sim_n = c(24L, 
24L, 24L, 24L)), .Names = c("var", "mean", "prop", "rand_var", 
"mean_rand", "sim_n"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -4L)), summ_stan_df = structure(list(shape1 = 3.49841499349128, 
    shape2 = 2.59174136646833, stretch = 1.25127248337702, x_min = -1.59934210562742, 
    x_max = 4.94835141942773, maxima = 3.11995161677563, rep = 24L), .Names = c("shape1", 
"shape2", "stretch", "x_min", "x_max", "maxima", "rep"), class = c("tbl_df", 
"tbl", "data.frame"), row.names = c(NA, -1L))), .Names = c("lm_df", 
"lasso_df", "summ_stan_df"))
