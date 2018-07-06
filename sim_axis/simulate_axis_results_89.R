run_x <-
structure(list(lm_df = structure(list(term = c("maxima_sc", "stretch_sc", 
"x_max_sc", "x_min_sc"), coef = c(0.246117160525116, 0.0273982823422487, 
-0.250766235685545, -0.0327954869481967), p_value = c(0.00967895543186285, 
0.00969447429190498, 0.0092628576345761, 0.0466416497195274), 
    rand_var = c(3.58093554320058, 3.58093554320058, 3.58093554320058, 
    3.58093554320058), mean_rand = c(1.1235713702181, 1.1235713702181, 
    1.1235713702181, 1.1235713702181), sim_n = c(89L, 89L, 89L, 
    89L)), .Names = c("term", "coef", "p_value", "rand_var", 
"mean_rand", "sim_n"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -4L)), lasso_df = structure(list(var = c("maxima", 
"stretch", "x_max", "x_min"), mean = c(1.20819024178629, 0.115360257205715, 
-1.34514589961875, -0.131123156490042), prop = c(0.0325, 0.1475, 
0, 0.04), rand_var = c(3.58093554320058, 3.58093554320058, 3.58093554320058, 
3.58093554320058), mean_rand = c(1.1235713702181, 1.1235713702181, 
1.1235713702181, 1.1235713702181), sim_n = c(89L, 89L, 89L, 89L
)), .Names = c("var", "mean", "prop", "rand_var", "mean_rand", 
"sim_n"), class = c("tbl_df", "tbl", "data.frame"), row.names = c(NA, 
-4L)), summ_stan_df = structure(list(shape1 = 4.86888631623703, 
    shape2 = 2.88874042091516, stretch = 2.87321953406037, x_min = -0.957249553158007, 
    x_max = 3.62379563239058, maxima = 2.68653841086223, rep = 89L), .Names = c("shape1", 
"shape2", "stretch", "x_min", "x_max", "maxima", "rep"), class = c("tbl_df", 
"tbl", "data.frame"), row.names = c(NA, -1L))), .Names = c("lm_df", 
"lasso_df", "summ_stan_df"))
