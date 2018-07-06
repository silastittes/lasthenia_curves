run_x <-
structure(list(lm_df = structure(list(term = c("maxima_sc", "stretch_sc", 
"x_max_sc", "x_min_sc"), coef = c(0.13291528032998, 0.0504799739907493, 
0.0111574763686403, -0.0100573808641499), p_value = c(0.0271628441335014, 
0.00253379085001984, 0.106464919281809, 0.0786802154756761), 
    rand_var = c(1.49630804198773, 1.49630804198773, 1.49630804198773, 
    1.49630804198773), mean_rand = c(0.277757197102944, 0.277757197102944, 
    0.277757197102944, 0.277757197102944), sim_n = c(38L, 38L, 
    38L, 38L)), .Names = c("term", "coef", "p_value", "rand_var", 
"mean_rand", "sim_n"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -4L)), lasso_df = structure(list(var = c("maxima", 
"stretch", "x_max", "x_min"), mean = c(0.524275827490943, 0.237157932030861, 
-0.180401172010161, 0.0112210573744919), prop = c(0.1175, 0.3, 
0.01, 0.03), rand_var = c(1.49630804198773, 1.49630804198773, 
1.49630804198773, 1.49630804198773), mean_rand = c(0.277757197102944, 
0.277757197102944, 0.277757197102944, 0.277757197102944), sim_n = c(38L, 
38L, 38L, 38L)), .Names = c("var", "mean", "prop", "rand_var", 
"mean_rand", "sim_n"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -4L)), summ_stan_df = structure(list(shape1 = 3.28485129879245, 
    shape2 = 3.06341202217194, stretch = 1.95549638424184, x_min = -0.380915720902019, 
    x_max = 4.72619147380589, maxima = 3.02774937919657, rep = 38L), .Names = c("shape1", 
"shape2", "stretch", "x_min", "x_max", "maxima", "rep"), class = c("tbl_df", 
"tbl", "data.frame"), row.names = c(NA, -1L))), .Names = c("lm_df", 
"lasso_df", "summ_stan_df"))
