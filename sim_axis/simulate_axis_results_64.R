run_x <-
structure(list(lm_df = structure(list(term = c("maxima_sc", "stretch_sc", 
"x_max_sc", "x_min_sc"), coef = c(0.0155819066213247, 0.049081937734732, 
-0.0387176750858394, -0.0504347299608145), p_value = c(0.177063435061778, 
0.00222703468836917, 0.152058659962918, 0.0897374555967727), 
    rand_var = c(2.54579868036772, 2.54579868036772, 2.54579868036772, 
    2.54579868036772), mean_rand = c(-0.90675175696678, -0.90675175696678, 
    -0.90675175696678, -0.90675175696678), sim_n = c(64L, 64L, 
    64L, 64L)), .Names = c("term", "coef", "p_value", "rand_var", 
"mean_rand", "sim_n"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -4L)), lasso_df = structure(list(var = c("maxima", 
"stretch", "x_max", "x_min"), mean = c(0.250192050563171, 0.159943007506233, 
-0.180234845054458, -0.160377290897496), prop = c(0.1225, 0.1425, 
0.0425, 0.0075), rand_var = c(2.54579868036772, 2.54579868036772, 
2.54579868036772, 2.54579868036772), mean_rand = c(-0.90675175696678, 
-0.90675175696678, -0.90675175696678, -0.90675175696678), sim_n = c(64L, 
64L, 64L, 64L)), .Names = c("var", "mean", "prop", "rand_var", 
"mean_rand", "sim_n"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -4L)), summ_stan_df = structure(list(shape1 = 3.99930650513392, 
    shape2 = 4.09014124586103, stretch = 0.975656216696364, x_min = 0.0103944067035317, 
    x_max = 2.49667009871972, maxima = 1.60583230437406, rep = 64L), .Names = c("shape1", 
"shape2", "stretch", "x_min", "x_max", "maxima", "rep"), class = c("tbl_df", 
"tbl", "data.frame"), row.names = c(NA, -1L))), .Names = c("lm_df", 
"lasso_df", "summ_stan_df"))
