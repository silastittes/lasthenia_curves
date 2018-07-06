run_x <-
structure(list(lm_df = structure(list(term = c("maxima_sc", "stretch_sc", 
"x_max_sc", "x_min_sc"), coef = c(0.0223890940071047, 0.062210371865745, 
-0.0317964402332633, -0.0170316342579573), p_value = c(0.16450396799724, 
0.00163823965461963, 0.193285118522987, 0.262193786492498), rand_var = c(2.83162043860327, 
2.83162043860327, 2.83162043860327, 2.83162043860327), mean_rand = c(-1.03223916815296, 
-1.03223916815296, -1.03223916815296, -1.03223916815296), sim_n = c(71L, 
71L, 71L, 71L)), .Names = c("term", "coef", "p_value", "rand_var", 
"mean_rand", "sim_n"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -4L)), lasso_df = structure(list(var = c("maxima", 
"stretch", "x_max", "x_min"), mean = c(0.0994839963870794, 0.654361968733854, 
-0.185947383408032, 0.132904159372715), prop = c(0.0925, 0.52, 
0.0125, 0.145), rand_var = c(2.83162043860327, 2.83162043860327, 
2.83162043860327, 2.83162043860327), mean_rand = c(-1.03223916815296, 
-1.03223916815296, -1.03223916815296, -1.03223916815296), sim_n = c(71L, 
71L, 71L, 71L)), .Names = c("var", "mean", "prop", "rand_var", 
"mean_rand", "sim_n"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -4L)), summ_stan_df = structure(list(shape1 = 3.26394135073198, 
    shape2 = 5.04869946624134, stretch = 0.81707340456441, x_min = 0.403979827514081, 
    x_max = 2.0348031149887, maxima = 1.30308660222154, rep = 71L), .Names = c("shape1", 
"shape2", "stretch", "x_min", "x_max", "maxima", "rep"), class = c("tbl_df", 
"tbl", "data.frame"), row.names = c(NA, -1L))), .Names = c("lm_df", 
"lasso_df", "summ_stan_df"))
