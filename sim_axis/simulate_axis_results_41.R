run_x <-
structure(list(lm_df = structure(list(term = c("maxima_sc", "stretch_sc", 
"x_max_sc", "x_min_sc"), coef = c(0.0739121858495896, 0.0718727409794394, 
-0.0110556632073103, -0.0279328560071163), p_value = c(0.0172352510244425, 
0.00474564892728512, 0.204740759487154, 0.0560562749739697), 
    rand_var = c(1.61762509156312, 1.61762509156312, 1.61762509156312, 
    1.61762509156312), mean_rand = c(0.585261563343853, 0.585261563343853, 
    0.585261563343853, 0.585261563343853), sim_n = c(41L, 41L, 
    41L, 41L)), .Names = c("term", "coef", "p_value", "rand_var", 
"mean_rand", "sim_n"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -4L)), lasso_df = structure(list(var = c("maxima", 
"stretch", "x_max", "x_min"), mean = c(0.119957902261603, 0.0434605386737967, 
-0.367012314366821, -0.153334252812584), prop = c(0.05, 0.055, 
0.01, 0.03), rand_var = c(1.61762509156312, 1.61762509156312, 
1.61762509156312, 1.61762509156312), mean_rand = c(0.585261563343853, 
0.585261563343853, 0.585261563343853, 0.585261563343853), sim_n = c(41L, 
41L, 41L, 41L)), .Names = c("var", "mean", "prop", "rand_var", 
"mean_rand", "sim_n"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -4L)), summ_stan_df = structure(list(shape1 = 3.93161705645961, 
    shape2 = 3.19343481722886, stretch = 1.06078733022183, x_min = -0.99756789369186, 
    x_max = 4.92194470950995, maxima = 3.15268078876647, rep = 41L), .Names = c("shape1", 
"shape2", "stretch", "x_min", "x_max", "maxima", "rep"), class = c("tbl_df", 
"tbl", "data.frame"), row.names = c(NA, -1L))), .Names = c("lm_df", 
"lasso_df", "summ_stan_df"))
