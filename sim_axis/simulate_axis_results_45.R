run_x <-
structure(list(lm_df = structure(list(term = c("maxima_sc", "stretch_sc", 
"x_max_sc", "x_min_sc"), coef = c(0.105417798731783, 0.0576159534500942, 
0.0134412253565483, -0.0065910034764574), p_value = c(0.0402267081442212, 
0.00101346018603596, 0.115219822869269, 0.229477241343129), rand_var = c(1.77881374201833, 
1.77881374201833, 1.77881374201833, 1.77881374201833), mean_rand = c(0.199866051553082, 
0.199866051553082, 0.199866051553082, 0.199866051553082), sim_n = c(45L, 
45L, 45L, 45L)), .Names = c("term", "coef", "p_value", "rand_var", 
"mean_rand", "sim_n"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -4L)), lasso_df = structure(list(var = c("maxima", 
"stretch", "x_max", "x_min"), mean = c(1.02568816659608, 0.572584440710206, 
-0.227268655209312, 0.106705413621741), prop = c(0.16, 0.4525, 
0.0425, 0.0525), rand_var = c(1.77881374201833, 1.77881374201833, 
1.77881374201833, 1.77881374201833), mean_rand = c(0.199866051553082, 
0.199866051553082, 0.199866051553082, 0.199866051553082), sim_n = c(45L, 
45L, 45L, 45L)), .Names = c("var", "mean", "prop", "rand_var", 
"mean_rand", "sim_n"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -4L)), summ_stan_df = structure(list(shape1 = 2.88796536381848, 
    shape2 = 3.22639902245869, stretch = 2.4273724970414, x_min = -0.0874428657161869, 
    x_max = 4.70672180421053, maxima = 2.81811761735784, rep = 45L), .Names = c("shape1", 
"shape2", "stretch", "x_min", "x_max", "maxima", "rep"), class = c("tbl_df", 
"tbl", "data.frame"), row.names = c(NA, -1L))), .Names = c("lm_df", 
"lasso_df", "summ_stan_df"))
