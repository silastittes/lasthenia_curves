run_x <-
structure(list(lm_df = structure(list(term = c("maxima_sc", "stretch_sc", 
"x_max_sc", "x_min_sc"), coef = c(0.0790785760959456, 0.0622338649316109, 
-0.00455356841407307, -0.0162468283628162), p_value = c(0.0417782851858214, 
0.0271736606014784, 0.181022058671313, 0.0580556094882334), rand_var = c(1.45583458532423, 
1.45583458532423, 1.45583458532423, 1.45583458532423), mean_rand = c(0.786295858074153, 
0.786295858074153, 0.786295858074153, 0.786295858074153), sim_n = c(37L, 
37L, 37L, 37L)), .Names = c("term", "coef", "p_value", "rand_var", 
"mean_rand", "sim_n"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -4L)), lasso_df = structure(list(var = c("maxima", 
"stretch", "x_max", "x_min"), mean = c(-0.0052442982016181, 0.000575372879760199, 
-0.172342700923263, -0.152351289752281), prop = c(0.0275, 0.07, 
0.01, 0.0025), rand_var = c(1.45583458532423, 1.45583458532423, 
1.45583458532423, 1.45583458532423), mean_rand = c(0.786295858074153, 
0.786295858074153, 0.786295858074153, 0.786295858074153), sim_n = c(37L, 
37L, 37L, 37L)), .Names = c("var", "mean", "prop", "rand_var", 
"mean_rand", "sim_n"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -4L)), summ_stan_df = structure(list(shape1 = 4.04742844562023, 
    shape2 = 2.50912470402129, stretch = 1.08492042357993, x_min = -0.90784226118874, 
    x_max = 4.86905012429924, maxima = 3.42236260365637, rep = 37L), .Names = c("shape1", 
"shape2", "stretch", "x_min", "x_max", "maxima", "rep"), class = c("tbl_df", 
"tbl", "data.frame"), row.names = c(NA, -1L))), .Names = c("lm_df", 
"lasso_df", "summ_stan_df"))
