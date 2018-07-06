run_x <-
structure(list(lm_df = structure(list(term = c("maxima_sc", "stretch_sc", 
"x_max_sc", "x_min_sc"), coef = c(-0.0380708581417775, 0.0350392529519869, 
-4.62283517916281e-05, -0.00224967822756433), p_value = c(0.0964672650587621, 
0.0364369083699956, 0.157966201415136, 0.140162705361815), rand_var = c(3.76849697457035, 
3.76849697457035, 3.76849697457035, 3.76849697457035), mean_rand = c(-1.17542876567859, 
-1.17542876567859, -1.17542876567859, -1.17542876567859), sim_n = c(95L, 
95L, 95L, 95L)), .Names = c("term", "coef", "p_value", "rand_var", 
"mean_rand", "sim_n"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -4L)), lasso_df = structure(list(var = c("maxima", 
"stretch", "x_max", "x_min"), mean = c(-0.480456033325632, 0.217940607546447, 
-0.0570937274360918, 0.173952054510652), prop = c(0.0025, 0.195, 
0.045, 0.095), rand_var = c(3.76849697457035, 3.76849697457035, 
3.76849697457035, 3.76849697457035), mean_rand = c(-1.17542876567859, 
-1.17542876567859, -1.17542876567859, -1.17542876567859), sim_n = c(95L, 
95L, 95L, 95L)), .Names = c("var", "mean", "prop", "rand_var", 
"mean_rand", "sim_n"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -4L)), summ_stan_df = structure(list(shape1 = 3.89158077166458, 
    shape2 = 4.54562985121755, stretch = 1.12606611117083, x_min = -1.01185946173383, 
    x_max = 3.23302021674959, maxima = 1.63066450761757, rep = 95L), .Names = c("shape1", 
"shape2", "stretch", "x_min", "x_max", "maxima", "rep"), class = c("tbl_df", 
"tbl", "data.frame"), row.names = c(NA, -1L))), .Names = c("lm_df", 
"lasso_df", "summ_stan_df"))
